---
type: morphism
class: reindexing
symbol: "\\tau_{s \\to t}"
depends-on: [cosmological-settling, comoving-frame, cosmic-time]
---

# Cosmic-time reindexing

Given a [comoving frame](../objects/comoving-frame.md), and cosmic times $s \leq t$, the **cosmic-time reindexing** $\tau_{s \to t}$ is the morphism in the [cosmological settling](../objects/cosmological-settling.md) that maps a comoving observer's predication valuation at cosmic time $s$ to their predication valuation at cosmic time $t$.

It is the comoving-section pullback of the family of [light-cone restrictions](light-cone-restriction.md) along the worldline of each comoving observer.
Pointwise: for a comoving observer at spatial position $\vec{x}$ with worldline events $e_s, e_t$ at cosmic times $s, t$,

$$\tau_{s \to t}(v_s(p)(\vec{x}, \vec{y})) = v_t(p)(\vec{x}, \vec{y})$$

with the right-hand side determined by [settling monotonicity](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md): $v_s(p)(\vec{x}, \vec{y}) \leq_k v_t(p)(\vec{x}, \vec{y})$.

## Why this is *not* the same as light-cone restriction

The light-cone restriction $\rho_{e_s \to e_t}$ acts on cells supported on the *intersection of past light cones*.
The cosmic-time reindexing $\tau_{s \to t}$ acts on cells supported on the *comoving slices* — equivalently, on cells whose entity coordinates are at fixed comoving position.
The two morphisms agree on cells in both supports but differ on cells that are at fixed comoving position but cross horizons during the interval $[s, t]$: those cells are reindexed by $\tau_{s \to t}$ (along the worldline) but not by $\rho_{e_s \to e_t}$ (their causal connection is broken).

This is why $\tau_{s \to t}$ is well-defined only when a [comoving frame](../objects/comoving-frame.md) is chosen — the [cosmological principle](../../../terms/cosmological-principle.md) is what makes such a section of the cosmic-time projection canonical.

## Captures cosmic expansion

Under the action of $\tau_{s \to t}$, cells of the form $(\vec{x}_1, \mathrm{distance}, \vec{x}_2)$ for fixed comoving positions $\vec{x}_1, \vec{x}_2$ have their values multiplied by the [scale factor](../../theories/evolution/terms/scale-factor.md) ratio $a(t)/a(s)$.
This is the predicated form of [cosmic expansion](../../theories/evolution/terms/cosmic-expansion.md): the morphism that reindexes "now" to "later" rescales the comoving-distance predicate.
The [redshift-reindexing](redshift-reindexing.md) morphism is the dual statement on the photon-wavelength predicate.

## Composition

$\tau_{s \to t} \circ \tau_{r \to s} = \tau_{r \to t}$ for $r \leq s \leq t$, and $\tau_{t \to t} = \mathrm{id}$.
The cosmic-time reindexings form a one-parameter monoid (not a group: not invertible, by the same reason as the light-cone restriction).
