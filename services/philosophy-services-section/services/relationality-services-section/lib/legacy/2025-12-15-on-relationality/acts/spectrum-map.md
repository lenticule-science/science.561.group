---
title: Spectrum Map
act: SpectrumMap
slug: spectrum-map
top: FixedNucleateProfile
bottom: SpectrumSeed
summary: >-
  Collapse the spectral seed via the fixed nucleus to extract the stable
  eigencomponent.
tags:
  - act
---
# Spectrum Map

The spectral map extracts eigenvalues/eigenshapes by comparing the seed to the
mode.  We use the fixed nucleus to collapse their difference, composing
[FixedNucleateProfile](fixed-nucleate-profile.md) with
[SpectrumSeed](spectrum-seed.md):
`(FixedNucleateProfile SpectrumSeed)` earns
***SpectrumMap***.

`SpectrumSeed` records the kernel’s action on harmonics, and
`FixedNucleateProfile` collapses recognitions under the fixed closure.  Their
composition isolates the stable part of that action—the eigencomponent—yielding
the spectrum map.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
