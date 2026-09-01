---

title: "Agent Instruction File Standards (March 2026)"
description: "Survey of the emerging landscape of agent instruction file conventions — AGENTS.md, SOUL.md, CLAUDE.md, and tool-specific alternatives — as of March 2026."
domain: agents
contains: agents-md, soul-md
governs: agentic-system
factors-through: system-prompt, context-engineering, model-context-protocol
date-created: 2026-03-29
---

This text surveys the conventions for instructing AI agents via files placed in project repositories.
As of March 2026, three conventions have meaningful adoption, several tool-specific alternatives exist, and a governance structure is forming through the Linux Foundation's Agentic AI Foundation.

## 1. The core problem

An AI coding agent operating on a codebase needs project-specific context: how to build, how to test, what style conventions to follow, what files to leave alone, what the architecture looks like.
An agent without this context hallucinates conventions or applies generic defaults that conflict with project norms.

Before dedicated agent instruction files, this context lived in READMEs, contributing guides, CI configurations, and developer memory — none optimized for machine consumption.
The conventions discussed here all respond to the same need: a predictable, machine-readable location for project context.

A separate problem, addressed by [SOUL.md](../terms/soul-md.md), is agent *identity*: who the agent is — its voice, values, and behavioral constraints.

## 2. The conventions

### 2.1 AGENTS.md

**Scope:** Project-level instructions. **Created:** OpenAI (with Codex), publicly released August 2025. **Governance:** Linux Foundation Agentic AI Foundation (AAIF) since December 2025. **Adoption:** 60,000+ open-source projects; 20+ supporting tools. **Format:** Plain Markdown, no schema, no required fields.

[AGENTS.md](../terms/agents-md.md) is the most widely adopted convention and the only one with formal governance through a standards body.
Its strength is simplicity: any agent that can read Markdown can use it.
Its weakness is the same: without a schema, there is no way to validate structure, completeness, or correctness.
Quality varies enormously across projects.

The nearest-ancestor resolution rule (agents read the closest AGENTS.md in the directory tree) is well-suited to monorepos where different subdirectories have different build systems, languages, or conventions.

### 2.2 CLAUDE.md

**Scope:** Combined project instructions and agent identity, specific to Claude Code. **Created:** Anthropic, released with Claude Code. **Governance:** Anthropic (proprietary convention). **Adoption:** Every project using Claude Code; not read by other agents. **Format:** Plain Markdown, no schema.

CLAUDE.md combines project-level instructions (build commands, style rules) with agent-level directives (behavioral constraints, response style) in a single file.
It supports directory-level scoping (per-directory CLAUDE.md files override or extend the root file) and user-level configuration (~/.claude/CLAUDE.md for cross-project preferences).

The convention is tightly coupled to Claude Code's execution model: CLAUDE.md content is injected into the system prompt and shapes the agent's behavior directly.
This makes it more powerful than AGENTS.md for Claude Code users (behavioral instructions are actually enforced) but non-portable (other agents ignore it).
In practice, projects that use Claude Code often maintain both CLAUDE.md and AGENTS.md, with overlapping content.

### 2.3 SOUL.md

**Scope:** Agent identity and personality. **Created:** Aaron J.
Mars, published February 2026. **Governance:** Community convention, no standards body. **Adoption:** Lower than AGENTS.md; supported by Claude Code, OpenClaw, Cursor, and others. **Format:** Markdown with an optional five-file structure (SOUL.md, STYLE.md, SKILL.md, MEMORY.md, data/).

[SOUL.md](../terms/soul-md.md) focuses on *who the agent is* rather than *what it should do*.
It encodes identity, worldview, voice patterns, and behavioral constraints.
The philosophical premise — that identity is encoded in language and can be transferred to an LLM — has not been empirically verified at scale.

The extended Soul Spec (v0.5) provides more structure than AGENTS.md, with a `.soul/` directory containing machine-readable metadata (`soul.json`), identity documents, rules, and context files — closer to a schema, though advisory.

### 2.4 Tool-specific conventions

Several agent tools have introduced their own instruction file conventions:

- **`.cursorrules`** — Cursor-specific.
  Markdown file in project root.
  Predates AGENTS.md.
  Widely used in the Cursor community but not portable.
- **`.windsurfrules`** — Windsurf-specific.
  Same pattern as `.cursorrules`.
- **`.github/copilot-instructions.md`** — GitHub Copilot-specific.
  Lives in the `.github` directory alongside other GitHub configuration files.
- **`.aider.conf.yml` / `.aider/conventions.md`** — Aider-specific.
  YAML configuration plus optional Markdown conventions file.

These tool-specific files solve the same problem as AGENTS.md but fragment the ecosystem: a project that supports multiple agent tools needs multiple files with overlapping content.
AGENTS.md was explicitly designed to address this fragmentation by providing a single file that all tools could read.

## 3. The taxonomy

The conventions divide along two axes:

|                     | Project-scoped             | Agent-scoped              |
|---------------------|----------------------------|---------------------------|
| **Tool-agnostic**   | AGENTS.md                  | SOUL.md                   |
| **Tool-specific**   | .cursorrules, .windsurfrules, .github/copilot-instructions.md | CLAUDE.md |

AGENTS.md occupies the ideal quadrant (tool-agnostic, project-scoped) for broad adoption.
CLAUDE.md is the most capable (it can enforce behavioral constraints because it controls the runtime) but the least portable.
SOUL.md addresses a dimension the others ignore (agent identity) but has the least adoption and no governance structure.

## 4. Open questions

**Convergence or coexistence?** AGENTS.md has the strongest adoption trajectory and institutional backing.
CLAUDE.md's tight runtime integration gives it capabilities AGENTS.md cannot match without schema enforcement.
The trajectory points toward coexistence: AGENTS.md as the universal baseline, tool-specific files for runtime-enforced constraints.

**Does identity matter?** SOUL.md's premise — that conditioning an agent on a persistent identity produces measurably different behavior from conditioning it on task instructions alone — is testable.
No published study has tested it at scale.
If identity conditioning makes no measurable difference to output quality, SOUL.md addresses a nonexistent problem.
If it does, the other conventions are missing a critical dimension.

**Schema or no schema?** AGENTS.md's decision to avoid a schema minimizes the barrier to adoption.
Without a schema, tooling cannot validate, lint, or auto-generate instruction files.
As adoption grows, pressure for optional schema support (via YAML frontmatter or a companion JSON file) will grow with it.

**Instruction versus configuration.** Current conventions encode instructions in natural language — maximally flexible, inherently ambiguous.
The alternative is structured data (JSON Schema for tool definitions, YAML for build rules) that agents consume programmatically — less flexible, more reliable.
[MCP](../theories/model-context-protocol/index.md)'s tool definition schema exemplifies the structured approach.

## Sources

- agents.md.
  Official site.
- OpenAI.
  "Codex: AGENTS.md Guide." developers.openai.com.
- GitHub Blog.
  "How to Write a Great agents.md: Lessons from over 2,500 Repositories."
- Linux Foundation.
  "Agentic AI Foundation Announcement."
  December 9, 2025.
- Mars, A.J. "SOUL.md." github.com/aaronjmars/soul.md.
  February 2026.
- Anthropic.
  Claude Code documentation.
