---
part-of:
  - claude-code

title: "Extension Architecture in Claude Code"
description: "How Claude Code's four extension mechanisms — CLAUDE.md, skills, hooks, and MCP servers — operate at different levels and complement each other in practice."
date-created: 2026-03-30
keywords:
  - claude-code
  - extension-architecture
  - agent-design
requires:
  - claude-code
  - claude-md
  - slash-commands
  - hooks
  - model-context-protocol
references:
  - id: anthropic-best-practices
    type: document
    title: Claude Code Best Practices
    author:
      - literal: Anthropic
    container-title: Anthropic Engineering
    issued:
      - year: 2025
    URL: https://www.anthropic.com/engineering/claude-code-best-practices
  - id: anthropic-plugins
    type: document
    title: Customize Claude Code with plugins
    author:
      - literal: Anthropic
    container-title: Anthropic Blog
    issued:
      - year: 2025
    URL: https://www.anthropic.com/news/claude-code-plugins
  - id: anthropic-hooks-docs
    type: document
    title: Hooks reference
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/hooks
  - id: anthropic-skills-docs
    type: document
    title: Extend Claude with skills
    author:
      - literal: Anthropic
    container-title: Claude Code Docs
    issued:
      - year: 2025
    URL: https://docs.anthropic.com/en/docs/claude-code/slash-commands
---

[Claude Code](../../../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/software/claude-code/terms/claude-code.md) is extensible through four mechanisms. They operate at different levels of the system and serve different purposes. Understanding which mechanism to use for a given customization is the central design decision when configuring Claude Code for a project.

## The four mechanisms

| Mechanism | What it is | When it loads | What it affects | Deterministic? |
|---|---|---|---|---|
| [CLAUDE.md](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/claude-md.md) | Markdown instruction file | Every session (root) or lazily (subdirectory) | Model reasoning and decisions | No — advisory |
| [Skills](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/slash-commands.md) | SKILL.md files invoked with `/name` | On demand (user or model invocation) | Model reasoning for a specific task | No — advisory |
| [Hooks](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/hooks.md) | Shell commands in settings.json | On tool-call lifecycle events | Runtime behavior before/after tool execution | Yes — mandatory |
| [MCP servers](../../../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/software/agents/terms/model-context-protocol.md) | External processes exposing tools/resources | At session start (configured servers) | Available tool set and data sources | Yes — tool availability is deterministic; tool invocation is model-decided |

## The distinction that matters

The four mechanisms split along two axes:

**Advisory vs. mandatory.** CLAUDE.md and skills shape the model's reasoning — they tell it what to do, but the model ultimately decides how to interpret and follow those instructions. Hooks execute deterministically on events, regardless of what the model decides. MCP servers are hybrid: their availability is deterministic (the tools exist or they don't), but whether the model invokes a tool is its decision.

**Always-loaded vs. on-demand.** CLAUDE.md at the project root loads on every session, consuming [context](../../../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/terms/context-window.md) whether relevant or not. Skills load only when invoked. Hooks are configured but consume no context (they are settings, not prompt content). MCP server tool definitions load at session start.

## When to use each

**Use CLAUDE.md** for rules the agent should follow on every request: build commands, architectural constraints, style rules, what not to touch. Keep it short — everything in CLAUDE.md competes for attention with the user's actual request.

**Use skills** for task-specific instructions that only matter when that task is being performed: commit conventions, review checklists, deployment procedures, domain-specific workflows. Skills implement [progressive disclosure](../../../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/software/claude-code/terms/progressive-disclosure.md): the instructions exist in the project but don't load until needed.

**Use hooks** for guardrails and automation that must execute regardless of model behavior: blocking dangerous shell commands (PreToolUse), logging all file edits for audit (PostToolUse), sending notifications when Claude is idle (Notification). If a behavior must happen, it belongs in a hook, not in CLAUDE.md — the model can misinterpret or ignore instructions, but it cannot suppress a hook.

**Use MCP servers** for connecting Claude to external data and tools: databases, APIs, file-format parsers, specialized computation. MCP extends what Claude can *do*; the other mechanisms shape *how* it does things.

## How they compose

In practice, these mechanisms layer:

1. **CLAUDE.md** establishes the session context — "this is a Python project, use pytest, don't modify the migrations directory."
2. **MCP servers** make tools available — a database connector, a documentation search server, a deployment API.
3. **Skills** provide deep instructions when a specific task arises — `/deploy` loads the deployment checklist, `/review-pr` loads the review conventions.
4. **Hooks** enforce invariants throughout — every Bash command is validated against a blocklist, every file edit is logged.

The plugin system (late 2025) bundles all four into installable packages: a plugin might include a SKILL.md, an MCP server configuration, a hook, and a CLAUDE.md snippet, all installed with `/plugin`. This does not change the underlying architecture — it packages existing mechanisms for distribution.

## Common mistakes

**Putting guardrails in CLAUDE.md instead of hooks.** "Never run rm -rf" in CLAUDE.md is advice the model might forget under context pressure. A PreToolUse hook that rejects `rm -rf` in Bash commands is a hard gate.

**Putting everything in root CLAUDE.md instead of skills.** A 500-line CLAUDE.md with deployment procedures, review conventions, and testing protocols loads on every request, diluting relevance. Move each to a skill; the root file should point to them, not contain them.

**Using MCP when a skill suffices.** If the customization is instructions (what to do), use a skill. If it's capabilities (tools and data the model needs access to), use MCP. A skill that just wraps a curl command is better as an MCP server; a set of deployment steps is better as a skill.
