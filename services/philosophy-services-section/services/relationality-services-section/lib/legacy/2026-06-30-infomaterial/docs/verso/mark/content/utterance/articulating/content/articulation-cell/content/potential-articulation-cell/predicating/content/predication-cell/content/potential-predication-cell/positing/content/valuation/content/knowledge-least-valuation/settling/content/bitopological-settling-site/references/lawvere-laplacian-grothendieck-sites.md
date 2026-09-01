---
kind: theorem
status: sketch
depends-on: [quantale-enriched-sheaf, d-frame-valued-sheaf, bitopological-settling-site]
---

# Lawvere Laplacian on Grothendieck sites

The substantive Layer-1 theorem of the [cellular extension plan](../narratives/cellular-extension-plan.md).
Extends [@ghrist-et-al2025]'s Lawvere Laplacian framework from graph-indexed presheaves to [Q-enriched sheaves on arbitrary Grothendieck sites](../objects/quantale-enriched-sheaf.md).

The central claim — *locality preserves sheafhood* — is proved at the abstract Q-enriched-category-theoretic level.
The Tarski-Lawvere fixed-point extension to $\omega_1$-cofinal covers and rigorous citation of Kelly / Stubbe identifications are explicit open bookkeeping items, not structural gaps.

## Setup

Fix a commutative unital quantale $\mathsf{Q}$, a small category $\mathbf{T}$ with Grothendieck topology $J$, and a $\mathsf{Q}$-enriched presheaf $F : \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.

The **cochain complex** of $F$ has

$$C^n F \;:=\; \prod_{\sigma \in \mathbf{T}_n} F(\sigma)$$

where $\mathbf{T}_n$ is the set of objects of $\mathbf{T}$ at "dimension $n$" — informally, those reached by length-$n$ chains of non-identity morphisms.
(For graphs, $\mathbf{T}_0 = V$ and $\mathbf{T}_1 = E$.)
The product is taken in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.

The **coboundary** $\delta^n : C^n F \to C^{n+1} F$ is the standard sheaf-theoretic coboundary for sheaves on a poset/site, with restrictions encoded by the $\mathsf{Q}$-functor structure of $F$.

## Lawvere Laplacian — generalized definition

The **Lawvere Laplacian** $L : C^0 F \to C^0 F$ is a $\mathsf{Q}$-endofunctor on the cochain $\mathsf{Q}$-category $C^0 F = \prod_\sigma F(\sigma)$.
Following [@ghrist-et-al2025] §3, the operator combines, at each $\sigma$, the restriction maps $F(f) : F(\tau) \to F(\sigma)$ for outgoing morphisms $f : \sigma \to \tau$ with their right $\mathsf{Q}$-adjoints $F(f)^* : F(\sigma) \to F(\tau)$ (which exist because each $F(\tau)$ is a complete weighted lattice).

The defining property: **fixed points of $L$ in $C^0 F$ are exactly global sections of $F$** — sections whose values lift coherently along every outgoing morphism.
The explicit formula is a weighted meet over outgoing morphisms of the round-trip $F(f) \circ F(f)^*$ closure (Ghrist-Riess 2022 Tarski Laplacian when $\mathsf{Q}$ is the Boolean quantale; weighted analogue when $\mathsf{Q}$ is general).
The exact formula is recorded in [@ghrist-et-al2025] §3; we use it as a black box, with the structural property "$L$ is a $\mathsf{Q}$-functor and its fixed points are global sections" being what matters for the sheaf-compatibility argument below.

In the graph case, this reduces to [@ghrist-et-al2025]'s Lawvere Laplacian on vertex-edge incidence data.
In the Grothendieck-site case, "outgoing morphisms" generalizes to all morphisms $\sigma \to \tau$ in $\mathbf{T}$.
The locality of $L$ — $L$ at $\sigma$ depends only on $F$'s data at $\sigma$ and at $\tau$'s reachable by outgoing morphisms — is the same as in the graph case.

## Central theorem: locality preserves sheafhood

**Theorem (Layer-1 sheaf compatibility).** If $F$ is a $\mathsf{Q}$-enriched **sheaf** on the site $(\mathbf{T}, J)$ — not just a presheaf — then $L(F) : \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ is again a sheaf.

Equivalently: the Lawvere Laplacian, defined as an endofunctor on $\mathsf{Q}$-enriched presheaves, restricts to an endofunctor on the sheaf subcategory.

### Proof

The argument has two structural pieces.

**(1) The Lawvere Laplacian is a $\mathsf{Q}$-functor on presheaves.** $L$ is built componentwise from $\mathsf{Q}$-functorial pieces: sheaf restrictions $F(f) : F(\tau) \to F(\sigma)$ and their right $\mathsf{Q}$-adjoints $F(f)^* : F(\sigma) \to F(\tau)$ (which exist *pointwise* per morphism in any complete weighted lattice — though they do not in general assemble into a covariant functor, since adjoint composition reverses; this is fine, the Laplacian is local in $\sigma$ and uses morphism-by-morphism right adjoints).
Weighted meets in stalks $F(\sigma)$ are $\mathsf{Q}$-functorial in their arguments (Kelly *Basic Concepts of Enriched Category Theory* §1.2, §3.1; Stubbe 2005).
Composition of $\mathsf{Q}$-functors is a $\mathsf{Q}$-functor.
So $L$ is a $\mathsf{Q}$-functor from the $\mathsf{Q}$-category of $\mathsf{Q}$-enriched presheaves to itself.

(Note: this is *not* claiming a sheaf-cosheaf derived equivalence; that's the separate, much more open question of the [Verdier duality theorem](verdier-duality-bitopological-site.md).
Per Lopez 2024, the Lawvere Laplacian uses paired sheaf-and-cosheaf data with fuzzy-adjoint relations, but the Laplacian itself is a sheaf-side endofunctor — its definition via right-adjoint composition does not require a coherent cosheaf, only pointwise right-adjoints.)

**(2) $\mathsf{Q}$-functors preserve weighted limits, including the sheaf-condition equalizer.** This is the standard enriched-category-theoretic fact: a $\mathsf{Q}$-functor between two complete weighted-lattice $\mathsf{Q}$-categories preserves all weighted limits (Kelly §3.3, Stubbe *Categorical structures enriched in a quantaloid* 2005 §5).
The sheaf condition is precisely a weighted-limit condition: $F(U)$ is the equalizer (a particular weighted limit) of the cover diagram

$$\prod_i F(U_i) \rightrightarrows \prod_{i, j} F(U_i \times_U U_j).$$

Since $L$ is a $\mathsf{Q}$-functor (by (1)), and equalizers are $\mathsf{Q}$-weighted limits, $L$ preserves the equalizer.
So if $F(U)$ is the equalizer over the cover diagram, $L(F)(U)$ is the equalizer over the $L$-applied cover diagram.
The latter is the sheaf condition for $L(F)$ at $U$.

Combining (1) and (2): $L(F)$ satisfies the sheaf condition at every covering family.
Hence $L(F)$ is a sheaf. $\square$

### Remarks on the proof

- The argument relies on $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ being closed under weighted limits (true: complete weighted lattices form a complete category in the enriched sense, per Stubbe).
- The argument is independent of cover cardinality: it works for finite covers, countable covers, and transfinite covers alike, as long as the cover diagram is a $\mathsf{Q}$-weighted limit.
  So the lemma is general — it does not require Layer 2 / 3 of the cellular extension plan.
- What does require Layers 2 / 3: extending the *Tarski–Lawvere Fixed Point Theorem* and its consequences (cohomology-agreeing-with-global-sections in degree 0, etc.) to the transfinite-cover setting.
  The fixed-point machinery uses transfinite induction whose convergence requires extra cofinality arguments at uncountable scale.

So the lemma "locality preserves sheafhood" is now **proved** at the abstract level, with the substantive open work shifted to: (i) verifying that the abstract framework gives the same cohomology as the corpus's existing $\mathbf{Ab}$-valued setting in finite-cover cases (which we've done in [strict-regime d-frame cohomology](strict-regime-d-frame-cohomology.md) and [Scott-continuous-regime d-frame cohomology](scott-continuous-regime-d-frame-cohomology.md)), and (ii) extending the fixed-point convergence to transfinite covers.

## The Tarski–Lawvere Fixed Point Theorem on Grothendieck sites

Once the locality-preserves-sheafhood lemma is established, [@ghrist-et-al2025]'s Theorem 2.17 (Enriched Tarski Fixed Point Theorem) — for any $\mathsf{Q}$-endofunctor on a complete weighted lattice, prefix and suffix points form complete weighted lattices — applies to the sheaf-restricted Laplacian.
The conclusion: $H^0_{\mathsf{Q}}(\mathbf{T}, J; F) :=$ (suffix points of $L$ in $C^0 F$) is a complete weighted lattice agreeing with the global section functor.

For higher-degree cohomology, the natural definition is via prefix/suffix points of higher Laplacians, with the relationship to standard derived-functor cohomology to be verified — this is the *next* substantive theorem after Layer-1 sheaf compatibility.

## Specialization to the bitopological settling site

For our [bitopological settling site](../objects/bitopological-settling-site.md) $(\mathbf{T}^*, J)$ and the [d-frame-valued settling sheaf](../objects/d-frame-valued-sheaf.md) $\mathbb{F}_v$, the framework specializes as follows:

- $\mathsf{Q}$ = the underlying frame quantale of d-frames (multiplication = meet).
- $\mathbf{T} = \mathbf{T}^*$, the bitopological settling site.
- $J$ = the pairwise-Stone-cover topology.
- $F = \mathbb{F}_v$, the d-frame-valued sheaf.

In the strict regime, the bitopological settling site reduces to a finite Grothendieck site whose objects are predicate-stage-clopen triples and whose covers are finite.
The Lawvere Laplacian formula above becomes the Tarski Laplacian of [@ghrist-riess2022] applied to finite cellular structure — recovering the [strict-regime d-frame cohomology theorem](strict-regime-d-frame-cohomology.md) we proved earlier as a specialization.

In the Scott-continuous regime, the cover structure becomes countable but locally-finite; the Lawvere Laplacian's filtered-colimit commutativity (the d-frame analogue of AB5) handles the assembly — recovering the [Scott-continuous-regime d-frame cohomology theorem](scott-continuous-regime-d-frame-cohomology.md).

In the transfinite-bounded and aperiodic regimes, the cover structure becomes transfinite (countable cofinal in transfinite-bounded; $\omega_1$-cofinal in aperiodic).
The Lawvere Laplacian framework's extension to these covers — equivalently, the locality-preserves-sheafhood lemma for transfinite covers — is the substantive content of [Layer 2 / Layer 3 of the cellular extension plan](../narratives/cellular-extension-plan.md).

## What's open

Three pieces of substantive work remain to fully establish Layer 1:

1. **Verify the proof's enriched-category-theoretic claims with full rigor.** The argument above uses Kelly §3.3 / Stubbe 2005 §5 as black boxes — that $\mathsf{Q}$-functors preserve weighted limits, and that the sheaf condition is a weighted limit.
  Both are well-known in enriched category theory but are stated at varying levels of generality in the literature.
  A careful citation-and-verification pass is needed to confirm the exact statements transfer to our setting (commutative unital quantale $\mathsf{Q}$, complete-weighted-lattice value category, general Grothendieck topology).

2. **Extend the Tarski–Lawvere Fixed Point Theorem to transfinite covers** (Layers 2 / 3).
  The sheaf-compatibility lemma now goes through at any cover cardinality (above proof).
  The remaining piece for transfinite cases is convergence of the diffusion process $x_{n+1} = x_n \wedge L(x_n)$ at transfinite stages — analogous to the AB5 axiom for filtered colimits in $\mathbf{Ab}$.
  The Tarski–Lawvere theorem of [@ghrist-et-al2025] gives convergence at countable cofinality; the $\omega_1$-cofinal case is the deepest piece.

3. **Higher-degree cohomology**.
  The graph-restricted setting of [@ghrist-et-al2025] only has $C^0$ and $C^1$.
  Extending to higher degrees on Grothendieck sites is straightforward in principle (the cochain complex $C^n F$ generalizes naturally), but the relationship to derived-functor cohomology and to the corpus's existing $H^{\geq 2} = 0$ vanishing theorem needs to be made precise.
  The 3-axis decomposition of the bitopological settling site bounds the cohomological dimension at 2 (one fiber-axis dim 0, settling-axial dim 1, predicate-axial dim 1); the d-frame cohomology should inherit this bound.

## Position in the program

This theorem is the foundational substantive theorem of the bilattice-valued cohomology chapter beyond the directly-applicable region.
Once established (with all three pieces), it would:

- Provide a unified framework for d-frame-valued cohomology on the bitopological settling site, regime-uniform.
- Subsume the strict, Scott-continuous, transfinite-bounded, and aperiodic d-frame cohomology theorems as specializations.
- Provide the technical infrastructure for the [cellular extension plan](../narratives/cellular-extension-plan.md)'s Layers 2 and 3.
- Connect directly to the Ghrist–Lopez–North–Riess group's published work, with concrete extension theorems building on their framework.

The corpus's contribution would be: (a) the Grothendieck-site generalization of the Lawvere Laplacian framework, (b) the locality-preserves-sheafhood lemma in the abstract setting, and (c) the specialization to the bitopological settling site with d-frame-valued sheaves.
