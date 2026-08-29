---
name: settling-continuity
description: "A settlement v = (v_τ)_{τ<λ} is continuous if at every limit ordinal μ < λ and every predicate p, v_μ(p) = ⋁_k {v_σ(p) : σ < μ} pointwise. The value at a limit is determined as the directed knowledge-join of values at preceding steps; limits are transparent — they collect, they don't add."
depends-on: [settlement, knowledge-order]
derives-from: docs/dev/scraps/settling-continuity.md
---

# Settling-continuity

A settlement `v = (v_τ)_{τ<λ}` is **continuous** if for every limit ordinal `μ < λ` and every predicate `p`,

$$v_\mu(p) \;=\; \bigvee_k \{\, v_\sigma(p) \,:\, \sigma < \mu \,\}$$

pointwise in `A_p` — the cellwise knowledge-order join of values at all earlier settling steps.

Equivalently, for every cell `(s, p, o)`:

$$v_\mu(p)(s, o) \;=\; \bigvee_k \{\, v_\sigma(p)(s, o) \,:\, \sigma < \mu \,\}.$$

## Limits are transparent

The condition says: at a limit ordinal `μ`, the value is **fully determined** by values at preceding `σ < μ`. The directed knowledge-join collects everything previously seen; no new content appears at `μ` beyond what's approached from below.

Limits are therefore **transparent** in the orbit: they don't introduce evidence, only consolidate it. A continuous settlement at limit `μ` looks like a directed colimit — the natural categorical notion of "limit" in the knowledge-poset sense.

## Why directed knowledge-join is the right limit

By settling-monotonicity, the family `{v_σ(p)(s, o) : σ < μ}` is `≤_k`-directed: for any two `σ_1, σ_2 < μ`, their max `σ = max(σ_1, σ_2) < μ` (since `μ` is a limit, every pair has a max strictly below) has

$$v_{\sigma_1}(p)(s, o) \;\leq_k\; v_\sigma(p)(s, o), \qquad v_{\sigma_2}(p)(s, o) \;\leq_k\; v_\sigma(p)(s, o).$$

So the directed-join `⋁_k {v_σ(p)(s, o)}` exists in the bilattice (since `L^⋈` is bounded and complete for `≤_k`). Continuity asserts the limit value `v_μ` equals this directed-join — the "smallest value at least as informative as every preceding value."

The alternative (a non-continuous settlement) would have `v_μ(p)(s, o)` strictly **greater** in `≤_k` than the directed-join — extra evidence appearing at the limit ordinal from no preceding source. Such evidence isn't traceable to any closure-rule firing or any increment; it's discontinuous.

## Non-continuous limits are the regime signature

Non-continuous transitions at limit ordinals are exactly the **non-Scott-continuous firing ordinals** of the closure-rule-system (separate archive concept, scrap pulled). At a non-continuous limit `μ`, the closure adds content not derivable from any single earlier stage — the closure operator IS doing something genuinely transfinite that no individual finite step contained.

The four regimes are stratified by what kind of non-continuous limits the closure operator allows:

| Regime | Closure ordinal `κ` | Limit behavior |
|---|---|---|
| strict-finite | `κ < ω` | no limits used (orbit quiesces before `ω`) |
| Scott-continuous | `κ = ω` | only the `ω`-limit, which IS continuous (Scott-continuity = continuity at `ω`) |
| transfinite-bounded | `ω < κ < ω₁` | continuity may fail at some countable limit `< ω₁` |
| aperiodic | `κ ≥ ω₁` | continuity fails at uncountable limits |

So **Scott-continuous closure** of a closure-rule-system is precisely settling-continuity at the `ω`-limit. Settling-continuity at higher limits is what distinguishes the higher regimes from each other.

## Position in the four-regime tower

A settlement that is continuous at every limit (including `ω₁` and beyond) is **fully Scott-continuous** — the closure operator commutes with all directed `∨_k`-joins. This is the strongest form; only `κ ≤ ω` closure operators achieve it.

A settlement that is continuous at `ω` but not at some higher limit `μ` is **Scott-continuous up to ω**, with transfinite content added at `μ`. This lives in the transfinite-bounded or aperiodic regimes depending on `μ`.

A settlement that is non-continuous at `ω` itself is not Scott-continuous at all. Such settlements are uncommon in the substrate — most closure-rule-languages naturally produce Scott-continuous closures.

## Coexistence with monotonicity

Settling-continuity and settling-monotonicity are **independent** conditions on a family:

- A family can be settling-monotone but non-continuous: `v_σ` grows in `≤_k`, but at some limit `μ`, `v_μ` is strictly greater than the directed-join of preceding values.
- A family can satisfy the limit equation but not be monotone everywhere: at successor steps it might fail monotonicity.

A **settlement** in the four-object grammar requires settling-monotonicity (the archive's strict definition); settlements that are additionally continuous at all limits are the "Scott-continuous-up-to-everywhere" subclass. The base settlement object allows non-continuous limits if the regime permits.

## Worked example: continuous vs non-continuous limit at `ω`

Take `L = 2`, `Π = {p}`, `E = {a, b}`, single cell `(a, p, b)`. Construct two `(ω+1)`-indexed families (so `λ = ω + 1`):

**Continuous at `ω`:** `v_0 = ⊥, v_1 = ⊥, v_2 = ⊥, …, v_ω = ⊥`.
- Limit value: `v_ω(p)(a, b) = ⊥`.
- Directed-join: `⋁_k {⊥ : σ < ω} = ⊥`.
- Equal ✓ — continuous at `ω`.

**Continuous at `ω` (non-trivial):** `v_n(p)(a, b)` = the value after `n` evidence-injections, asymptoting toward `t`. If for some `n`, `v_n = t` and `v_m = t` for all `m ≥ n`, then `v_ω(p)(a, b) = t` and directed-join = `t`. Continuous.

**Non-continuous at `ω`:** `v_n(p)(a, b) = ⊥` for all `n < ω`, but `v_ω(p)(a, b) = t`. The directed-join of `{⊥ : σ < ω}` is `⊥`, not `t`. The orbit added evidence "at infinity" with no traceable origin. **Non-continuous at `ω`.**

The third orbit is settling-monotone (`⊥ ≤_k t` ✓) but not Scott-continuous. It belongs to the transfinite-bounded regime or higher; its closure operator does something that no Scott-continuous operator could.

## Position

`settling/hacking/library/settling-continuity/`. Placed at settling tier as a condition on settling-orbits at limit ordinals.

## Derivation source

Adapted from `predication-categories/concepts/settling-continuity.md`, preserved at `docs/dev/scraps/`.
