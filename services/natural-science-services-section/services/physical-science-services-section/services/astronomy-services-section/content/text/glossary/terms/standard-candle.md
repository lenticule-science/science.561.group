---

name: "Standard Candle"
description: "A standard candle is an astronomical object whose intrinsic luminosity is known (or can be inferred from other observable properties), allowing its distance to be calculated from how bright it appears."
aliases:
  - "standard candle"
  - "standard candles"
date-created: 2026-03-31
requires:
  - light
enables:
  - type-ia-supernova
  - cosmic-distance-ladder
---

A standard candle is an astronomical object whose intrinsic luminosity is known (or can be inferred from other observable properties), allowing its distance to be calculated from how bright it appears.

The principle is straightforward: if you know how much [light](../../../../services/cosmology-services-section/content/text/glossary/terms/light.md) a source actually emits (its luminosity) and you measure how much light you receive (its apparent brightness), the inverse-square law gives the distance.
Apparent brightness falls off as the square of the distance, so $d = \sqrt{L / 4\pi F}$, where $L$ is luminosity and $F$ is observed flux.

The challenge is finding objects with reliably known luminosities.
The most important standard candles in cosmology are:

**Cepheid variable stars.** These pulsating stars obey a period-luminosity relation discovered by Henrietta Leavitt in 1912: brighter Cepheids pulsate more slowly.
Measuring the pulsation period gives the luminosity.
Cepheids are visible in nearby galaxies out to about 30 megaparsecs.

**[Type Ia supernovae](type-ia-supernova.md).** The thermonuclear explosions of white dwarf stars.
After correcting for the shape of the light curve (brighter supernovae decline more slowly), their peak luminosity is remarkably uniform.
They are visible at cosmological distances and are the primary tool for measuring the [accelerating expansion](accelerating-expansion.md).

Standard candles are the foundation of the [cosmic distance ladder](cosmic-distance-ladder.md).
