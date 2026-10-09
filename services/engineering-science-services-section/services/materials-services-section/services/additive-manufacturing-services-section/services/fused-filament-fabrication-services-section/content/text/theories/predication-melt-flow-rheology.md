---
type: concept
class: process-physics
depends-on: [bead, extrusion-multiplier]
realizes: []
title: Melt-flow rheology (in FFF)
description: The non-Newtonian flow behavior of molten thermoplastic in the FFF hot-end.
---

# Melt-flow rheology (in FFF)

The non-Newtonian flow behavior of molten thermoplastic in the FFF hot-end. Determines the maximum achievable flow rate, the pressure field along the melt zone, and the consistency of the extruded bead. The unifying physics behind nearly every FFF tuning artifact (under-extrusion at high speed, pressure-advance, Coriolis-corrected flow, "elephant-foot" first layer).

## The rheology

FFF thermoplastic melts are *shear-thinning* (viscosity drops as shear rate rises) and weakly viscoelastic. The standard model is the Cross or Carreau–Yasuda equation:

$$
\eta(\dot\gamma, T) \;=\; \frac{\eta_0(T)}{1 + (\lambda \dot\gamma)^{1-n}}
$$

with zero-shear viscosity $\eta_0(T)$ following an Arrhenius or WLF temperature dependence:

$$
\eta_0(T) \;=\; \eta_{0,\text{ref}} \exp\!\left(\frac{E_a}{R}\!\left(\frac{1}{T}-\frac{1}{T_{\text{ref}}}\right)\right)
$$

For PLA at 200°C: $\eta_0 \sim 10^3$ Pa·s, $\lambda \sim 0.1$ s, $n \sim 0.4$. For PETG at 230°C: $\eta_0 \sim 5 \times 10^2$ Pa·s. ABS sits between.

## Why FFF cares

1. **Maximum volumetric flow rate $\dot V_{\max}$.** Set by the rate at which the hot-end can deliver heat to melt incoming filament *and* the rate at which the resulting melt can flow through the nozzle. Once shear rate at the nozzle exceeds the shear-thinning knee, viscosity drops and back-pressure stabilizes — this is the regime where high-flow hot-ends (Volcano, CHT, Mosquito Magnum) operate. A typical commodity hot-end maxes out at $\dot V_{\max} \sim 10$–$15$ mm³/s (PLA, 0.4 mm nozzle); high-flow hot-ends reach $25$–$35$ mm³/s.

2. **Pressure-advance.** The compressed melt in the upstream channel acts as a capacitor: when the toolhead decelerates, residual pressure continues to push melt through the nozzle, causing over-extrusion at corners (blobs). Pressure-advance algorithms (Klipper PA, Marlin Linear Advance) precompensate by retracting the extruder during deceleration. The required PA value scales with $\eta_0 \cdot L_{\text{melt-zone}}$ and is therefore material- and hot-end-dependent.

3. **Bead spreading.** When the extruded bead lands on the layer below, it spreads under nozzle pressure into a roughly rectangular cross-section of width $w \approx \dot V / (h \cdot v)$ (volume conservation), where $h$ is layer height and $v$ is print speed. The spreading is rheology-mediated; cold spreading (PETG at 220°C) gives narrower beads than hot spreading (PETG at 250°C) at the same volumetric rate.

4. **Die swell.** Polymer melt exiting a die expands due to elastic recovery (Barus, 1893; Tanner 1970). Modest in FFF — die-swell ratio ~1.05–1.15 for typical PLA — but contributes to the gap between commanded flow and actual bead width.

## Models and references

- **Bellini, A., Güçeri, S., Bertoldi, M. (2004).** "Liquefier dynamics in fused deposition." *Journal of Manufacturing Science and Engineering*. The first end-to-end FFF hot-end model: melt-zone geometry, heat transfer, pressure-driven flow, with experimental validation. Still the canonical reference.
- **Phan, D. D., Horner, J. S., Swain, Z. R., Beris, A. N., Mackay, M. E. (2020).** "Computational fluid dynamics simulation of the melting process in the fused filament fabrication additive manufacturing technique." *Additive Manufacturing* 33. Modern multi-physics solve, validated against pressure-drop and flow-rate experiments.
- **Mackay, M. E., et al. (2017).** "The performance of the hot end in a plasticating 3D printer." *Journal of Rheology* 61. Rheological characterization of commodity FFF feedstocks; identifies the volumetric-flow-rate ceiling.
- **Serdeczny, M. P., et al. (2018, 2020).** Series of papers modeling extrusion, deposition, and bead-spreading; validate against high-speed video of the deposition process.

## Implications for tuning

- A "max volumetric speed" cap in modern slicers (PrusaSlicer, OrcaSlicer) is the rheology-respecting way to set print speed independent of layer height and line width. Underused by intermediate users; standard practice for advanced users.
- Pressure-advance needs to be re-tuned per material per hot-end per nozzle; a stored value transfers poorly.
- "High-flow nozzles" (CHT, ObXidian, Bondtech CHT) work by adding multiple parallel flow channels that reduce shear rate per channel, shifting the operating point further into the shear-thinning regime.

## Frontier

- *Closed-loop flow control.* Real-time pressure measurement in the melt zone, feeding back to extruder velocity. See [closed-loop-flow-control](./predication-closed-loop-flow-control.md) open question.
- *Crystallization-coupled flow.* For semi-crystalline polymers (PA, PEEK), crystallization during cooling alters bead viscoelastic recovery and hence final bead geometry. Active research area.
- *Fiber-loaded rheology.* Carbon-fiber-reinforced and glass-fiber-reinforced FFF feedstocks shear-align fibers as they flow through the nozzle, producing strongly anisotropic deposited beads. The rheology is rod-suspension rheology (Folgar–Tucker, 1984) coupled to FFF flow geometry; modeled by Brenken et al. (2018), Heller et al. (2016).
