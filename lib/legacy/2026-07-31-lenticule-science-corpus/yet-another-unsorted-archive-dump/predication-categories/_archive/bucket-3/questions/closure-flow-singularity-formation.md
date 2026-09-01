---
kind: question
status: open
explores: [closure-2-monad, closure-operator, settling-endofunctor, four-regime-dichotomy, non-scott-continuous-firing-ordinal, transfinite-bounded-regime-h1-generators, d-frame-verdier-composition, strong-mld-via-composed-duality]
---

# Closure flow as geometric flow with firings as singularities

The [closure operator](../morphisms/closure-operator.md) iterates over ordinal time, producing a trajectory in the space of valuations. Where the closure operator's iteration commutes with directed colimits — Scott-continuous segments — the trajectory is "smooth" in a precise sense: the value at a limit ordinal is the directed-colimit-supremum of values at earlier ordinals. At [non-Scott-continuous firing ordinals](../concepts/non-scott-continuous-firing-ordinal.md), this fails: the value at $\mu$ has content not present in any directed-colimit of values at $\sigma < \mu$. The trajectory's behavior breaks at $\mu$.

This is structurally **singularity formation in a geometric flow**. The closure flow is smooth except at NSC firings, where it develops singularities. The corpus has the firings; what it doesn't have is the **flow-and-singularity language**, with the apparatus that comes with it (blowup analysis, model singularities, singularity type classification beyond the firing-type already in place).

## What the analogy gives concretely

The Ricci-flow / mean-curvature-flow / harmonic-map-flow literature has a structural template the corpus's setting fits cleanly:

- **The flow itself.** Closure operator iteration $C^\sigma : v_0 \mapsto v_\sigma$ as ordinal $\sigma$ ranges. Smooth (= Scott-continuous) on segments between NSC firings.
- **The singular set.** The set $L_{\mathrm{ns}}(\kappa) \subset \kappa$ of non-Scott-continuous firing ordinals — the "singular times" of the closure flow.
- **Singularity types.** Each $\mu \in L_{\mathrm{ns}}$ has a *type* — the firing's evidence-side structure (truth-only, falsity-only, $\top$), refined by the consistency-failure pattern in the d-frame setting. This is the corpus's existing strong-MLD orbit-type, recast as a singularity-type taxonomy.
- **Local structure (blowup).** Just before a NSC firing $\mu$, the values $v_\sigma$ for $\sigma < \mu$ approach a limit. The "rescaled" flow near $\mu$ — restricted to a neighborhood of the firing in the predicate-axis × ordinal-axis — has a *limiting model singularity*. For Ricci flow these models are explicit (cylindrical singularities, neckpinches, type-II). For our setting they should be classifiable analogously.

## The substantive direction: blowup analysis

The closure flow near a NSC firing $\mu$ has a local structure that the corpus has not analyzed. **Blowup analysis** would classify the local structures.

For a firing of type truth-only: just before $\mu$, the truth-side has a sequence of cells $(v_\sigma(P)(s, o))_{\sigma < \mu}$ approaching $\mathbf{t}$ on the new cell. The "blowup limit" — the rescaled limit of this sequence — should be a *model* of the singularity, encoding only the essential local structure. For truth-only firings, the model is conjecturally:

$$\mathrm{Model}_{\text{truth-only}} \;=\; \bigl(\text{cell newly $\mathbf{t}$, no falsity-content, no consistency-failure}\bigr).$$

For $\top$-firings: model has cell newly $\top$, with explicit consistency-failure between the truth-side and falsity-side singletons.

The model singularities should form a small classification — the firing-type lattice, refined by predicate-incidence and consistency-failure pattern. The blowup theorem would say: any NSC firing's local structure is the model of its type, up to canonical isomorphism.

## Why this is structurally new

The corpus already has:

- The firing-type classification (truth-only / falsity-only / $\top$, from the [d-frame Verdier composition](../theorems/d-frame-verdier-composition.md)).
- The strong-MLD refinement tracking the firing-type function (from [strong-MLD via composed-duality](../theorems/strong-mld-via-composed-duality.md)).
- The four-regime dichotomy classifying the *count* and *cofinality* of firings.

It does not have:

- The *local* structure of the closure flow at each firing (the blowup model).
- The *moduli of singularity types* as a structural object (related to but distinct from the [failure-event moduli stack](failure-event-moduli-stack.md)).
- The *stability theorem* asserting that small deformations of a settling produce small deformations of each firing's blowup model (related to [deformation theory of SKHs](deformation-theory-of-skhs.md)).

These are downstream of the singularity-formation framing.

## Sub-questions

1. **State the closure flow as a discrete geometric flow.** Make precise: closure-operator iteration is a discrete flow on the space of valuations $V$, with the Scott-continuity property characterizing the "smooth" segments and NSC firings as the singular times.

2. **Define the blowup of a firing.** For a NSC firing $\mu$ in a settling $v$, define the rescaled local flow near $\mu$ — restricted to a neighborhood of the firing in $(\mathcal{C}^{\mathrm{op}} \times \omega_1)$, with appropriate ordinal-rescaling. The blowup should be intrinsic to the firing, not depending on the choice of neighborhood.

3. **Classify the model singularities.** Show every blowup limit is one of finitely many models, classified by firing-type plus structural data (predicate-incidence, consistency-failure pattern). This is the corpus's analog of the Type-I / cylindrical / neckpinch classification in Ricci flow.

4. **Connection to the strong-MLD invariant.** Show the model-singularity classification refines the firing-type classification. Two firings have the same model iff they agree in firing type AND consistency-failure pattern AND predicate-incidence — strictly finer than firing-type alone.

## Connection to existing literature

Hamilton's program for Ricci flow singularity classification ([@hamilton1995] for type-I, [@perelman2002] for the Ricci-flow-with-surgery setup) is the closest established template. The corpus's setting is structurally analogous but on a different base — bilattice valuations on a hyperdoctrine instead of metrics on a manifold. The structural template — flow + smooth segments + singular times + blowup analysis + model classification — transfers; the specific computations are different.

Hamilton-style "smoothing" arguments don't directly apply (we're not solving a parabolic PDE), but the structural framework — singularities as the quantitative content of irregular flow behavior — does.

## Position in the program

This is the master framing of the geometric-flow direction. Two further questions develop specific facets:

- [Surgical continuation past firing-singularities](surgical-continuation-past-firings.md) — the global structure: how the closure operator continues the flow after a singularity, viewed as Hamilton-Perelman-style surgery.
- [Singularity-type stability under deformation](singularity-type-stability-under-deformation.md) — the deformation interaction: which firing-types are active under settling-deformations.

Concrete entry point: the strict-regime worked examples have explicit firings; analyze the blowup for each. The [strict-regime ⊤-firing example](../examples/strict-regime-top-firing-verdier-self-dual.md) gives the simplest non-trivial instance — a single $\top$-firing on a 2-stage settling. The blowup analysis there should be small enough to write out explicitly, and would establish the pattern for the abstract case.
