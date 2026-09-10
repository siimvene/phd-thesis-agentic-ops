# Chapter 4: A Trust Framework for Operational Agents

*Working draft — S. Vene. Last aligned with Article 1 (Trust-Calibrated Autonomy for Operational AI Agents in Production Environments) on 2026-04-27.*

---

## 4.3 The Operational Trust Calibration Framework

### 4.3.1 Foundations in Organizational Trust Theory

The canonical model of organizational trust is Mayer, Davis, and Schoorman's (1995) framework, which defines trust as "the willingness of a party to be vulnerable to the actions of another party based on the expectation that the other will perform a particular action important to the trustor, irrespective of the ability to monitor or control that other party."

Their model identifies three factors of perceived trustworthiness:
- **Ability:** The skills and competencies enabling influence in a specific domain
- **Benevolence:** The extent to which the trustee is believed to want to do good to the trustor
- **Integrity:** The trustor's perception that the trustee adheres to acceptable principles

Applying this to AI agents presents immediate challenges. Agents have demonstrable *ability* (they can execute tasks), but *benevolence* and *integrity* are difficult to assess for systems without genuine intentions. We cannot evaluate whether an agent "wants" to help us — we can only observe whether its behavior aligns with our goals.

This suggests that trust in agentic systems must rely more heavily on *structural safeguards* than on assessments of agent character. We cannot trust the agent's intentions; we must trust the constraints under which it operates. The translation of Mayer et al.'s factors into operational terms underpins the framework that follows:

| Mayer et al. Factor | Agentic System Translation |
|---------------------|---------------------------|
| Ability | Assumed (the agent can execute) |
| Benevolence | Cannot assess → substitute *Observability* (can we see what it is doing?) |
| Integrity | Cannot assess → substitute *Reversibility* and *Blast Radius* (can we recover if it acts against our interests, and how bad is it if we cannot?) |

### 4.3.2 The Core Calibration Heuristic

Drawing on Mayer et al.'s framework and operational safety principles from high-reliability organizations (Weick & Sutcliffe, 2007), the framework proposes a structured decision heuristic — not a numerical formula — for reasoning about appropriate autonomy levels in agentic systems:

```
                          Observability × Reversibility
Appropriate Autonomy ∝ ──────────────────────────────────
                                 Blast Radius
```

As observability and reversibility increase, a higher autonomy level becomes justifiable. As blast radius increases, the acceptable autonomy ceiling drops. The expression captures three operational constraints — collectively, the **ORB kernel** — that any responsible deployment of an operational AI agent must consider. For each agent-task-context configuration, the ORB assessment determines which autonomy level (§4.3.5) is permissible under the governance envelope (§4.3.4).

This formulation differs in three ways from earlier drafts of this chapter:
1. The left-hand side is **appropriate autonomy**, not "trust." Trust is the underlying organizational disposition; autonomy is the bounded operational decision the framework helps calibrate.
2. **Blast Radius** appears in the denominator as a raw operational quantity, not as "Blast Radius Control" in the numerator. The intuition is unchanged — large blast radius lowers the autonomy ceiling — but the form is more direct and matches how practitioners reason about consequences.
3. Autonomy is not in the denominator. It is the *outcome* the kernel calibrates, not an input to the kernel.

### 4.3.3 Core calibration dimensions

**Observability (O).** The degree to which the agent and its human supervisors can ground their reasoning in sufficiently rich and relevant telemetry, including logs, metrics, traces, dependency context, recent changes, and service metadata (Sridharan, 2018; OpenTelemetry Authors, n.d.). High observability improves the inspectability of recommendations and supports post-hoc accountability. Practical questions:
- Can we see what the agent is doing in real-time?
- Can we understand *why* the agent made specific decisions?
- Can we reconstruct the agent's reasoning after the fact?

**Reversibility (R).** How safely, quickly, and completely an action can be rolled back. This includes technical rollback, state recovery, and the ability to restore a prior stable configuration. Reversibility matters because even a highly probable action should not be delegated if its error cost is effectively irreversible (Lee & See, 2004; Hoff & Bashir, 2015). Practical questions:
- Can we roll back changes the agent made?
- How quickly can we restore to a known-good state?
- What percentage of agent actions are reversible?

**Blast Radius (B).** The likely operational, organizational, legal, and public consequences if the action is wrong. In production environments, blast radius is multi-layered. It includes system impact, customer impact, cross-service dependency effects, evidentiary loss, compliance consequences, and reputational damage (NIST, 2024b, 2025; ISO, 2018). Practical questions:
- What is the worst-case impact if the agent fails completely?
- How many systems, customers, or downstream services could be affected?
- Are there hard architectural limits that prevent catastrophic outcomes?

### 4.3.4 Governance envelope

The ORB kernel alone is insufficient. It must be wrapped in a governance envelope that defines the conditions under which a given autonomy level is permissible. This envelope has six elements:

1. **Approval authority.** The framework must specify who may authorize which class of actions and under what incident conditions (NIST, 2023, 2025).

2. **Auditability and provenance.** Recommendations, evidence sources, prompts, tool calls, approvals, and actions should be logged in a way that supports review and accountability (ISO/IEC, 2023; NIST, 2023). Where retrieval-augmented generation (RAG) is used to ground agent reasoning in operational knowledge, the **provenance and freshness of retrieved context must themselves be auditable** (Lewis et al., 2020).

3. **Override and kill-switch capability.** Human actors must be able to stop, reverse, or suspend an agent's action pathway when uncertainty increases or context changes (Shneiderman, 2022).

4. **Policy fit.** Some incident types — security events, cross-organizational outages, stateful transaction anomalies — may be categorically excluded from automated action even when the agent appears technically competent (NIST, 2024a, 2025).

5. **Evidence requirements.** An agent should not act only because it produces a plausible narrative. It should meet an explicit evidence threshold tied to telemetry quality, runbook fit, and operational context (Ribeiro et al., 2016; Amershi et al., 2019; Steinmetz et al., 2025).

6. **Deployment staging.** Operational AI should progress through offline analysis, replay, shadow mode, recommendation mode, bounded execution with authorization, and only then, where justified, conditional bounded autonomy (Hevner et al., 2004; Peffers et al., 2007; NIST, 2023).

### 4.3.5 Autonomy levels

The framework defines four autonomy levels.

**Level 0 — Observe and summarize.**
The agent may retrieve, correlate, summarize, and explain incident evidence, but it may not recommend or execute actions. This level is appropriate when observability is partial, blast radius is high, or governance is not yet mature.

**Level 1 — Recommend and justify.**
The agent may suggest hypotheses, rank likely causes, and propose runbook steps with evidence. Humans remain solely responsible for action selection. This level is suitable when telemetry is informative but uncertainty remains material.

**Level 2 — Execute bounded reversible actions with authorization.**
The agent may carry out predefined, reversible tasks such as restarting a failed worker, scaling a non-critical service, or applying a known-safe rollback, but only after explicit approval by an authorized human.

**Level 3 — Conditional bounded autonomy.**
The agent may act within a pre-approved envelope without case-by-case approval, but only for actions with strong observability, high reversibility, low blast radius, and complete logging and review controls.

This framework deliberately excludes broad unsupervised autonomy in production. In regulated or public-impact environments, the burden of justification for such autonomy is far higher than current literature supports (NIST, 2023, 2024a, 2025; ISO/IEC, 2023). Vendor frameworks that label this tier as "L4 / Trusted / Full Autonomy" are noted in §4.4.3, but the framework here treats production deployment of unsupervised autonomy as out of scope.

#### Summary of autonomy levels and their ORB conditions

| Autonomy level | Observability | Reversibility | Blast radius | Governance requirement |
|---|---|---|---|---|
| **L0:** Observe and summarize | Any | N/A (read-only) | Any | Logging only |
| **L1:** Recommend and justify | Moderate to high | N/A (no action) | Any | Human selects action |
| **L2:** Execute bounded reversible actions | High | High | Low to moderate | Explicit human approval per action |
| **L3:** Conditional bounded autonomy | High, with anomaly alerting | High, automated rollback | Low, scoped | Pre-approved envelope, complete logging, review controls |

#### Applying the framework

The ORB kernel and governance envelope translate into a four-step decision process for any candidate agent deployment:

1. **Determine the desired autonomy level.** What does the use case need? An incident-triage assistant operating in a regulated environment differs from an internal-tool log summarizer.
2. **Assess current ORB state.** For each kernel dimension, evaluate present capability against the level's minimum requirements.
3. **Identify gaps.** Where do current safeguards fall short? These are deployment prerequisites.
4. **Decide: invest or constrain.** Either invest in the missing safeguards and deploy at the target level, or accept a lower autonomy level that matches current safeguards.

#### Worked example

*Scenario: A platform team wants to deploy an agent for incident triage with bounded autonomous remediation (L3).*

| Component | L3 Requirement | Current State | Gap |
|---|---|---|---|
| Observability | Anomaly alerting + decision provenance | Basic logs only | **Yes** — need anomaly detection + decision logging |
| Reversibility | Automated rollback within scope | Manual rollback only | **Yes** — need automation |
| Blast Radius | Low, scoped to single service | Cross-service permissions | **Yes** — need IAM scoping |
| Governance | Pre-approved envelope with complete logging | No formal envelope | **Yes** — need policy formalization |

*Decision: Cannot deploy at L3. Options:*
- Invest in observability tooling, rollback automation, IAM scoping, and policy work, then deploy at L3.
- Deploy at L1 (recommend with human-selected actions) using current safeguards.

This approach transforms the abstract trust model into concrete deployment prerequisites.

### 4.3.6 Limitations

This framework has limitations that are openly acknowledged:

1. **The ORB heuristic is conceptual, not numerical.** O, R, and B are not measured on a single calibrated scale. Practitioners assess them qualitatively, with thresholds adapted to context. The form provides reasoning structure, not a calculation.

2. **Thresholds are proposed, not validated.** The level-by-level requirements represent practitioner judgment grounded in DSR-style stress testing, not empirical research on failure rates at each level. The empirical validation phase (described in Article 1 §5 and Chapter 10) addresses this directly through structured expert interviews with scenario stress testing, but those findings are not in this draft.

3. **Context-dependent.** Healthcare, finance, public-sector ICT, and consumer SaaS have different risk tolerances and regulatory contexts. Organizations should adapt thresholds accordingly, not adopt the table verbatim.

4. **Discrete levels are simplifications.** Reality has gradients, not crisp tiers. The four levels provide working structure, not absolute boundaries; intermediate hybrids will exist in practice.

5. **Assumes static assessment.** Trust should evolve as agents demonstrate track record. This framework addresses initial deployment decisions; ongoing recalibration based on operational evidence is treated separately (§4.4 and Chapter 5).

The framework is offered as a **theoretically grounded and operationally actionable basis** for autonomy calibration. Organizations should adapt it to their specific risk tolerance and regulatory context, not treat it as a finished product.

---

## 4.4 Trust-Building Mechanisms

This section extends the static-deployment framework above with literature on how trust evolves through operation. These mechanisms inform how an agent moves between autonomy levels over its lifetime, complementing the L0–L3 ladder rather than replacing it.

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

Trust follows a compound growth pattern, asymmetric to failures:

```
Trust(t) = Trust(t-1) × (1 + interaction_quality)
```

Each positive micro-interaction increases willingness to rely on the agent for subsequent tasks. However, this pattern is asymmetric — negative interactions have disproportionate impact:

> "A single significant failure can erase weeks of accumulated confidence."

This asymmetry has design implications:
- Err on the side of asking for confirmation
- Make recovery paths obvious and fast
- Never fail silently

### 4.4.3 Progressive autonomy: vendor and external frameworks

The L0–L3 ladder defined in §4.3.5 is the framework's canonical autonomy taxonomy. For comparability, practitioners may encounter alternative ladders in vendor and industry literature.

The Cloud Security Alliance's Agentic Trust Framework (CSA, 2026) formalizes progressive trust through an "earned autonomy" model with four levels:

| CSA ATF Level | Title | Characteristics | Approximate L0–L3 mapping |
|---|---|---|---|
| L1 | **Intern** | All actions require approval | Maps to L1 (recommend) / L2 (execute with approval) |
| L2 | **Junior** | Routine actions autonomous, significant approved | Maps to L2 / L3 |
| L3 | **Senior** | Autonomous within boundaries, exception escalation | Maps to L3 |
| L4 | **Principal** | Fully autonomous with periodic audit | **Out of scope** in the framework presented here (see §4.3.5) |

Promotion criteria (task completion rate, error rate, escalation behavior, time without incident) and demotion triggers (critical failures, boundary violations, unexpected behavior, audit findings) translate the ATF idea into the L0–L3 framework as policies for moving an agent up or down the ladder over its operational lifetime, rather than as separate levels.

This framework treats agents like operational systems with track record, not like employees, but the underlying intuition — that autonomy is earned and revocable — is shared.

---

## References

- Amershi, S., et al. (2019). Guidelines for human-AI interaction. *CHI 2019*.
- Cloud Security Alliance (2026). Agentic Trust Framework: Zero Trust for AI Agents.
- GitLab UX Research (2026). Building trust in agentic tools.
- Hevner, A. R., March, S. T., Park, J., & Ram, S. (2004). Design science in information systems research. *MIS Quarterly*, 28(1).
- Hoff, K. A., & Bashir, M. (2015). Trust in automation: Integrating empirical evidence on factors that influence trust. *Human Factors*, 57(3), 407-434.
- ISO (2018). ISO 31000:2018 Risk management — Guidelines.
- ISO/IEC (2023). ISO/IEC 42001:2023 Artificial intelligence management system.
- Lee, J. D., & See, K. A. (2004). Trust in automation: Designing for appropriate reliance. *Human Factors*, 46(1), 50-80.
- Lewis, P., et al. (2020). Retrieval-augmented generation for knowledge-intensive NLP tasks. *NeurIPS 2020*.
- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. *Academy of Management Review*, 20(3), 709-734.
- NIST (2023). AI Risk Management Framework (AI RMF 1.0).
- NIST (2024a). Generative AI Profile (NIST AI 600-1).
- NIST (2024b). Cybersecurity Framework 2.0.
- NIST (2025). Computer Security Incident Handling Guide (rev.).
- OpenTelemetry Authors (n.d.). OpenTelemetry specification.
- Peffers, K., Tuunanen, T., Rothenberger, M. A., & Chatterjee, S. (2007). A design science research methodology for information systems research. *Journal of Management Information Systems*, 24(3), 45-77.
- Ribeiro, M. T., Singh, S., & Guestrin, C. (2016). "Why should I trust you?": Explaining the predictions of any classifier. *KDD 2016*.
- Shneiderman, B. (2022). *Human-Centered AI*. Oxford University Press.
- Sridharan, C. (2018). *Distributed Systems Observability*. O'Reilly Media.
- Steinmetz, N., et al. (2025). Performance characterization for trust calibration in AI systems.
- Weick, K. E., & Sutcliffe, K. M. (2007). *Managing the Unexpected: Resilient Performance in an Age of Uncertainty* (2nd ed.). Jossey-Bass.

---

*This chapter establishes the framework. Chapter 5 addresses governance at enterprise scale.*
