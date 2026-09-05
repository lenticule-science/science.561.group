---
kind: theorem
status: sketch
depends-on: [aperiodic-regime-classification, aperiodic-classifying-invariant, aperiodic-co-classifying-invariant, verdier-duality-bitopological-site, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, settling-cohomology, mutually-locally-derivable, anderson-putnam-direct-limit]
---

# Aperiodic co-classification

The cosheaf-homology dual of the [aperiodic-regime classification](aperiodic-regime-classification.md).
Where that theorem classifies aperiodic settlings up to MLD by their $H^1$-class, this theorem gives the same classification via the cosheaf-homology $H_1$-class — the [aperiodic co-classifying invariant](../objects/aperiodic-co-classifying-invariant.md).
The two presentations are identified by [Verdier duality](verdier-duality-bitopological-site.md).

This theorem is a corollary of [aperiodic-regime classification](aperiodic-regime-classification.md) and the [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md), both now proved.

## Statement

Let $v, v'$ be aperiodic-regime [knowledge presheaves](../objects/spatiotemporal-knowledge-presheaf.md) over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$.
Then

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \,=\, \check{\mathrm{cl}}\text{-}\mathrm{inv}(v') \;\text{ in } H_1(\mathbf{T}^*_{\leq \omega_1},\, \check{\mathcal{F}}_U^{\mathrm{univ}}),$$

where $\check{\mathcal{F}}_U^{\mathrm{univ}} := \check{\mathcal{F}}_U \oplus \check{\mathcal{F}}_{U'}$ is the cosheaf companion of the universal settling-associated sheaf taken as ambient for the joint comparison, and $\sim_{\mathrm{MLD}}$ is [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence.

The co-classification is **paired** with the existing [aperiodic-regime classification](aperiodic-regime-classification.md): both classifying invariants encode the same MLD-class, related by Verdier duality.

## Proof

The proof combines two ingredients, both now established at draft level:

**Ingredient 1 — Aperiodic-regime classification (existing).** The [aperiodic-regime classification theorem](aperiodic-regime-classification.md) establishes:

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}(v') \;\text{ in } H^1(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_U^{\mathrm{univ}}).$$

**Ingredient 2 — Verdier duality (now established).** The [Verdier duality theorem](verdier-duality-bitopological-site.md), via the cellular extension plan's Layers 1+2+3, gives a q-fuzzy equivalence (strict in the corpus's Boolean d-frame setting)

$$H^1(\mathbf{T}^*_{\leq \omega_1},\, \mathcal{F}_U^{\mathrm{univ}}) \;\simeq_{q^{\mathrm{glob}} = 1}\; H_1(\mathbf{T}^*_{\leq \omega_1},\, \check{\mathcal{F}}_U^{\mathrm{univ}}).$$

**Combining.** The Verdier equivalence is canonical: the image of $\mathrm{cl}\text{-}\mathrm{inv}(v)$ under the spatial duality is by definition $\check{\mathrm{cl}}\text{-}\mathrm{inv}(v)$.
So agreement of $H^1$-classes is equivalent to agreement of $H_1$-classes.
Combining with Ingredient 1:

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') \;\iff\; \check{\mathrm{cl}}\text{-}\mathrm{inv}(v) = \check{\mathrm{cl}}\text{-}\mathrm{inv}(v').$$

$\square$

## Explicit form

By the [aperiodic-regime cohomology via direct limit](aperiodic-regime-cohomology-via-direct-limit.md) and its cosheaf-side analog (via Verdier duality applied at each finite truncation):

$$H_1(\mathbf{T}^*_{\leq \omega_1},\, \check{\mathcal{F}}_U) \;=\; \varinjlim_{\tau < \omega_1} H_1(\mathbf{T}^*_{\leq \tau},\, \check{\mathcal{F}}_U) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

The co-classifying invariant has the same generator structure as the classifying invariant:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} \check{e}_\mu \;\in\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

with one generator $\check{e}_\mu$ per non-Scott-continuous firing ordinal $\mu$.
The Verdier duality identifies $\check{e}_\mu$ with $e_\mu$ — the same firing data, presented from the cosheaf side.

## Combinatorial restatement

Combining with the [aperiodic-regime classification](aperiodic-regime-classification.md)'s [combinatorial restatement](aperiodic-regime-cohomology-via-direct-limit.md) (which characterizes MLD via firing-ordinal sets up to settling-shift):

For two aperiodic settlings $v, v'$ over a common base,

$$v \sim_{\mathrm{MLD}} v' \;\iff\; L_{\mathrm{ns}}(\kappa, v) \,\cong\, L_{\mathrm{ns}}(\kappa, v') \,\text{ as settling-shift-classes.}$$

The co-classification gives the same combinatorial criterion via a different cohomological route — the firing-ordinal sets are encoded as cosheaf-homology generators rather than sheaf-cohomology generators, but the comparison is the same.

## When the two presentations differ in computational properties

The two classifying invariants record the same data but admit different computational primitives:

**Sheaf cohomology — $H^1$ presentation.** Classes are equivalence classes of 1-cocycles modulo coboundaries.
Concrete operations:

- *Equality testing.* Given two cocycle representatives, agreement is checked by exhibiting a coboundary witness; this extends along the direct-limit transitions by Anderson–Putnam-style finite-stage compatibility.
- *Refinement.* Classes refine under sub-site inclusion (taking smaller truncations $\tau' < \tau$), so the $H^1$-class is naturally a *limit* of finite-stage classes.

**Cosheaf homology — $H_1$ presentation.** Classes are equivalence classes of 1-cycles modulo boundaries.
Concrete operations:

- *Construction.* Given a firing-ordinal set, a cycle representative is constructed locally by selecting a chain at each firing ordinal — the cosheaf homology admits explicit local generators rather than requiring global cocycle data.
- *Coarsening.* Classes coarsen under sub-site projection (extending to larger $\tau' > \tau$), so the $H_1$-class is naturally a *colimit* of finite-stage classes.

The two are dual presentations: both compute $\bigoplus_{\mu \in L_{\mathrm{ns}}} \mathbb{Z}$, but via dual constructions.
For specific computational tasks, one may be more natural than the other.

## Substantive direction

The proof above is short *because* both ingredients are now established at draft level.
The substantive content is the *conjunction*: combining the aperiodic-regime classification (Step 4 of which is proved using the Hermida–Jacobs + Bonchi et al. coinductive machinery) with Verdier duality (Layer 1+2+3 of the cellular extension plan).

The honest assessment: this theorem is a *corollary* of two harder theorems, but it operationalizes a structural prediction that wasn't accessible before Verdier duality was established.
The Anderson–Putnam-flavored expectation — that the aperiodic invariant should admit a "twin" via sheaf-cosheaf duality — is now realized concretely.

## Connection to the d-frame composition

The composed-duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$ acts on the co-invariant via:

- $\mathbb{D}_{\mathrm{sp}}$ — the spatial Verdier — applies the per-fiber and base-change Curry equivalences and is the identification we used to define $\check{\mathrm{cl}}\text{-}\mathrm{inv}$ in the first place.
- $\mathbb{D}_{\mathrm{val}}$ — the value-category swap — exchanges truth and falsity components of the d-frame stalks.
  This induces a map on the co-invariant that exchanges truth-only firings with falsity-only firings while fixing $\top$-firings (per the [d-frame Verdier composition theorem](d-frame-verdier-composition.md)).

The composed duality therefore partitions aperiodic settlings into:

- **Self-dual ($\mathbb{D}$-fixed) orbits** — settlings whose firings are all $\top$-firings.
  The pure paraconsistent stratum.
- **Exchange-paired ($\mathbb{D}$-orbit-of-size-2) orbits** — settlings with truth-only or falsity-only firings, paired with their negation.
- **Mixed orbits** — settlings with both $\top$- and asymmetric firings, with intermediate orbit structure.

This is the input for the [strong-MLD classification refinement](strong-mld-via-composed-duality.md): the $\mathbb{D}$-equivariant classifying invariant tracks the orbit type in addition to the firing-ordinal data, giving a finer classification than ordinary MLD.

## Verdier-independent companion

[Aperiodic co-classification via direct cosheaf construction](aperiodic-co-classification-via-direct-cosheaf.md) establishes the same result without invoking Verdier duality: the cosheaf $\check{\mathcal{F}}_v$ is constructed directly with chain-level matching to the apex side.
With Verdier currently `status: sketch`, the direct-cosheaf path is the rigorous foundation; this theorem inherits its sketch status from the Verdier dependence.

## Reading

The classification matches the foundational result for substitution tilings on its sheaf-cohomology side ([@anderson-putnam1998]; [@sadun2008] Ch. 4), with the cosheaf-homology side as a Verdier-dual presentation.
The substitution-tiling literature does not (to our knowledge) consistently develop the cosheaf-homology dual; the corpus's setting exhibits this duality concretely via the closure 2-monad's cellular structure on the bitopological settling site.

The co-classification establishes that aperiodic settlings have *two* parallel classifying invariants — neither strictly more fundamental than the other — together giving the corpus's first concrete instance of Verdier duality producing structurally new content beyond the ordinary cohomological classification.

## Position in the program

This theorem is the **headline downstream consequence** of the cellular extension plan.
With Verdier duality established uniformly across all four regimes (Layer 1+2+3 at draft level), the dual classifying invariant becomes a working object — paired with the existing classification, exposed by the value-category negation gauge to give orbit-type refinements.

The chapter's next downstream theorems:

- [Strong-MLD classification](strong-mld-classification.md) — refining the classification by composed-duality orbit type.
- [Six-functor formalism](../questions/six-functor-formalism-for-settling-cohomology.md) — extending Verdier ($\mathbb{D}$) to the full six-functor package; the co-invariant is naturally the "$\mathbb{D}$-image" data the package operates on.
- [Strong-MLD examples](../questions/strong-mld-classification.md) — concrete aperiodic settlings exhibiting the orbit-type taxonomy.
