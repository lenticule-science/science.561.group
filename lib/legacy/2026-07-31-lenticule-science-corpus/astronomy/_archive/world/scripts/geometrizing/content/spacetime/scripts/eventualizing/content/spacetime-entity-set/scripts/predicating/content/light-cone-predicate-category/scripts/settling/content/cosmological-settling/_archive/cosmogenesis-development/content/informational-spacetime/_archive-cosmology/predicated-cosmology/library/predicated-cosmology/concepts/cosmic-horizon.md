---
type: concept
class: horizon
depends-on: [observer, causal-evidence]
see-also: [particle-horizon, observable-universe, knowledge-order, horizon-bounds-knowledge-order]
---

# Cosmic horizon

The role borne by *a knowledge-order ceiling on what a given [observer](observer.md) can know about the universe*.
A cosmic horizon is not a feature of the universe-in-itself; it is a property of an observer-in-a-universe.
Two observers at the same cosmic time but at different spatial locations have horizons centered on different events, with different contents.

The horizon role is realized in two structurally distinct ways in standard cosmology:

- **The [particle horizon](../../theories/observation/terms/particle-horizon.md)** — the boundary of the region from which any signal could ever have reached the observer.
  Cells beyond the particle horizon have value $\bot$ in the observer's [knowledge order](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md): no [causal evidence](causal-evidence.md) has propagated.
- **The cosmological event horizon** — the boundary of the region from which any signal could ever reach the observer in the future.
  Cells beyond the event horizon will remain at $\bot$: no evidence will ever propagate.
  In a universe with [accelerating expansion](../../theories/evolution/terms/accelerating-expansion.md), the event horizon is finite.

## The horizon as $\leq_k$-ceiling

The predicated reformulation of the horizon is straightforward: the horizon is the boundary of the observer's *non-trivial-knowledge region*.
Inside, the observer can in principle hold $\bot$, $\mathbf{t}$, $\mathbf{f}$, or $\top$ (in [four-bilattice](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) terms).
Outside, only $\bot$.
The [horizon-bounds-knowledge-order](../theorems/horizon-bounds-knowledge-order.md) theorem makes this precise: for every observer $O$ and every cell whose coordinates fall outside $O$'s past light cone, $v_O(\text{cell}) = \bot$.

## What the horizon is not

The cosmic horizon is **not** a barrier in the universe.
There is nothing at the horizon.
Galaxies on either side of an observer's horizon are physically identical; the horizon is a fact about the observer's epistemic access, not the substrate.
This is why two observers at different positions disagree about what is "behind their horizon" while agreeing entirely on what the universe contains: their horizons sit in different places, and the universe extends past both.

The horizon is also not a singularity.
Crossing a horizon (in the sense of being a region that becomes accessible as the observer moves forward in cosmic time, or that becomes inaccessible as the observer moves with accelerating expansion) is a smooth operation on the observer's predication state — the bilattice value of a previously inaccessible cell merely lifts off $\bot$.
