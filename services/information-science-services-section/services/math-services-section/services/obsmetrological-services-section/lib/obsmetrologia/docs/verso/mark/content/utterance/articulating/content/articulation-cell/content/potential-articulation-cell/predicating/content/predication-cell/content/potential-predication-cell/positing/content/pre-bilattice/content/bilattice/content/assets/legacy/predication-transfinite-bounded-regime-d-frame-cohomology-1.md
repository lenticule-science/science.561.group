---
kind: theorem
status: sketch
depends-on: [d-frame-valued-sheaf, d-frame-cohomology-comparison, scott-continuous-regime-d-frame-cohomology, transfinite-bounded-regime-h1-generators, non-scott-continuous-firing-ordinal, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy, paraconsistent-settling-associated-sheaf, negative-paraconsistent-settling-sheaf, lawvere-laplacian-grothendieck-sites, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, transfinite-cell-complex]
---

# Transfinite-bounded-regime d-frame cohomology

For a knowledge presheaf $v$ in the [transfinite-bounded regime](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md) — closure ordinal $\omega < \kappa < $ state-space cofinality — the [d-frame-valued cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/d-frame-valued-sheaf/d-frame-valued-sheaf.md) of $\mathbb{F}_v$ on the bitopological settling site is

$$H^n_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \kappa}, \mathbb{F}_v) \;\cong\; \begin{cases} \text{global d-frame data of eventually-settled cells} & n = 0, \\ \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} D_\mu & n = 1, \\ 0 & n \geq 2, \end{cases}$$

where $L_{\mathrm{ns}}(\kappa)$ is the set of [non-Scott-continuous firing ordinals](../../../../../../valuation/content/knowledge-least-valuation/settling/content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md) below $\kappa$, and $D_\mu$ is a *d-frame generator* at firing ordinal $\mu$ — a d-frame whose $L_+$ and $L_-$ components are $\mathbb{Z}$-rank-1 (one cell newly added on the truth-positive or falsity-positive side at $\mu$), and whose consistency / totality structure records whether the firing is consistent (single-side firing) or paraconsistent ($\top$-cell firing, contributing to both sides simultaneously).

Under the [shadow comparison](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md):

$$\mathbb{S}\bigl(H^1_{\mathbf{dFrm}}\bigr) \;=\; \bigl(\bigoplus_{\mu \in L_{\mathrm{ns}}^+} \mathbb{Z},\; \bigoplus_{\mu \in L_{\mathrm{ns}}^-} \mathbb{Z}\bigr),$$

where $L_{\mathrm{ns}}^+$ and $L_{\mathrm{ns}}^-$ are the non-Scott-continuous firings on the truth-positive and falsity-positive evidence sides respectively (with $L_{\mathrm{ns}}^+ \cap L_{\mathrm{ns}}^-$ being the $\top$-firing ordinals). This matches the existing $\mathbf{Ab}$-valued [transfinite-bounded $H^1$-generators theorem](transfinite-bounded-regime-h1-generators.md) on each evidence shadow.

## Proof (building on Layers 1+2+3)

The statement follows the [methodology](../narratives/d-frame-cohomology-methodology.md)'s five steps. With the [Lawvere Laplacian extension](lawvere-laplacian-grothendieck-sites.md) (Layer 1 framework) in place, the [transfinite-CW Curry equivalence](q-enriched-curry-transfinite-cw.md) (Layer 3 per-fiber) handling the cellular structure on $\omega_1$-cofinal fibers, and the [Grothendieck-site theorem](q-enriched-curry-grothendieck-site.md) (Layer 2) assembling them globally, the transfinite-bounded case becomes provable by direct construction. The d-frame H^1-generator at each NSC firing is articulated precisely; the proof structure mirrors the corpus's existing $\mathbf{Ab}$-valued [transfinite-bounded $H^1$-generators](transfinite-bounded-regime-h1-generators.md) theorem.

**Step 1 (cellular structure).** Each paired-Priestley fiber at $(q, \tau)$ has cellular structure inherited from the predication fiber algebra's distributive bilattice structure. For $\tau < \kappa$ in the transfinite-bounded regime, the fiber is countably-cellular. At $\mu \in L_{\mathrm{ns}}(\kappa)$, the cellular structure transitions non-trivially: the fiber $X_q^\mu$ acquires cells not present as filtered colimits of fibers $X_q^\sigma$ for $\sigma < \mu$. This is the structural definition of an NSC firing on the dual side.

**Step 2 (Laplacian framework).** The [Lawvere Laplacian on Grothendieck sites](lawvere-laplacian-grothendieck-sites.md) applies to the bitopological settling site at any cover cardinality. The Tarski–Lawvere Fixed Point Theorem ([@ghrist-et-al2025] Theorem 2.17) gives convergence at countable cofinality, which suffices for the transfinite-bounded regime ($\kappa < \omega_1$ countable).

**Step 3 (fiber computation).** Each fiber's d-frame-valued cellular sheaf cohomology is computed via the Tarski Laplacian. At each Scott-continuous segment of the fiber filtration (between consecutive NSC firings), the filtered-colimit machinery from [Scott-continuous-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md) applies, giving $H^{\geq 1} = 0$ on each segment.

**Step 4 (global assembly: the H^1-generator construction).** The non-trivial $H^1$ content arises at NSC firings $\mu \in L_{\mathrm{ns}}(\kappa)$, where the cellular jump produces a non-coboundary cocycle in the d-frame cochain complex.

*Construction of $D_\mu$ at each NSC firing $\mu$.* By the [transfinite-bounded $H^1$-generators](transfinite-bounded-regime-h1-generators.md) Ab-side argument, exactly one cell is newly designated at each NSC firing $\mu$ — call it $(s_\mu, o_\mu, q_\mu) \in E \times E \times \mathcal{C}$. The cell's bilattice value at $\tau = \mu$ determines the d-frame generator $D_\mu$:

- *Truth-only firing* ($v_\mu(q_\mu)(s_\mu, o_\mu) = \mathbf{t}$, no falsity-component prior): the cell contributes to $L_+$ on the dual side. $D_\mu = (\mathbb{Z}, 0, \text{trivial-con}, \text{trivial-tot})$ — d-frame with rank-1 truth-positive component, zero negative-positive, trivial relations (no co-witnessing top, the new cell is fully settled).
- *Falsity-only firing* ($v_\mu(q_\mu)(s_\mu, o_\mu) = \mathbf{f}$, no truth-component prior): symmetric. $D_\mu = (0, \mathbb{Z}, \text{trivial-con}, \text{trivial-tot})$.
- *$\top$-firing* (both components first appear at $\mu$, e.g., simultaneous truth-and-falsity assertions arrive at $\mu$): the cell contributes to both $L_+$ and $L_-$ simultaneously. $D_\mu = (\mathbb{Z}, \mathbb{Z}, \text{con-fails-on-singleton-pair}, \text{trivial-tot})$ — the consistency relation explicitly records the inconsistency between the truth and falsity components on the same cell.

**Step 5 (linear independence and completeness).** The argument transfers from the Ab-side proof, refined by d-frame structure:

*Linear independence.* A combination $\sum_\mu a_\mu D_\mu = 0$ in $H^1_{\mathbf{dFrm}}$ requires the underlying cochain to be a coboundary — an element of $\mathrm{image}(\delta^0)$. The "newly-addedness" of each $D_\mu$ at $\mu$ — that the cell appears at $\mu$ for the first time, with no earlier-stage representative — means no earlier-stage cochain pulls back to a cochain producing $D_\mu$ in $H^1$. Hence the combination cannot be a coboundary unless all $a_\mu$'s with $a_\mu \neq 0$ already produce zero in their stage-of-newly-added-ness, i.e., the combination is identically zero.

*Completeness.* Every $H^1$-class arises from such a combination. By the cocycle representation in $C^1 F$ — Layer 1's cochain complex with d-frame coefficients — every $H^1$ generator is a non-coboundary cocycle. Cocycles in transfinite-bounded settings are exactly the newly-added-cell-content at NSC firings (the d-frame analogue of the Ab-side minimal-cochain-complex argument). Hence the $D_\mu$'s span $H^1$. $\square$

**Shadow comparison.** Under the [shadow functor](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md), each $D_\mu$ projects to:
- $\mathbb{S}_+(D_\mu) = \mathbb{Z}$ if $\mu$ is a truth-only or $\top$ firing, else 0.
- $\mathbb{S}_-(D_\mu) = \mathbb{Z}$ if $\mu$ is a falsity-only or $\top$ firing, else 0.

So $\mathbb{S}(H^1_{\mathbf{dFrm}}) = \bigoplus_{\mu \in L_{\mathrm{ns}}^+} \mathbb{Z} \oplus \bigoplus_{\mu \in L_{\mathrm{ns}}^-} \mathbb{Z}$, where $L_{\mathrm{ns}}^+$ and $L_{\mathrm{ns}}^-$ partition $L_{\mathrm{ns}}$ by evidence side. This matches the existing $\mathbf{Ab}$-valued [transfinite-bounded $H^1$-generators](transfinite-bounded-regime-h1-generators.md) theorem applied to $\mathcal{F}_v^{(k)}$ (positive paraconsistent) and $\mathcal{F}_v^{(k, -)}$ (negative paraconsistent) separately.

## What the d-frame structure adds at $H^1$

Beyond the shadow's $\bigoplus \mathbb{Z}$ structure on each evidence side, the d-frame $H^1$ carries:

- **Per-firing d-frame structure $D_\mu$.** Each firing's cellular jump produces a d-frame, not just an abelian group. The d-frame records:
  - $L_+(D_\mu)$: rank-1 if the firing adds a truth-positive cell, zero otherwise.
  - $L_-(D_\mu)$: rank-1 if the firing adds a falsity-positive cell, zero otherwise.
  - $\mathrm{con}(D_\mu)$, $\mathrm{tot}(D_\mu)$: relations on the cell-additions distinguishing pure-truth firings, pure-falsity firings, and $\top$-firings (both simultaneously).

- **Cross-firing consistency relations.** When a cell appears on both sides at *different* firings (e.g., as $\mathbf{t}$ at $\mu_1$ then later as $\top$ at $\mu_2$ when negative evidence arrives), the d-frame structure of $H^1$ records the inter-firing consistency-failure pattern. The shadow loses this — it sees only per-side disjoint generator collections.

This additional content distinguishes settlings the bigraded cohomology can't separate. Specifically, two settlings whose firing-ordinal sets agree on each evidence side separately but whose firing *interactions* differ (different patterns of which firings trigger $\top$-cells) are bigraded-equivalent but **d-frame-distinct**.

## Refined MLD-classification under the d-frame setting

The corpus's [MLD-equivalence](../concepts/mutually-locally-derivable.md) classification on the transfinite-bounded stratum, refined by the d-frame cohomology: two transfinite-bounded settlings are d-frame-MLD-equivalent iff their non-Scott-continuous-firing-set structures agree *with consistency-totality data* up to settling-shift. This is strictly finer than the existing MLD-equivalence (which uses only the Ab-shadow).

This is exactly the finer invariant the [strong-MLD-classification question](../questions/strong-mld-classification.md) asks for — the d-frame setting *delivers* a candidate refined invariant once Layer 2 is in place.

## Position in the program

This theorem is now established at draft level: with the cellular extension plan's Layers 1, 2, and 3 all in place — in particular the [Q-enriched Curry on transfinite cell complexes theorem](q-enriched-curry-transfinite-cw.md) handling the per-fiber transfinite-cellular case, and the [Grothendieck-site theorem](q-enriched-curry-grothendieck-site.md) extended to admit transfinite fibers as input — the methodology's five steps execute concretely.

The transfinite-bounded regime fibers are countable cell complexes (with cell sets indexed by ordinals up to the closure ordinal $\kappa < \omega_1$), so the [transfinite cell complex framework](../objects/transfinite-cell-complex.md) applies directly. Boolean d-frame data gives strict-adjoint base-changes and per-finite-sub-complex Curry fuzziness $q^{\mathrm{transfin}} = 1$; the resulting d-frame Verdier and cohomology are strict equivalences.

The corresponding [aperiodic-regime theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-d-frame-cohomology.md) extends to the $\omega_1$-scale, using the same per-fiber transfinite framework with $\omega_1$-cofinal cell complexes.
