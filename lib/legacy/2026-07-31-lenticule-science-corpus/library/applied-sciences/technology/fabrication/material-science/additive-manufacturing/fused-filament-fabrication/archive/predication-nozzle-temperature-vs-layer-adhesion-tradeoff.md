---
type: theorem
status: empirical
class: empirical-law
depends-on: [layer-adhesion, extrusion]
---

# Nozzle temperature vs. layer adhesion tradeoff

**Claim.** For a fixed FFF (machine, material, profile) triple, Z-axis tensile strength $\sigma_Z$ is monotone increasing in nozzle temperature $T_{\mathrm{nozzle}}$ over the printable range, until $T_{\mathrm{nozzle}}$ exceeds the polymer's thermal-degradation threshold (where $\sigma_Z$ collapses sharply). Within the printable range, the increase is approximately monotone but not necessarily linear: many published datasets fit a near-linear $\sigma_Z \approx \sigma_{Z,0} + \alpha (T_{\mathrm{nozzle}} - T_{\mathrm{ref}})$ over a $\sim 30$°C window with $\alpha$ in the rough range $0.3$–$0.8$ MPa/°C for common FFF thermoplastics, but the slope is material- and profile-dependent and the relationship saturates near the upper degradation threshold. The monotonicity is robust; the specific functional form is not.

**Mechanism.** Higher nozzle temperature increases two things relevant to layer bonding:
1. The instantaneous temperature of the freshly-deposited bead, raising the temperature of the bead-to-previous-layer interface to $T_{\mathrm{interface}} > T_g$ for longer.
2. The polymer's chain mobility above $T_g$, accelerating reptation-mediated diffusion across the interface.

Both extend the time the interface spends in the bond-forming regime, increasing the bond's molecular continuity. The bond strength scales as the fourth root of contact-time-above-$T_g$, but the contact-time itself scales near-linearly in $T_{\mathrm{nozzle}}$ over the printable window, producing the observed near-linear $\sigma_Z(T_{\mathrm{nozzle}})$ relationship.

**Quantitative reference points (PLA, $0.4$ mm nozzle, $0.2$ mm layer, $50$ mm/s, well-cooled):**
- $T_{\mathrm{nozzle}} = 195$°C: $\sigma_Z \approx 25$ MPa.
- $T_{\mathrm{nozzle}} = 215$°C: $\sigma_Z \approx 35$ MPa.
- $T_{\mathrm{nozzle}} = 235$°C: $\sigma_Z \approx 42$ MPa.
- $T_{\mathrm{nozzle}} = 255$°C: $\sigma_Z \approx 30$ MPa (degradation onset; PLA browns and embrittles).

**Costs of higher temperature.**
- **Stringing.** Higher temperature → lower viscosity → more travel-move ooze. See [stringing](teaching/explanations/stringing.md).
- **Overhang and bridging quality.** Hotter material takes longer to solidify; bridges sag, overhangs droop.
- **Surface finish.** Hotter beads spread more, blurring fine surface detail.
- **Thermal degradation.** All polymers degrade above some threshold ($\sim 250$°C for PLA, $\sim 270$°C for PETG, $\sim 290$°C for ABS, $\sim 320$°C for PA, $\sim 380$°C for PEEK). Above this temperature mechanical properties collapse and the polymer may release fumes (some toxic).

**Practical recipe.** When tuning a new (machine, material) pair: run a temperature tower (a calibration print spanning a range of nozzle temperatures across height) and visually inspect for the *highest* temperature at which surface, overhangs, and stringing are still acceptable. That setting maximizes layer adhesion subject to the constraint of all the other quality metrics.

**Don't.** A common error is to print at the lowest temperature where the bead "looks ok" — this minimizes layer adhesion. Z-strength is invisible in the print's appearance; the part looks fine until it fails under load.

**References.** Spoerk, M., et al. (2017). "Optimization of mechanical properties of fused filament fabrication parts." Sun, Q., et al. (2008). "Effect of processing conditions on the bonding quality of FDM polymer filaments."
