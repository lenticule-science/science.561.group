---
kind: theorem
status: proved
depends-on: [scott-continuous-regime-cohomology-vanishing, mutually-locally-derivable, finite-settling-h0-polynomial-time, stabilizing-regimes-combinatorial-classification]
---

# Scott-continuous regime MLD-equivalence in polynomial time

For two settlings $v, v'$ in the [$\omega$-Scott regime](scott-continuous-regime-cohomology-vanishing.md) over a common base, [MLD-equivalence](../concepts/mutually-locally-derivable.md) is decidable in time polynomial in the settling length.

## Proof

By [$\omega$-Scott regime cohomology vanishing](scott-continuous-regime-cohomology-vanishing.md), $H^1 = 0$ throughout the regime, so as in the [strict-regime case](strict-regime-mld-trivial.md) the MLD-classification reduces to $H^0$-matching.

For an $\omega$-Scott settling, the orbit is determined by its finite truncations: $v_\omega = \bigvee_k\{v_n : n < \omega\}$ by Scott-continuity, and similarly for $v'$.
Compute the designated-cell sets $\Delta(v_n), \Delta(v'_n)$ at each finite stage $n$ in polynomial time by [finite-settling $H^0$](finite-settling-h0-polynomial-time.md).
Compare cellwise with settling-shift up to a polynomial bound on the relevant truncation length.

The settling-shift comparison is a finite combinatorial search bounded by $\lambda$, with each comparison computable in polynomial time.
Total time polynomial in $(\lambda, |\mathbf{L}|, |E|, |\mathcal{C}|)$. $\square$

## Note

The polynomial bound is in the *truncation length* used for the comparison, not in the ordinal value of $\omega$ itself.
In practice, the comparison stabilizes at a finite truncation determined by the settlings' structure — typically much smaller than $\omega$ for settlings arising from finite rule-sets.
See [stabilizing-regimes combinatorial classification](stabilizing-regimes-combinatorial-classification.md) for the unified statement covering both stabilizing regimes.
