---
id: flatfile-agential-resource-system-blueprint
description: "An AgentialRelationsSystemBlueprint within a FlatfileAgentialResourceSystem: a spec directory with skills, SHACL shapes, and runbooks — fully constituted as a specification — but no AGENTS.md and not yet live."
implements: AgentialRelationsSystemBlueprint
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  outpost: relational-universe
  shacl-shapes: relational-universe
  runbooks: relational-universe
output: relational-universe
ast:
  shape-governed-skill-surface:
    - outpost
    - shacl-shapes:
        - condition-5-subobject
    - runbooks:
        - condition-6-structural-procedure
title: Flatfile Agential Resource System Blueprint
---

# Flatfile Agential Resource System Blueprint

## What this is

A **FlatfileAgentialResourceSystemBlueprint** is an [AgentialRelationsSystemBlueprint](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-blueprint/agential-relations-system-blueprint.md) within a [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).

In the flatfile substrate, a blueprint is a spec subdirectory that has colocated skills, SHACL shapes governing those skills, and runbooks that operate on the scope.
The specification is complete.
No context files are present — the scope has not yet declared an agent community, has no governing soul document, and is not live.

A FlatfileAgentialResourceSystemBlueprint MUST satisfy all requirements of [FlatfileAgentialResourceSystemOutpost](../flatfile-agential-resource-system-outpost/flatfile-agential-resource-system-outpost.md).

## File structure

```
spec/{id}/
  {id}.md           # the entity's own spec file
  skills/           # named operations
    {skill-id}.md
    ...
  runbooks/         # structural procedures operating on this scope
    {runbook-id}.md
    ...
shacl/
  {id}-*.ttl        # shapes governing which sub-configurations are valid
```

No context files.
No `AGENTS.md`, no `SOUL.md`, no `INBOX.md`, no `PLANS.md`, no `IDEAS.md`, no `MEMORY.md`.

A FlatfileAgentialResourceSystemBlueprint MUST have at least one SHACL shape targeting its operations and a `runbooks/` subdirectory with at least one runbook operating on this scope.
It CANNOT have any of the six locale context files (`AGENTS.md`, `SOUL.md`, `INBOX.md`, `PLANS.md`, `IDEAS.md`, `MEMORY.md`).

The presence of SHACL shapes (condition 5) and runbooks (condition 6) alongside skills (condition 4) is what distinguishes a blueprint from an outpost.
An outpost has skills but no shapes and no runbooks.
A blueprint has all three.

## What a blueprint is not

A blueprint is not a locale with files missing.
It is an entity at a valid and complete depth in the [depth filtration](../../../../../../../library/relational-hyperverse-repository/math/depth-filtration.md): fully constituted as a specification, appropriately without an agent community because none has been declared yet.

## Growing past blueprint

A FARS blueprint grows into a [FlatfileAgentialResourceSystemCharter](../flatfile-agential-resource-system-charter/flatfile-agential-resource-system-charter.md) by the addition of `AGENTS.md`: the declaration of who acts in this scope and under what operational policies.

## Open questions
