---
type: narrative
status: current
discusses: [openness-boundary-deformation-dichotomy, frame-morphism-meet-preservation-openness, skh-deformation-ext-classification, settling-cohomology-vanishes-above-degree-1, tangent-dimension-constructible-non-semicontinuous]
---

# Openness-defect deformation theory: relations to prior work

The [openness-defect deformation theory question](../../learning/questions/openness-defect-deformation-theory.md) and the [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md) (sketch) open four substantive sub-directions, each sitting in a substantial published literature. None has direct precedent in the combination the corpus assembles. This narrative maps the relevant prior work, identifies what transfers, what needs adaptation, and what is genuinely new in the corpus's setting.

The four directions:

(i) **Cosimplicial construction of the obstruction class $\delta$.**
(ii) **d-frame worked example for the bilattice trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$.**
(iii) **Schlessinger pro-representability of the deformation functor across the openness boundary.**
(iv) **Wall-crossing formula relating cellular-side to non-cellular-side deformation invariants.**

This narrative is parallel in role to [cohomology relations to prior work](cohomology-relations-to-prior-work.md) (which served the same function for the cohomology layer) and to [Pisot substitutions and the corpus](pisot-substitutions-and-the-corpus.md) (which mapped the substitution-dynamics literature for the Pisot/aperiodic-regime work). Substantive literature engagement is the prerequisite for substantive new mathematics; this narrative is the engagement.

## Direction (i): cosimplicial construction of $\delta$

**Foundational reference: [@gerstenhaber1964].** Gerstenhaber's 1964 paper introduced the prototype of the entire obstruction-theoretic apparatus. For an associative algebra $A$ over a field $k$, a first-order deformation $A_\epsilon$ is classified by a 2-cocycle $\phi \in C^2(A, A)$ in Hochschild cohomology; the obstruction to extending $A_\epsilon$ to a second-order deformation $A_{\epsilon^2}$ is the **cup-product square** $[\phi \cup \phi] \in HH^3(A, A)$. The cup product is computed by Gerstenhaber's bracket, encoded in the cosimplicial structure of the Hochschild cochain complex.

The corpus's $\delta$ is the direct structural analog: a first-order deformation $\mathcal{F}_\epsilon$ classified by $[\mathcal{F}_\epsilon] \in \mathrm{Ext}^1(\mathcal{F}, \mathcal{F})$, with obstruction the cup-product square $[\mathcal{F}_\epsilon]^2 \in \mathrm{Ext}^2(\mathcal{F}, \mathcal{F})$. The cup-product structure on $\mathrm{Ext}^\bullet(\mathcal{F}, \mathcal{F})$ in the bitopological-site setting is what makes the construction tractable.

**What transfers from Gerstenhaber.** The cup-product-square = obstruction-class identification is structural and transfers verbatim. The cosimplicial machinery for computing the cup product transfers via standard Yoneda-Ext / Eilenberg-Zilber identifications.

**What needs adaptation.** Gerstenhaber works with associative algebras over fields (Hochschild). The corpus works with Q-enriched sheaves on bitopological sites. The Q-enrichment requires the cosimplicial complex to live in $\mathbf{Q\text{-}Cat}$ rather than $\mathbf{Ab}$; the bitopological structure splits the cohomology into truth-side and falsity-side parts. The cup-product structure is established at corpus level via the [Q-enriched closed-monoidal structure theorem](../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md); what needs writing is the explicit cosimplicial encoding of the meet-preservation discrepancy as the 2-cocycle representing $\delta$.

**Cosimplicial machinery references.** The Bousfield-Kan cosimplicial framework [@bousfield-kan1972] is the standard infrastructure for cosimplicial complexes over a model category. The DG-coalgebra picture of Hinich [@hinich2001] gives an alternative formulation as Maurer-Cartan elements in a DG Lie algebra controlling deformations — the natural setting for the d-frame refinement, since DG Lie algebras have natural bilattice analogs (DG d-frame Lie algebras) the corpus could develop.

**What is genuinely new.** The connection between meet-preservation defect (a frame-theoretic condition) and cup-product-square obstruction (a homological condition) is not in the literature. Meet-preservation discrepancy has been studied in pointless topology ([@picado-pultr2012]) but never as the input to an obstruction-class construction. The corpus's openness-defect class is a new kind of obstruction class arising from frame-theoretic data.

## Direction (ii): d-frame worked example

**Foundational references: [@picado-pultr2012], [@jung-moshier2006], [@jakl2018].** Picado-Pultr supplies the standard frame/locale framework with explicit treatment of meet preservation, left adjoints to frame morphisms, and open-map characterizations. Jung-Moshier and Jakl supply the d-frame algebraic axiomatization the corpus uses as its bilattice value category.

**What transfers.** The frame-theoretic side of the worked example — the meet-preservation discrepancy on the topology-refining identity on $\omega_1+1$ — is already worked out in the [frame-morphism openness characterization theorem](../../theorems/frame-morphism-meet-preservation-openness.md), which uses Picado-Pultr §IV.2 directly.

**What needs adaptation.** The d-frame analog requires a topology-refining identity between two d-frames where the refinement adds *both* truth-side and falsity-side opens, with a non-trivial consistency-relation perturbation. Standard d-frame examples in [@jung-moshier2006] and [@jakl2018] are static — they do not parameterize families of d-frames over a deformation parameter. The d-frame parameterization is corpus-specific and needs a worked example constructed from scratch.

**What is genuinely new.** Bilattice-valued deformation theory has no direct precedent. Jakl's d-frame thesis develops the d-frame setting comprehensively but does not address deformation theory. The bilattice trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$ is a corpus-internal structural prediction that no published work confirms or refutes; the worked example is the corpus's first concrete probe of it.

## Direction (iii): Schlessinger pro-representability

**Foundational reference: [@schlessinger1968].** Schlessinger's 1968 paper introduced the conditions H1-H4 for a deformation functor $F : \mathrm{Art}_k \to \mathrm{Set}$ to be pro-representable by a complete local ring:

- H1: $F$ preserves certain pullbacks of Artin rings (semi-exactness).
- H2: $F$ preserves a sharper class of pullbacks (Mittag-Leffler).
- H3: $F$ has a finite-dimensional tangent space $t_F = F(k[\epsilon]/\epsilon^2)$.
- H4: $F$ is "well-behaved" at the deformation-functor level (the technical condition for a hull to exist).

H1, H2, H3 give a *hull* (versal deformation, classifying $F$ up to non-canonical iso); H1, H2, H3, H4 give pro-representability (canonical universal deformation).

**Refinements.** [@fantechi-manetti1998] develops obstruction calculus for general deformation functors of Artin rings, separating tangent and obstruction structures; particularly relevant for the corpus's setting where obstructions are bilattice-valued. [@manetti2009] gives the modern DGLA viewpoint: a DGLA $L$ controls a deformation functor $\mathrm{Def}_L$ via Maurer-Cartan elements modulo gauge equivalence; H1-H4 and pro-representability are recast in DGLA terms (H1, H2 automatic; H3 = finite-dimensionality of $H^1(L)$; the obstruction is the bracket-square $[x, x]$ in $H^2(L)$). [@hartshorne2010] supplies a textbook treatment with worked examples (deformations of subschemes, vector bundles, modules).

**What transfers.** The Schlessinger conditions transfer verbatim to the corpus's setting: $\mathrm{Def}(\mathcal{F})$ is a functor from Artin rings (or the appropriate Artin enrichment in the d-frame setting) to a value category, and H1-H4 can be checked formally.

**What needs adaptation.** The d-frame setting requires Schlessinger's conditions to be reformulated for d-frame-valued functors $\mathrm{Def}^{\mathbb{D}} : \mathrm{Art}^{\mathbb{D}}_k \to \mathrm{Bilattice}$. What "Artin ring" means in the d-frame setting (perhaps: a complete local d-frame algebra with maximal ideal whose powers stabilize) is not standard and needs corpus development. The DGLA viewpoint extends to a d-frame DG Lie algebra viewpoint that mirrors Manetti's framework.

**What is genuinely new.** The corpus's prediction is that H4 fails at boundary points of the openness stratification, with the failure detected by the tangent-dimension non-semicontinuity established in [tangent-dimension constructible-non-semicontinuous](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tangent-dimension-constructible-non-semicontinuous.md). Schlessinger-style pro-representability failures are rare in classical literature; the corpus's openness boundary supplies a structurally explicit class of them. This is genuinely new content.

## Direction (iv): wall-crossing

**Foundational reference: [@bridgeland2007].** Bridgeland's 2007 paper introduced **stability conditions** on triangulated categories: a stability condition is a pair $(Z, \mathcal{P})$ with $Z$ a central charge and $\mathcal{P}$ a slicing, parameterizing semistable objects. The space $\mathrm{Stab}(\mathcal{D})$ of stability conditions has a complex-manifold structure; **walls** are codimension-one strata where the stability of some object changes.

**Wall-crossing formulae.** [@joyce-song2012] developed generalized Donaldson-Thomas invariants $\overline{\mathrm{DT}}^\alpha(\tau) \in \mathbb{Q}$ for a Calabi-Yau 3-fold $X$, a class $\alpha \in K_0(\mathcal{D})$, and a stability condition $\tau$, with explicit *wall-crossing formulae* expressing $\overline{\mathrm{DT}}^\alpha(\tau_+) - \overline{\mathrm{DT}}^\alpha(\tau_-)$ as a sum over multi-decompositions of $\alpha$ into pieces destabilized at the wall. [@kontsevich-soibelman2008] developed an alternative framework using motivic Donaldson-Thomas invariants and cluster transformations, with wall-crossing realized as conjugation by a generating product of explicit transformations in a Hall-algebra-style group.

**What transfers.** The structural template — moduli stratifies by stability type, deformations crossing walls produce specific invariants jumping by formulae — transfers cleanly to the corpus's setting. Categorical openness plays the role of stability; the openness stratum of cellular sheaves plays the role of stable objects; cellular-leaving deformations play the role of wall-crossings.

**What needs adaptation.** Bridgeland-Joyce-Song works in derived categories of coherent sheaves on smooth projective varieties. The corpus works in d-frame-valued sheaves on bitopological settling sites — a different ambient setting. The central charge $Z$ has no direct corpus analog (no obvious complex-valued group homomorphism on a $K_0$); a corpus analog would need to be constructed, perhaps via the bilattice-valued cohomology giving a $\mathrm{Bilattice}$-valued central charge function with truth-side and falsity-side components.

**What is genuinely new.** A wall-crossing formula for the openness-defect class would express the invariant on the cellular side in terms of the obstruction at the boundary. No such formula exists in the literature for openness-stratified moduli — the entire wall-crossing literature has stability conditions as the primary stratification, not openness. The corpus's openness wall-crossing is structurally analogous but technically distinct, and the formulae would be the deepest payoff of the openness-defect program.

The d-frame trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$ also has no direct precedent: classical wall-crossing formulae are scalar-valued (in $\mathbb{Q}$ or $\mathbb{Z}$); a bilattice-valued wall-crossing formula with truth-side, falsity-side, and consistency-relation parts is structurally novel.

## Synthesis

**What classical deformation theory supplies:** the structural template (cup-product square obstruction; Schlessinger pro-representability; DGLA viewpoint), the standard cosimplicial machinery (Bousfield-Kan), and the wall-crossing template (stratified moduli with cohomological invariants jumping at walls).

**What classical d-frame theory supplies:** the algebraic axiomatization of bilattice value categories ([@jung-moshier2006], [@jakl2018]), the frame-theoretic openness characterization ([@picado-pultr2012]), and the bitopological-site infrastructure.

**What is corpus-internal and genuinely new:**

- The combination: frame-theoretic openness condition feeding into cup-product-square obstruction theory has no direct precedent.
- The bilattice trichotomy of obstruction classes ($\delta^+$, $\delta^-$, $\delta^\top$) has no precedent in either classical deformation theory or d-frame theory.
- The Schlessinger H4 failure mechanism — driven by openness-stratified tangent-dimension non-semicontinuity — has no precedent.
- The openness wall-crossing formula direction has no precedent (wall-crossing is exclusively stability-condition-based in published work).

The novel mathematical content is the assembly of these classical pieces onto the corpus's specific structural object (Q-enriched sheaves on the bitopological settling site, with the openness characterization as the structural boundary). Each individual move sits in a literature; the assembly does not.

## Recommended reading order

For pushing direction (i) to proved status:

1. [@gerstenhaber1964] §§1-3 (cup-product-square obstruction in the prototype Hochschild setting).
2. [@bousfield-kan1972] chapters I-II (cosimplicial machinery).
3. [@hinich2001] (DG coalgebra / Maurer-Cartan reformulation, useful for the d-frame extension).

For direction (iii):

1. [@schlessinger1968] §§1-3 (foundational H1-H4 conditions).
2. [@hartshorne2010] chapters 14-16 (textbook treatment with worked examples).
3. [@manetti2009] §§1-4 (DGLA viewpoint, modern formulation).
4. [@fantechi-manetti1998] (obstruction calculus refinement).

For direction (iv):

1. [@bridgeland2007] §§1-4 (stability conditions on triangulated categories).
2. [@joyce-song2012] chapters 1-3 (generalized DT invariants and wall-crossing formulae).
3. [@kontsevich-soibelman2008] §§1-3 (motivic alternative framework).

For direction (ii) the existing corpus references suffice; the worked example is corpus-internal construction work, not a literature-engagement task.

## Position in the program

This narrative supplies the literature-review foundation for the [openness-defect deformation theory question](../../learning/questions/openness-defect-deformation-theory.md). It sits parallel to [cohomology relations to prior work](cohomology-relations-to-prior-work.md) — which served the same role for the cohomology layer — and to [Pisot substitutions and the corpus](pisot-substitutions-and-the-corpus.md) — which mapped the substitution-dynamics literature for the Pisot/aperiodic-regime work.

The literature engagement is real: the corpus's openness-defect direction borrows substantially from each of the four cited literatures, and the borrowed apparatus is what makes the corpus's novel content tractable. The novelty is the assembly, not the components.

## Progress

**Direction (i) — first technical theorem in place.** The [cosimplicial construction of the openness-defect class theorem](../../theorems/openness-defect-cosimplicial-construction.md) (proved) makes the Čech cosimplicial complex on the bitopological settling site fully explicit, establishes the cosimplicial-to-Ext identification via spectral-sequence collapse, gives the explicit Yoneda-cup formula for the cup-product-square cocycle, identifies the cocycle on chain pairs as the meet-preservation discrepancy of the lost-adjoint restriction, and proves the d-frame trichotomy decomposition $\phi \cup \phi = (\phi^+ \cup \phi^+) + (\phi^- \cup \phi^-) + \delta^\top_{\mathrm{cross}}$ at cocycle level. The construction is the direct transposition of [@gerstenhaber1964]'s Hochschild cup-product-square to the Čech cosimplicial setting on the bitopological site, with cup product supplied by the [Q-enriched closed-monoidal structure](../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md) via composition on the endomorphism sheaf $\mathcal{E}\!nd(\mathcal{F})$.

The structural payoff: frame-theoretic openness loss (the meet-preservation discrepancy) is *literally* the cohomological obstruction (the Čech cup-product-square cocycle), with no intermediate identification needed. The two distinct mathematical languages — pointless topology and homological algebra — collapse to the same explicit formula on chains. This bridge has no precedent in the literature; it is the genuine novelty direction (i) supplies, beyond Gerstenhaber's structural template.

The [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md)'s Steps 2 and 3 of its Part (b) proof framework are now filled at cocycle level; the dichotomy's overall status remains sketch pending two named items (the foundational caveat about $\mathcal{E}\!nd$ acyclicity, and the d-frame-trichotomy independent-non-vanishing example).

## Direction (ii) — also delivered

**Direction (ii) — concrete-grounding witness in place.** The [d-frame trichotomy witness example](../../examples/d-frame-trichotomy-witness.md) (proved) exhibits a d-frame-valued cellular-leaving deformation on the tripled-coordinate space $(\omega_1+1)^3$ whose openness-defect class has all three trichotomy components $\delta^+, \delta^-, \delta^\top$ **independently nonzero in cohomology**. The construction uses three independent $\omega_1$-cofinal chains, one per coordinate direction, each driving its respective d-frame component via the same set-theoretic cofinality argument that established non-vanishing in the original topology-refining-identity example. Independence of the three non-vanishing arguments is forced by the disjointness of the three coordinate chains in the triple product.

The example confirms three structural claims at the cohomology level:

- The trichotomy decomposition is **observably non-trivial** — not merely a formal cocycle-level decomposition but a feature exhibitable on an explicit example.
- The Ab-shadow drops $\delta^\top$ but retains $\delta^+ + \delta^- \neq 0$ — confirming that the d-frame refinement is genuinely strictly finer than the abelian one, with the difference observable on $\delta$.
- The three components live in three **independent** coordinate directions, not in a single combined direction — the triple-product geometry forces independence rather than imposes a structural cancellation.

This closes the second open item of the [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md) and the concrete-grounding caveat of the [cosimplicial construction theorem](../../theorems/openness-defect-cosimplicial-construction.md). The dichotomy theorem's only remaining open item is the foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity — a separate sub-theorem candidate, not specific to this program.

## Foundational caveat — also closed

The third item of the previous "Remaining concrete moves" list — the foundational caveat about $\mathcal{E}\!nd(\mathcal{F})$ inheriting acyclicity via the closed-monoidal structure — is now **closed** by the [endomorphism sheaf acyclicity inheritance theorem](../../theorems/endomorphism-sheaf-acyclicity-inheritance.md) (proved). The argument is a direct application of the closed-monoidal adjunction $\mathrm{Hom}(\mathbf{1}_J, \mathcal{H}om(\mathcal{F}, \mathcal{F})) \cong \mathrm{Hom}(\mathbf{1}_J \otimes \mathcal{F}, \mathcal{F}) = \mathrm{Hom}(\mathcal{F}, \mathcal{F})$ in derived form, giving $H^q(X; \mathcal{E}\!nd(\mathcal{F})) \cong \mathrm{Ext}^q(\mathcal{F}, \mathcal{F})$, plus the cellular Ext-vanishing for the four standard regimes from the SKH Ext-classification, giving $\mathrm{Ext}^{\geq 2} = 0$ on cellular $\mathcal{F}$. Hence $H^{\geq 2}(X; \mathcal{E}\!nd(\mathcal{F})) = 0$ — verified rather than asserted.

Two consequences:

1. The [cosimplicial construction theorem](../../theorems/openness-defect-cosimplicial-construction.md) is upgraded from "proved with named caveat" to **proved unconditionally**.

2. The [openness-boundary deformation dichotomy theorem](../../theorems/openness-boundary-deformation-dichotomy.md) is promoted from `sketch` to **`proved`** — both its internal open items (the d-frame-trichotomy non-triviality and the $\mathcal{E}\!nd$-acyclicity caveat) are now closed.

The openness-defect deformation theory program is now structurally complete at its first internal milestone: the dichotomy theorem and its supporting cosimplicial-construction theorem are both proved, with the d-frame trichotomy non-trivially exhibited on a concrete example. The remaining moves are research-program directions (Schlessinger pro-representability, wall-crossing) rather than internal gaps.

## Remaining substantive moves

With directions (i), (ii), and the foundational caveat all closed, the remaining substantive moves are research-program-scale rather than internal-fill-in:

1. **Direction (iii) — Schlessinger pro-representability.** Check H1-H3 for the corpus's deformation functor inside the cellular class as a first pass; pro-representability inside the class is the warm-up before attacking H4 failure at the boundary, which is where the corpus's structurally explicit pro-representability-failure prediction lies.

2. **Direction (iv) — wall-crossing.** Construct a corpus-internal central-charge analog — a bilattice-valued homomorphism on the corpus's appropriate $K_0$ — providing the parameter space in which walls (= openness-loss loci) live. The structural prerequisite for any wall-crossing formula in the corpus's setting.

These two moves are genuinely independent and can be pursued in any order. Direction (iii) is the closest to existing corpus machinery (the SKH Ext-classification supplies most of the H1-H3 verification framework) and is single-session-tractable for H1-H3 inside the cellular class. Direction (iv) is research-program-scale, the deepest and most novel of the remaining moves, since the corpus's openness-defect class plays a structurally distinct role from Donaldson-Thomas wall-crossing invariants — central charges in $\mathbf{C}$ versus bilattice-valued homomorphisms in d-frames.

A natural pacing: pursue direction (iii) next under the "slowly through good study" pacing, since H1-H3 inside the cellular class is single-session-tractable and supplies the warm-up for H4-at-the-boundary, where the corpus's distinctive content lies. Direction (iv) follows naturally once the deformation functor's pro-representability-failure is structurally identified.
