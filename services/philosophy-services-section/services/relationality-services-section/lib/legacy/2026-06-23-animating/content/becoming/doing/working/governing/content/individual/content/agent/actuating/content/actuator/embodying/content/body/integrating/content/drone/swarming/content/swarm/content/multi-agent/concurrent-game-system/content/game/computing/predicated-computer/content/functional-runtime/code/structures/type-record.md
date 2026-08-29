---
type: definition
class: substrate-entity
realizes: [type, refined-type]
depends-on: [type, refined-type, shape-record, predication-fiber-algebra]
see-also: [function-record]
---

# Type record

A **type record** is the substrate-entity formal definition of a [type](teaching/explanations/type.md): the predication-graph entity declaring a type's structure, components, and constraints.

## Structural fields

- **`id`** — kebab-case identifier (typically the type's name: `Integer`, `User`, `List-T`).
- **`description`** — one-line summary.
- **`type-kind`** — `primitive`, `record`, `union`, `function`, `polymorphic`, `refined`.
- **`components`** — for compound types: the component types (record fields, union variants, function parameters/return).
- **`type-variables`** — for polymorphic types: the type variables and their constraints.
- **`refinement-predicate`** — for refined types: the predicate constraining admissible values.
- **`base-type`** — for refined types: the underlying type being refined.
- **`effects`** — for function types: the declared effect set.
- **`scope`** — reference to the scope the type is defined in.
- **`closure-kind`** — `type`.

## Invariants

- **Well-formed.** All cited components must be valid type-records (transitively, the type's references resolve).
- **Refinement-decidable-or-flagged.** Per [refined-type](teaching/explanations/refined-type.md), refinement predicates may be decidable, conditionally-decidable, or undecidable; the type-record declares which.
- **Versioned.** Per [self-representation](../../teaching/explanations/self-representation.md), type evolution produces new type-record versions per [schema-evolution](../../teaching/explanations/schema-evolution.md).

## Position in the platform

Type records are the substrate's *type-vocabulary registry*. Per [check-type](../morphisms/check-type.md), the type-checker uses the type-records to validate function signatures and value constructions.
