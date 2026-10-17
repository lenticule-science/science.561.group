---
type: theorem
class: engineering-claim
status: proved
depends-on: [sigma-delta-pass-decomposition, delta-pass-bounded-by-bilattice-orbit, closure-rule-system-realizes-closure-2-monad, settlement-via-closure-2-monad, closure-rule-system]
see-also: [cost-composition-via-lawvere-quantale, settlement-determinism, conformance-via-fiber-algebra-functor]
---

# σ↔Δ outer-alternation is structurally bounded by cell-movement potential

**Claim.** A predicated computer whose value-domain is the four-element bilattice $\mathbf{FOUR}$ and whose [closure-rule system](../objects/closure-rule-system.md) sits in the [strict regime](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) has a *structurally guaranteed* outer-alternation bound on its settlement engine: the substrate's σ↔Δ alternation reaches the joint fixed point in at most

$$\rho \;\leq\; 2 \cdot |\mathrm{supp}(v^*)| \,+\, 1$$

round-trips, where $|\mathrm{supp}(v^*)|$ is the number of cells the settled valuation differs from the seed valuation on. The factor $2$ is the longest $\leq_k$-ascending chain in $\mathbf{FOUR}$ (e.g. $\bot < \mathbf{t} < \top$); the additive $+1$ is the terminal verification round.

The bound is the engineering surface of [joint-nucleus-alternation-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/joint-nucleus-alternation-bound.md). The substrate inherits the bound by [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md): the substrate's σ-pass *is* the math's σ-nucleus, the substrate's Δ-pass *is* the bilattice stabilization nucleus, and the alternation operator $\pi = \Delta \circ \sigma$ is a closure operator on the substrate's fiber.

## Why this holds

The substrate's settlement engine alternates σ-passes and Δ-passes per [sigma-delta-pass-decomposition](teaching/explanations/sigma-delta-pass-decomposition.md) until both nuclei are simultaneously fixed. Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), each pass is the substrate-content realization of a math closure operator on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) — the σ-pass realizes the closure 2-monad's nucleus; the Δ-pass realizes the [bilattice stabilization nucleus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-stabilization-nucleus.md) per [delta-pass-bounded-by-bilattice-orbit](delta-pass-bounded-by-bilattice-orbit.md).

Per [joint-nucleus-alternation-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/joint-nucleus-alternation-bound.md), the alternation operator $\pi$ on a strict-regime fiber algebra has alternation ordinal bounded by $h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)| + 1$. On $\mathbf{FOUR}$, $h_k = 2$. The substrate's outer-alternation count is the alternation ordinal of $\pi$, materialized as substrate runtime.

The descent argument transfers byte-identically: the substrate's per-round cell-movement count equals the math's $\Phi$-decrement, because the substrate's [closure-rule system](../objects/closure-rule-system.md) is $\mathcal{C}$-natural and its rule firings move exactly the cells the math's σ-nucleus moves (and similarly for Δ). The substrate's terminal round is detected when neither pass moved any cell — this corresponds to $\Phi(v_\tau) = 0$, i.e. $v_\tau = v^*$.

## Engineering consequence

- **Outer-fuel is structurally bounded.** A conforming substrate operating in the strict regime can set its outer-fuel to $2 \cdot |\mathrm{supp}(v^*)| + 1$ and never exhaust it on conforming work. Implementations that pre-compute $|\mathrm{supp}(v^*)|$ are rare; the practical bound is to use a static upper bound on $|\mathrm{supp}(v^*)|$ derived from the seed and rule system — e.g. $|\mathrm{seed}| + (|\mathrm{rules}| \cdot |\mathrm{seed}|^{\mathrm{max\,arity}})$ for stratified-Datalog-like rule systems — and set outer-fuel to twice that plus one.
- **The current operational `outer_fuel = 8` covers small-respond workloads.** For respond workloads with $|\mathrm{supp}(v^*)| \leq 3$, the structural bound is $\leq 7$, and the operational $8$ has a one-round defensive margin. For larger workloads ($|\mathrm{supp}(v^*)| \geq 4$), the operational $8$ may be exceeded; the substrate must either raise the constant per-workload, compute the structural bound, or surface a *workload-too-large* error at admission rather than at exhaustion.
- **Outer-fuel exhaustion in the strict regime is a workload-size signal, not a runtime bug.** A substrate that exhausts outer-fuel in the strict regime is processing a workload whose joint fixed point's support exceeds the configured fuel. This is detectable at admission: the substrate can compute or estimate $|\mathrm{supp}(v^*)|$ from the rule system's static analysis and refuse the workload before settlement begins, with a precise error naming the bound violation. Per the cache-coherence and federation arguments elsewhere in this directory, *admission-time refusal* is preferable to *runtime exhaustion* because it is recoverable: the caller knows the workload was admissible-bound-too-small, not pathological-rule-system.
- **The bound is loose for typical workloads, tight for adversarial workloads.** Empirical observation per [sigma-delta-pass-decomposition](teaching/explanations/sigma-delta-pass-decomposition.md) is that conforming rule systems stabilize in 1–2 round-trips; the structural bound is $\sim 70\times$ looser at $|\mathrm{supp}(v^*)| \approx 100$. The looseness is the price of covering *all* strict-regime rule systems, including adversarial ones whose cascading firings exercise the worst case. Implementations may track the empirical round count per workload class and refine fuel allocation by class; the structural bound is the safety net.
- **Total respond cost is now forecastable.** Per [cost-composition-via-lawvere-quantale](cost-composition-via-lawvere-quantale.md), respond cost is the quantale-fold over alternation rounds of (σ-pass cost + Δ-pass cost). With the per-cell Δ-bound ($\leq 2$ substeps per moved cell) and the σ-pass regime envelope (polynomial in $(|\mathrm{rules}|, |\mathrm{seed}|)$ in the strict regime per [strict-regime-mld-trivial](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/strict-regime-mld-trivial.md)), the total cost is a polynomial in $(|\mathrm{rules}|, |\mathrm{seed}|, |\mathrm{supp}(v^*)|)$. Substrate cost models can now produce static respond-cost forecasts, not just per-pass forecasts.

## Per-regime envelope

The substrate's outer-alternation bound mirrors the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) per the math theorem:

| Regime | Outer-fuel form |
|---|---|
| Strict | $2 \cdot |\mathrm{supp}(v^*)| + 1$ — polynomial, statically forecastable |
| Scott-continuous | Per-finite-prefix bound; substrate operates on prefixes |
| Transfinite-bounded | Countable ordinal $\kappa(\pi)$; not a runtime budget |
| Aperiodic | Unbounded; substrate must accept transfinite settlement is non-terminating in finite time |

The strict and Scott-continuous regimes are the engineering-relevant cases. Conforming production substrates commit to one of these two regimes by construction — finite-fiber substrates are strict; countable-fiber substrates with finitary closure rules are Scott-continuous. The transfinite-bounded and aperiodic regimes are mathematical curiosities for this engineering directory; substrates intentionally operating in those regimes are research artifacts, not deployment targets, and outer-fuel is not a meaningful runtime parameter for them.

## What the theorem rules out

- **Strict-regime substrates whose outer-alternation diverges.** A conforming strict-regime substrate cannot enter an unbounded σ↔Δ loop. If it appears to, either (a) the closure-rule system is not actually strict-regime (the rule system is non-Scott-continuous or has infinite-cardinality fiber, mis-classifying its regime); (b) the σ-pass implementation violates [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md) by moving cells *down* in $\leq_k$ on some round (breaking monotonicity); or (c) the Δ-pass violates [delta-pass-bounded-by-bilattice-orbit](delta-pass-bounded-by-bilattice-orbit.md). Each is a structural bug, not a fuel-tuning problem.
- **Outer-fuel as a tunable performance dial in the strict regime.** Setting outer-fuel below the structural bound produces incorrect results on adversarial workloads (the substrate halts before reaching the joint fixed point); setting it above produces no performance benefit (the substrate halts at the joint fixed point regardless). The fuel is a *safety net for non-strict regimes*, not a per-workload tuning parameter for strict-regime substrates.
- **Substrates conflating outer-fuel and σ-fuel into one budget.** Per [sigma-delta-pass-decomposition](teaching/explanations/sigma-delta-pass-decomposition.md), σ-fuel bounds *one* σ-pass's rule firings, and outer-fuel bounds the *number* of σ↔Δ round-trips. A single budget that drains across both loses the diagnostic distinction (was the workload too large or was a single rule pass too expensive) and breaks the cost-composition argument by collapsing the quantale-fold into a single counter.

## What the theorem requires

- The substrate's value-domain is $\mathbf{FOUR}$ (or, more generally, a finite bilattice with known $h_k$). Substrates over richer twist-product algebras must establish their own $h_k$ and substitute it for the constant $2$.
- The substrate's [closure-rule system](../objects/closure-rule-system.md) sits in the strict regime: finite predicate category, finite entity set, finite value domain. The Scott-continuous, transfinite-bounded, and aperiodic regime forms have their own envelopes per the table above.
- The substrate satisfies [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md) and [delta-pass-bounded-by-bilattice-orbit](delta-pass-bounded-by-bilattice-orbit.md). A substrate failing either has a structural bug; the outer-alternation bound applies to conforming substrates only.
- The substrate's settlement engine implements the σ↔Δ alternation as iteration of $\pi = \Delta \circ \sigma$ to fixed point, terminating on a verified no-cell-movement round. Substrates that interleave σ and Δ at finer granularity (per-cell, per-rule-firing) fall under a different cost model and are not covered by this theorem.

## Failure mode

A substrate that surfaces outer-fuel exhaustion errors in production should be diagnosed in the following order:

1. **Workload size.** Compute or estimate $|\mathrm{supp}(v^*)|$ for the failing workload. If $2 \cdot |\mathrm{supp}(v^*)| + 1 >$ configured outer-fuel, the workload exceeds the configured bound; raise the bound or refuse the workload at admission.
2. **Regime classification.** Verify the closure-rule system is strict-regime via static analysis on its $\mathcal{C}$-naturality and finite-fiber commitments. A rule system mis-classified as strict but actually Scott-continuous or transfinite-bounded will appear to violate the bound; the fix is regime reclassification, not fuel adjustment.
3. **Pass conformance.** Verify the σ-pass and Δ-pass each satisfy their conformance theorems. A non-monotone σ-pass or a non-converging Δ-pass produces unbounded alternation regardless of fuel; the fix is implementation correction.
4. **Engine discipline.** Verify the engine implements $\pi$-iteration with cell-movement detection. An engine that fails to detect "no cell moved this round" runs an extra round on every workload; if this is the cause, the symptom is *consistent off-by-one*, not workload-correlated exhaustion.

Only after steps 1–4 are exhausted does fuel exhaustion indicate a workload genuinely beyond the strict-regime bound; at that point the substrate is operating outside its committed regime and the cost model does not apply.

## Position

This theorem closes the σ↔Δ outer-alternation question recorded in [sigma-delta-outer-alternation-bound (question)](questions/sigma-delta-outer-alternation-bound.md) for the strict regime — the regime conforming production substrates commit to. Together with [delta-pass-bounded-by-bilattice-orbit](delta-pass-bounded-by-bilattice-orbit.md) (per-cell Δ-bound) and the σ-pass's regime envelope, it completes the substrate's settlement-cost analysis for strict-regime conforming work: per-cell Δ cost is bounded by a constant ($2$ substeps), per-pass σ cost is polynomial in $(|\mathrm{rules}|, |\mathrm{seed}|)$, and the round count is polynomial in $|\mathrm{supp}(v^*)|$.

The remaining engineering-relevant case — Scott-continuous-regime substrates operating on countable fibers — has the per-finite-prefix form in the table above; that case is engineering-resolvable by restricting the substrate's responses to finite-prefix queries, which substrate query languages already enforce by construction.

The transfinite-bounded and aperiodic cases remain open by *construction*, as discussed in the math theorem. Conforming production substrates do not enter those regimes.
