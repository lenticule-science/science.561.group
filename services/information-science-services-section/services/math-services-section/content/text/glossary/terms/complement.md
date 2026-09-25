---

description: "An element ¬a such that a ∧ ¬a = ⊥ and a ∨ ¬a = ⊤. Every element of a Boolean algebra has a complement; in a Heyting algebra, not every element does."
aliases: [ complement, complements, complementation, complemented, Complement ]
applies-to: [bounded-lattice, boolean-algebra]
contrasts-with: negation
date-created: 2026-03-31

---

In a bounded [lattice](./lattice.md), the complement of an element $a$ is an element $\neg a$ satisfying:

$$a \wedge \neg a = \bot \qquad a \vee \neg a = \top$$

The meet gives non-contradiction: $a$ and its complement have nothing in common. The join gives excluded middle: between them, $a$ and $\neg a$ cover everything.

In a [Boolean algebra](./boolean-algebra.md), every element has a unique complement, and $\neg\neg a = a$. In a [Heyting algebra](./heyting-algebra.md), the pseudo-complement $\neg a = a \to \bot$ exists but may not satisfy excluded middle: $a \vee \neg a = \top$ can fail. This is the algebraic gap between classical and constructive logic.

Complementation is different from negation on a [bilattice](./bilattice.md). Negation $\mathord{\sim}$ on the four-valued bilattice swaps $t \leftrightarrow f$ and fixes $\bot, \top$. It is an [involution](./involution.md) ($\mathord{\sim}\mathord{\sim} a = a$) but it is not a complement: $t \wedge_t \mathord{\sim} t = t \wedge_t f = f \neq \bot$. Bilattice negation reverses truth; it does not produce the lattice-theoretic complement.

---

## Additional formulation

```yaml
---

description: "An element ¬a such that a ∧ ¬a = ⊥ and a ∨ ¬a = ⊤. Every element of a Boolean algebra has a complement; in a Heyting algebra, not every element does."
aliases: [complement, complements, complementation, complemented]
applies-to: [bounded-lattice, boolean-algebra]
contrasts-with: negation
date-created: 2026-03-31
---
```

In a bounded [lattice](../../order/terms/lattice.md), the complement of an element $a$ is an element $\neg a$ satisfying:

$$a \wedge \neg a = \bot \qquad a \vee \neg a = \top$$

The meet gives non-contradiction: $a$ and its complement have nothing in common. The join gives excluded middle: between them, $a$ and $\neg a$ cover everything.

In a [Boolean algebra](boolean-algebra.md), every element has a unique complement, and $\neg\neg a = a$. In a [Heyting algebra](heyting-algebra.md), the pseudo-complement $\neg a = a \to \bot$ exists but may not satisfy excluded middle: $a \vee \neg a = \top$ can fail. This is the algebraic gap between classical and constructive logic.

Complementation is different from negation on a [bilattice](./bilattice.md). Negation $\mathord{\sim}$ on the four-valued bilattice swaps $t \leftrightarrow f$ and fixes $\bot, \top$. It is an [involution](involution.md) ($\mathord{\sim}\mathord{\sim} a = a$) but it is not a complement: $t \wedge_t \mathord{\sim} t = t \wedge_t f = f \neq \bot$. Bilattice negation reverses truth; it does not produce the lattice-theoretic complement.

## Earlier material

In a bounded [lattice](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/order/objects/lattice.md), the complement of an element $a$ is an element $\neg a$ satisfying:
