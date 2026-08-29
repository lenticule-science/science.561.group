---

introduces: connective
description: "The logical equivalence p → q ≡ ¬q → ¬p. Holds in classical logic; fails on bilattices without the Nelson form."
defines: contrapositive
aliases: [contrapositive, contraposition]
specialization: logical-equivalence
holds-in: [classical-logic, boolean-algebra]
fails-on: bilattice
repaired-by: nelson-implication
specific-failure: "~(a ⊙ b) ≠ ~b ⇒ ~a on 2⊗2"
date-created: 2026-03-30
---

The contrapositive of an implication $p \to q$ is $\neg q \to \neg p$. In classical logic, these are equivalent: proving $p \to q$ is the same as proving $\neg q \to \neg p$.

On the four-valued [bilattice](../../algebra/terms/bilattice.md), the simple contrapositive fails: $\mathord{\sim}(a \odot b) \neq \mathord{\sim} b \Rightarrow \mathord{\sim} a$ in general. Negation does not commute with the [residuated](../../algebra/terms/residuated-lattice.md) operations.

The [Nelson implication](./nelson-implication.md) repairs this by incorporating both the direct and contrapositive simultaneously: $x \Rightarrow_N y = (x \supset y) \wedge (\mathord{\sim} y \supset \mathord{\sim} x)$. The Nelson identity holds on the bilattice even though the simple contrapositive does not. Negation-aware iterated implication is sound; naive contrapositive is not.
