# PhD Proposal v4 - Deep Research Version
## Agent-Enhanced Platform Engineering: Trust Calibration Frameworks and Patterns

**Source:** ChatGPT Deep Research, 2026-02-08
**Status:** Reference document - extracted key elements for integration

---

## Core Contribution Framing

**Two-part contribution:**
1. **Trust Calibration Framework** - conceptual model + implementable autonomy levels + evidence/governance requirements
2. **Pattern Catalogue** - reusable solutions for operational agents in platforms

---

## Trust Calibration Framework (Operationalised)

### Key Insight
> "Trust calibration is measurable—not merely anecdotal"

### Three Measurement Approaches Combined

1. **Perceived Trust Instruments**
   - Jian, Bisantz & Drury (2000) - empirically developed trust-in-automation scales
   - DOI: 10.1207/S15327566IJCE0401_04

2. **Behavioural Reliance Metrics**
   - Acceptance of agent recommendations
   - Override rates
   - Compliance with agent-produced workflows
   - Based on Lee & See (2004) reliance framing

3. **Workload Indicators**
   - Incident-time task switching
   - Time spent correlating sources
   - NASA-TLX for subjective workload (Hart & Staveland, 1988)

### Framework Components

The trust calibration framework defines:

1. **Operational Autonomy Levels** - from advisory assistance to constrained action execution

2. **Evidence Requirements** for each level:
   - Performance evidence (accuracy, success rates)
   - Grounding/provenance evidence (retrieved sources, traceability)
   - Safety evidence (blast radius constraints, rollback mechanisms, audit completeness)

3. **Governance Constraints** - aligned to incident response and AI risk frameworks

### Implementation Terms (Not Abstract Labels)
- Which tools the agent may call
- What changes it may propose
- What approvals are required
- What emergency stop/rollback policies apply

---

## Pattern Catalogue Structure

Four categories organised by operational intent and risk profile:

### 1. Agent-Enhanced Observability
- Evidence synthesis
- Trace-log-metric correlation
- Narrative timelines
- Aligned with OpenTelemetry

### 2. Incident Triage and Diagnosis
- Hypothesis generation
- Tool-invoked evidence gathering
- Structured case files
- Based on ReAct patterns

### 3. Controlled Remediation
- Runbook execution under policy constraints
- Safe-change and rollback patterns
- Human approval gates
- Aligned with NIST SP 800-61r3

### 4. Trust Calibration Operations
- Evidence dashboards
- Audit trails
- Decision provenance
- "Autonomy promotion" criteria

---

## New References (Not in v3)

### Trust Measurement
- **Jian, Bisantz & Drury (2000)** - Foundations for an Empirically Determined Scale of Trust in Automated Systems. *International Journal of Cognitive Ergonomics*. DOI: 10.1207/S15327566IJCE0401_04

- **Hart & Staveland (1988)** - Development of NASA-TLX (Task Load Index). In *Human Mental Workload*. Elsevier.

### Agentic Architectures
- **Sumers, Yao, Narasimhan & Griffiths (2024)** - Cognitive Architectures for Language Agents (CoALA). *Transactions on Machine Learning Research*. arXiv:2309.02427

- **Vaidhyanathan & Taibi (2026)** - Agentic AI Frameworks Under the Microscope: What Works, What Doesn't. *IEEE Software*, 43(1). DOI: 10.1109/MS.2025.3622209

### AIOps/LLM4AIOps
- **De la Cruz Cabello, Prince Sales & Machado (2025)** - AIOps for log anomaly detection in the era of LLMs: A systematic literature review. *Intelligent Systems with Applications*, 28. DOI: 10.1016/j.iswa.2025.200608

- **Zhang et al. (2025)** - A Survey of AIOps in the Era of Large Language Models. arXiv:2507.12472

- **Hamadanian et al. (2023)** - A Holistic View of AI-driven Network Incident Management. *HotNets '23*. DOI: 10.1145/3626111.3628176

- **Jones et al. (2025)** - Analysing the role of LLMs in cybersecurity incident management. *International Journal of Information Security*. DOI: 10.1007/s10207-025-01144-7

### Governance/Standards
- **NIST AI 600-1** - AI Risk Management Framework: Generative AI Profile (2024)
- **IEEE P3394** - Standard for Large Language Model Agent Interface (2023)
- **ENISA (2025)** - Technical Implementation Guidance on Cybersecurity Risk Management Measures (NIS2)

---

## Research Design

**Paradigm:** Design Science Research (Hevner et al. 2004; Peffers et al. 2007)

**Strategy:** Longitudinal, multi-case evaluation

**Key Insight:**
> "Incident response is socio-technical and context-dependent; agents must be evaluated under realistic constraints rather than only in synthetic benchmarks"

### Artefacts to Build

1. Trust calibration framework (conceptual + implementable)
2. Pattern catalogue (observability, triage, remediation, trust ops)
3. Reference architecture description
4. Measurement framework mapping
5. Governance mapping (aligns to IR and AI frameworks)

---

## Research Gap Articulation

Four interlocking deficiencies:

1. **Narrow task evaluation** - AIOps research evaluates subtasks, not end-to-end workflows
2. **Missing guardrails** - Agentic AI lacks operational safety controls
3. **Theory-practice gap** - Trust/automation theory not operationalised into platform controls
4. **Pattern void** - Governance frameworks don't specify design patterns for agent-enhanced IR

---

## Publication Targets (Q1 Journals)

| Year | Focus | Potential Outlets |
|------|-------|------------------|
| 2026 | Framework + research agenda | Empirical Software Engineering, IST, ACM Computing Surveys |
| 2027 | Pattern catalogue + pilots | JSS, IEEE Software, ESE |
| 2028 | Longitudinal evaluation | IEEE TSE, TOSEM, IEEE TNSM |
| 2029 | Synthesis/governance | Computers & Security, IJIS, IEEE ToR |

---

## Key Quotes for Thesis

> "The central challenge is not simply building capable agents but building **governable autonomy** supported by evidence, auditability, and human-centred reliance mechanisms."

> "Trust is not a soft add-on in operational automation; it is a **determinant of reliance and safety**."

> "Autonomy is treated as **staged rather than binary**."

> "The dominant bottleneck in incident response is no longer 'lack of data' but **sensemaking and safe decision-making**."

---

## Integration Notes

### What to adopt from this document:
- [ ] Jian et al. trust measurement scale (operationalises trust)
- [ ] CoALA framework reference (cognitive architectures)
- [ ] Four-category pattern structure
- [ ] "Autonomy promotion criteria" concept
- [ ] NIST AI 600-1 GenAI profile reference
- [ ] Research gap articulation (four deficiencies)

### What we already have that's stronger:
- Trust Equation (Observability × Reversibility × Blast Radius) / Autonomy
- OpenClaw as concrete implementation example
- Industry practitioner perspective (not just academic)

### Synthesis needed:
- Merge Jian et al. measurement with our Trust Equation
- Add CoALA to Chapter 2 literature review
- Expand pattern catalogue with four-category structure
