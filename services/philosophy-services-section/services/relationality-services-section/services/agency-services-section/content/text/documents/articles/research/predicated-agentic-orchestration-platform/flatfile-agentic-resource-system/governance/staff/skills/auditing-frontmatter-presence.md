---
name: auditing-frontmatter-presence
description: Skill for auditing whether every entity has the required name and description keys with non-empty string values — checking theory-encoding.md R9.
title: auditing-frontmatter-presence
---

## What this checks

R9 of theory-encoding.md: every entity must have `name:` and `description:` as frontmatter keys with non-empty string values.

These two keys are always valid and required unconditionally — they do not need a corresponding transformer in $\mathrm{Ob}(\mathcal{C})$ to be legal frontmatter (R9, R10).

## Why name and description are required

`name:` records the canonical human-readable label for the entity — this is the entity's title, machine-readable in frontmatter.
It makes the entity addressable by processors that need a label without parsing the filename or the body.

`description:` records a one-sentence declarative statement of what the entity is.
It is the substrate's answer to "what is this?" in one sentence, standalone, informative — not just a restatement of the slug.

Neither value should be: - Empty - A list or mapping (they are string scalars, not entity references — R9 distinguishes their type from predication-cell values) - A repetition of the slug (description: "my-entity" is not a description) - A structural annotation ("see body for description" is not a description)

## Quality criterion for description

A good description satisfies the ograph standard: one declarative sentence, third-person singular, that could stand alone in a reference list and tell the reader what the entity is.
It does not reference the entity by name, does not begin with "The entity ...", and does not merely echo the slug.

Example: for `specializing.md`: - Bad: "specializing" - Bad: "A transformer." - Good: "A predicate whose cells record predicate-specialization morphisms — which transformer is a sub-predicate of another."

## How to fix a violation

- Missing `name:` — add it.
  The value should match the slug exactly.
- Missing `description:` — write a one-sentence declarative statement of what the entity is.
  Derive it from the body if the body exists.
- Empty value — fill it in.
- Non-scalar value (list or mapping) — the value of `name:` and `description:` must be plain strings, not entity references or structured data.

The `extracting-descriptions-from-body` skill can assist when the description needs to be derived from existing body prose.

## How to run

The `auditing-theory-conformance` script reports R9 findings:

```
node governance/staff/skills/auditing-theory-conformance/scripts/audit-theory.mjs --root <theory-root> | grep R9
```

## When to re-run

- After creating any new entity — it must have both keys from the start.
- After migrating entities from another format that may have omitted `name:` or `description:`.
