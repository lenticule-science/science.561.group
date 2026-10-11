---
description: Survey of the value-category specializations of predication settlings — continuous-valued settlings over a Lawvere quantale or residuated lattice, stochastic settlings over the probability semiring, Lorentzian causal-structure settlings on causal sets, and distributed settling systems with $\vee_k$-merge across replicas.
status: draft
session-date: 2026-05-19
---

## Scope

This survey records the value-category specializations of predication settlings as they stand in the library at `theories/.../predication-categories/code/structures/`. It covers the continuous-valued settling that generalizes the bilattice value category to a complete weighted lattice or monoidal-closed continuous $\mathcal{V}$; the stochastic settling at $\mathcal{V} = ([0,1], \cdot, \text{convex})$ realizing Markov-chain transition kernels; the Lorentzian causal-structure settling on causal sets with closure operator equal to causal transitivity; and the distributed settling system $\{v^{(i)}\}_{i \in I}$ of replicas joined by cellwise $\vee_k$-merge. It defers the core categorical apparatus to the predication-categories survey and the cohomology layer to the cohomology survey.

## Content

### The continuous-valued settling $v_\mathcal{V}$

A continuous-valued settling generalizes the bilattice value category to a continuous one — a Lawvere quantale, continuous lattice, or fuzzy-logic algebra. Fix a continuous value category $\mathcal{V}$: a complete weighted lattice in the Lawvere-quantale sense, or a small monoidal-closed category with continuum-valued hom-sets. Examples from the library:

- $\mathcal{V} = [0, \infty]$ with addition (Lawvere quantale): values represent costs/distances; tensor is addition; meet is min.
- $\mathcal{V} = [0, 1]$ with multiplication (Gödel/Łukasiewicz fuzzy): values represent fuzzy truth; tensor is product or min; meet is min.
- $\mathcal{V} = \mathbb{R}$ with addition (real-valued additive): values represent additive content.
- $\mathcal{V} = $ MV-algebras, BL-algebras, residuated lattices (general fuzzy logic).

A continuous-valued settling on a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ consists of a $\mathcal{V}$-enriched presheaf $v : \mathcal{C}^{\mathrm{op}} \to \mathcal{V}\text{-Cat}$, a $\mathcal{V}$-enriched closure operator $T_\mathcal{V} : v \mapsto T_\mathcal{V}(v)$ that is monotone and inflationary in the $\mathcal{V}$-sense, and a settling-stage advancement that is $\mathcal{V}$-enriched throughout. The settling $v_\kappa$ is the closure-stable fixed point under $T_\mathcal{V}$ at the closure ordinal $\kappa$.

The closure-ordinal $\kappa$ generalizes naturally: for discrete-time iteration it is the ordinal at which $T_\mathcal{V}^\kappa(v) = T_\mathcal{V}^{\kappa+1}(v)$ (same as the bilattice case); for continuous-time iteration with a continuous semigroup $T_t$, $\kappa$ may be a real number or $+\infty$. The four-regime dichotomy generalizes correspondingly: strict ($\kappa$ finite or below a small threshold in continuous time), Scott-continuous ($\kappa = \omega$ discrete or $\kappa = \infty$ with countable-rate convergence), transfinite-bounded ($\kappa$ countable transfinite), aperiodic ($\kappa \geq \omega_1$).

Specialization back: $\mathcal{V} = \{0, 1\}$ recovers the standard Boolean-valued settling exactly; $\mathcal{V} = \mathbf{FOUR}$ also recovers the standard bilattice case; $\mathcal{V} = [0, \infty]$ gives a metric settling (values represent costs/distances, closure operator is "find shortest path" iterated); $\mathcal{V} = [0, 1]$ gives a graded settling (values represent membership/belief intensity, closure operator is "propagate belief with attenuation" iterated). The framework's classification machinery — four regimes, cohomology, Klein-four orbits, deformation theory — applies uniformly across value-category choices.

### The stochastic settling $v_{\mathrm{stoch}}$

A stochastic settling is a continuous-valued settling whose value category is the stochastic semiring $\mathcal{V} = ([0, 1], \cdot, \text{convex})$: tensor is multiplication of probabilities along a sequential path, sum is convex combination over alternative paths (restricted to maintain $\sum \leq 1$), top is 1 and additive identity is 0, meet is standard $[0, 1]$ order with "less informative" rather than "smaller value" reading. This is not a Lawvere quantale (which uses min for combine); the additive operation is genuine summation. The closure operator is matrix multiplication in $\mathcal{V}$.

The canonical instance is the Markov-chain transition settling. Fix a finite or countable state space $S$ and a transition kernel $P : S \times S \to [0, 1]$ with $\sum_o P(s, o) = 1$ for each $s$. The stochastic settling on $(S, P)$ is the $[0, 1]$-valued presheaf

$$v_k : S \times S \to [0, 1], \qquad v_k(s, o) = P^k(s, o)$$

— the $k$-step transition probability — with closure operator $T_{\mathrm{stoch}}(v)(s, o) := \sum_{z \in S} v(s, z) \cdot P(z, o)$.

**Convergence behavior.** For irreducible aperiodic chains, $v_k(s, o) \to \pi(o)$ (stationary distribution) as $k \to \infty$, independent of $s$; closure ordinal $\kappa = \omega$ in the asymptotic-c sense (continuous-state regime classification theorem). For absorbing chains, $v_k$ converges to the absorbing-state distribution, with $\kappa = \omega$ asymptotic or finite for bounded-step absorption. For periodic or non-irreducible chains, $v_k$ may oscillate or fail to converge; the settling is not a single fixed point but the Cesaro average $\bar v_n := \frac{1}{n} \sum_{k=0}^n v_k$, which does converge.

A structural parallel:

| Lawvere quantale | Stochastic |
|---|---|
| $\mathcal{V} = ([0, \infty], +, \min)$ | $\mathcal{V} = ([0, 1], \cdot, +)$ |
| $v(s, o) = $ distance | $v(s, o) = $ probability |
| $T(v)(s, o) = \min(\ldots, \min_z v(s, z) + v(z, o))$ | $T(v)(s, o) = \sum_z v(s, z) \cdot P(z, o)$ |
| Settling: shortest-path matrix | Settling: stationary distribution / $k$-step kernel |
| Strict-V (finite $\kappa$) | Asymptotic-c ($\kappa = \omega$) |

The same closure-2-monad structure with two value categories produces two classical algorithms (Floyd-Warshall vs Markov-chain iteration), both settling-flavored.

### The Lorentzian causal-structure settling $v_{\mathrm{caus}}$

A Lorentzian causal-structure settling has cells $(e_1, e_2)$ that are pairs of spacetime events and closure operator equal to causal transitivity: if $e_1$ is in the causal past of $e_2$ and $e_2$ is in the causal past of $e_3$, then $e_1$ is in the causal past of $e_3$. The natural setting is causal sets — locally-finite partial orders $(P, \preceq)$ representing causal precedence (Sorkin-style discrete spacetime models).

Fix a finite or countable set $E$ of events and a binary relation $\prec_0 \subseteq E \times E$ of direct causal links. The causal-structure settling on $(E, \prec_0)$ has cells $(e_1, e_2) \in E \times E$; initial settling $v_0(e_1, e_2) = \mathbf{t}$ if $e_1 \prec_0 e_2$ and $\bot$ otherwise; closure operator

$$T_{\mathrm{caus}}(v)(e_1, e_3) := v(e_1, e_3) \vee \exists e_2.\, [v(e_1, e_2) \wedge v(e_2, e_3)].$$

The settling $v_\kappa(e_1, e_2) = \mathbf{t}$ iff there is a directed $\prec_0$-path $e_1 \to e_2$ in $E$. It encodes the full causal order $\preceq$ on $E$ generated by the seed $\prec_0$.

**Regime classification by event-set cardinality.** For finite $E$, $\kappa = \lceil \log_2 D \rceil$ where $D$ is the longest directed path length (parallel-relaxation argument) — strict regime, $H^1 = 0$, no non-Scott-continuous firings. For countably-infinite $E$ (e.g., a sprinkling of Minkowski spacetime), $\kappa = \omega$ in the Scott-continuous sense — every cell that becomes $\mathbf{t}$ does so at some finite stage, and the $\omega$-supremum is the full causal order. For genuinely-uncountable causal sets (continuum-spacetime), closure is taken in the topological/measure-theoretic sense; $\kappa = \omega_1$ or beyond depending on cofinality, with the aperiodic regime arising in pathological cases.

**Apex/void cones acquire a clean Lorentzian reading.** A cell $(e_1, e_2)$ becomes settled in the apex iff $v_\kappa(e_1, e_2) = \mathbf{t}$ — iff $e_1$ is causally connected to $e_2$ (timelike or null curve). A cell remains in the void iff neither $v_\kappa(e_1, e_2)$ nor $v_\kappa(e_2, e_1)$ are $\mathbf{t}$ — iff $e_1$ and $e_2$ are spacelike separated. The apex/void duality of the corpus *is* the timelike/spacelike duality of Lorentzian geometry, established formally in the timelike/spacelike-as-apex/void theorem.

| Predication side | Lorentzian side |
|---|---|
| Apex cone (settled cells) | Causally-connected pairs (timelike/null) |
| Void cone (permanently $\bot$) | Spacelike-separated pairs |
| Apex cohomology $H^1$ | Causal-acquisition events |
| Void cohomology $H^0(\mathrm{Void})$ | Structural causal-impossibility events |

**Causal-set substitution dynamics.** A causal-set substitution is a rule that grows a causal set by adding new events with prescribed causal links. The settling formalism applies, and for a primitive non-singular causal-set substitution (the spacetime-level analog of Fibonacci substitution) the cohomology is governed by the aperiodic-regime cohomology theorem. The Perron eigenvalue of the substitution matrix gives the growth rate of the causal set — physically, spacetime expansion / volume growth.

The Lorentzian causal settling is a binary, Boolean-valued, bitopological-site-flavored settling fully within the framework. What is specific is the spacetime interpretation of $E \times E$, the special-case closure operator (transitive closure), and the apex/void identification with timelike/spacelike. All structural theorems — closure 2-monad, regime dichotomy, MLD classification, no-tunneling — apply unchanged.

### The distributed settling system $\{v^{(i)}\}_{i \in I}$

A distributed settling system over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of predication settlings, each evolving independently via its own closure-driven settling. Replicas exchange state via the merge operation — the pointwise knowledge-order join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the predication fiber algebras.

The CRDT-convergence theorem identifies this $\vee_k$-merge as the CRDT operation: replicas evolving independently and merging by cellwise $\vee_k$ converge to a single combined state with the union of their information, without coordination. This places predication settlings as a CRDT class in the strict sense of Shapiro et al. (2011) — more algebraic than a plain join-semilattice (bilattice values give richer state space), with inferential propagation absent from generic CRDTs (via the closure operator), and a naturality condition on fiber morphisms (the predicate-category structure) — but with the CRDT-convergence theorem lifting unchanged because Shapiro's machinery operates on the underlying $\leq_k$-semilattice.

Cohomologically, CRDT-convergence is the vanishing of a specific $H^1$-class on the replica Mayer–Vietoris cover; the obstruction to merging local states without coordination is the same structural fact as $H^1(\mathbf{T}^*)$ being non-zero in other settings.

Related lattice-theoretic distributed-programming models — Kuper-Newton's LVars (2013), the Bloom$^L$ language of Conway-Marczak-Alvaro-Hellerstein-Maier (2012), the delta-state CRDTs of Almeida et al. (2018) — apply the same monotonicity principle at the language level. Predication settlings provide the bilattice-valued model-theoretic ground for them: any distributed system whose state can be modeled as a predication settling inherits eventual consistency without coordination — distributed knowledge-graph stores, multi-agent belief systems, decentralized reasoning systems.

## Synthesis-flags

The structural parallel table (Lawvere-quantale vs stochastic) reproduces the source language in `stochastic-settling.md`. The Lorentzian apex/void identification with timelike/spacelike reproduces source language in `lorentzian-causal-settling.md`; the formal theorem identifying them is cited as `lorentzian-apex-void-as-timelike-spacelike.md` but was not directly read this session. The four CRDT-related citations (LVars, Bloom$^L$, delta-state CRDTs, CALM) are named in source files cross-linked from `distributed-settling-system.md`; the CALM theorem was not opened in this session.

## Provenance

Read in full this session:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/continuous-valued-settling.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/stochastic-settling.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/lorentzian-causal-settling.md`
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/distributed-settling-system.md`

External citations named in the source material:

- Sorkin and colleagues, on causal-set models of discrete spacetime.
- Shapiro et al. (2011), on conflict-free replicated data types (CRDTs).
- Kuper and Newton (2013), on LVars.
- Conway, Marczak, Alvaro, Hellerstein, and Maier (2012), on Bloom$^L$.
- Almeida et al. (2018), on delta-state CRDTs.
- The CALM theorem of Hellerstein and Alvaro (2020).

Cross-referenced theorems named in source material (not directly read this session):

- The CRDT-convergence theorem.
- The continuous-state regime classification theorem.
- The stochastic-stationary-as-settling theorem.
- The timelike/spacelike-as-apex/void theorem.
- The aperiodic-regime cohomology theorem.
- The void-cone cohomology theorem.
