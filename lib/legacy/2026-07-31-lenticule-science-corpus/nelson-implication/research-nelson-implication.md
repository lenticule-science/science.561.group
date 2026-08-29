---

introduces: connective
description: "A strong implication on bilattices incorporating both direct and contrapositive reasoning: x ⇒_N y = (x ⊃ y) ∧ (∼y ⊃ ∼x)."
defines: nelson-implication
aliases: [Nelson implication, strong implication, Nelson identity]
specialization: residual-implication
acts-on: [bilattice, twist-product]
incorporates: [direct-implication, contrapositive]
identity: "(x ⇒ (x ⇒ y)) ∧_k (~y ⇒ (~y ⇒ ~x)) = x ⇒ y"
repairs: contrapositive
second-adjoint-pair-on: twist-product
simple-contrapositive: fails-on-bilattice
introduced-by: chajda-langer-2021
generalized-by: [busaniche-galatos-marcos-2022, rivieccio-busaniche-2024]
date-created: 2026-03-30
---

The Nelson implication is an implication operation on [bilattices](../../algebra/terms/bilattice.md) and [twist products](../../algebra/terms/twist-product.md) that incorporates both direct and contrapositive reasoning simultaneously:

$$x \Rightarrow_N y = (x \supset y) \wedge (\mathord{\sim} y \supset \mathord{\sim} x)$$

where $\supset$ is the weak (Heyting) implication and $\sim$ is negation.

Chajda & Langer (2021) established the Nelson implication as a second [adjoint pair](../../categories/domains/ordinary-categories/terms/adjoint-pair.md) on twist products, alongside the Busaniche-Cignoli [residuation](../../algebra/terms/residuated-lattice.md). It satisfies the **Nelson identity**:

$$(x \Rightarrow (x \Rightarrow y)) \wedge_k (\mathord{\sim} y \Rightarrow (\mathord{\sim} y \Rightarrow \mathord{\sim} x)) = x \Rightarrow y$$

On the four-valued bilattice $\mathbf{2} \otimes \mathbf{2}$, the simple contrapositive fails: $\mathord{\sim}(a \odot b) \neq \mathord{\sim} b \Rightarrow \mathord{\sim} a$ in general. The Nelson form — which tests both the direct implication and the contrapositive at once — is sound. Any modal calculus on bilattice-valued fibers must use the Nelson implication for negation-aware reasoning, not the naive contrapositive.
