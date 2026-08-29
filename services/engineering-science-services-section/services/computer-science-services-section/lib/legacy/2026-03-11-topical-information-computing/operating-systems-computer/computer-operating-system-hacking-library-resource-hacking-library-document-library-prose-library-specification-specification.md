---
name: specification
description: A normative record that pins invariants for a named entity-form, process, or convention. An entity-form whose characteristic predication-shape names what it governs and what it derives from.
---

## Pure form

A specification pins invariants: the MUST/SHOULD/MAY conditions a conformant instance of the governed entity-form must satisfy.
A spec does not explain why — that is the work of theory.
A spec records what is decided.

## Characteristic predication-shape

- `pins-invariants-of(spec, entity-form-or-process)` — what this spec governs.
- `derives-from(spec, structure-or-transformer)` — the entities whose content grounds the invariants; a transformer relation to `code/structures/` or `code/transformers/`.
- `has-status(spec, {draft|active|superseded})` — lifecycle.
- `supersedes(spec, spec)` — history chain; the prior spec this one replaces.
- `requires(spec, spec)` — another spec that must hold for this one to be enforceable.
