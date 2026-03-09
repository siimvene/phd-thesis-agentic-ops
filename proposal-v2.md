# Doctoral Thesis Proposal

## Agent-Enhanced Platform Engineering: Trust Frameworks and Patterns for Observability and Incident Response

**Candidate:** Siim Vene  
**Program:** Industrial Doctorate, TalTech  
**Date:** February 2026 (Revised)

---

## 1. Background and Motivation

Large software engineering organizations operate complex, distributed systems that are increasingly difficult to observe and operate reliably. Platform engineering and Site Reliability Engineering (SRE) practices have emerged to manage this complexity, supported by observability tooling and automation. Despite these advances, operational teams experience high cognitive load, slow incident resolution, and significant operational toil.

Recent advances in large language models and agentic AI systems create opportunities to move beyond statistical AIOps approaches. Agentic systems are capable of synthesizing heterogeneous telemetry, reasoning about system behavior, forming diagnostic hypotheses, and supporting or executing remediation actions.

However, deploying autonomous agents in production systems creates trust challenges that existing frameworks do not address. Organizations lack guidance on calibrating appropriate autonomy levels and building trust incrementally.

This research investigates how agentic capabilities can be integrated into platform engineering to improve operational outcomes while maintaining appropriate trust and governance.

---

## 2. Research Problem

Current observability and AIOps solutions focus primarily on signal collection, visualization, and statistical anomaly detection. These approaches provide limited support for cross-system reasoning, contextual diagnosis, and adaptive remediation. Incident response remains heavily human-driven and difficult to scale.

Additionally, there is no established framework for reasoning about trust in operational AI agents. Organizations face a dilemma: agents are most valuable where they can act autonomously, but autonomous action in production requires trust that has not been established.

There is a lack of empirically grounded guidance on how agentic AI systems should be designed, integrated, governed, and evaluated within platform engineering environments to safely improve operational outcomes.

---

## 3. Research Aim and Objectives

**Aim:** To develop and evaluate trust frameworks and patterns for agent-enhanced platform engineering that improve observability, incident triage, and remediation while maintaining appropriate governance.

**Objectives:**

1. Identify limitations of current platform engineering and SRE practices in operational contexts.
2. Develop a trust framework for calibrating appropriate autonomy levels for operational agents.
3. Design patterns for agent-enhanced observability, incident triage, and remediation.
4. Integrate and validate patterns in operational environments.
5. Derive generalizable principles applicable across organizational scales.

---

## 4. Research Questions

**RQ1:** How can agentic systems enhance observability by transforming raw telemetry into actionable operational understanding?

**RQ2:** To what extent can agentic reasoning improve incident triage and root cause analysis compared to existing SRE practices?

**RQ3:** Under what conditions can autonomous or semi-autonomous agents safely and effectively perform remediation actions in production systems?

**RQ4:** What trust and governance mechanisms enable organizations to calibrate appropriate autonomy levels for operational agents?

---

## 5. Scope and Delimitations

**Included:**
- Platform engineering and SRE operational contexts
- Observability, incident triage, and remediation workflows
- Trust frameworks for autonomous operational systems
- Human-in-the-loop operational workflows
- Organizations across maturity levels (from manual operations to enterprise scale)

**Excluded:**
- Foundation model development
- General AI research
- Fully autonomous system operation without human oversight
- Purely statistical anomaly detection (non-agentic approaches)
- Design-time and build-time agent applications (focused on operations)

---

## 6. Methodology

The research adopts a two-phase approach:

**Phase 1: Framework and Pattern Development (Year 1)**

Design Science Research methodology (Hevner et al., 2004; Peffers et al., 2007) for developing:
- Trust framework grounded in organizational trust theory (Mayer et al., 1995)
- Operational patterns for observability, triage, and remediation
- Governance guidance for enterprise deployment

Validation through practitioner review and constraint stress-testing against real enterprise requirements.

**Phase 2: Empirical Validation (Years 2-3)**

Longitudinal industrial deployment combining:
- Quantitative metrics: Mean Time to Resolution (MTTR), diagnosis accuracy, incident recurrence
- Qualitative measures: Engineer trust, perceived workload, usability
- Cross-scale validation: Testing patterns in organizations of varying maturity

---

## 7. Expected Contributions

**Academic:**
- A constraint-based trust framework for operational AI agents, grounded in organizational trust theory
- Empirical evidence on agentic reasoning in operational contexts
- Extensions to SRE and DevOps theory regarding human-agent collaboration

**Industrial:**
- Practical patterns for agent-enhanced observability, triage, and remediation
- Governance guidelines for safe operational autonomy across organizational scales
- Evaluation frameworks for agent-driven operations

---

## 8. Feasibility and Practitioner Grounding

The researcher brings 15 years of platform and infrastructure architecture experience:

| Role | Contribution to Research |
|------|--------------------------|
| Chief Infrastructure Architect, SMIT (2020-present) | Government/public sector constraints, GitOps, K8s at scale |
| Domain Architect, Swedbank (2017-2020) | Financial services, regulated environment experience |
| Program Manager, TalTech (2019-present) | Teaching feedback, curriculum development |
| Founder, Kleidia (2025-present) | NIS2 compliance context, startup perspective |

This experience provides access to operational environments for validation and ensures contributions are grounded in real-world constraints.

---

## 9. Ethical Considerations

- Data anonymization for any operational data used in research
- Operational safety controls during agent deployment
- Clear separation between research activities and production decision-making
- Informed consent for practitioner interviews and surveys

---

## 10. Provisional Timeline

| Phase | Period | Focus |
|-------|--------|-------|
| Year 1 | 2026 | Literature review, trust framework development, pattern design, initial validation |
| Year 2 | 2027 | Pattern refinement, pilot deployments, empirical data collection |
| Year 3 | 2028 | Extended validation, analysis, thesis writing, defense |

---

## References

- Hevner, A. R., et al. (2004). Design science in information systems research. *MIS Quarterly*, 28(1), 75-105.
- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. *Academy of Management Review*, 20(3), 709-734.
- Peffers, K., et al. (2007). A design science research methodology. *Journal of Management Information Systems*, 24(3), 45-77.
- Raza, S., et al. (2025). TRiSM for Agentic AI. *arXiv:2506.04133*.
- Google Cloud. (2024). Accelerate State of DevOps Report 2024.

---

*Revised February 2026 — Incorporates trust framework as core contribution and two-phase research approach.*
