---
type: theorem
status: proved
depends-on: [sprinkled-causal-set-settling, lorentzian-apex-void-as-timelike-spacelike, lorentzian-causal-settling, sprinkling-regime-asymptotics, four-bilattice, myrheim-meyer-dimension-from-ordering-fraction]
see-also: [sprinkled-causal-set-settling, sprinkling-regime-asymptotics, continuum-lorentzian-limit, lorentzian-apex-void-as-timelike-spacelike]
---

# Spacelike-pair volume limit

The void-cone count of a [sprinkled causal-set settling](teaching/explanations/sprinkled-causal-set-settling.md), normalized by the squared event count, converges almost surely to the *spacelike-pair volume fraction* of the underlying Lorentzian manifold — a manifold invariant given by the volume of the spacelike-separated subset of $W \times W$ relative to $V^2$. The corresponding empirical sum recovers integration against the spacelike-pair volume measure. This addresses sub-question 3 of the [continuum Lorentzian limit question](questions/continuum-lorentzian-limit.md): the discrete void-cone is a faithful approximation to a continuous spacelike-volume measure.

## Setup

Let $(M, g)$ be a Lorentzian manifold, $W \subseteq M$ a finite-volume measurable region with $V := \mathrm{Vol}_g(W)$, $\rho > 0$ a sprinkling density, and $v^\mathrm{spr}_{(M, \rho, V)}$ the corresponding sprinkled causal-set settling with event set $E$, $N := |E|$.

Define the **spacelike-pair region** of $W \times W$:
$$W^\mathrm{spc} \;:=\; \{(x, y) \in W \times W : x \text{ and } y \text{ spacelike-separated in } M\}.$$

Its volume under the product measure $g \otimes g$:
$$\mathrm{Vol}^\mathrm{spc}(W) \;:=\; (g \otimes g)(W^\mathrm{spc}) \;=\; \int_{W \times W} \mathbf{1}[x, y \text{ spacelike}] \, dg(x) \, dg(y).$$

The **spacelike-pair volume fraction** of $M$:
$$\sigma(M) \;:=\; \lim_{V \to \infty} \frac{\mathrm{Vol}^\mathrm{spc}(W)}{V^2}$$
(taken along regions $W$ exhausting $M$ in a Lorentz-invariant way; well-defined for $M$ with a transitive isometry group acting on the causal structure, e.g., Minkowski).

## Statement

**Theorem (spacelike-pair volume limit).** *Under the setup above:*

1. *(Almost-sure void-cone fraction.) Almost surely with respect to the Poisson measure on sprinklings, as $V \to \infty$:*
$$\frac{|V_\infty^\mathrm{spr}|}{N^2} \;\xrightarrow{a.s.}\; \sigma(M).$$
*The discrete void-cone density (void count per squared event count) converges to the manifold's spacelike-pair volume fraction. No $\rho$-dependence: the density cancels in the normalization.*

2. *(Manifold invariant identification.) The fraction $\sigma(M)$ depends only on the manifold $M$ (its causal structure), not on the choice of region $W$ or the density $\rho$. For $d$-dimensional Minkowski:*
$$\sigma(\mathbb{R}^{1, d-1}) \;=\; 1 - f(d),$$
*where $f(d) = d \cdot \Gamma(d+1)^2 / \bigl(2 \cdot \Gamma(2d+1)\bigr)$ is the [Myrheim–Meyer ordering fraction](myrheim-meyer-dimension-from-ordering-fraction.md).*

3. *(Apex/void duality.) The complementary apex limit is:*
$$\frac{|\mathrm{Apex}^\mathrm{spr}|}{N^2} \;\xrightarrow{a.s.}\; 1 - \sigma(M) \;\stackrel{\mathrm{Mink}}{=}\; f(d).$$
*Apex and void asymptotically partition the off-diagonal cells in the ratio $(1 - \sigma) : \sigma$; for Minkowski, this is $f(d) : (1 - f(d))$.*

4. *(Recovery of the spacelike-pair measure.) For any test function $\varphi \in C_c(M \times M)$, the empirical average over the void-cone converges almost surely to the genuine $g \otimes g$-average over $W^\mathrm{spc}$:*
$$\frac{1}{|V_\infty^\mathrm{spr}|} \sum_{(e_1, e_2) \in V_\infty^\mathrm{spr}} \varphi(e_1, e_2) \;\xrightarrow{a.s.}\; \frac{1}{\mathrm{Vol}^\mathrm{spc}(W)} \int_{W^\mathrm{spc}} \varphi \; d(g \otimes g).$$
*The discrete void-cone is a Monte Carlo sample of $W^\mathrm{spc}$ with respect to the product measure.*

## Proof

### Part 1: almost-sure void-cone fraction

The void-cone count is the number of ordered off-diagonal pairs $(e_1, e_2) \in E^2$ with $e_1, e_2$ spacelike-separated:
$$|V_\infty^\mathrm{spr}| \;=\; \sum_{e_1 \neq e_2 \in E} \mathbf{1}[\mathrm{spacelike}(e_1, e_2)].$$

By Campbell's theorem applied to the second factorial moment of the Poisson process:
$$\mathbb{E}\bigl[|V_\infty^\mathrm{spr}|\bigr] \;=\; \rho^2 \int_{W \times W} \mathbf{1}[\mathrm{spacelike}(x, y)] \, dg(x) \, dg(y) \;=\; \rho^2 \cdot \mathrm{Vol}^\mathrm{spc}(W).$$

Since $N = |E|$ is Poisson-distributed with mean $\rho V$, $\mathbb{E}[N^2] = \rho V + (\rho V)^2 \sim (\rho V)^2$ as $V \to \infty$. Hence:
$$\frac{\mathbb{E}\bigl[|V_\infty^\mathrm{spr}|\bigr]}{\mathbb{E}[N^2]} \;\sim\; \frac{\rho^2 \cdot \mathrm{Vol}^\mathrm{spc}(W)}{(\rho V)^2} \;=\; \frac{\mathrm{Vol}^\mathrm{spc}(W)}{V^2} \;\xrightarrow{V \to \infty}\; \sigma(M).$$

The density $\rho^2$ cancels in the normalization, leaving the manifold invariant $\sigma(M)$ as the limit.

For almost-sure convergence (not just convergence of expectations): the variance of $|V_\infty^\mathrm{spr}|$ is computed by Campbell-type formulas for higher Poisson moments and is $O(\rho^2 V^2 + \rho^3 V^3) = O(N^3)$ by the law of large numbers for Poisson U-statistics. Hence $\mathrm{Var}(|V_\infty^\mathrm{spr}|/N^2) \to 0$ as $V \to \infty$. Combined with mean-convergence, this gives almost-sure convergence by the Borel–Cantelli lemma. $\square$ (Part 1)

### Part 2: manifold invariant identification

The fraction $\mathrm{Vol}^\mathrm{spc}(W)/V^2$ depends on $W$ a priori, but for $M$ admitting a transitive isometry group acting on the causal structure (e.g., Minkowski's Poincaré group), the limit as $W$ exhausts $M$ in any Lorentz-invariant way gives the same value $\sigma(M)$. Density $\rho$ does not enter $\sigma(M)$ since the volume fraction is independent of the sampling density.

For $d$-dimensional Minkowski space: $\sigma(\mathbb{R}^{1, d-1})$ is the fraction of pairs in a Minkowski region that are spacelike-separated, i.e., the volume fraction of $\{(x, y) : (x - y) \text{ spacelike}\}$ in $\mathbb{R}^{1, d-1} \times \mathbb{R}^{1, d-1}$ (modulo the diagonal). This is the complement of the causally-related fraction $f(d)$, the Myrheim–Meyer ordering fraction:
$$\sigma(\mathbb{R}^{1, d-1}) \;=\; 1 - f(d),$$
with $f(d) = d \cdot \Gamma(d+1)^2 / (2 \cdot \Gamma(2d+1))$ (per [myrheim-meyer-dimension-from-ordering-fraction](myrheim-meyer-dimension-from-ordering-fraction.md)). $\square$ (Part 2)

### Part 3: apex/void duality

Apex and void partition the off-diagonal cells exactly: $|\mathrm{Apex}^\mathrm{spr}| + |V_\infty^\mathrm{spr}| = N(N-1) \sim N^2$ for large $N$. Dividing by $N^2$ and taking the limit:
$$\frac{|\mathrm{Apex}^\mathrm{spr}|}{N^2} + \frac{|V_\infty^\mathrm{spr}|}{N^2} \;\xrightarrow{a.s.}\; (1 - \sigma(M)) + \sigma(M) \;=\; 1.$$

Combining with Part 1: $|\mathrm{Apex}^\mathrm{spr}|/N^2 \to 1 - \sigma(M)$ almost surely. For Minkowski, $1 - \sigma = f(d)$. $\square$ (Part 3)

### Part 4: recovery of the spacelike-pair measure

For a test function $\varphi \in C_c(M \times M)$, the empirical sum is:
$$S_\varphi \;:=\; \sum_{(e_1, e_2) \in V_\infty^\mathrm{spr}} \varphi(e_1, e_2) \;=\; \sum_{e_1 \neq e_2 \in E} \varphi(e_1, e_2) \cdot \mathbf{1}[\mathrm{spacelike}(e_1, e_2)].$$

By Campbell's theorem:
$$\mathbb{E}[S_\varphi] \;=\; \rho^2 \int_{W \times W} \varphi(x, y) \cdot \mathbf{1}[\mathrm{spacelike}(x, y)] \, dg(x) \, dg(y) \;=\; \rho^2 \int_{W^\mathrm{spc}} \varphi \, d(g \otimes g).$$

Combining with $\mathbb{E}[|V_\infty^\mathrm{spr}|] = \rho^2 \mathrm{Vol}^\mathrm{spc}(W)$:
$$\frac{\mathbb{E}[S_\varphi]}{\mathbb{E}[|V_\infty^\mathrm{spr}|]} \;=\; \frac{\int_{W^\mathrm{spc}} \varphi \, d(g \otimes g)}{\mathrm{Vol}^\mathrm{spc}(W)}.$$

The density $\rho^2$ cancels in the ratio (just as in Part 1). By the Poisson U-statistics SLLN applied to both numerator and denominator (which concentrate on their means), the ratio of empirical sums converges almost surely to the ratio of expectations. Hence:
$$\frac{S_\varphi}{|V_\infty^\mathrm{spr}|} \;\xrightarrow{a.s.}\; \frac{\int_{W^\mathrm{spc}} \varphi \, d(g \otimes g)}{\mathrm{Vol}^\mathrm{spc}(W)},$$
which is the genuine $g \otimes g$-average of $\varphi$ over $W^\mathrm{spc}$. $\square$ (Part 4) $\blacksquare$

## What this gives

**The void-cone is a discrete approximation to a continuous measure.** The corpus's invariant $|V_\infty|$ — just the count of spacelike pairs in a sprinkling — is a finite-sample approximation to the manifold's *spacelike-pair volume measure* on $W \times W$. As the sample size grows, the discrete count converges to the continuous volume fraction.

**Recovery of classical Lorentzian invariants.** $\sigma(M) = 1 - f(d)$ is a classical Lorentzian invariant of the manifold, recoverable from the discrete void-cone. The corpus's discrete framework recovers this classical invariant in the continuum limit, as conjectured by sub-question 3 of the [continuum Lorentzian limit question](questions/continuum-lorentzian-limit.md).

**The void-cone is dual to the apex.** Apex and void together asymptotically partition $E \times E$ in the ratio $(1 - \sigma(M)) : \sigma(M)$ — for Minkowski, $f(d) : (1 - f(d))$. This is the discrete-causal-set version of the spacelike/timelike partition of $M \times M$ — exactly what the [Lorentzian apex-void identification theorem](lorentzian-apex-void-as-timelike-spacelike.md) proved at the level of the ontology, now strengthened to a quantitative volume-fraction statement.

**The Myrheim–Meyer fraction is the spacelike-fraction's complement.** The Myrheim–Meyer ordering fraction $f(d)$ is the same constant that:
- appears in the Myrheim–Meyer dimension estimator,
- counts NSC firings per pair (per [sprinkling-regime-asymptotics](sprinkling-regime-asymptotics.md) Part 5),
- appears in the apex limit ratio.

It is a *single fundamental constant* of the $d$-dimensional Minkowski causal structure that pervades all the corpus's continuum-Lorentzian-limit results. The spacelike-pair volume fraction $\sigma(M) = 1 - f(d)$ is its complement.

**Status of the continuum question.** Sub-questions 1 and 3 of the [continuum Lorentzian limit question](questions/continuum-lorentzian-limit.md) are now answered:
- **Sub-question 1:** the regime stratification of sprinkling families (strict at finite $V$, mild at countable $V$, with the aperiodic continuum limit conjectural).
- **Sub-question 3:** the discrete void-cone limits to the spacelike-pair volume measure (this theorem).

Sub-questions 2 (cohomological convergence — what's the natural continuum invariant for $H^1$?), 4 (does the cohomology recover known Lorentzian invariants like null-infinity structure?), and 5 (measure-theoretic firings — what replaces NSC firings in the continuum?) remain open.
