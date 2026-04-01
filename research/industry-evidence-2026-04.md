# Industry Evidence Collection — April 2026

*Evidence for Chapter 10 (Evaluation) and pattern validation throughout thesis.*

---

## 1. OpsWorker — Multi-Agent Incident Response

**Source:** InfoQ, January 2026
**URL:** https://www.infoq.com/news/2026/01/opsworker-ai-sre/

### Architecture

OpsWorker implements a **multi-agent supervisor pattern**:
- Specialized agents for logs, metrics, runbooks, and topology
- Supervisor/orchestrator layer coordinates agent tasks
- Structured handoffs between agents to prevent deadlock
- AWS implementation mirrors this with four specialized agents + supervisor

### Trust Mechanisms

| Trust Factor | OpsWorker Implementation |
|--------------|--------------------------|
| Observability | Specialized agents for logs, metrics, topology |
| Reversibility | Agents propose hypotheses; humans approve remediation |
| Blast Radius | Read-only access initially, minimum necessary privileges |
| Autonomy | L2-L3: Investigation autonomous, execution requires human judgment |

### Key Quotes

> "AI agents should propose hypotheses, queries and remediation options while humans stay in the loop"

> "Guardrails and integrating tooling carefully rather than spending time on clever prompts"

> "The experiment validates technical feasibility but reveals the productionization gap is substantial"

### Validation of Thesis Patterns

- **Multi-agent coordination** (Chapter 7): Supervisor pattern with specialized domain agents
- **Read-Only Default** (Chapter 9): Explicitly mentioned as starting point
- **Progressive Autonomy** (Chapter 5): Read-only → controlled actions after validation
- **Trust Framework** (Chapter 4): Human judgment retained for remediation decisions

---

## 2. Azure SRE Agent — Microsoft Production Platform

**Source:** Microsoft Learn, March 2026
**URL:** https://learn.microsoft.com/en-us/azure/sre-agent/overview

### Architecture

- **MCP Integration**: Model Context Protocol for connecting observability, incident, and source control tools
- **Subagent Architecture**: Specialized agents for VMs, databases, networking, security
- **Custom Runbooks**: Controlled execution through defined procedures
- **Progressive Learning**: Agent builds institutional knowledge over time

### Trust Mechanisms

| Trust Factor | Azure SRE Agent Implementation |
|--------------|-------------------------------|
| Observability | Azure Monitor, Log Analytics, Application Insights integration |
| Reversibility | "Proposed mitigations" for human review |
| Blast Radius | Subagent extensibility with defined scopes |
| Autonomy | Progressive: Day 1 basic → Month 1 proactive |

### Progressive Value Timeline

| Milestone | Capability |
|-----------|------------|
| Day 1 | Connect tools, triage incidents, built-in Azure knowledge |
| Week 1 | Learns topology, failure patterns, escalation preferences |
| Month 1 | Proactive risk identification, preventive suggestions, onboarding acceleration |

### Key Features

- **Institutional Knowledge**: "Knowledge that never leaves" — captures root causes, resolution steps, team preferences
- **Agent-in-Toolbox Pattern**: Integrates with existing ecosystem rather than replacing it
- **Custom Subagents**: Visual no-code interface for specialized operational domains

### Validation of Thesis Patterns

- **Agent-in-Toolbox** (Chapter 9): Explicit integration approach, not replacement
- **Git-Backed Memory** (Chapter 9): Institutional knowledge persistence (variant implementation)
- **Progressive Autonomy** (Chapter 5): Documented Day 1 → Month 1 progression
- **MCP as Capability Pattern** (Chapter 4): MCP used for tool integration and boundaries

---

## 3. Market Validation

From search results (2026):

- **Gartner 2026 Market Guide for AI SRE Tooling**: Sherlocks' Klaudia named Representative Vendor
- **Forrester**: "AI-powered operational intelligence can reduce incidents by 20-30%"
- **Production metrics cited**:
  - 100% alert investigation coverage
  - Alert to RCA in under 5 minutes
  - MTTR reduction >70%

---

## Summary: Thesis Pattern Validation

| Thesis Pattern | OpsWorker | Azure SRE | Status |
|----------------|-----------|-----------|--------|
| Trust Framework (Obs/Rev/BR/Auto) | ✓ | ✓ | Validated |
| Read-Only Default | ✓ | Implicit | Validated |
| Agent-in-Toolbox | ✓ | ✓ | Validated |
| Progressive Autonomy | ✓ | ✓ | Validated |
| Multi-Agent Coordination | ✓ | ✓ | Validated |
| Human-in-the-Loop | ✓ | ✓ | Validated |
| MCP/Capability Boundaries | — | ✓ | Validated |
| Memory/Knowledge Persistence | — | ✓ | Validated |

---

## Integration Notes

**For Chapter 10 (Evaluation):**
- Add OpsWorker and Azure SRE Agent as industry evidence alongside HolmesGPT
- Note that Microsoft's production deployment validates MCP as capability pattern
- Reference Gartner/Forrester validation for market traction

**Limitations:**
- OpsWorker: Academic study cited, but vendor deployment; no published metrics
- Azure SRE Agent: Vendor documentation; quantitative claims need verification
- Both represent vendor perspectives, not independent validation

---

*Collected: 2026-04-01 (Heartbeat)*
