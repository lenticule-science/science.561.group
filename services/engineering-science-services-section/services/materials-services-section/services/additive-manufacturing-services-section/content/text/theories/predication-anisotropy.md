---
type: concept
class: mechanical-property
depends-on: [layer, build-orientation]
realizes: []
title: Anisotropy (in additive manufacturing)
description: Direction-dependence of mechanical properties caused by the layer discretization.
aliases:
  - Anisotropy (in materials)
see-also: []
---

# Anisotropy (in additive manufacturing)

Direction-dependence of mechanical properties caused by the [layer](./predication-layer.md) discretization. An additively manufactured part is, in general, *transversely isotropic*: roughly isotropic in the XY plane (within a layer) and weaker along Z (across layers).

The three directions conventionally distinguished:

- **XY (in-plane):** strength approaches that of the bulk feedstock; failure is by intra-bead fracture.
- **Z (along build axis):** strength is set by inter-layer bond energy, typically $40$–$80\%$ of XY strength for FFF thermoplastics, higher (often $>95\%$) for vat-photopolymerization once fully post-cured, and approaching XY for fully-fused powder-bed processes.
- **45° to build axis:** intermediate; the relevant failure mode is shear along the layer plane.

Anisotropy is *not* a defect — it is structural to the process. The corresponding design rule (see [build-orientation](./predication-build-orientation.md) and [build-orientation-aligns-load-with-xy](./predication-build-orientation-aligns-load-with-xy.md)) is to orient the part so that the dominant tensile load runs in-plane.

Process-specific notes:

- FFF: anisotropy ratio $\sigma_{Z} / \sigma_{XY}$ is highly dependent on nozzle temperature, layer time, and chamber temperature. Hotter and slower means better Z-strength (more thermal contact between layers) but more sagging on overhangs. See [nozzle-temperature-vs-layer-adhesion-tradeoff](../../../services/fused-filament-fabrication-services-section/content/text/theories/predication-nozzle-temperature-vs-layer-adhesion-tradeoff.md).
- SLA: anisotropy is small when post-cure is complete; "green" parts (uncured) are highly anisotropic.
- SLS/MJF: anisotropy is small (often within $5$–$10\%$) because powder-bed processes fully fuse at every voxel.
- Metal PBF (DMLS, EBM): anisotropy depends on grain growth and cooling rate; can be significant before HIP/heat-treatment, near-zero after.

Reporting AM mechanical data without specifying build orientation is a common error in the published literature.


---

<!-- source: fabrication/material-science/archive/predication-anisotropy.md -->

## Imported source: fabrication/material-science/archive/predication-anisotropy.md

---
type: concept
class: mechanical-property
depends-on: []
see-also: []
---

# Anisotropy (in materials)

Direction-dependence of a material property. A property $P$ is **isotropic** if its measured value is independent of direction in the material; **anisotropic** if it varies. Anisotropy is rarely binary — most engineering materials are *transversely isotropic* (one weak direction, isotropic plane perpendicular) or *orthotropic* (three mutually perpendicular axes with distinct properties).

**Sources of anisotropy.**

- **Process geometry.** Additive manufacturing's [layer](./predication-layer.md) discretization produces transverse isotropy aligned with the build axis. Roll-direction texture in sheet metal is similar in origin.
- **Crystallographic texture.** Cast or formed metals have grain orientations resulting from solidification or cold work. Single-crystal alloys are extreme cases.
- **Reinforcement orientation.** Fiber-reinforced composites (CF, GF, aramid) have very high anisotropy ratios — fiber-direction modulus may be $10$–$50\times$ transverse-direction modulus.
- **Polymer chain orientation.** Drawn or oriented polymers (fiber, biaxially-oriented film) have aligned chains and direction-dependent strength.

**Engineering consequence.** Specifying a material property without specifying direction is an error for any non-isotropic material. Common mistakes in published AM data: reporting "tensile strength of FDM-printed PLA = 50 MPa" without specifying build orientation. Without orientation, the number is meaningless — the same material printed in different orientations spans $25$–$60$ MPa.

**Anisotropy ratio.** $r = P_{\mathrm{weak}} / P_{\mathrm{strong}}$ summarizes the anisotropy. Engineering convention varies; for AM the common convention is $r = \sigma_Z / \sigma_{XY}$.

| Material / process | Anisotropy ratio (rough) |
|---|---|
| Cast aluminum, isotropic alloy | $r \approx 1.0$ |
| Forged steel, longitudinal vs transverse | $r \approx 0.85$–$0.95$ |
| FFF PLA | $r \approx 0.5$–$0.7$ |
| FFF PETG | $r \approx 0.6$–$0.8$ |
| FFF PA-CF, fiber-aligned printing | $r \approx 0.3$ in fiber-perpendicular direction |
| SLA, post-cured | $r \approx 0.9$–$0.98$ |
| SLS PA | $r \approx 0.85$–$0.95$ |
| Carbon-fiber prepreg laminate | $r \approx 0.05$–$0.10$ in transverse direction |

**Design implication.** Orient the part so that the dominant load is in the strong direction. For AM, this is the [build-orientation](./predication-build-orientation.md) choice; for composites, this is the lay-up sequence; for forged parts, this is the orientation in the die.

**Anisotropy does not always shrink to zero.** Even ideally-isotropic processes (powder-bed fully fused, post-HIP DMLS) retain trace anisotropy from texture, residual stress, or solidification gradients. The engineering question is whether the residual anisotropy is small enough relative to design margins.

## Earlier material

Anisotropy is *not* a defect — it is structural to the process. The corresponding design rule (see [build-orientation](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/archive/build-orientation.md) and [build-orientation-aligns-load-with-xy](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/theorems/build-orientation-aligns-load-with-xy.md)) is to orient the part so that the dominant tensile load runs in-plane.
