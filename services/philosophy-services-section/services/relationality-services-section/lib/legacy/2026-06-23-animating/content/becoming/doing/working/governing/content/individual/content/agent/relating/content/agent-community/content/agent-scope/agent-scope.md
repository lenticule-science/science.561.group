---
name: agent scope
description: The frontmatter cell on an agent file carrying two arrays — transformers and structures — that name the verb-noun pairs whose skills the agent's owner registers as MCP tools.
derives-from:
  - agent.md
---

An agent scope is the `scope:` cell in an agent file's frontmatter, declaring two arrays: `transformers` (verb-token gerunds) and `structures` (noun-tokens).
The 561 MCP server unions an installed character's bound agents' scopes and registers as an MCP tool every skill whose decomposition `<gerund>-<noun>` has the gerund in the union's transformer set and the noun in the union's structure set.

Each entry in `transformers` is the gerund stem of a transformer record at `code/transformers/<entry>.md`.
Each entry in `structures` is the stem of a structure record at `code/structures/<entry>.md`.
A scope with an unresolvable entry has its registration silently dropped at the harness layer; the unresolvable-entry condition is what the `resolving-an-agent-scope` morphism reports.
