---
type: theorem
status: proved
depends-on: [settling-automorphism-1-truncation, invisible-automorphism-subgroup, visible-automorphism-quotient, settling-associated-sheaf, settling-morphism]
kind: theorem
---

# Settling automorphism semidirect-product decomposition

Let $v$ be a settling. The [settling-automorphism](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md) group $\mathrm{Aut}^\simeq(v)$ decomposes as a semidirect product

$$\mathrm{Aut}^\simeq(v) \;\cong\; N(v) \,\rtimes\, \mathrm{Aut}^{\mathrm{vis}}(v),$$

where $N(v)$ is the [invisible automorphism subgroup](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/invisible-automorphism-subgroup.md) and $\mathrm{Aut}^{\mathrm{vis}}(v) = \mathrm{Aut}^\simeq(v) / N(v)$ is the [visible automorphism quotient](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/visible-automorphism-quotient.md).

The statement holds in the non-natural setting (fiber actions unrestricted by the [predicate generator exhaustiveness](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) hypothesis); the natural version is more delicate (see Remark below).

## Proof

**Normality of $N(v)$.** Let $\phi \in N(v)$ and $\psi \in \mathrm{Aut}^\simeq(v)$ with cellwise reindexings $g_\phi, g_\psi : E \times E \to E \times E$. State-compatibility of $\psi$ implies $g_\psi$ permutes newly-designated cells among themselves. Since $\phi \in N(v)$, $g_\phi$ fixes every newly-designated cell. Then for any newly-designated cell $c$:

$$(g_\psi^{-1} \circ g_\phi \circ g_\psi)(c) \;=\; g_\psi^{-1}\bigl(g_\phi(g_\psi(c))\bigr) \;=\; g_\psi^{-1}(g_\psi(c)) \;=\; c.$$

Hence $\psi^{-1} \phi \psi$ fixes every newly-designated cell, i.e., $\psi^{-1} \phi \psi \in N(v)$. So $N(v) \trianglelefteq \mathrm{Aut}^\simeq(v)$.

**Splitting.** Define a section $s : \mathrm{Aut}^{\mathrm{vis}}(v) \to \mathrm{Aut}^\simeq(v)$ by: for each class $[\psi]$, let $s([\psi])$ be the representative whose cellwise reindexing acts as $g_\psi$ on newly-designated cells (determined by $[\psi]$) and as the identity on permanently-$\bot$ cells. Well-defined because any two representatives of $[\psi]$ agree on newly-designated cells (differ only by an $N$-element acting on $\bot$-cells); imposing "identity on $\bot$-cells" picks a unique representative.

**$s$ is a group homomorphism.** For $[\psi_1], [\psi_2] \in \mathrm{Aut}^{\mathrm{vis}}(v)$: $s([\psi_1]) \cdot s([\psi_2])$ has cellwise reindexing that, on newly-designated cells, composes the two actions; on $\bot$-cells, composes identity with identity = identity. Matches the canonical representative of $[\psi_1] \cdot [\psi_2]$, so $s([\psi_1]) s([\psi_2]) = s([\psi_1 \psi_2])$.

The section $s$ and the normal subgroup $N(v)$ together give $\mathrm{Aut}^\simeq(v) \cong N(v) \rtimes \mathrm{Aut}^{\mathrm{vis}}(v)$ by the standard semidirect-product criterion: every $\phi \in \mathrm{Aut}^\simeq(v)$ factors uniquely as $\phi = n \cdot s([\phi])$ with $n = \phi \cdot s([\phi])^{-1} \in N(v)$. $\square$

## Naturality remark

Under the [naturality hypothesis](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md), $N(v)$ and $\mathrm{Aut}^{\mathrm{vis}}(v)$ are both subgroups of the natural-automorphism group, but the canonical section above does not exist: a natural automorphism's cellwise reindexing is determined by its action on any $\mathrm{Sym}(E)$-orbit and cannot be independently specified on newly-designated cells vs $\bot$-cells. For natural autos one often has $N_{\mathrm{nat}}(v)$ trivial or large in highly constrained ways (see the [transfinite-induction rigidity](../../../references/transfinite-induction-rigidity.md) computation), and a different splitting analysis applies.
