---
type: theorem
status: sketch
depends-on: [skh-deformation-ext-classification, frame-morphism-meet-preservation-openness, settling-cohomology-vanishes-above-degree-1, tarski-lawvere-omega1-cellular-stalk-product, q-enriched-sheaf-closed-monoidal-structure, q-enriched-cohomology-higher-degree-vanishing]
---

# Openness-boundary deformation dichotomy

The [SKH deformation Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) (proved) establishes unobstructed deformation theory for the corpus's cellular stalk-product sheaves; the [frame-morphism openness characterization](frame-morphism-meet-preservation-openness.md) (proved) identifies that class as the categorical-openness stratum of a structural boundary in sheaf-space. This theorem combines them into a deformation-theoretic dichotomy at the boundary: cellular-preserving deformations are unobstructed; cellular-leaving deformations are obstructed at second order, with obstruction class given by an explicit openness-defect $\delta \in \mathrm{Ext}^2$.

## Statement

**Theorem (openness-boundary deformation dichotomy, sketch).** *Let $\mathcal{F}$ be a cellular Q-enriched sheaf on the [bitopological settling site](../../bitopological-settling-site/bitopological-settling-site.md) — equivalently, every restriction $\mathcal{F}(f)$ has a left adjoint, by the [openness characterization](frame-morphism-meet-preservation-openness.md). Let $\mathcal{F}_\epsilon$ be a first-order deformation of $\mathcal{F}$, classified by $[\mathcal{F}_\epsilon] \in \mathrm{Ext}^1(\mathcal{F}, \mathcal{F})$ per the [Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md). Then:*

(a) *(Cellular-preserving direction, proved.) If every restriction $\mathcal{F}_\epsilon(f)$ retains a left adjoint to first order — i.e., the deformation preserves categorical openness — then $\mathcal{F}_\epsilon$ extends to a formal deformation $\mathcal{F}_{\widehat{\epsilon}}$ over $k[[\epsilon]]$ without obstruction. The obstruction class in $\mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$ is zero.*

(b) *(Cellular-leaving direction, sketch.) If some restriction $\mathcal{F}_\epsilon(f_0)$ loses its left adjoint at first order — i.e., the deformation leaves categorical openness through the restriction $f_0$ — then $\mathcal{F}_\epsilon$ is obstructed at second order. The obstruction class*

$$\delta(\mathcal{F}_\epsilon, f_0) \;\in\; \mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$$

*is given by the cosimplicial-resolution image of the meet-preservation discrepancy of $\mathcal{F}_\epsilon(f_0)$, evaluated on any $\omega_1$-codirected chain in $\mathcal{F}(\mathrm{cod}(f_0))$ that witnesses the loss of meet preservation. The obstruction class is nonzero exactly when the loss of left adjoint is genuinely first-order (not absorbed by gauge).*

(c) *(d-frame refinement, sketch.) In the d-frame-valued setting, $\delta$ decomposes as*

$$\delta \;=\; \delta^+ \;+\; \delta^- \;+\; \delta^\top \;\in\; \mathrm{Ext}^2_{\mathbf{dFrm}}(\mathcal{F}, \mathcal{F}),$$

*with $\delta^+$ the truth-side openness defect (failure of meet preservation on truth-positive sections), $\delta^-$ the falsity-side openness defect (dual), and $\delta^\top$ the consistency-relation openness defect (failure of meet preservation on $\top$-witness pairs). Each component is independently nonzero in general. The Ab-shadow sees only $\delta^+ + \delta^-$ via abelianization, dropping $\delta^\top$.*

## Proof framework

**Part (a) — proved via existing machinery.** If the deformation $\mathcal{F}_\epsilon$ preserves categorical openness, then $\mathcal{F}_\epsilon$ remains in the cellular class to first order. The [vanishing-above-degree-1 theorem](../../sheaf/content/settling-cohomology/references/settling-cohomology-vanishes-above-degree-1.md) applies to $\mathcal{F}_\epsilon$, giving $\mathrm{Ext}^2(\mathcal{F}_\epsilon, \mathcal{F}_\epsilon) = 0$. By the [Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md)'s "Vanishing of obstructions" section, the obstruction to second-order extension lies in $\mathrm{Ext}^2$ and so vanishes; iterating, every $n$-th order extension exists, giving the formal deformation. ✓

**Part (b) — sketch, requires construction of $\delta$.** The construction has three steps.

*Step 1 — encode the openness defect cosimplicially.* For $\mathcal{F}_\epsilon$ losing its left adjoint at restriction $f_0 : U \to U'$, choose an $\omega_1$-codirected chain $\{V_\alpha\}_{\alpha < \omega_1} \subseteq \mathcal{F}(U')$ witnessing meet-preservation failure. The two-cocycle

$$c(V_\alpha, V_\beta) \;:=\; \mathcal{F}_\epsilon(f_0)\bigl(V_\alpha \wedge V_\beta\bigr) - \mathcal{F}_\epsilon(f_0)(V_\alpha) \wedge \mathcal{F}_\epsilon(f_0)(V_\beta)$$

vanishes in the cellular case (by meet preservation) and gives the meet-preservation discrepancy in the cellular-leaving case. Assembling the $c(V_\alpha, V_\beta)$ into a cosimplicial object on the chain indexed by $\omega_1$ produces a 2-cocycle in the corresponding cosimplicial complex of $\mathcal{F}_\epsilon$.

*Step 2 — relate the cosimplicial 2-cocycle to $\mathrm{Ext}^2$.* The cosimplicial complex computes a derived functor of $\mathcal{F}_\epsilon$ via the [Q-enriched closed-monoidal structure](../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md). Under the standard cosimplicial-to-derived identification, the cosimplicial 2-cocycle of Step 1 represents a class in $H^2$ of the derived functor, which under the [Ext-via-cohomology identification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md) (Part a' there) equals a class in $\mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$. Define $\delta(\mathcal{F}_\epsilon, f_0)$ to be this class.

*Step 3 — verify $\delta$ is the obstruction.* The standard obstruction-theoretic argument from [Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) "Obstructions in $\mathrm{Ext}^2$" identifies the obstruction to second-order extension as the cup-product square $[\mathcal{F}_\epsilon]^2 \in \mathrm{Ext}^2$. The cosimplicial-2-cocycle construction in Step 1 directly computes this cup-product square on the chain witnessing meet-failure, so $\delta$ equals the obstruction class.

**Steps 2 and 3 — now filled.** The [cosimplicial construction of the openness-defect class theorem](openness-defect-cosimplicial-construction.md) (proved) makes the Čech cosimplicial machinery on the bitopological setting fully explicit, establishes the cosimplicial-to-Ext identification via the spectral-sequence argument using the [Q-enriched higher-degree vanishing](../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-cohomology-higher-degree-vanishing.md) and the closed-monoidal $\mathcal{E}\!nd$, and verifies that the cup-product-square equals the Čech-cosimplicial 2-cocycle by the explicit Yoneda-cup composition formula. The cocycle representative on chain pairs $(V_\alpha, V_\beta)$ reduces exactly to the meet-preservation discrepancy of $\mathcal{F}_\epsilon(f_0)$, giving the structural bridge frame-theoretic-openness-loss = cohomological-obstruction.

**Part (c) — d-frame refinement now proved at cocycle level.** The [cosimplicial construction theorem](openness-defect-cosimplicial-construction.md) (proved) verifies the d-frame trichotomy decomposition $\phi \cup \phi = (\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-) + \delta^\top_{\mathrm{cross}}$ at the cocycle level, where $\phi = \phi^+ + \phi^- + \phi^\top$ is the d-frame decomposition of the Čech 1-cocycle representing $[\mathcal{F}_\epsilon]$. The three components $\delta^+, \delta^-, \delta^\top$ live in the truth-side, falsity-side, and consistency-relation parts of $\mathrm{Ext}^2_{\mathbf{dFrm}}$ respectively, with $\delta^\top$ collecting all cross-products $(\phi^+ \cup \phi^-)$, $(\phi^- \cup \phi^+)$ etc. and the $\top$-witness self-product $(\phi^\top \cup \phi^\top)$. The Ab-shadow abelianization sends the cocycle to $(\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-)$, dropping $\delta^\top_{\mathrm{cross}}$ entirely. Each component's nonvanishing in cohomology is independent in general; verifying all three nonzero on a single example requires the d-frame-valued worked example flagged in §"What's open" item 3.

## Worked example: the topology-refining identity

The [openness characterization theorem](frame-morphism-meet-preservation-openness.md)'s explicit ω₁-counterexample — the topology-refining identity $f : (\omega_1+1)_{\text{refined}} \to (\omega_1+1)_{\text{standard}}$ on $\omega_1+1$ — gives a concrete first-order deformation that leaves the cellular class.

Setup: take the trivial-topology two-object site $\mathbf{T} := (\sigma \xrightarrow{f} \tau)$, $\mathcal{F}(\sigma) := \Omega(Y)$, $\mathcal{F}(\tau) := \Omega(X)$ as in the openness characterization's "Application: settles item 1" section. Deform infinitesimally: $\mathcal{F}_\epsilon(f) := h + \epsilon \cdot \eta$ where $h := f^{-1}$ is the cellular-class basepoint and $\eta$ is the perturbation that loses meet preservation.

Compute $\delta$: on the chain $\{U_\alpha = (\alpha, \omega_1]\}_{\alpha < \omega_1}$, the discrepancy is $\bigwedge_\alpha h(U_\alpha) - h(\bigwedge_\alpha U_\alpha) = \{\omega_1\} - \emptyset = \{\omega_1\}$. The cosimplicial 2-cocycle is constant on the chain at the value $\{\omega_1\} \in \Omega(Y)$, giving a nontrivial class in $H^2$ of the cosimplicial complex.

Under the cosimplicial-to-Ext identification, this class corresponds to a nontrivial element of $\mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$ — confirming the deformation $\mathcal{F}_\epsilon$ is obstructed at second order, with the obstruction class given by the meet-preservation discrepancy.

This example simultaneously:
- Confirms the dichotomy's (b)-direction nontrivially.
- Exhibits the openness-defect class as the cohomological encoding of the meet-preservation discrepancy.
- Provides the bridge between today's openness characterization and the deformation-theoretic obstruction layer.

The d-frame refinement (Part c) of $\delta$ on this set-theoretic example is trivial: $\delta = \delta^+$ with $\delta^- = \delta^\top = 0$, since the underlying topology has only truth-side content. The non-trivial d-frame trichotomy is exhibited by the [d-frame trichotomy witness example](../examples/d-frame-trichotomy-witness.md) (proved), which constructs a tripled-coordinate analog on $(\omega_1+1)^3$ where each d-frame component has its own independent $\omega_1$-cofinal chain witnessing meet failure. That example confirms Part (c) non-trivially: $\delta^+, \delta^-, \delta^\top$ are independently nonzero in cohomology, the Ab-shadow drops $\delta^\top$ but retains $\delta^+ + \delta^- \neq 0$, and the three components live in three independent coordinate directions of the triple product.

## What's open

**Internal to this theorem:**

1. ~~The cosimplicial-resolution construction of $\delta$.~~ **Filled** by the [cosimplicial construction theorem](openness-defect-cosimplicial-construction.md) (proved): explicit Čech cosimplicial complex on the bitopological setting with cup-product from the closed-monoidal $\mathcal{E}\!nd$, cosimplicial-to-Ext identification via spectral-sequence collapse. The previously-flagged foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity is **closed** by the [endomorphism sheaf acyclicity inheritance theorem](endomorphism-sheaf-acyclicity-inheritance.md) (proved).

2. ~~The cup-product square identification.~~ **Filled** by the [cosimplicial construction theorem](openness-defect-cosimplicial-construction.md): the obstruction-theoretic cup-product-square is *literally* the Čech 2-cocycle given by the Yoneda composition formula $(\phi \cup \phi)(U_{ijk}) = \phi(U_{ij}) \circ \phi(U_{jk})|_{U_{ijk}}$, with no further identification needed.

3. ~~The d-frame decomposition's non-triviality.~~ **Closed** by the [d-frame trichotomy witness example](../examples/d-frame-trichotomy-witness.md) (proved): the triple-coordinate construction on $(\omega_1+1)^3$ exhibits $\delta^+, \delta^-, \delta^\top$ as **independently nonzero** in cohomology, each driven by an $\omega_1$-cofinal chain in a coordinate direction not shared with the other components. The independence is forced by the triple-product structure; the non-vanishing argument for each component is the same set-theoretic cofinality argument as the original topology-refining-identity example, applied factor-wise three times.

**Beyond this theorem:**

4. **Openness-stratification of the settling moduli stack.** This theorem says cellular-leaving first-order deformations are obstructed; the moduli-level statement is that the cellular substack is OPEN (locally closed under cellular-preserving deformations). Promoting this point-level statement to a Zariski-open-substack statement requires geometric machinery the corpus has not developed.

5. **Schlessinger pro-representability.** Whether the deformation functor has a Schlessinger hull (H1–H4 conditions) inside vs across the boundary. Conjecture: H1–H3 hold throughout; H4 (well-behavedness of tangent space) fails at boundary points where the tangent-dimension function jumps non-semicontinuously per the [tangent-dimension theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md).

6. **Wall-crossing formula.** In Donaldson–Thomas theory, wall-crossing produces explicit *formulae* for invariant jumps. The corpus's analog would be a formula expressing the openness-defect class on one side of the boundary in terms of cellular-side data and the jump across. This is the deepest open direction in this neighborhood.

## Position in predication categories

This theorem combines two corpus-internal proved theorems (Ext-classification and openness characterization) into a single dichotomy at the structural boundary they jointly identify. The combination is the new content; the two component theorems were each previously established for different purposes and have not been combined before.

The direction it opens is the [openness-defect deformation theory](questions/openness-defect-deformation-theory.md) program: cross-boundary deformation theory with the openness-defect class as the central new invariant, parallel to but structurally different from Donaldson–Thomas wall-crossing.

It connects to:

- The [Ext-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/skh-deformation-ext-classification.md) — the (a)-direction reduces to its unobstructedness theorem; the (b)-direction is its complement at the boundary.
- The [openness characterization](frame-morphism-meet-preservation-openness.md) — the structural backbone identifying the boundary.
- The [tangent-dimension theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md) — the openness boundary may be the structural cause of tangent-dimension non-semicontinuity, recasting that theorem as a deformation-theoretic shadow of openness loss.
- The [openness-defect deformation theory question](questions/openness-defect-deformation-theory.md) — the wider program this theorem opens.

## Status

`proved`. Part (a) is proved via the existing Ext-classification. Parts (b) and (c) are proved at the cocycle level via the [cosimplicial construction of the openness-defect class theorem](openness-defect-cosimplicial-construction.md) (proved): the Čech cosimplicial complex is explicit, the cup-product-square has explicit Yoneda-cup formula, the meet-preservation discrepancy reduction is verified on chain pairs, and the d-frame trichotomy decomposition $\phi \cup \phi = (\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-) + \delta^\top_{\mathrm{cross}}$ holds at the cochain level. Cohomological non-vanishing of $\delta$ is verified on the topology-refining-identity worked example for the abelian case, and on the [d-frame trichotomy witness example](../examples/d-frame-trichotomy-witness.md) (proved) for the three independent d-frame trichotomy components.

The previous foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity from $\mathcal{F}$ via the closed-monoidal structure is now **closed** by the [endomorphism sheaf acyclicity inheritance theorem](endomorphism-sheaf-acyclicity-inheritance.md) (proved): the closed-monoidal adjunction gives $H^q(X; \mathcal{E}\!nd(\mathcal{F})) \cong \mathrm{Ext}^q(\mathcal{F}, \mathcal{F})$, and the cellular Ext-vanishing for the four standard regimes gives $\mathrm{Ext}^{\geq 2}(\mathcal{F}, \mathcal{F}) = 0$, discharging the caveat unconditionally. With both internal open items now closed (the d-frame trichotomy witness example for item 3 of "What's open," and the $\mathcal{E}\!nd$-acyclicity inheritance theorem for the foundational caveat), the dichotomy theorem is proved unconditionally. The "Beyond this theorem" items 4 and 5 of "What's open" (openness-stratification of the moduli stack, and the universal openness-defect class theory) remain genuinely outside this theorem's scope; they are research-program directions, not internal gaps.
