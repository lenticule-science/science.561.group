---

description: "An element ¬a such that a ∧ ¬a = ⊥ and a ∨ ¬a = ⊤. Every element of a Boolean algebra has a complement; in a Heyting algebra, not every element does."
aliases: [complement, complements, complementation, complemented]
applies-to: [bounded-lattice, boolean-algebra]
contrasts-with: negation
date-created: 2026-03-31
---

In a bounded [lattice](../../order/objects/lattice.md), the complement of an element $a$ is an element $\neg a$ satisfying:

$$a \wedge \neg a = \bot \qquad a \vee \neg a = \top$$

The meet gives non-contradiction: $a$ and its complement have nothing in common. The join gives excluded middle: between them, $a$ and $\neg a$ cover everything.

In a [Boolean algebra](../objects/boolean-algebra.md), every element has a unique complement, and $\neg\neg a = a$. In a [Heyting algebra](../../logic/objects/heyting-algebra.md), the pseudo-complement $\neg a = a \to \bot$ exists but may not satisfy excluded middle: $a \vee \neg a = \top$ can fail. This is the algebraic gap between classical and constructive logic.

Complementation is different from negation on a [bilattice](../objects/bilattice.md). Negation $\mathord{\sim}$ on the four-valued bilattice swaps $t \leftrightarrow f$ and fixes $\bot, \top$. It is an [involution](./involution.md) ($\mathord{\sim}\mathord{\sim} a = a$) but it is not a complement: $t \wedge_t \mathord{\sim} t = t \wedge_t f = f \neq \bot$. Bilattice negation reverses truth; it does not produce the lattice-theoretic complement.
