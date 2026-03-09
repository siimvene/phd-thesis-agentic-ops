# Initial Thoughts — 2026-02-07

Kicked off PhD thesis project structure today after research on agent trust patterns.

## The Hook

"Traditional CI/CD is deterministic. Agent pipelines are probabilistic — they need a new trust model."

This positions the thesis at the intersection of:
- Platform engineering (Siim's domain expertise)
- AI agents (current industry wave)
- Trust/safety (the unsolved problem)

## Why This Matters Now

- NIS2 compliance affecting 10k+ EU organizations (Kleidia's market)
- Agentic AI adoption accelerating in 2026
- No established patterns for "safe" agent integration
- Gap between research (theoretical) and practice (shipping code)

## Unique Angles

1. **Industry doctorate** = grounded in real implementation (SwarmOps)
2. **Teaching context** = access to curriculum development, student projects
3. **Government role** = public sector case study access
4. **Builder perspective** = not just studying agents, building with them

## Key Insight from Today

The Trust Equation concept:
```
Trust = (Observability × Reversibility × Blast Radius) / Autonomy
```

As you want more autonomy, you need proportionally more of the other three. This could be a core framework for the thesis.

## Questions to Explore

- What's the "minimum viable observability" for regulated industries?
- Can we quantify blast radius? (Impact score × Probability × Reversibility cost)
- Is progressive trust (earned autonomy) actually used in practice, or just theory?
- How do session-based vs in-memory orchestration compare for incident response?

## Next Steps

- [ ] Literature review on AI safety in production systems
- [ ] Document SwarmOps architecture decisions as case study material
- [ ] Identify potential enterprise case study partners
- [ ] Draft Chapter 3 (The Trust Problem) outline in detail
