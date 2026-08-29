---
type: example
status: verified
depends-on: [stochastic-settling, stochastic-stationary-as-settling, continuous-state-regime-classification]
---

# Probabilistic belief-propagation: Markov chains as stochastic settlings

A concrete instance of [stochastic settling](../objects/stochastic-settling.md) on four small Markov chains, verifying the [stochastic-stationary-as-settling theorem](../theorems/stochastic-stationary-as-settling.md). Each chain's settling converges to its stationary distribution at a geometric rate determined by the second eigenvalue.

## Setup

For each transition matrix $P$, iterate $v_{k+1} := v_k \cdot P$ from $v_0 = I$ (identity). Track:

- *Convergence rate*: $\| v_k - \mathbf{1} \pi^T \|_\infty$ vs. $k$.
- *Empirical $\rho$*: ratio $\| v_k - \mathbf{1} \pi^T \| / \| v_{k-1} - \mathbf{1} \pi^T \|$ at large $k$.
- *Firing pattern*: for each cell $(s, o)$, the first $k$ at which $v_k(s, o) > 0$.

Tool: `tools/predication_categories/theorems/stochastic_stationary_as_settling.py`.

## Results

### Case 1: Random walk on $K_3$ triangle

$$P = \tfrac{1}{2} \begin{pmatrix} 0 & 1 & 1 \\ 1 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}, \quad \pi = (1/3, 1/3, 1/3).$$

Empirical $\rho \approx 0.500$. Theoretical: $P$ has eigenvalues $\{1, -1/2, -1/2\}$, so $\rho = 1/2$ exactly. ✓

Iterations to tolerance $10^{-12}$: **40**. Firing pattern: 3 cells fire at step 0 (diagonal, $v_0 = I$), 6 cells fire at step 1 (all off-diagonal, since the graph is fully connected after one step).

### Case 2: Birth-death chain on 4 states

$$P = \begin{pmatrix} 0.5 & 0.5 & 0 & 0 \\ 0.3 & 0.4 & 0.3 & 0 \\ 0 & 0.3 & 0.4 & 0.3 \\ 0 & 0 & 0.5 & 0.5 \end{pmatrix}, \quad \pi = (0.1875, 0.3125, 0.3125, 0.1875).$$

Empirical $\rho \approx 0.736$. Iterations to tolerance: **87**.

Firing pattern: 4 cells at step 0, 6 at step 1, 4 at step 2, 2 at step 3. Cell $(s, o)$ first fires at step $k = |s - o|$ — the graph distance in the path topology underlying the chain. **The firing pattern matches the Boolean reachability settling on the support graph.**

### Case 3: Lazy walk on 4-line (slow-mixing)

$$P = \begin{pmatrix} 0.9 & 0.1 & 0 & 0 \\ 0.1 & 0.8 & 0.1 & 0 \\ 0 & 0.1 & 0.8 & 0.1 \\ 0 & 0 & 0.1 & 0.9 \end{pmatrix}, \quad \pi = (0.25, 0.25, 0.25, 0.25).$$

Empirical $\rho \approx 0.940$. Iterations to tolerance: **444**.

The lazy walk has a much smaller spectral gap, leading to slow mixing — settling takes 11x longer than the birth-death chain. The firing pattern is the same as Case 2 (same support graph), but the **settling rate** differs dramatically.

This is a clean instance of the *value-coefficient regime decoupled from the iteration regime*: both Cases 2 and 3 are formally Scott-continuous-V (asymptotic-c) with $\kappa = \omega$, but their convergence rates within the asymptotic class differ by an order of magnitude.

### Case 4: Absorbing chain (state 2 absorbs)

$$P = \begin{pmatrix} 0.5 & 0.5 & 0 \\ 0 & 0.5 & 0.5 \\ 0 & 0 & 1 \end{pmatrix}, \quad \pi = (0, 0, 1).$$

Empirical $\rho \approx 0.517$. Iterations to tolerance: **46**.

Firing pattern: 3 cells at step 0, 2 at step 1, 1 at step 2, **3 cells NEVER fire**.

The never-firing cells are $(1, 0), (2, 0), (2, 1)$ — cells encoding "transition from a state $\geq 1$ to a state $\leq 0$." Since the chain has no backward transitions and state 2 is absorbing, these cells stay at $v_k(s, o) = 0$ for all $k$.

**These are the void cells in the stochastic instance of the [value-agnostic void cone theorem](../theorems/value-agnostic-void-cone.md)**: the closure-trivial element is $\mathbf{0}_\mathcal{V} = 0$ (probability zero), and $V_\infty$ is the set of cells permanently at this element. The 3 never-firing cells form $V_\infty$, giving a void cone $H^0$ of rank 3 — the 3 structurally-impossible transitions in the chain's support graph.

## Empirical findings

### 1. Convergence rate is exactly the spectral gap

In every case, the empirical $\rho$ matched the second-largest eigenvalue magnitude (computed independently). This is the [stochastic-stationary-as-settling theorem](../theorems/stochastic-stationary-as-settling.md)'s rate claim, verified on real chains.

### 2. Firing pattern $=$ shortest-path-on-support-graph

Cell $(s, o)$ first fires at step $k = $ (length of shortest path from $s$ to $o$ in the support graph of $P$). The firing skeleton is purely combinatorial — same as the Boolean reachability settling on the support graph. The probability values are continuous content layered on this skeleton.

This matches the [continuous-state regime classification](../theorems/continuous-state-regime-classification.md)'s decoupling: firing pattern lives at the *iteration regime*, value content lives at the *value-coefficient* level.

### 3. The void cone in the stochastic value category

Case 4 (absorbing) has 3 cells permanently at $v_k(s, o) = 0$. Per the [value-agnostic void cone theorem](../theorems/value-agnostic-void-cone.md), these form $V_\infty$ — the void cone's apex in the stochastic value category $(\mathcal{V} = [0,1], \mathbf{0}_\mathcal{V} = 0)$. The void $H^0$ has rank equal to $|V_\infty|$.

The interpretation: structurally-impossible transitions (no path of positive probability exists in the support graph) sit at the closure-trivial element 0, not at "small probability." The framework distinguishes between "low-probability transition that exists" and "transition that's structurally impossible" — the latter is exactly what the void cone records.

Note the value-category distinction: the bilattice's $\bot$-void and the stochastic semiring's $0$-void are the same structural object (the closure-trivial element of $\mathcal{V}$), instantiated in different value categories. The value-agnostic theorem makes the structural identification precise.

### 4. Slow-mixing is real, not pathological

Case 3 (lazy walk) takes 444 iterations to tolerance — 11x longer than Case 2 with the same firing skeleton. Both are formally Scott-continuous-V, but the *quantitative* convergence rate is very different.

This argues for a refinement of the regime classification: within Scott-continuous-V, the *spectral gap* $1 - \rho$ is a continuous invariant — distinguishing fast-mixing from slow-mixing settlings. Open: whether this refinement integrates with predication categories' existing cohomological invariants.

## Position in predication categories

First explicit stochastic-settling benchmark. Verifies the stochastic-stationary-as-settling theorem on four chains spanning fast-mixing, slow-mixing, and absorbing cases.

Pairs with:
- The [stochastic settling object](../objects/stochastic-settling.md) — defines the underlying setting.
- The [stochastic-stationary-as-settling theorem](../theorems/stochastic-stationary-as-settling.md) — the rate claim verified here.
- The [Lawvere-quantale settling benchmark](benchmark-lawvere-quantale-settling.md) — companion benchmark on the dual value category.

Open downstream:
- *Quantitative refinement of asymptotic-c*: spectral gap as a continuous invariant within the asymptotic-c regime. Possible refinement of the four-regime classification.
- *Stochastic Klein-four orbits*: the bilattice Klein-four group acts on bilattice-valued settlings; what's the stochastic analog? Probability-complement ($p \mapsto 1 - p$) is a candidate negation, but its compatibility with $T_{\mathrm{stoch}}$ is unclear.
- *Multi-observer stochastic settlings*: each observer with their own kernel $P_o$; consensus/disagreement structure on stationary distributions.
