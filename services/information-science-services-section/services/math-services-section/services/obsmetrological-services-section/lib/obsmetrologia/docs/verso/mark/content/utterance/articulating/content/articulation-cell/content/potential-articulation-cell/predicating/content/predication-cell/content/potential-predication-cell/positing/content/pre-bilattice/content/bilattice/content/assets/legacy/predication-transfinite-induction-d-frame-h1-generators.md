---
type: example
status: verified
depends-on: [transfinite-bounded-regime-d-frame-cohomology, transfinite-induction-settling, two-firing-transfinite-settling, d-frame-valued-sheaf, scott-continuous-d-frame-cohomology-on-naturals]
instantiates: [transfinite-bounded-regime-d-frame-cohomology]
lineage: 4
kind: example
---

# d-frame $H^1$ generators of the two-firing transfinite settling

The L4 instance of the [transfinite-bounded-regime d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md). **Lineage 4** instance for the d-frame chapter — first concrete d-frame $H^1$ computation in the corpus, exhibiting the per-firing d-frame generator $D_\mu$ structure.

## Setup

The L4 [two-firing transfinite settling](two-firing-transfinite-settling.md): $E = \omega \cdot 2 + 1$, single $P$, $\Pi_1$-induction rule, two NSC firings at $\mu_1 = \omega$ and $\mu_2 = \omega \cdot 2$.

## d-frame $H^1$ generators per firing

By the [transfinite-bounded d-frame cohomology theorem](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/transfinite-bounded-regime-d-frame-cohomology.md):

$$H^1_{\mathbf{dFrm}}(\mathbf{T}^*_{\leq \omega \cdot 2 + 1}, \mathbb{F}_v) \;=\; D_{\omega} \oplus D_{\omega \cdot 2}.$$

At each firing $\mu_i$, the d-frame generator $D_{\mu_i}$ has structure determined by the firing's evidence side. For this settling, both firings are **truth-only** (the $\Pi_1$-rule produces $\mathbf{t}$-content):

- $D_\omega = (\mathbb{Z}, 0, \mathrm{trivial}, \mathrm{trivial})$ — rank-1 $L_+$ corresponding to the new cell $(\omega, \omega)$, rank-0 $L_-$, trivial relations.
- $D_{\omega \cdot 2} = (\mathbb{Z}, 0, \mathrm{trivial}, \mathrm{trivial})$ — analogous for $(\omega \cdot 2, \omega \cdot 2)$.

So $H^1_{\mathbf{dFrm}} = D_\omega \oplus D_{\omega \cdot 2}$ is a direct sum of two truth-only d-frame generators.

## Shadow comparison

The [shadow functor](../../predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) $\mathbb{S}$ projects:

- $\mathbb{S}_+(D_\omega \oplus D_{\omega \cdot 2}) = \mathbb{Z}^2$ — two truth-side generators.
- $\mathbb{S}_-(D_\omega \oplus D_{\omega \cdot 2}) = 0$.

Matches the abelian-side classifying invariant for the truth-only $\mathbf{Ab}$-shadow.

## What the d-frame setting adds

For this truth-only-firing settling, the d-frame structure adds *latent* content that the shadow cannot see:

- **Per-firing $L_-$ component is explicitly zero.** The shadow records "no falsity-side generator" by absence; the d-frame records "$L_- = 0$" structurally as part of $D_\mu$.
- **Consistency / totality relations are explicitly trivial.** The shadow has no relation to record; the d-frame records "consistency holds, totality on the singleton" as part of each $D_\mu$.

If we modified the settling to include falsity-only or $\top$-firings (e.g., a coupled-rule variant), the d-frame would distinguish these via per-$\mu$ generator structure where the shadow only sees the truth-side / falsity-side generator counts.

## Position in Lineage 4

The L4 instance of the d-frame $H^1$ computation. With this in hand, L4 has its first non-vanishing cohomology with explicit per-firing generator structure. Pairs forward with [transfinite-induction-strong-mld-exchange-orbit](transfinite-induction-strong-mld-exchange-orbit.md), which uses these generators to identify the strong-MLD orbit type.
