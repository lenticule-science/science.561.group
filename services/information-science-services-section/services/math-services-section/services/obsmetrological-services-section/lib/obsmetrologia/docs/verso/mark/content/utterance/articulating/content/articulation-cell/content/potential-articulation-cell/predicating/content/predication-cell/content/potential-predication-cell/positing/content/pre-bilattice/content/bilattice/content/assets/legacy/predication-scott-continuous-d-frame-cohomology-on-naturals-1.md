---
kind: example
status: verified
depends-on: [scott-continuous-regime-d-frame-cohomology, scott-continuous-h1-vanishing-on-naturals, natural-number-successor-settling, d-frame-valued-sheaf, strict-regime-d-frame-computation]
instantiates: [scott-continuous-regime-d-frame-cohomology]
lineage: 3
---

# d-frame cohomology of the natural-number successor settling

The L3 instance of the [Scott-continuous-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md). **Lineage 3** instance for the d-frame chapter — the first concrete d-frame cohomology computation beyond the strict regime.

## Setup

The L3 successor settling from [natural-number-successor-settling](natural-number-successor-settling.md). At $\tau = \omega$, the settled state has $v_\omega(P)(n, n) = \mathbf{t}$ for all $n \in \mathbb{N}$.

## d-frame stalks at the limit

At $(P, \omega, U)$ for the maximal clopen $U$ of the paired Priestley space $X^\omega_P$:

- The newly-truth-positive cells are $\Delta^{+}_\omega = \{(n, n) : n \in \mathbb{N}\}$ — the entire diagonal.
- The Priestley dual cells: $\Delta^{+,*}_\omega = \{((n, n), +) : n \in \mathbb{N}\}$ — countably many points.
- $L_+ = \mathcal{P}(\Delta^{+,*}_\omega)$ — the powerset of a countable set; uncountable as a frame, with countable join structure.
- $L_- = \{\emptyset\}$ — falsity-side trivial.
- $\mathrm{con}, \mathrm{tot}$: $\mathrm{con}$ trivially holds (no falsity content); $\mathrm{tot}$ requires the full $\Delta^{+,*}_\omega$ on the $L_+$ side.

## $H^0$ via directed colimit

By [Scott-continuous-regime d-frame cohomology](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/scott-continuous-regime-d-frame-cohomology.md), the d-frame $H^0$ is the directed colimit of bounded-stage d-frame $H^0$:

$$H^0_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \omega}, \mathbb{F}_v) \;=\; \varinjlim_{n < \omega} H^0_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq n}, \mathbb{F}_v).$$

Each finite stage gives $H^0$ with $L_+ = \mathcal{P}(\Delta^{+,*}_n)$ rank $n+1$ (cells $(0,0), (1,1), \ldots, (n,n)$). The directed colimit gives $L_+ = \mathcal{P}(\mathbb{N})$ — countably many rank-1 contributions, assembled.

## $H^1 = 0$ in the d-frame setting

By the d-frame analog of [scott-continuous-h1-vanishing-on-naturals](scott-continuous-h1-vanishing-on-naturals.md), the d-frame $H^1$ also vanishes in the Scott-continuous regime — same structural reason: no NSC firings.

## What the d-frame setting adds beyond the abelian shadow

For this Scott-continuous example, the d-frame structure adds:

- **Countable-cell tracking.** The d-frame $L_+$ records the full subset structure of which cells have been settled, not just the cardinality. The shadow $\mathbb{Z}^\mathbb{N}$ records the same cardinality but loses the subset-relation content.
- **Totality relation across cells.** $\mathrm{tot}$ records *which* subsets of cells are total — the full $\Delta^{+,*}_\omega$. This is invisible in the abelian shadow.
- **Extension to falsity-side.** Adding falsity-content (e.g., a closure rule producing falsity-positive cells) would make $L_-$ non-trivial. The d-frame structure naturally accommodates this; the abelian shadow would require a separate computation.

For the present example with truth-only content, these additions are mostly latent — they become essential when the falsity side is non-trivial (later L3 examples could add falsity-side rules).

## Position in Lineage 3

The L3 d-frame cohomology computation. This is the corpus's first concrete d-frame cohomology *beyond strict regime* — Scott-continuous regime with countably-many cells, demonstrating that the d-frame framework computes correctly in the directed-colimit / Lawvere-Laplacian setting.

Pairs forward with [lawvere-laplacian-on-natural-number-settling](lawvere-laplacian-on-natural-number-settling.md), which exercises the Q-enriched Lawvere Laplacian framework on the same base.
