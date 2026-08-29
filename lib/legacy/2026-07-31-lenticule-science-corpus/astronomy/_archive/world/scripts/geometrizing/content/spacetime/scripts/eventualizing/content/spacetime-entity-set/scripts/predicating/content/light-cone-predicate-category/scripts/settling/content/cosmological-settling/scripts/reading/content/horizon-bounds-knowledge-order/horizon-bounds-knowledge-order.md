---
type: theorem
status: sketch
depends-on: [cosmological-settling, observer, light-cone-restriction, particle-horizon]
---

# Horizon bounds the knowledge order

**Statement.** Let $O$ be an [observer](../teaching/explanations/observer.md) at event $e_O$ in the [cosmological settling](../objects/cosmological-settling.md). For every cell $(s, p, o) \in E_{\mathrm{cos}} \times \mathcal{C}_{\mathrm{cone}} \times E_{\mathrm{cos}}$ with $\{s, o\} \not\subseteq J^-(e_O)$ — i.e., at least one of $s, o$ lies outside the past [light cone](../../../theories/observation/terms/light-cone.md) of $e_O$ — the observer's value of the cell is

$$v_O(p)(s, o) = \bot$$

in the [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) of the value bilattice $\mathbf{L}$.

## Proof sketch

The observer's value $v_O(p)(s, o)$ is determined by the chain of [light-cone restrictions](../morphisms/light-cone-restriction.md) and closure-rule firings that have propagated [causal evidence](../teaching/explanations/causal-evidence.md) about the cell to event $e_O$.

By the construction of the [light-cone predicate category](../objects/light-cone-predicate-category.md), the only admissible morphisms feeding $v_O$ are light-cone restrictions $\rho_{e \to e_O}$ with $e \preceq e_O$. By the construction of the closure-rule system as spacetime-local, the only closure rules contributing to $v_O$'s update are those firing at events in $J^-(e_O)$, and they consume only values whose cells have support in $J^-(e_O)$.

Therefore the value $v_O(p)(s, o)$ depends only on values of cells with support in $J^-(e_O) \times J^-(e_O)$. For a cell $(s, p, o)$ with $s$ or $o$ outside $J^-(e_O)$, no such chain exists. The settling-initial value at $\bot$ is never updated. $\square$

## What this rules out

The theorem rules out **any acausal evidence channel** in predicated cosmology: a measurement procedure that returned a non-$\bot$ value for a beyond-horizon cell would constitute a violation of the [light-cone-predicate-category](../objects/light-cone-predicate-category.md)'s morphism class, i.e., a failure of relativistic causality. The theorem makes precise that this is structural rather than empirical: causality is built into the morphism class, and any measurement violating it would be a measurement *not in the cosmological settling*.

## What this does not say

The theorem does **not** say that beyond-horizon cells have value $\bot$ in some absolute sense. They have value $\bot$ *in the observer's reduced settling*. A different observer at a different event has a different past light cone and assigns different cells the value $\bot$. The cell $(s, p, o)$ may be at $\bot$ for one observer and at $\mathbf{t}$ for another, depending on whose past light cone includes both $s$ and $o$.

This is the predicated content of the standard cosmological observation that horizons are observer-dependent.

## Status

Sketch. The proof depends on a clean statement of "spacetime-local closure-rule system," which the [cosmological-settling](../objects/cosmological-settling.md) object asserts but does not yet construct explicitly. Once the closure-rule system is written down, the proof is a direct verification.
