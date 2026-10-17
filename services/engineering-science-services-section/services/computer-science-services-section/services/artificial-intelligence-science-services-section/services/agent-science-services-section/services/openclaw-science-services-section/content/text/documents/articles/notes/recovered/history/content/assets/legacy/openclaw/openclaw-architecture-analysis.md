---
title: "OpenClaw Architecture Analysis"
description: "Architecture analysis of OpenClaw — SOUL.md/HEARTBEAT.md prescriptive identity, plugin slot system, autonomous skill creation, file-backed memory with dreaming, DM Policy input gating, ClawHub community registry, and patterns relevant to our harness."
date-created: 2026-04-04
source-repo: operations/engineering/fars/src/openclaw/
related:
  - continuous-learning-in-agentic-harnesses.md
  - cline-architecture-analysis.md
  - agentic-harness-landscape-2026.md
---

OpenClaw is an open-source personal AI assistant that runs on user devices and answers through messaging channels (WhatsApp, Telegram, Slack, Discord, iMessage, Matrix, and more). Unlike coding-focused harnesses such as Claude Code or Cline, OpenClaw targets the "always-on personal assistant" use case — a gateway that manages channels, tools, memory, and proactive behaviors across a persistent agent lifecycle. The source is TypeScript (ESM), Node 22+, with a plugin architecture that makes most capabilities optional.

This analysis reads the source at `operations/engineering/fars/src/openclaw/` to extract patterns relevant to our harness design. OpenClaw's architectural decisions are oriented around a different problem than ours (multi-channel messaging vs. repository engineering), but several mechanisms are directly transferable.

## SOUL.md and HEARTBEAT.md: Prescriptive Identity + Proactive Monitoring

OpenClaw's workspace bootstrap loads a fixed set of markdown files in a defined order:

1. **SOUL.md** — who the agent is: tone, opinions, boundaries, behavioral stance
2. **USER.md** — who the human is: preferences, context, relationship to the agent
3. **AGENTS.md** — operational rules: file organization, tool usage, safety constraints
4. **MEMORY.md** — long-term curated memory (loaded only in "main sessions," not group chats)
5. **HEARTBEAT.md** — proactive monitoring checklist
6. **BOOTSTRAP.md** — first-run instructions (self-deleting after execution)

The `bootstrap-extra-files` hook (`src/hooks/bundled/bootstrap-extra-files/`) allows injecting additional files from glob patterns, enabling monorepo-style context loading without changing the workspace root.

### SOUL.md: Identity as Configuration

SOUL.md is injected into normal sessions and shapes agent behavior at the system-prompt level. The template (`docs/reference/templates/SOUL.md`) establishes five principles: be genuinely helpful, have opinions, be resourceful before asking, earn trust through competence, and remember you're a guest.

The key architectural insight is that SOUL.md is *mutable by the agent*. The agent is encouraged to evolve its own SOUL.md as it learns who it is, with the constraint that changes must be disclosed to the user. This creates a feedback loop where the agent's personality develops over time rather than being static configuration.

The companion concept doc (`docs/concepts/soul.md`) provides a "Molty prompt" — a meta-prompt the agent can run against itself to rewrite SOUL.md with stronger personality. This is a lightweight form of self-modification: the agent rewrites its own identity file through normal tool use.

### HEARTBEAT.md: Proactive Monitoring

HEARTBEAT.md defines a checklist of periodic tasks. The heartbeat system (`src/infra/heartbeat-runner.ts` and related files) is substantial infrastructure:

- **Configurable interval** (`agents.defaults.heartbeat.every`) with a default cadence
- **Active hours** (`heartbeat-active-hours.ts`) — respects quiet periods (e.g. 23:00–08:00)
- **Event-driven wake** (`heartbeat-wake.ts`) — tasks can request immediate heartbeat runs
- **Task parsing** (`parseHeartbeatTasks`) — HEARTBEAT.md entries become structured tasks with due-time tracking
- **Visibility control** (`heartbeat-visibility.ts`) — determines whether heartbeat output goes to channels or stays internal
- **Delivery targeting** — heartbeat responses can route to specific channels (Telegram, Discord, etc.)
- **Heartbeat state tracking** — `memory/heartbeat-state.json` records what was checked and when

The heartbeat is where OpenClaw's "always-on" nature shows: the agent periodically wakes, reads its checklist, checks email/calendar/mentions/weather, and either acts or replies `HEARTBEAT_OK` to stay quiet.

The system distinguishes heartbeats from cron jobs: heartbeats batch multiple checks with conversational context and can drift in timing, while cron jobs are for exact schedules, isolated execution, and direct channel delivery.

## Plugin Architecture: Slots, Capabilities, and Exclusive Selection

OpenClaw's plugin system (`src/plugins/`) is the most architecturally sophisticated component. It uses a manifest-first approach where plugin metadata is readable without executing plugin code.

### Discovery and Loading Pipeline

1. **Manifest validation** — `openclaw.plugin.json` is read and validated against JSON schema before any code runs
2. **Discovery** (`src/plugins/discovery.ts`) — finds plugins from bundled directory, npm packages, and workspace paths
3. **Loader** (`src/plugins/loader.ts`) — resolves and loads plugin entrypoints lazily
4. **Registry** (`src/plugins/registry.ts`) — assembles the runtime plugin registry with capability registrations
5. **Contract enforcement** (`src/plugins/contracts/`) — validates that plugin registrations match declared interfaces

### Capability Model

Every plugin registers against one or more capability types through typed registration methods:

| Capability | Registration |
|---|---|
| Text inference | `api.registerProvider(...)` |
| Speech | `api.registerSpeechProvider(...)` |
| Media understanding | `api.registerMediaUnderstandingProvider(...)` |
| Image generation | `api.registerImageGenerationProvider(...)` |
| Web search | `api.registerWebSearchProvider(...)` |
| Channel / messaging | `api.registerChannel(...)` |
| Memory | `api.registerMemoryRuntime(...)` |

Plugins are classified by shape: **plain-capability** (one type), **hybrid-capability** (multiple types), or **legacy hook-only** (no capabilities, just hooks).

### Exclusive Slots

The slot system (`src/plugins/slots.ts`) enforces that certain plugin kinds are exclusive — only one can be active at a time. Currently two slot kinds exist:

- **memory** — default: `memory-core`
- **contextEngine** — default: `legacy`

When a new plugin claims an exclusive slot, `applyExclusiveSlotSelection()` automatically disables all other plugins of the same kind. The selection is stored in config (`plugins.slots.memory = "memory-lancedb"`) and the system emits warnings when slots switch.

This is a clean solution to the "which memory backend?" problem. Rather than feature flags or conditional imports, the slot mechanism makes it a first-class config choice with automatic mutual exclusion.

### Plugin SDK Boundary

The Plugin SDK (`src/plugin-sdk/`) is the only public contract surface for plugins. Extensions import from `openclaw/plugin-sdk/*` subpaths; direct imports from `src/**` are prohibited. This boundary is enforced through import rules, test coverage, and CI architecture gates (`check-additional`).

Each bundled plugin exposes two local barrels:
- `api.ts` — light metadata surface for cross-package consumption
- `runtime-api.ts` — heavier runtime surface, loaded lazily

This progressive loading discipline keeps startup fast: discovery and config validation work from manifest metadata alone, with runtime imports deferred until actual execution.

## Memory Persistence: Two-Layer Files with Dreaming

OpenClaw's memory system is a file-backed, two-layer architecture implemented as a plugin (`extensions/memory-core/`).

### Two-Layer Structure

1. **Daily notes** — `memory/YYYY-MM-DD.md` files capture raw session events. These are append-only logs of what happened during each day.
2. **Long-term memory** — `MEMORY.md` is curated, distilled knowledge. The agent reviews daily notes and promotes significant items to MEMORY.md.

This maps directly to short-term vs. long-term memory. Daily files are high-volume, low-curation; MEMORY.md is low-volume, high-curation. The separation means the agent can always recover context (daily files exist) while keeping its active working memory lean (MEMORY.md stays small).

### Session Memory Hook

The `session-memory` hook (`src/hooks/bundled/session-memory/`) fires on `/new` or `/reset` commands. It reads the last N messages from the ending session, generates a descriptive filename slug via LLM, and saves to `memory/YYYY-MM-DD-slug.md`. This creates an automatic archive of every conversation with meaningful filenames.

### Dreaming: Autonomous Memory Consolidation

The memory-core plugin implements a "dreaming" system (`extensions/memory-core/src/dreaming.ts`) that runs as a managed cron job. Dreaming modes:

- **off** — no automatic promotion
- **core** — daily at 3am, promotes up to 10 candidates with min score 0.75
- **deep** — every 12 hours, stricter thresholds (min score 0.8, min 3 recalls, min 3 unique queries)
- **rem** — every 6 hours, most aggressive promotion

The promotion pipeline (`short-term-promotion.ts`) ranks short-term memory candidates by a weighted score combining recall count, unique query diversity, and recency. Candidates meeting the threshold are promoted to long-term storage. This is fully automatic — the agent consolidates its own memory while "sleeping."

The system also supports embedding-based search (`memory/embeddings.ts`, `memory/hybrid.ts`) with multiple embedding providers, temporal decay scoring (`memory/temporal-decay.ts`), and MMR (Maximum Marginal Relevance) diversification (`memory/mmr.ts`). Tools exposed to the agent: `memory_search` (semantic search across memories) and `memory_get` (retrieve specific memory by path).

### Security Boundary

MEMORY.md is loaded only in "main sessions" (direct chat with the human). In group chats, Discord channels, and multi-user contexts, long-term memory is withheld to prevent data leakage. This is a simple but effective privacy control.

## DM Policy: Input Gating and Access Control

The DM Policy system (`src/security/dm-policy-shared.ts`) controls who can interact with the agent through messaging channels. This is OpenClaw's answer to the "who gets to talk to my AI?" question.

### Policy Modes

- **open** — anyone can message the agent (no restrictions)
- **pairing** — unknown senders trigger a pairing flow (like Bluetooth pairing) where the user must approve the connection
- **allowlist** — only explicitly listed identifiers can interact
- **disabled** — DMs are completely blocked

The default is `pairing`, which balances accessibility with control. The allowlist merges from three sources: static config, pairing store (runtime approvals), and group-specific overrides.

### Group Policy

Separate from DM policy, groups have their own access model:
- **open** — anyone in the group can interact
- **allowlist** — only listed members
- **disabled** — agent ignores group messages entirely

### Command Gating

On top of message access, control commands (`/new`, `/reset`, `/stop`) have additional authorization. The `resolveControlCommandGate()` function checks whether the sender is authorized for administrative operations, preventing group members from resetting sessions they don't own.

### How This Shapes Learning

DM Policy indirectly shapes what the agent learns. In `pairing` mode, the agent only builds memory from approved contacts. In `allowlist` mode, memory is constrained to known users. In `open` mode, anyone's messages can influence the agent's memory — a potential contamination vector that the system acknowledges through its security docs.

## ClawHub: Community Skill Sharing

ClawHub (`clawhub.com`) is OpenClaw's community registry for skills. The `skills/clawhub/SKILL.md` provides the CLI integration:

```
clawhub search "postgres backups"  # Find skills
clawhub install my-skill           # Install to workspace
clawhub publish ./my-skill         # Publish from local directory
clawhub update --all               # Update all installed skills
```

Skills are distributed as `.skill` files (zip archives with `.skill` extension) containing `SKILL.md` plus optional `scripts/`, `references/`, and `assets/` directories. The packaging process (`scripts/package_skill.py`) validates structure, frontmatter, naming conventions, and description quality before allowing distribution.

The architectural principle is that **core stays lean** — new skills should be published to ClawHub first, not added to the bundled set. Core skill additions require a strong product or security reason. This keeps the base install small while allowing community-driven capability expansion.

### Skill-Creator: Autonomous Skill Authorship

The `skill-creator` skill (`skills/skill-creator/SKILL.md`) is a meta-skill that guides the agent through creating new skills. The process is structured:

1. **Understand** — gather concrete usage examples
2. **Plan** — identify reusable resources (scripts, references, assets)
3. **Initialize** — run `init_skill.py` to scaffold the skill directory
4. **Edit** — implement resources and write SKILL.md
5. **Package** — validate and bundle into a `.skill` file
6. **Iterate** — improve based on real usage

The skill emphasizes **progressive disclosure** in SKILL.md design: metadata (name + description) is always in context (~100 tokens), the body loads only when triggered (<5k tokens), and bundled resources load only when needed (unlimited, since scripts can execute without being read into context). This is context-window-aware design: skills explicitly compete for limited attention and must justify their token cost.

## Hooks System: Event-Driven Extensibility

OpenClaw's hook system (`src/hooks/`) provides event-driven extensibility through two layers.

### Internal Hooks

The internal hook system (`src/hooks/internal-hooks.ts`) defines five event types:
- **command** — user commands (`/new`, `/reset`, `/stop`)
- **session** — session lifecycle (start, end)
- **agent** — agent events (bootstrap)
- **gateway** — gateway lifecycle (startup)
- **message** — inbound/outbound messages (received, sent, before-send)

Hooks register against typed event signatures with full context objects. The `agent:bootstrap` event, for example, provides workspace directory, bootstrap files, config, session key, and agent ID.

### Managed Hooks (HOOK.md)

External hooks use the HOOK.md format (`src/hooks/types.ts`). Each hook is a directory containing:
- `HOOK.md` — frontmatter metadata (name, description, events, requirements)
- `handler.ts` — the executable handler

The frontmatter declares what events the hook handles, what binaries/env/config it requires, and how to install dependencies. Example from the `session-memory` hook:

```yaml
metadata:
  openclaw:
    events: ["command:new", "command:reset"]
    requires:
      config: ["workspace.dir"]
    install:
      - id: bundled
        kind: bundled
        label: "Bundled with OpenClaw"
```

Hooks can come from four sources: `openclaw-bundled` (shipped with core), `openclaw-managed` (installed via hook system), `openclaw-workspace` (workspace-local), and `openclaw-plugin` (provided by plugins).

### Policy and Lifecycle

Hook policy (`src/hooks/policy.ts`) determines which hooks are eligible to run based on platform, available binaries, environment variables, and config state. The loader (`src/hooks/loader.ts`) parses HOOK.md frontmatter, resolves handler paths, and validates requirements before registration.

Plugin-contributed hooks (`src/hooks/plugin-hooks.ts`) integrate through the plugin lifecycle — plugins register hooks during their `register()` call, and these hooks are merged into the global hook registry.

## What We Should Adopt

### 1. Exclusive Slot Mechanism

Our harness has similar "only one should be active" situations (e.g., which memory backend, which publishing pipeline). The slot pattern — declare exclusive kinds, auto-disable competitors on selection, store the choice in config — is cleaner than ad-hoc feature flags.

**Concrete application**: Our memory system currently writes to `operations/engineering/records/memory/`. If we add alternative memory backends (graph-based, embedding-based), the slot pattern would let us switch cleanly.

### 2. HEARTBEAT.md-Style Proactive Monitoring

Our observer agent runs reactively on session events. OpenClaw's heartbeat system adds a periodic wake cycle with active-hours awareness, state tracking, and batched checks. We could implement this through our existing cron infrastructure to run periodic reviews of stale plans, overdue tasks, and session health — similar to what `/standup` does but automated.

**Concrete application**: A `HEARTBEAT.md` equivalent that lists periodic checks (stale plans, orphaned files, failed sessions) with due-time tracking through `heartbeat-state.json`.

### 3. Dreaming: Autonomous Memory Consolidation

Our continuous-learning system creates instincts from observations, but lacks a consolidation cycle. OpenClaw's dreaming system — ranked candidates promoted on a cron schedule — could be adapted for our instinct evolution. Instincts that cross a confidence threshold could auto-promote to skills without human intervention.

**Concrete application**: A nightly cron that runs `/evolve` logic automatically, promoting high-confidence instincts to skills and archiving decayed ones.

### 4. Progressive Disclosure in Skill Design

OpenClaw's three-level loading (metadata → body → resources) is a disciplined approach to context window management. Our skills currently load the full body on trigger. Splitting into light metadata descriptions and heavier reference files would reduce context consumption, especially as our skill count grows.

**Concrete application**: Move detailed reference content from skill bodies into `references/` subdirectories, keeping SKILL.md bodies under 500 lines with pointers to the fuller documentation.

### 5. Session Memory with Descriptive Slugs

Our session logs record events but don't create human-readable summaries. OpenClaw's session-memory hook — extract last N messages, LLM-generate a slug, save to dated file — creates an auditable, browsable history that's useful for cross-session context.

**Concrete application**: A hook on session end that writes `operations/engineering/records/sessions/YYYY-MM-DD-slug.md` with conversation highlights and key decisions.

### 6. DM Policy as a Pattern for Input Gating

While we don't have messaging channels, the DM Policy pattern generalizes to "who/what gets to trigger agent work." We could apply similar gating to our dispatch system — which tasks auto-dispatch, which require human approval, which are blocked entirely — using the same open/pairing/allowlist/disabled taxonomy.

### What Not to Adopt

OpenClaw's multi-channel messaging architecture, provider plugin system, and gateway infrastructure solve problems we don't have. The agent shape classification (plain-capability, hybrid-capability, legacy hook-only) adds complexity that's only justified by their plugin ecosystem scale. Their AGENTS.md-as-CLAUDE.md symlink convention and Mintlify docs hosting are project-specific patterns with no transfer value.

## Comparison to Our Harness

| Concern | OpenClaw | 561 Harness |
|---|---|---|
| Identity | SOUL.md (mutable by agent) | SOUL.md (read-only reference) |
| Proactive work | HEARTBEAT.md + heartbeat runner | Observer agent (reactive only) |
| Plugin model | Capability registration + exclusive slots | Agent/skill/command taxonomy |
| Memory | Two-layer files + embedding search + dreaming | Flat memory files with manual curation |
| Input gating | DM Policy (open/pairing/allowlist/disabled) | No formal input gating |
| Skill sharing | ClawHub registry | Local skills only |
| Hook format | HOOK.md with frontmatter metadata | JavaScript hooks with settings.json config |
| Context management | Three-level progressive disclosure | Full body on trigger |

OpenClaw optimizes for the personal assistant use case: persistent across sessions, multi-channel, proactive. Our harness optimizes for the engineering assistant use case: repository-aware, plan-driven, research-grounded. The transferable patterns are in the infrastructure layer — slot exclusion, memory consolidation, proactive monitoring, and context-aware skill loading — not in the application layer.

## See Also

- [Continuous Learning in Agentic Harnesses](./continuous-learning-in-agentic-harnesses.md) — pattern comparison across harnesses
- [Cline Architecture Analysis](./cline-architecture-analysis.md) — VS Code extension architecture patterns
- [Agentic Harness Landscape 2026](./agentic-harness-landscape-2026.md) — broader landscape survey
