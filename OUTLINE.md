# Thesis Outline: Agent-Enhanced Platform Engineering

## Working Title

**"Agent-Enhanced Platform Engineering: Trust Frameworks and Patterns for Observability and Incident Response"**

---

## Thesis Statement

> AI agents create opportunities to transform how platform teams handle observability, incident triage, and remediation. However, deploying autonomous agents in production systems requires trust frameworks that don't yet exist. This thesis proposes a constraint-based trust framework grounded in organizational trust theory, derives practical patterns for agent-enhanced incident response, and provides governance guidance for safe operational autonomy. Drawing on 15 years of platform engineering practice and Design Science methodology, it offers actionable guidance for organizations seeking to deploy agents in operational contexts.

---

## Research Questions

*Aligned with original doctoral proposal:*

**RQ1:** How can agentic systems enhance observability by transforming raw telemetry into actionable operational understanding?

**RQ2:** To what extent can agentic reasoning improve incident triage and root cause analysis compared to existing SRE practices?

**RQ3:** Under what conditions can autonomous or semi-autonomous agents safely and effectively perform remediation actions in production systems?

*Extended question (trust contribution):*

**RQ4:** What trust and governance mechanisms enable organizations to calibrate appropriate autonomy levels for operational agents?

---

## Core Contributions

1. **Trust Framework** — Constraint-based model for calibrating agent autonomy, grounded in Mayer et al.'s organizational trust theory. Actionable: given autonomy level, what safeguards are required?

2. **Operational Patterns** — Documented patterns for agent-enhanced observability, triage, and remediation in SRE/platform contexts.

3. **Governance Guidance** — Enterprise deployment patterns including data sovereignty, cost governance, and LLM infrastructure trust.

4. **Practitioner Validation** — Patterns stress-tested against real enterprise constraints (100+ teams, PAM, compliance).

---

## Chapter Structure

### Part I: Foundations

#### Chapter 1: Introduction
- The observability and incident response challenge at scale
- Why agents now: LLM capabilities meet operational needs
- Research questions and methodology (Design Science + practitioner experience)
- Thesis contributions
- Scope: observability, triage, remediation (not full lifecycle)

#### Chapter 2: Background & Literature Review
- Platform engineering and SRE: definitions and practices
- Current state: AIOps, statistical anomaly detection, limitations
- AI agents: architectures, capabilities, trust literature (Mayer et al.)
- Research gaps: trust frameworks, operational patterns

### Part II: Trust and Governance

#### Chapter 3: The Trust Problem
- Deterministic vs. probabilistic automation
- Why traditional automation trust doesn't transfer
- Organizational trust theory applied to agents

#### Chapter 4: A Trust Framework for Operational Agents
- Grounding in Mayer, Davis & Schoorman (1995)
- Components: Observability, Reversibility, Blast Radius, Autonomy
- Constraint-based approach: minimum safeguards per autonomy level
- Application workflow with worked examples
- Limitations and validation needs

#### Chapter 5: Governance at Enterprise Scale
- Zero Trust principles for agents
- Trusting the LLM infrastructure layer (data sovereignty)
- Token cost governance
- Progressive autonomy and demotion triggers
- Regulatory context (NIS2, AI Act)

### Part III: Operational Patterns

#### Chapter 6: Agent-Enhanced Observability
- From telemetry to understanding
- Pattern: Contextual log synthesis
- Pattern: Cross-system correlation
- Pattern: Natural language system queries
- Anti-patterns and failure modes

#### Chapter 7: Agent-Enhanced Incident Triage
- Current state of incident response
- Pattern: Automated initial triage
- Pattern: Root cause hypothesis generation
- Pattern: Similar incident retrieval
- Human-agent collaboration in diagnosis

#### Chapter 8: Agent-Assisted Remediation
- The autonomy question for remediation
- Pattern: Runbook execution with guardrails
- Pattern: Rollback recommendation and execution
- Pattern: Capacity adjustment
- When NOT to automate: the human-required boundary

### Part IV: Implementation and Evaluation

#### Chapter 9: Implementation Approaches
- Architectural options (embedded, sidecar, centralized)
- Session-based vs. in-memory orchestration
- Enterprise deployment patterns (Agent-in-Toolbox, Read-Only Default, etc.)
- Integration with existing tooling (K8s, Terraform, PagerDuty)

#### Chapter 10: Evaluation and Limitations
- Validation approach for design science
- Practitioner review of patterns
- Limitations: not empirically validated at scale
- Future work: longitudinal studies with MTTR metrics

#### Chapter 11: Conclusion
- Answering the research questions
- Summary of contributions
- The road ahead for agent-enhanced operations

---

## Methodology

**Design Science Research (Hevner et al., 2004; Peffers et al., 2007)**

| Phase | Activity |
|-------|----------|
| Problem Identification | Operational challenges in observability, triage, remediation |
| Objective Definition | Trust framework, operational patterns, governance guidance |
| Design & Development | Framework and pattern development through iteration |
| Demonstration | Application to operational scenarios |
| Evaluation | Practitioner review, stress-testing against constraints |
| Communication | This thesis |

**Grounding in Practice:**
- 15 years platform/infrastructure architecture (Swedbank, SMIT)
- Current: Chief Infrastructure Architect, GitOps/K8s at scale
- Constraints from government, financial services, regulated environments

**Limitations acknowledged:**
- Practitioner experience, not controlled experiments
- Patterns proposed, not empirically validated across organizations
- Offered as hypotheses for practice

---

## Alignment with Original Proposal

| Proposal Element | Current Status |
|-----------------|----------------|
| Focus on observability, triage, remediation | ✓ Refocused (was full lifecycle) |
| Design Science methodology | ✓ Maintained |
| Trust/governance | ✓ Expanded to core contribution |
| Empirical evaluation (MTTR, etc.) | ⚠️ Deferred to future work |
| Industrial case studies | ⚠️ Replaced with practitioner patterns |

**Trade-off accepted:** Less empirical rigor, more practical framework. The Trust Framework is actionable now; empirical validation is future work.

---

## Timeline

| Phase | Period | Focus |
|-------|--------|-------|
| Year 1 | 2026 | Literature review, trust framework, initial patterns |
| Year 2 | 2027 | Pattern refinement, practitioner validation, pilot studies |
| Year 3 | 2028 | Empirical validation (if feasible), writing, defense |

---

*Revised: 2026-02-08 — Hybrid approach: Trust Framework + refocus on observability/incident/remediation*
