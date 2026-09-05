---
type: question
class: internal
status: open
explores: [predication-hyperdoctrine, dual-predication-hyperdoctrine, priestley-dualizability, settling-moduli-stack-theorem, settling-cohomology, paired-priestley-space]
---

# Deformation theory of predication hyperdoctrines

The [settling moduli stack theorem](../theorems/settling-moduli-stack-theorem.md) gives a 1-stack of settlings over the [parameter base category](../objects/parameter-base-category.md) but no notion of *infinitesimal* variation. Open: develop a tangent / deformation theory for the moduli stack — what does it mean to deform a [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) infinitesimally, and what does the deformation classify?

This is the natural sequel to the moduli layer: moduli stack → tangent → deformations is the standard chain in derived algebraic geometry, and predication categories' apparatus is positioned to host it.

## Candidate constructions

The [Priestley dualization](../theorems/priestley-dualizability.md) is what makes deformation theory tractable here — algebraic deformations on the primal side correspond to geometric deformations on the dual side, where there is more structure to lean on.

- **Nilpotent-thickening sheaves on paired Priestley spaces.** Tangent vectors to a [dual predication hyperdoctrine](../objects/dual-predication-hyperdoctrine.md) as nilpotent extensions of the structure sheaf on its [paired Priestley space](../objects/paired-priestley-space.md). Deformations classified in $H^1$, obstructions in $H^2$ — exactly where predication categories' [vanishing theorem](../theorems/settling-cohomology-vanishes-above-degree-1.md) applies.
- **Tangent complex of the closure 2-monad.** First-order deformations of the [closure 2-monad](../morphisms/closure-2-monad.md) itself, classified by deformations of its KZ-coherence data. Closer to the algebraic side; might be redundant with the dual presentation.
- **Square-zero extensions of the predicate category.** Deform the predicate category $\mathcal{C}$ itself — perturb the four-generator structure — and ask which deformations lift to deformations of the predication hyperdoctrine. This is a different question (deforming the *base*) than the above (deforming the structure on a fixed base).

## Why the existing infrastructure is enough to start

Three pieces of the corpus are load-bearing for deformation theory and already in place:

- The [vanishing of $H^{\geq 2}$](../theorems/settling-cohomology-vanishes-above-degree-1.md) means obstruction theory is degenerate above degree 1 — every first-order deformation extends to higher orders without obstruction, on the standard sheaves. This is unusual and structurally informative.
- The [paired Priestley space](../objects/paired-priestley-space.md) gives a concrete spatial site on which infinitesimal thickenings can be defined.
- The [bigraded cohomology](../objects/bigraded-settling-cohomology.md) splits truth-side and inconsistency-side data, suggesting the deformation theory inherits the bigraded refinement: deformations that perturb truth-content separately from inconsistency-content.

## Cross-question coupling

The deformation theory is *entangled* with two other open questions:

- **Bilattice-valued sheaves.** A deformation theory built on the current $\mathbf{Ab}$-valued cohomology gives $\mathbb{Z}$-flavored tangent classes — abelian-group deformations. A [bilattice-valued cohomology](bilattice-valued-sheaves.md) would give bilattice-flavored tangent classes that distinguish truth-side and inconsistency-side deformations, which is qualitatively different. Likely the right move is to do bilattice-valued cohomology first, then deformation theory on top. **Update:** the bilattice-valued cohomology chapter now has substantive infrastructure — [Q-enriched cohomology](../objects/q-enriched-cohomology.md) defined, four regime cohomology theorems at proved or draft status, and a Q-enriched [vanishing-above-degree-1 theorem](../theorems/q-enriched-cohomology-higher-degree-vanishing.md) at draft. The "$H^{\geq 2} = 0 \Rightarrow$ unobstructed deformation theory" payoff sub-question becomes statable in the d-frame setting: with Q-enriched $H^{\geq 2} = 0$ established, deformation theory in the d-frame setting should be unobstructed too.
- **Representation theory.** A "free residuated 2-category" answer to the [representation-theory question](representation-theory-skh.md) would predict a specific deformation-theoretic structure (deformations of free objects = deformations of generators). Confirming or refuting that structure would simultaneously refine both questions.

## Specific d-frame deformation candidates

With the d-frame chapter's framework in place, the deformation-theory question gets specific d-frame-flavored candidate constructions:

- **d-frame tangent classes at $H^1_{\mathbf{dFrm}}$.** First-order deformations of a settling parametrized by elements of $H^1$ in the d-frame setting. The $H^1$-generator structure $D_\mu$ at each non-Scott-continuous firing ([transfinite-bounded-regime d-frame cohomology](../theorems/transfinite-bounded-regime-d-frame-cohomology.md)) gives a concrete description: a tangent class is a d-frame-valued cocycle, distinguishing perturbations of truth-only firings from falsity-only firings from $\top$-firings. The shadow comparison shows this is strictly finer than the $\mathbf{Ab}$-valued tangent classification.
- **Consistency / totality deformations.** The d-frame structure carries consistency and totality data beyond the abelianized shadow. A first-order deformation could perturb the consistency relation (creating new $\top$-witness pairs) without perturbing the underlying cell structure — a deformation invisible to the bigraded refinement but visible in the d-frame setting. This is structurally new content the d-frame deformation theory would discover.

## Specific sub-questions to start with

- Compute $H^1$ of the structure sheaf on a small concrete paired Priestley space (the dual of the [transfinite-induction settling](../examples/transfinite-induction-settling.md)) and identify which classes are first-order deformations vs which are non-deformation cohomology.
- State and prove (or refute) a "$H^{\geq 2} = 0 \Rightarrow$ unobstructed deformation theory" theorem. This is the cleanest payoff predication categories' vanishing theorem could have.
- Identify whether the regime stratification of the moduli is locally constant under deformations (a deformation can't cross regimes) or whether deformations can interpolate between regimes. The regime stratification's [non-semicontinuity](../theorems/regime-stratification-non-semicontinuity.md) suggests it's NOT locally constant in the topological sense.

This sits beyond the cohomology layer of the program — moduli of predication hyperdoctrines and their tangent structure are the planned scope of a later paper.
