---

introduces: algebraic-structure
description: "A complemented distributive lattice: every element has a complement satisfying a ∧ ¬a = ⊥ and a ∨ ¬a = ⊤. The algebraic semantics of classical logic."
aliases: [Boolean algebra, Boolean algebras]
specialization: [distributive-lattice, heyting-algebra]
operations: [meet, join, complement]
laws: [complementation, distributivity, excluded-middle]
examples: [power-set, two-element-algebra]
date-created: 2026-03-30
date-modified: 2026-04-11
---

A Boolean algebra is a bounded [distributive lattice](../../order/objects/distributive-lattice.md) where every element $a$ has a complement $\neg a$ satisfying:

$$a \wedge \neg a = \bot \qquad a \vee \neg a = \top$$

The complement gives excluded middle ($a \vee \neg a = \top$) and non-contradiction ($a \wedge \neg a = \bot$). These are the algebraic forms of the two laws that distinguish classical logic from constructive logic.

Every Boolean algebra is a [Heyting algebra](../../logic/objects/heyting-algebra.md) where $\neg\neg a = a$ (double negation elimination). Every Heyting algebra where double negation holds is Boolean.

The simplest Boolean algebra is $\mathbf{2} = \{0, 1\}$ with $0 = \bot$, $1 = \top$, $\neg 0 = 1$, $\neg 1 = 0$. The power set of any set, ordered by inclusion, is a complete Boolean algebra. The [twist product](./twist-product.md) $\mathbf{2} \otimes \mathbf{2}$ builds the four-valued [bilattice](./bilattice.md) from this simplest Boolean algebra.
