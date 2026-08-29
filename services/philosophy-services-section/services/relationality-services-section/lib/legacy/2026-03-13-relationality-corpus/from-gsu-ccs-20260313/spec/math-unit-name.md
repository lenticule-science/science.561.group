---

name: math-unit-name
description: "A CamelCase identifier that picks out one math unit; the unique, bidirectional prose form of the unit's id."
defines: MathUnitName
---

## What this is

A `MathUnitName` is the CamelCase identifier that picks out one math unit in the corpus.
It is the form used in prose, in `defines:` and `describes:` frontmatter fields, in
Lean code, and in cross-references. Every math unit has exactly one `MathUnitName` and
it is mechanically determined by the unit's `id`.

The relationship between `id` and `name` is bijective: capitalize the first letter of
each hyphen-separated segment and remove hyphens. Example:
`transfer-nucleus` ↔ `TransferNucleus`.

When writing about a math unit in prose, use its `MathUnitName` in monospace to
distinguish the specific corpus object from the general mathematical concept.
Write `TransferNucleus` (this corpus's object) vs. "transfer nucleus" (the general
notion).

## MUST

- Be the exact CamelCase transformation of the unit's `id` — no other name is valid
- Be globally unique across all units in `math/`
- Consist of `[scope?][property?][head]` where `head` reflects the unit's classification
  per `spec/naming-math-unit.md`
- When used in `defines:`, `describes:`, `domain:`, or `codomain:` frontmatter fields:
  a unit with that `name` MUST exist in the corpus

## CANNOT

- Diverge from the `id` — a name that does not round-trip to its `id` is a schema error
- Be shared by two units
- Use a head word from a different classification than the unit's mathematical content
  (a `Nucleus` head word for a non-idempotent endomorphism, a `Sheaf` head word for a
  presheaf without verified descent)

## CAN

- Omit scope or property modifiers when the head word alone is unambiguous across the
  full corpus
- Use compound modifiers when needed for disambiguation (`HyperversalPatternGroupoid`
  not `PatternGroupoid` if the latter is ambiguous)

## Pending

- Formal verification that all existing `name:` fields satisfy the head word criteria
  in `spec/naming-math-unit.md` — several units were named before that spec existed
