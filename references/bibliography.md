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

### Agent Memory Systems

18. **Hu, Y. et al. (2025).** Memory in the Age of AI Agents: A Survey. *arXiv preprint arXiv:2512.13564*.
    - Key concepts: Memory taxonomy (factual/experiential/working), memory dynamics (formation/evolution/retrieval)
    - URL: https://arxiv.org/abs/2512.13564

19. **Remil, Y. et al. (2024).** AIOps Solutions for Incident Management: Technical Guidelines and A Comprehensive Literature Review. *arXiv preprint arXiv:2404.01363*.
    - Key concepts: Incident management lifecycle, AIOps taxonomy
    - URL: https://arxiv.org/abs/2404.01363

### Text-to-SQL Security

20. **Castro, D. et al. (2025).** Prompt-to-SQL Injections in LLM-Integrated Web Applications: Risks and Defenses. *ICSE 2025*.
    - Key concepts: P2SQL attacks, all 7 tested LLMs vulnerable
    - URL: https://arxiv.org/abs/2308.01990

21. **Li, X. et al. (2025).** Are Your LLM-based Text-to-SQL Models Secure? Exploring SQL Injection via Backdoor Attacks (ToxicSQL). *arXiv preprint arXiv:2503.05445*.
    - Key concepts: 0.44% poisoned data → 79% attack success
    - URL: https://arxiv.org/abs/2503.05445

### Memory Poisoning Attacks

22. **AGENTPOISON (NeurIPS 2024).** Red-teaming LLM Agents via Poisoning Memory.
    - Key concepts: Backdoor attacks on agent long-term memory

23. **PoisonedRAG (USENIX 2025).** Knowledge Corruption Attacks on RAG Systems.
    - Key concepts: Malicious content injection into retrieval corpus

### Foundational Security

24. **Dennis, J.B. & Van Horn, E.C. (1966).** Programming Semantics for Multiprogrammed Computations. *Communications of the ACM*.
    - Key concepts: Capability-based security (foundation for constrained operation pattern)

25. **Masood, A. (2025).** The Sandboxed Mind — Principled Isolation Patterns for Prompt Injection Resilience.
    - Key concepts: Action-Selector pattern, Dual LLM pattern, Plan-Then-Execute
    - URL: [TBD]

### Capability-Based Security for Agents

26. **arXiv:2511.20920 (2025).** Securing the Model Context Protocol (MCP): Risks, Controls, and Governance.
    - Key concepts: Three adversary types (Content Injection, Supply Chain, Inadvertent Agent), Lethal Trifecta
    - Critical finding: 1,800+ MCP servers on public internet without auth
    - URL: https://arxiv.org/abs/2511.20920

27. **arXiv:2601.11893 (2026).** Taming Various Privilege Escalation in LLM-Based Agent Systems: A Mandatory Access Control Framework (SEAgent).
    - Key concepts: Formal model of privilege escalation, MAC framework achieves 0% attack success rate
    - URL: https://arxiv.org/abs/2601.11893

28. **IACR ePrint 2025/2173.** Systems Security Foundations for Agentic Computing.
    - Key concepts: "We cannot prove an LLM will always enforce policies"
    - Critical for thesis: Theoretical foundation for architectural over instructional security

29. **Meta AI (2025).** Agents Rule of Two: A Practical Approach to AI Agent Security.
    - Key concepts: Three properties (untrustworthy inputs, sensitive access, external actions), satisfy ≤2 for safety
    - URL: Meta AI Blog

30. **Hardy, N. (1988).** The Confused Deputy: (or why capabilities might have been invented). *ACM SIGOPS*.
    - Key concepts: Classic confused deputy attack, directly applicable to AI agents

31. **ScienceDirect (2025).** From prompt injections to protocol exploits: Threats in LLM-powered AI agents workflows.
    - Key concepts: First unified end-to-end threat model, 30+ attack techniques catalogued

32. **SAGA (Northeastern, 2025).** Secure Agent Architecture.
    - Key concepts: Cryptographic access control tokens, formal security guarantees

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
