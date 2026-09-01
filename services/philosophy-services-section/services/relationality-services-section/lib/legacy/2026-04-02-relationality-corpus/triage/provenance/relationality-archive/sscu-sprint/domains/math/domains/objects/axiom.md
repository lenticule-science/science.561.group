---
name: axiom

description: "A relation: an entity stands in the axiom relation to a content resource when the entity is an axiom assertion for the mathematical property defined at that resource. The axiom entity holds motivation and theorem correspondent; the content resource holds the mathematical definition and structural properties."
extends: Relation
date-created: 2026-03-18
date-modified: 2026-03-19
---

## What this is

The **axiom** relation connects an axiom assertion to its mathematical content resource.

An entity with `axiom: X` in its frontmatter is an axiom assertion for the property defined at X.
The axiom entity holds:
- **Motivation** — why this condition is posited; what goes wrong without it; why it is the right condition at this level of the construction
- **Theorem correspondent** — the tower theorem (or result in the canonical construction) that affirms the axiom holds for the canonical relational universe; the axiom is not arbitrary, it expresses a property the canonical structure genuinely has

The content resource at X holds:
- **Mathematical definition** — the precise formal statement of the property
- **Structural properties** — corollaries, decompositions, equivalent characterizations
- **Connections** — how the property relates to other structures in the construction

## Why separate axiom from content

An axiom assertion and a mathematical definition serve different purposes.

A **definition** says what a property is.
An **axiom** says: we impose this property; here is why; and here is the theorem that confirms the imposition is not arbitrary.

Separating them clarifies the structure of the argument:
- The content resource can be read by anyone wanting to understand the mathematics.
- The axiom entity records the axiomatic choice and its justification, which belongs in the relational universe construction, not in the general mathematical theory.

## Constraints

An entity MUST NOT carry `axiom:` unless the referenced content resource exists as a specced entity.
The value of `axiom:` MUST be the `id` of an existing entity.
The content resource MUST define the mathematical property that the axiom imposes.
The axiom entity MUST include both a motivation section and a theorem correspondent section in its body.

## Open questions

- Whether `axiom` should be scoped to the math locale only or can appear in spec files.
  Current use: math locale only.
- Whether a single content resource can be the target of multiple axiom assertions (e.g., if the same property is imposed at multiple tower levels).
  Anticipated answer: yes — the `axiom:` field would appear in multiple files, all pointing to one content resource.
