---
kind: definition
type: stationary-distribution
symbol: "\\pi_\\lambda"
depends-on: [stochastic-settling, markov-stationary-is-closure-fixpoint, four-regime-dichotomy]
see-also: [sprinkled-causal-set-settling, detailed-balance, birth-death-chain]
---

# Poisson settling

The **Poisson distribution** `π_λ(n) = e^{−λ}λⁿ/n!` is, in this corpus, not an analytic object built
from the exponential series — it is the **stationary distribution of a birth–death settling**, hence
(by [`markov-stationary-is-closure-fixpoint`](../../stochastic-settling.md)) a **settling fixed
point**. Probability here *is* settling; Poisson is what the birth–death closure settles to.

## The birth–death settling

The birth–death chain on the states `ℕ` has, at state `n`, **birth** to `n+1` at constant rate `λ`
and **death** to `n−1` at rate `n`. It is reversible, so its stationary distribution is fixed by
**detailed balance**:
$$\lambda \cdot \pi(n) \;=\; (n+1)\cdot \pi(n+1).$$
Solving the recurrence gives the Poisson shape `π(n) ∝ λⁿ/n!`. The normalization constant `π(0) =
e^{−λ}` is the *only* place the exponential would enter — and it never enters the fixed-point
characterization, because settling values are unnormalized (the closure climbs from the seed `⊥`,
and a stationary distribution is defined only up to scale).

So the Poisson shape is reachable **with no reals, no exponential, no division**: cleared of the
`n!` denominators, detailed balance is the pure identity
$$\lambda \cdot \lambda^n \cdot (n+1)! \;=\; (n+1)\cdot \lambda^{n+1}\cdot n!,$$
both sides `λⁿ⁺¹·(n+1)·n!`. *(Built+green: `Infomaterial.Probability.PoissonSettling.poisson_detailed_balance`.)*

## Reversibility is the route to the fixed point

A reversible kernel is stationary: if `π(z)·P(z,o) = π(o)·P(o,z)` for all states and the rows sum to
`1`, then `π·P = π`. This holds over **any** stochastic semiring — no field needed — so it carries
the Poisson detailed balance straight to a `markov-stationary-is-closure-fixpoint`. *(Built+green:
`detailed_balance_implies_stationary`.)*

Realized concretely over the corpus's own derived rationals `InternalReals.Rat`, a genuine
*fractional* reversible birth–death kernel — e.g. on `{0,1}` with `λ = 2`, transition matrix
`[[1/2,1/2],[1/4,3/4]]` — has the Poisson-shaped distribution `π = (1/3, 2/3)` (ratio `π₁/π₀ = λ`) as
a proven stationary distribution, hence a settling fixed point. *(Built+green:
`poissonKernel_stationary`, `poissonKernel_settling_fixpoint`.)*

## The expectation is a settling valuation

The sprinkling **expectation** `E[·]` is the linear functional `∑_ω (·)` — the
[counting measure read as a valuation](../../../../sheaf/content/settling-cohomology/measure-is-valuation.md)
lifted from events to fields (`E[1_A] = μ(A)`, and `E` additive and homogeneous). *(Built+green:
`expVal_add`, `expVal_smul`, `expVal_indicator`; the `ℝ`-valued form `expValR` couples to the
[causal d'Alembertian](../../../lorentzian-causal-settling/content/causal-dalembertian/causal-dalembertian.md):
`⟨□ φ⟩ = □ ⟨φ⟩`.)*

## Position in the program

Poisson settling is the discrete law of the [sprinkled causal-set
settling](../../../lorentzian-causal-settling/content/sprinkled-causal-set-settling/sprinkled-causal-set-settling.md):
the count of sprinkled events in a region is Poisson with mean `ρV`, and the sprinkling expectation
is this settling valuation. What remains **roadmap** is the continuum Poisson *point process*
(uncountable state space, Lorentz-invariant) and its `V → ∞` limit — the analytic sector where the
exponential and a continuum measure genuinely enter. The discrete settling characterization, the
reversibility bridge, the concrete fractional fixed point, and the expectation valuation are all
**built and green**.
