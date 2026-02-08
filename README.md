# PhD Thesis: Agent-Enhanced Platform Engineering

**Title:** Agent-Enhanced Platform Engineering: Trust Frameworks and Patterns for Observability and Incident Response

**Candidate:** Siim Vene  
**Institution:** TalTech (Tallinn University of Technology)  
**Program:** Industry Doctorate  
**Status:** Full draft complete

---

## Abstract

This thesis develops a trust framework and operational patterns for integrating AI agents into platform engineering, with focus on observability, incident triage, and remediation. The core contribution is a constraint-based trust model grounded in organizational trust theory (Mayer et al., 1995) that enables organizations to calibrate appropriate autonomy levels for operational agents.

---

## Research Questions

- **RQ1:** How can agentic systems enhance observability by transforming raw telemetry into actionable operational understanding?
- **RQ2:** To what extent can agentic reasoning improve incident triage and root cause analysis compared to existing SRE practices?
- **RQ3:** Under what conditions can autonomous agents safely perform remediation actions in production systems?
- **RQ4:** What trust and governance mechanisms enable organizations to calibrate appropriate autonomy levels for operational agents?

---

## Key Contributions

1. **Trust Framework** — Constraint-based model mapping Observability, Reversibility, and Blast Radius to autonomy levels, grounded in organizational trust literature
2. **Operational Patterns** — Eight enterprise patterns for agent-enhanced observability, triage, and remediation
3. **Governance Guidance** — Practical controls for deploying agents in regulated environments
4. **Evaluation Framework** — Metrics and methods for assessing agent-enhanced operations

---

## Structure

| Chapter | Title |
|---------|-------|
| 1 | Introduction |
| 2 | Literature Review |
| 3 | The Trust Problem |
| 4 | Trust Framework |
| 5 | Governance and Controls |
| 6 | Agent-Enhanced Observability |
| 7 | Agent-Enhanced Incident Triage |
| 8 | Agent-Assisted Remediation |
| 9 | Implementation |
| 10 | Evaluation Framework |
| 11 | Conclusion |

---

## The Trust Equation

```
Trust = (Observability × Reversibility × Blast Radius) / Autonomy
```

Derived from Mayer, Davis & Schoorman's (1995) integrative model of organizational trust:
- **Observability** ← Ability (can we verify competence?)
- **Reversibility** ← Integrity (are actions correctable?)  
- **Blast Radius** ← Benevolence (what's the potential harm?)

---

## Enterprise Patterns

1. **Agent-in-Toolbox** — Agents as tools, not autonomous actors
2. **Read-Only Default** — Start with observation, earn write access
3. **Federated NOC** — Local agents, central coordination
4. **Event-Driven Triage** — Reactive analysis, bounded scope
5. **Cascading Failure Coordination** — Multi-agent incident response
6. **Vault Integration** — Just-in-time credentials via PAM
7. **Git-Backed Memory** — Auditable, recoverable agent state
8. **ChatOps Delivery** — Human-in-the-loop via familiar interfaces

---

## Methodology

**Phase 1 (Year 1):** Framework and pattern development via Design Science Research, validated through practitioner review and constraint stress-testing.

**Phase 2 (Years 2-3):** Empirical validation through longitudinal industrial deployment with quantitative (MTTR, accuracy) and qualitative (trust, usability) measures.

---

## Practitioner Grounding

This is an industry doctorate drawing on 15 years of platform/infrastructure architecture:
- Chief Infrastructure Architect, SMIT (government sector)
- Domain Architect, Swedbank (financial services)
- Program Manager, TalTech (academic context)

---

## Repository Structure

```
├── README.md
├── OUTLINE.md
├── chapters/
│   ├── 01-introduction.md
│   ├── 02-literature-review.md
│   ├── ...
│   └── 11-conclusion.md
└── references/
    └── bibliography.md
```

---

## License

This work is shared for academic discussion. Please cite appropriately if referencing.

---

*Last updated: 2026-02-08*
