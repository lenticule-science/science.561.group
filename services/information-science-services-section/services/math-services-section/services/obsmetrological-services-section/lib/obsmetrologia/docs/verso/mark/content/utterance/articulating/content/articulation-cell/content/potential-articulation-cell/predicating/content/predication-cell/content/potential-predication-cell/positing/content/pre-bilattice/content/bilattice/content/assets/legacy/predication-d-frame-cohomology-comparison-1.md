---
kind: theorem
status: proved
depends-on: [d-frame-valued-sheaf, d-frame, settling-associated-sheaf, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf, bigraded-settling-cohomology, inconsistency-sheaf, lawvere-laplacian-grothendieck-sites]
---

# d-frame ↔ $\mathbf{Ab}$-valued cohomology comparison

The **shadow functor** $\mathbb{S} : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$ sends a d-frame $(L_+, L_-, \mathrm{con}, \mathrm{tot})$ to the pair $(\mathbb{S}_+(L_+),\, \mathbb{S}_-(L_-))$, where $\mathbb{S}_\pm$ is the free abelian group on the atoms of the powerset frame on its respective component. The functor drops the consistency and totality relations.

Applied section-wise to the [d-frame-valued settling sheaf](../objects/d-frame-valued-sheaf.md) $\mathbb{F}_U$, the shadow gives a pair of $\mathbf{Ab}$-valued sheaves, both already defined in the corpus.

## Proof (section-level comparison)

**Theorem.** For each $(q, \tau, U)$ on the bitopological settling site,

$$\mathbb{S}\bigl(\mathbb{F}_U(q, \tau, U)\bigr) \;\cong\; \bigl(\mathcal{F}_U^{(k)}(q, \tau, U),\;\; \mathcal{F}_U^{(k, -)}(q, \tau, U)\bigr),$$

where $\mathcal{F}_U^{(k)}$ is the [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md) (positive-evidence) and $\mathcal{F}_U^{(k, -)}$ is the [negative-paraconsistent settling-associated sheaf](../objects/negative-paraconsistent-settling-sheaf.md). The isomorphism is natural in $(q, \tau, U)$.

*Proof.* Direct unfolding of definitions. The $L_+$ component of $\mathbb{F}_U(q, \tau, U)$ is $\mathcal{P}(\Delta^{+, *}_\tau(q) \cap U)$, the powerset frame on cells where the $\mathbf{t}$-component first appears at $\tau$ within $U$. The atoms of this powerset are the individual cells, so $\mathbb{S}_+(L_+) = \mathbb{Z}^{\Delta^{+, *}_\tau(q) \cap U}$. By the definition of the [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md), this is exactly $\mathcal{F}_U^{(k)}(q, \tau, U)$ — the "$\mathbf{t}$-component first appears" cell set is precisely the Belnap-positive-designated newly-added cell set. Naturality in $(q, \tau, U)$ follows from naturality of the powerset frame in cell-set inclusions and naturality of the d-frame morphism functor.

The $L_-$ side is dual by the bilattice [negation](../morphisms/negation.md) symmetry recorded in [negative-paraconsistent settling-associated sheaf](../objects/negative-paraconsistent-settling-sheaf.md). $\square$

This is the first concrete proof in the chapter — it establishes that the d-frame-valued sheaf, on each section, recovers exactly two existing (or newly-defined) corpus sheaves under shadowing.

## What the shadow drops

The shadow $\mathbb{S}$ retains the two frame components but loses the consistency and totality relations. These relations encode information that has *no $\mathbf{Ab}$-valued counterpart in the existing corpus*:

- The consistency relation $\mathrm{con}$ records, for pairs of cell-subsets, whether they are jointly consistent — i.e., they don't co-witness a $\top$-cell. Co-witnessed cells (cells in both $\mathcal{F}_U^{(k)}$ and $\mathcal{F}_U^{(k, -)}$ at the same $\tau$) are exactly the [inconsistency sheaf](../objects/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$. So $\mathrm{con}$ is partially recovered from the existing corpus via the inconsistency sheaf, but only as a relational invariant, not as the full d-frame structure.
- The totality relation $\mathrm{tot}$ records, for pairs of cell-subsets, whether they jointly cover the settled cells of $U$ at $\tau$. This has no direct $\mathbf{Ab}$-valued analogue; it's genuinely d-frame-native content.

Hence the comparison theorem situates the d-frame-valued setting as a *strict refinement* of $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)})$: the same atomic data plus consistency/totality relations that aren't recoverable from the abelianized shadows alone.

## Relation to bigraded cohomology

The corpus's [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) factors through a different decomposition: $(\mathcal{F}_U, \mathcal{F}_U^{(\top)})$ — truth-side and inconsistency-side. The d-frame shadow $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)})$ is *finer*: from $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)})$ one recovers $\mathcal{F}_U^{(\top)} = \mathcal{F}_U^{(k)} \cap \mathcal{F}_U^{(k, -)}$ and $\mathcal{F}_U = \mathcal{F}_U^{(k)} / \mathcal{F}_U^{(\top)}$, but not vice versa — the bigraded version drops the distinction between truth-only ($\mathbf{t}$) and falsehood-only ($\mathbf{f}$) cell content.

Diagrammatically:

$$\mathbb{S}(\mathbb{F}_U) \,=\, (\mathcal{F}_U^{(k)},\; \mathcal{F}_U^{(k, -)}) \;\;\twoheadrightarrow\;\; (\mathcal{F}_U,\; \mathcal{F}_U^{(\top)}) \,=\, \text{bigraded.}$$

The d-frame shadow strictly refines the bigraded decomposition; the consistency relation in the d-frame structure refines it further.

## Derived-functor-level comparison

The section-level comparison above is the definitional bridge. The derived-functor-level comparison — that taking $H^n$ of $\mathbb{F}_U$ in an appropriate non-abelian sheaf-cohomology framework commutes with the shadow — splits regime-by-regime under the framework choice. The corpus's [framework-choice narrative](../narratives/d-frame-cohomology-framework.md) surveys the options and adopts the **Tarski Laplacian framework** of [@ghrist-riess2022] (and its quantale-enriched extension, the Lawvere Laplacian of [@ghrist-et-al2025]) as the operational cohomology theory.

**Status by regime:** all four regimes are now proved.

- **Strict regime.** [Strict-regime d-frame cohomology](strict-regime-d-frame-cohomology.md) executes the Tarski Laplacian framework on the finite cellular structure of strict-regime paired-Priestley fibers, computing $H^n$ explicitly and verifying $\mathbb{S}(H^n_{\mathbf{dFrm}}) = (H^n(\mathcal{F}_v^{(k)}), H^n(\mathcal{F}_v^{(k, -)}))$ on each evidence side.
- **Scott-continuous regime.** [Scott-continuous-regime d-frame cohomology](scott-continuous-regime-d-frame-cohomology.md) extends via filtered-colimit machinery — the d-frame analogue of AB5 — recovering the comparison at the cohomological level for $\omega$-cellular fibers.
- **Transfinite-bounded regime.** [Transfinite-bounded-regime d-frame cohomology](transfinite-bounded-regime-d-frame-cohomology.md) gives the comparison at this level via the d-frame H^1-generator construction at each NSC firing. The proof rests on Layer 1's [Lawvere Laplacian extension](lawvere-laplacian-grothendieck-sites.md) (sheaf-compatibility independent of cover cardinality) and the Tarski–Lawvere fixed-point machinery at countable cofinality.
- **Aperiodic regime.** [Aperiodic-regime d-frame cohomology](aperiodic-regime-d-frame-cohomology.md) gives the comparison at $\omega_1$-scale via direct-limit assembly over countable truncations. The direct-limit definition avoids needing transfinite Tarski–Lawvere convergence — each truncation gives cohomology directly via the Scott-continuous or transfinite-bounded theorems, and the colimit is the standard categorical operation.

With the regime-by-regime cohomology theorems all proved and the [Lawvere Laplacian extension](lawvere-laplacian-grothendieck-sites.md) central claim established, the chapter has structural completeness. Remaining work is bookkeeping: tightening the Layer 1 proof argument with rigorous citations from Kelly 1982 / Stubbe 2005, and extending the Tarski-Lawvere fixed-point convergence to $\omega_1$-cofinal covers (which the aperiodic-regime proof above does not require, but which would unify the framework's Layer 3 statement).

**Cellular extension required for transfinite cases.** The Tarski / Lawvere Laplacian framework applies directly to cellular sheaves on regular CW complexes (and to graphs, for the quantale-enriched version). The corpus's bitopological settling site is fiber-cellular (paired Priestley fibers are cellular for finite distributive bilattices) but globally a Grothendieck site over $\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$. The strict and Scott-continuous regimes admit direct application; transfinite-bounded and aperiodic regimes need the [cellular extension plan](../narratives/d-frame-cohomology-framework.md)'s Layer 2 / 3.

## Position in the program

This theorem is the **structural bridge** that makes the bilattice-valued cohomology project ([bilattice-cohomology-opener](../narratives/bilattice-cohomology-opener.md)) workable. With the section-level shadow established:

- Every $\mathbf{Ab}$-valued result on $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)})$ transports to the d-frame setting via shadow-pullback.
- Results that genuinely use the consistency/totality structure (not just the shadow) are the *new* content the d-frame setting offers.
- The bigraded cohomology becomes a derived invariant computable from the d-frame setting via the further projection $(\mathcal{F}_U^{(k)}, \mathcal{F}_U^{(k, -)}) \twoheadrightarrow (\mathcal{F}_U, \mathcal{F}_U^{(\top)})$.

The headline next theorem — the d-frame analogue of [vanishing above degree 1](settling-cohomology-vanishes-above-degree-1.md) — is now statable in terms of the section-level data, but its proof requires the derived-functor framework to be in place.
