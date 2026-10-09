---
kind: definition
type: presheaf
symbol: "v_{\\mathrm{stoch}}"
depends-on: [continuous-valued-settling, spatiotemporal-knowledge-presheaf, closure-2-monad]
---

# Stochastic settling

A **stochastic settling** is a [continuous-valued settling](../../continuous-valued-settling.md) where the value category $\mathcal{V}$ is the **stochastic semiring** — values are probabilities or stochastic-matrix entries, tensor is multiplication-and-convex-combination, meet is the standard probability-distribution meet (often pointwise-max or convex-hull-meet depending on convention).

The canonical instance: **Markov-chain transition settling**.
Cells $(s, o)$ hold transition probabilities; closure step is one Markov-chain advance; settling is the stationary distribution.

## Definition

Fix a finite or countable state space $S$ and a transition kernel $P : S \times S \to [0, 1]$ with $\sum_o P(s, o) = 1$ for each $s$.
The **stochastic settling on $(S, P)$** is the $[0, 1]$-valued presheaf

$$v_k : S \times S \to [0, 1], \quad v_k(s, o) = P^k(s, o)$$

— the $k$-step transition probability — with closure operator

$$T_{\mathrm{stoch}}(v)(s, o) := \sum_{z \in S} v(s, z) \cdot P(z, o).$$

The settling $v_\kappa$ is the (limit of the) stationary $k \to \infty$ behavior:

- For irreducible aperiodic chains: $v_k(s, o) \to \pi(o)$ (stationary distribution) as $k \to \infty$, independent of $s$.
  Closure ordinal $\kappa = \omega$ in the asymptotic-c sense (per [continuous-state regime classification](../../../../references/continuous-state-regime-classification.md)).
- For absorbing chains: $v_k$ converges to absorbing-state distribution.
  Closure ordinal $\kappa = \omega$ asymptotic, or finite for graphs where absorption is bounded-step.
- For periodic / non-irreducible chains: $v_k$ may oscillate or fail to converge.
  The settling is not a single fixed point but a *Cesaro average* $\bar v_n := \frac{1}{n} \sum_{k=0}^n v_k$ which does converge.

## Value category structure

Stochastic settling sits in $\mathcal{V} = ([0, 1], \cdot, \mathrm{convex})$ — the probability semiring with multiplication as tensor and convex combination as the additive structure.
This is *not* a Lawvere quantale (which uses min for combine); the additive operation here is genuine summation.

Concretely:

- *Tensor* $\otimes$: $a \otimes b := a \cdot b$ (multiplication of probabilities along a sequential path).
- *Sum* $\oplus$: $a \oplus b := a + b$ (convex combination over alternative paths) — restricted to maintain $\sum \leq 1$.
- *Top / unit*: $1$ for the multiplicative side; $0$ as additive identity.
- *Meet / order*: standard $[0, 1]$ order; meet is $\min$ but "less informative" rather than "smaller value" in the closure-ordering sense (low probability = uncertain).

This makes stochastic settling a *Markov category*–enriched presheaf rather than a Lawvere-quantale-enriched one.
The closure operator $T_{\mathrm{stoch}}$ is matrix multiplication in $\mathcal{V}$.

## Connection to all-pairs shortest-path

The structural parallel:

| Lawvere quantale | Stochastic |
|---|---|
| $\mathcal{V} = ([0, \infty], +, \min)$ | $\mathcal{V} = ([0, 1], \cdot, +)$ |
| $v(s, o) =$ distance | $v(s, o) =$ probability |
| Closure: $T(v)(s, o) = \min(\ldots, \min_z v(s, z) + v(z, o))$ | Closure: $T(v)(s, o) = \sum_z v(s, z) \cdot P(z, o)$ |
| Settling: shortest-path matrix | Settling: stationary distribution / $k$-step kernel |
| Strict-V (finite kappa) | Asymptotic-c (kappa = $\omega$) |

The same closure-2-monad structure with two different value categories produces two different classical algorithms (Floyd-Warshall vs. Markov-chain iteration).
Both are settling-flavored computations.

## Settling firing pattern in the stochastic case

Each cell $(s, o)$ "acquires content" gradually rather than discretely:

- At $k = 0$: $v_0(s, o) = \mathbb{1}[s = o]$ (Kronecker delta).
- At $k = 1$: $v_1(s, o) = P(s, o)$.
- At $k = 2$: $v_2(s, o) = \sum_z P(s, z) P(z, o) = P^2(s, o)$.
- $\ldots$

The cell *first becomes non-zero* at step $k = $ (length of shortest path $s \to o$ in the support graph of $P$).
This is the *firing ordinal* in the stochastic case: the first $k$ at which $v_k(s, o) > 0$.

The bilattice analog: a cell fires when it transitions from $\bot$ to non-$\bot$.
The stochastic analog: a cell fires when its probability becomes non-zero. **Same combinatorial firing pattern as the Boolean reachability settling on the support graph.** The probability values are continuous content layered on top of the firing skeleton.

## Closure ordinal: the asymptotic-c / Scott-continuous-V regime

For stochastic settlings on irreducible aperiodic Markov chains, convergence is *geometric* in step count: $\| v_k - v_\infty \|_\infty \leq C \rho^k$ where $\rho < 1$ is the second-largest eigenvalue magnitude of $P$.

This places the settling firmly in the **asymptotic-c regime** (per [continuous-state regime classification](../../../../references/continuous-state-regime-classification.md)): $\kappa^c = \infty$ but limit exists in $\mathcal{V}$-completion.
No finite step realizes the stationary distribution exactly.

Equivalently, in discrete-iteration ordinal terms: the closure operator is **Scott-continuous-V** at $\omega$.
The $\omega$-supremum of the iterated $v_k$ is the stationary measure (after Cesaro averaging if periodic).

## Connection to existing corpus structure

- The [Q-enriched cohomology](../../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md) machinery applies, with $Q = $ probability semiring instead of $\{0, 1\}$ Boolean.
  The cohomology is a $Q$-module, and the firing-ordinal generators come with $Q$-valued (probability) content.
- The [continuous-state regime classification](../../../../references/continuous-state-regime-classification.md) places stochastic settlings in either strict-c (absorbing finite chain) or asymptotic-c (irreducible aperiodic) regime depending on convergence behavior.
- The [closure 2-monad](../morphisms/closure-2-monad.md) structure: stochastic closure is a $\mathcal{V}$-enriched lax-idempotent 2-monad in the asymptotic-c case.
  The KZ-lax structure is alive at the $\omega$-limit, which is the stationary distribution.

## Examples

- **Random walk on a finite graph**: $S = $ vertex set, $P(s, o) = 1/\deg(s)$ for $o$ a neighbor.
  Settling is the stationary distribution $\pi(s) \propto \deg(s)$.
- **Page-rank settling**: $S = $ web pages, $P$ = damped link transition matrix.
  Settling is the PageRank vector.
- **Hidden Markov model belief**: $S = $ hidden states, $P$ = transition kernel, plus observation update.
  Settling is the posterior belief over states given observation history.
- **Bayesian inference settling**: $v_k(\text{hypothesis}, \text{evidence}_k)$ = posterior probability after $k$ evidence steps.
  Closure step is one Bayesian update.

## Position in the program

First object generalizing to **probability-valued** settlings.
Builds on continuous-valued settling and specializes to the stochastic semiring.

Pairs with: - The [stochastic-stationary-as-settling theorem](references/stochastic-stationary-as-settling.md) — formal claim that Markov-chain stationary distribution is the stochastic-settling fixed point. - The [probabilistic belief-propagation benchmark](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-probabilistic-belief-propagation.md) — concrete computation.

Open downstream: - *Stochastic-d-frame*: extending the d-frame structure (paired residuated lattices) to stochastic values.
Probability-and-co-probability lattice.
Required for full Verdier on stochastic side. - *Quantum-flavored settling*: replacing real-valued probabilities with complex-valued amplitudes (or completely-positive maps).
The closure step becomes one channel evolution; settling becomes the channel's fixed point.
Open whether this fits the framework or requires new infrastructure. - *Stochastic agential dynamics*: stochastic settlings as Bayesian agents; settling paths as ongoing belief-update trajectories.
Pairs with [tunneling-and-agential-dynamics](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/tunneling-and-agential-dynamics.md).
