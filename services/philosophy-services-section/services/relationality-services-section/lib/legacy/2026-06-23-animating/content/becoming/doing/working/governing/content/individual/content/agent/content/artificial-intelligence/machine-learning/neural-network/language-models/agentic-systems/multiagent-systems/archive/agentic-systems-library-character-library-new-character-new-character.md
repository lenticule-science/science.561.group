---
name: new character
description: A character record at the moment of first authoring — the call-site shape the writing-a-new-character skill operates on. Distinguished from character because the discipline that applies (read the characters spec, read an existing character as reference, validate the agency is non-empty) is specifically a pre-creation discipline.
derives-from:
  - character.md
  - new-resource-file.md
---

A new character is the substrate object that exists at the moment a character record is being authored from scratch — before the identity file at `doing/governing/characters/<slug>/<slug>.md` has been written. Once written, it is a `character` (and, as the AgOP theory has it, the operational realization of an agent-form bound by separable governance records).

The shape an instance carries: `slug` (kebab-case, unique within the polity), `name` (display name, must not equal the slug verbatim per the resource-file linter), `description`, `agency` (non-empty list of agent bindings), optional `body`. The discipline `writing-a-new-character` enforces: the characters spec at the polity level (or its fallback under rom-keldar) MUST be readable, at least one existing character with a `<slug>.md` identity file MUST exist as reference, and the agency MUST be non-empty (a character with no agency registers no MCP tools and is not operationally a character).

This structure exists to give the verb-noun grammar a noun for the character-creation call-site. Once the new character is written, it becomes a `character` — the new-character/character distinction is purely about the authoring moment.
