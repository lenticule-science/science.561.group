---
type: question
class: internal
status: open
explores: [non-scott-continuous-firing-ordinal, aperiodic-classifying-invariant, settling-moduli-stack-theorem, strong-mld-via-composed-duality, d-frame-verdier-composition, aperiodic-co-classification]
---

# Failure-event moduli stack

The bilattice's structure is built on **failure**: the consistency relation $\mathrm{con}$ records pairs that *fail to co-witness $\top$*; cohomology classes are *cocycles that fail to be coboundaries*; the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) counts these failures, indexed by [non-Scott-continuous firing ordinals](../concepts/non-scott-continuous-firing-ordinal.md). The corpus already has a *moduli of settlings* (the [settling moduli stack](../theorems/settling-moduli-stack-theorem.md)). Open: a separate moduli — the **failure-event moduli stack** — whose objects are typed firing-events as geometric objects in their own right, with the settling moduli covering it.

## What this would be

Currently the corpus treats $L_{\mathrm{ns}}(\kappa)$ as a *set* — a sub-ordinal of $\omega_1$. Each element $\mu$ has implicit structure:

- An *ordinal position* in $\omega_1$.
- A *firing type* (truth-only / falsity-only / $\top$, from the [d-frame Verdier composition](../theorems/d-frame-verdier-composition.md)).
- A *predicate of incidence* $q_\mu \in \mathcal{C}$.
- A *consistency-failure pattern* (for $\top$-firings, which earlier cells does it co-witness with?).

Treating $L_{\mathrm{ns}}$ as a *geometric object* with this typed structure gives a **failure-event space**: a topological / categorical object whose points are firing-events, with the type-and-position-and-incidence data as structure. Different settlings produce different failure-event spaces; the *moduli of failure-event spaces* is then the natural object to classify.

The settling moduli covers the failure-event moduli: every settling produces a failure-event space (by reading off its $L_{\mathrm{ns}}$ structure), but multiple settlings can produce the same failure-event space (those that are settling-isomorphic up to shift). The covering map encodes which closure-rule structures realize which failure-patterns.

## Why this matters structurally

The corpus's existing classification is *settling-centric*: it asks which settlings are MLD-equivalent or strong-MLD-equivalent. The failure-event-centric refinement asks a different question: *what failure-event spaces are achievable?* — i.e., which typed firing-pattern geometries arise from any closure rule whatsoever.

This is closer to the [realizability program](../narratives/realizability-program.md)'s core question (which classifying classes are realizable) but *more refined*: realizability asks which $H^1$-classes are realized; failure-event moduli asks which *typed failure-event geometries* are realized — strictly finer than $H^1$ class.

The corpus's [realizability cardinality bound](../theorems/realizability-cardinality-bound.md) gives an upper bound on the failure-event moduli: at most $2^{\aleph_0}$ classes. Whether the bound is tight, and what the topology / stratification of the failure-event moduli looks like, is open.

## Concrete sub-questions

1. **Define the failure-event space of a settling.** A topological or categorical object $\mathcal{F}\!\mathit{ail}(v)$ whose points are pairs $(\mu, \mathrm{type}_\mu)$ for $\mu \in L_{\mathrm{ns}}(\kappa, v)$, with topology / categorical structure encoding the predicate-incidence and consistency-failure data.

2. **State the moduli stack.** Construct a stack $\mathcal{M}^{\mathrm{fail}}$ over the [parameter base category](../objects/parameter-base-category.md), with objects failure-event spaces and morphisms appropriate equivalences. Verify it is a 2-stack with the same kind of geometric content as the settling moduli stack.

3. **The covering $\mathcal{M}^{\mathrm{SKH}} \to \mathcal{M}^{\mathrm{fail}}$.** Settlings cover failure-events: each settling has a failure-event space, and the covering map sends a settling to its failure-events. Characterize the *fibers* — settlings producing the same failure-event space differ in what?

4. **Realizability for failure-events.** Which failure-event spaces are *realized* by some settling? This is a structural refinement of the existing realizability question — the realizability of $H^1$-classes is a corollary, but the failure-event realizability is finer because it tracks types and consistency-patterns.

5. **Failure-event cohomology.** The failure-event space $\mathcal{F}\!\mathit{ail}(v)$ has its own cohomology as a topological / categorical object. What does this measure? Conjecture: it measures *meta-failures* — failures of typing-consistency across firings, or correlations between firing-events that the simple firing-set classification doesn't see.

## Connection to other horizon questions

The failure-event moduli is the *structural backbone* of the four horizon questions:

- [Typed barcoding](typed-barcoding-of-settling-cohomology.md) gives the *time-axis presentation* of the failure-event data.
- [Unified void dynamics](unified-void-dynamics.md) gives the *cosheaf-side dual* (void-events as the dual of failure-events).
- [Holographic reconstruction](holographic-sheaf-reconstruction.md) is the bulk-boundary statement at the sheaf level.

Together: the failure-event moduli is the *underlying geometric object*; barcoding is its time-axis presentation; void-dynamics is its cosheaf-dual presentation; holography is its bulk-boundary statement. The four questions are facets of a single picture, with the failure-event moduli as the structural center.

## Connection to existing literature

The closest precedent is the **persistence diagram space** in topological data analysis ([@cohen-steiner-edelsbrunner-harer2007]): a moduli of persistence diagrams (essentially typed barcodes) with a natural metric. The corpus's failure-event moduli would be a generalization to bilattice-typed firing-events on Grothendieck sites — strictly more structural content than persistence diagrams.

The substitution-tiling moduli ([@anderson-putnam1998]; [@sadun2008]) is also a precedent — a moduli of tilings with topological structure given by inverse-limit / direct-limit constructions. The failure-event moduli would parallel this for predication categories' bilattice setting.

## Position in predication categories

This is the *most structural* of the four horizon questions. It requires defining a new moduli object and understanding its geometric structure, not just refining existing invariants.

Concrete entry point: define $\mathcal{F}\!\mathit{ail}(v)$ for a specific transfinite-bounded settling (the [mixed-stratum two-firing settling](../examples/mixed-stratum-two-firing-settling.md), say) and study its structure explicitly. Generalize from concrete to abstract once the per-example structure is clear.

This is genuinely novel research mathematics — the failure-event-as-moduli framing is not in any direct literature precedent we've found. The corpus is uniquely positioned to develop it, having both the bilattice typing and the settling-cohomology infrastructure already in place.
