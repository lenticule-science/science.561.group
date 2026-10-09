---
id: flatfile-agential-resource-system-shape
description: "A FARS Shape is a SHACL shape file encoding a RelationalSystemShape: one .ttl file per predicate at shacl/{predicate-id}.ttl, targeting every entity that carries that predicate."
implements: RelationalSystemShape
component-of: FlatfileAgentialResourceSystemBlueprint
params:
  predicate: relational-universe
  constraint: relational-universe
output: relational-universe-morphism
ast:
  shacl-predicate-shape:
    - predicate:
        - target-subjects-of
    - constraint:
        - sh-property-rule
title: FARS Shape
---

# FARS Shape

## What it is

A **FARS Shape** is the encoding of a [RelationalSystemShape](../../../../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/relational-system-shape.md) in the [FlatfileAgentialResourceSystem](../../../../flatfile-agential-resource-system.md).
It is a SHACL shape file at `shacl/{predicate-id}.ttl`.

One file per predicate.
The shape uses `sh:targetSubjectsOf :{predicate-id}` to target every entity that carries that predicate.
Constraints are expressed as `sh:property` or `sh:node` rules on the shape node.

A FARS Shape is itself a [RelationalEntity](relational-entity.md): it has `id` and `description` and is in R.
It MUST live at `shacl/{predicate-id}.ttl`.
It MUST use `sh:targetSubjectsOf :{predicate-id}` — never `rdf:type` or class membership.
It MUST cover exactly one predicate.

## The universal shape

`shacl/id.ttl` is the universal shape: since every entity has `id`, it targets every entity.
It states: `description` is required, `id` is a kebab-case string, and the filename matches `{id}.md`.

## Open questions

## See also

- [write-shacl-shapes](PLANS.md) — open work item for writing the first shape files
