---
type: question
status: resolved
explores: [sigma-delta-pass-decomposition, closure-rule-system-realizes-closure-2-monad, closure-rule-system, four-regime-dichotomy]
see-also: [delta-pass-bounded-by-bilattice-orbit, sigma-delta-outer-alternation-bound]
resolved-by: [sigma-delta-outer-alternation-bound, joint-nucleus-alternation-bound]
---

# What is the structural bound on σ↔Δ outer alternation?

## Resolution

**Resolved for the strict and Scott-continuous regimes.** The cell-movement potential argument outlined in *What is currently known* below has been worked out and now appears as two theorems:

- Math: [joint-nucleus-alternation-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/joint-nucleus-alternation-bound.md). The alternation operator $\pi = \Delta \circ \sigma$ is itself a closure operator on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), and its alternation ordinal is bounded by a cell-movement potential $\Phi$ that strictly decreases each non-terminal round. In the strict regime, $\rho_\pi(v_0) \leq h_k(\mathbf{L}^\bowtie) \cdot |\mathrm{supp}(v^*)| + 1$.
- Engineering: [sigma-delta-outer-alternation-bound](../theorems/sigma-delta-outer-alternation-bound.md). On $\mathbf{FOUR}$ in the strict regime, the substrate's outer-alternation count is bounded by $2 \cdot |\mathrm{supp}(v^*)| + 1$. Total respond cost is now polynomial in $(|\mathrm{rules}|, |\mathrm{seed}|, |\mathrm{supp}(v^*)|)$.

The transfinite-bounded regime is bounded by a countable ordinal $\kappa(\pi) < \omega_1$ but is not a runtime budget; the aperiodic regime remains *open by construction* — the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) excludes finite or countable bounds in that regime, and the alternation operator inherits the exclusion. Conforming production substrates do not enter those regimes.

The original question text is preserved below as the historical motivation.

---

## Original question (preserved)

# What is the structural bound on σ↔Δ outer alternation?

The substrate's settlement engine alternates the [σ-pass and Δ-pass](teaching/explanations/sigma-delta-pass-decomposition.md) until both nuclei are simultaneously fixed. The per-cell Δ-pass is bounded by [delta-pass-bounded-by-bilattice-orbit](../theorems/delta-pass-bounded-by-bilattice-orbit.md) at $\leq 2$ substeps per cell. The σ-pass is bounded by the rule system's regime classification per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md). What bounds the **outer alternation** — the number of σ↔Δ round-trips before the joint fixed point is reached?

## Empirical observation

Substrate implementations report that conforming rule systems stabilize the outer alternation in 1–2 round-trips: the σ-pass produces saturated cells, the Δ-pass stabilizes them, and a follow-up σ-pass either fires no new rules or fires a small number whose Δ-pass output produces no further σ-firings. Pathological rule systems can extend the alternation, which motivates the substrate's *outer fuel* parameter (a hard cap on round-trips, surfacing an error when exceeded).

The empirical observation is not yet a structural theorem. The question is whether such a theorem exists and what regime-dependent shape it takes.

## What an answer would look like

A structural bound would relate the outer-alternation count to characteristics of the rule system and the seed fiber, with regime-dependent forms:

- **Strict regime:** the bound is a polynomial in $|\text{rules}|$ and $|\text{seed}|$, computable by static inspection of the rule system. Substrate cost models could forecast outer-fuel consumption.
- **Scott-continuous regime:** the bound is finite per finite prefix of the fiber, computable per prefix.
- **Transfinite-bounded regime:** the bound is an ordinal in the rule system's closure-ordinal envelope.
- **Aperiodic regime:** no finite or ordinal bound; the outer alternation is genuinely unbounded.

The four-regime structure suggests the answer mirrors [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) at the outer-alternation level. Whether the per-regime envelope is the *same* envelope as the σ-pass's regime envelope, or a refinement of it, is the open structural question.

## Why this matters

Without a structural bound, substrate cost forecasting per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md) can only forecast *per-pass* cost, not total respond cost. The total cost is the quantale-fold over all σ↔Δ round-trips, and forecasting that fold requires knowing how many round-trips will be consumed.

The current substrate compromise — set outer-fuel to a small constant ($8$ in current implementations) and surface an error on exhaustion — works for non-pathological rule systems but is not a structural guarantee. A rule system that ships, runs against benign-looking workloads for months, and then encounters an adversarial input that exceeds outer-fuel produces an undiagnosable hang. A structural bound would let substrate cost forecasting refuse such inputs at admission rather than at exhaustion.

## What is currently known

Three partial results constrain the answer:

1. **Per-cell Δ on $\mathbf{FOUR}$ is $\leq 2$ substeps.** Per [delta-pass-bounded-by-bilattice-orbit](../theorems/delta-pass-bounded-by-bilattice-orbit.md). This bounds *one* Δ-pass on *one* cell, not the outer alternation.
2. **Each cell's value moves monotonically in $\leq_k$.** Per [closure-driven-settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-driven-settling-monotonicity.md). On $\mathbf{FOUR}$, the longest $\leq_k$-chain is of length 2 (e.g. $\bot < \mathbf{t} < \top$), so each cell can move at most 2 times across the entire alternation. This bounds the *cell-movement count* but not the *round-trip count*: a single round-trip may move many cells, and a long alternation may have many round-trips each moving one cell.
3. **The closure 2-monad is lax-idempotent.** Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md). A second application of the composed nucleus $\Delta \circ \sigma$ to a fiber that has already settled to a $(\Delta \circ \sigma)$-fixed point is the identity. This says the alternation *terminates* — once both nuclei are simultaneously fixed, no further work is needed — but does not say *when*.

The gap between cell-movement-count (bounded) and round-trip-count (open) is the structural question: under what conditions does each round-trip move at least one cell, so that the round-trip count is bounded by the total cell-movement count?

## Adjacent open questions

- The relationship between this outer-alternation bound and the existing [closure ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md) of the σ-only iteration. Is the outer-alternation bound an extension of the closure ordinal to the joint nucleus, or a structurally different quantity?
- The relationship to [non-Scott-continuous firing ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md). The non-Scott-continuous regime's firing ordinal classifies σ-only behavior; the outer alternation introduces Δ-mediated re-firings that may produce a different ordinal.
- The relationship to [@arieli1996reasoning]'s consequence-relation iteration counts for the Belnap-Dunn family. Their iteration counts apply to a single-nucleus closure; the outer alternation is a two-nucleus refinement they do not study.

## Position

The outer-alternation bound is the last load-bearing structural unknown in the substrate's settlement-cost analysis. With the per-cell Δ-bound established and the σ-pass regime envelope characterized, this question is the gap between *per-pass cost* (well-characterized) and *total respond cost* (forecastable only with this bound).

Resolving the question is in scope for the bilattice and predication-fibration apparatus already developed; no new mathematical machinery appears to be required. The work is to formulate the alternation as an iteration of a composite operator on the fiber algebra and to bound that composite operator's convergence rate per regime, possibly by reducing to the existing closure-ordinal apparatus on a modified rule system that internalizes the Δ-stabilization as a synthetic rule.
