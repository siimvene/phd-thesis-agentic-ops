# 4.Y Multi-Agent Reliability Patterns

*Draft section for Chapter 4: A Trust Framework for Operational Agents*
*Source: therin/research/synthesis/2026-03-08-reddit-patterns-summary.md*

## Overview

Multi-agent systems present reliability challenges distinct from single-agent architectures. Evidence from practitioner reports reveals three recurring patterns that shape trustworthiness in production deployments.

## Pattern 1: Coordination Is Designed, Not Discovered

A common misconception: capable models will naturally develop clean delegation and safe boundaries when orchestrated together. Practitioner evidence contradicts this.

**Finding:** Strong models do not spontaneously invent safe coordination. The orchestration layer performs essential work that cannot be delegated to model capabilities.

**Implications:**
- Treat orchestration as explicit design, not emergent property
- Prompts alone are weak controls
- Templates, workflows, and post-hoc enforcement matter more than model sophistication

**Case Study — Forus Quotation System (2026-03):**
A multi-agent pipeline for commercial quotation automation required explicit role separation across 8 specialized agents (intake, DWG parser, PDF parser, Excel parser, BOM merger, USS matcher, vendor pricer, quote assembler). Despite using capable models, the system required:
- Explicit pipeline definition with typed inputs/outputs
- SharedStateService for cross-agent learned mappings
- BatchService for fan-out/fan-in parallel execution

Without this scaffolding, agents produced inconsistent outputs and failed to maintain coherent state across the workflow.

## Pattern 2: Reliability Failures Are Operational, Not Cognitive

The dominant failure mode in multi-agent systems is not model capability — it's **drift**: stale context, renamed tools, shared files changing unexpectedly, or silent divergence between tracked and actual state.

**Finding:** Multi-agent systems should be analyzed as distributed systems, not AI systems. The failure modes are operational: synchronization, state management, health checking.

**Implications:**
- Reconciliation and health checks are first-class controls
- Prompt versioning prevents drift between expectation and behavior  
- Shared-resource changelogs prevent coordination failures
- Recovery mechanisms matter more than prevention

**Case Study — Solana Trading Bot (2026-03-14):**
A trading bot logged +1.17 SOL profit on a position, but actual profit was +0.001 SOL — a 99.9% discrepancy. The verification function only checked if tokens left the wallet, not if SOL arrived. This exemplifies state drift: the system's model of reality diverged from actual reality.

The fix required reconciliation logic: `verify_sell_landed()` now confirms SOL balance increase rather than token departure, and flags `MASSIVE_SLIPPAGE` when divergence exceeds 50%.

**Key Insight:** The trading bot failure was caught by reconciliation, not by model improvement. This maps directly to distributed systems practice: eventual consistency requires periodic reconciliation.

## Pattern 3: Mechanical Controls Outperform Prompt Discipline

Strongest evidence from practitioners: boundaries enforced mechanically beat boundaries requested in prose.

**Examples from practice:**
- Git revert / post-hoc scope enforcement
- Approval gates before high-risk phases
- Conflict-resolution protocols between roles
- Deterministic control flow via structured outputs
- Hard-coded blast radius limits per operation

**Implications:**
- Reversibility controls belong in runtime/tooling layer, not prompt engineering
- Blast-radius limits must be architectural, not requested
- "The model should know better" is not a reliability strategy

**Contrast with Kiro Incident (Section 4.X):**
Amazon's Kiro agent had human-equivalent permissions but not human-equivalent judgment. It chose "delete and recreate" over "apply patch" because both were valid paths to task completion. Mechanical controls (constrained operation set) would have made the destructive path unreachable.

## Synthesis: Distributed Systems Discipline

A recurring practitioner lesson: multi-agent reliability is less a prompting problem than a coordination-and-controls problem. High-performing systems rely on:

1. **Explicit orchestration templates** — roles, inputs, outputs defined in configuration
2. **Mechanically enforced boundaries** — not "please stay in scope"
3. **Operational safeguards** — reconciliation, health checks, approval gates

> The path from impressive demo to trustworthy practice runs through distributed-systems discipline, not better prompts.

## Trust Equation Application

Applying the framework's trust equation to multi-agent systems:

| Factor | Single Agent | Multi-Agent (naive) | Multi-Agent (disciplined) |
|--------|--------------|---------------------|---------------------------|
| **Observability** | One context | Fragmented across agents | Centralized state + audit log |
| **Reversibility** | One action chain | Interleaved, hard to unwind | Coordinated rollback points |
| **Blast Radius** | Agent scope | Combined agent scopes | Explicit per-agent limits |
| **Autonomy** | As delegated | Multiplied (N agents) | Constrained per role |

**Key insight:** Naive multi-agent multiplication increases autonomy factor without corresponding improvements to observability or reversibility, degrading trust. Disciplined multi-agent design constrains autonomy per-role while centralizing observability.

## Design Principles

From these patterns, we derive:

1. **Design coordination explicitly** — Define roles, boundaries, and handoff protocols before agent selection
2. **Treat state as distributed systems problem** — Reconciliation, conflict resolution, and health checks are mandatory
3. **Enforce mechanically** — Blast radius, operation scope, and reversibility controls belong in architecture, not prompts
4. **Log semantically** — Operations should produce audit events, not just text output

## Candidate Subsection Titles

For thesis chapter structure:
- Coordination Is Designed, Not Discovered
- Silent Drift as the Core Multi-Agent Failure Mode  
- Mechanical Enforcement Beats Prompt Obedience
- Multi-Agent Systems as Distributed Systems

---

*Source research: therin/research/synthesis/2026-03-08-reddit-patterns-summary.md*
*Case studies: Forus quotation system (2026-03), Solana trading bot verification bug (2026-03-14)*
