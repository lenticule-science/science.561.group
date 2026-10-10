---
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---
# OpenClaw & Open-Source Claude Code Alternatives — April 2026 Landscape

**Date:** 2026-04-04  
**Research Period:** March 31 - April 4, 2026  
**Context:** Anthropic accidentally leaked Claude Code source (512K lines) on March 31, 2026. Analyzing what exists now and what's worth cloning into engineering/src/.

---

## Executive Summary

The open-source agentic coding landscape has exploded in April 2026 following Anthropic's accidental source code leak. There are now four distinct categories of tools worth studying:

1. **OpenClaw** — The dominant autonomous agent framework (personal AI assistant, multi-channel, skill-based)
2. **Cline** — The leading open-source IDE agent (VS Code extension, MCP-native, 4M+ installs)
3. **Aider** — The terminal-first git-native pair programmer (disciplined, git-focused)
4. **ClawCode** — The fastest-growing GitHub project ever (clean-room rewrite of Claude Code harness, Python/Rust, 100K stars in 24h)
5. **Continue.dev** — The extensible IDE plugin (MCP host, configuration-driven)

**What Anthropic is "changing":** Starting April 4, 2026 (today), Claude Code subscribers can no longer use subscription minutes for third-party harnesses like OpenClaw. Usage must be billed separately as pay-as-you-go. This represents Anthropic's attempt to monetize agent infrastructure after the Claude Code source leak made open-source alternatives viable.

**Best to clone:** Cline (most patterns, best architecture, active community) and OpenClaw (skills system, MCP orchestration). Secondary: Continue's configuration system, ClawCode's clean-room patterns.

---

## The Leak Event — What Happened March 31, 2026

### The Accident

On March 31, 2026, at 00:21 UTC, Anthropic shipped version 2.1.88 of the `@anthropic-ai/claude-code` npm package with a 59.8 MB source map file accidentally bundled. The `.map` file pointed to a zip archive on Anthropic's Cloudflare R2 storage containing:

- 1,906 TypeScript files
- ~512,000 lines of unobfuscated code
- The entire agent harness, MCP orchestration layer, permission systems, and tool definitions
- 44 unshipped feature flags
- 46,000 lines of context compression logic
- 19 permission-gated tools, each independently sandboxed

**Root cause:** Missing `*.map` entry in `.npmignore` and no `files` field in `package.json` to exclude debugging artifacts. Human error, not a security breach.

### Scale of Dissemination

- Discovered at 4:23 AM ET by Chaofan Shou (@Fried_rice), Solayer Labs intern
- By sunrise: mirrored across GitHub, forked 41,500+ times
- Within 24 hours: ClawCode clean-room rewrite hit 100K stars (fastest repo growth in GitHub history)
- By April 2: Every AI lab on earth had analyzed the code
- By April 4: MCP implementations, pattern summaries, and vulnerability analyses published

**What was NOT exposed:** Claude model weights, training data, core ML infrastructure. The leak revealed only the orchestration layer.

### Security Aftermath

- Malicious versions of axios (1.14.1, 0.30.4) circulated as Remote Access Trojans (RATs)
- Attackers designed repositories specifically to trick Claude Code into running malicious background commands
- Anthropic's DMCA takedown attempts (April 1) backfired, removed 1000s of legitimate repos, drew antitrust scrutiny

---

## Category 1: OpenClaw — The Dominant Autonomous Agent

**GitHub:** https://github.com/openclaw/openclaw  
**Install:** `npm install -g openclaw@latest` / `pnpm add -g openclaw@latest`  
**Runtime:** Node 24 recommended, Node 22.16+ minimum  
**Stars:** 100K+ (surpassed in 2-3 weeks, now overshadowed by ClawCode)

### What OpenClaw Is

A personal AI assistant framework that runs on your device (macOS, Linux, Windows, iOS, Android) with persistent memory and multi-channel inbox integration. It is **not just a coding tool** — it's a "life OS" that autonomously manages workflows, remembers conversations for weeks, and connects to 500+ external services.

**Core philosophy:** Autonomous execution without human approval for each step. Unlike Claude Code, OpenClaw can decide when to run things (within guardrails).

### Key Differentiators vs Claude Code

| Feature | OpenClaw | Claude Code |
|---------|----------|-------------|
| Memory | Persistent (weeks), local storage | Resets between sessions |
| Model | Model-agnostic (Kimi 2.5, Claude, etc.) | Claude-only |
| Execution | Fully autonomous agent | Tool-use + approval loop |
| Channels | 15+ (WhatsApp, Slack, Telegram, Discord, iMessage, Zalo, WeChat, etc.) | IDE/Terminal only |
| MCP Support | MCP client with 500+ tool integrations | MCP host (embedded) |
| Self-modification | Can autonomously create skills | Tools hardcoded |
| Coding Focus | Multi-domain (code is 1 capability) | Coding-first |

### Skills System (The Pattern to Clone)

OpenClaw's **skills** are the closest equivalent to the captain's "crafts" design. Each skill is a directory containing:

```
skill-name/
├── SKILL.md          # YAML frontmatter + instructions
├── tools/            # Tool definitions
├── examples/         # Usage patterns
└── tests/            # Verification
```

**Key facts:**
- Skills are AgentSkills-compatible (can be shared across frameworks)
- Public registry had 13,729+ community skills as of Feb 28, 2026
- Skills can be created autonomously by the agent: "Create a skill to query PostgreSQL"
- CrawHub (https://github.com/openclaw/clawhub) is the official skill directory

**What we should steal:** The YAML-frontmatter-first approach, the "skill = directory with metadata" pattern, the public registry concept. This maps directly onto crafts/commands/skills in our harness.

### MCP Architecture in OpenClaw

OpenClaw is an **MCP client** (not a host). It:
- Connects to configured MCP servers
- Discovers 500+ tools through MCP
- Has a dedicated marketplace for finding/filtering servers (sorts by installs, stars, date)
- Supports all 6 MCP transport types (Stdio, SSE, HTTP, WebSocket, SDK, ClaudeAiProxy)

**Interesting:** OpenClaw doesn't embed MCP; it orchestrates external servers. Useful reference for how NOT to do embedded MCP.

### Patterns Worth Cloning

1. **Persistent memory system** — moves beyond conversation-only context
2. **Multi-channel inbox** — abstract over transport layers (WhatsApp, Slack, Discord, terminal)
3. **Skills registry** — a marketplace for extending agent capabilities
4. **Autonomous skill creation** — agent can write its own tools
5. **Stateful sessions** — unlike Claude Code's stateless model, OpenClaw maintains long-lived agent state

---

## Category 2: Cline — The Open-Source IDE Agent (Most Cloneable)

**GitHub:** https://github.com/cline/cline  
**Install:** VS Code Marketplace, or self-host the CLI version  
**Stars:** Unknown exact count, but 4M+ installs across VS Code, JetBrains, Cursor  
**Latest RFC:** Multi-Agent Interceptor Hooks & A2A (Agent-to-Agent) Orchestration Protocol

### What Cline Is

An autonomous coding agent that runs as a VS Code extension (and increasingly as a standalone CLI). It can:
- Create, edit, delete files
- Execute terminal commands
- Browse the web
- Run other agents (via MCP)
- Use AI models from 10+ providers (Claude, GPT, Gemini, local models via Ollama)

**Core principle:** Plan-then-execute pattern with checkpoint-based recovery. User approves high-level intent; agent breaks it into subtasks.

### Architecture (Very Well Documented)

Cline's architecture is the cleanest we've found, with explicit component separation:

1. **HostProvider** — Platform abstraction (VS Code, CLI, JetBrains, eventually web)
2. **StateManager** — Persistent task state and checkpoint management
3. **AuthService** — API key and provider credential management
4. **McpHub** — Singleton managing MCP server connections and tool discovery
5. **Controller** — Central nervous system; owns StateManager, AuthService, McpHub, and active Task
6. **CommandPermissionController** — Flags dangerous shell operators (`>`, `|`, `&&`)

**Notable:** Cline uses **gRPC-over-postMessage** for type-safe, streaming, cancellable communication between VS Code webview and extension. This is worth studying if we build a web UI.

### MCP Integration (Standout Feature)

Cline has the most sophisticated MCP support of any IDE agent:

- Detects configured MCP servers automatically
- Calls tools exposed by servers; user approves each invocation (or auto-approve)
- Has a **marketplace** with MCP server filtering (by installs, date, stars, category)
- User can ask "add a tool" and Cline creates a new MCP server, installs it, integrates it
- Supports dynamic tool schema discovery

**Key pattern:** MCP is not bolted on; it's a first-class part of the core Controller. Tools are MCP-first.

### Multi-Agent Architecture (In Development)

RFC #8378 proposes an **Interceptor Hook System** that would turn Cline from a single linear agent into an Actor-Critic collaborative model:

- Specialized external agents participate in the reasoning loop
- Uses A2A semantics (Agent-to-Agent protocol)
- MCP as transport layer
- Enables code review agents, test agents, security agents to intercept/comment on work

**This is exactly the direction we want to go.** We should study this RFC closely.

### Patterns Worth Cloning

1. **HostProvider abstraction** — cleanest platform isolation we've seen
2. **Task checkpoint system** — recovering from failures without replanning entire task
3. **Permission controller for shells** — flags dangerous operators before execution
4. **MCP marketplace integration** — discoverable tools, not manual config
5. **gRPC-over-postMessage** — best transport we've found for browser-based agents
6. **Multi-agent RFC** — Actor-Critic with A2A semantics is our future direction

---

## Category 3: Aider — The Git-Native Pair Programmer

**GitHub:** https://github.com/Aider-AI/aider  
**Stars:** 15K+ and growing  
**Installation:** `pip install aider-chat` (Python)

### What Aider Is

A terminal-based AI pair programmer that integrates tightly with Git. Every code change becomes a reviewable Git diff; every agent modification is staged as a commit with a generated message.

**Core principle:** Discipline through git. Every action is an atomic, reviewable change.

### Key Differentiators

| Feature | Aider | OpenClaw | Cline |
|---------|-------|----------|-------|
| Interface | Terminal only | Multi-channel | IDE plugin |
| Git focus | First-class citizen | N/A | Background tool |
| Model support | Any via LiteLLM | Model-agnostic | 10+ providers |
| Free tier | Yes, full featured | Limited | N/A |
| Code review | Forced (git workflow) | Optional | Optional |

### MCP in Aider

Aider has **community implementations** of MCP servers but not native MCP support yet (as of April 2026). Community projects include:

- `disler/aider-mcp-server` — Tool to call Aider via MCP
- `sengokudaikon/aider-mcp-server` — Directory-based file editing
- `git-commit-aider` — MCP server for automated commits

**Status:** Issue #3314 tracks native MCP support; appears to be pending.

### Patterns Worth Cloning

1. **Diff-first UI** — show staged changes inline before committing
2. **Git-as-audit-trail** — every agent action is a reviewable commit
3. **Model-agnostic backend** — LiteLLM abstraction lets any provider work
4. **Disciplined workflows** — agents can't hide changes; everything is explicit

---

## Category 4: ClawCode — The Clean-Room Rewrite (Fastest Growing)

**Main site:** https://claw-code.codes/  
**GitHub (one mirror):** https://github.com/ultraworkers/claw-code  
**Stars:** 100K in 24 hours (fastest in GitHub history)  
**Language:** Python (clean-room rewrite), Rust port in progress  
**Status:** Actively developed, multiple competing clean-room implementations

### What ClawCode Is

A **clean-room rewrite** of the Claude Code agent harness, created after March 31 leak by reading the exposed architecture and reimplementing it from scratch (no copying Anthropic code).

**Key fact:** This is NOT a fork of leaked code; it's a reimplementation of the patterns revealed by the leak. Legally distinct.

### Why It Matters

ClawCode demonstrates that Claude Code's agent harness is:
1. **Cloneable** — the architecture is straightforward enough to reimplement in 24h
2. **Understandable** — the leaked 512K lines reveal how agentic orchestration works
3. **Not magic** — the "secret sauce" is prompt engineering + permission system + tool definitions, not novel algorithms

This is validation that our approach (studying the leaked code, building our own harness) is sound.

### Architecture Insights from the Rewrite

From analysis of what leaked and what ClawCode reimplemented:

- **46K-line query engine** — context compression in 3 layers
- **40+ tools** — each with self-contained schema and per-tool permission checks
- **19 permission-gated tools** — independently sandboxed (no single "permission gate")
- **6 MCP transport types** — Stdio, SSE, HTTP, WebSocket, SDK, ClaudeAiProxy
- **Three-layer memory** — not just "store everything and retrieve"; selective compression

**The tools exposed in the leak:**
- File operations (read, write, delete)
- Bash execution (with guardrails)
- Browser automation
- MCP orchestration
- Memory/context management
- Git operations
- Code inspection (AST, regex search, etc.)

### Patterns to Learn

1. **Modular tool architecture** — tools as isolated, schema-first components
2. **Three-layer context** — full context / compressed context / summary
3. **Per-tool permission model** — not monolithic approval, granular per capability
4. **MCP transport abstraction** — switch between Stdio, HTTP, WebSocket without changing logic

---

## Category 5: Continue.dev — The Configuration-Driven IDE

**Docs:** https://docs.continue.dev/  
**GitHub:** https://github.com/continuedev/continue  
**Install:** VS Code, JetBrains, or self-host  
**MCP Support:** First-class, via YAML config

### What Continue Is

An IDE extension that emphasizes **configuration over code**. You define what tools the agent can see, which models to use, what context sources to tap, and Continue orchestrates the MCP servers.

**Core principle:** Customization via YAML, not code modification.

### MCP Architecture (Strongest in IDE Space)

Continue is an **MCP Host** — it owns MCP server connections and surfaces their tools/prompts/resources to the agent.

Configuration sources (merged in order):
1. `config.yaml` — YAML configuration
2. `config.json` — JSON configuration
3. `~/.continue/mcp.json` — User-specific servers

MCP transport types supported:
- **Stdio** — local servers via stdin/stdout
- **SSE** — Server-Sent Events for real-time streaming
- **Streamable-HTTP** — standard HTTP with streaming

**Configuration example pattern:**
```yaml
mcp_servers:
  - name: filesystem
    type: stdio
    command: "python"
    args: ["mcp_filesystem_server.py"]
    
  - name: web-search
    type: sse
    url: "http://localhost:8000"
```

### Patterns Worth Cloning

1. **Configuration loading pipeline** — merges YAML, JSON, user configs
2. **MCP Host pattern** — manages multiple server connections
3. **Context composition** — MCP servers contribute resources (docs, files, prompts)
4. **Slash commands from MCP** — servers can define `/` commands that agents use
5. **Stateless configuration** — no runtime state pollution; config is source of truth

---

## Comparison Matrix: What Exists Right Now

| Tool | Type | Autonomy | MCP | Git Focus | Channels | Free | Maturity | Pattern Value |
|------|------|----------|-----|-----------|----------|------|----------|---------------|
| **OpenClaw** | Autonomous agent | High | Client | N/A | 15+ | Partial | Mature | Skills system, memory |
| **Cline** | IDE agent | Medium | Host | Background | 1 (IDE) | Yes | v1.0+ | Architecture, multi-agent RFC |
| **Aider** | Terminal agent | Low | External | First-class | 1 (CLI) | Yes | Mature | Git discipline, diff-first |
| **ClawCode** | Reimplementation | High | TBD | Background | 1 (CLI) | Yes | Beta | Architecture validation, tool patterns |
| **Continue** | IDE extension | Low | Host | N/A | 1 (IDE) | Yes | Mature | Config loading, MCP host pattern |

---

## What Each Tool Does Best (And Where to Clone From)

### For Skills/Crafts System
**Winner: OpenClaw**
- Metadata-first skill definition (SKILL.md with frontmatter)
- Public registry for sharing
- Agents can write their own skills
- Pattern maps directly to our `crafts/` design

### For MCP Integration
**Winner: Cline**
- Marketplace UI for discovering servers
- Automatic tool detection
- User can request "add a tool" and it happens
- gRPC-over-postMessage transport (if we go web)

### For Git Workflow Integration
**Winner: Aider**
- Diffs as first-class objects
- Atomic commits for audit trail
- Model-agnostic backend (LiteLLM)

### For Configuration & Composition
**Winner: Continue**
- YAML-first approach
- Clean merging of config sources
- Context composition from multiple servers

### For Architecture Lessons
**Winner: ClawCode + Claude Code leak analysis**
- Permission model per tool
- Three-layer context compression
- Tool schema as contract
- Transport abstraction

---

## What Anthropic Is Doing: The Relationship Change

### April 4, 2026 — The Monetization Shift

Starting today, Anthropic changed how Claude Code subscriptions work:

**Before:** Claude Code subscribers' subscription minutes covered usage of third-party harnesses (OpenClaw, Cline, etc. if they used Claude backend).

**After:** Third-party harness usage requires separate pay-as-you-go billing, outside the subscription.

**Why:** The source leak made open-source alternatives viable overnight. Anthropic can't control OpenClaw, Cline, or ClawCode. By decoupling billing, they:
1. Capture usage that would otherwise go to cheaper open-source tools
2. Differentiate Claude Code's first-party integration
3. Monetize agent workloads directly (agents run more continuously than humans)

**Also launched:** Claude Code Channels — native Telegram/Discord integration for direct agent access (competing with OpenClaw's multi-channel strategy).

---

## Recommendations: What to Clone Into engineering/src/

### Priority 1: Cline Architecture (Most Leverage)

**Repo:** https://github.com/cline/cline  
**What to extract:**
1. HostProvider abstraction pattern — cleanest platform isolation
2. McpHub singleton with tool registry
3. StateManager + Task checkpoint system
4. CommandPermissionController (shell safety)
5. Multi-agent RFC (study, implement incrementally)

**Why:** Cline is the most active, most widely deployed, cleanest codebase. Its patterns transfer directly to our CLI and any future browser UI.

### Priority 2: OpenClaw Skills System

**Repo:** https://github.com/openclaw/openclaw  
**What to extract:**
1. SKILL.md metadata format
2. Skill directory structure
3. Registry concept (skills/clawhub)
4. Autonomous skill creation patterns

**Why:** Maps directly onto our crafts/commands design. We can port OpenClaw's skill registry pattern into our library schema.

### Priority 3: Claude Code Agent Harness (Study, Don't Copy)

**Source:** Leaked source + analyses  
**What to study (no copying):**
1. Permission model per tool (not monolithic)
2. Three-layer context compression
3. Tool schema as RPC contract
4. MCP transport abstraction (6 types)

**Why:** Validation that our direction is right. Also teaches us what NOT to do (e.g., embedded MCP instead of orchestrating external servers).

### Priority 4: Continue Configuration Pipeline

**Repo:** https://github.com/continuedev/continue  
**What to extract:**
1. Configuration loading and merging logic
2. YAML-first approach
3. MCP server connection lifecycle

**Why:** If we want configuration-first operations (which the captain seems to prefer), Continue has the cleanest implementation.

---

## What NOT to Clone (Or Be Careful With)

### ClawCode
- Actively litigated (Anthropic's DMCA vs GitHub copyleft)
- Clean-room but legally ambiguous
- Still in beta; may break frequently
- Python rewrite may not translate to our TypeScript harness

### Aider
- Tightly coupled to Git (limits generality)
- Python-based (foreign to our Node.js stack)
- Less sophisticated MCP integration

### The Leaked Claude Code Source Directly
- Legal risk (though reading for patterns is likely defensible)
- 512K lines is not maintainable; we already have that problem
- The "clean-room rewrite" approach (learn the patterns, implement from scratch) is safer

---

## What Changed Since We Last Looked at ECC

The landscape shifted dramatically in 72 hours:

1. **Source code is now known** — the harness patterns are documented and reimplemented
2. **MCP is now the standard** — every tool we studied has or is building MCP integration
3. **Autonomous agents are mainstream** — OpenClaw (multi-channel, persistent memory) is the reference model
4. **Monetization is moving upstream** — Anthropic can't contain agent economics anymore
5. **Clean-room reimplementation is viable** — ClawCode proves the architecture is reproducible

This validates the captain's direction: investing in our own harness, studying these patterns, building on MCP.

---

## Questions for the Captain

1. **Autonomous vs. Approval-Loop?** OpenClaw is fully autonomous (within guardrails). Cline requires user approval. Which direction for our agents?

2. **IDE vs. Terminal vs. Multi-Channel?** Continue/Cline are IDE-first. OpenClaw is multi-channel. Should we invest in all three, or pick a primary interface?

3. **Configuration-First or Code-First?** Continue is configuration-driven (YAML). Cline is more code-oriented (TypeScript hooks). Which fits our philosophy?

4. **MCP Host or Client?** Claude Code/Cline are hosts (embed MCP). OpenClaw is a client (call external servers). We're currently a host; are we right?

5. **Skills Registry?** Should we build an internal skill registry (like OpenClaw's 13K+ community skills) or stay library-as-registry?

---

## Sources

### Primary Documentation
- [OpenClaw GitHub](https://github.com/openclaw/openclaw)
- [Cline GitHub](https://github.com/cline/cline)
- [Continue.dev Docs](https://docs.continue.dev/)
- [Aider GitHub](https://github.com/Aider-AI/aider)

### Claude Code Leak Analysis
- [The Register: Anthropic Accidentally Exposes Claude Code](https://www.theregister.com/2026/03/31/anthropic_claude_code_source_code/)
- [VentureBeat: Claude Code's Source Code Appears to Have Leaked](https://venturebeat.com/technology/claude-codes-source-code-appears-to-have-leaked-heres-what-we-know/)
- [TechCrunch: Anthropic Took Down Thousands of GitHub Repos](https://techcrunch.com/2026/04/01/anthropic-took-down-thousands-of-github-repos-trying-to-yank-its-leaked-source-code-a-move-the-company-says-was-an-accident/)
- [Axios: Anthropic Leaked Its Own Claude Source Code](https://www.axios.com/2026/03/31/anthropic-leaked-source-code-ai)

### Tool Comparisons
- [AI Coding IDE Wars: OpenClaw vs Kilo Code vs Claude Code vs Cline](https://www.digitalapplied.com/blog/ai-coding-ide-wars-openclaw-kilo-code-claude-code-cline-2026)
- [DataCamp: 13 Best Agentic IDEs in 2026](https://www.datacamp.com/blog/best-agentic-ide/)
- [DigitalOcean: 10 Claude Code Alternatives](https://www.digitalocean.com/resources/articles/claude-code-alternatives)
- [Morphllm: Cline vs Continue (2026)](https://www.morphllm.com/comparisons/cline-vs-continue)

### Architecture & Patterns
- [ClawCode Official](https://claw-code.codes/)
- [Layer5: The Claude Code Source Leak: 512,000 Lines, a Missing .npmignore](https://layer5.io/blog/engineering/the-claude-code-source-leak-512000-lines-a-missing-npmignore-and-the-fastest-growing-repo-in-github-history/)
- [WaveSpeedAI: What Claude Code's Leaked Architecture Reveals](https://wavespeed.ai/blog/posts/what-is-claw-code/)
- [Cline Discussion #8378: Multi-Agent Interceptor Hooks](https://github.com/cline/cline/discussions/8378)

### MCP Integration
- [Cline MCP Setup Guide](https://evomap.ai/blog/cline-mcp-servers-setup-guide-2026)
- [Scrapfly: MCP Integration for Cline](https://scrapfly.io/docs/mcp/integrations/cline)
- [OpenClaw MCP Integration](https://docs.openclaw.ai/cli/mcp)
- [Continue MCP Documentation](https://docs.continue.dev/customize/deep-dives/mcp)

### Monetization & Business
- [VentureBeat: Anthropic Just Shipped Claude Code Channels](https://venturebeat.com/orchestration/anthropic-just-shipped-an-openclaw-killer-called-claude-code-channels-letting-you-message-it-over-telegram-and-discord/)
- [TechCrunch: Claude Code Subscribers Will Need to Pay Extra for OpenClaw Usage](https://techcrunch.com/2026/04/04/anthropic-says-claude-code-subscribers-will-need-to-pay-extra-for-openclaw-support/)

### Security & Analysis
- [Snyk: How "Clinejection" Turned an AI Bot into a Supply Chain Attack](https://snyk.io/blog/cline-supply-chain-attack-prompt-injection-github-actions/)
- [SecurityWeek: Critical Vulnerability in Claude Code](https://www.securityweek.com/critical-vulnerability-in-claude-code-emerges-days-after-source-leak/)
- [BleepingComputer: Claude Code Leak Used to Push Infostealer Malware](https://www.bleepingcomputer.com/news/security/claude-code-leak-used-to-push-infostealer-malware-on-github/)

---

**Next Steps:**
- [ ] Deep-read Cline's HostProvider pattern (`.src/extraction/cline-hostprovider/`)
- [ ] Port OpenClaw's SKILL.md format to our library schema
- [ ] Study Claude Code's permission-per-tool model vs our monolithic approach
- [ ] Evaluate multi-agent RFC against our actor-critic direction
- [ ] Document extracted patterns in engineering/src/ with attribution

