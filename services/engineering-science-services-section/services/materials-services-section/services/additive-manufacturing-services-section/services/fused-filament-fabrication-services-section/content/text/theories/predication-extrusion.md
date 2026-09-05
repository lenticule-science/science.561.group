---
type: morphism
class: physical-transformation
depends-on: [filament, hotend, extruder]
---

# Extrusion (FFF)

The continuous transformation $\mathrm{extrude} : \mathrm{Filament} \times \mathrm{Heat} \times \mathrm{Pressure} \to \mathrm{Bead}$ in which solid feedstock is melted and forced through the nozzle orifice as a continuous bead. The dynamics of extrusion are responsible for most FFF tuning challenges: it is a non-Newtonian, pressure-driven, thermally-coupled flow problem that the slicer treats as a constant-volumetric-rate idealization.

Conceptual decomposition:

1. **Feed.** [Extruder](./predication-extruder.md) gear advances solid filament into the hotend at commanded volumetric rate $Q_{\mathrm{cmd}}$.
2. **Melt.** Filament traverses the heat-break and enters the heater-block melt zone. Heat conduction from the block raises the polymer above $T_m$ (or $T_g$ for amorphous polymers). Melt-zone length sets the maximum sustainable $Q$.
3. **Pressurize.** Molten polymer occupies the constrained volume of the melt zone and the nozzle taper. Feed pressure builds up in proportion to flow rate and inverse melt viscosity.
4. **Extrude.** Pressure forces polymer through the orifice as a free-surface jet. Die-swell (slight expansion at exit due to elastic recovery of polymer chains) sets effective bead width slightly above orifice diameter.
5. **Deposit.** The print-head moves laterally; the jet contacts the build surface and is "drawn" along the toolpath. Bead width $w = Q / (v \cdot h)$ is set by the geometric constraint of constant deposited volume into the layer-height-bounded gap.
6. **Cool.** The deposited bead loses heat by conduction (to substrate) and convection (to ambient and part-cooling air), passes through $T_g$, and solidifies. See [solidification](../../../../../content/text/theories/predication-solidification.md).

Where the slicer's idealization breaks down:

- **Pressure response is not instantaneous.** Velocity changes (corners, layer changes, retract-resume) require time for melt pressure to equilibrate. The bead at a corner is over-extruded on entry (residual pressure pushes excess polymer); under-extruded on exit (pressure not yet built up). [Pressure advance](./predication-pressure-advance.md) (Klipper) and [linear advance](./predication-pressure-advance.md) (Marlin) compensate.
- **Volumetric flow is bounded by melt rate.** Above $\sim 12$–$20$ mm³/s on a stock $0.4$ mm hotend, polymer enters the orifice partially-unmelted; bead is gappy, layer adhesion is weak. The slicer happily commands flows above the limit; the printer fails silently.
- **Polymer viscosity depends on temperature, shear rate, and chain composition.** A "PLA at $215$°C" idealization works only over a narrow process window; outside it the bead width drifts.

Extrusion is the morphism that determines whether a print is dimensionally accurate, mechanically strong, and aesthetically clean. Tuning the (extruder, hotend, profile) triple to match the slicer's idealization is most of FFF practice.
