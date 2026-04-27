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

1. **Operational Trust Calibration Framework** — A heuristic linking three operational constraints (Observability, Reversibility, Blast Radius) and a six-element governance envelope to four autonomy levels (L0–L3), grounded in organizational trust theory (Mayer et al., 1995). Published as **Article 1** (see [`articles/`](articles/)).
2. **Eight Enterprise Patterns** — Architectural patterns for safely deploying operational agents (Chapter 9 §9.7); supplemented by additional domain-level patterns in Chapters 5–8 covering governance, observability, triage, and remediation.
3. **Governance Guidance** — Practical controls for deploying agents in regulated environments, with emphasis on public-sector ICT context.
4. **Validation Protocol** — A practitioner-validation design (semi-structured expert interviews with scenario stress testing) operationalised for the empirical phase of the thesis (see Chapter 10 §10.4.1 and [`articles/article-1-trust-calibrated-autonomy/`](articles/article-1-trust-calibrated-autonomy/)).

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

## The ORB Kernel

```
                          Observability × Reversibility
Appropriate Autonomy ∝ ──────────────────────────────────
                                 Blast Radius
```

A structured decision heuristic, **not** a numerical formula. As observability and reversibility increase, a higher autonomy level becomes justifiable. As blast radius increases, the acceptable autonomy ceiling drops.

Derived from Mayer, Davis & Schoorman's (1995) integrative model of organizational trust through an explicit substitution argument: AI agents have demonstrable *Ability* but no assessable *Benevolence* or *Integrity*, so trust must rely on structural safeguards instead of trustee character.

| Mayer et al. Factor | Agentic system translation |
|---|---|
| Ability | Assumed (the agent can execute) |
| Benevolence | Cannot assess → **Observability** (can we see what it is doing?) |
| Integrity | Cannot assess → **Reversibility** + **Blast Radius** (can we recover, and how bad is it if we cannot?) |

The kernel is wrapped in a six-element **governance envelope** (approval authority, auditability + RAG provenance, override / kill-switch, policy fit, evidence requirements, deployment staging) that determines under what conditions a given autonomy level is permissible.

### Four autonomy levels

| Level | Name |
|---|---|
| **L0** | Observe and summarize |
| **L1** | Recommend and justify |
| **L2** | Execute bounded reversible actions with authorization |
| **L3** | Conditional bounded autonomy |

L4 / "Trusted" / "Full Autonomy" is **deliberately excluded from production** in this framework. See Chapter 4 §4.3.5 for the full argument.

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
