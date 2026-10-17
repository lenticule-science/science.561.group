---
type: theorem
status: proved
depends-on: [continuous-valued-settling, four-regime-dichotomy, closure-ordinal, scott-continuous-closure, transfinite-settling-convergence]
---

# Continuous-state regime classification

The [four-regime dichotomy](../../../references/four-regime-dichotomy.md) extends to [continuous-valued settlings](../../continuous-valued-settling/continuous-valued-settling.md) under a careful split between the *iteration-time regime* (the closure ordinal $\kappa$ as before) and the *value-space regime* (a new continuum-valued invariant tracking how value-space convergence interacts with iteration). For discrete-time iteration the classification is unchanged. For continuous-time semigroup dynamics it acquires a real-valued analog.

## Statement

Let $\mathcal{V}$ be a continuous value category (Lawvere quantale $[0, \infty]$, fuzzy $[0, 1]$, real-valued, or general residuated lattice with continuum-valued hom-sets) and let $T_\mathcal{V}$ be a $\mathcal{V}$-enriched closure operator on $\mathcal{V}$-valued presheaves. Let $v_0$ be an initial settling.

### Discrete-time case ($T_\mathcal{V}$ iterated by ordinals)

**Theorem (continuous-state, discrete-time, four-regime).** *Define $\kappa := \min \{ \tau : T_\mathcal{V}^\tau(v_0) = T_\mathcal{V}^{\tau + 1}(v_0) \}$. Exactly one of the following holds:*

1. *Strict-V*: $\kappa < \omega$.
2. *Scott-continuous-V*: $\kappa = \omega$ and $T_\mathcal{V}$ commutes with $\omega$-directed $\mathcal{V}$-joins.
3. *Transfinite-bounded-V*: $\omega < \kappa < \omega_1$ and the state space has countable $\mathcal{V}$-cofinality.
4. *Aperiodic-V*: $\kappa \geq \omega_1$.

*Equivalences and stratification structure are as in [four-regime-dichotomy](../../../references/four-regime-dichotomy.md), with "ascending chain" replaced by "$\mathcal{V}$-monotone chain in the $\mathcal{V}$-enriched ordering."*

### Continuous-time case ($T_t$ a $\mathcal{V}$-enriched semigroup, $t \in [0, \infty)$)

**Theorem (continuous-state, continuous-time, four-regime).** *Let $T_t : v_0 \mapsto T_t(v_0)$ be a $\mathcal{V}$-enriched semigroup of $\mathcal{V}$-monotone-and-inflationary operators with $T_0 = \mathrm{id}$, $T_s \circ T_t = T_{s+t}$. Define the **continuous closure time**:*

$$\kappa^c := \inf \{ t \in [0, \infty] : T_s(v_0) = T_t(v_0) \text{ for all } s \geq t \}.$$

*Exactly one of the following holds:*

1. *Strict-c*: $\kappa^c < \infty$ and $T_t(v_0) = T_{\kappa^c}(v_0)$ for all $t \geq \kappa^c$ (terminating in finite time).
2. *Asymptotic-c*: $\kappa^c = \infty$ but $\lim_{t \to \infty} T_t(v_0)$ exists in $\mathcal{V}$-completion (asymptotic convergence).
3. *Non-asymptotic countable-c*: $\kappa^c = \infty$ and the limit doesn't exist in $\mathcal{V}$ but exists in a countable transfinite extension.
4. *Aperiodic-c*: $\kappa^c = \infty$ and convergence requires uncountable transfinite stages even after taking $\mathcal{V}$-completion.

## Proof

### Part 1: discrete-time classification

The discrete-time case is the [four-regime dichotomy](../../../references/four-regime-dichotomy.md) applied to $\mathcal{V}$-enriched closure operators. The original proof goes through unchanged, with three substitutions:

- "Ascending chain in $\mathbf{L}^{\bowtie E \times E}$" $\rightsquigarrow$ "$\mathcal{V}$-monotone chain in $v_\tau$ relative to the pointwise $\mathcal{V}$-ordering on $\mathcal{V}$-enriched presheaves."
- "Predication fiber algebra finite" $\rightsquigarrow$ "$\mathcal{V}$-enriched fiber complete and well-orderable in $\mathcal{V}$-monotone steps."
- "Scott-continuous" $\rightsquigarrow$ "$\mathcal{V}$-Scott-continuous" (commutes with $\mathcal{V}$-directed joins).

The four-way disjunction $\{\kappa < \omega, \kappa = \omega, \omega < \kappa < \omega_1, \omega_1 \leq \kappa\}$ is unchanged; only the structures producing each $\kappa$-value are reinterpreted in $\mathcal{V}$-enriched terms.

The strict-V case requires a finite $\mathcal{V}$-monotone chain — this happens when $\mathcal{V}$ is finite (e.g., $\mathcal{V} = \{0, 1\}$, recovering the Boolean case) *or* when $v_0$ has finite $\mathcal{V}$-support (only finitely many cells with non-trivial $\mathcal{V}$-value). Both Boolean-based settlings on finite predication-cells *and* continuous-valued settlings with finite support reduce to strict-V.

Scott-continuous-V, transfinite-bounded-V, aperiodic-V follow analogously. $\square$

### Part 2: continuous-time classification

For a $\mathcal{V}$-enriched semigroup $T_t$, define the *iterated form*: for any countable subset $S \subseteq [0, \infty)$ that's a discretization (e.g., $S = \{0, \delta, 2\delta, \ldots\}$ for some step $\delta > 0$), the discrete iteration $T_\delta^n(v_0)$ converges either:

- In finite $n$ (strict-c, after rescaling time);
- At $n = \omega$ (Scott-continuous-c, asymptotic);
- At countable transfinite $n$ (TB-c);
- Or fails countably (aperiodic-c).

**Key lemma.** The discretization-class is independent of $\delta > 0$. *Proof:* Two discretizations with steps $\delta_1, \delta_2$ generate the same orbit closure (by $\mathcal{V}$-monotonicity and the semigroup law: $T_{\delta_1} \circ T_{\delta_2}^k = T_{\delta_1 + k\delta_2}$, so any $T_{\delta_1}^j$ value lies between two consecutive $T_{\delta_2}^k$ values via interleaving; their convergence ordinals match).

So the four-way classification is intrinsic to $T_t$ and $v_0$, not to a chosen discretization.

The continuous closure time $\kappa^c$ then satisfies:

- **Strict-c**: there exists $T < \infty$ with $T_t(v_0) = T_T(v_0)$ for all $t \geq T$. The $T_t$ trajectory hits the fixed point in finite real-time.
- **Asymptotic-c**: $T_t(v_0)$ approaches a limit $v_\infty$ as $t \to \infty$, but no finite $t$ realizes $v_\infty$ exactly. The closure happens at the $\omega$-limit in the discretization-equivalence sense.
- **Non-asymptotic countable-c, aperiodic-c**: continuous-time analogs of the corresponding discrete cases. These require iteration beyond all real-valued $t$ — possible if $T_t$ has discontinuities or non-Scott-continuous saturation. $\square$

## Concrete instances per regime

### Strict-c: shortest-path on finite weighted graph

Take $\mathcal{V} = ([0, \infty], +, \min)$ (Lawvere quantale, distance) and $v_0(s, o) = \mathrm{weight}(s \to o)$ (or $\infty$ if no edge). The closure $T_\mathcal{V}$ is one Bellman-Ford relaxation step: $T_\mathcal{V}(v)(s, o) = \min(v(s, o), \min_z [v(s, z) + v(z, o)])$.

For a graph on $n$ vertices, $\kappa = n - 1$ (Bellman-Ford bound). **Strict-c regime**, value-space is continuous, but iteration terminates in finite steps.

### Scott-continuous-c: heat equation on $\mathbb{R}^d$

Take $\mathcal{V} = \mathbb{R}_{\geq 0}$ (real-valued) and $T_t = e^{t \Delta}$ (heat semigroup). For an initial $L^2$ density $v_0$, $T_t(v_0)$ converges to the harmonic extension as $t \to \infty$, but no finite $t$ hits the limit (for non-harmonic initial data).

$\kappa^c = \infty$ but limit exists in $L^2$. **Asymptotic-c regime**. Closure operator is $\mathcal{V}$-Scott-continuous: directed limits of densities commute with the heat flow.

### Transfinite-bounded-c: iterated belief-propagation with quantifier closures

Take $\mathcal{V} = [0, 1]$ (fuzzy) and a closure operator that does first-order belief-propagation: at each stage, beliefs propagate via fuzzy-rule application, then a quantifier closure (sup over a countable family of witnesses) is taken at limit stages.

For a countable knowledge base with fuzzy-rules of bounded depth, the iteration converges at countable transfinite stages — past $\omega$ (because of quantifier saturation) but bounded (because the knowledge base is countable). **TB-c regime.**

### Aperiodic-c: $\omega_1$-substitution on continuous values

Take a primitive substitution settling on $E = \omega_1$ with continuum-valued letter weights. Each cell acquires a real-valued weight from its parent under the substitution, and the closure is "complete the substitution" iteratively. Closure ordinal is $\omega_1$ exactly (per [aperiodicity-characterization](../../aperiodic-settling/references/aperiodicity-characterization.md)), now with a continuum-valued layer on top.

**Aperiodic-c regime.** All predication categories' aperiodic-regime cohomology theory applies, with $\mathbb{Z}$-coefficient cohomology replaced by $\mathcal{V}$-coefficient cohomology (per [Q-enriched cohomology](../../bitopological-settling-site/content/quantale-enriched-sheaf/content/q-enriched-cohomology/q-enriched-cohomology.md)).

## Cross-regime interactions

A subtlety: a discrete-time iteration of a $\mathcal{V}$-valued operator might be **strict-V at the iteration level** (e.g., $\kappa = 5$) but **continuous in value-space**. The closure ordinal classifies the iteration; the value-space continuum classifies the values produced.

This decouples two notions:

- *Iteration regime* (strict-V / SC-V / TB-V / aperiodic-V): how many steps closure takes.
- *Value regime*: the structure of $\mathcal{V}$ itself (Boolean / bilattice / fuzzy / real-valued).

For predication categories' *cohomological* invariants ($H^1 = \bigoplus_{L_{\mathrm{ns}}} \mathbb{Z}$ in the bilattice case): the iteration regime determines the *firing pattern*, and the value regime determines the *coefficient ring*. With $\mathcal{V}$ continuous, $\mathbb{Z}$-coefficients become $\mathcal{V}$-coefficients (per Q-enriched cohomology), but the firing-ordinal structure is unchanged.

Concretely: a strict-V iteration on continuous values has $H^1 = 0$ (no NSC firings), regardless of $\mathcal{V}$. An aperiodic-V iteration on Boolean values has $H^1 = \bigoplus_{\omega_1} \mathbb{Z}$ (per the existing aperiodic theorems).

The cohomologically-rich case is **TB-V or aperiodic-V iteration on continuous $\mathcal{V}$**: many NSC firings with continuum-valued content. Each generator $e_\mu \in H^1$ is now $\mathcal{V}$-valued, recording the *amount* of $\mathcal{V}$-content acquired at firing $\mu$.

## What this gives us

A clean separation: continuous values $\neq$ continuous time $\neq$ infinite iteration. The four-regime dichotomy generalizes, and three layers of "continuum" are independent:

1. **Continuum value**: $\mathcal{V}$ has continuum-valued hom-sets.
2. **Continuum time**: iteration parameter $t \in [0, \infty)$ rather than ordinal.
3. **Continuum convergence**: closure happens in $\omega$-many or beyond, asymptotic or strict.

Each of (1), (2), (3) can be present or absent independently. The framework handles all 8 combinations uniformly, with regime classification depending on (3) primarily, value-coefficient structure on (1), and time-parameterization on (2).
