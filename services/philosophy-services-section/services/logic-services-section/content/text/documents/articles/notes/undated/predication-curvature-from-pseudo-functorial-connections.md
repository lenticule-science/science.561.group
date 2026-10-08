---
type: question
status: partial
explores: [gauge-connection, gauge-twisted-reindexing, klein-four-gauge-bundle, closure-2-monad, closure-flow-curvature-regime-correspondence, equivariant-cohomology-decomposition]
partial-answers: [pseudo-functorial-connection-from-closure-2-monad, order-and-cleavage-gauged-hyperdoctrine]
title: Curvature from pseudo-functorial gauge connections
description: "A gauge connection on a predication hyperdoctrine is defined as a strict functor $A : \\mathcal{C} \\to BK4$."
---

# Curvature from pseudo-functorial gauge connections

> **Partial answer (direction (3)).** [pseudo-functorial-connection-from-closure-2-monad](../../research/2026/07/31/lenticule-import/theorems/pseudo-functorial-connection-from-closure-2-monad.md) constructs a genuinely pseudo-functorial connection $A^{\mathrm{Cl}}$ from any strict $A$ and any $K_4^{\,k}$-equivariant closure family $\mathrm{cl}$, with 2-cocycle $[F_{A^{\mathrm{Cl}}}] = ([\pi \circ A] \smile [\pi \circ A]) \cdot [\mu] \in H^2(N\mathcal{C}, \underline{K_4}_\mu)$. Non-trivial whenever **all three** factors are non-trivial: the parity sub-class $[\pi \circ A] \neq 0 \in H^1$, the closure-flow curvature 2-cell $[\mu] \neq 0$ (curved regimes), and the cup-square $[\pi \circ A] \smile [\pi \circ A] \neq 0 \in H^2(N\mathcal{C}, \mathbb{Z}/2)$. This unifies the two corpus curvature notions.
>
> **Partial answer (sub-question on full-$K_4$ Beck–Chevalley).** [order-and-cleavage-gauged-hyperdoctrine](../../research/2026/07/31/lenticule-import/objects/order-and-cleavage-gauged-hyperdoctrine.md) gives the per-leg characterization: in-support gauged BC holds iff the projection legs are parity-0; full-square iso picks out exactly two parity regimes (parity-0 uniform and top-bottom parity-1).

A [gauge connection](../../research/2026/07/31/lenticule-import/objects/gauge-connection.md) on a [predication hyperdoctrine](../../research/2026/07/31/lenticule-import/objects/predication-hyperdoctrine.md) is defined as a strict functor $A : \mathcal{C} \to BK_4$. By [flat-connections-classified-by-h1](../../research/2026/07/31/lenticule-import/theorems/flat-connections-classified-by-h1.md), the moduli of such connections modulo gauge equivalence is $H^1(N\mathcal{C}, \underline{K_4})$ — *all* connections in this sense are flat by construction.

The natural relaxation is to *pseudo-functors* $A : \mathcal{C} \to BK_4$: maps assigning $A(f) \in K_4$ to morphisms with the cocycle condition $A(g \circ f) = A(g) A(f)$ replaced by a *coherent isomorphism* $\alpha_{g,f} : A(g \circ f) \cong A(g) A(f)$ satisfying the pentagon identity. The obstruction to strictifying a pseudo-functor lives in $H^2(N\mathcal{C}, \underline{K_4})$ — this is the **gauge curvature 2-cocycle** $F_A$ of the pseudo-connection $A$.

The question is then:

**Question.** Does any natural construction in the corpus produce a genuinely pseudo-functorial gauge connection — one with non-trivial $F_A \in H^2(N\mathcal{C}, \underline{K_4})$?

## Why this matters

The corpus already has a *curvature* notion — the [closure-flow curvature](../../research/2026/07/31/lenticule-import/theorems/closure-flow-curvature-regime-correspondence.md) of the [closure 2-monad](../../research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md), classified by $H^1(\mathbf{T}^*, \mathcal{F}_v)$ on the [bitopological settling site](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md). That curvature is a property of the *settling dynamics* on a fixed predicate category. The pseudo-functorial gauge curvature would be a property of the *predicate category itself* — a kinematic obstruction independent of any particular settling.

Both are $H^\bullet$-valued; they classify different things; the question is whether they interact.

A positive answer — i.e., a corpus construction that genuinely produces a non-strict $A$ — would give a second, independent curvature invariant living in $H^2(N\mathcal{C}, \underline{K_4})$, and would let us ask: do closure-flow curvature events (NSC firings) project onto the gauge curvature class? Are there settlings that realize a given $H^2$ class?

## Where pseudo-functoriality might come from

Three plausible sources, in roughly increasing order of speculative content:

1. **Non-strict composition in $\mathcal{C}$.** The corpus's [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) is a strict 1-category. If extended to a bicategory — for instance, by treating composition of [predicate generators](../../research/2026/07/31/lenticule-import/theorems/predicate-generator-composition-table.md) up to natural isomorphism rather than on the nose — pseudo-functoriality of $A$ becomes the coherence data for the gauge action under non-strict composition. This is structural: the bicategorical $\mathcal{C}$ comes first, the pseudo-connections follow.

2. **Non-trivial cleavage choices on the [predication fibration](../../research/2026/07/31/lenticule-import/objects/predication-fibration.md).** A cloven fibration becomes a pseudo-functor under the Grothendieck construction; pseudo-iso 2-cells in the cleavage produce a pseudo-functor $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$. If the gauge connection is required to be compatible with the cleavage, non-trivial cleavages produce pseudo-functorial gauge data. The [Emmenegger fibration 2-comonad](../../research/2026/07/31/lenticule-import/theorems/emmenegger-fibration-comonad.md) statement of the fibration as a pseudo-coalgebra is suggestive here.

3. **The [closure 2-monad](../../research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md) acting on the gauge connection.** The closure 2-monad is lax-idempotent (KZ); applying it to a strict gauge connection might produce a pseudo-functorial connection as the closure obstructs strict functoriality. The resulting curvature 2-cocycle would then *be* the closure obstruction in gauge-theoretic form — directly tying gauge curvature to closure-flow curvature.

Direction (3) is the most interesting: it would give a single, unified curvature framework where the [closure-flow curvature regime correspondence](../../research/2026/07/31/lenticule-import/theorems/closure-flow-curvature-regime-correspondence.md) and the gauge $H^2$ are two views of the same obstruction.

## What would settle the question

A construction (in any of directions 1–3, or another) producing a specific predication hyperdoctrine with a specific $A$ such that $F_A \neq 0 \in H^2(N\mathcal{C}, \underline{K_4})$. Concretely: write down $\mathcal{C}$, write down the assignment $f \mapsto A(f)$, write down the 2-cells $\alpha_{g,f}$, and verify that the resulting cocycle is not a coboundary.

A negative answer — a theorem showing that *every* gauge connection on every predication hyperdoctrine of corpus interest is strictifiable — would also settle the question and would significantly simplify the gauge-theoretic picture: the entire moduli is $H^1$, and there is no genuinely 2-cocycle-valued curvature.

## A second open: extending twisted Beck–Chevalley beyond the $\leq_k$-axis

The [$\leq_k$-axis twisted Beck–Chevalley](../../research/2026/07/31/lenticule-import/theorems/twisted-beck-chevalley.md) theorem covers exactly one quadrant of the gauge group: connections valued in $K_4^{\,k} = \{e, {\sim}\}$. The other three sectors are obstructed:

1. **$\leq_t$-axis with $K_4^{\,t} = \{e, -\}$.** Both elements are $\leq_t$-monotone and fix $\mathbf{f}$, suggesting a clean dual. But the [predication fibration](../../research/2026/07/31/lenticule-import/objects/predication-fibration.md)'s cleavage extends [specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) by $\bot$ uniformly — *not* by the order-bottom of whichever order the adjoint is taken in. Since $-(\bot) = \top \neq \bot$, the conflation twist does not commute with cellwise reindexing on outside-support cells. A $\leq_t$-axis theorem would need either a "$\leq_t$-flavored" cleavage convention extending by $\mathbf{f}$, or a transport rule converting outside-support extension values along $-$-edges.

2. **Full $K_4$, order-reversing elements $\{-, {\sim}\circ-\}$.** Two compounding obstructions: (i) the order-reversing elements turn $\leq_k$-monotone reindexings into Galois adjoints between $\leq_k$ and $\leq_k^{\mathrm{op}}$, corresponding to a *swap of quantifier polarities* $\exists \leftrightarrow \forall$ along the twisted edges; (ii) the same extension-value problem as in (1).

A coherent **order-and-cleavage-gauged Beck–Chevalley** statement would treat the order pair $(\leq_k, \leq_t)$, the cleavage extension value, and the quantifier polarities as joint gauge data — a connection valued in $K_4$ would carry not just an automorphism of fibers but a permutation of these structural choices. The sub-question is therefore:

**Sub-question.** *What is the right notion of "$K_4$-twisted predication hyperdoctrine" in which the structural data — orders, extension conventions, quantifier polarities — is gauged jointly with the fiber automorphisms, such that all four elements of $K_4$ give a coherent twisted Beck–Chevalley?*

A clean formulation would unblock the full-$K_4$ refinement of the [equivariant cohomology decomposition](../../research/2026/07/31/lenticule-import/theorems/equivariant-cohomology-decomposition.md) twisted by holonomy. A negative answer — a structural obstruction theorem — would tell us the predication hyperdoctrine simply is not gauge-symmetric under the full $K_4$, only under its $\leq_k$-preserving subgroup, and the corresponding equivariant decomposition reduces to the $\mathbb{Z}/2$-equivariant decomposition under $\sim$ alone.

## Related

- [closure-flow-curvature-regime-correspondence](../../research/2026/07/31/lenticule-import/theorems/closure-flow-curvature-regime-correspondence.md) — the existing curvature notion, classified by $H^1$ on the bitopological site.
- [equivariant-cohomology-decomposition](../../research/2026/07/31/lenticule-import/theorems/equivariant-cohomology-decomposition.md) — the $K_4$-equivariant refinement of $H^1$; would be the natural place for a gauge-curvature contribution to land.
- [closure-2-monad](../../research/2026/07/31/lenticule-import/morphisms/closure-2-monad.md) — its lax-idempotence is the structural reason direction (3) is plausible.
