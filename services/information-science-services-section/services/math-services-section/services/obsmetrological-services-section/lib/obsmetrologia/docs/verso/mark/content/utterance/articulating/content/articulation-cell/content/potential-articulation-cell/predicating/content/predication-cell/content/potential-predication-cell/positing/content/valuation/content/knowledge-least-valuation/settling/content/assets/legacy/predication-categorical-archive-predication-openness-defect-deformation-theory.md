---
type: question
class: internal
status: open
explores: [skh-deformation-ext-classification, frame-morphism-meet-preservation-openness, settling-cohomology-vanishes-above-degree-1, tarski-lawvere-omega1-cellular-stalk-product, settling-moduli-stack-theorem, q-enriched-cohomology-higher-degree-vanishing, deformation-theory-of-skhs]
---

# Openness-defect deformation theory: deformations across the categorical-openness boundary

The [SKH deformation Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) (proved) establishes unobstructed deformation theory ($\mathrm{Ext}^2 = 0$, every first-order extends to formal) for the corpus's standard sheaves. Unobstructedness rests on the [vanishing-above-degree-1 theorem](../../sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md), which holds for cellular stalk-product sheaves on the bitopological settling site.

The [frame-morphism openness characterization](../theorems/frame-morphism-meet-preservation-openness.md) (proved) just identified the cellular stalk-product class as precisely the *categorical-openness* stratum of a structural boundary in sheaf-space: a frame morphism preserves all meets iff it has a left adjoint iff (spatially) it is induced by an open map. This raises a direction the existing deformation theory has not touched:

> **What is the deformation theory of cellular sheaves whose deformations LEAVE the categorical-openness class?**

The existing Ext-classification answers this implicitly with "unobstructed" — but only because the standing hypothesis confines the question to inside the cellular class. The vanishing-above-degree-1 theorem on which unobstructedness rests is itself proved *inside* the class. Crossing the openness boundary, $\mathrm{Ext}^2$ may become nonzero — at which point the existing unobstructedness story does not apply.

## The unfound mathematics

The openness characterization gives a concrete structural boundary in sheaf-space; the existing deformation theory sits entirely on one side. Three pieces of unfound mathematics live across the boundary:

**(i) The openness-defect obstruction class.** A 1-parameter family $\{\mathcal{F}_t\}$ of sheaves degenerating at $t = 0$ to a sheaf whose restriction $\mathcal{F}_0(f)$ loses its left adjoint should produce a specific cohomology class

$$\delta(\mathcal{F}, t) \;\in\; \mathrm{Ext}^2(\mathcal{F}_0, \mathcal{F}_0)$$

— the *openness-defect class* — vanishing iff the family is extendible as a family of cellular sheaves and nonzero exactly when the openness boundary is crossed. Concretely: the meet-preservation discrepancy $\bigwedge h(U_\alpha) \setminus h(\bigwedge U_\alpha)$ should encode this $\mathrm{Ext}^2$ class via a cosimplicial resolution of the iterated meet-preservation defect.

**(ii) The deformation-theory dichotomy at the openness boundary.** The existing unobstructedness is conditional on staying cellular. The complementary statement — deformations leaving cellularity are obstructed at second order with obstruction class $\delta$ — is the natural converse. Together they give a clean dichotomy: cellular-preserving deformations unobstructed; cellular-leaving deformations obstructed exactly by $\delta$. The [openness-boundary deformation dichotomy theorem](../theorems/openness-boundary-deformation-dichotomy.md) states this precisely (sketch).

**(iii) Bilattice decomposition of the obstruction.** In the d-frame setting, $\delta$ should decompose into three parts: positive (truth-side openness defect), negative (falsity-side openness defect), and consistency-relation ($\top$-side openness defect). Each component nonzero independently in general. The Ab-shadow sees only the abelianized total, missing the trichotomy. This is a place where the d-frame refinement of cohomology produces strictly more deformation-theoretic content than the shadow.

## Why this is novel territory

Three reasons it sits beyond the existing apparatus:

1. **The openness boundary is brand new.** Before the [openness characterization theorem](../theorems/frame-morphism-meet-preservation-openness.md), the cellular stalk-product class was a convenience hypothesis. It is now identified as the categorical-openness stratum of a structural decomposition.

2. **The existing unobstructedness was conditionally local.** The Ext-classification's $\mathrm{Ext}^2 = 0$ was always a statement *on* the cellular class, not a global statement. The category-of-question "what about deformations off the class" could not be posed before the openness characterization gave it a structural target.

3. **The obstruction class is bilattice-flavored in d-frame setting.** Existing literature on obstruction classes in deformation theory is field-valued or Ab-valued; bilattice-valued obstruction classes have no direct precedent.

## Sub-questions

1. **Define the openness-defect class precisely.** Construct $\delta(\mathcal{F}, t) \in \mathrm{Ext}^2(\mathcal{F}_0, \mathcal{F}_0)$ via a specific cosimplicial resolution. Required properties: vanishes on cellular-preserving deformations; nonzero on cellular-leaving deformations; functorial in $\mathcal{F}$ and $t$.

2. **Prove the deformation-theory dichotomy.** Push the [openness-boundary deformation dichotomy](../theorems/openness-boundary-deformation-dichotomy.md) sketch to proved status. The (a)-direction (unobstructedness inside cellular class) reduces to the existing Ext-classification; the (b)-direction (obstructedness across the boundary) requires the cosimplicial construction of $\delta$ to be made fully explicit.

3. **Compute $\delta$ on the explicit ω₁-counterexample.** The [openness counterexample](../theorems/frame-morphism-meet-preservation-openness.md) (topology-refining identity on $\omega_1+1$) gives a concrete cellular-leaving deformation. Compute its openness-defect class; verify it is nonzero in $\mathrm{Ext}^2$ and equals the meet-preservation discrepancy $\{\omega_1\} \setminus \emptyset$ in a natural cohomological identification.

4. **d-frame refinement of $\delta$.** Decompose $\delta$ into truth-side, falsity-side, and consistency-relation parts in $\mathrm{Ext}^2_{\mathbf{dFrm}}$. Show the decomposition is strictly finer than the Ab-shadow on at least one explicit example.

5. **Schlessinger pro-representability across the boundary.** The corpus has not checked Schlessinger conditions (H1–H4). Inside the cellular class, unobstructedness suggests pro-representability is plausible. Across the boundary, the obstruction-class layer makes pro-representability nontrivial — H4 (well-behavedness of tangent space) may fail at boundary points where tangent dimension jumps non-semicontinuously per the [tangent-dimension theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md). Whether $\mathrm{Def}(\mathcal{F})$ has a Schlessinger hull, and what shape it takes at boundary points, is open.

6. **Openness-stratification of the settling moduli stack.** Refine the [settling moduli stack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md)'s regime stratification by categorical openness: cellular substack (open) vs non-cellular substack (boundary). Whether the openness-defect class stratifies the moduli with cellular as a genuinely open substack — making cellularity a Zariski-style local property — is open.

## Connection to existing structure

- Builds on [SKH deformation Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) by asking what happens when its standing hypothesis (cellular class) is left.
- Uses [frame-morphism openness characterization](../theorems/frame-morphism-meet-preservation-openness.md) as the structural backbone identifying the boundary.
- Refines [tangent-dimension constructible-non-semicontinuous theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md) by adding a second stratification axis (openness in addition to regime).
- Connects to [singularity-type stability under deformation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/singularity-type-stability-under-deformation.md): both ask which deformations preserve a structural property; that question concerns firing-types, this one concerns categorical-openness.
- Concretizes [deformation theory of SKHs](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/deformation-theory-of-skhs.md): provides a structural boundary the apex question only references abstractly.

## Connection to existing literature

The substantive literature mapping for all four directions of this question is in the [openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md) narrative, which traces each sub-direction to its prior work, identifies what transfers, what needs adaptation, and what is genuinely new in the corpus's setting.

In summary:

- Direction (i) — cosimplicial construction of $\delta$: prototype is [@gerstenhaber1964] (cup-product-square obstruction in Hochschild cohomology). Cosimplicial machinery from [@bousfield-kan1972]; DG-coalgebra reformulation from [@hinich2001]. **Direction (i) now has its first technical theorem:** the [cosimplicial construction of the openness-defect class](../theorems/openness-defect-cosimplicial-construction.md) (proved) makes the Čech cosimplicial complex explicit on the bitopological settling site, establishes the cosimplicial-to-Ext identification, gives the explicit Yoneda-cup formula for the cup-product-square cocycle, identifies the cocycle on chain pairs as the meet-preservation discrepancy, and proves the d-frame trichotomy decomposition $\phi \cup \phi = (\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-) + \delta^\top_{\mathrm{cross}}$ at cocycle level. This fills Steps 2/3 of the [openness-boundary deformation dichotomy theorem](../theorems/openness-boundary-deformation-dichotomy.md)'s proof framework.
- Direction (iii) — Schlessinger pro-representability: foundational [@schlessinger1968]; modern DGLA viewpoint [@manetti2009]; obstruction calculus [@fantechi-manetti1998]; textbook treatment [@hartshorne2010].
- Direction (iv) — wall-crossing: structural template is **stability-condition wall-crossing** ([@bridgeland2007], [@joyce-song2012], [@kontsevich-soibelman2008]). The corpus's openness boundary is structurally analogous, with categorical openness playing the role of stability and the openness-defect class playing the role of wall-crossing invariant.

The framework is differently flavored across the board: stability-condition wall-crossing lives in derived categories of coherent sheaves on Calabi–Yau 3-folds with $\mathbb{C}$-valued central charges; the corpus's openness wall-crossing lives in Q-enriched sheaves on bitopological settling sites with bilattice-valued analogs. The structural template — moduli + stratification + cross-stratum invariants — transfers; the specific machinery is different and novel in the corpus's setting.

## Position in predication categories

This is the deformation-theoretic complement of the [openness characterization theorem](../theorems/frame-morphism-meet-preservation-openness.md). Where that theorem identifies the structural boundary, this question develops the deformation theory across it.

Concrete entry point: the [explicit ω₁-counterexample](../theorems/frame-morphism-meet-preservation-openness.md#explicit--cofinal-counterexample) gives a specific cellular-leaving deformation. Compute its openness-defect class as a worked example; generalize the construction.

The corpus is uniquely positioned to develop this because both ingredients — the openness characterization and the d-frame Ext-classification — are corpus-internal. Neither classical deformation theory (which has not addressed openness boundaries) nor d-frame theory (which has not developed deformation-theoretic apparatus) supplies precedent.
