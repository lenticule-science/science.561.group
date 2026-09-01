---
type: morphism
class: physical-transformation
depends-on: [layer, adhesion]
---

# Solidification

The phase transition during AM in which deposited material transitions from a process-active state (molten, liquid, fused, partially-cured) to a structurally-stable solid state. Solidification is what locks in the layer geometry and what determines [inter-layer adhesion](./predication-adhesion.md), and its dynamics — *how fast and from what initial state to what final state* — is the dominant determinant of AM mechanical properties.

Process-by-process:

- **FFF:** Molten polymer extruded above $T_m$ (or above $T_g$ for amorphous polymers) cools by conduction to lower layer + convection to ambient air, crossing $T_g$ and re-solidifying. Critical interface: bond between newly-deposited bead and previously-deposited layer. The bond strength is set by polymer chain interdiffusion, which requires both interfaces to be above $T_g$ for a duration set by the polymer's reptation time. See [nozzle-temperature-vs-layer-adhesion-tradeoff](../../../services/fused-filament-fabrication-services-section/content/text/theories/predication-nozzle-temperature-vs-layer-adhesion-tradeoff.md).
- **SLA / DLP / MSLA:** Liquid photopolymer crosses gel point under UV exposure; further crosslinking continues with post-cure exposure. Critical interface: bond between current cure layer and prior cure layer, mediated by the partial-cure state of the prior layer surface (oxygen inhibition leaves a tacky surface that bonds well; if exposure is excessive the prior surface fully cures and bonds poorly).
- **PBF (SLS / MJF / DMLS):** Powder grains partially or fully melt under laser/IR/electron-beam energy and re-solidify, fusing to neighboring grains. Critical interface: bond between melt pool and surrounding powder. In metals, grain boundaries form during solidification and set anisotropy, hot-cracking susceptibility, and post-process heat-treatment requirements.
- **Material jetting (PolyJet):** Photopolymer droplets cure individually under UV pass-overs immediately following deposition. Critical interface: droplet-to-droplet wetting before cure.
- **DED:** Powder or wire melts in flight or on contact with a melt pool and re-solidifies. Critical mechanism: solidification rate (typically $10^4$–$10^6$ K/s) controls grain size and microstructure.

Solidification is the morphism in which AM mechanical properties are *literally produced*: a part's tensile strength, its Z-anisotropy, its residual stress field, and its potential failure modes are all determined by solidification dynamics, not by the bulk feedstock alone.
