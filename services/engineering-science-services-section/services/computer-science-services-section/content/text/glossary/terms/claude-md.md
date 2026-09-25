---
part-of:
  - claude-code

name: "CLAUDE.md"
date-created: 2026-03-07
keywords:
  - ai-agents
  - claude-code
description: "The project instruction file for Claude Code. Best practices for writing and maintaining it."
---

A CLAUDE.md file is a markdown document that Claude Code reads at the start
of every conversation. It provides persistent, project-specific context that
the agent cannot infer from code alone.

## Load order

Claude Code loads CLAUDE.md files from four locations, additively:

1. **Global** (`~/.claude/CLAUDE.md`) — personal preferences, all projects
2. **Project root** (`./CLAUDE.md`) — committed to version control, shared
3. **Subdirectory** (`path/to/dir/CLAUDE.md`) — loaded lazily when Claude
   works in that directory
4. **User-specific** (`.claude/CLAUDE.md`) — personal overrides, gitignored

Ancestor files load at startup. Subdirectory files load lazily when the
agent touches files in that directory. Sibling directories never
cross-load.

## What CLAUDE.md is for

CLAUDE.md solves one problem: giving the agent information it needs but
would get wrong without explicit instruction. Build commands, code style
rules, architectural constraints, testing conventions, and workflow rules.

The litmus test for each line: would removing it cause the agent to make
mistakes? If not, cut it.

## Best practices

### Keep it short

Community consensus is under 300 lines; some teams report good results
with fewer than 60. Claude biases toward instructions at the peripheries
of a prompt; as instruction count rises, instruction-following quality
drops. Everything in CLAUDE.md loads on every request regardless of
relevance. If Claude decides the file is not relevant to the current task,
it may ignore its contents.

### Focus on what the agent would get wrong

Include only information that corrects the agent's default behavior.
Do not duplicate what linters, formatters, or type checkers enforce.
Do not repeat information that the agent can read from existing files
on demand.

### Use progressive disclosure

Keep the root CLAUDE.md minimal and universal. Place task-specific
instructions in:

- **Subdirectory CLAUDE.md files** — Claude reads these when working in
  that directory. A `formalization/lean/CLAUDE.md` can hold Lean-specific
  proof conventions without burdening every session.
- **SKILL.md files** — Skills carry their own instructions. The agent
  reads them when it invokes the skill, not at session start.
- **Referenced documents** — CLAUDE.md can point to specifications or
  guides that the agent reads on demand ("see style-guide.md for writing
  conventions").

### Avoid staleness

Large instruction files go stale. Stale instructions poison agent
context because the agent treats them as authoritative. Review CLAUDE.md
when project conventions change. Remove instructions that no longer
apply. Prefer pointers to living documents over inlined rules that
drift.

### Structure for scannability

Use short sections with clear headers. Lead each section with the
actionable rule, not the rationale. The agent needs to know what to do
first and why second.

## What to include

- Build, test, and lint commands
- Architectural constraints the agent cannot infer
- Style rules not enforced by tooling
- Session startup checks (environment verification)
- Pointers to key files and specifications
- What not to touch

## What not to include

- Domain knowledge the agent can read from content files
- Detailed task-specific workflows (put these in skills)
- Formalization status, proof strategies, or other transient state
- Duplicated linter or formatter rules
- Long lists of conventions that belong in a style guide

## Relationship to AGENTS.md

CLAUDE.md is vendor-specific to Claude Code. [AGENTS.md](../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/services/agent-content-science-services-section/services/agent-markdown-file-science-services-section/content/text/glossary/terms/agents-md.md) is
an emerging cross-tool standard. For projects that use only Claude Code,
CLAUDE.md is sufficient. For cross-tool compatibility, maintain AGENTS.md
as the canonical file and symlink CLAUDE.md to it.

## Relationship to the ASR

In the
[agential semioverse](../../../../../mathematics/objects/universes/agential-semioverse/index.md),
CLAUDE.md encodes the agent's policy function and behavioral directives.
It is the primary
[accretion target](../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/03/03/2026-03-03-note-on-agent-skill-interaction.md)
for operational rules that surface during agent sessions.
