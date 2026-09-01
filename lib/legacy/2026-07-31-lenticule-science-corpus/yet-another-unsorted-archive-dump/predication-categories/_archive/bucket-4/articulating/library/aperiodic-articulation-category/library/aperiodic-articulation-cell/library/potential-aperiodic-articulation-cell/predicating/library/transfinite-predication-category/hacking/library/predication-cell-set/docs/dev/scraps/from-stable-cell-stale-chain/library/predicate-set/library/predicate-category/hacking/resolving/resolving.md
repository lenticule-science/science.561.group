---
name: resolving
gerund: resolving
agent-noun: resolver
imperative: resolve
description: Verifying that a reference, name, or scope element refers to an existing record and reporting on any that do not.
---

A resolve transformer reads a reference (a markdown link target, a verb-noun-decomposable name, an element of a scope array) and verifies it points at a record that exists. The output is per-reference: each reference is reported as either resolved (with the target file) or unresolved (with a reason).

Resolve is read-only at the substrate boundary. It does not edit the file it audits or the targets it checks; it only reports.

## Domain and codomain

- **Domain:** a candidate carrying references — a markdown file with links, a skill or agent file whose name is verb-noun-decomposable, an agent file whose frontmatter carries scope arrays.
- **Codomain:** a per-reference report of `{ reference, resolved, target?, reason? }` entries.

## Morphological forms in naming grammar

- `gerund: resolving` heads skills built on this transformer: `resolving-links-in-a-file`, `resolving-a-skill-name`, `resolving-an-agent-name`, `resolving-an-agent-scope`.
- `agent-noun: resolver` heads agents that invoke such skills: `resolver-of-links-in-a-file`, etc.
- `imperative: resolve` heads scripts that body such skills: `resolve-links-in-a-file.mjs`, etc.
