---
name: installing-a-character-as-a-claude-configuration
description: Writes the per-project Claude Code configuration files (.mcp.json and CLAUDE.md) for a named character into a host directory on disk. Use when installing or refreshing the Claude Code projection of a character in the directory that holds the host repo.
---

## Requirements

- A `character` argument — either a character slug (looked up at `doing/governing/characters/<slug>/<slug>.md` under the host repo) or a path to a character directory (with the .md file at `<dir>/<basename(dir)>.md`).
- The character record carries the agent-form frontmatter: `name`, `description`, `agent-kind`, `governance-regime`, `skills` (the generator-set list per the agent shape at `code/structures/agent.schema.json`).
- Every skill named in `skills:` resolves to a `doing/working/hacking/doing/working/skills/<slug>/` directory containing a conformant `SKILL.md`.
- The host directory (`repoRoot`) defaults to the process CWD; for an MCP invocation, that's the repo root Claude Code was launched in.

## Steps

1. Resolve the character ref: slug or path form per the lookup rule.
2. Call `loadCharacterAgency` to read the character file and parse the `skills:` list into `{skillName, defaults}` entries.
  Each entry is either a bare slug or `{skill: <slug>, defaults: {...}}
  `.
3. Run `discoverInScopeSkills` over the entries to validate each one resolves on disk and to project the schema + script wiring the MCP server will later use.
4. Close the generator set under `composes:` via `closeUnderComposes`.
  Refuse to install if the relation has a cycle, or if any helper is missing or malformed.
5. Write `.mcp.json` at the host root with `mcpServers.
  561.command = "node"`, `args = ["doing/working/hacking/doing/working/skills/serving-skills-over-mcp/scripts/serve.mjs"]`, and `env.
  CHARACTER_NAME` set to the canonical character name.
  The 561 MCP server will resolve the same character file when spawned.
6. Render the repo-root `CLAUDE.md` by composing two parts:
   - **Prefix**: the character's own `CLAUDE.md` if it ships one; otherwise the `default-character-claude-md.njk` template rendered with `{characterName, description}`.
   - **Generated block**: the `character-claude-md.njk` template rendered with `{characterName, skillEntries, discoveryErrors}`.
     The template carries the teaching prose (what a character, skill, and script are) as its static body; the skill inventory is rendered from the resolved entries.
     Both templates live at `doing/working/hacking/doing/working/skills/serving-skills-over-mcp/templates/`.
7. Collect every `hooks:` cell declared on the in-scope and helper-closure skills' `_index.md` files; emit a corresponding `.claude/settings.json` (or merge into an existing one) so PreToolUse / PostToolUse / SessionStart / Stop hooks the character's skills declare survive a re-install.
8. Return `{characterName, characterRef, skillEntries, errors}` — the canonical character name (derived from the basename), the original ref string, the normalized skill entries, and any errors reported by the discovery + closure walk.

## Outcomes

- `.mcp.json` at the host root names the 561 MCP server with `CHARACTER_NAME` env set to the canonical character name.
- `CLAUDE.md` at the host root is regenerated as `<prefix>\n\n---\n\n<generated block>`.
  The generated block opens with the teaching prose on character/skill/script and lists each in-scope skill with its description and any pre-parameterized defaults.
- `.claude/settings.json` carries the union of `hooks:` cells declared on the in-scope skill closure.
- The skill returns its result object; on failure (missing character file, malformed frontmatter, cycle in composes, missing helper), the skill throws and writes nothing.
- The four files together let Claude Code start a session where the character's `skills:` list is the registered MCP tool surface.
