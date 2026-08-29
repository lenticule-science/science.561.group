---

introduces: algebraic-structure
description: "A lattice with a top element ⊤ (join of everything) and a bottom element ⊥ (meet of everything)."
defines: bounded-lattice
aliases: [bounded lattice, bounded lattices]
specialization: lattice
made-of: [lattice, top-element, bottom-element]
date-created: 2026-03-30
---

A bounded [lattice](./lattice.md) is a lattice with a top element $\top$ and a bottom element $\bot$:

- $\bot \leq a$ for all $a$ (bottom is below everything)
- $a \leq \top$ for all $a$ (top is above everything)

Every [complete lattice](./complete-lattice.md) is bounded. Every finite lattice is bounded.

The four-valued [bilattice](../../algebra/objects/bilattice.md) is bounded under both its orderings: truth-bottom is $f$, truth-top is $t$; knowledge-bottom is $\bot$, knowledge-top is $\top$.

The [twist product](../../algebra/objects/twist-product.md) construction requires a bounded [distributive lattice](./distributive-lattice.md) as input.
