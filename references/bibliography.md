# Bibliography (Working)

## Academic Papers

### Trust, Risk & Security

1. **Raza, S., Sapkota, R., Karkee, M., & Emmanouilidis, C. (2025).** TRiSM for Agentic AI: A Review of Trust, Risk, and Security Management in LLM-based Agentic Multi-Agent Systems. *arXiv preprint arXiv:2506.04133*.
   - Key concepts: TRiSM framework, four pillars (Explainability, ModelOps, Security/Privacy, Governance), risk taxonomy, CSS and TUE metrics
   - URL: https://arxiv.org/abs/2506.04133

2. **Feng, K. J. K., McDonald, D. W., & Zhang, A. X. (2025).** Levels of Autonomy for AI Agents. *Knight 1st Amendment Institute "AI and Democratic Freedoms" essay series*.
   - Key concepts: Five-level autonomy framework (Operator→Observer), autonomy certificates, user control mechanisms
   - Thesis relevance: Proposes autonomy levels but lacks trust quantification; this thesis adds constraint-based safeguards per level
   - URL: https://arxiv.org/abs/2506.12469

3. **[Author TBD] (2025).** Open Challenges in Multi-Agent Security: Towards Secure Systems of Interacting AI Agents. *arXiv preprint arXiv:2505.02077*.
   - Key concepts: Multi-agent security as distinct field
   - URL: https://arxiv.org/abs/2505.02077

4. **Adimulam, A., Gupta, R., & Kumar, S. (2026).** The Orchestration of Multi-Agent Systems: Architectures, Protocols, and Enterprise Adoption. *arXiv preprint arXiv:2601.13671*.
   - Key concepts: Unified orchestration architecture, MCP and A2A protocols, policy enforcement, state management
   - Thesis relevance: Provides architectural foundations; this thesis adds platform engineering specificity and trust-based deployment guidance
   - URL: https://arxiv.org/abs/2601.13671

5. **Hassan, A. E., Li, H., Lin, D., Adams, B., Chen, T.-H., Kashiwa, Y., & Qiu, D. (2025).** Agentic Software Engineering: Foundational Pillars and a Research Roadmap. *arXiv preprint arXiv:2509.06216*.
   - Key concepts: SE 3.0, dual workbench (ACE/AEE), Structured Agentic SE (SASE), development-focused
   - Thesis relevance: Research roadmap for development; this thesis provides prescriptive framework for operations
   - URL: https://arxiv.org/abs/2509.06216

6. **Akshathala, S., Adnan, B., Ramesh, M., Vaidhyanathan, K., Muhammed, B., & Parthasarathy, K. (2025).** Beyond Task Completion: An Assessment Framework for Evaluating Agentic AI Systems. *arXiv preprint arXiv:2512.12791*.
   - Key concepts: Four-pillar assessment (LLMs, Memory, Tools, Environment), CloudOps validation, behavioral deviation detection
   - Thesis relevance: Evaluation framework complements this thesis's deployment framework; could validate pre-promotion
   - URL: https://arxiv.org/abs/2512.12791

7. **Takerngsaksiri, W., et al. (2024).** Human-In-the-Loop Software Development Agents. *arXiv preprint arXiv:2411.12924*.
   - Key concepts: HULA framework, Atlassian JIRA deployment, human oversight at multiple stages
   - Thesis relevance: Demonstrates HITL viability for development; this thesis extends to operations where time/blast radius constraints differ
   - URL: https://arxiv.org/abs/2411.12924

8. **Staufer, L., Feng, K., Wei, K., Bailey, L., Duan, Y., Yang, M., Ozisik, A. P., Casper, S., & Kolt, N. (2025).** The 2025 AI Agent Index: Documenting Technical and Safety Features of Deployed Agentic AI Systems. *arXiv preprint arXiv:2602.17753*.
   - Key concepts: Survey of 30 deployed agents, transparency crisis, minimal safety documentation in ecosystem
   - Thesis relevance: Their finding that ecosystem lacks safety docs motivates this thesis's trust framework for evaluating third-party agents
   - URL: https://arxiv.org/abs/2602.17753
   - Online index: aiagentindex.mit.edu

### Agent Architectures

9. **[Various survey authors cited in Raza et al.]** - See Table 1 in TRiSM paper for comprehensive comparison

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

### LLM Reasoning Failures

18. **Riddell, E., Riddell, J., Sun, G., Antkiewicz, M., & Czarnecki, K. (2026).** Stalled, Biased, and Confused: Uncovering Reasoning Failures in LLMs for Cloud-Based Root Cause Analysis. *arXiv preprint arXiv:2601.22208*.
   - Key concepts: 16-type taxonomy of RCA reasoning failures, multi-hop diagnosis vulnerabilities, intermediate reasoning error prediction
   - Empirical finding: Tested 6 LLMs on 48,000 simulated cloud RCA scenarios; identified systematic failure modes (stalled, biased, confused)
   - Thesis application: **Problem evidence** — proves AI-assisted operations fail unpredictably in complex scenarios, motivating the Trust Framework; failure taxonomy informs what Observability patterns must detect
   - URL: https://arxiv.org/abs/2601.22208

### Knowledge Graph Provenance

19. **Dibowski, H. (2024).** Full Traceability and Provenance for Knowledge Graphs. *FOIS 2024 (Formal Ontology in Information Systems)*.
    - Key concepts: PROV-STAR ontology (PROV-O + RDF-star), delta-based provenance storage, triple-level change tracking
    - Critical finding: Systems that cannot trace what changed, when, and why cannot learn from failure
    - Thesis application: Architectural foundation for agent-state auditability; directly enables Observability and Reversibility factors in Trust Equation
    - DOI: 10.3233/FAIA241309
    - URL: https://ebooks.iospress.nl/volumearticle/71408

### Agent Memory Systems

20. **Hu, Y. et al. (2025).** Memory in the Age of AI Agents: A Survey. *arXiv preprint arXiv:2512.13564*.
    - Key concepts: Memory taxonomy (factual/experiential/working), memory dynamics (formation/evolution/retrieval)
    - URL: https://arxiv.org/abs/2512.13564

21. **Remil, Y. et al. (2024).** AIOps Solutions for Incident Management: Technical Guidelines and A Comprehensive Literature Review. *arXiv preprint arXiv:2404.01363*.
    - Key concepts: Incident management lifecycle, AIOps taxonomy
    - URL: https://arxiv.org/abs/2404.01363

### Text-to-SQL Security

22. **Castro, D. et al. (2025).** Prompt-to-SQL Injections in LLM-Integrated Web Applications: Risks and Defenses. *ICSE 2025*.
    - Key concepts: P2SQL attacks, all 7 tested LLMs vulnerable
    - URL: https://arxiv.org/abs/2308.01990

23. **Li, X. et al. (2025).** Are Your LLM-based Text-to-SQL Models Secure? Exploring SQL Injection via Backdoor Attacks (ToxicSQL). *arXiv preprint arXiv:2503.05445*.
    - Key concepts: 0.44% poisoned data → 79% attack success
    - URL: https://arxiv.org/abs/2503.05445

### Memory Poisoning Attacks

24. **AGENTPOISON (NeurIPS 2024).** Red-teaming LLM Agents via Poisoning Memory.
    - Key concepts: Backdoor attacks on agent long-term memory

25. **PoisonedRAG (USENIX 2025).** Knowledge Corruption Attacks on RAG Systems.
    - Key concepts: Malicious content injection into retrieval corpus

### Foundational Security

26. **Dennis, J.B. & Van Horn, E.C. (1966).** Programming Semantics for Multiprogrammed Computations. *Communications of the ACM*.
    - Key concepts: Capability-based security (foundation for constrained operation pattern)

27. **Masood, A. (2025).** The Sandboxed Mind — Principled Isolation Patterns for Prompt Injection Resilience.
    - Key concepts: Action-Selector pattern, Dual LLM pattern, Plan-Then-Execute
    - URL: [TBD]

### Capability-Based Security for Agents

28. **arXiv:2511.20920 (2025).** Securing the Model Context Protocol (MCP): Risks, Controls, and Governance.
    - Key concepts: Three adversary types (Content Injection, Supply Chain, Inadvertent Agent), Lethal Trifecta
    - Critical finding: 1,800+ MCP servers on public internet without auth
    - URL: https://arxiv.org/abs/2511.20920

29. **arXiv:2601.11893 (2026).** Taming Various Privilege Escalation in LLM-Based Agent Systems: A Mandatory Access Control Framework (SEAgent).
    - Key concepts: Formal model of privilege escalation, MAC framework achieves 0% attack success rate
    - URL: https://arxiv.org/abs/2601.11893

30. **IACR ePrint 2025/2173.** Systems Security Foundations for Agentic Computing.
    - Key concepts: "We cannot prove an LLM will always enforce policies"
    - Critical for thesis: Theoretical foundation for architectural over instructional security

31. **Meta AI (2025).** Agents Rule of Two: A Practical Approach to AI Agent Security.
    - Key concepts: Three properties (untrustworthy inputs, sensitive access, external actions), satisfy ≤2 for safety
    - URL: Meta AI Blog

32. **Hardy, N. (1988).** The Confused Deputy: (or why capabilities might have been invented). *ACM SIGOPS*.
    - Key concepts: Classic confused deputy attack, directly applicable to AI agents

33. **ScienceDirect (2025).** From prompt injections to protocol exploits: Threats in LLM-powered AI agents workflows.
    - Key concepts: First unified end-to-end threat model, 30+ attack techniques catalogued

34. **SAGA (Northeastern, 2025).** Secure Agent Architecture.
    - Key concepts: Cryptographic access control tokens, formal security guarantees

### Agent Governance & Authorization Tools

35. **Grice, D. (2025).** AgentLock: Authorization Framework for AI Agents.
    - Key concepts: Three-layer separation (Agent/Authorization Gate/Tool Execution), single-use capability tokens, 187-attack empirical study
    - Critical finding: "Adversarial and legitimate requests are semantically indistinguishable" — effective protection requires architectural access control
    - Scope constraints: data boundaries, record limits, PII redaction, risk-level classification (none/low/medium/high/critical)
    - License: Apache 2.0
    - GitHub: https://github.com/webpro255/agentlock

36. **DashClaw (2025).** Decision Governance Framework for AI Agents.
    - Key concepts: Four-step governance loop (Guard → Record → Verify → Outcome), human-in-the-loop approval queue
    - Novel: Drift detection / "learning velocity" — tracks agent behavioral changes over time
    - Captures agent *intent* and *assumptions*, not just actions
    - License: Apache 2.0
    - GitHub: https://github.com/ucsandman/DashClaw

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

*Last updated: 2026-03-27*
