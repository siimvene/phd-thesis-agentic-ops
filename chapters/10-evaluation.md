# Chapter 10: Evaluation and Limitations

*Working draft — S. Vene, 2026-02-08*

---

## 10.1 Introduction

This thesis proposes a trust framework and operational patterns for agent-enhanced platform engineering. This chapter addresses how these contributions can be evaluated and honestly acknowledges their limitations.

---

## 10.2 Validation Approach

### 10.2.1 Design Science Evaluation

Following the Design Science Research paradigm (Hevner et al., 2004; Peffers et al., 2007), the contributions are evaluated against:

**Utility:** Do the artifacts solve the identified problems?
- Trust framework: Does it help organizations reason about appropriate autonomy levels?
- Operational patterns: Do they provide actionable guidance for implementation?

**Quality:** Are the artifacts well-constructed?
- Internal consistency: Do patterns and framework components align?
- Completeness: Are major use cases covered?
- Clarity: Can practitioners understand and apply the guidance?

**Efficacy:** Do the artifacts work in practice?
- Practitioner review: Do experienced platform engineers find the patterns plausible?
- Constraint satisfaction: Do patterns survive stress-testing against real enterprise constraints?

### 10.2.2 Validation Activities Conducted

| Activity | Purpose | Status |
|----------|---------|--------|
| Literature grounding | Trust framework rooted in Mayer et al. (1995) | Complete |
| Pattern stress-testing | Enterprise patterns tested against known constraints | Complete |
| Practitioner experience | Author's 15 years applied to pattern development | Complete |
| Peer review | Academic and practitioner feedback | Ongoing |
| Empirical validation | Deployment and measurement in real environments | Future work |

### 10.2.3 What Has Been Validated

**Trust Framework (Chapter 4):**
- Grounded in established organizational trust theory (Mayer et al., 1995)
- Components (Observability, Reversibility, Blast Radius, Autonomy) derived from operational practice
- Constraint-based approach is logically consistent
- Practitioner review confirms face validity

**Operational Patterns (Chapters 6-8):**
- Patterns derived from industry practice and literature
- Stress-tested against enterprise constraints (multi-tenancy, PAM, compliance)
- Aligned with emerging industry tools and approaches

**Enterprise Deployment Patterns (Chapter 9):**
- Derived from design exploration against real constraints
- Address gaps identified in current tool ecosystem
- Cross-referenced with industry best practices (Zero Trust, PAM integration)

---

## 10.3 Limitations

### 10.3.1 Methodological Limitations

**Practitioner Bias:**
The patterns emerge from the author's experience in government and financial services. Other sectors (healthcare, retail, startups) may face different constraints and opportunities. The patterns should be adapted, not adopted wholesale.

**Single Practitioner Perspective:**
While informed by 15 years of experience across multiple organizations, the thesis reflects one practitioner's viewpoint. Broader validation through multiple practitioners would strengthen generalizability.

**Design Science vs. Empirical Research:**
The thesis proposes artifacts (frameworks, patterns) rather than testing hypotheses about the world. This is appropriate for the current state of the field but means contributions are "proposed solutions" not "proven solutions."

### 10.3.2 Validation Limitations

**No Controlled Experiments:**
The patterns have not been tested through randomized controlled trials comparing agent-enhanced vs. traditional approaches. Such experiments would require significant organizational commitment and time.

**No Longitudinal Deployment Data:**
Claims about patterns improving MTTR, reducing toil, or building trust are hypothesized, not measured. The original proposal anticipated longitudinal industrial case studies; this remains future work.

**Trust Framework Not Empirically Calibrated:**
The constraint thresholds (e.g., "L4 requires automated rollback <15min") represent practitioner judgment, not empirically derived cutoffs. Organizations should calibrate based on their risk tolerance.

### 10.3.3 Scope Limitations

**Focus on Observability/Incident/Remediation:**
The thesis focuses on operational contexts (RQ1-3) rather than the full platform engineering lifecycle. Design-time and build-time agent applications are mentioned but not deeply explored.

**Enterprise Context:**
Patterns assume relatively mature platform engineering organizations. Startups or less mature organizations may need different approaches.

**Technology Snapshot:**
The LLM and agent ecosystem is evolving rapidly. Specific tool recommendations (LangGraph, CrewAI, etc.) may become outdated. The principles should remain applicable; implementation details may require updating.

### 10.3.4 What This Thesis Does NOT Claim

- The Trust Framework is NOT a calculable formula producing definitive scores
- The patterns are NOT guaranteed to improve MTTR or reduce incidents
- The autonomy levels are NOT empirically validated cutoffs
- Agent-enhanced operations does NOT replace human judgment for novel or high-stakes situations

---

## 10.4 Future Work

### 10.4.1 Empirical Validation

**Longitudinal Deployment Studies:**
Deploy patterns in partner organizations and measure:
- Mean Time to Resolution (MTTR) before/after
- Incident recurrence rates
- Engineer cognitive load (surveys)
- Trust calibration accuracy (appropriate reliance)

**Trust Framework Calibration:**
Survey practitioners on trust decisions to empirically ground:
- Which components matter most?
- What thresholds are appropriate for different contexts?
- How does trust evolve over time with agent experience?

### 10.4.2 Pattern Extension

**Design-Time Patterns:**
Extend coverage to infrastructure design, including:
- Agent-assisted architecture review
- Cost optimization recommendations
- Security posture assessment

**Build-Time Patterns:**
Extend coverage to CI/CD integration:
- IaC generation and review
- Test generation for infrastructure
- Dependency vulnerability assessment

### 10.4.3 Tool Development

**Trust Dashboard:**
Tool that operationalizes the trust framework:
- Assess current safeguards against autonomy level requirements
- Track agent performance metrics for trust calibration
- Recommend autonomy adjustments based on track record

**Pattern Implementation Library:**
Reference implementations of operational patterns:
- Observability synthesis agents
- Triage automation workflows
- Runbook execution frameworks

---

## 10.5 Contribution to Knowledge

Despite limitations, this thesis contributes:

1. **First constraint-based trust framework for operational agents** — Grounded in organizational trust theory, actionable for practitioners

2. **Systematic treatment of observability/triage/remediation patterns** — Consolidates emerging practice with structured guidance

3. **Enterprise deployment patterns** — Addresses real constraints (PAM, multi-tenancy, cost, data sovereignty) that existing frameworks overlook

4. **Honest acknowledgment of limitations** — Presents contributions as hypotheses for practice, not proven solutions

The contributions are offered as a foundation for both practice and future research.

---

## 10.6 Summary

This chapter has:
- Described the validation approach appropriate for Design Science Research
- Honestly acknowledged methodological, validation, and scope limitations
- Outlined future work for empirical validation and extension
- Positioned the contributions as foundations for ongoing research and practice

---

## References

- Hevner, A. R., March, S. T., Park, J., & Ram, S. (2004). Design science in information systems research. MIS Quarterly, 28(1), 75-105.
- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. Academy of Management Review, 20(3), 709-734.
- Peffers, K., Tuunanen, T., Rothenberger, M. A., & Chatterjee, S. (2007). A design science research methodology for information systems research. Journal of Management Information Systems, 24(3), 45-77.
