# Bibliography (Working)

## Academic Papers

### Trust, Risk & Security

1. **Raza, S., Sapkota, R., Karkee, M., & Emmanouilidis, C. (2025).** TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems. *arXiv preprint arXiv:2506.04133*.
   - Key concepts: TRiSM framework, four pillars (Explainability, ModelOps, Security/Privacy, Governance), risk taxonomy, CSS and TUE metrics
   - URL: https://arxiv.org/abs/2506.04133

2. **[Author TBD] (2025).** Levels of Autonomy for AI Agents. *arXiv preprint arXiv:2506.12469*.
   - Key concepts: Autonomy certificates, graduated autonomy levels
   - URL: https://arxiv.org/abs/2506.12469

3. **[Author TBD] (2025).** Open Challenges in Multi-Agent Security: Towards Secure Systems of Interacting AI Agents. *arXiv preprint arXiv:2505.02077*.
   - Key concepts: Multi-agent security as distinct field
   - URL: https://arxiv.org/abs/2505.02077

### Agent Architectures

4. **[Various survey authors cited in Raza et al.]** - See Table 1 in TRiSM paper for comprehensive comparison

## Industry Frameworks & Standards

### Governance Frameworks

5. **Singapore IMDA (2025).** Model AI Governance Framework for Agentic AI.
   - Key concepts: Pre-deployment testing, gradual rollout, continuous monitoring
   - URL: https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf

6. **Cloud Security Alliance (2026).** Agentic Trust Framework: Zero Trust Governance for AI Agents.
   - Key concepts: Five core questions (Identity, Behavior, Data, Segmentation, Incident Response), Intern→Principal maturity model
   - URL: https://cloudsecurityalliance.org/blog/2026/02/02/the-agentic-trust-framework-zero-trust-governance-for-ai-agents
   - GitHub: https://github.com/massivescale-ai/agentic-trust-framework

7. **NIST (2020).** SP 800-207: Zero Trust Architecture.
   - Foundation for ATF's Zero Trust principles

8. **Gartner.** AI TRiSM (Trust, Risk, and Security Management).
   - Original framework adapted by Raza et al.

### Regulatory

9. **European Union (2024).** AI Act.
   - Risk-based regulation framework

10. **European Union (2024).** NIS2 Directive.
    - Network and Information Security requirements for essential/important entities

## Industry Research & Reports

### User Research

11. **GitLab UX Research (2026).** Building trust in agentic tools: What we learned from our users.
    - Key concepts: Micro-inflection points, four pillars of trust (Safeguarding, Transparency, Context, Anticipation), compound trust growth
    - URL: https://about.gitlab.com/blog/building-trust-in-agentic-tools-what-we-learned-from-our-users/

### Market Analysis

12. **[Source cited in Raza et al.].** AI agent market growth projections ($5.4B → $7.6B).

13. **Salesforce Research (2026).** Trust as key to scaling agentic AI (C-suite survey).
    - URL: https://venturebeat.com/security/salesforce-research-across-the-c-suite-trust-is-the-key-to-scaling-agentic

## Framework Comparisons

### Multi-Agent Orchestration

14. **LangGraph** (LangChain)
    - Graph-based orchestration
    - URL: https://python.langchain.com/docs/langgraph

15. **CrewAI**
    - Role-based team orchestration
    - URL: https://www.crewai.com/

16. **AutoGen** (Microsoft)
    - Conversational multi-agent framework
    - URL: https://microsoft.github.io/autogen/

---

### Prompt Injection & Supply Chain Security

17. **Bountyy Oy (2026).** Invisible Prompt Injection: The Structural Vulnerability in Markdown Processing.
    - Key concepts: SMAC (Safe Markdown for AI Consumption), DRPT benchmark, phantom imports/endpoints
    - Attack vector: HTML comments, markdown reference links, collapsed details in documentation
    - Finding: 70% injection rate on Claude Code (Opus 4.6), 100% phantom import rate
    - Mitigation: Preprocess markdown to render before AI ingestion
    - URL: https://github.com/bountyyfi/invisible-prompt-injection

## To Find / Verify

- [ ] Market size source from Raza et al. reference [1]
- [ ] Enterprise AI deployment statistics reference [2]
- [ ] Autonomous vehicle levels of autonomy (SAE J3016) - for analogy
- [ ] Historical agent research (1990s) references
- [ ] Prompt injection attack papers
- [ ] Memory poisoning in multi-agent systems
- [ ] GitOps evolution history sources
- [ ] Platform engineering definition sources

---

*Last updated: 2026-02-07*
