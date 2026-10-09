---
type: example
status: verified
depends-on: [scott-continuous-regime-cohomology-vanishing, settling-cohomology, natural-number-successor-settling, four-regime-dichotomy]
instantiates: [scott-continuous-regime-cohomology-vanishing]
lineage: 3
kind: example
---

# $H^1 = 0$ on the natural-number successor settling

Explicit verification of $H^1 = 0$ on the L3 base — the structural feature of the [Scott-continuous regime](../../../../../../../references/four-regime-dichotomy.md) made concrete. **Lineage 3** instance for the cohomology-vanishing chapter.

## Setup

The L3 successor settling from [natural-number-successor-settling](natural-number-successor-settling.md): $E = \mathbb{N}$, single $P$, finitary closure rule, settling $v$ converges at $\kappa = \omega$.

## Direct-limit cohomology computation

By [aperiodic-regime cohomology via direct limit](../../../../../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md), the cohomology at $\kappa = \omega$ is:

$$H^1(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_v) \;=\; \varinjlim_{n < \omega} H^1(\mathbf{T}^*_{\leq n}, \mathcal{F}_v).$$

Each truncation $\mathbf{T}^*_{\leq n}$ corresponds to a finite settling stage. For $n < \omega$ the truncation is in the strict regime, where $H^1 = 0$ identically.

So each term in the directed limit is zero, and the limit is zero:

$$H^1(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_v) \;=\; \varinjlim_n 0 \;=\; 0.$$

## Why $H^1 = 0$ structurally

The Scott-continuous closure $P(n, n) \Rightarrow P(n+1, n+1)$ never produces a *non-Scott-continuous firing*: at every limit ordinal $\leq \omega$, the closure-fixed-point is the directed-colimit of the prior stages. There's no $\mu \in L_{\mathrm{ns}}$ — equivalently, no firing-ordinal generator of $H^1$.

Per [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md), $H^1$ has one generator per non-Scott-continuous firing. With $L_{\mathrm{ns}}(\omega) = \emptyset$, $H^1 = 0$.

## What this exhibits

The Scott-continuous regime's cohomological signature: **$H^1 = 0$ is not vacuous, it's a structural consequence of Scott-continuity**. Settlings with countable settling-axis but Scott-continuous closure have trivial $H^1$ because no firing breaks the directed-colimit structure.

This is the *boundary case* of the four-regime dichotomy: just below the transfinite-bounded regime where $H^1$ becomes non-trivial, the Scott-continuous regime has $H^1 = 0$ as a structural rather than computational fact.

## Position in Lineage 3

The L3 cohomological-vanishing instance. Compare with:

- L1, L2: $H^1 = 0$ trivially (finite-cellular bases, no transfinite limit).
- L3 (this file): $H^1 = 0$ structurally (Scott-continuous limit, no NSC firing).
- L4 (forthcoming): $H^1 \neq 0$ — the first regime where NSC firings produce non-trivial $H^1$.

The transition from $H^1 = 0$ (L1, L2, L3) to $H^1 \neq 0$ (L4, L5) happens exactly at the Scott-continuous / transfinite-bounded boundary of the four-regime dichotomy.
