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

---

## 2.6 Research Gaps

The literature review reveals several gaps this thesis aims to address:

1. **Session-based orchestration** — underexplored paradigm with potential trust advantages
2. **Progressive trust models** — theoretical concept lacking empirical validation
3. **Platform engineering integration** — generic agent frameworks don't address GitOps/CI/CD specifics
4. **Regulatory compliance** — no clear guidance for NIS2/AI Act compliance with agentic systems
5. **Trust quantification** — no standardized approach to measuring trust in agentic systems

---

## References (Draft)

- Raza, S., Sapkota, R., Karkee, M., & Emmanouilidis, C. (2025). TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems. *arXiv preprint arXiv:2506.04133*.

- Singapore IMDA (2025). Model AI Governance Framework for Agentic AI.

- [Additional references to be added]

---

*Status: First draft. Needs expansion of sections 2.1 (historical context), 2.4 (regulatory detail), and additional citations throughout.*
