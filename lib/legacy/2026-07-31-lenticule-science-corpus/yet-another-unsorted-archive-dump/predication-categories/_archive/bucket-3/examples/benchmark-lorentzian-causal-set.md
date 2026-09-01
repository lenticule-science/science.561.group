---
kind: example
status: verified
depends-on: [lorentzian-causal-settling, lorentzian-apex-void-as-timelike-spacelike]
---

# Lorentzian causal-set settlings: sprinkled 1+1 Minkowski

A concrete computation of the [Lorentzian causal-structure settling](../objects/lorentzian-causal-settling.md) on five causal sets — a hand-built diamond and four uniformly-sprinkled regions of 1+1 Minkowski spacetime. Verifies the [timelike/spacelike as apex/void theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md) and exhibits aspect-ratio-dependent spacelike content.

## Setup

For each test:

1. Place $N$ events in a region $[0, T] \times [-X, X]$ of 1+1 Minkowski spacetime.
2. Compute the elementary causal links (Hasse covers): $e_i \to e_j$ iff $e_i$ in past lightcone of $e_j$ and no intermediate event lies between.
3. Iterate the parallel transitive-closure operator (the corpus's Lorentzian-causal closure $T_{\mathrm{caus}}$).
4. Track: closure ordinal $\kappa$, apex (causal pairs), void (spacelike pairs), per-iteration firings.

The seed is the **link relation** (not the full causal relation) so the closure has nontrivial work to do — the settling builds up the full causal precedence from elementary links.

Tool: `tools/lorentzian-causal-set/sprinkle.py`.

## Results

| Test | $N$ | Region $T \times 2X$ | Seed links | $\kappa$ | Apex (causal) | Void (spacelike) | Spacelike fraction |
|---|---|---|---|---|---|---|---|
| Diamond | 4 | $2 \times 2$ | 4 | 1 | 5 | 1 | 0.167 |
| Sprinkled (sq) | 8 | $4 \times 4$ | 10 | 2 | 16 | 12 | 0.429 |
| Sprinkled (sq) | 16 | $4 \times 4$ | 26 | 2 | 58 | 62 | 0.517 |
| Wide $T < X$ | 16 | $2 \times 8$ | 16 | 2 | 21 | 99 | **0.825** |
| Tall $T > X$ | 16 | $8 \times 2$ | 21 | 3 | 94 | 26 | **0.217** |

(Apex counted as undirected pairs $\{e_1, e_2\}$ that are causally connected.)

## Empirical findings

### 1. Aspect ratio determines spacelike fraction

The sprinklings show clear dependence of the spacelike fraction on the region's aspect ratio:

- *Square ($T \approx X$)*: ~50% spacelike — events are roughly evenly causally connected and disconnected.
- *Wide ($T < X$)*: 82.5% spacelike — most events are spacelike-separated because spatial extent dominates the lightcone reach.
- *Tall ($T > X$)*: 21.7% spacelike — most events are causally connected because temporal extent allows chains of causation.

This is exactly the Lorentzian-geometric prediction: in a rectangular region, the fraction of spacelike pairs equals the fraction of point-pairs whose spatial separation exceeds their temporal separation. For a region of dimensions $T \times 2X$ (uniform sprinkling), this fraction is computable analytically.

The corpus's *void / apex* counts directly track this Lorentzian-geometric content. **The void cone's apex content is the sprinkled-region geometry, recast in closure-2-monad form.**

### 2. Closure ordinal scales with longest causal chain

The closure ordinal $\kappa = \lceil \log_2(\text{longest chain depth}) \rceil$ for parallel relaxation:

- Diamond: longest chain $a \to b \to d$ (length 2). $\kappa = 1$.
- Square sprinklings: longest chain $\sim 3-4$. $\kappa = 2$.
- Tall region: longest chain $\sim 7-8$ events deep. $\kappa = 3$.

Matches the parallel-relaxation log-scaling from the [Lawvere-quantale benchmark](benchmark-lawvere-quantale-settling.md).

### 3. Diamond verifies the manual computation

The hand-built diamond ($a, b, c, d$ with $a$ in past of $b, c$; $b, c$ in past of $d$) gives exactly:

- Apex (5 causal pairs): $\{a, b\}, \{a, c\}, \{a, d\}, \{b, d\}, \{c, d\}$.
- Void (1 spacelike pair): $\{b, c\}$.

This matches the manual analysis in [the Lorentzian causal-settling object](../objects/lorentzian-causal-settling.md). The 1 spacelike pair is the structural-impossibility content: $b$ and $c$ are spatially separate, no causal connection in either direction. **This is the void cone's apex** — the structurally-spacelike content per [the timelike/spacelike apex/void theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md).

### 4. Cohomological content

For each test, the apex cohomology $H^1(\mathcal{F}_v)$ has rank equal to the number of *transitivity firings* — cells that became causal at the closure step (not at seed time). Counts:

- Diamond: 1 firing (the $(a, d)$ closure). $H^1 = \mathbb{Z}^1$.
- Square N=8: 6 firings (16 final - 10 seed = 6). $H^1 = \mathbb{Z}^6$.
- Square N=16: 32 firings. $H^1 = \mathbb{Z}^{32}$.
- Wide N=16: 5 firings. $H^1 = \mathbb{Z}^5$.
- Tall N=16: 73 firings. $H^1 = \mathbb{Z}^{73}$.

(These are pre-quotient ranks; settling-shift quotient could reduce them.)

The void cohomology $H^0(\mathrm{Void})$ has the same rank by the apex/void duality — same firings, dually counted.

The **apex of void** $V_\infty$ has counts:
- Diamond: 1 (the $\{b, c\}$ pair).
- Sprinklings: equal to the spacelike-pair count (the 12, 62, 99, 26 columns).

This is the *dimension-detecting* invariant: more spacelike content $\Leftrightarrow$ wider spatial extent.

## Connection to physics

The corpus's framework, applied to causal sets, recovers the basic structural content of Lorentzian geometry:

- *Causal precedence relation*: corpus's apex.
- *Spacelike separation*: corpus's void.
- *Aspect-ratio-dependent spatial fraction*: corpus's void-apex content.
- *Lightcone-bounded transitivity*: corpus's closure operator.

The corpus's cohomological invariants ($H^1$ apex, $H^0$ void, $V_\infty$ apex-of-void) give a complete structural picture of the causal set, with each invariant having a Lorentzian-geometric interpretation.

The Myrheim-Meyer dimension estimator from causal-set physics has a corresponding invariant in the corpus framework: the ratio $|V_\infty| / (n(n-1)/2)$ (spacelike fraction) is geometric-aspect-sensitive, parallel to Myrheim-Meyer's interval-ratio estimator. Whether the two estimators are *exactly* the same is open — but they're structurally analogous.

## What this benchmark establishes

- The corpus's framework genuinely captures Lorentzian causal-set structure.
- The apex/void duality matches timelike/spacelike duality empirically (verified on diamond exactly, on sprinklings with aspect-ratio scaling).
- Closure ordinals are bounded ($\kappa \leq 3$ for $N = 16$): finite causal sets are always strict-regime.
- The cohomological invariants ($H^1$, $H^0(\mathrm{Void})$, $V_\infty$) are computable and interpretable as Lorentzian-physical content.

## Position in the program

First explicit physics-flavored benchmark. Verifies the corpus's framework on a non-trivial application domain (causal-set quantum gravity).

This is **Phase 3.2 complete**. Pairs with:
- The [Lorentzian causal-settling object](../objects/lorentzian-causal-settling.md).
- The [timelike/spacelike as apex/void theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md).
- The Phase 2 benchmarks ([Lawvere-quantale](benchmark-lawvere-quantale-settling.md), [stochastic](benchmark-probabilistic-belief-propagation.md), [n-ary](benchmark-causal-triples-3-ary.md)) — companion benchmarks under different value categories and arities.

Open downstream:
- *Continuum limit benchmark*: take $N \to \infty$ with density $\rho$ fixed; verify cohomology converges to a continuum invariant (ideally connecting to a Minkowski-spacetime measure-theoretic quantity).
- *Higher-dimensional Minkowski sprinklings*: 2+1 and 3+1 cases. Aspect-ratio dependence on multiple spatial dimensions.
- *Non-Minkowski causal sets*: causal sets sprinkled in cosmological metrics (de Sitter, FRW). Cohomological signatures of cosmological constants and matter content.
