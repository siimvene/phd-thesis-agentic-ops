# Chapter 4: A Trust Framework for Operational Agents

*Working draft — S. Vene, 2026-02-08*

---

## 4.3 Toward a Trust Framework for Agentic Systems

### 4.3.1 Foundations in Organizational Trust Theory

The canonical model of organizational trust is Mayer, Davis, and Schoorman's (1995) framework, which defines trust as "the willingness of a party to be vulnerable to the actions of another party based on the expectation that the other will perform a particular action important to the trustor, irrespective of the ability to monitor or control that other party."

Their model identifies three factors of perceived trustworthiness:
- **Ability:** The skills and competencies enabling influence in a specific domain
- **Benevolence:** The extent to which the trustee is believed to want to do good to the trustor
- **Integrity:** The trustor's perception that the trustee adheres to acceptable principles

Applying this to AI agents presents immediate challenges. Agents have demonstrable *ability* (they can execute tasks), but *benevolence* and *integrity* are difficult to assess for systems without genuine intentions. We cannot evaluate whether an agent "wants" to help us — we can only observe whether its behavior aligns with our goals.

This suggests that trust in agentic systems must rely more heavily on *structural safeguards* than on assessments of agent character. We cannot trust the agent's intentions; we must trust the constraints under which it operates.

### 4.3.2 A Proposed Conceptual Model

Drawing on Mayer et al.'s framework and operational safety principles from high-reliability organizations (Weick & Sutcliffe, 2007), we propose a conceptual model for reasoning about appropriate trust levels in agentic systems:

```
                 Observability × Reversibility × Blast Radius Control
Appropriate Trust ≈ ───────────────────────────────────────────────────
                                    Autonomy Level
```

This is not a calculable formula but a heuristic for reasoning about trust tradeoffs. The components translate Mayer et al.'s factors into operational terms suitable for autonomous systems:

| Mayer et al. Factor | Agentic System Translation |
|---------------------|---------------------------|
| Ability | Assumed (agent can execute) |
| Benevolence | Cannot assess → substitute *Observability* (can we see what it's doing?) |
| Integrity | Cannot assess → substitute *Reversibility* + *Blast Radius Control* (can we recover if it acts against our interests?) |

### 4.3.3 Components Defined

**Observability (O):** The degree to which agent behavior can be monitored and understood.
- Can we see what the agent is doing in real-time?
- Can we understand *why* the agent made specific decisions?
- Can we reconstruct the agent's reasoning after the fact?

**Reversibility (R):** The degree to which agent actions can be undone.
- Can we roll back changes the agent made?
- How quickly can we restore to a known-good state?
- What percentage of agent actions are reversible?

**Blast Radius Control (B):** The limit on maximum damage from agent failure.
- What's the worst-case impact if the agent fails completely?
- How many systems/users could be affected?
- Are there hard limits preventing catastrophic actions?

**Autonomy Level (A):** The degree of independent action granted to the agent.
- Does the agent require approval for actions?
- What scope of decisions can the agent make alone?
- How long can the agent operate without human oversight?

### 4.3.4 From Model to Decision: The Constraint Approach

The conceptual model identifies factors that matter, but practitioners need actionable guidance: *"Given my desired autonomy level, what safeguards must I have in place?"*

Rather than calculating trust scores, we propose a **constraint-based approach**: minimum safeguard requirements for each autonomy level. This translates the conceptual model into deployment decisions.

#### Autonomy Levels Defined

| Level | Name | Description | Example |
|-------|------|-------------|---------|
| L1 | **Supervised** | Human approves every action | Agent suggests, human executes |
| L2 | **Assisted** | Human approves significant actions | Agent executes reads, human approves writes |
| L3 | **Monitored** | Agent acts, human reviews | Async review of agent actions |
| L4 | **Bounded** | Autonomous within defined scope | Agent owns non-production environments |
| L5 | **Trusted** | Autonomous with exception escalation | Agent handles routine, escalates anomalies |

#### Minimum Safeguard Requirements

For each autonomy level, the following safeguards represent minimum acceptable thresholds:

| Autonomy | Observability Minimum | Reversibility Minimum | Blast Radius Maximum |
|----------|----------------------|----------------------|---------------------|
| **L1: Supervised** | Action logs | Any | Any |
| **L2: Assisted** | Action logs + rationale | Manual rollback <4hr | Department |
| **L3: Monitored** | Real-time dashboard | Automated rollback <1hr | Team/Project |
| **L4: Bounded** | Alerting on anomalies | Automated rollback <15min | Single service |
| **L5: Trusted** | Full decision provenance | Instant/transactional | Single task scope |

#### Applying the Constraints

**Step 1: Determine required autonomy level**
What does the use case need? A coding assistant suggesting changes (L1) differs from an on-call triage agent making decisions at 3am (L4-L5).

**Step 2: Assess current safeguards**
For each component, evaluate current capability against the minimum for your target autonomy level.

**Step 3: Identify gaps**
Where do current safeguards fall short of the minimum? These are prerequisites before deployment.

**Step 4: Decide: invest or constrain**
Either:
- Invest in safeguards to meet the minimum (then deploy at target autonomy)
- Accept lower autonomy level that matches current safeguards

#### Example Application

*Scenario: Team wants to deploy an agent for automated incident triage (L4: Bounded autonomy)*

| Component | L4 Minimum | Current State | Gap? |
|-----------|-----------|---------------|------|
| Observability | Alerting on anomalies | Basic logs only | **Yes** — need monitoring |
| Reversibility | Automated <15min | Manual only | **Yes** — need automation |
| Blast Radius | Single service | Cross-service access | **Yes** — need scoping |

*Decision: Cannot deploy at L4. Options:*
- Invest in observability (add anomaly detection), reversibility (automate rollbacks), and scoping (restrict agent permissions) → then deploy at L4
- Deploy at L2 (human approves significant actions) with current safeguards

This approach transforms the abstract trust model into concrete deployment prerequisites.

### 4.3.5 Limitations

This constraint framework has limitations:

1. **Thresholds are proposed, not validated:** The minimum requirements represent practitioner judgment, not empirical research on failure rates at each level.

2. **Context-dependent:** Healthcare, finance, and marketing have different risk tolerances. Organizations should adjust thresholds accordingly.

3. **Binary is simplistic:** Reality has gradients, not discrete levels. The framework provides starting points, not absolute boundaries.

4. **Assumes static assessment:** Trust should evolve as agents demonstrate track record. This framework addresses initial deployment, not ongoing calibration.

The framework is offered as a **practical starting point** that makes the conceptual model actionable. Organizations should adapt thresholds to their specific risk tolerance and regulatory context.

---

## 4.4 Trust-Building Mechanisms

### 4.4.1 Micro-Inflection Points

Research from GitLab (2026) reveals that trust in AI agents builds incrementally through "micro-inflection points" — small interactions that accumulate over time:

> "Users don't commit to AI tools through single 'aha' moments. Instead, they develop trust through accumulated positive micro-interactions that demonstrate the agent understands their context, respects their guardrails, and enhances rather than disrupts their workflows."

Four categories of trust-building interactions:

1. **Safeguarding actions**
   - Confirmation dialogs for critical changes
   - Rollback capabilities
   - Respect for security boundaries

2. **Providing transparency**
   - Real-time progress updates
   - Action explanations before execution
   - Clear error handling

3. **Remembering context**
   - Preference retention
   - Context awareness across sessions
   - Adaptive learning from corrections

4. **Anticipating needs**
   - Pattern recognition
   - Intelligent task routing
   - Environment awareness

### 4.4.2 The Compound Effect

Trust follows a compound growth pattern:

```
Trust(t) = Trust(t-1) × (1 + interaction_quality)
```

Each positive micro-interaction increases willingness to rely on the agent for subsequent tasks. However, this pattern is asymmetric — negative interactions have disproportionate impact:

> "A single significant failure can erase weeks of accumulated confidence."

This asymmetry has design implications:
- Err on the side of asking for confirmation
- Make recovery paths obvious and fast
- Never fail silently

### 4.4.3 Progressive Autonomy: The ATF Model

The Cloud Security Alliance's Agentic Trust Framework (ATF) formalizes progressive trust through an "earned autonomy" model with four levels:

| Level | Title | Characteristics |
|-------|-------|-----------------|
| L1 | **Intern** | All actions require approval, heavy supervision |
| L2 | **Junior** | Routine actions autonomous, significant actions approved |
| L3 | **Senior** | Autonomous within defined boundaries, exception escalation |
| L4 | **Principal** | Fully autonomous with periodic audit |

**Promotion Criteria:**
Agents advance levels based on demonstrated trustworthiness:
- Task completion rate
- Error rate and severity
- Appropriate escalation behavior
- Time operating without incidents

**Demotion Triggers:**
Agents can be demoted for:
- Critical failures
- Boundary violations
- Unexpected behavior patterns
- Audit findings

This model treats agents like employees — trust is earned through track record, not granted by default.

---


---

## References

- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. Academy of Management Review, 20(3), 709-734.
- Weick, K. E., & Sutcliffe, K. M. (2007). Managing the Unexpected: Resilient Performance in an Age of Uncertainty (2nd ed.). Jossey-Bass.
- Cloud Security Alliance (2026). Agentic Trust Framework: Zero Trust for AI Agents.
- GitLab UX Research (2026). Building trust in agentic tools.

---

*This chapter proposes the framework. Chapter 5 addresses governance at enterprise scale.*
