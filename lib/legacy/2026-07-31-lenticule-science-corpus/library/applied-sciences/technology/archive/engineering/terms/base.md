---
id: base
description: "A positional frontmatter relation giving the base object t such that the subject equals F(t), where F is named by the paired fiber-of: field. Always appears paired with fiber-of:."
defines: Base
extends: Relation
component-of: flatfile-agential-resource-system
date-modified: 2026-03-19
params:
  functor: relational-universe-morphism
  base-object: relational-history
output: relational-universe
ast:
  fiber-evaluation:
    - functor
    - base-object
---

# base

## What this is

`base` is the companion field to `fiber-of:`. Together they assert E = F(t): the subject entity E is the fiber of functor F (named by `fiber-of:`) at base object t (named by `base:`).

The two fields are inseparable. `base:` without `fiber-of:` is meaningless — t is only meaningful as the base of a specific functor evaluation.

## Valid values

The value of `base:` is the id of a math entity that plays the role of t — the base object at which the functor is evaluated. Common values:
- A specific history `t` (kebab-case id of a history entity)
- `relational-history-site` — for global sections (coarsest fiber)
- A universe-object id

## Open questions

- Whether `base:` should require the base entity to itself carry `defines:`.
