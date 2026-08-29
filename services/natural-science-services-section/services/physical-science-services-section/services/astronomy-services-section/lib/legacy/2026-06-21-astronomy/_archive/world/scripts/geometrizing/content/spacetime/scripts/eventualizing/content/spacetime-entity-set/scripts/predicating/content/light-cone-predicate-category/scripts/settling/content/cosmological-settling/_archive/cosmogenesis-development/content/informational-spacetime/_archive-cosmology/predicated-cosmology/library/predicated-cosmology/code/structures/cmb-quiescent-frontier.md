---
type: definition
class: frontier
realizes: [cosmic-horizon, settling-quiescence]
status: sketch
depends-on: [cosmological-settling, recombination, cosmic-microwave-background]
---

# CMB quiescent frontier

The boundary, in the [cosmological settling](cosmological-settling.md), at which the photon-electron scattering sub-settling reaches [quiescence](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) and the photon predicate's evolution decouples from the electron predicate's evolution.

In standard cosmology this boundary is the **surface of last scattering**, at cosmic time $t \sim 380{,}000$ years and [redshift](../../../terms/redshift.md) $z \approx 1100$, where the universe cooled enough for free electrons to combine with nuclei into neutral atoms ([recombination](../../theories/evolution/terms/recombination.md)).
The [cosmic microwave background](../../theories/structure/terms/cosmic-microwave-background.md) is the photon distribution at the moment its scattering settling went quiescent, then free-streamed to the present along null geodesics.

## Why "quiescent frontier"

The predicated reframing makes the structural content of recombination explicit:

- Before the frontier, the closure rule "photon $\gamma$ scatters off electron $e^-$" fires constantly.
  The cell $(p_\gamma, \mathrm{scatters\text{-}with}, p_{e^-})$ has $\leq_k$-jumps at every cosmic-time successor step.
  The photon's spatial distribution is a function of the electron's; the two predicates' fibers are not independent.
- At the frontier, the closure rule's firing rate drops below the cosmic-time successor rate.
  The cell stops jumping.
  The two predicate fibers decouple.
- After the frontier, the photon predicate's evolution is governed only by [cosmic expansion](../../theories/evolution/terms/cosmic-expansion.md): photons free-stream along the past light cones of all future observers.
  The cell trajectory is constant in the photon's reference frame; only the [redshift-reindexing](../morphisms/redshift-reindexing.md) morphism changes its observed value.

The frontier is therefore a **partial quiescence**: the photon-electron scattering sub-settling is quiescent past it, but the gravitational and structure-formation sub-settlings continue evolving.
The cosmological settling as a whole is not yet at quiescence and may never be.

## As a $\leq_k$-frontier

In knowledge-order terms, the CMB frontier is the boundary at which the photon temperature predicate transitions from "still being told" to "told-and-no-longer-changing."
Cells $(\gamma, T, \gamma')$ for photon-pairs at the frontier have their $v_t$ values stop evolving (modulo redshift reindexing) at $t = t_{\mathrm{rec}}$.
Every observer at $t > t_{\mathrm{rec}}$ in whose past light cone the frontier lies — i.e., every present-day observer — receives a value of these cells fixed at $t_{\mathrm{rec}}$.
This is the structural content of "the CMB is the oldest light."

## Status

Sketch.
The identification of recombination with a sub-settling quiescence requires writing down the photon-electron scattering closure rule explicitly and showing that its firing rate (per cosmic-time step) crosses below unity at $t = t_{\mathrm{rec}}$ as a derived consequence rather than as input.
This is a tractable calculation but has not been carried out in the predication-categorical setting.
