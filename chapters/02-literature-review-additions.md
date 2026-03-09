# Chapter 2 Additions — From Deep Research Document

*Integrate these sections into 02-literature-review.md*

---

## Insert into Section 2.2.2 (after Multi-Agent System Architectures)

### 2.2.X Cognitive Architectures for Language Agents (CoALA)

Sumers et al. (2024) provide a unifying conceptual framework for language-based agents through the Cognitive Architectures for Language Agents (CoALA) model. CoALA structures agent systems via three core components:

**1. Modular Memory**
- Working memory (current context)
- Episodic memory (past experiences)  
- Semantic memory (learned knowledge)
- Procedural memory (skills and tools)

**2. Structured Action Spaces**
- Internal actions (reasoning, planning, retrieval)
- External actions (tool use, environment interaction)
- Action selection policies

**3. Decision Processes**
- Grounded decision-making
- Explicit reasoning traces
- Evidence-based action selection

**Relevance to Trust:** CoALA's modular architecture enables fine-grained observability—each memory type and action can be audited independently. This supports the Trust Equation framework (Chapter 4) by providing natural observation points for monitoring agent behavior.

---

## Insert into Section 2.3.5 (after Zero Trust for Agents, before Human-AI Trust Calibration)

### 2.3.X Foundational Trust Theory

#### Organisational Trust: Mayer, Davis & Schoorman (1995)

The seminal organisational trust model identifies three antecedents of trust:

| Antecedent | Definition | Agent Equivalent |
|------------|------------|------------------|
| **Ability** | Skills and competencies enabling influence | Task completion accuracy, tool proficiency |
| **Benevolence** | Belief trustee wants good for trustor | Alignment with operator goals, no hidden agendas |
| **Integrity** | Adherence to principles trustor finds acceptable | Policy compliance, predictable behavior |

> "Trust is the willingness of a party to be vulnerable to the actions of another party based on the expectation that the other will perform a particular action important to the trustor, irrespective of the ability to monitor or control that other party."

**Application:** This model explains why *capability alone* is insufficient for agent adoption. Organisations must also perceive that agents are *aligned* (benevolence) and *predictable* (integrity).

#### Trust in Automation: Lee & See (2004)

Lee & See's framework is foundational for understanding human-automation trust:

**Key Concepts:**

1. **Appropriate Reliance** — Trust should match system capability
   - *Misuse* (overtrust) — relying when system is inadequate
   - *Disuse* (undertrust) — failing to rely when system is adequate
   - *Abuse* — using automation improperly

2. **Trust Calibration** — Alignment between trust and trustworthiness
   - *Resolution* — sensitivity to changes in trustworthiness
   - *Specificity* — granularity of trust judgments

3. **Bases of Trust:**
   - *Performance* — current behavior
   - *Process* — understanding of mechanisms
   - *Purpose* — perceived intent/design goals

**Critical Insight:**
> "Trust in automation should be designed for appropriate reliance, because misuse and disuse reduce performance and can increase risk."

This framing directly motivates the staged autonomy approach: rather than maximising trust, the goal is *calibrating* trust to actual capability.

#### Levels of Automation: Parasuraman, Sheridan & Wickens (2000)

Parasuraman et al. provide a structured model for automation across four stages:

| Stage | Function | Low Automation | High Automation |
|-------|----------|----------------|-----------------|
| 1 | Information Acquisition | Human gathers | System gathers |
| 2 | Information Analysis | Human interprets | System interprets |
| 3 | Decision Selection | Human decides | System recommends/decides |
| 4 | Action Implementation | Human acts | System acts |

**Key Insight:** Automation does not simply replace human work—it *transforms* it. High automation at Stage 4 (action) may increase cognitive load at Stage 3 (decision oversight).

**Application to Agent Autonomy Levels:**

| Autonomy Level | Stage 1 | Stage 2 | Stage 3 | Stage 4 |
|----------------|---------|---------|---------|---------|
| L0: Manual | Human | Human | Human | Human |
| L1: Advisory | System | System | Human | Human |
| L2: Supervised | System | System | System (recommend) | Human |
| L3: Constrained | System | System | System | System (constrained) |
| L4: Autonomous | System | System | System | System |

---

## Insert into Section 2.3.6 (expand Human-AI Trust Calibration)

### 2.3.X Measuring Trust in Automation

#### Empirical Trust Scales: Jian, Bisantz & Drury (2000)

Jian et al. developed an empirically validated scale for measuring trust in automated systems, addressing the lack of standardised measurement instruments. The scale comprises 12 items across two factors:

**Trust Factor (7 items):**
- The system is reliable
- The system is dependable  
- I can trust the system
- I am confident in the system
- The system provides security
- The system has integrity
- The system is predictable

**Distrust Factor (5 items):**
- The system is deceptive
- The system behaves in an underhanded manner
- I am suspicious of the system's intent
- The system is harmful
- The system is unreliable

**Application:** This scale enables quantitative trust measurement in agent evaluation studies. Combined with behavioral metrics (override rates, acceptance rates), it provides a multi-method assessment approach.

#### Workload Assessment: NASA-TLX

Hart & Staveland (1988) developed the NASA Task Load Index for subjective workload assessment across six dimensions:

| Dimension | Description |
|-----------|-------------|
| Mental Demand | Thinking, deciding, calculating required |
| Physical Demand | Physical activity required |
| Temporal Demand | Time pressure experienced |
| Performance | Success in accomplishing goals |
| Effort | Work required to achieve performance |
| Frustration | Insecurity, stress, annoyance |

**Relevance:** Agents should reduce operator workload, not merely shift it. NASA-TLX provides a validated instrument for measuring whether agent assistance actually reduces cognitive burden during incidents.

---

## Insert into Section 2.5.3 (expand SOAR/Incident Response)

### 2.5.X LLM-Enhanced AIOps: Recent Surveys

#### Zhang et al. (2025): AIOps in the Era of LLMs

A comprehensive survey of LLM applications in IT operations identifies four capability categories:

| Category | Traditional AIOps | LLM-Enhanced AIOps |
|----------|------------------|-------------------|
| **Detection** | Statistical anomaly detection | Context-aware anomaly explanation |
| **Diagnosis** | Rule-based correlation | Multi-step reasoning, hypothesis generation |
| **Prediction** | Time-series forecasting | Natural language failure prediction |
| **Remediation** | Playbook execution | Adaptive action suggestion |

**Key Finding:** LLMs shift the frontier from *prediction* to *reasoning + action*, but amplify risk: if agents can influence production systems, trust and governance become as important as diagnostic quality.

**Research Gap Identified:** Evaluation methods remain inconsistent; many studies lack real operational validation. Without repeatable evaluation designs that measure operational outcomes and constrain risk, organisations cannot justify increasing autonomy.

#### De la Cruz Cabello et al. (2025): Log Anomaly Detection SLR

A systematic literature review of log anomaly detection in the LLM era identifies:

**Persistent Challenges:**
- Data drift between training and production
- Reproducibility constraints across environments
- Limited integration into end-to-end operational decision-making

**Implication:** Even state-of-the-art log analysis provides detection, not action. The gap between "anomaly detected" and "incident resolved" requires reasoning and trust frameworks this thesis addresses.

#### Hamadanian et al. (2023): AI-Driven Incident Management

This HotNets paper argues that LLMs can fundamentally reshape incident management but emphasises:

> "Building an AI incident helper demands careful attention to evidence, interaction design, and organisational integration."

**Key Insight:** Workflow redesign is substantial—agents don't drop into existing processes unchanged. Successful deployment requires rethinking how humans and agents coordinate during incidents.

---

## Insert into Section 2.4 (expand Regulatory Context)

### 2.4.X AI Risk Management Frameworks

#### NIST AI RMF 1.0 and GenAI Profile (2024)

The NIST AI Risk Management Framework provides lifecycle risk management functions:

| Function | Description | Agent Application |
|----------|-------------|-------------------|
| **Govern** | Cultivate culture of risk management | Establish agent governance policies |
| **Map** | Understand context and risks | Document agent capabilities and limitations |
| **Measure** | Analyse and track risks | Monitor agent behavior and outcomes |
| **Manage** | Prioritise and act on risks | Implement controls, escalation, rollback |

The GenAI Profile (NIST AI 600-1) extends these functions specifically for generative AI systems, addressing:
- Content provenance
- Confabulation/hallucination risks
- Data privacy in training/inference
- Human-AI interaction design

**Gap:** Neither framework specifies concrete design patterns for operational agents in platform engineering contexts—a gap this thesis addresses through the pattern catalogue (Chapters 6-8).

#### ENISA NIS2 Implementation Guidance (2025)

The European Union Agency for Cybersecurity provides technical implementation guidance mapping NIS2 requirements to evidence and controls. Key requirements relevant to agentic AI:

| NIS2 Requirement | Agent Implication |
|------------------|-------------------|
| Incident handling | Agents must support (not bypass) incident response processes |
| Business continuity | Agent failures must not cascade to service unavailability |
| Supply chain security | Agent dependencies (LLM providers, tools) require assessment |
| Risk assessment | Agent behavior must be included in risk analysis |

---

## Updated References Section (add these)

### Foundational Trust Theory
- Lee, J. D., & See, K. A. (2004). Trust in automation: Designing for appropriate reliance. *Human Factors*, 46(1), 50-80. doi:10.1518/hfes.46.1.50_30392

- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. *Academy of Management Review*, 20(3), 709-734. doi:10.2307/258792

- Parasuraman, R., Sheridan, T. B., & Wickens, C. D. (2000). A model for types and levels of human interaction with automation. *IEEE Transactions on Systems, Man, and Cybernetics—Part A*, 30(3), 286-297. doi:10.1109/3468.844354

### Trust Measurement
- Jian, J.-Y., Bisantz, A. M., & Drury, C. G. (2000). Foundations for an empirically determined scale of trust in automated systems. *International Journal of Cognitive Ergonomics*, 4(1), 53-71. doi:10.1207/S15327566IJCE0401_04

- Hart, S. G., & Staveland, L. E. (1988). Development of NASA-TLX (Task Load Index). In P. A. Hancock & N. Meshkati (Eds.), *Human mental workload* (pp. 139-183). Elsevier.

### Agent Architectures
- Sumers, T. R., Yao, S., Narasimhan, K., & Griffiths, T. L. (2024). Cognitive architectures for language agents. *Transactions on Machine Learning Research*. arXiv:2309.02427

### AIOps/Incident Management
- Zhang, L., et al. (2025). A survey of AIOps in the era of large language models. arXiv:2507.12472

- De la Cruz Cabello, M., Prince Sales, T., & Machado, M. R. (2025). AIOps for log anomaly detection in the era of LLMs: A systematic literature review. *Intelligent Systems with Applications*, 28, 200608. doi:10.1016/j.iswa.2025.200608

- Hamadanian, P., et al. (2023). A holistic view of AI-driven network incident management. *HotNets '23*. doi:10.1145/3626111.3628176

### Governance Frameworks
- NIST (2024). Artificial intelligence risk management framework: Generative artificial intelligence profile (NIST AI 600-1). doi:10.6028/NIST.AI.600-1

- ENISA (2025). Technical implementation guidance on cybersecurity risk management measures (Version 1.0).

---

*These additions strengthen the theoretical grounding and provide quantitative measurement instruments for the evaluation chapter.*
