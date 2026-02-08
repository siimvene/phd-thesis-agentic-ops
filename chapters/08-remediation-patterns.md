# Chapter 8: Agent-Assisted Remediation

*Working draft — S. Vene, 2026-02-08*

---

## 8.1 Introduction

Remediation — taking action to resolve an incident — is where trust frameworks matter most. Observability (Chapter 6) and triage (Chapter 7) are fundamentally read operations; remediation is a write operation with production impact.

This chapter examines RQ3: Under what conditions can autonomous or semi-autonomous agents safely and effectively perform remediation actions in production systems?

The short answer: carefully, incrementally, and with explicit boundaries.

---

## 8.2 The Remediation Autonomy Question

### 8.2.1 The Stakes

Remediation actions can:
- Resolve incidents (the goal)
- Make incidents worse (incorrect action)
- Create new incidents (side effects)
- Violate compliance (unauthorized changes)
- Expose sensitive data (in logs, communications)

The blast radius of a remediation action can exceed the blast radius of the original incident.

### 8.2.2 The Autonomy Spectrum

Applying the trust framework from Chapter 4:

| Level | Remediation Autonomy | Example |
|-------|---------------------|---------|
| L1 Supervised | Agent suggests, human executes | "Recommend rollback to v2.3.1" |
| L2 Assisted | Agent prepares, human approves | "Rollback ready. Execute? [Yes/No]" |
| L3 Monitored | Agent executes approved actions | Auto-rollback for known patterns |
| L4 Bounded | Agent executes within scope | Restart pods in non-prod |
| L5 Trusted | Autonomous remediation | Not recommended for production |

**Key principle:** Production remediation should rarely exceed L3, and only for well-understood, reversible actions.

### 8.2.3 The Human-Required Boundary

Some remediation decisions should remain human-only:

- **Data-affecting actions:** Database modifications, cache invalidation
- **Security-affecting actions:** Credential rotation during incident (may lock out responders)
- **Customer-affecting actions:** Enabling/disabling features for users
- **Irreversible actions:** Data deletion, resource termination
- **High-uncertainty situations:** Novel incidents, cascading failures

The goal is not full automation but *appropriate* automation — agents handle the routine so humans can focus on judgment calls.

---

## 8.3 Pattern: Runbook Execution with Guardrails

### Problem

Runbooks encode remediation knowledge but require human execution. At 3am, tired engineers may skip steps or make errors.

### Solution

Agent executes documented runbook steps with pre/post verification and human oversight.

### Implementation

**Runbook structure for agent execution:**

```yaml
runbook: "database-connection-pool-exhaustion"
trigger_conditions:
  - metric: "db_connection_pool_utilization"
    operator: ">"
    threshold: 95
    duration: "5m"
    
pre_checks:
  - verify: "primary-db-healthy"
    query: "SELECT 1"
    timeout: 5s
  - verify: "no-active-migration"
    check: "migration_lock_status"
    
steps:
  - name: "Increase pool size"
    action: "scale_connection_pool"
    params:
      target_size: "current * 1.5"
      max_size: 200
    rollback: "scale_connection_pool to original"
    verification:
      metric: "db_connection_pool_utilization"
      expected: "< 80 within 2m"
      
  - name: "Alert DBA if sustained"
    condition: "pool_size > 150"
    action: "page_oncall"
    params:
      team: "database"
      message: "Connection pool scaled to {{pool_size}}, investigation needed"
      
post_checks:
  - verify: "error_rate_normalized"
    metric: "service_error_rate"
    expected: "< baseline + 1%"
    timeout: 5m

human_approval_required: false  # For L3, set true for L2
max_executions_per_hour: 3
```

**Execution flow:**

```
┌─────────────────────────────────────────────────────────────┐
│ 1. TRIGGER DETECTION                                         │
│    - Monitor matches trigger conditions                      │
│    - Check: runbook not in cooldown                         │
│                                                              │
│ 2. PRE-CHECKS                                                │
│    - Execute all pre-check verifications                     │
│    - Any failure → abort, alert human                        │
│                                                              │
│ 3. APPROVAL (if required)                                    │
│    - Present plan to human                                   │
│    - Wait for approval or timeout                            │
│                                                              │
│ 4. EXECUTION                                                 │
│    - Execute steps sequentially                              │
│    - Verify each step before proceeding                      │
│    - Failure → execute rollback, alert human                 │
│                                                              │
│ 5. POST-CHECKS                                               │
│    - Verify remediation achieved goal                        │
│    - Log outcome for learning                                │
│    - Update incident with actions taken                      │
└─────────────────────────────────────────────────────────────┘
```

### Autonomy Level

L2-L3: L2 requires human approval before execution. L3 executes automatically for pre-approved runbooks.

### Risks

- Runbook encodes bad practice (automating workarounds)
- Pre-checks insufficient to detect unsafe conditions
- Verification fails but action already taken
- Runbook conflicts with human actions during incident

**Critical safeguard:** Runbooks must be reviewed before automation. Automating bad runbooks makes incidents worse, faster.

---

## 8.4 Pattern: Automated Rollback

### Problem

When a deployment causes an incident, rollback is often the fastest remediation. But rollback requires detecting the correlation and executing the mechanics.

### Solution

Agent that correlates deployment timing with incident signals and executes rollback when pattern is clear.

### Implementation

**Correlation logic:**

```
IF:
  - Incident started within 15 minutes of deployment
  - Affected service matches deployed service (or dependency)
  - No other significant changes in window
  - Deployment is rollback-safe (flagged in CD metadata)
  
AND:
  - Confidence > threshold (default 80%)
  - Previous version is known-good (ran > 1 hour without incident)
  
THEN:
  - Recommend rollback
  - If L3+ autonomy: execute rollback
  - Monitor for recovery
```

**Rollback execution:**

```yaml
rollback:
  service: "auth-service"
  from_version: "v2.3.2"
  to_version: "v2.3.1"
  
  method: "kubernetes_rollout_undo"
  # OR: "argocd_sync_to_revision"
  # OR: "spinnaker_rollback"
  
  verification:
    - wait: 30s  # For pods to stabilize
    - check: "error_rate < threshold"
      timeout: 2m
    - check: "latency_p99 < baseline * 1.5"
      timeout: 2m
      
  on_success:
    - update_incident: "Rolled back to {{to_version}}"
    - notify: "incident-channel"
    
  on_failure:
    - alert: "Rollback failed, human intervention required"
    - page: "on-call"
    - preserve_state: "for debugging"
```

### Autonomy Level

L3 (Monitored) for standard deployments with clear correlation. L2 (Assisted) for complex deployments or uncertain correlation.

### Deployment Metadata for Safe Rollback

CD pipelines should flag deployments as rollback-safe:

```yaml
deployment:
  version: "v2.3.2"
  rollback_safe: true
  rollback_target: "v2.3.1"
  rollback_blockers:
    - "database_migration"  # If present, block auto-rollback
    - "feature_flag_dependency"
  min_soak_time: "1h"  # Required healthy runtime before auto-rollback eligible
```

---

## 8.5 Pattern: Capacity Adjustment

### Problem

Some incidents stem from insufficient capacity. Scaling up can resolve the immediate problem while root cause is investigated.

### Solution

Agent that detects capacity-related incidents and adjusts resources within pre-defined bounds.

### Implementation

**Scaling rules:**

```yaml
scaling_policy:
  service: "api-gateway"
  
  triggers:
    cpu_based:
      metric: "container_cpu_usage_percent"
      scale_up_threshold: 80
      scale_down_threshold: 30
      
    queue_based:
      metric: "request_queue_depth"
      scale_up_threshold: 1000
      scale_down_threshold: 100
      
  constraints:
    min_replicas: 3
    max_replicas: 20
    scale_up_increment: 2
    scale_down_increment: 1
    cooldown_seconds: 300
    
  guardrails:
    max_cost_per_hour: 500  # USD
    require_approval_above: 15  # replicas
    
  autonomy: L3  # Auto-scale within constraints
```

**Scope constraints are critical:**
- Maximum replicas (cost control)
- Maximum cost rate (FinOps integration)
- Cooldown periods (prevent thrashing)
- Human approval for extreme scaling

### Autonomy Level

L3-L4: Autonomous within defined bounds. Human approval for scaling beyond limits.

---

## 8.6 Pattern: Circuit Breaking

### Problem

Cascading failures occur when a failing service overwhelms its dependencies or callers. Breaking the circuit prevents cascade.

### Solution

Agent that activates circuit breakers when cascade patterns detected.

### Implementation

**Circuit breaker activation:**

```
DETECT cascade pattern:
  - Service A error rate > threshold
  - Service A is dependency of B, C, D
  - B, C, D showing elevated errors
  - Error pattern indicates timeout/unavailable (not logic errors)
  
ACTIVATE circuit breaker:
  - Route traffic to fallback (cached response, default value, graceful degradation)
  - Reduce retry storms (back off callers)
  - Isolate failure domain
  
MONITOR for recovery:
  - Probe Service A health
  - Gradually restore traffic when healthy
  - Alert if not recovered within timeout
```

**Integration with service mesh:**

```yaml
# Istio DestinationRule for circuit breaking
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
  name: auth-service-circuit-breaker
spec:
  host: auth-service
  trafficPolicy:
    connectionPool:
      http:
        h2UpgradePolicy: UPGRADE
        http1MaxPendingRequests: 100
        http2MaxRequests: 1000
    outlierDetection:
      consecutive5xxErrors: 5
      interval: 30s
      baseEjectionTime: 60s
      maxEjectionPercent: 50
```

Agent's role: detect cascade patterns that outlier detection misses, and activate/tune circuit breakers dynamically.

### Autonomy Level

L4 (Bounded): Autonomous circuit breaking within mesh capabilities. Human oversight for cross-service coordination.

---

## 8.7 When NOT to Automate Remediation

### 8.7.1 The Human-Required Boundary

Some situations should always involve human judgment:

**Novel failures:**
- First-time incidents with no matching pattern
- Symptoms outside known failure modes
- Agent confidence below threshold

**High-stakes decisions:**
- Customer data at risk
- Regulatory/compliance implications
- Significant financial impact

**Complex coordination:**
- Multiple teams must coordinate
- External parties involved (vendors, partners)
- Public communication needed

**Conflicting signals:**
- Remediation options have tradeoffs
- Evidence supports multiple hypotheses
- Agent recommendations conflict

### 8.7.2 Escalation to Human

When agent encounters boundary conditions:

```
Agent: I've identified a potential remediation but need human judgment.

SITUATION:
- Auth-service showing high error rate
- Correlation with recent deployment (85% confidence)
- However: deployment included database migration

COMPLICATION:
- Rollback would undo migration
- Migration may have already affected data
- Need DBA input on safe rollback approach

RECOMMENDATION:
- Page DBA team for migration assessment
- Hold on automated rollback
- I can prepare rollback command pending DBA clearance

[Page DBA] [Hold] [Override - Execute Rollback]
```

---

## 8.8 Summary

Agent-assisted remediation requires careful scoping:

| Pattern | Action Type | Autonomy Level | Key Safeguard |
|---------|-------------|----------------|---------------|
| Runbook Execution | Documented procedures | L2-L3 | Pre/post checks, step verification |
| Automated Rollback | Deployment reversion | L2-L3 | Deployment correlation, known-good target |
| Capacity Adjustment | Resource scaling | L3-L4 | Bounds, cost limits |
| Circuit Breaking | Failure isolation | L4 | Service mesh integration |

**Key principles:**
1. Production remediation should rarely exceed L3
2. Reversible actions before irreversible
3. Scope constraints are mandatory
4. Human judgment for novel/high-stakes situations
5. Earn autonomy through track record

---

*This chapter addresses RQ3: Under what conditions can autonomous or semi-autonomous agents safely and effectively perform remediation actions in production systems?*
