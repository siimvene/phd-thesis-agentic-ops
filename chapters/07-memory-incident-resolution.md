# 7.X Memory-Enhanced Incident Resolution

*Draft section for Chapter 7: Agent-Enhanced Incident Triage*
*Source: therin/research/memory-incident-resolution.md*

## Overview

Incident resolution is perhaps the strongest use case for agent long-term memory. Senior SREs are valuable precisely because they remember: "Last time the database did this, it was a connection pool leak after the Thursday deploy."

This section explores how memory systems can enhance incident agents while maintaining trust, and examines the failure modes unique to high-stakes operational memory.

## Memory Architecture for Incidents

Following Hu et al. (2025) "Memory in the Age of AI Agents," incident agents need three memory types:

| Memory Type | Incident Application | Example |
|-------------|---------------------|---------|
| **Factual** | System topology, runbooks, config | "Database pool default is 100 connections" |
| **Experiential** | Past incidents, what worked/failed | "Similar error in #3892 → fixed by rollback" |
| **Working** | Current investigation state | "Already checked network, testing DB next" |

## Memory Patterns from Practice

**Similar Incident Retrieval**: Semantic search over postmortem corpus — "Have we seen this before?"

**Error-Triggered Recall**: Don't retrieve unless anomaly detected (claude-mem-lite pattern). Bash error → surface past fixes for that error.

**Token-Budgeted Injection**: Greedy knapsack with caps. Most relevant memories without context pollution.

**Feedback Loops**: Track which recommendations were adopted. Deprioritize unused suggestions.

## Trust Framework for Memory

| Factor | Memory Application | Design Implication |
|--------|-------------------|-------------------|
| **Observability** | What memories influenced this decision? | Provenance logging, retrieval explanation |
| **Reversibility** | Can we undo memory-based actions? | Soft recommendations before automation |
| **Blast Radius** | Impact of wrong memory? | Graduated autonomy by domain |
| **Autonomy** | How much does memory drive action? | Human-in-loop for high-stakes |

### Memory-Specific Trust: Confidence Decay

Memory confidence should degrade:
```
confidence = base_confidence × decay_factor(age, domain_volatility)
```

Infrastructure memories decay fast (topology changes). Runbook patterns decay slower. Historical facts (incident #3892 happened) don't decay.

## Failure Modes

### 1. Staleness
Infrastructure changed but knowledge wasn't updated. The topology map is wrong. The escalation path goes to someone who left.

**Mitigation**: Temporal validity tags, confidence decay, automated validation against current state.

### 2. Overfitting
Pattern worked 5 times, agent becomes overconfident. But those 5 incidents had the same root cause. New incident with same symptom, different cause → wrong remediation applied confidently.

**Mitigation**: Track conditions of success, require diversity in validation, decay confidence in novel contexts.

### 3. Pollution (Adversarial)
AGENTPOISON (NeurIPS 2024) and PoisonedRAG (USENIX 2025) demonstrate attacks on agent memory:
- Malicious postmortem suggests harmful runbook
- Poisoned similar-incident matching

**Mitigation**: Cryptographic signing of authoritative knowledge, provenance tracking, anomaly detection on memory updates.

### 4. Dilution
Too much retrieved context overwhelms signal. 10 "similar" incidents, none truly relevant. Token budget consumed by noise.

**Mitigation**: Token budgeting, relevance thresholds, hierarchical retrieval (summary first, detail on demand).

### 5. Feedback Loop Pathologies
Agent suggests wrong root cause → operator accepts (time pressure) → postmortem records as "correct" → future incidents get same wrong answer → self-reinforcing error.

**Mitigation**: Distinguish "operator accepted" from "operator validated." Track long-term outcomes. Periodic expert review.

## Trust Zones for Memory-Driven Actions

| Zone | Memory Use | Human Role | Example |
|------|-----------|-----------|---------|
| Advisory | Surface similar incidents | Full review | "Consider checking pool based on #3892" |
| Guided | Pre-fill diagnostic commands | Approve/execute | "Run these queries? [Execute/Skip]" |
| Supervised | Execute known-safe actions | Exception handling | Auto-route pages, assign severity |
| Autonomous | Full remediation from memory | Post-hoc audit | Auto-restart for recognized patterns |

**Progression rule**: Agents earn autonomy through demonstrated accuracy, tracked per domain.

## Practitioner Validation

Major platforms evolving toward memory-enhanced incident response:
- **PagerDuty**: Copilot (2023) → SRE Agent (2025) with enterprise incident knowledge
- **incident.io**: Moving toward "AI SRE" with postmortem integration
- **Rootly**: AI-native with retrospective learning

The "filter first, then LLM" pattern from claude-mem-lite aligns with these production systems.

## Open Questions

1. When does experiential memory (many incidents) become factual memory (reliable pattern)?
2. If agent proves reliable in database incidents, does trust transfer to cache incidents?
3. What level of retrieval explanation is necessary for operator trust?
4. How do we detect memory poisoning attempts in practice?

---

*Full research notes: therin/research/memory-incident-resolution.md*
