---

title: "Scale Factor"
description: "The scale factor $a(t)$ is a dimensionless function that describes how distances in the universe grow over time. It is the central dynamical variable of cosmology."
aliases:
  - "scale factor"
  - "a(t)"
date-created: 2026-03-31
requires:
  - cosmic-expansion
enables:
  - hubble-parameter
  - friedmann-equations
  - redshift
---

The scale factor $a(t)$ is a dimensionless function that describes how distances in the universe grow over time. It is the central dynamical variable of cosmology.

If two galaxies are separated by a distance $d_0$ at a reference time $t_0$, their separation at any other time $t$ is $d(t) = a(t) \cdot d_0 / a(t_0)$. By convention, $a$ is set to 1 at the present epoch. At earlier times $a < 1$ (the universe was smaller); at later times $a > 1$ (it will be larger).

The scale factor encodes the entire expansion history of the universe. Its time derivative gives the expansion rate. The [Hubble parameter](./hubble-parameter.md) is defined as $H(t) = \dot{a}(t)/a(t)$. The [Friedmann equations](./friedmann-equations.md) are differential equations for $a(t)$ that depend on the energy content of the universe.

The [redshift](../../../terms/redshift.md) of light from a distant source is directly related to the scale factor at the time the light was emitted: $1 + z = a_{\text{now}} / a_{\text{emit}} = 1 / a_{\text{emit}}$, since $a_{\text{now}} = 1$. A galaxy observed at redshift $z = 1$ emitted its light when the universe was half its current size. The [cosmic microwave background](../../structure/terms/cosmic-microwave-background.md) has redshift $z \approx 1100$, meaning the universe was about 1,100 times smaller when that light was released.
