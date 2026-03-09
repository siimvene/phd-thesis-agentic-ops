# Agent-Enhanced Platform Engineering: Trust Frameworks and Patterns for Observability and Incident Response

**Candidate:** Siim Vene (Industrial Doctorate, TalTech)  
**Potential supervisors:**  
**Date:** February 2026 (revised)

**Working topic:** Agent-enhanced platform engineering with a core contribution on trust calibration for operational autonomy

---

## 1. Background and motivation

Modern organisations depend on complex distributed systems (microservices, Kubernetes-based platforms, cloud services, hybrid infrastructures) whose failures are difficult to predict and diagnose. As a result, production operations often require intensive human sensemaking across multiple tools, data sources, and teams (Beyer et al., 2016).

Two operational movements address this complexity. First, **Site Reliability Engineering (SRE)** formalises reliability goals and practices such as toil reduction, incident management, and continuous improvement (Beyer et al., 2016; Beyer et al., 2018). Second, **platform engineering** focuses on building internal platforms as products, reducing cognitive load through standardisation and "golden paths" (DORA, 2024).

**Observability** has evolved from monitoring into a broader capability to infer system state from telemetry such as traces, metrics, and logs (Sridharan, 2018). Open standards (for example, OpenTelemetry specifications) support consistent instrumentation and semantic conventions across heterogeneous systems (OpenTelemetry, 2025). However, richer telemetry does not automatically reduce cognitive workload. During incidents, teams still need to turn signals into explanations and decisions under time pressure (Sridharan, 2018).

Recent advances in large language models (LLMs) and LLM-based agents create opportunities to move beyond earlier AIOps approaches that focus mainly on anomaly detection. Agents can potentially synthesise heterogeneous telemetry, reason iteratively, generate and test hypotheses, and support parts of incident response workflows (De la Cruz Cabello et al., 2025; Yao et al., 2022).

**The central barrier is trust.** The operational value of agents increases with autonomy, but organisational acceptability depends on governance, assurance, and calibrated reliance (Lee & See, 2004). This proposal positions trust calibration as the core scientific and practical challenge for agent-enhanced platform engineering.

---

## 2. Research problem and gap

Current observability and AIOps tooling improves signal collection and visualisation, but provides limited support for cross-system reasoning, contextual diagnosis, and adaptive remediation at scale (De la Cruz Cabello et al., 2025; Sridharan, 2018). Incident response remains heavily human-driven, resource intensive, and difficult to standardise across organisations (Beyer et al., 2016; Nelson et al., 2025).

At the same time, the emergence of agentic AI raises new socio-technical risks. Agents may be most useful when they can act, but autonomous action in production amplifies the consequences of errors and creates governance obligations. Existing work in organisational trust and human factors shows that trust drives reliance, and that miscalibration can lead to misuse (over-reliance) or disuse (underuse), both of which harm outcomes (Lee & See, 2004; Mayer et al., 1995).

Levels-of-automation research further shows that automation changes work allocation, coordination, and oversight requirements (Parasuraman et al., 2000).

**The gap is therefore not simply adoption. The gap is a lack of empirically grounded trust frameworks and reusable design patterns that allow organisations to introduce operational agents safely, decide which autonomy is appropriate, and justify changes with measurable evidence.**

---

## 3. Aim, objectives, and research questions

**Aim:** Develop and evaluate trust frameworks and patterns for agent-enhanced platform engineering that improve observability, incident triage, and remediation while maintaining appropriate governance.

### Objectives:
1. Identify limitations of current platform engineering and SRE practices in operational contexts.
2. Develop a trust calibration framework that defines autonomy levels, required evidence, and governance constraints for operational agents.
3. Design patterns for agent-enhanced observability, incident triage, and remediation.
4. Integrate and validate patterns in operational environments, using mixed-method evidence.
5. Derive generalisable principles applicable across organisational maturity levels.

### Research questions:

**RQ1:** How can agentic systems transform telemetry and operational context into actionable operational understanding without degrading reliability through ungrounded inference?

**RQ2:** To what extent do agent-supported triage and diagnosis workflows improve incident outcomes (for example MTTR, diagnostic accuracy, recurrence) compared to current SRE baselines?

**RQ3:** Under what conditions can semi-autonomous agents safely and effectively perform remediation actions in production, and what autonomy boundaries are required?

**RQ4:** What trust and governance mechanisms enable organisations to calibrate appropriate autonomy over time, supporting increased automation where justified while preventing unsafe delegation?

---

## 4. Conceptual framing: trust calibration for operational autonomy

This research treats trust as a managed relationship between human stakeholders (for example on-call engineers and risk owners), the operational agent, and the incident context (blast radius, reversibility, criticality).

Organisational trust theory frames trust as willingness to accept vulnerability based on perceptions of **ability, benevolence, and integrity** (Mayer et al., 1995). In operational automation, trust should be calibrated to actual system capability to avoid unsafe reliance patterns (Lee & See, 2004).

The proposed framework will model autonomy as **staged operational agency** (Parasuraman et al., 2000):

| Level | Name | Description |
|-------|------|-------------|
| 1 | **Advisory autonomy** | Summarise telemetry, propose hypotheses and next steps |
| 2 | **Procedural autonomy** | Run bounded diagnostics and assemble evidence with full audit logging |
| 3 | **Controlled action autonomy** | Propose remediations and execute only reversible actions under approval |
| 4 | **Conditional autonomous remediation** | Execute pre-authorised runbooks under strict policy constraints, with rollback triggers and accountable logs |

Trust calibration will be operationalised through evidence channels such as:
- Measured performance
- Transparency and explainability
- Grounding and provenance (including retrieval augmentation where applicable)
- Governance controls aligned with recognised frameworks for AI risk and incident response (Lewis et al., 2020; NIST, 2023; Nelson et al., 2025)

---

## 5. Methodology and evaluation

The programme follows **design science research** because it aims to produce actionable artefacts (frameworks and patterns) and evaluate them in realistic contexts (Hevner et al., 2004; Peffers et al., 2007; Wieringa, 2014).

### Phase 1 (Year 1): Framework and pattern development
- Structured literature synthesis and requirements consolidation
- Design of the trust calibration framework and pattern catalogue
- Practitioner review and constraint testing against enterprise requirements

### Phase 2 (Years 2–3): Empirical validation
- Longitudinal industrial deployment across organisations of differing maturity
- **Quantitative measures:** MTTR, time-to-diagnosis, diagnostic precision, incident recurrence
- **Qualitative measures:** perceived trust calibration, workload and workflow fit, governance acceptance (Yin, 2018)

---

## 6. Dissemination and publication plan

The project targets one peer-reviewed publication per year, aligned to the research phases.

### 2026 (framework paper)
**Topic:** Trust calibration framework for operational AI agents in platform engineering (design science framing)

**Potential Q1 journals:**
- Empirical Software Engineering
- Information and Software Technology
- ACM Computing Surveys (if positioned as survey/review)

### 2027 (pattern and pilot paper)
**Topic:** Design patterns for agent-enhanced observability and incident triage with pilot evaluation evidence

**Potential Q1 journals:**
- Journal of Systems and Software
- IEEE Software
- Empirical Software Engineering

### 2028 (longitudinal evaluation paper)
**Topic:** Longitudinal evaluation of trust-calibrated operational autonomy, focusing on operational impact and governance acceptance

**Potential Q1 journals:**
- IEEE Transactions on Software Engineering
- ACM Transactions on Software Engineering and Methodology

---

## 7. Feasibility and ethics (summary)

The study is feasible due to the candidate's long-term experience in platform and infrastructure roles and access to relevant industrial contexts.

Operational data will be handled with strict anonymisation and access controls. Safety is addressed by staged autonomy, human oversight, rollback mechanisms, and separation between research prototypes and production decision authority (Nelson et al., 2025).

---

## References (APA)

Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.). (2016). *Site reliability engineering: How Google runs production systems*. O'Reilly Media.

Beyer, B., Jones, C., Petoff, J., Murphy, N. R., & Rensin, D. K. (Eds.). (2018). *The site reliability workbook: Practical ways to implement SRE*. O'Reilly Media.

De la Cruz Cabello, M., Prince Sales, T., & Machado, M. R. (2025). AIOps for log anomaly detection in the era of LLMs: A systematic literature review. *Intelligent Systems with Applications, 28*, 200608. https://doi.org/10.1016/j.iswa.2025.200608

DORA. (2024). *Accelerate State of DevOps Report 2024*. Google Cloud.

Hevner, A. R., March, S. T., Park, J., & Ram, S. (2004). Design science in information systems research. *MIS Quarterly, 28*(1), 75–106.

Lee, J. D., & See, K. A. (2004). Trust in automation: Designing for appropriate reliance. *Human Factors, 46*(1), 50–80. https://doi.org/10.1518/hfes.46.1.50_30392

Lewis, P., Perez, E., Piktus, A., Petroni, F., Karpukhin, V., Goyal, N., Küttler, H., Lewis, M., Yih, W.-T., Rocktäschel, T., Riedel, S., & Kiela, D. (2020). Retrieval-augmented generation for knowledge-intensive NLP tasks. *Advances in Neural Information Processing Systems*.

Mayer, R. C., Davis, J. H., & Schoorman, F. D. (1995). An integrative model of organizational trust. *Academy of Management Review, 20*(3), 709–734.

National Institute of Standards and Technology. (2023). *Artificial intelligence risk management framework (AI RMF 1.0)*.

Nelson, A., Rekhi, S., Souppaya, M., & Scarfone, K. (2025). *Incident response recommendations and considerations for cybersecurity risk management* (SP 800-61r3). National Institute of Standards and Technology.

OpenTelemetry. (2025). *OpenTelemetry documentation and specifications*.

Parasuraman, R., Sheridan, T. B., & Wickens, C. D. (2000). A model for types and levels of human interaction with automation. *IEEE Transactions on Systems, Man, and Cybernetics Part A: Systems and Humans, 30*(3), 286–297. https://doi.org/10.1109/3468.844354

Peffers, K., Tuunanen, T., Rothenberger, M. A., & Chatterjee, S. (2007). A design science research methodology for information systems research. *Journal of Management Information Systems, 24*(3), 45–77. https://doi.org/10.2753/MIS0742-1222240302

Sridharan, C. (2018). *Distributed systems observability: A guide to building robust systems*. O'Reilly Media.

Vaidhyanathan, K., & Taibi, D. (2026). Agentic AI frameworks under the microscope: What works, what doesn't. *IEEE Software, 43*(1), 133–138. https://doi.org/10.1109/MS.2025.3622209

Wieringa, R. J. (2014). *Design science methodology for information systems and software engineering*. Springer. https://doi.org/10.1007/978-3-662-43839-8

Yao, S., Zhao, J., Yu, D., Du, N., Shafran, I., Narasimhan, K., & Cao, Y. (2022). ReAct: Synergizing reasoning and acting in language models. *arXiv*.

Yin, R. K. (2018). *Case study research and applications: Design and methods* (6th ed.). SAGE.
