---
type: morphism
class: restriction
symbol: "\\rho_{e \\to e'}"
depends-on: [light-cone-predicate-category, causal-evidence, light-cone]
---

# Light-cone restriction

For events $e, e' \in E_{\mathrm{cos}}$ with $e \preceq e'$ (i.e. $e$ in the past light cone of $e'$, or $e = e'$), the **light-cone restriction** $\rho_{e \to e'}$ is the morphism in the [light-cone predicate category](../objects/light-cone-predicate-category.md) that reindexes a [predication valuation](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) supported on $e$'s past light cone into one supported on $e'$'s past light cone, restricted to the intersection.

Concretely, for each predicate $p$ and each cell $(s, p, o)$ with $\{s, o\} \subseteq J^-(e) \cap J^-(e')$ (where $J^-(e)$ denotes the causal past of $e$):

$$\rho_{e \to e'}(v(p)(s, o)) = v(p)(s, o)$$

— the value is preserved. For cells with $\{s, o\}$ not in this intersection, the morphism is undefined; for cells in $J^-(e') \setminus J^-(e)$, the value at $e'$ is not constrained by the value at $e$ (it must come from a different past chain).

## Why this is the operative morphism class

The light-cone restriction is the *only* admissible reindexing of values from one event to another in [predicated cosmology](../_index.md). All other apparently-spatial morphisms (boosts, rotations, comoving-frame translations) factor through light-cone restrictions composed with [frame changes](frame-change.md) at single events. The light-cone restriction is what makes [causal evidence](teaching/explanations/causal-evidence.md) the right specialization of [evidence](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/evidence.md) for the cosmological setting.

## Composition and identity

- $\rho_{e \to e} = \mathrm{id}$ for every $e$.
- $\rho_{e \to e''} = \rho_{e' \to e''} \circ \rho_{e \to e'}$ when $e \preceq e' \preceq e''$.
- $\rho_{e \to e'}$ is *not* invertible: the past light cone of $e'$ contains strictly more cells than that of $e$ when $e \prec e'$, so the morphism has a non-trivial kernel.

The non-invertibility is structural: time goes one way. The asymmetry of the light-cone restriction is the categorical face of the asymmetry of the [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) under cosmic-time advance — see [arrow-of-time-from-knowledge-monotonicity](../theorems/arrow-of-time-from-knowledge-monotonicity.md).

## In flat spacetime vs. curved spacetime

In Minkowski spacetime, the causal partial order $\preceq$ is globally hyperbolic and the light-cone restrictions have a clean compositional structure parameterized by interval and direction. In a generic curved spacetime — including FLRW with an inflationary phase — the partial order may have non-trivial structure (e.g., events that are timelike-related via one path and spacelike-related via another). The Beck-Chevalley squares of light-cone restrictions then commute only conditionally, which is the categorical fingerprint of a non-globally-hyperbolic spacetime. Predicated cosmology takes this seriously: causality is a feature of the morphism class, and pathologies of the spacetime show up as failures of expected categorical equations.
