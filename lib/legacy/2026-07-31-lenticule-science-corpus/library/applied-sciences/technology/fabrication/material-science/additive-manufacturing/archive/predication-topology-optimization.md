---
type: concept
class: design-method
depends-on: [build-orientation]
realizes: []
---

# Topology optimization (for AM)

A computational design method that, given a design domain, loads, supports, and a target volume fraction, produces the material distribution that minimizes a chosen objective (typically compliance under load). Pioneered by Bendsøe & Kikuchi (1988); standard formulations include SIMP (Solid Isotropic Material with Penalization), level-set, and BESO (Bidirectional Evolutionary Structural Optimization).

## Why TO and AM are complementary

Pure TO produces "organic" geometries — smooth, branching, porous — that are typically unmanufacturable by machining or casting. AM imposes weak manufacturability constraints, so it can build these geometries directly. The combination has produced the visual signature of "AM design": the bracket-with-organic-rib, the lattice-filled bone-mimetic implant.

## TO with AM constraints

Naive TO ignores AM-specific constraints; the potential research integrates them:

- **Self-supporting overhangs.** Add an angular constraint so that the optimized geometry has no overhangs steeper than ~45° from the build axis (Allaire et al. 2017, Langelaar 2018). Reduces support requirements.
- **Minimum feature size.** Penalize features below the process resolution (~0.4 mm for FFF, ~0.1 mm for LPBF) so the optimizer does not produce filigree the printer cannot resolve (Lazarov & Wang 2017).
- **Build-orientation as design variable.** Treat build orientation itself as an optimization variable, since orientation affects anisotropy, support cost, and surface finish (Mirzendehdel & Suresh 2019).
- **Anisotropy.** Optimize against the anisotropic material model rather than assuming isotropy.

## Generative AI for design

A 2022– wave: train a neural network to produce design candidates, optionally conditioned on loads and boundary conditions, then evaluate by FEA. Examples: ToplogyGAN, neural-implicit field representations. Currently augments rather than replaces classical TO; the open question is whether neural-generated designs will reach engineering acceptability without hand-tweaking.

## Toolchain (2026)

- *Research-grade.* TopOpt (DTU), MMA, Truss-Geom, Fenics-based custom codes.
- *Commercial general-purpose.* Altair OptiStruct, Ansys Discovery, Dassault Tosca.
- *AM-native.* nTopology (field-driven, lattice-aware), Autodesk Generative Design, PTC Creo Generative.

The gap between commercial TO output and a printable STL has narrowed dramatically since 2018; the gap between printable STL and a *certified* part remains the bottleneck. See [qualification-and-certification](questions/qualification-and-certification.md).
