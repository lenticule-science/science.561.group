---
type: question
class: internal
status: partial
explores: [quantale-enriched-cosheaf, paraconsistent-settling-associated-sheaf, inconsistency-sheaf, settling-associated-sheaf, aperiodic-co-classifying-invariant, d-frame-verdier-composition]
title: Unified void dynamics
description: "These are different kinds of \"absence-of-uniqueness\" and the corpus treats them via separate machinery: cosheaf-side stalks for $\\bot$, consistency-relation failure for $\\top$."
---

# Unified void dynamics

> **Progress on the $\bot$-side.** The [void-cone cohomology theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/lorentzian-causal-settling/references/void-cone-cohomology.md) gives the cohomological invariant for the $\bot$-void cone: $H^0(\mathrm{Void}_v) \cong \bigoplus_{L_\mathrm{ns}} \mathbb{Z}$, dually paired with apex $H^1$ via firing-ordinal indexing. The [void-cone-structure narrative](void-cone-structure.md) develops the apex/void duality structurally. The [Lorentzian apex/void theorem](../../research/2026/07/31/lenticule-import/theorems/lorentzian-apex-void-as-timelike-spacelike.md) gives a physics-flavored realization. **Still open**: the *unified bigraded* $\check{\mathcal{V}}_v$ cosheaf described in this question — the object combining $\bot$-void and $\top$-void into a single bigraded structure with internal $\bot \to \mathbf{t} \to \top$ trajectories. The $\bot$-side cohomology now exists; the $\top$-side cohomology and the unified bigraded structure remain to be built.

The corpus has *two* kinds of void:

- **$\bot$-void.** Uninstantiated cells. As a settling proceeds, $\bot$-content shrinks. The [Q-enriched cosheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/quantale-enriched-cosheaf/quantale-enriched-cosheaf.md) is explicitly defined to track this — its stalks record "eventually-uncovered cells" at each $(q, \tau, U)$.

- **$\top$-void.** Paraconsistent cells — void of unique value. Both truth and falsity directions filled simultaneously, the cell can't be reduced to a single bilattice value. Tracked by the [inconsistency sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md).

These are different kinds of "absence-of-uniqueness" and the corpus treats them via separate machinery: cosheaf-side stalks for $\bot$, consistency-relation failure for $\top$. Open: a unified void-dynamics that captures both as facets of a single object — and tracks their interconversion.

## Why a unified picture

Three reasons the unification is structurally important:

1. **$\bot$-cells become $\top$-cells via firings.** A cell that's $\bot$ at $\tau = 0$ can become $\mathbf{t}$ via a truth-only firing, then $\top$ when negative evidence arrives at a later firing. The cell's *trajectory* through bilattice-values is a dynamical content the corpus has implicitly but not explicitly. A unified void-dynamics object would have *the cell's trajectory* as its primary data, with the various void-states ($\bot$, $\top$) as states it can occupy.

2. **The two voids are dual under $\mathbb{D}$.** Under the [composed duality](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$:
   - $\mathbb{D}_{\mathrm{sp}}$ sends settled content (sheaf) to eventually-uncovered cells (cosheaf) — exchanging the *spatial* void direction.
   - $\mathbb{D}_{\mathrm{val}}$ fixes $\top$-cells (self-dual) but exchanges $\mathbf{t}$ ↔ $\mathbf{f}$ — acting on the *value-category* void direction.
   The two voids are thus *paired* under the composed duality. A unified void-dynamics object would manifest this pairing as an internal structure, not just an emergent one.

3. **Both voids are aggregated by the cosheaf side.** Cosheaf homology $H_1(\check{\mathcal{F}})$ measures cycles that fail to aggregate to boundaries — *void-cycles*. Currently the cosheaf is parameterized by the $\bot$-void only ("eventually-uncovered cells"). A *fully* void-tracking cosheaf would parameterize by both $\bot$ and $\top$ simultaneously, with cycles distinguishing types of void-aggregation failures.

## What a unified void-cosheaf would look like

Concrete proposal: define a **void-cosheaf** $\check{\mathcal{V}}_v$ on the bitopological settling site whose stalks at $(q, \tau, U)$ are pairs

$$\check{\mathcal{V}}_v(q, \tau, U) = \bigl(\check{\mathcal{F}}^{(\bot)}_v(q, \tau, U),\, \check{\mathcal{F}}^{(\top)}_v(q, \tau, U)\bigr)$$

with extension maps tracking how each kind of void shifts under base-changes. The cosheaf homology $H_\bullet(\check{\mathcal{V}}_v)$ would then have *bigraded* generators — one part counting $\bot$-aggregations (cells uncovered indefinitely), one part counting $\top$-aggregations (cells locked into paraconsistency).

The unified picture would then have these bigraded generators *interact* — a $\bot$-cell becoming $\top$ corresponds to a chain-map between the two cosheaf parts.

## Sub-questions

1. **Define the void-cosheaf $\check{\mathcal{V}}_v$.** Stalks, extensions, sheaf condition. Compatibility with the existing cosheaf $\check{\mathcal{F}}_v$ as a quotient/projection.

2. **Bigraded void homology.** $H_k(\check{\mathcal{V}}_v) = H_k^{(\bot)}(\check{\mathcal{V}}_v) \oplus H_k^{(\top)}(\check{\mathcal{V}}_v)$ with explicit chain maps relating the two graded pieces.

3. **Void-trajectory stratification.** Each cell $(s, o, q) \in E \times E \times \mathcal{C}$ has a *trajectory* through bilattice-values over ordinal time. Stratify the moduli by trajectory-type:
   - eternal-$\bot$: never settled
   - eternal-$\mathbf{t}$ / eternal-$\mathbf{f}$: settles to one side, never flipped
   - $\bot \to \mathbf{t} \to \top$: truth-first, then paraconsistency
   - $\bot \to \top$ (simultaneous): $\top$-firing
   - etc.
   The trajectory-type is finer than the firing-type used in the strong-MLD classification.

4. **Void-dynamics interaction with $\mathbb{D}$.** Show $\mathbb{D}$ acts coherently on the void-cosheaf, with $\mathbb{D}_{\mathrm{val}}$ exchanging $\bot$ and $\top$ pieces in the appropriate sense. (This may not be quite right — $\bot$ is value-category-symmetric; the actual exchange may be different.)

## Connection to existing structure

The void-dynamics direction connects:

- The [cosheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/content/quantale-enriched-cosheaf/quantale-enriched-cosheaf.md) (already defined) — captures $\bot$-void.
- The [inconsistency sheaf](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) (already defined) — captures $\top$-content (which is dual to $\top$-void).
- The [aperiodic co-classifying invariant](../../research/2026/07/31/lenticule-import/objects/aperiodic-co-classifying-invariant.md) — currently records firing data via cosheaf homology; the unified version would record void-trajectories.
- The [strong-MLD classification](../../research/2026/07/31/lenticule-import/theorems/strong-mld-via-composed-duality.md) — refined via trajectory-type stratification rather than just firing-type.

## Position in predication categories

This is *deeper* than the [typed barcoding question](../../research/2026/07/31/lenticule-import/from-predicate-category/typed-barcoding-of-settling-cohomology.md) — it requires defining a new cosheaf object and verifying it has the right properties. But it's a *natural* deepening: the corpus already has the pieces ($\bot$-cosheaf via existing quantale-enriched cosheaf, $\top$-content via inconsistency sheaf), and the unification is the next structural step.

Concrete entry point: define $\check{\mathcal{V}}_v$ on the strict regime, where the two voids are explicitly enumerable, and verify the bigraded cosheaf homology computes the expected things. The transfinite-bounded and aperiodic extensions follow via direct-limit assembly.
