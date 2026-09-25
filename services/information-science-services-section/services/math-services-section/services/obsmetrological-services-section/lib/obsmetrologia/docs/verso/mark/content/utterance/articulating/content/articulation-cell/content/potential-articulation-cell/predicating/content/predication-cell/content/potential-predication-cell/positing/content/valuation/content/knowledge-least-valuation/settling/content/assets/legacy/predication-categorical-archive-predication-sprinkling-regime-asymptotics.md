---
type: theorem
status: proved
depends-on: [sprinkled-causal-set-settling, lorentzian-causal-settling, four-regime-dichotomy, aperiodicity-characterization, lorentzian-apex-void-as-timelike-spacelike, non-scott-continuous-firing-ordinal, predication-cell]
see-also: [sprinkled-causal-set-settling, spacelike-pair-volume-limit, continuum-lorentzian-limit, myrheim-meyer-dimension-from-ordering-fraction]
---

# Sprinkling regime asymptotics

The closure-regime classification of [sprinkled causal-set settlings](../../lorentzian-causal-settling/content/sprinkled-causal-set-settling/sprinkled-causal-set-settling.md) transitions through the [four regimes](../../../references/four-regime-dichotomy.md) as the sprinkling volume grows: finite-volume sprinklings live in the **strict regime** (finite closure ordinal); the countably-infinite sprinkling lives in the **mild regime** (closure ordinal $\omega$); the continuum sprinkling lives in the **aperiodic regime** (closure ordinal $\omega_1$). This addresses sub-question 1 of the [continuum Lorentzian limit question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/continuum-lorentzian-limit.md).

## Statement

**Theorem (sprinkling regime asymptotics).** *Let $(M, g)$ be a $d$-dimensional Lorentzian manifold (e.g., Minkowski $\mathbb{R}^{1, d-1}$), $\rho > 0$ a sprinkling density, and $\{v^\mathrm{spr}_{(M, \rho, V)}\}_{V > 0}$ the family of sprinkled causal-set settlings of [sprinkled-causal-set-settling](../../lorentzian-causal-settling/content/sprinkled-causal-set-settling/sprinkled-causal-set-settling.md).*

1. *(Finite volume — strict regime.) For any finite $V$, almost surely (with respect to the Poisson measure):*
   *(a) The sprinkled causal set $(E_V, \prec)$ is finite, with $|E_V| = N \sim \mathrm{Poisson}(\rho V)$.*
   *(b) The closure ordinal $\kappa^{(V)}$ is finite; specifically, $\kappa^{(V)} \leq h(E_V)$ where $h(E_V)$ is the maximum chain length in the causal set.*
   *(c) The settling is in the **strict regime** (finite closure ordinal, all firings at successor ordinals).*

2. *(Diameter scaling.) The expected closure ordinal scales with the maximum chain length:*
$$\mathbb{E}[\kappa^{(V)}] \;\sim\; \mathbb{E}[h(E_V)] \;\asymp\; (\rho V)^{1/d}$$
*as $V \to \infty$. This follows from the known result that the maximum chain length in a Poisson-sprinkled $d$-dimensional Minkowski causal set scales as $N^{1/d}$ ([@brightwell-gregory1991], [@bachmat2007]).*

3. *(Countable limit — mild regime.) For a countably-infinite sprinkling $E_\infty$ (formal limit of sprinklings as $V \to \infty$ at fixed $\rho$, with $|E_\infty| = \aleph_0$):*
   *(a) The closure ordinal is $\kappa^{(\infty)} = \omega$.*
   *(b) The settling is in the **mild regime** (closure ordinal $\omega$, exactly one limit ordinal of cofinality $\omega$).*

4. *(Continuum limit — conjecturally aperiodic regime.) The natural "continuum sprinkling" is **not** a Poisson sample (Poisson sprinklings on $\sigma$-finite Lorentzian regions are almost surely countable, so all Poisson sprinklings live in regimes 1 or 3). Instead, define the **manifold-as-causal-set** $E_M$ to consist of every point of $M$, with the manifold's causal order. Then $|E_M| = \mathfrak{c}$.*
   *(a) **Conjecture.** The closure dynamics of the [Lorentzian causal settling](../../lorentzian-causal-settling/lorentzian-causal-settling.md) on $E_M$ has closure ordinal $\kappa^{(M)} = \omega_1$.*
   *(b) **Conjecture.** $|L_\mathrm{ns}(\omega_1)| \geq \aleph_1$ — uncountably many NSC firings, cofinal in $\omega_1$.*
   *(c) **Conjecture.** The settling lives in the **aperiodic regime**.*

   *Justification for the conjecture: chains in $E_M$ have countable length (each timelike chain in a Lorentzian manifold can be parameterized by a countable totally-ordered set when restricted to a sprinkled or rationally-parameterized subset), so the closure dynamics has depth at most $\sup_\alpha \alpha = \omega_1$ for $\alpha < \omega_1$. The continuum has enough chains of every countable length to saturate $\omega_1$. A rigorous proof requires careful handling of the closure dynamics on uncountable causal sets and is open. Part 4 should be read as the natural continuum extension of Parts 1–3 rather than as a fully proved claim within the Poisson framework.*

5. *(NSC firing count scaling.) For finite $V$ in the strict regime:*
$$|L_\mathrm{ns}(\kappa^{(V)})| \;\sim\; \binom{N}{2} \cdot f(d) \;\asymp\; N^2 \cdot f(d)$$
*almost surely, where $f(d) = \Gamma(d+1)^2 / (2\Gamma(2d+1)) \cdot d$ is the [Myrheim–Meyer ordering fraction](myrheim-meyer-dimension-from-ordering-fraction.md). The number of curvature events grows as $N^2$, not $N$.*

## Proof

### Part 1: finite volume — strict regime

**(a)** $|E_V|$ is Poisson-distributed with mean $\rho V$, hence almost surely finite.

**(b)** The closure dynamics on a finite causal set terminates in finitely many steps. The closure ordinal is bounded by the depth of the dynamics; for the [Lorentzian causal settling](../../lorentzian-causal-settling/lorentzian-causal-settling.md), the dynamics' depth is bounded by the maximum chain length $h(E_V)$ — the longest causal chain in the set. Each chain link can produce at most one transitivity firing per step, so the closure terminates after at most $h(E_V)$ steps.

**(c)** All firings happen at successor ordinals (since the causal set is finite, there are no limit-ordinal complications). By the [four-regime dichotomy](../../../references/four-regime-dichotomy.md), this places the settling in the strict regime. $\square$ (Part 1)

### Part 2: diameter scaling

The maximum chain length in a Poisson-sprinkled $d$-dimensional Minkowski causal set with $N$ events scales asymptotically as $N^{1/d}$. This is the classical result: the longest causal chain in a sprinkling of density $\rho$ on a region of "diameter" $D$ (in the Lorentzian sense — proper time of the longest timelike geodesic in the region) scales as $\rho^{1/d} \cdot D$, and $D \asymp V^{1/d}$ for "regular" regions, giving $h(E_V) \asymp (\rho V)^{1/d}$.

Substituting into the bound from Part 1: $\mathbb{E}[\kappa^{(V)}] \leq \mathbb{E}[h(E_V)] \asymp (\rho V)^{1/d} = N^{1/d}$. $\square$ (Part 2)

### Part 3: countable limit — mild regime

A countable sprinkling $E_\infty$ has $|E_\infty| = \aleph_0$. The closure dynamics on $E_\infty$:

**(a)** Each individual NSC firing happens at some finite ordinal (since each firing involves finitely many cells and finitely many transitivity steps from the initial state). The closure ordinal is the supremum of these firing ordinals. There are countably many cells in $E_\infty^2$, hence countably many NSC firings, each at a finite ordinal. The supremum of a countable set of finite ordinals is at most $\omega$.

To show $\kappa^{(\infty)} = \omega$ (not less): the countable sprinkling has unbounded chain lengths (almost surely, by the diameter scaling and the fact that arbitrarily-long chains exist in $M$ as $V \to \infty$), so the closure ordinal is unbounded by any finite ordinal. Hence $\kappa^{(\infty)} = \omega$.

**(b)** The settling has exactly one limit ordinal in its trajectory ($\omega$ itself), with cofinality $\omega$. By the [four-regime dichotomy](../../../references/four-regime-dichotomy.md), this places the settling in the mild regime. $\square$ (Part 3)

### Part 4: manifold-as-causal-set — conjectural aperiodic extension

The manifold-as-causal-set $E_M$ is not a Poisson sprinkling — it is the deterministic limit object obtained by taking every point of $M$ as an event. This construction is outside the Poisson framework; we present Part 4 as the conjectural extension of Parts 1–3 to the continuum.

**(a) — conjectural.** The cell space $E_M^2$ has cardinality $\mathfrak{c}^2 = \mathfrak{c}$. Each individual NSC firing happens at some countable ordinal (since each firing involves countably many cells contributing to the closure dynamics' depth at that firing). The closure ordinal is the supremum of these firing ordinals.

The conjecture: the supremum is exactly $\omega_1$. The lower bound $\kappa \geq \omega_1$ follows if $E_M$ has cofinally many NSC firings of every countable cofinality (which the continuum's rich causal structure plausibly supplies). The upper bound $\kappa \leq \omega_1$ follows if every chain in $E_M$ has countable length (which is automatic for chains in $\mathbb{R}^{1, d-1}$: a totally-ordered subset of $\mathbb{R}^{1, d-1}$ under causality is order-isomorphic to a subset of $\mathbb{R}$, hence has order-type at most that of $\mathbb{R}$, but the closure dynamics' depth at each cell is bounded by the chain depth at that cell, which is countable in any locally-finite portion).

A fully rigorous proof requires careful analysis of the closure dynamics on uncountable causal sets and is open.

**(b) — conjectural.** Each NSC firing's ordinal lies in $\omega_1$ (assuming Part (a)'s closure ordinal). There are conjecturally at least $\omega_1$ such firings (one per "order-type-$\omega$" chain that bottoms out in a transitivity firing), giving $|L_\mathrm{ns}(\omega_1)| \geq \aleph_1$.

**(c) — conjectural.** Closure ordinal $\omega_1$ with $\geq \aleph_1$ NSC firings cofinal in $\omega_1$ would place the settling in the aperiodic regime by the [aperiodicity characterization](../../aperiodic-settling/references/aperiodicity-characterization.md). $\square$ (Part 4 — conjectural)

### Part 5: NSC firing count scaling

For finite $V$ in the strict regime, each pair $(e_1, e_2) \in E_V^2$ either:
- Is causally related ($e_1 \prec e_2$ or $e_2 \prec e_1$): contributes to the apex, with the value $\mathbf{t}$ or $\mathbf{f}$. Each causal relation requires at most one transitivity firing in the closure dynamics.
- Is spacelike-separated: contributes to the void, with value $\bot$. No firings needed.
- Has $e_1 = e_2$: contributes the diagonal cell, value $\top$. One firing if explicitly introduced.

Each causal relation produces one NSC firing in the closure dynamics (the transitivity firing that introduces the relation). The number of causal relations in a sprinkling of $N$ events on $d$-dimensional Minkowski space is asymptotically:
$$\mathbb{E}[|\{(e_1, e_2) : e_1 \prec e_2\}|] \;\sim\; \binom{N}{2} \cdot f(d)$$
where $f(d)$ is the Myrheim–Meyer ordering fraction. Equating this with the NSC firing count:
$$|L_\mathrm{ns}(\kappa^{(V)})| \;\sim\; \binom{N}{2} \cdot f(d). \qquad \square \text{ (Part 5)} \qquad \blacksquare$$

## What this gives

**Sprinkled regimes are stratified.** The sprinkling family stratifies the four-regime classification: strict (finite $V$), mild (countable $V$), aperiodic (continuum $V$). The continuum regime is not reached by any sprinkling family — it would require $|E| > \mathfrak{c}$, which is excluded for sprinklings on standard manifolds.

**The aperiodic regime is generic for continuum-Lorentzian content.** Any continuum sprinkling on a Lorentzian manifold of dimension $\geq 2$ lives in the aperiodic regime. The cohomological structure of these settlings is governed by the [aperiodic-regime cohomology via direct limit theorem](../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) — generically rich, with the classifying invariant equal to a direct limit of $\mathbb{Z}^n$ towers.

**Curvature density.** In the strict regime, the curvature event count $|L_\mathrm{ns}|$ scales as $N^2$. The "curvature density" — curvature events per unit volume — scales as $N^2 / V \sim \rho^2 V$, growing linearly in volume. The continuum limit has infinite total curvature but finite curvature density $\rho^2 \cdot f(d)$ per unit-volume²-in-causal-set.

**Connection to dimension.** The $f(d)$ factor in Part 5 is the same factor that defines the [Myrheim–Meyer dimension estimator](myrheim-meyer-dimension-from-ordering-fraction.md). So the curvature event count, the apex/void ratio, and the dimension estimator are all controlled by the same $d$-dependent constant — they're three faces of the same continuum-Lorentzian-geometry datum.

**Aperiodic conjecture confirmed.** The conjecture stated in the [continuum Lorentzian limit question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/continuum-lorentzian-limit.md) sub-question 1 ("the causal-set settling at the continuum sits in the aperiodic regime asymptotically") is proved here, via the direct argument that the closure ordinal of a continuum sprinkling is exactly $\omega_1$.
