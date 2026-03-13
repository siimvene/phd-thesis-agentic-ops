# Effective Trust Scoring Rubric

## Formula

\[
\text{Effective Trust Score} = 100 \times \frac{O \times R \times B}{A^{1.5}}
\]

Where:
- `O` = Observability score in `[0,1]`
- `R` = Reversibility score in `[0,1]`
- `B` = Blast Radius Control score in `[0,1]`
- `A` = Autonomy level in `{1,2,3,4,5}`

## Gating rule

If any of the three control dimensions is weak, the score is capped:

\[
\text{if } \min(O,R,B) < 0.4,\quad \text{Effective Trust Score} \le 20
\]

This prevents systems with one strong control and one critically weak control from appearing deceptively trustworthy.

---

## Table: Effective Trust Scoring Rubric

| Dimension | Symbol | Range | Components | Weighting |
|---|---:|---:|---|---|
| Observability | O | 0.0–1.0 | logging, traceability, state visibility, monitoring, explainability, auditability | weighted average |
| Reversibility | R | 0.0–1.0 | rollback capability, data recoverability, recovery speed, human override, graceful degradation | weighted average |
| Blast Radius Control | B | 0.0–1.0 | least privilege, scope confinement, isolation, quotas, approval gates, target restrictions | weighted average |
| Autonomy Level | A | 1–5 | recommendation-only → high-autonomy delegated execution | discrete level |

---

## Observability rubric

\[
O = 0.20L + 0.20T + 0.15S + 0.15M + 0.15E + 0.15A_u
\]

Where:
- `L` = action logging
- `T` = traceability of inputs, tools, and outputs
- `S` = state visibility
- `M` = monitoring and alerting
- `E` = explainability
- `A_u` = auditability

### Component anchors

#### L — Action logging
- `0.0` no logs
- `0.25` partial logs, inconsistent
- `0.5` basic action logs
- `0.75` comprehensive timestamped logs
- `1.0` full structured logs with actor, action, target, result

#### T — Traceability
- `0.0` cannot connect outputs to inputs/tools
- `0.5` partial traceability
- `1.0` full trace from prompt/context/tool calls to action/output

#### S — State visibility
- `0.0` hidden internal state
- `0.5` partial state available
- `1.0` current and historical state clearly inspectable

#### M — Monitoring
- `0.0` no monitoring
- `0.5` passive logs only
- `1.0` active monitoring with failure/threshold alerts

#### E — Explainability
- `0.0` black box
- `0.5` post-hoc summaries only
- `1.0` rationale, decision basis, and confidence visible enough for review

#### A_u — Auditability
- `0.0` logs mutable or weakly attributable
- `0.5` logs present but weak provenance
- `1.0` durable, attributable, reviewable audit trail

---

## Reversibility rubric

\[
R = 0.25U + 0.20D + 0.20V + 0.20H + 0.15G
\]

Where:
- `U` = undo/rollback capability
- `D` = data recoverability
- `V` = reversibility speed
- `H` = human override
- `G` = graceful degradation

### Component anchors

#### U — Undo/rollback capability
- `0.0` irreversible actions dominate
- `0.5` some rollback possible
- `1.0` reliable rollback for most important actions

#### D — Data recoverability
- `0.0` destructive changes unrecoverable
- `0.5` backups exist but recovery awkward
- `1.0` tested restore and recovery path exists

#### V — Reversibility speed
- `0.0` recovery takes too long to matter
- `0.5` recovery in hours
- `1.0` recovery in seconds/minutes relative to risk

#### H — Human override
- `0.0` no pause/kill/escalation path
- `0.5` override exists but clumsy
- `1.0` clear, fast human stop/approve/rollback control

#### G — Graceful degradation
- `0.0` failure is catastrophic
- `0.5` some fallback
- `1.0` safe degraded mode exists and is automatic

---

## Blast Radius Control rubric

\[
B = 0.25P + 0.20C + 0.15I + 0.15Q + 0.15G_a + 0.10R_t
\]

Where:
- `P` = least privilege
- `C` = scope confinement
- `I` = isolation
- `Q` = quotas and rate limits
- `G_a` = approval gates
- `R_t` = resource/target restrictions

### Component anchors

#### P — Least privilege
- `0.0` broad unrestricted access
- `0.5` partial scoping
- `1.0` minimum necessary permissions only

#### C — Scope confinement
- `0.0` system-wide impact possible by default
- `0.5` some scoping
- `1.0` tightly bounded targets/workspaces/domains

#### I — Isolation
- `0.0` no isolation
- `0.5` partial sandboxing
- `1.0` strong isolation between workloads/environments

#### Q — Quotas / rate limits
- `0.0` no operational caps
- `0.5` basic caps
- `1.0` enforced caps on actions, spend, volume, or throughput

#### G_a — Approval gates
- `0.0` none
- `0.5` some sensitive actions gated
- `1.0` all high-risk actions require explicit approval

#### R_t — Resource/target restrictions
- `0.0` can act anywhere
- `0.5` some target allowlists
- `1.0` strict allowlists or policy boundaries

---

## Autonomy scale

| Level | Description |
|---:|---|
| 1 | Recommendation only; no direct action |
| 2 | Drafts action, but human approval is required before execution |
| 3 | Executes bounded low-risk actions autonomously within policy |
| 4 | Executes multi-step workflows autonomously with intermittent human oversight |
| 5 | Executes consequential actions with minimal real-time human involvement |

---

## Interpretation bands

| Score | Interpretation |
|---:|---|
| 0–10 | Very low trust |
| 10–25 | Low trust |
| 25–45 | Moderate trust |
| 45–65 | Conditionally high trust |
| 65–100 | High trust |

---

## Thesis-ready prose

### Effective Trust as a Calculable Deployment Heuristic

To make the trust model operational rather than merely rhetorical, the proposed trust equation can be expressed as a normalized scoring heuristic. Effective trust is defined as a multiplicative function of three control dimensions—observability, reversibility, and blast-radius control—penalized by the system’s autonomy level. Formally:

\[
\text{Effective Trust Score} = 100 \times \frac{O \times R \times B}{A^{1.5}}
\]

where `O`, `R`, and `B` are weighted composite scores in the range `[0,1]`, and `A` is a discrete autonomy level from 1 to 5. Observability captures the extent to which actions, inputs, state transitions, and outcomes are visible and auditable. Reversibility reflects the ability to stop, undo, or recover from harmful actions. Blast-radius control represents the degree to which permissions, scope, and execution environments constrain the potential impact of failure or misuse. Autonomy represents how independently the system may act without human approval.

The multiplicative structure is intentional. It reflects the claim that these control dimensions are not meaningfully substitutable: a system with strong observability but poor blast-radius control should still be regarded as low-trust, because visibility does not compensate for unconstrained harm. Likewise, reversibility cannot fully offset the absence of observability, because an organization cannot reliably recover from actions it cannot detect or reconstruct. The autonomy term is modeled as a nonlinear penalty because the trust implications of moving from recommendation-only systems to delegated autonomous systems are not linear; each increase in operational independence raises the burden on control quality disproportionately.

The model should not be interpreted as a universal law or precise predictive instrument. Rather, it functions as a structured evaluative heuristic for comparing alternative agent deployment designs. Its value lies in making trade-offs explicit, enabling comparative analysis across cases, and providing a defensible basis for judging whether a given agent system is sufficiently controlled for its intended operational role. To avoid misleadingly high trust scores in cases where one control dimension is critically weak, a gating rule is applied: if any of the three control dimensions falls below a minimum threshold, the overall trust score is capped. This ensures that no system can be judged highly trustworthy if it lacks one of the foundational controls required for safe delegated operation.


---

## Practitioner reinforcement: architectural guarantees over promises

A useful practitioner formulation of the trust problem is the claim that trust should arise from **architectural guarantees rather than vendor promises**. In contemporary agent infrastructure discussions, strong examples of this pattern include designs where agent systems run inside the customer’s own cloud account, operate through separate short-lived roles, expose tamper-evident audit trails, and can be disabled through explicit control-plane mechanisms such as key revocation or role deactivation. From the perspective of this thesis, such designs are significant not because they prove any one implementation is universally trustworthy, but because they reinforce the broader argument that trust in agent systems should be grounded in enforceable structural constraints. In other words, observability, reversibility, and blast-radius control are not merely desirable operational features; they are the architectural basis on which higher-autonomy systems become governable at all.
