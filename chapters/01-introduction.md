# Chapter 1: Introduction

*Working draft — S. Vene, 2026-02-08*

---

## 1.1 The Operational Challenge at Scale

Large software organizations operate complex, distributed systems that are increasingly difficult to observe and operate reliably. Platform engineering and Site Reliability Engineering (SRE) practices have emerged to manage this complexity, supported by observability tooling and automation. Despite these advances, operational teams face persistent challenges:

- **Signal overload:** Modern systems generate telemetry volumes that exceed human processing capacity
- **Cognitive load:** Incident diagnosis requires correlating signals across dozens of services and data sources
- **Expertise bottleneck:** Senior engineers are required for complex diagnosis, creating 24/7 coverage challenges
- **Slow resolution:** Root cause analysis consumes 40-60% of incident time
- **Learning loss:** Incident knowledge doesn't transfer effectively to prevention

The DORA 2024 report found that reducing Mean Time to Recovery (MTTR) remains critical for organizational performance, yet operational toil continues to consume platform engineering resources.

---

## 1.2 The Agent Opportunity

Recent advances in large language models (LLMs) and agentic AI systems create opportunities to move beyond statistical AIOps approaches. Unlike rule-based automation or statistical anomaly detection, AI agents can:

- **Synthesize heterogeneous telemetry:** Correlate logs, metrics, traces, and change events
- **Reason about system behavior:** Form diagnostic hypotheses based on evidence
- **Retrieve institutional knowledge:** Access past incidents, runbooks, and documentation
- **Support or execute remediation:** From suggesting actions to executing approved runbooks

Raza et al. (2025) define Agentic AI as "Multi-Agent Systems powered by LLMs that exhibit autonomous planning, tool use, memory retention, and emergent reasoning capabilities, with or without human supervision." This capability set aligns precisely with operational challenges: agents excel at pattern recognition, correlation, and knowledge retrieval — the cognitive tasks that consume human responder time.

---

## 1.3 The Trust Problem

However, deploying autonomous agents in production systems creates trust challenges that existing frameworks don't address:

- **Probabilistic behavior:** Unlike deterministic automation, agents may produce different outputs for the same input
- **High-stakes context:** Production incidents have business impact; wrong actions make things worse
- **Limited oversight:** Agents may operate at 3am when human oversight is minimal
- **Unclear boundaries:** When should an agent act autonomously vs. defer to humans?

The DORA 2024 report found that 39% of respondents have little or no trust in AI-generated code. For AI-generated remediation actions in production, trust requirements are even higher.

This creates a fundamental tension: agents are most valuable where they can act autonomously (reducing human toil), but autonomous action requires trust that has not been established. Organizations need frameworks for calibrating appropriate autonomy levels and building trust incrementally.

---

## 1.4 Research Questions

This thesis investigates how AI agents can enhance operational aspects of platform engineering while maintaining appropriate trust and governance. The research questions are:

**RQ1:** How can agentic systems enhance observability by transforming raw telemetry into actionable operational understanding?

**RQ2:** To what extent can agentic reasoning improve incident triage and root cause analysis compared to existing SRE practices?

**RQ3:** Under what conditions can autonomous or semi-autonomous agents safely and effectively perform remediation actions in production systems?

**RQ4:** What trust and governance mechanisms enable organizations to calibrate appropriate autonomy levels for operational agents?

---

## 1.5 Methodology

This thesis employs Design Science Research (Hevner et al., 2004; Peffers et al., 2007), appropriate for developing artifacts (frameworks, patterns) that solve identified problems.

### 1.5.1 Design Science Approach

The research cycle:
1. **Problem identification:** Operational challenges in observability, triage, remediation
2. **Objective definition:** Trust framework, operational patterns, governance guidance
3. **Design and development:** Iterative framework and pattern development
4. **Demonstration:** Application to operational scenarios
5. **Evaluation:** Practitioner review, constraint stress-testing
6. **Communication:** This thesis

### 1.5.2 Grounding in Practice

The research is grounded in 15 years of platform and infrastructure architecture experience:
- Chief Infrastructure Architect at SMIT (government, 100+ teams)
- Domain Architect at Swedbank (financial services, regulated environment)
- Program Manager at TalTech (teaching, student feedback)
- Founder at Kleidia (NIS2 compliance context)

This experience shapes problem identification and provides the constraint space against which solutions are tested.

### 1.5.3 Limitations Acknowledged

This is practitioner-grounded research, not controlled experiments:
- Patterns are proposed based on experience and stress-testing, not empirical measurement
- The trust framework is grounded in theory (Mayer et al., 1995) but not empirically validated
- Contributions are offered as hypotheses for practice, not proven solutions

---

## 1.6 Contributions

This thesis makes four contributions:

1. **Trust Framework (Chapter 4):** A constraint-based model for calibrating agent autonomy, grounded in organizational trust theory. Given a target autonomy level, the framework specifies minimum safeguards required.

2. **Operational Patterns (Chapters 6-8):** Documented patterns for agent-enhanced observability, incident triage, and remediation, with autonomy levels and implementation guidance.

3. **Governance Guidance (Chapter 5):** Enterprise deployment patterns addressing data sovereignty, cost governance, and LLM infrastructure trust.

4. **Practitioner Validation (Chapter 10):** Honest assessment of limitations and future work required for empirical validation.

---

## 1.7 Scope and Delimitations

**Included:**
- Observability: transforming telemetry into understanding
- Incident triage: diagnosis, root cause analysis, hypothesis generation
- Remediation: runbook execution, rollback, scaling (with guardrails)
- Trust and governance for operational agents

**Excluded:**
- Design-time agent applications (architecture review, documentation generation)
- Build-time agent applications (code review, test generation)
- Foundation model development
- Fully autonomous operation without human oversight
- Purely statistical anomaly detection (not agentic)

---

## 1.8 Thesis Structure

**Part I: Foundations**
- Chapter 1: Introduction (this chapter)
- Chapter 2: Background and Literature Review

**Part II: Trust and Governance**
- Chapter 3: The Trust Problem
- Chapter 4: A Trust Framework for Operational Agents
- Chapter 5: Governance at Enterprise Scale

**Part III: Operational Patterns**
- Chapter 6: Agent-Enhanced Observability
- Chapter 7: Agent-Enhanced Incident Triage
- Chapter 8: Agent-Assisted Remediation

**Part IV: Implementation and Evaluation**
- Chapter 9: Implementation Approaches
- Chapter 10: Evaluation and Limitations
- Chapter 11: Conclusion

---

## References

- Hevner, A. R., March, S. T., Park, J., & Ram, S. (2004). Design science in information systems research. MIS Quarterly, 28(1), 75-105.
- Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. Academy of Management Review, 20(3), 709-734.
- Peffers, K., Tuunanen, T., Rothenberger, M. A., & Chatterjee, S. (2007). A design science research methodology. Journal of Management Information Systems, 24(3), 45-77.
- Raza, S., et al. (2025). TRiSM for Agentic AI. arXiv:2506.04133.
- Google Cloud. (2024). Accelerate State of DevOps Report 2024.

---

*This chapter establishes the problem, questions, methodology, and scope. Chapter 2 reviews the literature.*
