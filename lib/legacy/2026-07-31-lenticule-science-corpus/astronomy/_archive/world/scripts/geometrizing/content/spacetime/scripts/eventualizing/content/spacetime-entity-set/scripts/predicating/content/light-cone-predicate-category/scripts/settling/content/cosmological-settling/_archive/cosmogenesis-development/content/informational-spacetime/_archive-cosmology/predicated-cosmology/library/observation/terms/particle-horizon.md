---
name: "Particle Horizon"
aliases:
  - "particle horizon"
  - "cosmological horizon"
  - "comoving horizon"
date-created: 2026-05-03
requires:
  - light-cone
  - cosmic-expansion
  - scale-factor
enables:
  - observable-universe
---

The particle horizon at cosmic time $t$ is the maximum proper distance from which [light](../../../terms/light.md) emitted at the [Big Bang](../../evolution/terms/big-bang.md) could have reached an observer by time $t$.
It is the radius of the region from which the observer can have received any signal at all.

In an expanding universe the particle horizon is given by

$$d_p(t) = a(t) \int_0^t \frac{c \, dt'}{a(t')}$$

where $a(t)$ is the [scale factor](../../evolution/terms/scale-factor.md) and $c$ the speed of light.
The integral diverges at the lower limit only if expansion was sufficiently slow at early times; in [Lambda-CDM](../../../terms/lambda-cdm-model.md) the integral converges and the present-day particle horizon is approximately 46 billion light-years -- larger than $c$ times the age of the universe (13.8 Gyr) because space has expanded while the light was in transit.

The particle horizon is **not** the same as the [light cone](./light-cone.md).
The past light cone of the present observer is a surface in spacetime; the particle horizon at time $t$ is the spatial extent at $t$ of the region from which signals could have reached the observer's worldline by $t$.
The two coincide only for the observer's own present moment.

The particle horizon imposes a hard epistemic ceiling: events beyond the horizon have left no causal trace in any local measurement.
Two regions of the early universe separated by more than the particle horizon at recombination could not have exchanged any signal before then -- a fact that motivates [cosmic inflation](../../evolution/terms/cosmic-inflation.md), which postulates an early phase of accelerated expansion that brought widely-separated regions into causal contact before they were stretched out of it.

A second horizon -- the **event horizon** -- bounds events that *will ever* be observable.
In a universe with [accelerating expansion](../../evolution/terms/accelerating-expansion.md) driven by [dark energy](../../structure/terms/dark-energy.md), distant galaxies will eventually recede faster than light (in the sense that the proper distance between us and them grows faster than $c$), and their future light cones will never reach us.
The cosmological event horizon is finite -- in our universe, about 16 billion light-years -- and it is shrinking, in the comoving sense.
