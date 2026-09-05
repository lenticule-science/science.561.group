---
kind: theorem
status: proved
depends-on: [stochastic-settling, continuous-state-regime-classification]
---

# Stochastic stationary distribution as settling fixed point

For an irreducible aperiodic Markov chain, the stationary distribution **is** the [stochastic settling](../objects/stochastic-settling.md)'s closure fixed point.
This identifies the standard Perron-Frobenius result with the corpus's settling formalism applied to the stochastic value category.

## Statement

**Theorem (stochastic stationary as settling).** *Let $(S, P)$ be a finite irreducible aperiodic Markov chain with unique stationary distribution $\pi$.
Let $v_k(s, o) := P^k(s, o)$ be the iterated stochastic settling.
Then:*

1. *(Convergence) $\lim_{k \to \infty} v_k(s, o) = \pi(o)$ for every $s$, with geometric rate $\rho^k$ where $\rho := \max_{i \geq 2} |\lambda_i| < 1$ is the second-largest eigenvalue magnitude of $P$.*

2. *(Fixed point) The pointwise limit $v_\infty(s, o) := \pi(o)$ is the unique fixed point of $T_{\mathrm{stoch}}$ among rank-one stochastic kernels.*

3. *(Closure ordinal in the asymptotic-c sense) The closure ordinal $\kappa^c = \infty$ asymptotically, but $\kappa = \omega$ in the discrete-ordinal $\mathcal{V}$-Scott-continuous sense — $v_\omega := \sup_k v_k$ in the $\mathcal{V}$-completion equals $v_\infty$.*

## Proof

### Step 1: Convergence to stationary distribution

This is the Perron-Frobenius theorem for stochastic matrices. $P$ is a row-stochastic matrix: $P \cdot \mathbf{1} = \mathbf{1}$, eigenvalue 1 with eigenvector $\mathbf{1}$.
Irreducibility plus aperiodicity gives:

- $P$ has 1 as a *simple* eigenvalue.
- All other eigenvalues satisfy $|\lambda_i| < 1$.
- The left-eigenvector for eigenvalue 1 is the stationary distribution $\pi$ (with $\pi P = \pi$, $\sum_o \pi(o) = 1$, $\pi(o) > 0$ for all $o$).

Decomposing $P^k$ in eigenbasis:

$$P^k = \mathbf{1} \pi^T + \sum_{i \geq 2} \lambda_i^k v_i u_i^T$$

where $v_i, u_i$ are the right and left eigenvectors.
The first term is rank-one ($\mathbf{1} \pi^T(s, o) = \pi(o)$).
The second term has $\|\sum_i \lambda_i^k \cdot \cdot\| \leq C \rho^k \to 0$ exponentially.

Hence $\lim_k P^k(s, o) = \pi(o)$ uniformly in $s$, with rate $\rho^k$. $\square$ (Step 1)

### Step 2: Uniqueness as fixed point of $T_{\mathrm{stoch}}$

A *fixed point* of $T_{\mathrm{stoch}}$ is a stochastic kernel $v^*(s, o)$ satisfying

$$v^*(s, o) = \sum_z v^*(s, z) P(z, o).$$

Among rank-one kernels $v^*(s, o) = \mu(o)$ (independent of $s$), this becomes $\mu(o) = \sum_z \mu(z) P(z, o)$, i.e., $\mu = \mu P$ — left-eigenvector equation.
Uniqueness of left-eigenvector for eigenvalue 1 (from irreducibility) gives uniqueness of rank-one fixed point: $\mu = \pi$.

For non-rank-one fixed points: $v^* = v^* P$ means each row $v^*(s, \cdot)$ is a left-eigenvector.
By uniqueness, every row equals $\pi$ (up to scale, but stochasticity normalizes).
Hence the only stochastic-kernel fixed point is rank-one, equal to $\mathbf{1} \pi^T$. $\square$ (Step 2)

### Step 3: Closure ordinal in $\mathcal{V}$-Scott-continuous sense

The $\mathcal{V}$-supremum of an $\omega$-chain in $\mathcal{V} = ([0, 1], \cdot, +)$ with the standard order is the pointwise limit.
Per Step 1, $v_k \to v_\infty$ pointwise; this is the $\mathcal{V}$-supremum in the convergent sense.

Why $\kappa = \omega$ (not finite)?
Because for non-trivial $P$ (not already rank-one), $v_k \neq v_{k+1}$ for any finite $k$ — the spectral gap ensures geometric *decay* of $\|v_k - v_\infty\|$, but this is positive at every finite $k$.
So no finite stage realizes the fixed point exactly.

The closure operator $T_{\mathrm{stoch}}$ is $\mathcal{V}$-Scott-continuous (it's matrix multiplication, which is continuous in matrix entries).
It commutes with the $\omega$-directed sup.
Hence $T_{\mathrm{stoch}}(v_\omega) = v_\omega$, fixed-point achieved at $\omega$. $\square$ (Step 3)

Combining: the unique closure-fixed-point of $T_{\mathrm{stoch}}$ on a finite irreducible aperiodic chain is $\pi$ (the stationary distribution), with closure ordinal $\omega$ — placing this in the **Scott-continuous-V (asymptotic-c) regime** of the [continuous-state regime classification](continuous-state-regime-classification.md). $\blacksquare$

## Variations

**Periodic chains** ($P$ irreducible but periodic with period $d$). $P^k$ doesn't converge; instead, $P^{kd}$ converges to a block-diagonal projector.
The Cesaro average $\bar v_n := \frac{1}{n} \sum_{k=0}^{n-1} P^k$ does converge to $\mathbf{1} \pi^T$.
So the *Cesaro settling* exists at the same regime ($\omega$).

**Reducible chains**. $P$ has multiple communicating classes; the stationary distribution is supported only on recurrent classes.
Closure converges to a kernel that's rank-> 1 (one row per recurrent class).
The settling is still well-defined but the fixed point isn't rank-one.

**Absorbing chains**.
Some states are absorbing (loops with probability 1).
Closure converges to the absorbing-state distribution, achieving the fixed point in *finite* steps if the chain is finite and absorption-bounded. **Strict-V** regime in this case — placing absorbing chains as the stochastic analog of finite-graph shortest-path settling.

**Infinite chains**.
For countable $S$ (e.g., random walks on $\mathbb{Z}^d$), the convergence theory is more delicate — null-recurrence vs. transience matters.
Could land in TB-V or aperiodic-V regimes for pathological cases.

## Connection to other corpus theorems

This theorem identifies stochastic settling fixed points with classical Perron-Frobenius theory, paralleling the [Pisot accumulation = dominant image length theorem](pisot-accumulation-image-length-connection.md): both use the Perron-Frobenius eigenvector to identify settling-asymptotic content with structural matrix invariants.

A unified slogan: **the settling formalism turns Perron-Frobenius theory into a closure-2-monad fixed-point theorem.** Different value categories (Lawvere quantale, stochastic, bilattice) give different versions of the underlying matrix algebra; the same closure-2-monad structure produces fixed-point convergence in each.

This is the cleanest connection between the corpus's abstract framework and standard linear-algebraic dynamical systems theory.

## Position in the program

Establishes the stochastic side of Phase 2.2 with a clean Perron-Frobenius identification.

Pairs with: - The [stochastic settling](../objects/stochastic-settling.md) object — defines the underlying setting. - The [probabilistic belief-propagation benchmark](../examples/benchmark-probabilistic-belief-propagation.md) — concrete computation showing the convergence rate. - The [Pisot-accumulation = image-length theorem](pisot-accumulation-image-length-connection.md) — Perron-Frobenius parallel for substitution-flavored settling.

Open downstream: - *Mixing-time as closure-rate*: the closure rate $\rho$ from Step 1 gives the mixing time $T_{\mathrm{mix}} \approx 1 / (1 - \rho)$.
This identifies an analytic invariant (mixing time) with a settling-theoretic one (closure rate).
Whether the connection extends to TB-V or aperiodic-V cases is open. - *Stochastic Klein-four*: the bilattice Klein-four (negation, conflation, double) doesn't have an obvious stochastic analog.
For $\mathcal{V} = [0, 1]$ probabilities, "negation" is $1 - x$ (complement), but this doesn't commute with $T_{\mathrm{stoch}}$ in the usual way.
The Klein-four refinement for stochastic is open. - *Multi-observer stochastic settling*: each observer has a different transition kernel $P_o$; the [multi-observer system](../objects/multi-observer-system.md) framework lets us combine these.
The combined stationary distribution / settling is open and likely interesting (consensus probability across observers).
