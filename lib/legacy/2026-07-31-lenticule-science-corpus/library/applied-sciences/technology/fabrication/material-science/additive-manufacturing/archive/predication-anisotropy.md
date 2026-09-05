---
type: concept
class: mechanical-property
depends-on: [layer, build-orientation]
realizes: []
---

# Anisotropy (in additive manufacturing)

Direction-dependence of mechanical properties caused by the [layer](layer.md) discretization. An additively manufactured part is, in general, *transversely isotropic*: roughly isotropic in the XY plane (within a layer) and weaker along Z (across layers).

The three directions conventionally distinguished:

- **XY (in-plane):** strength approaches that of the bulk feedstock; failure is by intra-bead fracture.
- **Z (along build axis):** strength is set by inter-layer bond energy, typically $40$–$80\%$ of XY strength for FFF thermoplastics, higher (often $>95\%$) for vat-photopolymerization once fully post-cured, and approaching XY for fully-fused powder-bed processes.
- **45° to build axis:** intermediate; the relevant failure mode is shear along the layer plane.

Anisotropy is *not* a defect — it is structural to the process. The corresponding design rule (see [build-orientation](build-orientation.md) and [build-orientation-aligns-load-with-xy](../theorems/build-orientation-aligns-load-with-xy.md)) is to orient the part so that the dominant tensile load runs in-plane.

Process-specific notes:

- FFF: anisotropy ratio $\sigma_{Z} / \sigma_{XY}$ is highly dependent on nozzle temperature, layer time, and chamber temperature. Hotter and slower means better Z-strength (more thermal contact between layers) but more sagging on overhangs. See [nozzle-temperature-vs-layer-adhesion-tradeoff](theories/fused-filament-fabrication/theorems/nozzle-temperature-vs-layer-adhesion-tradeoff.md).
- SLA: anisotropy is small when post-cure is complete; "green" parts (uncured) are highly anisotropic.
- SLS/MJF: anisotropy is small (often within $5$–$10\%$) because powder-bed processes fully fuse at every voxel.
- Metal PBF (DMLS, EBM): anisotropy depends on grain growth and cooling rate; can be significant before HIP/heat-treatment, near-zero after.

Reporting AM mechanical data without specifying build orientation is a common error in the published literature.
