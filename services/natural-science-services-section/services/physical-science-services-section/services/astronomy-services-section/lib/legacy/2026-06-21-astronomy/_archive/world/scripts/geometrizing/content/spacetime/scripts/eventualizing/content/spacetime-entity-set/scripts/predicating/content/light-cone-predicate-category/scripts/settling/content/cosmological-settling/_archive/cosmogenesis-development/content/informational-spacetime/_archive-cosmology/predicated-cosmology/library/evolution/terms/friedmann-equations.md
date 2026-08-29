---

title: "Friedmann Equations"
description: "The Friedmann equations are the differential equations governing the expansion of a homogeneous, isotropic universe. They are what you get when you apply [general relativity](../../../terms/general-relativity.md) to a universe satisfying the [cosmological principle](../../../terms/cosmological-principle.md)."
aliases:
  - "Friedmann equations"
  - "Friedmann equation"
  - "FLRW model"
date-created: 2026-03-31
defines:
  - "Friedmann Equations"
  - "Friedmann equations"
  - "FLRW model"
requires:
  - general-relativity
  - cosmological-principle
  - scale-factor
enables:
  - lambda-cdm-model
  - accelerating-expansion
---

The Friedmann equations are the differential equations governing the expansion of a homogeneous, isotropic universe.
They are what you get when you apply [general relativity](../../../terms/general-relativity.md) to a universe satisfying the [cosmological principle](../../../terms/cosmological-principle.md).

Alexander Friedmann derived them in 1922, well before the expansion of the universe was observationally confirmed.
Georges Lemaître independently obtained them in 1927.
The full spacetime model is called the Friedmann-Lemaître-Robertson-Walker (FLRW) metric.

The first Friedmann equation relates the expansion rate to the energy content:

$$H^2 = \left(\frac{\dot{a}}{a}\right)^2 = \frac{8\pi G}{3}\rho - \frac{kc^2}{a^2} + \frac{\Lambda c^2}{3}$$

Here $H$ is the [Hubble parameter](./hubble-parameter.md), $a$ is the [scale factor](./scale-factor.md), $\rho$ is the total energy density, $k$ is the spatial curvature parameter ($k = 0$ for flat, $+1$ for closed, $-1$ for open), and $\Lambda$ is the cosmological constant ([dark energy](../../structure/terms/dark-energy.md)).

The second Friedmann equation (the acceleration equation) governs whether the expansion is speeding up or slowing down:

$$\frac{\ddot{a}}{a} = -\frac{4\pi G}{3}\left(\rho + \frac{3p}{c^2}\right) + \frac{\Lambda c^2}{3}$$

where $p$ is pressure.
Matter ($p \geq 0$) decelerates expansion.
Dark energy ($\Lambda > 0$) accelerates it.

Together, these two equations -- given the composition of the universe -- determine the entire expansion history: how fast the universe expands at each epoch, whether it accelerates or decelerates, and its ultimate fate.
The [Lambda-CDM model](../../../terms/lambda-cdm-model.md) is the specific solution corresponding to a flat universe ($k = 0$) with ordinary matter, [dark matter](../../structure/terms/dark-matter.md), radiation, and a cosmological constant.
