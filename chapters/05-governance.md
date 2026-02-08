# Chapter 5: Governance at Enterprise Scale

*Working draft — S. Vene, 2026-02-08*

---

## 5.1 Introduction

The trust framework from Chapter 4 addresses individual agent deployments. Enterprise scale introduces additional challenges: multiple teams, regulatory requirements, cost governance, and infrastructure trust. This chapter addresses governance mechanisms required when agent deployment moves beyond single-team pilots.

## 5.2 The Zero Trust Principle for Agents

### 5.2.1 Never Trust, Always Verify

The ATF applies Zero Trust principles (NIST 800-207) to AI agents:

> "No AI agent should be trusted by default, regardless of purpose or claimed capability. Trust must be earned through demonstrated behavior and continuously verified through monitoring."

Traditional Zero Trust assumes human users with predictable behavior. AI agents break this assumption:

| Traditional Assumption | AI Agent Reality |
|----------------------|------------------|
| Human users with predictable behavior | Autonomous decision-making, non-deterministic |
| Deterministic system rules | Probabilistic responses varying by context |
| Binary access decisions | Access needs changing dynamically by task |
| Trust established once | Trust requiring continuous verification |

### 5.2.2 Five Questions for Every Agent

ATF proposes five core questions that must be answered for every agent:

1. **Identity:** "Who are you?"
   - Authentication, authorization, session management
   
2. **Behavior:** "What are you doing?"
   - Observability, anomaly detection, intent analysis
   
3. **Data Governance:** "What data are you consuming and producing?"
   - Input validation, PII protection, output governance
   
4. **Segmentation:** "Where can you go?"
   - Access control, resource boundaries, policy enforcement
   
5. **Incident Response:** "What if you go rogue?"
   - Circuit breakers, kill switches, containment

Organizations that cannot answer these questions for an agent should not deploy that agent in production.

---

## 5.3 Trusting the LLM Infrastructure Layer

Zero Trust principles apply not only to agents but to the infrastructure they depend on. AI agents are powered by LLMs, and those LLMs must be hosted somewhere. This creates a trust question that many organizations overlook: *Do we trust the LLM provider with our data?*

### 5.5.1 The Limits of Contractual Trust

Cloud LLM providers (OpenAI, Anthropic, Google, etc.) offer terms of service promising not to train on customer data. Enterprise agreements add data processing addendums (DPAs) with additional protections. These are contractual assurances — legally binding promises.

But contractual assurances have limits:

| Assurance Type | What It Provides | What It Doesn't Provide |
|---------------|------------------|------------------------|
| ToS/DPA | Legal recourse if violated | Technical guarantee of compliance |
| Audit rights | Ability to verify (in theory) | Real-time visibility |
| Data residency | Geographic constraints | Protection from provider access |
| Zero retention | Promise not to store | Proof that storage didn't happen |

For non-sensitive data, these assurances may be sufficient. For genuinely sensitive data — security vulnerabilities, cryptographic material, regulated PII, crown jewel IP — "the cloud provider promises not to look" is not a security architecture.

### 5.5.2 Data Sensitivity Classification

Organizations should classify data before enabling agent processing:

**Tier 1: Public/Non-Sensitive — Cloud LLMs Acceptable**
- Documentation generation from public specs
- Public code review (open source)
- General reasoning tasks without sensitive context

**Tier 2: Internal/Confidential — Enhanced Controls**
- Internal code and configurations
- Business logic and processes
- Customer data (anonymized or with DPA coverage)

Requirements: Enterprise LLM agreements, DPAs, dedicated endpoints with data residency guarantees (e.g., Azure OpenAI in specific regions), zero-retention configurations.

**Tier 3: Restricted/Classified — On-Premises Required**
- Security vulnerabilities and active incident details
- Cryptographic material and credentials
- Regulated data (healthcare PHI, financial PCI, classified)
- Core IP that provides competitive advantage

Requirements: Data never leaves organizational boundary. This necessitates on-premises deployment of open-source models.

### 5.5.3 On-Premises LLM Deployment

For Tier 3 data, organizations must run LLM inference internally. The open-source model ecosystem has matured to make this viable:

**Viable Open Source Models (as of early 2026):**

| Model | Strengths | Considerations |
|-------|-----------|----------------|
| Llama 3 (70B, 405B) | Strong general reasoning, permissive license | Largest models need significant GPU |
| DeepSeek-Coder | Competitive code understanding | Focused on code tasks |
| Mistral/Mixtral | Good efficiency/capability ratio | Strong European option |
| Qwen 2.5 | Strong multilingual and code | Alibaba lineage |

**Capability Tradeoffs:**

| Aspect | Cloud LLMs | On-Prem Open Source |
|--------|-----------|---------------------|
| Capability (2026) | State-of-art | ~6-18 months behind frontier |
| Context window | 128K-1M tokens | Typically 32K-128K |
| Latency | Optimized | Depends on hardware investment |
| Cost model | Per-token | Infrastructure capital + operations |
| Data control | Contractual | Technical guarantee |

The capability gap is real but closing. For many platform engineering tasks — code review, documentation generation, incident triage — current open-source models are sufficient.

**Infrastructure Requirements:**
- GPU cluster (A100/H100 for larger models, consumer GPUs for smaller)
- Inference serving (vLLM, text-generation-inference, Ollama)
- Model management and versioning
- Monitoring and observability

### 5.5.4 Hybrid Architecture

Most enterprises will operate hybrid deployments:

```
┌─────────────────────────────────────────────────────────────┐
│ Agent Request                                                │
│     │                                                        │
│     ▼                                                        │
│ ┌───────────────────┐                                        │
│ │ Sensitivity       │ (classify based on context,           │
│ │ Router            │  file paths, channel, keywords)       │
│ └─────────┬─────────┘                                        │
│           │                                                  │
│     ┌─────┴─────┐                                            │
│     │           │                                            │
│     ▼           ▼                                            │
│ ┌───────┐  ┌─────────┐                                       │
│ │ Cloud │  │ On-Prem │                                       │
│ │ LLM   │  │ LLM     │                                       │
│ └───────┘  └─────────┘                                       │
└─────────────────────────────────────────────────────────────┘
```

**Routing approaches:**
- Keyword/regex matching (crude but fast)
- Dedicated classification model (more accurate, adds latency)
- Context-based rules (files from security paths, specific channels)
- Conservative default: assume restricted unless proven otherwise

### 5.5.5 The Trust Position

Organizations should adopt a clear position on LLM infrastructure trust:

1. **Classify data sensitivity** before enabling agent processing
2. **Match model deployment to sensitivity tier** — cloud for Tier 1-2, on-prem for Tier 3
3. **Invest in on-prem capability** — the capability gap is closing
4. **Default to caution** — if uncertain whether data is sensitive, route to on-prem

Cloud LLM ToS are not worthless — but they are insufficient for genuinely sensitive data. Technical controls that make exfiltration impossible are stronger than promises on markdown.

---

## 5.4 Trust Patterns for Platform Engineering

### 5.5.1 Pattern 1: Audit Everything

**Problem:** Cannot trust what cannot be observed.

**Solution:** Comprehensive logging of all agent actions with decision rationale.

**Implementation:**
- Structured logging with machine-parseable format
- Action attribution to agent identity and session
- Decision provenance capturing reasoning chain
- Retention policy aligned with compliance requirements

**Platform Engineering Application:**
Ledger systems should capture agent spawning, task assignment, and completion. Decision reasoning should be logged alongside outcomes.

### 5.5.2 Pattern 2: Rewind Capability

**Problem:** Fear of irreversible damage prevents adoption.

**Solution:** Make agent actions reversible by default.

**Implementation:**
- Snapshot state before destructive operations
- Transaction-like semantics for multi-step workflows
- Dry-run mode for validation
- Automatic rollback on failure detection

**Platform Engineering Context:**
- Git provides natural rollback for code changes
- Infrastructure should use versioned state (Terraform state, Kubernetes manifests)
- Database operations need explicit transaction boundaries

### 5.5.3 Pattern 3: Blast Radius Containment

**Problem:** Unlimited access enables unlimited damage.

**Solution:** Strict scoping of what agents can affect.

**Implementation Layers:**
- **Identity:** Agents as non-human identities with scoped permissions
- **Network:** Agents isolated from production by default
- **Resource:** Token/cost limits, rate limiting
- **Data:** Agents only access data relevant to current task
- **Time:** Session timeouts, maximum execution windows

**Platform Engineering Application:**
Agent workers should operate in isolated sessions with role-based permissions. Each worker should only affect the project or scope it's assigned to.

### 5.5.4 Pattern 4: Human Checkpoints

**Problem:** Full autonomy for high-stakes decisions is unacceptable.

**Solution:** Insert human approval at risk-appropriate points.

**Graduated Model:**
| Risk Level | Human Involvement |
|------------|-------------------|
| Low | Agent acts, logs for audit |
| Medium | Agent proposes, human approves batch |
| High | Agent proposes, human approves each |
| Critical | Human acts, agent assists |

**Platform Engineering Application:**
- Spec phase: Human reviews before build starts
- Build phase: Parallel execution (low individual risk)
- Review phase: Human approves before merge
- Deploy phase: Human-only (agents don't touch production)

### 5.5.5 Pattern 5: Progressive Trust

**Problem:** Fully constraining agents eliminates their value; fully trusting them is dangerous.

**Solution:** Start constrained, expand based on track record.

**Implementation:**
```
Week 1:  Builder can only modify files in project directory
Week 2:  (95% success) Can run tests
Week 4:  (98% success) Can commit to feature branches
Never:   Direct push to main
```

**Metrics for Promotion:**
- Success rate (tasks completed correctly)
- Error rate and severity (failures / total actions)
- Escalation appropriateness (correct escalations / situations requiring escalation)
- Time since last incident

---

## 5.5 The Complexity Cliff: Single-Team to Enterprise

### 5.5.1 Where Simple Approaches Work

At small scale (single team, single project), trust management is straightforward:

- **One set of credentials** shared across agents
- **Single permission boundary** (the project)
- **Informal oversight** (team knows what's happening)
- **Simple audit** (one log to check)

Basic LangGraph setups, simple CrewAI deployments, or single-team agent platforms work well here. The trust overhead is low because the blast radius is naturally contained.

### 5.5.2 The Complexity Explosion

As organizations scale agent deployments, complexity grows non-linearly:

```
Single team:           O(1)
Multiple projects:     O(p)
Multiple teams:        O(t × p)
Multi-tenant:          O(t × p × r × c)
```

Where:
- t = teams
- p = projects per team
- r = roles/permission levels
- c = compliance requirements

**Dimensions that multiply:**

| Dimension | Single-Team | Enterprise |
|-----------|-------------|------------|
| Identity | Shared token | Per-user, per-agent, federated |
| Permissions | All-or-nothing | RBAC, ABAC, dynamic scoping |
| Audit | Single log | Per-tenant, compliance-grade, tamper-proof |
| Blast radius | Project | Must be contained per-tenant |
| Credentials | Inherited | Per-agent, rotated, vaulted |
| Compliance | Informal | SOC2, GDPR, industry-specific |

### 5.5.3 The Single-Portal Trap

A natural response to complexity is centralization: one portal to manage all agents. This fails at scale because:

1. **Bottleneck:** Central team can't keep pace with demand
2. **Context loss:** Central team lacks domain knowledge for permission decisions
3. **Inflexibility:** One-size-fits-all policies don't fit diverse teams
4. **Single point of failure:** Compromise of portal compromises everything

Enterprise patterns require **federation**: central framework, distributed implementation.

### 5.5.4 What Current Tools Lack

Analysis of current orchestration tools reveals common gaps at scale:

| Tool | Works At | Fails At | Missing |
|------|----------|----------|---------|
| **LangGraph** | Single workflow | Multi-tenant | Identity federation, tenant isolation |
| **CrewAI** | Single team | Cross-team | Permission delegation, audit aggregation |
| **AutoGen** | Research/prototype | Production | Everything (not designed for enterprise) |

**Common gaps across all tools:**
- No standard interface for enterprise IAM integration
- No multi-tenant isolation model
- No compliance-grade audit trail
- No credential management beyond basic API keys
- No blast radius containment across tenant boundaries

### 5.5.5 Requirements for Scale

A trust framework suitable for enterprise scale must address:

1. **Federated identity:** Integrate with existing IAM (Azure AD, Okta, etc.)
2. **Hierarchical delegation:** Org → Team → Project → Agent permission chains
3. **Tenant isolation:** Hard boundaries between organizational units
4. **Policy-as-code:** Auditable, testable, version-controlled policies
5. **Pluggable audit:** Integration with existing SIEM/compliance tools
6. **Credential federation:** Leverage existing PAM solutions

The next chapter proposes a framework that addresses these requirements.

---

## 5.6 The Economics of Trust

### 5.5.1 Trust Investment Costs

Building trust requires investment:

| Component | Investment Required |
|-----------|-------------------|
| Observability | Logging infrastructure, monitoring tools, analysis capabilities |
| Reversibility | State management, backup systems, rollback automation |
| Blast Radius | Access control systems, network segmentation, policy engines |
| Progressive Trust | Tracking systems, promotion logic, audit capabilities |

### 5.5.2 Trust ROI

The return on trust investment comes from:
- **Higher autonomy:** More work delegated to agents
- **Faster adoption:** Teams comfortable using agents sooner
- **Reduced incidents:** Safeguards prevent costly failures
- **Compliance satisfaction:** Audit requirements met

### 5.5.3 The Cost of Mistrust

Organizations that under-invest in trust mechanisms face:
- Agents limited to trivial tasks (reduced value)
- Lengthy approval processes (reduced velocity)
- Shadow agent usage (compliance risk)
- Incidents that set back adoption organization-wide

---

## 5.7 Summary

The trust problem in agentic systems stems from the fundamental shift from deterministic to probabilistic automation. Organizations cannot simply "turn on" agents — they must build trust through:

1. **Understanding the tradeoffs** via the Trust Equation
2. **Investing in trust mechanisms** (observability, reversibility, blast radius control)
3. **Implementing progressive autonomy** (earned trust over time)
4. **Applying Zero Trust principles** (never trust by default)
5. **Designing for micro-inflection points** (trust builds incrementally)

The next chapter examines orchestration paradigms and how different approaches to agent coordination affect trust properties.

---

## References

- Cloud Security Alliance (2026). Agentic Trust Framework: Zero Trust for AI Agents.
- GitLab UX Research (2026). Building trust in agentic tools: What we learned from our users.
- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. Academy of Management Review, 20(3), 709-734.
- NIST (2020). SP 800-207: Zero Trust Architecture.
