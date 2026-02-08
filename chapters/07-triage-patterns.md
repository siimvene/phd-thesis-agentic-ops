# Chapter 7: Agent-Enhanced Incident Triage

*Working draft — S. Vene, 2026-02-08*

---

## 7.1 Introduction

Incident response consumes disproportionate platform engineering resources. Root cause analysis (RCA) alone takes 40-60% of incident time, while alert fatigue degrades response effectiveness. The DORA 2024 report found over 39% of respondents have little or no trust in AI tools, yet reducing MTTR remains critical for organizational performance.

This chapter examines how AI agents can augment human responders in the triage and diagnosis phases of incident management — the phases where observability data (Chapter 6) must be transformed into actionable understanding and response.

---

## 7.2 The Triage Challenge

### 7.2.1 Current State Pain Points

| Challenge | Impact |
|-----------|--------|
| Information overload | Responders must correlate logs, metrics, traces, change history |
| Expertise bottleneck | Senior engineers required for diagnosis, 24/7 coverage challenges |
| Documentation lag | Runbooks incomplete or outdated |
| Coordination overhead | Multi-team incidents require extensive communication |
| Learning loss | Incident knowledge doesn't transfer to prevention |

### 7.2.2 What Agents Can Address

Agents excel at:
- **Speed:** Parallel analysis of multiple data sources
- **Memory:** Recall of similar past incidents and their resolutions
- **Correlation:** Connecting signals across systems and time
- **Consistency:** Same triage quality at 3am as at 3pm

Agents struggle with:
- **Novel failures:** Patterns outside training distribution
- **Business context:** Understanding which services matter most right now
- **Human coordination:** Navigating organizational politics during major incidents
- **Judgment calls:** When to escalate, who to page, what to communicate

---

## 7.3 Pattern: Automated Initial Triage

### Problem

When an alert fires, someone must assess severity, identify the affected system, and route to the appropriate team. This initial triage is repetitive but requires context that's scattered across tools.

### Solution

An agent that performs initial triage on incoming alerts: classification, severity assessment, context gathering, and routing recommendation.

### Implementation

**Input processing:**
- Alert metadata (source, severity, labels)
- Service ownership data
- Recent changes (deployments, config updates)
- Historical alerts for same service/metric

**Triage output:**

```yaml
alert: "api-gateway-high-error-rate"
received: "2026-02-08T14:32:00Z"

triage_assessment:
  severity: P2  # Elevated from P3 based on impact analysis
  severity_reasoning: |
    Error rate affects customer-facing checkout flow.
    Currently 12% of requests failing (threshold: 5%).
    Business hours, peak traffic period.
    
  affected_services:
    - api-gateway (primary)
    - checkout-service (downstream impact)
    
  owner_team: payments-platform
  on_call: "@jane.smith"
  
  context_gathered:
    recent_deployments:
      - "auth-service v2.3.2 deployed 2 min ago"
    recent_changes:
      - "none in affected services"
    similar_alerts_24h: 0
    
  routing_recommendation: |
    Page payments-platform on-call.
    Include auth-service team given recent deployment.
    
  confidence: 0.85
```

### Autonomy Level

L3 (Monitored): Agent triages and routes. Human reviews escalation decisions.

### Risks

- Misclassification leading to wrong team engagement
- Severity underestimation missing critical issues
- Over-alerting if agent is too conservative

---

## 7.4 Pattern: Root Cause Hypothesis Generation

### Problem

Root cause analysis requires correlating signals across systems, recalling similar past incidents, and forming hypotheses. This is cognitively demanding, especially at 3am.

### Solution

An agent that analyzes incident signals and produces ranked hypotheses with supporting evidence.

### Implementation

**Hypothesis generation process:**

```
1. SIGNAL COLLECTION
   - Query metrics for anomalies in time window
   - Search logs for errors/warnings
   - Check deployment/change timeline
   - Query trace data for latency breakdowns

2. PATTERN MATCHING
   - Compare current signals to past incidents
   - Identify common failure patterns
   - Check for known issues in similar systems

3. HYPOTHESIS FORMATION
   - Generate candidate root causes
   - Assign confidence based on evidence strength
   - Rank by likelihood and impact

4. EVIDENCE PACKAGING
   - Link to specific logs, metrics, traces
   - Show reasoning chain
   - Highlight uncertainties
```

**Example output:**

```
INCIDENT: checkout-service timeout errors

HYPOTHESIS 1 (Confidence: 85%)
Root Cause: Auth-service deployment introduced N+1 query pattern

Evidence:
- auth-service deployment at 14:30 UTC (2 min before incident)
- auth-service /validate endpoint latency: 400ms → 2.5s
- auth-db-primary connection pool: 50/50 exhausted
- Checkout-service depends on auth-service for validation
- Similar pattern in INC-2391 (resolved by rollback)

Suggested action: Rollback auth-service to v2.3.1

---

HYPOTHESIS 2 (Confidence: 35%)
Root Cause: Traffic spike exceeding capacity

Evidence:
- Request rate 20% above daily average
- But: capacity headroom should handle 50% spike
- Partially explains symptoms, doesn't explain database exhaustion

Suggested action: Scale checkout-service replicas (may help, not root fix)

---

HYPOTHESIS 3 (Confidence: 15%)
Root Cause: Upstream provider degradation

Evidence:
- payment-provider API latency elevated
- But: this affects different code path than observed errors

Suggested action: Monitor, likely not primary cause
```

### Autonomy Level

L2 (Assisted): Agent proposes hypotheses. Human investigates and decides.

---

## 7.5 Pattern: Similar Incident Retrieval

### Problem

Institutional knowledge about past incidents exists in post-mortems, chat logs, and engineer memories. During an incident, this knowledge is hard to access quickly.

### Solution

An agent that maintains a searchable index of past incidents and retrieves relevant cases during active incidents.

### Implementation

**Incident knowledge base:**
- Post-mortem documents
- Incident ticket history
- Chat transcripts from incident channels
- Runbook execution logs
- Resolution actions taken

**Retrieval triggers:**
- New incident opened → search for similar
- Manual query ("have we seen this before?")
- Hypothesis validation ("was this root cause seen before?")

**Similarity matching:**
- Service/component affected
- Error signatures (log patterns, error codes)
- Symptom profiles (latency, error rate, saturation)
- Temporal patterns (time of day, deployment correlation)

**Output:**

```
SIMILAR INCIDENTS for checkout-service timeout

1. INC-2391 (1 month ago) - 92% match
   Summary: Payment-service connection pool exhaustion
   Root cause: Missing connection timeout, leaked connections
   Resolution: Code fix + pool size increase
   Relevance: Same symptom pattern, similar database involvement
   
2. INC-2847 (2 weeks ago) - 71% match
   Summary: Auth-service high latency
   Root cause: Inefficient query in new feature
   Resolution: Query optimization
   Relevance: Same upstream service, different symptom
   
3. INC-2156 (3 months ago) - 65% match
   Summary: Checkout cascade failure
   Root cause: Kubernetes node failure
   Resolution: Pod rescheduling, node replacement
   Relevance: Same service, different root cause class
```

### Autonomy Level

L2 (Assisted): Agent retrieves and summarizes. Human evaluates relevance.

---

## 7.6 Human-Agent Collaboration in Diagnosis

### 7.6.1 The Collaboration Model

Effective incident triage combines agent strengths (speed, memory, correlation) with human strengths (judgment, context, novel reasoning):

```
┌─────────────────────────────────────────────────────────┐
│                  Incident Occurs                         │
│                        │                                 │
│                        ▼                                 │
│  ┌──────────────────────────────────────────────────┐   │
│  │ AGENT: Initial Triage                            │   │
│  │ • Classify, route, gather context                │   │
│  │ • Generate hypotheses                            │   │
│  │ • Retrieve similar incidents                     │   │
│  └──────────────────────────────────────────────────┘   │
│                        │                                 │
│                        ▼                                 │
│  ┌──────────────────────────────────────────────────┐   │
│  │ HUMAN: Hypothesis Evaluation                     │   │
│  │ • Assess agent hypotheses                        │   │
│  │ • Add business context                           │   │
│  │ • Direct additional investigation                │   │
│  └──────────────────────────────────────────────────┘   │
│                        │                                 │
│                        ▼                                 │
│  ┌──────────────────────────────────────────────────┐   │
│  │ AGENT: Deep Dive Support                         │   │
│  │ • Run specific queries on request                │   │
│  │ • Gather additional evidence                     │   │
│  │ • Draft communications                           │   │
│  └──────────────────────────────────────────────────┘   │
│                        │                                 │
│                        ▼                                 │
│  ┌──────────────────────────────────────────────────┐   │
│  │ HUMAN: Decision and Action                       │   │
│  │ • Confirm root cause                             │   │
│  │ • Approve remediation                            │   │
│  │ • Coordinate response                            │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

### 7.6.2 Communication Patterns

**Agent to Human:**
- Present findings as hypotheses, not facts
- Include confidence levels and evidence links
- Highlight uncertainties and gaps
- Suggest next steps without demanding action

**Human to Agent:**
- Direct specific investigations ("check auth-service logs for X")
- Provide context agent lacks ("we're in a deploy freeze")
- Override agent assessments when appropriate
- Confirm or reject hypotheses

### 7.6.3 Trust Building

From Chapter 4's framework: triage agents should start at L2 (Assisted) and earn higher autonomy through demonstrated accuracy:

| Metric | Threshold for L3 |
|--------|------------------|
| Hypothesis accuracy | >80% correct in top 3 |
| Routing accuracy | >95% correct team |
| False positive rate | <10% |
| Time operating without major error | >30 days |

---

## 7.7 Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Wrong diagnosis with high confidence | Present as hypothesis, require evidence review |
| Over-reliance — team skills atrophy | Periodic agent-free exercises, training |
| Coordination confusion | Clear role definitions, explicit handoffs |
| Sensitive data in communications | Redaction rules, output filtering |
| Alert storm amplification | Rate limiting, correlation before routing |

---

## 7.8 Summary

Agent-enhanced triage transforms incident response from a purely human cognitive task to a human-agent collaboration:

| Pattern | Problem Solved | Autonomy Level |
|---------|---------------|----------------|
| Automated Initial Triage | Repetitive classification and routing | L3 |
| Root Cause Hypothesis | Correlation and pattern matching | L2 |
| Similar Incident Retrieval | Institutional knowledge access | L2 |

The next chapter examines the more sensitive question: when and how can agents participate in remediation?

---

*This chapter addresses RQ2: To what extent can agentic reasoning improve incident triage and root cause analysis compared to existing SRE practices?*
