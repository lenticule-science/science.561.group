---

introduces: algebraic-structure
description: "A bounded distributive lattice with an involution (negation) satisfying De Morgan's laws: ~(a ∧ b) = ~a ∨ ~b."
defines: de-morgan-algebra
aliases: [De Morgan algebra, De Morgan algebras, De Morgan lattice]
specialization: distributive-lattice
operations: [meet, join, negation]
laws: [de-morgan, involution]
produced-by: twist-product
date-created: 2026-03-30
type: term

---

A De Morgan algebra is a bounded [distributive lattice](./distributive-lattice.md) $(L, \wedge, \vee, 0, 1)$ equipped with an involution $\mathord{\sim}$ satisfying De Morgan's laws:

$$\mathord{\sim}(a \wedge b) = \mathord{\sim} a \vee \mathord{\sim} b \qquad \mathord{\sim}(a \vee b) = \mathord{\sim} a \wedge \mathord{\sim} b$$

and $\mathord{\sim}\mathord{\sim} a = a$ (involution).

Kalman (1958) proved every bounded distributive lattice $L$ generates a De Morgan algebra via the [twist product](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) $L \otimes L$. The negation on the twist product swaps components: $\mathord{\sim}(a, b) = (b, a)$.

Every Boolean algebra is a De Morgan algebra (with complement as negation). Every [bilattice](./bilattice.md) carries a De Morgan algebra structure on its truth lattice.
