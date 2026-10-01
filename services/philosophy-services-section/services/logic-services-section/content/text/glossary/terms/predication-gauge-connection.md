---
type: definition
class: connection
symbol: "A"
status: draft
realizes: [internal-z2-gauge, klein-four-symmetry]
depends-on: [predication-fibration, predication-hyperdoctrine, predicate-category, klein-four-gauge-bundle, four-bilattice, internal-z2-gauge, negation, conflation]
see-also: [klein-four-gauge-bundle, equivariant-cohomology-decomposition, beck-chevalley-commutation-on-predication-bilattices, closure-flow-curvature-regime-correspondence]
name: Gauge connection on a predication hyperdoctrine
description: "Fix a predication hyperdoctrine $p : \\mathcal{E} \\twoheadrightarrow \\mathcal{C}$ over base parameters $(\\mathbf{L}, \\mathcal{C}, E)$."
---

# Gauge connection on a predication hyperdoctrine

Fix a [predication hyperdoctrine](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-hyperdoctrine.md) $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ over base parameters $(\mathbf{L}, \mathcal{C}, E)$. Let $K_4 = \mathrm{Aut}(\mathbf{FOUR}) = \langle {\sim}, - \rangle$ be the Klein-four group of bilattice automorphisms of [$\mathbf{FOUR}$](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/four-bilattice.md), realized as the fiberwise [Klein-four gauge bundle](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/klein-four-gauge-bundle.md) $\mathcal{G}$ on $\mathcal{E}$.

A **gauge connection** on $p$ is a functor

$$A : \mathcal{C} \longrightarrow BK_4,$$

where $BK_4$ is the one-object groupoid with morphisms $K_4$. Concretely, $A$ assigns to every morphism $f : q \to p$ in $\mathcal{C}$ an element $A(f) \in K_4$ subject to

- **(C1)** $A(\mathrm{id}_q) = e$ for every $q \in \mathcal{C}$,
- **(C2)** $A(g \circ f) = A(g) \cdot A(f)$ for every composable pair $f : q \to p$, $g : p \to r$.

The set of gauge connections on $p$ is denoted $\mathcal{G}\mathrm{Conn}(p)$.

## Gauge equivalence

Two connections $A, A' \in \mathcal{G}\mathrm{Conn}(p)$ are **gauge-equivalent** if there is a function

$$\eta : \mathrm{Ob}(\mathcal{C}) \to K_4$$

with $A'(f) = \eta(p) \cdot A(f) \cdot \eta(q)^{-1}$ for every $f : q \to p$. Since $K_4$ is abelian this simplifies to $A'(f) = A(f) \cdot \eta(p) \eta(q)^{-1}$, i.e. $A'$ and $A$ differ by the coboundary $\delta\eta(f) := \eta(p)\eta(q)^{-1}$.

The set of gauge-equivalence classes is the **moduli of gauge connections**

$$\mathcal{M}_{\mathcal{G}}(p) := \mathcal{G}\mathrm{Conn}(p) \;/\; (\text{gauge equivalence}).$$

## Holonomy

For a loop $\gamma = (f_n, \dots, f_1)$ in $\mathcal{C}$ — i.e. a composable string of morphisms with common source and target $q$ — the **holonomy** of $A$ around $\gamma$ is

$$\mathrm{hol}_A(\gamma) := A(f_n) \cdots A(f_1) \in K_4.$$

By (C1)–(C2) this is well-defined; by gauge equivalence it is gauge-invariant (the $\eta$-conjugation telescopes). The holonomy descends to a homomorphism $\mathrm{hol}_A : \pi_1(\mathcal{C}, q) \to K_4$, and the assignment $A \mapsto \mathrm{hol}_A$ refines to the classification proved in [flat connections classified by $H^1$](../../documents/articles/research/2026/07/31/lenticule-import/theorems/flat-connections-classified-by-h1.md).

## Gauge subgroups respecting a chosen order

The four elements of $K_4$ split with respect to the two bilattice orders as

| element | $\leq_k$ | $\leq_t$ | fixes $\bot$? | fixes $\mathbf{f}$? |
|---|---|---|---|---|
| $\mathrm{id}$ | preserves | preserves | yes | yes |
| ${\sim}$ | preserves | reverses | yes | no |
| $-$ | reverses | preserves | no | yes |
| ${\sim}\circ-$ | reverses | reverses | no | no |

Two distinguished subgroups arise:

- $K_4^{\,k} := \{e, {\sim}\}$, the $\leq_k$**-preserving subgroup**. Every element fixes $\bot$ (the $\leq_k$-bottom), so cellwise extension-by-$\bot$ commutes with the $K_4^{\,k}$-action.
- $K_4^{\,t} := \{e, -\}$, the $\leq_t$**-preserving subgroup**. Every element fixes $\mathbf{f}$ (the $\leq_t$-bottom in $\mathbf{FOUR}$).

A connection $A : \mathcal{C} \to BK_4^{\,k}$ is a **$\leq_k$-axis gauge connection**. The [$\leq_k$-axis twisted Beck–Chevalley](../../documents/articles/research/2026/07/31/lenticule-import/theorems/twisted-beck-chevalley.md) theorem extends the $\leq_k$-hyperdoctrinal Beck–Chevalley along $K_4^{\,k}$-valued connections.

The naive $\leq_t$-dualization with $K_4^{\,t}$ does **not** go through, even though $-$ is $\leq_t$-monotone and fixes $\mathbf{f}$. The obstruction is that the [predication fibration](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-fibration.md) cleavage extends [predicate-specialization](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) by $\bot$ (not by $\mathbf{f}$), and $-(\bot) = \top \neq \bot$ — so $-$ does not commute with cellwise reindexing on outside-support cells. A coherent $\leq_t$-axis or full-$K_4$ Beck–Chevalley would need additional cleavage and quantifier-polarity data; this is open, see [curvature from pseudo-functorial connections](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/questions/curvature-from-pseudo-functorial-connections.md).

## Scope of the gauge action on bilattice structure

The Klein-four group acts as automorphisms of the *bilattice* $\mathbf{FOUR}$ in the abstract sense — it preserves or reverses each lattice order, with the action on the four lattice operations $\{\wedge_t, \vee_t, \wedge_k, \vee_k\}$ determined accordingly (see [gauge-twisted reindexing graded homomorphism](../../documents/articles/research/2026/07/31/lenticule-import/theorems/gauge-twisted-reindexing-graded-homomorphism.md)). It does *not* respect the residuated structure $(\odot, \Rightarrow)$ on $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$: only the identity element preserves these operations strictly, by [contrapositive-failure](../../documents/articles/research/2026/07/31/lenticule-import/theorems/contrapositive-failure.md). The gauge connection thus twists the bilattice content of reindexing, leaving the residuated content un-respected. This is consistent with the corpus's existing observation that Frobenius reciprocity for $\odot$ already fails in the untwisted predication hyperdoctrine — the residuated operations are not part of the hyperdoctrinal axioms (which use only $\wedge_k, \wedge_t$), so the gauge twist's failure to respect them does not break hyperdoctrinal coherence.

## The trivial connection

The constant functor $A_0(f) = e$ is a gauge connection. Its gauge-equivalence class is the **trivial class** $[A_0] \in \mathcal{M}_{\mathcal{G}}(p)$. The Klein-four gauge bundle $\mathcal{G}_v$ on a [predication settling](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/predication-settling.md) $v$ carries the trivial connection by construction: each $K_4$-equivariant structure $\rho_g$ is taken constant in $\mathcal{C}$.

A non-trivial connection $A \neq A_0$ specifies a way to *twist* the equivariant structure on $\mathcal{G}_v$ as one transports it along morphisms of $\mathcal{C}$ — see [gauge-twisted reindexing](../../documents/articles/research/2026/07/31/lenticule-import/morphisms/gauge-twisted-reindexing.md).

## Why a functor and not just a 1-cocycle

Stating the connection as a functor $\mathcal{C} \to BK_4$ rather than a raw map $\mathrm{Mor}(\mathcal{C}) \to K_4$ builds in (C1) and (C2) automatically. The functorial form is also the right object for the classification result: $\mathrm{Fun}(\mathcal{C}, BK_4) / \!\!\sim$ is, by general nonsense for abelian coefficients, exactly $H^1$ of the nerve $N\mathcal{C}$ with constant coefficients $K_4$.

The non-functorial relaxation — pseudo-functors $\mathcal{C} \to BK_4$ with non-trivial 2-cocycle data — is the natural locus of *gauge curvature* in this setting. Whether such pseudo-functorial connections arise from any predication construction is open; see [curvature from pseudo-functorial connections](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/questions/curvature-from-pseudo-functorial-connections.md).

## Position in predication categories

The gauge connection is the kinematical companion of the [Klein-four gauge bundle](../../documents/articles/research/2026/07/31/lenticule-import/from-predicate-category/klein-four-gauge-bundle.md): the bundle gives the fiberwise $K_4$-action; the connection gives the rule for transporting the $K_4$-frame along $\mathcal{C}$. With both in hand, the [equivariant cohomology decomposition](../../documents/articles/research/2026/07/31/lenticule-import/theorems/equivariant-cohomology-decomposition.md) refines to a *twisted* equivariant cohomology, with each isotypic sector tensored by a rank-1 local system whose monodromy is the corresponding character of the holonomy.

The structure parallels classical principal-bundle gauge theory: the bundle is the bundle, the connection is the connection, and the holonomy/curvature pair organize the gauge-invariant content. The novelty here is that the gauge group $K_4$ comes *for free* — it is the automorphism group of the bilattice value space, not extra data.
