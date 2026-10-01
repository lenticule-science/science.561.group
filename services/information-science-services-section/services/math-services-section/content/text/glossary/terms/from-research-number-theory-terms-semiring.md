---
name: "Semiring"
type: "definition"
date-created: 2025-12-26
---

Requires

- ./addition.md
- ./multiplication.md
- ../../prealgebra/terms/monoid.md

A semiring is a [set](set.md) equipped with two operations, [addition](addition.md) (+) and [multiplication](multiplication.md) (×), such that: (S, +, 0) is a commutative [monoid](monoid.md), (S, ×, 1) is a monoid, multiplication distributes over addition from both sides, and 0 × a = a × 0 = 0. A semiring is like a ring but without requiring additive inverses — subtraction need not be possible.

The [natural numbers](natural-numbers.md) are the prototypical semiring: they have addition and multiplication with the expected properties, but no negatives. Other examples include the nonnegative reals, the Boolean semiring ({0, 1} with OR and AND), and the tropical semiring (ℝ ∪ {∞} with min and +). Each captures a setting where &ldquo;combining&rdquo; and &ldquo;scaling&rdquo; make sense but &ldquo;undoing&rdquo; does not.

A [ring](ring.md) is a semiring where (S, +, 0) is a [group](../../documents/articles/research/2026/07/31/groups/terms/group.md) (additive inverses exist). A [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) is a ring where (S \ {0}, ×, 1) is also a group (multiplicative inverses exist for nonzero elements). The algebraic hierarchy — semiring → [ring](ring.md) → [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md) — adds increasingly strong inverse operations at each step.
