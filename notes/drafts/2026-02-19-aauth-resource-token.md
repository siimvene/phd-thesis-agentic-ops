# Draft: AAuth Resource Tokens & Agent Trust

**Source:** Christian Posta (VP, Solo.io) — LinkedIn post, 2026-02-19
**Links:** 
- Deep dive: https://lnkd.in/g9V_P9NR  
- AAuth spec: https://lnkd.in/gGrn23wx  
- Original post: https://www.linkedin.com/posts/ceposta_aauth-share-7430290782445608961-8Ep1

---

## The Problem (Current MCP/OAuth)

Standard MCP auth flow has a structural trust gap:

1. Agent connects to MCP server → gets 401 + WWW-Authenticate
2. Agent discovers auth server, starts OAuth flow with scopes + client_id
3. Auth Server issues access token

**Problems:**
- AS has no idea what the MCP server actually needs/wants
- AS cannot verify the MCP server is legitimate — token issued for `dogfood.company.com/mcp` but the prompting server could be `d0gfood.company.com/mcp` (spoofing)
- User or MITM can tamper with authorization URL / scopes

Classic confused deputy problem at the tool-call layer.

## AAuth Resource Token Solution

MCP server becomes a cryptographic participant in the auth flow:

1. Agent connects to MCP server
2. MCP server validates agent's identity, issues 401 with `Agent-Auth` header containing a **Resource Token**
3. Resource Token = JWT binding: MCP server cryptographic identity + agent identity + explicitly declared scopes
4. Agent presents this to auth server
5. Auth server verifies BOTH identities, issues access token bound to agent's identity

Cryptographic chain: agent ↔ resource ↔ auth server. No party can be spoofed or silently upgraded.

---

## Thesis Relevance

### Trust Equation mapping
`Trust = (Observability × Reversibility × Blast Radius) / Autonomy`

**Observability ↑** — cryptographic binding means the auth chain can now answer: which agent identity accessed which resource identity with which declared scopes. Full audit trail at the identity layer, not just the API layer.

**Blast Radius ↓ (structural)** — MCP server declares scopes explicitly in the token. Agent cannot silently acquire broader permissions than the resource intended. Platform-enforced ceiling per tool call.

### Chapter 4 (Constrained Operation Pattern)
Resource Token is the infrastructure implementation of constrained operation — moves scope enforcement from "policy on paper" to cryptographic enforcement. Proposed addition:

> "Trust enforcement at the tool-call boundary requires cryptographic identity at both ends — agent and resource — not just the calling agent. Without resource identity verification, scope constraints remain advisory."

### Open research question
AAuth requires PKI at both ends: agents AND MCP servers need provisioned cryptographic identities. This shifts the trust problem upstream: **how do you bootstrap and rotate agent identity in a dynamic, ephemeral agent environment?** 

This is currently unsolved and maps to platform engineering concerns (cert lifecycle, identity provisioning pipelines for agents). Good gap for the thesis to name explicitly.

### Provenance note
Still exploratory spec (not IETF-standardized). But Posta is connected to real enterprise MCP deployments at Solo.io customers — this is practitioner-driven, not academic. Cite as "emerging practice" rather than established standard.

---

## Tags
`#trust` `#MCP` `#identity` `#constrained-operation` `#chapter-4` `#chapter-5`
