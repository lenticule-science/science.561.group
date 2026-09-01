---
title: "Claude Code as ASR runtime"
date-created: 2026-03-06T00:00:00
authors:
  - claude
keywords:
  - AgentialSemioverse
  - ClaudeCode
type: text
---

Claude Code is the agent runtime for this ASR. The ASR's file formats, directory conventions, and skill architecture are designed to be natively compatible with Claude Code — the same way markdown is the content format because it works with Obsidian, git, and static site generators. This document is a reference for Claude Code features as they relate to ASR operations.

## 1. Skills

Claude Code discovers skills by globbing for `SKILL.md` files in `.claude/skills/` and throughout `content/`. When a user prompt matches a skill's `description` or `triggers` (by semantic similarity), Claude Code reads the SKILL.md body and executes it as instructions. The directory name serves as the skill identifier for direct invocation (`/skill-name`).

The ASR's [skill manifests](./skill-manifests.md) specification defines additional analysis fields (`inputs`, `outputs`, `region`, `dependencies`, `version`) that Claude Code does not read at dispatch time. These fields are used by validation tooling (`validate-manifest.py`, SHACL shapes). See skill-manifests.md Sections 2-7 and 11 for the full distinction between dispatch fields and analysis fields.

## 2. Prompt dispatch

Claude Code processes user prompts in three phases:

1. **Direct naming.** If the prompt starts with `/skill-name`, Claude Code looks up the matching SKILL.md by directory name.
2. **Trigger matching.** Claude Code matches the prompt against skill descriptions and trigger phrases by semantic similarity.
3. **Fallback.** If no skill matches, Claude Code asks the user for clarification.

Signal classification (command, correction, meta, question) and the correction/meta-commentary protocols are implemented as CLAUDE.md behavioral directives. See [prompt routing](./prompt-routing.md).

## 3. Agent profiles and subagents

Claude Code supports subagents via the **Agent tool**. Each subagent runs as a separate session. Configuration options:

| Parameter | Description |
|---|---|
| `subagent_type` | Agent type: `general-purpose`, `Explore`, `Plan`, or custom types from `.claude/agents/*.md` |
| `model` | Model selection: `haiku` (fast/cheap), `sonnet` (balanced), `opus` (capable) |
| `isolation` | Set to `"worktree"` for git worktree isolation |
| `run_in_background` | Set to `true` for non-blocking execution |
| `max_turns` | Limit the number of API round-trips |

Custom agent types are defined in `.claude/agents/*.md` files. Each file can specify `description`, `allowed_tools`, `model`, and `custom_instructions`.

The ASR's agent profile tuple $P(a) = (\mathrm{role}, \mathrm{goals}, \mathrm{policy}, \mathrm{Skills}, \mathrm{Tools}, \mathrm{Mem})$ maps to these configs: `description` is the role, `custom_instructions` captures goals and policy, `allowed_tools` constrains the tool set.

## 4. Multi-agent coordination

Three coordination patterns are directly implementable:

**Fan-out.** Multiple Agent tool calls in a single message execute concurrently. With `isolation: "worktree"`, each agent gets an isolated filesystem copy. Without worktree isolation, agents must target disjoint directories to avoid conflicts.

**Pipeline.** Sequential Agent calls where the parent agent passes output from one agent as input to the next.

**Background execution.** `run_in_background: true` launches an agent non-blockingly. The parent agent is notified when the background agent completes.

See [multi-agent coordination](./multi-agent-coordination.md) for the formal theory (regions, non-interference theorem) that models what worktree isolation achieves operationally.

## 5. Hooks

Hooks are shell commands triggered by agent lifecycle events. Configured in `.claude/settings.json` under a `hooks` key. Each hook specifies an event and a command.

| Event | When it fires |
|---|---|
| `PreToolUse` | Before a tool call executes. Can be filtered by tool name. |
| `PostToolUse` | After a tool call completes. Can be filtered by tool name. |
| `Notification` | When the agent produces a notification. |
| `Stop` | When the main session ends. |
| `SubagentStop` | When a subagent session ends. |

Hooks enable runtime-adjacent enforcement of ASR conventions. For example, a `PostToolUse` hook on `Write` can run `validate-manifest.py` after any SKILL.md file is written, or run frontmatter validation after any content file is edited.

## 6. MCP servers

MCP (Model Context Protocol) servers extend Claude Code's tool set at runtime. Configured in `.claude/settings.json` under `mcpServers`. Each server provides tools that Claude Code can call as native tools.

The ASR uses MCP for external capabilities: database queries, API calls, file processing. Skills with `runtime: mcp` are backed by MCP tools. The `rdf-cms` library in `triage/library/rdf-cms/` includes an MCP server that exposes SPARQL queries, triple addition, and SHACL validation.

## 7. Persistence mechanisms

| Mechanism | Location | In git? | Purpose |
|---|---|---|---|
| CLAUDE.md | Repository root | Yes | Project-level operational directives. Primary accretion target. |
| SKILL.md files | `.claude/skills/` and `content/**/skills/` | Yes | Reusable operational knowledge. |
| Settings | `.claude/settings.json` | Varies | Tool permissions, MCP servers, hooks. |
| Memory files | `~/.claude/projects/{hash}/memory/` | No | Bootstrap pointers to in-repo state. Not a knowledge store. |

The ASR's knowledge accretion principle (conversation → specification → skill → script → formal proof) maps to these mechanisms. CLAUDE.md and SKILL.md files are the primary targets. Memory files serve as session-to-session pointers, not as canonical stores.

## 8. Scheduled tasks

Claude Code supports scheduled task execution. Tasks can run on a cron schedule or be triggered manually. On Windows (this vault's platform), scheduled tasks are an alternative to cron. GitHub Actions provides another scheduling mechanism for tasks that should run in CI.

## 9. Preview server

Claude Code can start dev servers, take screenshots, inspect DOM elements, and interact with web UIs via the preview tools. This is relevant because the ASR is a published website — preview tools enable verifying that content renders correctly after edits.

## 10. The triage libraries

Three libraries in `triage/` provide partial implementations of ASR operations:

**semiotic-markdown** (`triage/engine/contracts/semiotic-markdown/`). Parses markdown files, extracts YAML frontmatter as structured dicts, identifies features (links, callouts, citations, inline fields). Dependencies: PyYAML only. This is the input stage for the markdown-to-TTL pipeline.

**rdf-cms** (`triage/library/rdf-cms/`). RDF storage (rdflib), OWL reasoning (owlrl), SHACL validation (pyshacl), SPARQL queries, and an MCP server. Dependencies: FastAPI, rdflib, owlrl, pyshacl, PostgreSQL. Heavy for local use; reserve for when persistent graph storage is needed.

**The pipeline gap.** The missing piece is the mapping layer: code that takes semiotic-markdown's `DocumentRecord` output and produces RDF/Turtle triples using the vocabulary in [semantic-frontmatter.md](../../../glossary/terms/semantic-frontmatter.md). The [generate-rdf skill](../../semiotic-markdown/skills/generate-rdf/SKILL.md) declares this operation but is not implemented. For immediate use, rdflib alone (pure Python, no database) is sufficient for TTL generation and SHACL validation.

Target pipeline:

```
markdown files
    → semiotic-markdown (parse frontmatter + extract features)
    → mapping layer (frontmatter fields → RDF predicates)
    → .ttl files (colocated with source .md)
    → rdflib (load, validate with pyshacl)
    → SPARQL queries, SHACL reports
```
