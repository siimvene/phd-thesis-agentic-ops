# Practitioner Case: Detective Pattern for Incident Investigation

**Source:** Zoltán Szikora, LinkedIn (March 2026)
**Tags:** #observability #triage #multi-agent #structural-constraints

---

## Summary

A practitioner implementation of parallelized agent-assisted incident investigation using a two-tier architecture:

- **Orchestrator (Claude 4.6 Sonnet):** Routes investigations, forms hypotheses, synthesizes findings
- **Sub-agents (Gemini 3 Flash):** Mine Application Insights logs via KQL, return structured findings

Key architectural constraint: sub-agents are explicitly **not allowed to guess** the cause — they return raw findings only. The orchestrator handles reasoning and cross-checks hypotheses against secondary data sources before reporting.

---

## Architecture

```
Alert Trigger
     │
     ▼
┌─────────────────┐
│  Detective      │  (Claude 4.6 - reasoning)
│  Orchestrator   │
└────────┬────────┘
         │ dispatches
    ┌────┴────┬────────┬────────┐
    ▼         ▼        ▼        ▼
┌───────┐ ┌───────┐ ┌───────┐ ┌───────┐
│ App   │ │ Infra │ │ Auth  │ │ ...   │  (Gemini 3 Flash - mining)
│ Logs  │ │ Logs  │ │ Logs  │ │       │
└───┬───┘ └───┬───┘ └───┬───┘ └───┬───┘
    │         │        │        │
    └─────────┴────────┴────────┘
                  │
                  ▼ structured findings
         ┌────────────────┐
         │  Orchestrator  │
         │  synthesizes   │
         └───────┬────────┘
                 │ cross-check
                 ▼
         ┌────────────────┐
         │ Secondary data │
         │ (metrics, etc) │
         └───────┬────────┘
                 │
                 ▼
         RCA Report (validated)
```

---

## Key Design Principles

### 1. Structural Hallucination Control

> "Sub-agents return raw, structured findings—but are not allowed to 'guess' the cause"

This is a structural constraint, not a prompt instruction. The sub-agents lack the capability to hypothesize — that's reserved for the orchestrator tier.

### 2. Tool Removal Over Instructions

> "Removing tools is more reliable than adding instructions"

Echoes the broader thesis argument that trust should be grounded in architectural constraints rather than behavioral promises. If an agent cannot perform an action, no prompt injection or reasoning failure can cause it to perform that action.

### 3. Verification Loop

The orchestrator forms a hypothesis but cross-checks against a second data source before reporting. This is a built-in verification step that reduces false-positive RCAs.

---

## Trust Model Mapping

| Dimension | Score | Rationale |
|-----------|-------|-----------|
| Observability | High | Direct telemetry access, KQL queries, structured output |
| Reversibility | N/A | Read-only system, no mutations |
| Blast Radius | Low | Investigation only, no remediation actions |
| Autonomy | Medium | Parallelized investigation, but reports to human |

**Effective Trust:** High for investigation scope — the system is appropriately constrained to its competence boundary.

---

## Claimed Results

- 60% reduction in manual toil
- 40% faster incident investigation time
- "Secure, Zero-Trust infrastructure by design"

---

## Gaps (for thesis critique)

1. **No remediation autonomy:** System produces RCA but does not act on it
2. **No approval boundaries:** What happens when RCA suggests remediation?
3. **No governance layer:** Who reviews the RCA before action?
4. **Failure mode handling:** What if the hypothesis is wrong?
5. **"Zero-Trust by design":** Stated but not explained

---

## Thesis Relevance

| Chapter | Application |
|---------|-------------|
| Ch 3 (Trust Problem) | Example of constrained autonomy within competence boundary |
| Ch 4 (Architectural Security) | "Removing tools > adding instructions" as design principle |
| Ch 6 (Observability Patterns) | KQL mining, log correlation, structured telemetry access |
| Ch 7 (Triage Patterns) | Parallelized investigation, hypothesis-verification loop |

---

## Key Takeaway

This implementation demonstrates that **read-only investigation with structural hallucination controls** is a tractable agentic pattern for production use. The clear separation between mining (fast, cheap, constrained) and reasoning (slower, more capable, synthesizes) mirrors effective human incident response team structures.

The pattern stops at investigation — it does not extend to remediation autonomy. This is appropriate for the current trust maturity level, and represents a sensible "crawl" phase before "walk" (assisted remediation) or "run" (autonomous remediation).
