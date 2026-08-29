---

title: "Measure"
description: "A measure assigns a quantity to a thing. Length measures a line. Temperature measures a gas. Bounce rate measures a session. The thing being measured and the quantity it produces live in different worlds, and the measure is what connects them."
date-created: 2026-03-29
defines:
  - "Measure"
  - "measures"
  - "measured-by"
  - "measurement"
restricts: functor
requires: [morphism, composition]
---

A measure assigns a quantity to a thing. Length measures a line. Temperature measures a gas. Bounce rate measures a session. The thing being measured and the quantity it produces live in different worlds, and the measure is what connects them.

In mathematics, a measure is a function from a collection of sets to the real numbers, preserving certain structure: the measure of nothing is zero, and the measure of non-overlapping pieces adds up to the measure of the whole. This is the foundation of probability, integration, and statistics.

More generally, a measure is a functor — a structure-preserving map from one category to another. The source category contains the things being measured. The target category contains the quantities. The measure sends objects to numbers and relationships to relationships between numbers, without breaking the structure.

What makes something a measure rather than just a function is that it respects the structure of what it measures. If A is part of B, then the measure of A should relate to the measure of B in a way that reflects the part-whole relationship. A good metric preserves the relationships that matter; a bad metric distorts them.

When this library uses `measures` as a predicate, the subject is a metric and the object is what it quantifies. `measured-by` is the reverse: the subject is a thing, the object is its metric.
