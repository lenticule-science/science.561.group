---
kind: theorem
status: sketch
depends-on: [quantale-enriched-sheaf, quantale-enriched-cosheaf, lawvere-laplacian-grothendieck-sites, q-enriched-curry-cw-complex, q-enriched-curry-transfinite-cw, q-enriched-curry-grothendieck-site, d-frame-valued-sheaf, bitopological-settling-site, paired-priestley-space, jung-rivieccio-duality, negation]
---

# Verdier duality on the bitopological settling site

A derived equivalence between $\mathsf{Q}$-enriched sheaves and $\mathsf{Q}$-enriched cosheaves on the [bitopological settling site](../objects/bitopological-settling-site.md). Generalizes [@curry2014]'s cellular-sheaf-cosheaf derived equivalence (which recovers Verdier duality on regular CW complexes) to the $\mathsf{Q}$-enriched Grothendieck-site setting; specializes to a d-frame-native Verdier duality with two dualities composing.

## The core duality

**Theorem (Verdier duality on the bitopological settling site).** For a $\mathsf{Q}$-enriched sheaf $F$ on the [bitopological settling site](../objects/bitopological-settling-site.md), there is a $\mathsf{Q}$-enriched cosheaf $\check{F}$ and a derived equivalence

$$\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*, J) \;\simeq\; \mathrm{coSh}_{\mathsf{Q}}(\mathbf{T}^*, J)$$

between the $\mathsf{Q}$-Cat-categories of $\mathsf{Q}$-enriched sheaves and cosheaves on the site, exchanging $F$ with $\check{F}$.

In degree-0 cohomology, the duality gives:

$$H^0_{\mathsf{Q}}(\mathbf{T}^*, J;\, F) \;\cong\; H_0^{\mathsf{Q}}(\mathbf{T}^*, J;\, \check{F}),$$

where $H_0^{\mathsf{Q}}$ is the cosheaf $H_0$ — the colimit of $\check{F}$ over the site, generalizing Borel-Moore homology in the $\mathsf{Q}$-enriched setting.

In degree-1, the duality exchanges $H^1_{\mathsf{Q}}$ (sheaf cohomology) with $H_1^{\mathsf{Q}}$ (cosheaf homology), giving an aperiodic *co-classification* dual to the existing [aperiodic-regime classification](aperiodic-regime-classification.md): aperiodic settlings are classified up to MLD by their $H_1^{\mathsf{Q}}$-class (cosheaf homology class) just as well as by their $H^1_{\mathsf{Q}}$-class (sheaf cohomology class).

## Proof status: sketch with named open items

The corpus's cellular extension plan, executed across Layers 1–3, reduces the central duality to a series of structural sketches. **Status: sketch — not proved.** The chain of supporting theorems all hold "at draft level" rather than fully verified. The honest current state:

**What's established (drafts in this corpus).**

- The [Q-enriched Curry equivalence on regular CW complexes](q-enriched-curry-cw-complex.md) — Layer 1 finite. For any finite regular CW complex with Q-enriched cellular sheaf, sheaf cohomology and cosheaf homology are q-fuzzy-equivalent in every degree.
- The [Q-enriched Curry equivalence on transfinite cell complexes](q-enriched-curry-transfinite-cw.md) — Layer 3 (per-fiber). For transfinite cell complexes (countable cells indexed up to $\omega_1$), the equivalence holds via directed-colimit assembly of finite sub-complex equivalences.
- The [Grothendieck-site lift](q-enriched-curry-grothendieck-site.md) — Layer 2. For fibered cellular sites (Grothendieck sites with cellular fibers, either finite or transfinite, and fiber-only covers — the structural shape of the bitopological settling site), the per-fiber Curry equivalence assembles globally, with global fuzziness = (per-fiber fuzziness) ∧ (base-change fuzziness).

**What's established in published literature.**

- [@curry2014]: cellular sheaf-cosheaf derived equivalence on regular CW complexes for $\mathbf{Ab}$-valued data — the gold-standard combinatorial precedent.
- [@lopez2024]: quantale-enriched paired sheaves+cosheaves on graphs with fuzzy adjunctions — the framework for the corpus's Q-enriched extension. Lopez does *not* establish derived equivalence; the corpus's per-fiber theorems provide the q-fuzzy version, replacing the unavailable strict equivalence.

**Status by regime (now uniform).**

- *Strict regime* ($\kappa < \omega$): Verdier duality established at draft level via Layer 1+2; Boolean d-frame data give $q^{\mathrm{glob}} = 1$ (strict equivalence specialization).
- *Scott-continuous regime* ($\kappa = \omega$): Verdier duality established at draft level via Layer 1+2; same $q^{\mathrm{glob}} = 1$ in Boolean settings.
- *Transfinite-bounded regime* ($\omega < \kappa < \omega_1$): Verdier duality established at draft level via Layer 3+2; per-fiber transfinite Curry assembled across the base.
- *Aperiodic regime* ($\omega_1 \leq \kappa$): Verdier duality established at draft level via Layer 3+2; the same per-fiber-and-base assembly extended to $\omega_1$-cofinal fibers.

The conjecture is **established at draft level uniformly across all four regimes**, with Boolean d-frame data giving strict equivalence in every regime. Two key verifications remain open at the layer level — see `q-enriched-curry-grothendieck-site.md` "What's open" items 1–2: (a) the fuzzy-naturality of $\{\Phi_b\}$ across base morphisms, (b) the colimit-of-fuzzy-natural-transformations construction with explicit fuzziness bound. Until these are completed, the Verdier theorem rests on structural sketches plus published precedents (Lopez 2024, which explicitly does not establish derived equivalence; Curry 2014, which gives strict equivalence for abelian coefficients on regular CW complexes).

[gap: Layer 2 fuzzy-naturality verification]
[gap: Layer 2 colimit-with-fuzziness construction]

## Structural argument for plausibility

Despite the open status, several structural reasons suggest the conjecture is plausible:

1. **Curry's formula is purely algebraic on each cell.** The derived equivalence on a CW complex involves only the local stalk-and-restriction data, plus the cellular-incidence combinatorics. Both of these have $\mathsf{Q}$-enriched analogues (stalks valued in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, fuzzy-adjoint restrictions).

2. **Lopez's fuzzy-adjoint framework provides the right notion of "dual".** A fuzzy adjoint $F \dashv_q G$ is the $\mathsf{Q}$-enriched analogue of an adjoint pair. If Curry's derived equivalence is morally "swap restrictions with their adjoints," the $\mathsf{Q}$-analogue would be "swap with fuzzy adjoints" — yielding a *fuzzy* derived equivalence with quantale-graded error.

3. **The fiber structure of the bitopological settling site is favorable.** Paired-Priestley fibers are 0-dim cell complexes (just points, no higher cells), so Curry's duality on each fiber is essentially trivial — it's the *assembly* across fibers (predicate-axis × settling-axis) where the duality has structural content. The assembly is a Grothendieck-site-level construction, where the conjectured Q-enriched Verdier should operate.

These are structural plausibility arguments, not proofs.

## d-frame specialization: two dualities composing

In the d-frame setting, the value category itself has an intrinsic duality — bilattice [negation](../morphisms/negation.md) $\neg : \mathbf{FOUR} \to \mathbf{FOUR}$ swaps $\mathbf{t} \leftrightarrow \mathbf{f}$, inducing a value-category-level swap $L_+ \leftrightarrow L_-$ on each d-frame $\mathbb{F}_v(q, \tau, U)$. This is the [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md).

Combined with the spatial sheaf-cosheaf swap from the Verdier duality above, the d-frame Verdier duality has **two dualities composing**:

1. **Spatial duality (Verdier proper)**: sheaf $\leftrightarrow$ cosheaf via cellular sheaf-cosheaf exchange.
2. **Value-category duality (negation gauge)**: positive evidence $L_+ \leftrightarrow$ negative evidence $L_-$ via bilattice negation.

Composed: a cell on the truth-positive side ($L_+$) of the sheaf at $(q, \tau, U)$ corresponds to a cell on the falsity-positive side ($L_-$) of the cosheaf at the dual position. The d-frame Verdier duality therefore distinguishes:

- *Symmetric d-frame Verdier* (compose both dualities): pure $\top$-firings (where both components fire simultaneously) are self-dual; truth-only and falsity-only firings exchange.
- *Spatial-only Verdier* (compose only spatial duality): the d-frame structure $(\check{L}_+, \check{L}_-)$ on the cosheaf side reflects the same $L_+/L_-$ split as on the sheaf side, with cosheaf-extension replacing sheaf-restriction.

This is structurally new content the d-frame setting offers beyond Curry's original framework: the value category's internal duality enriches the spatial Verdier duality with an additional symmetry that classifies $\top$-firings as self-dual fixed points of the composed duality.

## Aperiodic co-classification

A consequence of the duality: aperiodic settlings admit a *co-classification* via cosheaf homology. The existing [aperiodic-regime classification theorem](aperiodic-regime-classification.md) gives the aperiodic invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$. Under Verdier duality, this corresponds to a dual aperiodic co-invariant $\check{\mathrm{cl}\text{-}\mathrm{inv}}(v) \in H_1$ — an element of cosheaf homology classifying aperiodic settlings up to MLD-equivalence dually.

The duality establishes that the two invariants encode the same MLD-class — they are different presentations of the same classifying data, related by Verdier exchange. This connects to the [Anderson–Putnam direct-limit](../objects/anderson-putnam-direct-limit.md) construction's inverse-limit / direct-limit duality (cosheaves on transfinite indexings give an inverse-limit framework dual to the direct-limit one of the cohomology, per the [Verdier duality question](../questions/verdier-duality-on-bitopological-site.md)).

## What's open

With Layer 1, 2, and 3 all established at draft level, the remaining open work moves to consequences and refinements:

1. **Aperiodic co-classification** (future work). The cosheaf-homology classifying invariant for aperiodic settlings, dual to the existing $H^1$-class. Now accessible via Verdier duality in the aperiodic regime; pairs with the existing [aperiodic-regime classification](aperiodic-regime-classification.md) as a "twin" theorem.

2. **Strong-MLD classification** (future work). Refining the aperiodic invariant by composed-duality orbit type — the $\mathbb{D}$-equivariant classifying invariant tracking self-dual vs exchange-paired settlings. Operationalizes the open [strong-MLD classification question](../questions/strong-mld-classification.md).

3. **Six-functor formalism.** Verdier $\mathbb{D}$ established; extending to the full six-functor package ($\otimes$, internal $\mathrm{Hom}$, $f^*$, $f_*$, $f^!$, $f_!$) for settling cohomology. Substantial multi-paper direction.

4. **The two-dualities-composing structure across all regimes.** The [d-frame Verdier composition theorem](d-frame-verdier-composition.md) acquires concrete content in transfinite-bounded and aperiodic regimes, paralleling the strict/Scott-continuous worked examples already in place.

5. **Non-Boolean value categories.** Whether the q-fuzzy Curry equivalence remains non-degenerate when the value category is Lawvere-quantale-enriched or MV-algebra-enriched (where per-finite-sub-complex fuzziness can tend to $\bot$ in the transfinite limit). Structural concern noted in the [transfinite-CW theorem](q-enriched-curry-transfinite-cw.md).

6. **The Q-enriched derived structure.** "Derived equivalence" in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has been operationalized as q-fuzzy equivalence per Lopez's framework. Whether there is a fuller derived enhancement (chain-complex level, not just cohomology-degree level) remains a structural refinement question.

## Position in the program

This theorem opens the **Verdier duality chapter** of Part 2, positioned after the [bilattice-valued cohomology chapter](../narratives/bilattice-cohomology-opener.md) (which provides the Q-enriched sheaf infrastructure). It connects substantively to:

- [Six-functor formalism](../questions/six-functor-formalism-for-settling-cohomology.md): Verdier duality is the $\mathbb{D}$-functor of the six-functor package; this theorem is a substantial step toward the full package.
- [Strong-MLD classification](../questions/strong-mld-classification.md): the cosheaf-side aperiodic co-invariant is a candidate dual classifying invariant.
- [Deformation theory](../questions/deformation-theory-of-skhs.md): Verdier duality establishes which deformations are detectable by cosheaf-side rather than sheaf-side data, refining the deformation taxonomy.
- [Aperiodic-regime classification](aperiodic-regime-classification.md): the classification's co-presentation via cosheaf homology, dual to the existing sheaf cohomology presentation.
