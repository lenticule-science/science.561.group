---
type: concept
class: design-pattern
depends-on: [shell, infill]
realizes: []
title: Lattice structure
description: A periodic or stochastic cellular geometry used as the interior of a part to achieve a target stiffness, energy absorption, surface area, or thermal-transport behavior at a fraction of the mass of a solid.
---

# Lattice structure

A periodic or stochastic cellular geometry used as the interior of a part to achieve a target stiffness, energy absorption, surface area, or thermal-transport behavior at a fraction of the mass of a solid. Lattices are an AM-native design pattern: they are the principal reason AM can make functional parts that other processes cannot.

## Families

- **Strut-based lattices.** Networks of beams. Examples: BCC, FCC, octet truss (Deshpande, Fleck, Ashby 2001), Kelvin cell. Mechanically well-characterized; behave near-isotropically when the strut aspect ratio is high.
- **TPMS (triply periodic minimal surfaces).** Smooth surfaces dividing space into two interpenetrating volumes. Examples: gyroid, Schwarz primitive, Schwarz diamond, IWP. Higher specific stiffness than strut lattices in compression; better for fluid flow and heat transfer because of smooth, non-tortuous channels (Maskery et al. 2018, Al-Ketan & Abu Al-Rub 2019).
- **Stochastic lattices.** Randomized strut networks, often Voronoi-based. Mechanically lower performing than periodic lattices but visually more "natural"; favored for medical-implant osseointegration.
- **Functionally graded lattices.** Lattices whose cell type, size, or relative density varies smoothly through the part. Enables stress-tailored implants and impact-energy-absorbing structures.

## Mechanics

- *Stretch-dominated* vs *bend-dominated* (Maxwell criterion). Stretch-dominated lattices (octet) have stiffness scaling linearly with relative density; bend-dominated (BCC, gyroid) scale quadratically. For light, stiff structures choose stretch-dominated; for energy absorption choose bend-dominated.
- *Homogenization.* The mature analytical tool: replace the lattice with a continuum of effective stiffness $C^*$ derived by asymptotic homogenization or RVE simulation. Implemented in nTopology, Altair OptiStruct.

## Why AM enables them

Conventional manufacturing (machining, casting) cannot make complex internal lattices. AM can, because it builds layer by layer with no tooling. The frontier is in the design tools: until recently lattice insertion was a per-cell tedious process; modern tools (nTopology, Carbon Design Engine, Altair Inspire) make field-driven lattice generation a one-click operation.

## Open questions

- Fatigue of lattices is not well-predicted by homogenization (which captures only stiffness). The active research is whether multiscale damage models (Liu et al. 2020) or experimental databases will close this gap.
- Manufacturability constraints (minimum strut size for FFF/LPBF, support requirements for unsupported lattice nodes) are still poorly integrated into design tools.

**See also.** [topology-optimization](./predication-topology-optimization.md), [generative-design-for-am](./predication-generative-design-for-am.md).
