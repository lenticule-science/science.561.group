---
type: definition
class: frame
status: current
realizes: [glance-direction, non-linear-reading]
depends-on: [type-stack, type-scale, ink, bone]
see-also: [section-head, caption-block]
---

# Spec block

The boxed unit used throughout the bible to hold a sub-section: the spec-id (e.g. `§ 02.1`), the spec-title, and a series of clauses.
The spec-block is what makes the bible scannable at a glance — the reader can see how many clauses a spec carries before reading any of them.

## Geometry

- Container: top border 4 px [ink](ink.md), padding 24 px, background [bone-deep](bone.md).
- **spec-id** — cols 1 of the [grid](document-grid-web.md).
  [JetBrains Mono](type-stack.md), M1, weight 700.
  Format `§ NN.
  M`.
- **spec-title** — cols 2–12.
  D4 ([Space Grotesk 700](type-stack.md), 28 px / 20 pt).
  Max one line; short declarative phrase.
- **clauses** — sequence of `c-label` + `c-body` pairs, stacked.
  Each clause holds one fact about the spec.

## Clause types

- **`When required`** — when the spec must apply.
  The spec is non-optional in this case.
- **`When permitted`** — when the spec may be applied.
  The spec is optional but governed in this case.
- **`Form`** — what the spec looks like.
  Geometry, color, type.
- **`Geometry`** — measurements, in rems / px / mm / pt as appropriate.
- **`Color`** — assigned colors (always one or more of [ink](ink.md), [bone](bone.md), [alarm-red](alarm-red.md), [witness-blue](witness-blue.md)).
- **`Conflicts`** — what other specs the spec interacts with, and the resolution rule.
- **`Test` / `Check`** — the falsifiable check the artifact must pass.
  See [theorems/](../theorems/) for the test-form clauses elevated to first-class entries.
- **`Refusal`** — the spec is a refusal (forbidden form).
  Used in § 09; see [refusal-as-design-method](teaching/explanations/refusal-as-design-method.md).
- **`Forbidden`** — list of things the spec rules out.
  Often paired with `Form` or `Color`.

## Why

The spec-block is the bible's atomic unit.
By making each spec a single visually-bounded box with consistent clause types, the reader can scan a section's specs (count the spec-blocks) and within each spec scan the clauses (count the c-labels) and within each clause find the rule.
A sub-section without a spec-block is a defect — the bible refuses unboxed prose for normative content.

## Conflicts

- Spec-blocks do not nest.
  A spec that needs sub-specs uses additional spec-blocks at the next decimal (`§ 02.1`, `§ 02.2`, `§ 02.3`), not nested boxes.
- A spec-block does not host a figure.
  Figures live in column-grid blocks adjacent to spec-blocks, with their own [caption-blocks](caption-block.md).
