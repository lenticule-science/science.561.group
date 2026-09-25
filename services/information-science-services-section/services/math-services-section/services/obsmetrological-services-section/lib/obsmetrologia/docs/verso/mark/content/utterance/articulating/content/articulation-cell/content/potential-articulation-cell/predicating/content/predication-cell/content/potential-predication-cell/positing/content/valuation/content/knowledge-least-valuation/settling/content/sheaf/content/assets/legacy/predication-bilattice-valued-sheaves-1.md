---
type: question
class: internal
status: partial
explores: [settling-associated-sheaf, paired-priestley-space, d-frame, d-frame-valued-sheaf, d-frame-cohomology-comparison, bigraded-settling-cohomology, predication-fiber-algebra, bigraded-realizability-refinement, jung-rivieccio-duality, priestley-dualizability]
---

# Bilattice-valued sheaves (bigraded-axis cohomology)

The cohomology layer uses sheaves valued in $\mathbf{Ab}$ — abelian groups. The choice was justified on homological-algebra-availability grounds: enough injectives, derived functors, Godement resolutions, Čech comparison, and spectral sequences are available off the shelf in $\mathbf{Ab}$. The cost is that the resulting invariants see only the $\mathbb{Z}$-rank of newly-designated cell sets, losing the bilattice's $(\leq_t, \leq_k)$-structure.

Open: replace $\mathbf{Ab}$ with a value category that carries bilattice structure directly. This is the *bigraded-axis slice* of axis-aware cohomology — value-category enrichment that makes the [bigraded refinement](../../../../../references/bigraded-realizability-refinement.md)'s $(c_t, c_\top)$-decomposition intrinsic to sections rather than reconstructed afterward.

## Three coordinate charts of one axis

Three candidate value categories present themselves, related by the dualities the corpus already proves:

- **Distributive [bilattices](../objects/bilattice.md)** — the algebraic side, native to the [predication fiber algebras](../objects/predication-fiber-algebra.md) which already are distributive bilattices.
- **d-frames** ([@jung-moshier2006]; [@jakl2018]) — the bitopological-algebraic side, with off-the-shelf homological infrastructure.
- **Paired Priestley spaces** — the spatial side, self-dual with the [bitopological settling site's](../../../../bitopological-settling-site/bitopological-settling-site.md) fibers via [Priestley dualizability](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-dualizability.md).

By [Jung–Rivieccio duality](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/references/jung-rivieccio-duality.md) fiberwise and [Priestley dualizability](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-dualizability.md) globally, the three candidates are derived-equivalent — they are coordinate charts of one axis, not three independent axes.

The choice between them is which side of the duality square is most ergonomic for a given proof:

- *Bilattice values* expose the realizability program's bigraded refinement most directly — the $(c_t, c_\top)$-decomposition is just the bilattice value type.
- *d-frames* are where homological-algebra computations are least painful — published infrastructure for derived functors, projectives/injectives, named generators.
- *Paired Priestley spaces* are where geometric/duality arguments are cleanest — Verdier-style structure has its natural home here.

A complete theory would develop all three with the duality bridges proved as derived equivalences, and prove individual theorems in whichever chart makes them shortest.

## Status: d-frame chart substantially developed

The d-frame chart is now a Part 2 chapter of the monograph (see [bilattice-cohomology-opener](../narratives/bilattice-cohomology-opener.md)). Substantial content in place:

**Definitions and infrastructure (proved):**
- [d-frame](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/d-frame.md), [d-frame-morphism](../morphisms/d-frame-morphism.md), [d-frame-valued sheaf](../../d-frame-valued-sheaf/d-frame-valued-sheaf.md), [negative-paraconsistent settling-associated sheaf](../../negative-paraconsistent-settling-sheaf/negative-paraconsistent-settling-sheaf.md).
- [d-frame-valued sheaf condition](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-valued-sheaf-condition.md): the gluing axioms hold.
- [d-frame ↔ $\mathbf{Ab}$ cohomology comparison](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md): section-level proved; cohomological level proved in finite/Scott-continuous regimes; sketch in transfinite regimes.

**Framework choice and methodology:**
- [Framework-choice narrative](../narratives/d-frame-cohomology-framework.md): adopts Tarski Laplacian ([@ghrist-riess2022]) / Lawvere Laplacian ([@ghrist-et-al2025]) framework.
- [Cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md): three-layer extension required for transfinite cases.
- [Methodology narrative](../narratives/d-frame-cohomology-methodology.md): five-step pattern (cellular structure → Laplacian → fiber-by-fiber → assembly → shadow-compare).

**Regime-by-regime cohomology theorems:**
- [Strict-regime d-frame cohomology](../../settling-cohomology/references/strict-regime-d-frame-cohomology.md) (proved) + [worked single-cell example](../examples/strict-regime-d-frame-computation.md).
- [Scott-continuous-regime d-frame cohomology](../../settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md) (proved, via filtered-colimit machinery).
- [Transfinite-bounded-regime d-frame cohomology](../../settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md) (sketch, depends on Layer 2).
- [Aperiodic-regime d-frame cohomology](../../../../aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md) (sketch, depends on Layers 2 + 3).

The strict and Scott-continuous theorems together complete the *directly-applicable region* of the framework — where published Tarski Laplacian machinery applies without needing the cellular extension plan's deeper layers.

## What remains substantively open

The transfinite-bounded and aperiodic d-frame cohomology theorems are sketched precisely; their proofs depend on the [cellular extension plan](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cellular-extension-plan.md)'s Layer 2 (fibered cellular sites with non-Scott-continuous transitions) and Layer 3 (transfinite cellular structure for $\omega_1$-cofinal fibers). This is multi-paper-scale research with concrete entry points in the potential Ghrist–Lopez–North–Riess research direction.

Beyond the d-frame chart: the [paired-Priestley-space-valued](../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/paired-priestley-space.md) and distributive-bilattice-valued charts remain open as parallel developments. By the duality bridges (Jung–Rivieccio fiberwise, Priestley dualizability globally), they should be transportable from the d-frame chart once it's fully developed.

The bigraded-axis question (this question) is therefore in *potential development* — substantial content proved, deep open work identified at specific layers. The companion axis questions ([$\mathcal{C}$-naturality-valued sheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/c-naturality-valued-sheaves.md), [rule-language-fragment-stratified sheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/rule-language-stratified-sheaves.md)) are at earlier stages of development and benefit from the methodological pattern this chapter establishes.

## What this gives predication categories

A bigraded-axis cohomology would carry the bigraded realizability decomposition intrinsically: $H^1$-classes would split into truth-side and inconsistency-side components by the value-category structure, not by an after-the-fact projection. Strong-MLD invariants finer than $\mathrm{cl}\text{-}\mathrm{inv}^{(0,1)}$ become statable directly in the cohomology rather than as refined invariants on top of it.

This question is one slice of a three-axis-aware cohomology program. The companion questions cover the other two axes: [$\mathcal{C}$-naturality-valued sheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/c-naturality-valued-sheaves.md) (predicate-category-action axis) and [rule-language-fragment-stratified sheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/rule-language-stratified-sheaves.md) (rule-language expressivity axis). Each axis has its own value-category candidates and its own homological-algebra obligations; cross-axis combinations are downstream of all three being individually developed.
