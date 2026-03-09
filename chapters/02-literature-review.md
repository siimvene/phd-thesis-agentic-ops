# Chapter 2: Background & Literature Review (Draft)

*Working draft — S. Vene, 2026-02-08*

---

## 2.1 Positioning This Review

Chapter 1 traced the evolution of platform engineering through four phases: manual operations, Infrastructure as Code, GitOps, and now agent-enhanced systems. This literature review examines the academic and industry research that informs each of these phases, with particular focus on the emerging body of work on AI agents in enterprise contexts.

---

## 2.2 AI Agent Architectures

### 2.2.1 Defining Agentic AI

Following Raza et al. (2025), we define Agentic AI as:

> "Multi-Agent Systems (MAS) powered by LLMs that exhibit autonomous planning, tool use, memory retention, and emergent reasoning capabilities, with or without human supervision."

Key characteristics distinguishing agentic AI from traditional automation:
- **Autonomous planning** — decomposing goals into sub-tasks
- **Tool use** — invoking external APIs and systems
- **Memory retention** — maintaining context across interactions
- **Emergent reasoning** — behavior not explicitly programmed

### 2.2.2 Multi-Agent System Architectures

Three dominant paradigms have emerged:

| Paradigm | Representative Framework | Key Characteristics |
|----------|-------------------------|---------------------|
| **Graph-based** | LangGraph | Explicit state machines, deterministic routing, high auditability |
| **Role-based** | CrewAI | Agents as team members with roles/goals, intuitive mental model |
| **Conversational** | AutoGen | Agents communicate via messages, emergent coordination |

Each paradigm makes different tradeoffs between control and flexibility:

```
Control ←————————————————→ Flexibility
LangGraph          CrewAI          AutoGen
```

### 2.2.3 Cognitive Architectures for Language Agents (CoALA)

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

### 2.2.4 Session-Based vs In-Memory Orchestration

A fourth paradigm, not well-covered in current literature, is **session-based orchestration** where agents run as isolated sessions with persistent state:

| Property | In-Memory | Session-Based |
|----------|-----------|---------------|
| State persistence | Lost on failure | Survives restarts |
| Isolation | Shared process | Separate sessions |
| Auditability | Requires instrumentation | Native (session logs) |
| Latency | Low (ms) | Higher (seconds) |
| Recovery | Complex | Simple (resume session) |

**Research gap:** Current surveys focus on in-memory architectures. The tradeoffs of session-based orchestration for trust and safety are underexplored.

### 2.2.5 Standards for Agent Interoperability

#### IEEE P3394: Universal Message Format for LLM Agents

The IEEE P3394 standard (in development, 2024-2026) addresses a critical gap in multi-agent systems: interoperability. As organizations deploy agents from multiple vendors and frameworks, the lack of standardized communication protocols creates integration challenges.

P3394 defines:
- **Universal Message Format (UMF)** — structured JSON/Protocol Buffer schemas for agent-to-agent communication
- **Session management** — standardized handshakes, context passing, and termination
- **Capability advertisement** — agents declare available tools and competencies
- **Error handling** — consistent error codes and recovery protocols

#### IEEE P3428: Modular Agent Architecture

Complementing P3394, IEEE P3428 specifies a modular agent architecture supporting:
- **Plug-and-play integration** — agents can be composed without custom adapters
- **Lifecycle management** — standardized states (initializing, ready, executing, suspended, terminated)
- **Adaptive learning interfaces** — how agents update their behavior based on feedback

**Relevance to this thesis:** These emerging standards provide a foundation for the enterprise deployment patterns in Chapter 9. However, neither standard addresses trust calibration or governance—gaps this thesis aims to fill.

---

## 2.3 Trust and Trustworthiness in Autonomous Systems

### 2.3.1 Defining Trust vs Trustworthiness

Raza et al. (2025) make a critical distinction:

> "**Trust** refers to a user's willingness to rely on an AI system, while **trustworthiness** denotes whether the system consistently behaves in a safe, fair, and predictable manner, thereby deserving that trust."

This distinction is crucial for enterprise adoption:
- Users may **trust** a system that is not **trustworthy** (dangerous)
- A **trustworthy** system may not be **trusted** (adoption failure)

Building trustworthy systems is necessary but not sufficient — organizations must also build appropriate levels of trust.

### 2.3.2 Foundational Trust Theory

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

### 2.3.3 The TRiSM Framework

Gartner's AI TRiSM (Trust, Risk, and Security Management) framework, adapted for agentic AI by Raza et al. (2025), comprises four pillars:

**Pillar 1: Explainability**
- Decision provenance — why did the agent take this action?
- Chain-of-thought visibility
- Cross-agent communication transparency

**Pillar 2: ModelOps**
- Agent lifecycle management
- Version control for agent configurations
- Deployment pipelines for agent updates
- Rollback capabilities

**Pillar 3: Security & Privacy**
- Authentication between agents
- Data access controls
- Prompt injection defense
- Privacy-preserving computation

**Pillar 4: Governance**
- Policy enforcement
- Compliance monitoring
- Human oversight mechanisms
- Accountability structures

### 2.3.4 Risk Taxonomy for Agentic AI

Raza et al. (2025) identify unique threat vectors in multi-agent systems:

| Risk Category | Description | Example |
|--------------|-------------|---------|
| **Coordination failures** | Agents fail to synchronize, produce inconsistent results | Builder and reviewer working on different code versions |
| **Prompt injection** | Malicious inputs manipulate agent behavior | Data contains instructions that override agent goals |
| **Memory poisoning** | Corrupted context propagates through system | Wrong information in shared memory affects all agents |
| **Agent collusion** | Agents coordinate against intended goals | Agents "agree" to skip validation steps |
| **Emergent misbehavior** | Unexpected behavior from agent interactions | Reward hacking in multi-agent reward structures |

### 2.3.5 Toward a Trust Framework

The literature provides components for reasoning about trust but lacks an integrated model. Building on TRiSM's pillars, Lee & See's calibration concepts, and ATF's progressive autonomy, Chapter 4 develops a Trust Equation framework that relates observability, reversibility, and blast radius control to acceptable autonomy levels. This framework synthesizes the academic foundations reviewed here with practical patterns from industry experience.

### 2.3.6 Zero Trust Architecture for Agentic Systems

#### From Network Security to Agent Security

Zero Trust Architecture (ZTA), codified in NIST SP 800-207 (2020), has become the dominant security paradigm for enterprise networks. The core principle—"never trust, always verify"—applies directly to agentic AI:

| ZTA Principle | Network Application | Agent Application |
|--------------|--------------------|--------------------|
| Verify explicitly | Authenticate every request | Verify every agent action against policy |
| Least privilege | Minimal network access | Minimal tool/data access per task |
| Assume breach | Segment networks | Isolate agent sessions, limit blast radius |

#### Cloud Security Alliance Agentic Trust Framework

The CSA's Agentic Trust Framework (2026) extends Zero Trust to autonomous agents, proposing five governance questions:

1. **Identity** — How do we authenticate agents and verify their provenance?
2. **Behavior** — How do we monitor and constrain agent actions in real-time?
3. **Data** — How do we control what data agents can access and generate?
4. **Segmentation** — How do we isolate agents to limit failure propagation?
5. **Incident Response** — How do we detect, respond to, and recover from agent misbehavior?

The framework proposes an "Intern to Principal" maturity model where agents earn expanded privileges through demonstrated reliability—a concept this thesis develops further in the Trust Equation framework (Chapter 4).

### 2.3.7 Human-AI Trust Calibration

#### The Calibration Problem

Trust calibration refers to the alignment between a user's trust in a system and the system's actual trustworthiness. Miscalibration manifests in two failure modes:

- **Overtrust** — Users rely on agents for tasks beyond their competence, leading to errors
- **Undertrust** — Users fail to leverage capable agents, negating productivity benefits

#### Dispositional, Situational, and Learned Trust

Building on Hoff & Bashir's (2015) three-layer trust model:

| Trust Layer | Description | Calibration Mechanism |
|------------|-------------|----------------------|
| **Dispositional** | General tendency to trust automation | Education, organizational culture |
| **Situational** | Context-specific trust adjustments | Real-time transparency, status displays |
| **Learned** | Trust developed through experience | Consistent performance, graceful failures |

#### Transparency as Trust Mechanism

Agent transparency—making reasoning visible to users—has emerged as a key calibration mechanism. Studies show:
- Explanations increase trust when agents are competent
- Explanations *decrease* trust when agents make errors (appropriate calibration)
- The timing and detail level of explanations affect calibration quality

**Research gap:** Most transparency research examines single-agent systems. How transparency works in multi-agent environments—where users must trust coordination, not just individual decisions—remains underexplored.

### 2.3.8 Measuring Trust in Automation

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

## 2.4 Regulatory Context

### 2.4.1 EU AI Act

The EU AI Act (2024) establishes risk-based regulation:
- **Unacceptable risk** — prohibited (e.g., social scoring)
- **High risk** — strict requirements (safety-critical systems)
- **Limited risk** — transparency obligations
- **Minimal risk** — no restrictions

Agentic AI in platform engineering likely falls into "limited" or "high" risk depending on deployment context. Key requirements:
- Human oversight mechanisms
- Technical documentation
- Risk management systems
- Accuracy, robustness, cybersecurity

### 2.4.2 NIS2 Directive

The NIS2 Directive (2024) affects ~10,000 EU organizations classified as "essential" or "important" entities. Requirements relevant to agentic AI:
- Incident response capabilities
- Supply chain security (including AI components)
- Risk management measures
- Reporting obligations

**Research opportunity:** NIS2 compliance frameworks do not yet address agentic AI specifically. Organizations need guidance on how autonomous agents fit into their compliance posture.

### 2.4.3 AI Risk Management Frameworks

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

## 2.5 Evaluation Metrics for Agentic Systems

### 2.5.1 Existing Metrics

Traditional ML metrics (accuracy, precision, recall) are insufficient for agentic systems. Raza et al. (2025) propose:

**Component Synergy Score (CSS)**
- Measures quality of inter-agent collaboration
- Captures whether agents work together effectively
- Penalizes coordination failures

**Tool Utilization Efficacy (TUE)**
- Measures efficiency of tool/API usage
- Captures whether agents use appropriate tools
- Penalizes unnecessary or incorrect tool calls

### 2.5.2 Trust-Specific Metrics

Additional metrics needed for trust assessment:

| Metric | Description | Measurement |
|--------|-------------|-------------|
| **Predictability Index** | How often does agent behavior match expectations? | Correct predictions / Total predictions |
| **Recovery Time** | How quickly can failed agent actions be reversed? | Time from failure detection to clean state |
| **Blast Radius Score** | What's the maximum impact of an agent failure? | Affected systems × Impact severity |
| **Escalation Rate** | How often do agents appropriately escalate to humans? | Escalations / Situations requiring escalation |

### 2.5.3 LLM-Enhanced AIOps

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

### 2.5.4 Incident Response Automation and SOAR

#### Security Orchestration, Automation, and Response (SOAR)

SOAR platforms have evolved from rule-based playbook execution to LLM-enhanced cognitive automation:

| Generation | Characteristics | Limitations |
|-----------|-----------------|-------------|
| **SOAR 1.0** (2018-2022) | Rule-based playbooks, deterministic | Brittle, requires extensive rule authoring |
| **SOAR 2.0** (2022-2024) | ML-enhanced triage, anomaly detection | Black-box decisions, limited reasoning |
| **SOAR 3.0** (2024-2026) | LLM-driven analysis, multi-step reasoning | Hallucination risk, grounding challenges |

#### LLM-Enhanced Incident Response

Recent advances (2024-2026) demonstrate LLMs capabilities in:
- **Log synthesis** — converting raw telemetry into human-readable narratives
- **Root cause analysis** — correlating events across systems to identify failure chains
- **Remediation suggestion** — proposing fixes with confidence levels
- **Runbook generation** — creating executable playbooks from incident descriptions

#### Hamadanian et al. (2023): AI-Driven Incident Management

This HotNets paper argues that LLMs can fundamentally reshape incident management but emphasises:

> "Building an AI incident helper demands careful attention to evidence, interaction design, and organisational integration."

**Key Insight:** Workflow redesign is substantial—agents don't drop into existing processes unchanged. Successful deployment requires rethinking how humans and agents coordinate during incidents.

#### Challenges and Gaps

The literature identifies persistent challenges:

1. **Grounding** — LLMs may suggest actions inconsistent with actual system state
2. **Robustness** — adversarial inputs can manipulate LLM-based triage
3. **Accountability** — unclear responsibility when LLM-suggested actions cause harm
4. **Human-AI handoff** — when and how to escalate from automated to human response

**Research gap:** Current SOAR literature focuses on security operations centers. Application to platform engineering incidents (deployment failures, service degradation, configuration drift) is underexplored—a gap Chapters 7 and 8 address.

---

## 2.6 Research Gaps

The literature review reveals several gaps this thesis aims to address:

1. **Session-based orchestration** — underexplored paradigm with potential trust advantages
2. **Progressive trust models** — theoretical concept (Lee & See, Parasuraman) lacking operational frameworks
3. **Platform engineering integration** — generic agent frameworks don't address GitOps/CI/CD specifics
4. **Regulatory compliance** — no clear guidance for NIS2/AI Act compliance with agentic systems
5. **Trust quantification** — Jian et al. scale exists but not applied to agentic platform operations
6. **Multi-agent transparency** — how to provide visibility into coordinated agent behavior
7. **Platform incident response** — SOAR concepts not yet adapted for infrastructure operations
8. **Autonomy promotion criteria** — no validated mechanism for evidence-based autonomy advancement

---

## References

### Foundational Trust Theory

- Lee, J. D., & See, K. A. (2004). Trust in automation: Designing for appropriate reliance. *Human Factors*, 46(1), 50-80. doi:10.1518/hfes.46.1.50_30392

- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. *Academy of Management Review*, 20(3), 709-734. doi:10.2307/258792

- Parasuraman, R., Sheridan, T. B., & Wickens, C. D. (2000). A model for types and levels of human interaction with automation. *IEEE Transactions on Systems, Man, and Cybernetics—Part A*, 30(3), 286-297. doi:10.1109/3468.844354

### Trust Measurement

- Jian, J.-Y., Bisantz, A. M., & Drury, C. G. (2000). Foundations for an empirically determined scale of trust in automated systems. *International Journal of Cognitive Ergonomics*, 4(1), 53-71. doi:10.1207/S15327566IJCE0401_04

- Hart, S. G., & Staveland, L. E. (1988). Development of NASA-TLX (Task Load Index). In P. A. Hancock & N. Meshkati (Eds.), *Human mental workload* (pp. 139-183). Elsevier.

- Hoff, K. A., & Bashir, M. (2015). Trust in automation: Integrating empirical evidence on factors that influence trust. *Human Factors*, 57(3), 407-434.

### Agent Architectures

- Sumers, T. R., Yao, S., Narasimhan, K., & Griffiths, T. L. (2024). Cognitive architectures for language agents. *Transactions on Machine Learning Research*. arXiv:2309.02427

- Raza, S., Sapkota, R., Karkee, M., & Emmanouilidis, C. (2025). TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems. *arXiv preprint arXiv:2506.04133*.

### AIOps and Incident Management

- Zhang, L., et al. (2025). A survey of AIOps in the era of large language models. arXiv:2507.12472

- De la Cruz Cabello, M., Prince Sales, T., & Machado, M. R. (2025). AIOps for log anomaly detection in the era of LLMs: A systematic literature review. *Intelligent Systems with Applications*, 28, 200608. doi:10.1016/j.iswa.2025.200608

- Hamadanian, P., et al. (2023). A holistic view of AI-driven network incident management. *HotNets '23*. doi:10.1145/3626111.3628176

### Standards and Frameworks

- Cloud Security Alliance (2026). Agentic Trust Framework: Zero Trust Governance for AI Agents.

- IEEE (2024-2026). P3394: Standard for Universal Message Format for LLM-based Agent Communication.

- IEEE (2024-2026). P3428: Standard for Modular Agent Architecture.

- Singapore IMDA (2025). Model AI Governance Framework for Agentic AI.

### Regulatory and Governance

- NIST (2020). SP 800-207: Zero Trust Architecture.

- NIST (2023). AI Risk Management Framework (AI RMF 1.0). NIST AI 100-1. doi:10.6028/NIST.AI.100-1

- NIST (2024). Artificial intelligence risk management framework: Generative artificial intelligence profile. NIST AI 600-1. doi:10.6028/NIST.AI.600-1

- ENISA (2025). Technical implementation guidance on cybersecurity risk management measures (Version 1.0).

---

*Status: Third draft. Integrated foundational trust theory (Mayer, Lee & See, Parasuraman), trust measurement instruments (Jian, NASA-TLX), CoALA architecture, and expanded AIOps literature (2026-02-08).*
