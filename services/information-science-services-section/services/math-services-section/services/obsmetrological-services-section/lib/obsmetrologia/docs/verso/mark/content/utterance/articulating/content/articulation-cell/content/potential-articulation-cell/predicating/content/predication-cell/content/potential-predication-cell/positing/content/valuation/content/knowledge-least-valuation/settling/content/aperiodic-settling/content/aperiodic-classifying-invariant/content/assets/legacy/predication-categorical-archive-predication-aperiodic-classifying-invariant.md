---
type: definition
realizes: [cohomological-equivalence]
class: cohomology-class
symbol: "\\mathrm{cl}\\text{-}\\mathrm{inv}(v)"
depends-on: [settling-cohomology, settling-associated-sheaf, aperiodic-settling, closure-ordinal, settling-morphism]
---

# Aperiodic classifying invariant

The cohomology class in $H^1$ that classifies [aperiodic-regime](../theorems/four-regime-dichotomy.md) [predication settlings](../objects/predication-settling.md) up to [mutually-locally-derivable](teaching/explanations/mutually-locally-derivable.md) equivalence.

Let $v$ be a aperiodic settling over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with [closure ordinal](closure-ordinal.md) $\kappa$ and [increment sequence](increment-sequence.md) $U$. The **aperiodic classifying invariant** of $v$ is

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;:=\; [\mathbf{1}_{\mathcal{F}_U}] \;\in\; H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U),$$

where $\mathbf{1}_{\mathcal{F}_U}$ is the canonical *identity class* of the [settling-associated sheaf](settling-associated-sheaf.md) — the cohomology class of the identity cochain assigning to each object $(q, \tau, U) \in \mathbf{T}^*_{\leq \kappa}$ the sum of generator elements in $\mathcal{F}_U(q, \tau, U)$ indexed by newly-added designated cells at stage $\tau$.

## Why this lives where it does

[Settling cohomology vanishes above degree 1](../theorems/settling-cohomology-vanishes-above-degree-1.md): all obstruction content sits in $H^0$ and $H^1$. $H^0$ counts converged-state cells (a quantitative datum, not a structural one); $H^1$ carries the obstructions that distinguish structurally inequivalent aperiodic orbits.

For [strict and Scott-continuous regimes](../theorems/four-regime-dichotomy.md) settlings the cohomology stabilizes at the closure ordinal ([settling-locally-constant cohomology](../theorems/settling-locally-constant-cohomology.md)) and $\mathrm{cl}\text{-}\mathrm{inv}$ is forced to be zero. For [aperiodic regime](teaching/explanations/aperiodic-settling.md) the cohomology *does not* stabilize at any countable ordinal — non-Scott-continuous firings at countable limit ordinals continually contribute new $H^1$-generators — and $\mathrm{cl}\text{-}\mathrm{inv}$ can be non-zero.

## Distinguishing power

By the [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md), $\mathrm{cl}\text{-}\mathrm{inv}$ is the *complete* invariant for aperiodic settlings up to MLD: $v \sim_{\mathrm{MLD}} v'$ iff $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$. Two settlings with the same closure ordinal but structurally different closure rules — so that no invertible [settling-morphism](../morphisms/settling-morphism.md) exists — have distinct classes.

The [transfinite-induction settling](../examples/transfinite-induction-settling.md) realizes the canonical "all-ones" diagonal class — see [transfinite-induction classifying invariant](../theorems/transfinite-induction-classifying-invariant.md).

## Step-$n$ parameterization

For aperiodic settlings arising from substitution-recurrence rules, the classifying invariant has additional structure refined by the [step-$n$ parameter](teaching/explanations/step-n-substitution-recurrence.md). When the underlying rule is a [step-$n$ substitution rule](step-n-substitution-rule.md), the classifying invariant — quotiented by the substitution-shift MLD relation — becomes the [step-$n$ classifying invariant](step-n-classifying-invariant.md):

$$\mathrm{cl}\text{-}\mathrm{inv}^{(n)}(v) \;\in\; \mathbb{Z}^n,$$

with rank exactly $n$ by the [step-$n$ cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md). The pre-quotient invariant remains uncountable-rank (one generator per firing ordinal, as in the [Fibonacci L5a computation](../examples/fibonacci-classifying-invariant.md)); the post-quotient $\mathbb{Z}^n$ recovers the Anderson-Putnam Čech cohomology and aligns with the bilattice's value-structure at $n = 2, 3, 4$ via the [step-$n$ / bilattice correspondence](../theorems/step-n-and-bilattice-correspondence.md).

The aperiodic classifying invariant therefore stratifies, on the substitution-recurrence subset of meta-aperiodic, into a step-$n$-tower of $\mathbb{Z}^n$-valued invariants — predication categories' substitution-recurrence refinement of $\mathrm{cl}\text{-}\mathrm{inv}$.
