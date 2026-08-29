---
type: definition
status: draft
class: theory
symbol: "T"
depends-on: [predicate-category, closure-operator, predication-model, predication-settling, entity-set, residuated-lattice]
see-also: [resource, theory-relative-ideal, researching, subtheory]
---

# Predication theory

A **predication theory** is a quadruple $T = (\mathbf{L}, \mathcal{C}, E, \mathrm{Cl})$ where $\mathbf{L}$ is an integral commutative [residuated lattice](residuated-lattice.md), $\mathcal{C}$ is a [predicate category](predicate-category.md) with finite limits, $E$ is an [entity set](entity-set.md), and $\mathrm{Cl}$ is a [closure operator](../morphisms/closure-operator.md) on the predication fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ over $(\mathbf{L}, \mathcal{C}, E)$.

## Settled state

The **settled state** of $T$ is the minimal $\mathrm{Cl}$-fixed point, constructed by transfinite iteration from the initial settling $\bot^T$ with $v^T_0(p) := \bot \in A_p$ for all $p$:

$$v^T_{\tau+1}(p) := \mathrm{Cl}_p(v^T_\tau(p)), \qquad v^T_\lambda(p) := \bigvee_{\tau < \lambda} v^T_\tau(p) \;\text{ at limit ordinals.}$$

The iteration converges to $v^T_\infty$ at the least $\tau^*$ for which $\mathrm{Cl}_p(v^T_{\tau^*}(p)) = v^T_{\tau^*}(p)$ for all $p$, guaranteed by the [settling convergence theorem](../theorems/settling-convergence.md) under appropriate finiteness hypotheses. In general $v^T_\infty := \bigvee_\tau v^T_\tau$ (the join exists since each fiber algebra $(A_p, \leq_k)$ is a complete lattice by the [Knaster–Tarski theorem](https://en.wikipedia.org/wiki/Knaster%E2%80%93Tarski_theorem)). The settled state $v^T_\infty$ is a [predication model](predication-model.md): it is $\mathrm{Cl}$-saturated and quiescent.

## Relationship to predication model

A [predication model](predication-model.md) records a settling that is already at a $\mathrm{Cl}$-fixpoint, without retaining the closure operator as an explicit component. A predication theory retains $\mathrm{Cl}$ explicitly, so that the theory can be restricted, extended, or compared with other theories at the level of inference structure — not only at the level of settled values. Two theories may share a settled state ($v^T_\infty = v^{T'}_\infty$) while carrying different closure operators; they are the same predication model but different predication theories. The distinction is consequential for [subtheories](subtheory.md) and [researching morphisms](../morphisms/researching.md).

## Usage

The notion of a predication theory as a named object grounds the [theory-relative ideal](teaching/explanations/theory-relative-ideal.md), [resource](resource.md), [idealization morphism](../morphisms/idealization-morphism.md), and [researching morphism](../morphisms/researching.md), all of which refer to a "host theory $T$" with settled state $v^T_\infty$ and closure $\mathrm{Cl}^T$. Those files use the concept informally; this definition makes the quadruple explicit.
