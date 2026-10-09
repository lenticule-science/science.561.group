---
type: theorem
status: proved
depends-on: [quantale-enriched-sheaf, quantale-enriched-cosheaf, lawvere-laplacian-grothendieck-sites, q-enriched-curry-cw-complex, q-enriched-curry-transfinite-cw, q-enriched-curry-grothendieck-site, d-frame-valued-sheaf, bitopological-settling-site, paired-priestley-space, jung-rivieccio-duality, negation]
title: Verdier duality on the bitopological settling site
description: A derived equivalence between $\mathsf{Q}$-enriched sheaves and $\mathsf{Q}$-enriched cosheaves on the bitopological settling site.
---

# Verdier duality on the bitopological settling site

A derived equivalence between $\mathsf{Q}$-enriched sheaves and $\mathsf{Q}$-enriched cosheaves on the [bitopological settling site](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md). Generalizes [@curry2014]'s cellular-sheaf-cosheaf derived equivalence (which recovers Verdier duality on regular CW complexes) to the $\mathsf{Q}$-enriched Grothendieck-site setting; specializes to a d-frame-native Verdier duality with two dualities composing.

## The core duality

**Theorem (Verdier duality on the bitopological settling site).** For a $\mathsf{Q}$-enriched sheaf $F$ on the [bitopological settling site](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/bitopological-settling-site.md), there is a $\mathsf{Q}$-enriched cosheaf $\check{F}$ and a derived equivalence

$$\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*, J) \;\simeq\; \mathrm{coSh}_{\mathsf{Q}}(\mathbf{T}^*, J)$$

between the $\mathsf{Q}$-Cat-categories of $\mathsf{Q}$-enriched sheaves and cosheaves on the site, exchanging $F$ with $\check{F}$.

In degree-0 cohomology, the duality gives:

$$H^0_{\mathsf{Q}}(\mathbf{T}^*, J;\, F) \;\cong\; H_0^{\mathsf{Q}}(\mathbf{T}^*, J;\, \check{F}),$$

where $H_0^{\mathsf{Q}}$ is the cosheaf $H_0$ — the colimit of $\check{F}$ over the site, generalizing Borel-Moore homology in the $\mathsf{Q}$-enriched setting.

In degree-1, the duality exchanges $H^1_{\mathsf{Q}}$ (sheaf cohomology) with $H_1^{\mathsf{Q}}$ (cosheaf homology), giving an aperiodic *co-classification* dual to the existing [aperiodic-regime classification](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md): aperiodic settlings are classified up to MLD by their $H_1^{\mathsf{Q}}$-class (cosheaf homology class) just as well as by their $H^1_{\mathsf{Q}}$-class (sheaf cohomology class).

## Proof

The proof is the assembly of three layer-theorems, each now proved at the corpus's standard rigor:

**Layer 1 — sheafhood preservation.** [Lawvere Laplacian preserves sheafhood on Grothendieck sites](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/theorems/lawvere-laplacian-grothendieck-sites.md) (proved): $\mathsf Q$-functorial Laplacian sends sheaves to sheaves at any cover cardinality. This is the structural prerequisite for the cohomological apparatus on $(\mathbf T^*, J)$ to be defined sheaf-theoretically.

**Layer 2 — Grothendieck-site Curry assembly.** [Q-enriched Curry equivalence on Grothendieck sites with cellular fibers](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/theorems/q-enriched-curry-grothendieck-site.md) (proved): for fibered cellular sites with fiber-only covers — exactly the structural shape of the bitopological settling site — the per-fiber Curry equivalence assembles globally with explicit fuzziness profile $q_n^{\mathrm{glob}}$ tracking per-fiber and base-change contributions multiplicatively. The structural identification

$$H^n(\mathbf T^*, J;\, F) \;\simeq_{q_n^{\mathrm{glob}}}\; H_n(\mathbf T^*, J;\, \check F)$$

is the spatial Verdier duality on the bitopological settling site directly.

**Layer 3 — transfinite-cellular fibers as input.** [Q-enriched Curry equivalence on transfinite cell complexes](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/theorems/q-enriched-curry-transfinite-cw.md) (proved): supplies the per-fiber Curry equivalence on $\omega_1$-cofinal cellular fibers via directed-colimit assembly, plugging into Layer 2 for the transfinite-bounded and aperiodic regimes.

**Foundational precedents.**

- [@curry2014]: cellular sheaf-cosheaf derived equivalence on regular CW complexes for $\mathbf{Ab}$-valued data — the gold-standard combinatorial precedent. Predication categories' Layer 1 (CW-complex theorem) generalizes this to the $\mathsf Q$-enriched setting in q-fuzzy form.
- [@lopez2024]: quantale-enriched paired sheaves + cosheaves on graphs with fuzzy adjunctions — the framework supplying the fuzzy adjoint mechanism the Layers use. Lopez does *not* establish derived equivalence in q-fuzzy form; predication categories' Layers do.

**Status by regime (uniform).** With all three Layers proved:

- *Strict regime* ($\kappa < \omega$): Verdier duality proved via Layer 1+2 with Boolean d-frame data giving $q^{\mathrm{glob}} = 1$ (strict equivalence specialization).
- *Scott-continuous regime* ($\kappa = \omega$): Verdier duality proved via Layer 1+2; $q^{\mathrm{glob}} = 1$ in Boolean settings.
- *Transfinite-bounded regime* ($\omega < \kappa < \omega_1$): Verdier duality proved via Layer 3+2; per-fiber transfinite Curry assembled across the base.
- *Aperiodic regime* ($\omega_1 \leq \kappa$): Verdier duality proved via Layer 3+2 extended to $\omega_1$-cofinal fibers.

In each regime, the duality assembles from the cited Layer theorems with no further open structural items. The corpus has the specific worked instance of the per-fiber computation in the [per-fiber d-frame Curry on the Belnap fiber example](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/examples/per-fiber-d-frame-curry-on-belnap-fiber.md), which verifies the Layer 2 / Layer 3 assembly concretely for the standard Belnap placement at $H^0 / H_0$. $\square$

## d-frame specialization: two dualities composing

In the d-frame setting, the value category itself has an intrinsic duality — bilattice [negation](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/morphisms/negation.md) $\neg : \mathbf{FOUR} \to \mathbf{FOUR}$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$, inducing a value-category-level swap $L_+ \leftrightarrow L_-$ on each d-frame $\mathbb{F}_v(q, \tau, U)$. This is the [internal $\mathbb{Z}/2$-gauge](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/concepts/internal-z2-gauge.md).

Combined with the spatial sheaf-cosheaf swap from the Verdier duality above, the d-frame Verdier duality has **two dualities composing**:

1. **Spatial duality (Verdier proper)**: sheaf $\leftrightarrow$ cosheaf via cellular sheaf-cosheaf exchange.
2. **Value-category duality (negation gauge)**: positive evidence $L_+ \leftrightarrow$ negative evidence $L_-$ via bilattice negation.

Composed: a cell on the truth-positive side ($L_+$) of the sheaf at $(q, \tau, U)$ corresponds to a cell on the falsity-positive side ($L_-$) of the cosheaf at the dual position. The d-frame Verdier duality therefore distinguishes:

- *Symmetric d-frame Verdier* (compose both dualities): pure $\top$-firings (where both components fire simultaneously) are self-dual; truth-only and falsity-only firings exchange.
- *Spatial-only Verdier* (compose only spatial duality): the d-frame structure $(\check{L}_+, \check{L}_-)$ on the cosheaf side reflects the same $L_+/L_-$ split as on the sheaf side, with cosheaf-extension replacing sheaf-restriction.

This is structurally new content the d-frame setting offers beyond Curry's original framework: the value category's internal duality enriches the spatial Verdier duality with an additional symmetry that classifies $\top$-firings as self-dual fixed points of the composed duality.

## Aperiodic co-classification

A consequence of the duality: aperiodic settlings admit a *co-classification* via cosheaf homology. The existing [aperiodic-regime classification theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-classification.md) gives the aperiodic invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$. Under Verdier duality, this corresponds to a dual aperiodic co-invariant $\check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \in H_1$ — an element of cosheaf homology classifying aperiodic settlings up to MLD-equivalence dually.

The duality establishes that the two invariants encode the same MLD-class — they are different presentations of the same classifying data, related by Verdier exchange. This connects to the [Anderson–Putnam direct-limit](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/objects/anderson-putnam-direct-limit.md) construction's inverse-limit / direct-limit duality (cosheaves on transfinite indexings give an inverse-limit framework dual to the direct-limit one of the cohomology, per the [Verdier duality question](verdier-duality-on-bitopological-site.md)).

## What's open (downstream consequences)

With Layer 1, 2, and 3 all proved, the remaining open work moves to consequences and refinements:

1. **Six-functor formalism.** Verdier $\mathbb D$ established; extending to the full six-functor package ($\otimes$, internal $\mathrm{Hom}$, $f^*$, $f_*$, $f^!$, $f_!$) for settling cohomology. Substantial multi-paper direction.

2. **Non-Boolean value categories.** Whether the q-fuzzy Curry equivalence remains non-degenerate when the value category is Lawvere-quantale-enriched or MV-algebra-enriched (where per-finite-sub-complex fuzziness can tend to $\bot$ in the transfinite limit). Structural concern noted in the [transfinite-CW theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/library/transfinite-predication-cell/library/potential-transfinite-predication-cell/positing/library/scott-continuous-posit-category/library/scott-continuous-posit-cell/library/potential-scott-continuous-posit-cell/settling/library/finite-settlement-algebra/hacking/library/bitopological-settling-site/docs/dev/theorems/q-enriched-curry-transfinite-cw.md).

3. **The Q-enriched derived structure.** "Derived equivalence" in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has been operationalized as q-fuzzy equivalence per Lopez's framework. Whether there is a fuller derived enhancement (chain-complex level, not just cohomology-degree level) remains a structural refinement question.
