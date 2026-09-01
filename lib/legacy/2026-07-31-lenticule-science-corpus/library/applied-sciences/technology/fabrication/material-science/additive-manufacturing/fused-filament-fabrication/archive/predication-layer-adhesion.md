---
type: concept
class: bonding
depends-on: [bead]
realizes: []
see-also: []
---

# Layer adhesion (FFF-specific)

The bond between bead $b_i$ on layer $L_i$ and the bead $b_{i+1}$ deposited directly above it on layer $L_{i+1}$. In FFF, layer adhesion is the dominant failure mode for Z-axis tensile and shear loads and the proximate cause of the AM [anisotropy](../../teaching/explanations/anisotropy.md).

Mechanism. When $b_{i+1}$ is deposited at $T \approx T_{\mathrm{nozzle}} \gg T_g$, it contacts the surface of $b_i$ at some lower temperature $T_{\mathrm{interface}}$. If $T_{\mathrm{interface}} > T_g$, polymer chains in $b_i$ are above their reptation threshold and can interdiffuse across the new interface. Interdiffusion proceeds for a time $\tau$ until $T_{\mathrm{interface}}$ falls below $T_g$. The bond strength scales roughly as

$$\sigma_{\mathrm{Z}} \propto \min(\tau, \tau_{\mathrm{rep}})^{1/4}$$

where $\tau_{\mathrm{rep}}$ is the polymer's characteristic reptation time at the interface temperature.

Three controls:

1. **Energy delivered to the interface** — set by nozzle temperature and bead volume per unit time. Hotter, fatter beads deliver more energy. Increasing nozzle temperature is the most direct tuning lever.
2. **Time the interface stays above $T_g$** — set by ambient/chamber temperature, layer time (small layers cool less per layer), and cooling-fan setting. An enclosure raises ambient toward $T_g$, dramatically extending the bond-forming window.
3. **Cleanliness of the interface** — set by retraction tuning, ooze, oxidation. Over-extruded blobs left behind by the previous bead reduce contact area on the new one.

Failure modes:

- **Delamination** — visible separation between two adjacent layers, often along a horizontal plane on a tall part. Indicates inadequate energy or excessive cooling.
- **Brittle Z-failure** — part snaps cleanly along a layer boundary under load below bulk yield strength. Indicates marginal but present layer adhesion.
- **Layer slip** — part visibly offset above some layer, with the offset constant for all subsequent layers. Indicates the part was pushed by the nozzle during a layer change; usually a first-layer or detachment problem rather than adhesion proper.

Diagnostic test: print a [layer-adhesion test bar](https://github.com/3DPrintHub/3D-printer-test-models) — a notched coupon designed for Z-axis pull testing. Measured Z-tensile strength can be normalized against bulk material strength to compute the anisotropy ratio for a given (machine, material, profile) triple.
