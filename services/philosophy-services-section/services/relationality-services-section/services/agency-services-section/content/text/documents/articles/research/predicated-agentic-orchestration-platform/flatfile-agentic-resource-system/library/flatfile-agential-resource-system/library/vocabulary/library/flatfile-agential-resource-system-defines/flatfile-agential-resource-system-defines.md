---
id: flatfile-agential-resource-system-defines
description: "The CamelCase concept-name predicate on spec files; names the concept the spec introduces so other units can refer to it in prose."
extends: Relation
date-modified: 2026-03-19
params:
  spec-entity: relational-universe
  concept-name: relational-universe
output: relational-universe-morphism
ast:
  canonical-concept-naming:
    - spec-entity
    - concept-name:
        - camelcase-identifier
title: Flatfile Agential Resource System Defines
---

# Flatfile Agential Resource System Defines

## What this is

`defines` is a [Relation](relation.md) carried by [Specification](specification/specification.md) entities.
Its value is the CamelCase name of the concept the spec introduces.
Where `id` names the entity node, `defines` names the concept the entity is about.

The value MUST be a CamelCase string.
It is the canonical name used when other entities refer to this concept in prose.
A spec SHOULD carry `defines`; a spec that does not names a concept without giving it a canonical CamelCase form.

`defines` is distinct from `id`: `id: relations-system`, `defines: RelationsSystem`.

## Open questions

- Whether `defines` on math entity files (which also carry it) is the same predicate as on spec files, or two predicates sharing a name.
  Resolution blocked by formal skill-object-type vocabulary.
