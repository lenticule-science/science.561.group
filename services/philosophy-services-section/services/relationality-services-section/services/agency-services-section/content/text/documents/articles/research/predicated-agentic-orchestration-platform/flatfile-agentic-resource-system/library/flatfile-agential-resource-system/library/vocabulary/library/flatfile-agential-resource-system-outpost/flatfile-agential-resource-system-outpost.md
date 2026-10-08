---
id: flatfile-agential-resource-system-outpost
description: "An AgentialRelationsSystemOutpost within a FlatfileAgentialResourceSystem: a spec directory with a skills/ subdirectory and no context files — agents can use the skills, but no agent community or governing principles have been declared."
implements: AgentialRelationsSystemOutpost
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  entity-file: relational-universe
  skills-directory: relational-universe
output: relational-universe
ast:
  named-skill-surface:
    - entity-file
    - skills-directory:
        - condition-4-exponential
title: Flatfile Agential Resource System Outpost
---

# Flatfile Agential Resource System Outpost

## What this is

A **FlatfileAgentialResourceSystemOutpost** is an [AgentialRelationsSystemOutpost](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-outpost/agential-relations-system-outpost.md) within a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).

In the flatfile substrate, an outpost is a spec subdirectory that has colocated skills but none of the locale context files.
The directory IS the scope.
The skill files ARE the named operations.
But the scope has not yet declared who acts here or why it exists.

A FlatfileAgentialResourceSystemOutpost MUST satisfy all requirements of [AgentialRelationsSystemOutpost](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-outpost/agential-relations-system-outpost.md).

## File structure

```
spec/{id}/
  {id}.md          # the entity's own spec file
  skills/          # named operations as first-class files
    {skill-id}.md
    ...
```

No context files.
No `AGENTS.md`, no `SOUL.md`, no `INBOX.md`, no `PLANS.md`, no `IDEAS.md`, no `MEMORY.md`.

A FlatfileAgentialResourceSystemOutpost MUST have a `{id}/` directory with a `{id}.md` spec file and a `skills/` subdirectory with at least one skill file.
It CANNOT have any of the six locale context files (`AGENTS.md`, `SOUL.md`, `INBOX.md`, `PLANS.md`, `IDEAS.md`, `MEMORY.md`).

The presence of `skills/` is what makes a directory an outpost rather than a flat spec file.
A flat spec file (a single `{id}.md` in `spec/`) that has frontmatter links to other units is a valid [RelationalEntity](relational-entity.md) at a lower depth — it has named relations but no colocated operational surface.
An outpost has the skill files physically present in its directory.

## What agents find here

An agent entering a FARS outpost finds skill files they can read and invoke.
The skills are navigable.
There is no `AGENTS.md` to orient them, no `SOUL.md` to ground them, no `INBOX.md` to receive new work.

The agent can do work here.
Nothing governs whether they should, how they should, or what they must not do.

## Growing past outpost

A FARS outpost grows into a [FlatfileAgentialResourceSystemBlueprint](../flatfile-agential-resource-system-blueprint/flatfile-agential-resource-system-blueprint.md) by acquiring: - SHACL shapes governing its operations - Runbooks operating on it

It does not yet need `AGENTS.md` — that belongs to the charter step.

## Open questions
