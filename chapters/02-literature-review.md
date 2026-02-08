# Chapter 2: Background & Literature Review (Draft)

*Working draft — S. Vene, 2026-02-07*

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

### 2.2.3 Session-Based vs In-Memory Orchestration

A fourth paradigm, not well-covered in current literature, is **session-based orchestration** where agents run as isolated sessions with persistent state:

| Property | In-Memory | Session-Based |
|----------|-----------|---------------|
| State persistence | Lost on failure | Survives restarts |
| Isolation | Shared process | Separate sessions |
| Auditability | Requires instrumentation | Native (session logs) |
| Latency | Low (ms) | Higher (seconds) |
| Recovery | Complex | Simple (resume session) |

**Research gap:** Current surveys focus on in-memory architectures. The tradeoffs of session-based orchestration for trust and safety are underexplored.

### 2.2.4 Standards for Agent Interoperability

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

### 2.3.2 The TRiSM Framework

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

### 2.3.3 Risk Taxonomy for Agentic AI

Raza et al. (2025) identify unique threat vectors in multi-agent systems:

| Risk Category | Description | Example |
|--------------|-------------|---------|
| **Coordination failures** | Agents fail to synchronize, produce inconsistent results | Builder and reviewer working on different code versions |
| **Prompt injection** | Malicious inputs manipulate agent behavior | Data contains instructions that override agent goals |
| **Memory poisoning** | Corrupted context propagates through system | Wrong information in shared memory affects all agents |
| **Agent collusion** | Agents coordinate against intended goals | Agents "agree" to skip validation steps |
| **Emergent misbehavior** | Unexpected behavior from agent interactions | Reward hacking in multi-agent reward structures |

### 2.3.4 Toward a Trust Framework

The literature provides components for reasoning about trust but lacks an integrated model. Building on TRiSM's pillars and ATF's progressive autonomy concepts, Chapter 5 develops a Trust Equation framework that relates observability, reversibility, and blast radius control to acceptable autonomy levels. This framework synthesizes the academic foundations reviewed here with practical patterns from industry experience.

### 2.3.5 Zero Trust Architecture for Agentic Systems

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

### 2.3.6 Human-AI Trust Calibration

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

### 2.5.3 Incident Response Automation and SOAR

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
2. **Progressive trust models** — theoretical concept lacking operational frameworks
3. **Platform engineering integration** — generic agent frameworks don't address GitOps/CI/CD specifics
4. **Regulatory compliance** — no clear guidance for NIS2/AI Act compliance with agentic systems
5. **Trust quantification** — no standardized approach to measuring trust in agentic systems
6. **Multi-agent transparency** — how to provide visibility into coordinated agent behavior
7. **Platform incident response** — SOAR concepts not yet adapted for infrastructure operations

---

## References (Draft)

- Cloud Security Alliance (2026). Agentic Trust Framework: Zero Trust Governance for AI Agents.

- Hoff, K. A., & Bashir, M. (2015). Trust in automation: Integrating empirical evidence on factors that influence trust. *Human Factors*, 57(3), 407-434.

- IEEE (2024-2026). P3394: Standard for Universal Message Format for LLM-based Agent Communication.

- IEEE (2024-2026). P3428: Standard for Modular Agent Architecture.

- NIST (2020). SP 800-207: Zero Trust Architecture.

- Raza, S., Sapkota, R., Karkee, M., & Emmanouilidis, C. (2025). TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems. *arXiv preprint arXiv:2506.04133*.

- Singapore IMDA (2025). Model AI Governance Framework for Agentic AI.

---

*Status: Second draft. Expanded with IEEE standards, Zero Trust, trust calibration, and SOAR sections (2026-02-08).*
