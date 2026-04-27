# Article 1 — Trust-Calibrated Autonomy for Operational AI Agents in Production Environments

**Subtitle:** A Design Science Framework and Practitioner Validation Protocol

**Author:** Siim Vene
**Affiliation:** Tallinn University of Technology (TalTech)
**Status:** Preprint. Practitioner validation phase pending TalTech ethics committee approval.
**Target journal:** Information and Software Technology (Q1)

## Abstract (structured)

**Context.** Production operations are becoming more complex as organizations rely on distributed systems, platform engineering, and observability stacks that require high-tempo interpretation of logs, metrics, traces, and service dependencies. AIOps is moving from anomaly detection and alert correlation toward LLM-based agents that can summarize telemetry, generate hypotheses, and support root cause analysis and incident handling.

**Objective.** This paper addresses a socio-technical question that remains underdeveloped in current AIOps literature: how should organizations calibrate appropriate autonomy levels for AI agents operating in production environments, where action quality, reversibility, and blast radius matter as much as model capability?

**Method.** Design science research developing a reusable artifact — the Operational Trust Calibration Framework — through structured literature synthesis across software operations, observability, AIOps, trust in automation, human-AI interaction, and AI governance. Review protocol informed by SE review guidance and PRISMA 2020. Practitioner interviews are not yet completed; the validation component is presented as a structured protocol rather than as completed empirical results.

**Results.** A vendor-neutral framework combining three operational constraints (Observability, Reversibility, Blast Radius) with a governance envelope of approval authority, auditability, override capability, policy fit, evidence requirements, and staged deployment rules. Four autonomy levels (L0–L3) ranging from summarize-only support to conditional bounded autonomy, with broad unsupervised autonomy explicitly excluded from production.

**Conclusion.** Trust in operational AI should not be modeled as a general attitude toward intelligent tools. In production operations, trust must be calibrated as a bounded organizational decision about what an AI agent is allowed to know, recommend, and do under specific technical and governance conditions.

## Core artifact

The Operational Trust Calibration Framework rests on the **ORB kernel**:

> **Appropriate Autonomy ∝ (Observability × Reversibility) / Blast Radius**

This is a structured decision heuristic, not a numerical formula. As observability and reversibility increase, a higher autonomy level becomes justifiable. As blast radius increases, the acceptable autonomy ceiling drops.

### Four autonomy levels

| Level | Name | Description |
|---|---|---|
| **L0** | Observe and summarize | Retrieve, correlate, summarize incident evidence; no recommendations or actions |
| **L1** | Recommend and justify | Suggest hypotheses, rank causes, propose runbook steps; humans select all actions |
| **L2** | Execute bounded reversible actions with authorization | Predefined reversible tasks after explicit per-action human approval |
| **L3** | Conditional bounded autonomy | Pre-approved envelope, no per-incident approval, requires high O × R, low B, complete logging |

Broad unsupervised autonomy (often labeled "L4 / Trusted / Full Autonomy" in vendor frameworks) is **deliberately excluded from production** in this framework. In regulated or public-impact environments, the burden of justification for such autonomy is far higher than current literature supports.

### Six-element governance envelope

1. **Approval authority** — explicit specification of who may authorize which action class under which conditions
2. **Auditability and provenance** — recommendations, evidence sources, prompts, tool calls, approvals, and actions logged for review and accountability; RAG-retrieved context provenance and freshness must themselves be auditable
3. **Override and kill-switch capability** — humans must be able to stop, reverse, or suspend agent action pathways
4. **Policy fit** — some incident types (security events, cross-organizational outages, stateful transaction anomalies) may be categorically excluded from automation
5. **Evidence requirements** — explicit threshold tied to telemetry quality, runbook fit, operational context; not just plausible narrative
6. **Deployment staging** — offline analysis → replay → shadow mode → recommendation mode → bounded execution with authorization → conditional bounded autonomy where justified

## Validation phase

**Method:** Semi-structured expert interviews (60–75 min) with embedded incident-scenario stress testing.

**Sample:** 10–14 experts, purposive maximum-variation sampling. Recruited primarily from SMIT (Estonian Ministry of the Interior IT Centre) and comparable organizations. Roles: platform/infrastructure architects, crisis managers, platform engineers, security operations representatives, critical service owners, risk and audit professionals.

**Scenarios:** Four incident scenarios (A–D) covering non-critical post-deploy degradation, citizen-facing auth instability, suspected security incident with potentially tampered logs, and high-blast-radius critical-service intervention.

**Timeline:** May–December 2026, contingent on TalTech ethics committee approval (application drafted, pending submission).

**Analytic approach:** (1) comparative matrix of role × scenario × ORB ratings × chosen autonomy tier × required controls; (2) thematic coding of practitioner justifications.

## Key citations

Trust theory: Mayer et al. (1995), McKnight et al. (1998), Schoorman et al. (2007), Lee & See (2004), Hoff & Bashir (2015), Glikson & Woolley (2020), Steinmetz et al. (2025), Regona et al. (2026).

Observability and platform engineering: Beyer et al. (2016, 2018), Sridharan (2018), Skelton & Pais (2019), DORA (2024), OpenTelemetry Authors (n.d.).

AIOps and LLM-based incident management: Dang et al. (2019), Notaro et al. (2021), Ahmed et al. (2023), Chen et al. (2024, 2025), Roy et al. (2024), Zhang et al. (2024, 2025).

Human–AI interaction and appropriate reliance: Amershi et al. (2019), Bansal et al. (2021), Schemmer et al. (2023), Vasconcelos et al. (2023), Cabrera et al. (2023), Miller (2019).

Governance: NIST AI RMF (2023), NIST GenAI Profile (2024a), NIST CSF 2.0 (2024b, 2025), ISO 31000 (2018), ISO/IEC 42001 (2023).

DSR method: Hevner et al. (2004), Peffers et al. (2007), Gregor & Hevner (2013), Wieringa (2014). Lit-review protocol: Kitchenham (2004), Kitchenham & Charters (2007), Brereton et al. (2007), Petersen et al. (2015), Wohlin (2014), Wohlin et al. (2020), Page et al. (2021).

## Files

- `preprint.pdf` — current preprint version, PDF
- `preprint.docx` — current preprint version, editable source

## Version history

| Date | Version | Note |
|---|---|---|
| 2026-04-27 | preprint | Initial preprint added to repo. Validation protocol drafted, ethics application drafted, scenarios A–D written. Interview phase pending IRB. |
