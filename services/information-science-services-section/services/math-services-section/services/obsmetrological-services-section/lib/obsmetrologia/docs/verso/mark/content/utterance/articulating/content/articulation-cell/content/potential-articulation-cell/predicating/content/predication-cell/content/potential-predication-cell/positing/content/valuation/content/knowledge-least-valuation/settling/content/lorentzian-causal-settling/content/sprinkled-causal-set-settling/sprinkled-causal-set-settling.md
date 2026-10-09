---
type: concept
status: stable
class: parameterized-family
symbol: "v^\\mathrm{spr}_{(M, \\rho, V)}"
depends-on: [lorentzian-causal-settling, lorentzian-apex-void-as-timelike-spacelike, causal-set-substitution-settling, four-regime-dichotomy, predication-cell, four-bilattice]
see-also: [sprinkling-regime-asymptotics, spacelike-pair-volume-limit, continuum-lorentzian-limit, myrheim-meyer-dimension]
---

# Sprinkled causal-set settling

A **sprinkled causal-set settling** is a [Lorentzian causal settling](../../lorentzian-causal-settling.md) whose underlying causal set is obtained by Poisson sprinkling: sample a finite or countable set of events from a Poisson process on a Lorentzian manifold $M$, then induce the causal order from the manifold's causal structure.
This gives a family of settlings parameterized by the manifold $M$, the sprinkling density $\rho$, and the sampling volume $V$ (or equivalently, the expected event count $N = \rho V$).

The family is the corpus's natural bridge between the discrete-causal-set framework (where everything is provable) and the continuum-Lorentzian limit (where the framework is asymptotically connected to classical Lorentzian geometry).

## Definition

Fix a Lorentzian manifold $(M, g)$ — most commonly $d$-dimensional Minkowski space $\mathbb{R}^{1, d-1}$ — and a finite-volume measurable region $W \subseteq M$ with volume $V := \mathrm{Vol}_g(W)$.

**The sprinkling.** A **Poisson sprinkling** of density $\rho > 0$ on $W$ is a sample from the Poisson point process on $W$ with intensity $\rho \, d\mathrm{Vol}_g$.
The sample is a random discrete subset $E \subset W$ with $\mathbb{E}[|E|] = \rho V$.

**The induced causal set.** The causal order $\prec_M$ on $M$ restricts to $E$ to give a causal set $(E, \prec)$: $$e_1 \prec e_2 \;:\iff\; e_1 \prec_M e_2 \text{ in the manifold's causal order}.$$ Two events are causally related iff one lies in the causal future (timelike or null future) of the other in $M$.

**The sprinkled settling.** Apply the [Lorentzian causal settling](../../lorentzian-causal-settling.md) construction to $(E, \prec)$: cells are ordered pairs $(e_1, e_2) \in E^2$, valued by: $$v^\mathrm{spr}(e_1, e_2) \;=\; \begin{cases} \mathbf{t} & \text{if } e_1 \prec e_2, \\ \mathbf{f} & \text{if } e_2 \prec e_1, \\ \bot & \text{if } e_1, e_2 \text{ spacelike-separated}, \\ \top & \text{if } e_1 = e_2. \end{cases}$$

The closure dynamics is determined by the standard Lorentzian causal settling construction (transitivity firings, antisymmetry firings, etc.).

## The parameterized family

For fixed $M$ and $\rho$, varying $V$ (equivalently, varying $W$ with volume increasing) gives a sequence of sprinkled settlings: $$\bigl\{v^\mathrm{spr}_{(M, \rho, V)}\bigr\}_{V \to \infty}$$

with corresponding event counts $N := |E_V| \sim \rho V$, closure ordinals $\kappa^{(V)}$, apex/void counts, NSC firing counts, and Myrheim–Meyer dimensions — all functions of $V$ (almost surely with respect to the Poisson measure).

The **continuum limit** is the formal $V \to \infty$ limit at fixed density $\rho$.
As $V$ grows, the sprinkled causal set "fills out" $M$ at density $\rho$; the limiting object is the *full Poisson sprinkling on $M$* — a countably-infinite causal set densely embedded in $M$.

The **continuum continuum limit** is the joint limit $\rho \to \infty, V \to \infty$ — the sprinkling becomes dense everywhere in $M$, recovering the manifold's full causal structure as a "limit" of discrete approximations.
This is the limit relevant for matching against classical Lorentzian geometry.

## Almost-sure properties

Because the sprinkling is random, properties of the sprinkled settling are random variables.
The corpus's invariants become:

- $\kappa^{(V)}$: a random ordinal (almost surely finite for finite $V$).
- $|\mathrm{Apex}_{v^\mathrm{spr}}|$: a random integer (almost surely $\sim N^2 f(d)$ for large $N$).
- $|V_\infty^{(N)}| = |\mathrm{Void}_{v^\mathrm{spr}}|$: a random integer (almost surely $\sim N^2 (1 - f(d))$).
- $|L_\mathrm{ns}(\kappa^{(V)})|$: the random NSC firing count.

Almost-sure statements are with respect to the Poisson measure on sprinklings.

## Why this is the right family for the continuum limit

Sprinkled causal sets are the standard discretization of Lorentzian manifolds in causal-set quantum gravity ([@bombelli-lee-meyer-sorkin1987], [@dowker2005]).
They have several properties that make them well-suited as a bridge to the continuum:

**Lorentz-invariance (in the limit).** Poisson sprinklings on Minkowski space are Lorentz-invariant in distribution: a Lorentz boost of the sprinkling has the same distribution as the original.
This makes them the unique discretization that respects the full Lorentz symmetry of the continuum theory.

**Recovery of causal structure.** As $\rho \to \infty$, the sprinkled causal set faithfully encodes the manifold's causal structure: any two events on $M$ are joined by a path of sprinkled events approximating the manifold's causal connection.

**Recovery of dimension.** The [Myrheim–Meyer dimension](myrheim-meyer-dimension.md) of a sprinkled causal set converges to the manifold dimension as $N \to \infty$ (this is the Myrheim–Meyer estimator's defining property, applied to the corpus's setting in [myrheim-meyer-dimension-from-ordering-fraction](../theorems/myrheim-meyer-dimension-from-ordering-fraction.md)).

**Recovery of volume.** The volume of any sufficiently regular subregion of $M$ is recovered as $|E \cap U| / \rho \to \mathrm{Vol}_g(U)$ by the law of large numbers for Poisson processes.

## Position in predication categories

Sprinkled causal-set settlings give the corpus a *quantitative bridge* to the continuum: every classical Lorentzian-geometric invariant (volume, dimension, causal structure) has a sprinkled-discrete approximation, and the discrete approximations have well-defined limits.

The [continuum Lorentzian limit question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/continuum-lorentzian-limit.md) asks five sub-questions about how the corpus's invariants behave in this limit.
The next theorems address them:

- **Sub-question 1 (cardinal regime):** [sprinkling-regime-asymptotics](../theorems/sprinkling-regime-asymptotics.md) — proves that the regime transitions from strict (finite $V$) to aperiodic (uncountable continuum limit).
- **Sub-question 3 (void-cone volume):** [spacelike-pair-volume-limit](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/spacelike-pair-volume-limit.md) — identifies the void-cone limit measure as the spacelike-pair cone volume on $M \times M$.

Sub-questions 2 (cohomological convergence), 4 (cohomological invariants in continuum), and 5 (measure-theoretic firings) remain open.
