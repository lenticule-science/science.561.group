---
title: Harmonic Basis
act: HarmonicBasis
slug: harmonic-basis
top: HarmonicMode
bottom: FixedInvariantLattice
summary: Collect all stable harmonics by letting `HarmonicMode` witness the invariant lattice.
tags:
- act
layer: act
status: plan
---
# Harmonic Basis

Harmonic modes span the oscillatory recognitions of the fixed profile.
To collect all modes we let
[HarmonicMode](harmonic-mode.md) witness
[FixedInvariantLattice](fixed-invariant-lattice.md):
`(HarmonicMode FixedInvariantLattice)` earns
***HarmonicBasis***.

`HarmonicMode` yields one stable oscillatory shape, and
`FixedInvariantLattice` provides the meet–join structure for combining modes.
Their composition produces every harmonic mode expressible from invariant
states, forming the harmonic basis.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
