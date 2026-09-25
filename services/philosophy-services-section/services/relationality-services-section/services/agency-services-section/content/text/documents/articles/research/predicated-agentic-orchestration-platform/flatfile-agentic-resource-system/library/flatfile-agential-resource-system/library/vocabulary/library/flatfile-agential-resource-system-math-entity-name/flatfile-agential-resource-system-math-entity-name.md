---
id: flatfile-agential-resource-system-math-entity-name
description: "A FlatfileAgentialResourceSystemMathEntityName is the CamelCase normal form of a math entity's id — the unique element of the CamelCase regular language that the kebab-to-CamelCase normalization function maps the id to."
extends: Name
component-of: FlatfileAgentialResourceSystemMathEntity
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  id: relational-universe
output: relational-universe
ast:
  camelcase-normalization:
    - id:
        - kebab-case-string
        - camelcase-bijection
title: Flatfile Agential Resource System Math Entity Name
---

# Flatfile Agential Resource System Math Entity Name

## What this is

A **FlatfileAgentialResourceSystemMathEntityName** is the CamelCase normal form of a [FlatfileAgentialResourceSystemMathEntity](../flatfile-agential-resource-system-math-entity/flatfile-agential-resource-system-math-entity.md)'s `id`.

The mathematical invariant: the kebab-case ids and the CamelCase names are two regular languages between which there is a computable bijection.
A **regular language** is a set of strings accepted by a finite automaton.
Both `{lowercase-hyphenated-strings}` and `{UpperCamelCase-strings}` are regular languages over their respective character sets.
The normalization function f: kebab → CamelCase is:

> f(w₁-w₂-...-wₙ) = capitalize(w₁) · capitalize(w₂) · ... · capitalize(wₙ)

where `capitalize` uppercases the first letter and leaves the rest.
This function is a **bijection** — it is injective (distinct kebab strings map to distinct CamelCase strings) and surjective onto the CamelCase language.
The inverse f⁻¹ splits on uppercase letters and lowercases to recover the kebab form.

A FlatfileAgentialResourceSystemMathEntityName is the **unique element** of the CamelCase language in the fiber f⁻¹({id}).
Given an id, the FlatfileAgentialResourceSystemMathEntityName is fully determined — there is no choice.

This is why the display name is NOT a stored field in [FlatfileAgentialResourceSystemMathEntity](../flatfile-agential-resource-system-math-entity/flatfile-agential-resource-system-math-entity.md): storing it would duplicate information fully determined by `id` via f.

## Usage

A FlatfileAgentialResourceSystemMathEntityName in monospace (`TransferNucleus`) refers to the specific corpus entity — this system's definition at this stage of development.

The same words in plain text ("transfer nucleus") refer to the general mathematical notion, which may differ from or predate this corpus's treatment.

A FlatfileAgentialResourceSystemMathEntityName MUST be the exact CamelCase transformation of the entity's `id`.
It MUST be globally unique across all entities in `math/` (uniqueness of ids implies uniqueness of names under f).

## Head word structure

A FlatfileAgentialResourceSystemMathEntityName consists of `[scope?]
[property?]
[head]` where `head` reflects the entity's mathematical classification per [flatfile-agential-resource-system-naming-math-unit](../flatfile-agential-resource-system-naming-math-unit/flatfile-agential-resource-system-naming-math-unit.md).

## Open questions

- Formal verification that all existing name forms in legacy entities satisfy the head word criteria — several were named before the naming spec existed.
