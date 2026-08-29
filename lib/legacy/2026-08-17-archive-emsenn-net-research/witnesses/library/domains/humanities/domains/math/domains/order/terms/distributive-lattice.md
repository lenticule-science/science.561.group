---

introduces: algebraic-structure
description: "A lattice where meet distributes over join: a ∧ (b ∨ c) = (a ∧ b) ∨ (a ∧ c). The setting for Priestley duality and bilattice theory."
defines: distributive-lattice
aliases: [distributive lattices]
specialization: lattice
date-created: 2026-03-30
---

A distributive [lattice](./lattice.md) is a lattice where meet distributes over join:

$$a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$$

Equivalently, join distributes over meet (either distributive law implies the other).

Distributive lattices are the setting for [Priestley duality](../../logic/terms/priestley-duality.md): every bounded distributive lattice is dually equivalent to a Priestley space (a compact ordered topological space). This gives every distributive lattice a geometric dual.

Every Boolean algebra is distributive. Every Heyting algebra is distributive. The converse is false in both cases.

The [twist product](../../algebra/terms/twist-product.md) $L \otimes L$ of a bounded distributive lattice $L$ produces a distributive [bilattice](../../algebra/terms/bilattice.md) (Fitting 1991). The four-valued bilattice $\mathbf{2} \otimes \mathbf{2}$ is the free bounded distributive bilattice on one generator (Fitting 2002).
