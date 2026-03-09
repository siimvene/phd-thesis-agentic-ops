# Agentic-Ops: DevOps Framework for AI Agents

**Source:** https://htek.dev/articles/agentic-ops-workflow-framework-for-ai-agents
**Author:** htek.dev
**Date Analyzed:** 2026-03-01
**Relevance:** High — directly supports Constrained Operation Pattern

---

## Summary

Introduces "Agentic-Ops" — DevOps principles shifted left to the agent level. Uses `gh-hookflow` tool to define YAML workflows that intercept agent actions (file edits, commits) with blocking/non-blocking validation.

**Key tool:** [gh-hookflow](https://github.com/htekdev/gh-hookflow) — GitHub CLI extension for agent governance workflows.

---

## Core Concept

> "DevOps protects velocity. When velocity increases, DevOps must shift further left."

The author argues:
1. AI agents represent "the biggest velocity jump in software history"
2. Traditional DevOps (CI/CD, PR reviews) can't keep up with machine-speed changes
3. Solution: shift validation to the moment of code creation ("shift left one more time")

### Shift-Left Progression (from article)

| Era | Testing Happens | Feedback Delay |
|-----|-----------------|----------------|
| Pre-DevOps | In production | Days to weeks |
| CI/CD | In pipeline after push | Minutes to hours |
| Pre-commit hooks | Before commit (human) | Seconds |
| **Agentic DevOps** | Before commit (agent) | Milliseconds |

---

## Technical Implementation

### gh-hookflow Workflow Syntax

```yaml
name: Run Tests Before Commit
blocking: true

on:
  commit:
    paths: ['src/**']

steps:
  - name: Run test suite
    run: npm test
```

**Key features:**
- `blocking: true` — prevents action if validation fails
- `preToolUse` / `postToolUse` hooks — intercept before/after agent actions
- Path-based scoping — limits blast radius
- GitHub Actions-like syntax — familiar to practitioners

### Example Patterns

1. **Lint on every edit** — postToolUse, non-blocking
2. **Block credential file edits** — preToolUse, blocking
3. **Security scan on new files** — preToolUse, blocking

---

## Thesis Relevance

### 1. Supports Constrained Operation Pattern (Chapter 4)

Direct implementation of policy-as-code constraints:

| Thesis Pattern | Agentic-Ops Implementation |
|----------------|---------------------------|
| Blast radius limits | `paths: ['src/**']` restricts scope |
| Pre-execution gates | `blocking: true` on `preToolUse` |
| Reversibility | Blocks before commit = nothing to reverse |
| Observability | All actions trigger hooks → logged |

### 2. Validates Trust Equation

Thesis formula: `Trust = (Observability × Reversibility × Blast Radius) / Autonomy`

Their approach maximizes numerator (O×R×BR) rather than reducing autonomy (denominator). This maintains velocity while increasing trust.

### 3. Practitioner Evidence

First-hand account of control gap:

> "I watched an AI agent refactor an entire module last week. Seventeen files. Four hundred lines changed. It took about ninety seconds. The code compiled. The types checked. And it was completely wrong."

> "The problem wasn't the agent's velocity. The problem was that I had zero guardrails to match that velocity."

This validates thesis claims about the need for agent governance in platform engineering contexts.

---

## Gaps / Limitations

1. **Pre-commit only** — doesn't address runtime agent behavior
2. **IDE-centric** — assumes human dev loop (IDE → commit)
3. **No multi-agent coordination** — single agent model
4. **No long-running task handling** — headless autonomous agents not addressed

**Thesis contribution:** ZeroClaw autonomy levels and runtime observability fill these gaps.

---

## Quotable Excerpts

For literature review:
> "AI agents represent the biggest velocity jump in software history. The DevOps response? Shift left one more time — all the way into the development environment, at the moment of creation."

> "When a human developer moves fast and creates technical debt, we don't blame the developer — we blame the missing process. No tests? Process gap. No code review? Process gap. No linting? Process gap. We solve it with automation, not finger-wagging. So why do we blame agents for the exact same thing?"

---

## Use in Thesis

- **Chapter 2 (Literature Review):** Cite as related work on agent governance patterns
- **Chapter 3 (Methodology):** Use as practitioner evidence of control gap
- **Chapter 4 (Constrained Operation):** Reference as complementary approach (dev-time vs runtime)

---

## Related Links

- [Agentic-Ops Repository](https://github.com/htekdev/agentic-ops)
- [gh-hookflow Tool](https://github.com/htekdev/gh-hookflow)
- [Agentic DevOps: Next Evolution of Shift Left](https://htek.dev/articles/agentic-devops-next-evolution-of-shift-left) (referenced article)
- [Agent Hooks: Controlling AI Codebase](https://htek.dev/articles/agent-hooks-controlling-ai-codebase) (referenced article)
