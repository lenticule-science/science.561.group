---
title: "element-of"
description: "A positional frontmatter relation declaring that the subject is a named element of the object, identified by an explicit evaluation term [τ](τ) under the evaluation map for the object. The evaluation map MUST be nameable. Coarsest valid answer: entity."
defines: ElementOf
specialization: relation
component-of: flatfile-agent-resource-system
date-modified: 2026-03-19
id: element-of
extends: Relation
params:
  subject: relational-universe
  algebra: relational-universe
  evaluation-map: relational-universe-morphism
output: relational-universe
ast:
  algebraic-membership:
    - algebra
    - evaluation-map:
        - subject
        - algebra
type: term

---

## What this is

`element-of` is a positional frontmatter relation declaring that the subject entity is a named **element** of the object structure X — a specific member of X, identified by an explicit evaluation term $[\![\tau]\!]$ under the evaluation map for X.

The evaluation map MUST be nameable. This distinguishes `element-of` from mere conceptual association: there must be a specific evaluation procedure that maps the element's syntactic representation to its position within X.

## Coarseness ordering

Write the most specific level the current math supports:

| Coarsest | Refine toward |
|---|---|
| `entity` | tightest named algebra with explicit evaluation term $[\![\tau]\!]$ |

Examples of refinement:
- `entity` → `relational-universe` (if the entity is an object in R)
- `relational-universe` → `relational-history-fiber` (if the entity is a proposition in H_t)
- `relational-history-fiber` → `relational-history-fiber-fixed-layer` (if it is a fixed point of both nuclei)

**Blank is never correct.** Blank asserts no membership relation — which is a stronger and usually false claim.

## Relation to component-of and fiber-of

The three positional frontmatter fields are distinct:
- `component-of: X` — X has a named retraction π: X → E (structural projection)
- `fiber-of: F` / `base: t` — E = F(t) for a named functor F (categorical fiber)
- `element-of: X` — E ∈ X as a named element under an evaluation map (algebraic membership)

A single entity may carry all three with different objects.

## Open questions

- Formal specification of what counts as a "nameable" evaluation map in the flatfile context.
- Whether the coarseness ordering is always a chain or can branch (e.g., an entity that is simultaneously an element of two incomparable algebras).
