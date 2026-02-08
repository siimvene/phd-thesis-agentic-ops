# Chapter 2 Additions (Draft)

*Sections to integrate into 02-literature-review.md*

---

## 2.2.4 Standards for Agent Interoperability

### IEEE P3394: Universal Message Format for LLM Agents

The IEEE P3394 standard (in development, 2024-2026) addresses a critical gap in multi-agent systems: interoperability. As organizations deploy agents from multiple vendors and frameworks, the lack of standardized communication protocols creates integration challenges.

P3394 defines:
- **Universal Message Format (UMF)** — structured JSON/Protocol Buffer schemas for agent-to-agent communication
- **Session management** — standardized handshakes, context passing, and termination
- **Capability advertisement** — agents declare available tools and competencies
- **Error handling** — consistent error codes and recovery protocols

### IEEE P3428: Modular Agent Architecture

Complementing P3394, IEEE P3428 specifies a modular agent architecture supporting:
- **Plug-and-play integration** — agents can be composed without custom adapters
- **Lifecycle management** — standardized states (initializing, ready, executing, suspended, terminated)
- **Adaptive learning interfaces** — how agents update their behavior based on feedback

**Relevance to this thesis:** These emerging standards provide a foundation for the enterprise deployment patterns in Chapter 9. However, neither standard addresses trust calibration or governance—gaps this thesis aims to fill.

---

## 2.3.5 Zero Trust Architecture for Agentic Systems

### From Network Security to Agent Security

Zero Trust Architecture (ZTA), codified in NIST SP 800-207 (2020), has become the dominant security paradigm for enterprise networks. The core principle—"never trust, always verify"—applies directly to agentic AI:

| ZTA Principle | Network Application | Agent Application |
|--------------|--------------------|--------------------|
| Verify explicitly | Authenticate every request | Verify every agent action against policy |
| Least privilege | Minimal network access | Minimal tool/data access per task |
| Assume breach | Segment networks | Isolate agent sessions, limit blast radius |

### Cloud Security Alliance Agentic Trust Framework

The CSA's Agentic Trust Framework (2026) extends Zero Trust to autonomous agents, proposing five governance questions:

1. **Identity** — How do we authenticate agents and verify their provenance?
2. **Behavior** — How do we monitor and constrain agent actions in real-time?
3. **Data** — How do we control what data agents can access and generate?
4. **Segmentation** — How do we isolate agents to limit failure propagation?
5. **Incident Response** — How do we detect, respond to, and recover from agent misbehavior?

The framework proposes an "Intern to Principal" maturity model where agents earn expanded privileges through demonstrated reliability—a concept this thesis develops further in the Trust Equation framework (Chapter 4).

---

## 2.3.6 Human-AI Trust Calibration

### The Calibration Problem

Trust calibration refers to the alignment between a user's trust in a system and the system's actual trustworthiness. Miscalibration manifests in two failure modes:

- **Overtrust** — Users rely on agents for tasks beyond their competence, leading to errors
- **Undertrust** — Users fail to leverage capable agents, negating productivity benefits

Research (2022-2026) identifies factors affecting calibration:

### Dispositional, Situational, and Learned Trust

Building on Hoff & Bashir's (2015) three-layer trust model:

| Trust Layer | Description | Calibration Mechanism |
|------------|-------------|----------------------|
| **Dispositional** | General tendency to trust automation | Education, organizational culture |
| **Situational** | Context-specific trust adjustments | Real-time transparency, status displays |
| **Learned** | Trust developed through experience | Consistent performance, graceful failures |

### Transparency as Trust Mechanism

Agent transparency—making reasoning visible to users—has emerged as a key calibration mechanism. Studies show:
- Explanations increase trust when agents are competent
- Explanations *decrease* trust when agents make errors (appropriate calibration)
- The timing and detail level of explanations affect calibration quality

**Research gap:** Most transparency research examines single-agent systems. How transparency works in multi-agent environments—where users must trust coordination, not just individual decisions—remains underexplored.

### Real-Time Trust Indicators

Emerging approaches include:
- **Confidence displays** — agents communicate uncertainty to users
- **Predictive indicators** — agents forecast likely outcomes before acting
- **Physiological monitoring** — detecting user trust states via behavioral/biometric signals

**Relevance to this thesis:** The Trust Equation framework (Chapter 4) operationalizes these concepts by mapping observable properties (Observability, Reversibility, Blast Radius) to appropriate Autonomy levels.

---

## 2.5.3 Incident Response Automation and SOAR

### Security Orchestration, Automation, and Response (SOAR)

SOAR platforms have evolved from rule-based playbook execution to LLM-enhanced cognitive automation:

| Generation | Characteristics | Limitations |
|-----------|-----------------|-------------|
| **SOAR 1.0** (2018-2022) | Rule-based playbooks, deterministic | Brittle, requires extensive rule authoring |
| **SOAR 2.0** (2022-2024) | ML-enhanced triage, anomaly detection | Black-box decisions, limited reasoning |
| **SOAR 3.0** (2024-2026) | LLM-driven analysis, multi-step reasoning | Hallucination risk, grounding challenges |

### LLM-Enhanced Incident Response

Recent advances (2024-2026) demonstrate LLMs capabilities in:
- **Log synthesis** — converting raw telemetry into human-readable narratives
- **Root cause analysis** — correlating events across systems to identify failure chains
- **Remediation suggestion** — proposing fixes with confidence levels
- **Runbook generation** — creating executable playbooks from incident descriptions

### Challenges and Gaps

The literature identifies persistent challenges:

1. **Grounding** — LLMs may suggest actions inconsistent with actual system state
2. **Robustness** — adversarial inputs can manipulate LLM-based triage
3. **Accountability** — unclear responsibility when LLM-suggested actions cause harm
4. **Human-AI handoff** — when and how to escalate from automated to human response

**Research gap:** Current SOAR literature focuses on security operations centers. Application to platform engineering incidents (deployment failures, service degradation, configuration drift) is underexplored—a gap Chapters 7 and 8 address.

---

## 2.6 Research Gaps (Updated)

The literature review reveals several gaps this thesis aims to address:

1. **Session-based orchestration** — underexplored paradigm with potential trust advantages
2. **Progressive trust models** — theoretical concept lacking operational frameworks
3. **Platform engineering integration** — generic agent frameworks don't address GitOps/CI/CD specifics
4. **Regulatory compliance** — no clear guidance for NIS2/AI Act compliance with agentic systems
5. **Trust quantification** — no standardized approach to measuring trust in agentic systems
6. **Multi-agent transparency** — how to provide visibility into coordinated agent behavior
7. **Platform incident response** — SOAR concepts not yet adapted for infrastructure operations

---

*Integration notes:*
- *§2.2.4 fits after existing §2.2.3 (Session-Based Orchestration)*
- *§2.3.5-2.3.6 fit after existing §2.3.4 (Toward a Trust Framework)*
- *§2.5.3 fits after existing §2.5.2 (Trust-Specific Metrics)*
- *Updated §2.6 replaces existing research gaps section*
