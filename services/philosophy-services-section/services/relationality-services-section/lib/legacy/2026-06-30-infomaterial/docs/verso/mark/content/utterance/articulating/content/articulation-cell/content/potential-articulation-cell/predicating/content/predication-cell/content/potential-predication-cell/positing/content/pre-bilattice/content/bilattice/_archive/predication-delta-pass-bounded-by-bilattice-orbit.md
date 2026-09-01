---
type: theorem
class: engineering-claim
status: proved
depends-on: [settling-as-computation, closure-rule-system-realizes-closure-2-monad, settlement-via-closure-2-monad]
see-also: [bilattice-operation-table-correctness, sigma-delta-pass-decomposition, settlement-determinism, conformance-via-fiber-algebra-functor]
---

# Per-cell Δ-pass termination is bounded by the bilattice's mixed-orbit convergence rate

**Claim.** A predicated computer whose value-domain is the four-element bilattice $\mathbf{FOUR}$ — equivalently, whose [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) is $\mathbf{FOUR}^{E \times E}$ — has a *structurally guaranteed* per-cell Δ-pass termination bound: every cell whose value is moved by a σ-pass and is then handed to the Δ-pass for stabilization reaches its bilattice fixed point in **at most one composite step** of the cell-local stabilization operator $T_a(x) = a \Rightarrow (a \odot x)$, equivalently **at most two substeps** when fusion and residual are counted separately.

The bound is the engineering surface of the mathematical [four-bilattice mixed orbit convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-mixed-orbit-convergence.md) theorem ($T_a^1 = T_a^2$ on $\mathbf{FOUR}$ for every $a$). The substrate inherits the bound by being a faithful realizer of the bilattice algebra per [bilattice operation table correctness](bilattice-operation-table-correctness.md).

## Why this holds

The [Δ-pass](teaching/explanations/sigma-delta-pass-decomposition.md) is the engineering realization of the [bilattice stabilization nucleus](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-stabilization-nucleus.md) on the substrate's fiber. Per cell $(s, p, o)$ moved by the σ-pass, the Δ-pass picks up the cell's seed value $x$ and a background value $a$ (per the substrate's background-value policy — typically supplied by the firing rule's conclusion or the merge-source value), and applies $T_a$ until a fixed point is reached. Per [four-bilattice mixed orbit convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-mixed-orbit-convergence.md), $T_a(T_a(x)) = T_a(x)$ on $\mathbf{FOUR}$ for every $a, x$ — i.e. one composite application suffices. The substrate's per-cell composite-step counter therefore reaches a fixed point at step 1.

Counting at the substep level: each composite $T_a$ application decomposes into one fusion ($a \odot x$) followed by one residual ($a \Rightarrow \cdot$). One composite step is therefore two substeps. Implementations that fuse the two operations into a single primitive consume one substep per per-cell iteration; implementations that perform fusion and residual as separate primitives consume two.

Per [bilattice operation table correctness](bilattice-operation-table-correctness.md), the substrate's $\odot$ and $\Rightarrow$ implementations produce byte-identical results to the math's twist-product fusion and right residual on $\mathbf{FOUR}$. The substrate's $T_a$ implementation is therefore byte-identical to the math's $T_a$, and the math's convergence bound transfers to the substrate.

## Engineering consequence

- **Per-cell Δ-fuel is structurally bounded.** A conforming substrate may set its per-cell Δ-fuel to any value $\geq 1$ composite step ($\geq 2$ substeps) and never exhaust it on conforming bilattice work. The common implementation choice of $\text{fuel} = 4$ substeps (often described as "the bilattice settlement bound, doubled for headroom") is in fact $4 \times$ the structurally tight bound — the doubling is purely defensive headroom against off-by-one errors in the substep counter, not a structural margin against orbit-length variability.
- **Per-cell Δ-pass exhaustion is a substrate-implementation bug, not a regime issue.** A substrate that surfaces a per-cell Δ-fuel-exhaustion error on conforming bilattice work has either a faulty $T_a$ implementation (failing [bilattice operation table correctness](bilattice-operation-table-correctness.md)), a faulty substep counter (counting wrong), or has chosen a background-value policy that does not in fact yield a $T_a$-like operator. It is not exposing a regime classification problem; the bound applies in every regime when the value-domain is $\mathbf{FOUR}$.
- **The bound does not extend to the σ-pass.** The σ-pass — rule saturation — is bounded by the rule system's regime classification per [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), not by the per-cell mixed-orbit bound. A substrate that conflates σ-fuel and Δ-fuel into a single budget loses the structural guarantee: σ-fuel exhaustion is a regime question, Δ-fuel exhaustion (per cell) is structurally impossible.
- **The bound does not extend to the σ↔Δ outer alternation.** A new σ-firing enabled by a Δ-stabilization restarts the σ-pass; the outer alternation's bound is determined by the rule system's structural properties, not by the per-cell mixed-orbit bound. The per-cell guarantee covers exactly one Δ-pass invocation on one cell's stabilization, not the outer fixpoint-of-fixpoints the substrate iterates.

## What the theorem rules out

- **Per-cell Δ-pass divergence on $\mathbf{FOUR}$.** A substrate that reports a single cell's Δ-pass diverged on conforming bilattice work has a structural bug. Reproduction by feeding the same $(a, x)$ pair to a reference $T_a$ implementation will reveal the discrepancy.
- **Regime-dependent per-cell Δ-pass cost.** The per-cell composite-step cost is uniform across regimes when the value-domain is $\mathbf{FOUR}$ — there is no "aperiodic regime" in which a cell takes more composite steps to stabilize. Aperiodicity affects rule-firing trajectories (the σ-pass), not per-cell bilattice stabilization.
- **Per-cell Δ-fuel as a tunable performance parameter.** Setting Δ-fuel to $0$ composite steps produces incorrect results on every orbit that genuinely moves at step 1 (e.g. $T_\bot(\mathbf{f}) = \bot \neq \mathbf{f}$); setting it to $\geq 1$ composite step produces correct results in every case, with no performance benefit to setting it higher than $1$. The "fuel" framing here is a safety net, not a performance dial.

## What the theorem requires

- The substrate's value-domain is $\mathbf{FOUR}$ (or more generally, a finite bilattice on which the analogous mixed-orbit bound has been established). Substrates over richer twist-product algebras must establish their own per-cell convergence bound; the mixed-orbit theorem on $\mathbf{FOUR}$ does not transfer automatically.
- The substrate's Δ-pass implements the composite step $T_a(x) = a \Rightarrow (a \odot x)$ — fusion-against-background then residual-by-background, with the *same* $a$ in both positions — and not some other ad-hoc bilattice iteration. Substrates that iterate $\odot$ alone, or $\Rightarrow$ alone, fall under the separate [four-bilattice residuation convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-bilattice-residuation-convergence.md) bound (also $\leq 2$ steps, but for different operators).
- The substrate's $\odot$ and $\Rightarrow$ implementations satisfy [bilattice operation table correctness](bilattice-operation-table-correctness.md).
- The substrate's background-value policy supplies a background $a$ to each cell-local $T_a^*$ application. The bound applies per cell for whichever $a$ is supplied; the policy choice itself does not affect the per-cell bound.

## Position

This theorem closes the engineering question "how much per-cell Δ-fuel does the substrate need?" with a structural answer: $1$ composite step ($2$ substeps), with optional defensive headroom. It removes the per-cell Δ-fuel parameter from the list of substrate tuning knobs and reclassifies it as a structural constant determined by the bilattice. Substrate cost models can therefore treat per-cell Δ-pass cost as a fixed constant rather than a workload-dependent parameter; per [cost composition via Lawvere quantale](cost-composition-via-lawvere-quantale.md), the Δ-pass's contribution to total respond cost is bounded by $2 \cdot |\text{moved cells}|$ substeps in the additive quantale.

The theorem is the per-cell half of the substrate's settlement-cost analysis; the σ-pass half is the rule-system regime classification, and the σ↔Δ outer-alternation half is its own structural question (see the [outer fuel](questions/sigma-delta-outer-alternation-bound.md) open question).
