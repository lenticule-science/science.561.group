---
type: theorem
status: established
class: empirical-law
depends-on: [layer, infill, shell]
---

# Print time scales with volume, perimeter length, and layer count — not with bounding box

**Claim.** FFF print time is, to first order, a sum of contributions:

$$T \approx \frac{V_{\mathrm{infill}} \cdot \rho}{Q_{\mathrm{infill}}} + \frac{V_{\mathrm{shell}}}{Q_{\mathrm{shell}}} + N_{\mathrm{layer}} \cdot \tau_{\mathrm{layer-change}} + T_{\mathrm{travel}}$$

where $V$'s are volumes, $\rho$ is infill density, $Q$'s are volumetric flow rates (mm³/s), $N_{\mathrm{layer}}$ is layer count, $\tau_{\mathrm{layer-change}}$ is per-layer overhead, and $T_{\mathrm{travel}}$ aggregates non-extruding moves.

The bounding-box volume is *not* a primary determinant. A hollow cube and a small dense bracket of the same bounding box have very different print times.

**Implications for design.**

- **Halving infill density approximately halves infill time** but not perimeter or layer-change time. For an infill-dominated part, $\rho = 0.10 \to 0.20$ adds $\sim 30\%$ time; for a perimeter-dominated thin-walled part it adds $\sim 5\%$.
- **Doubling layer height approximately halves layer count** and roughly halves total time, at the cost of stair-stepping. This is the single most powerful slicer-side speedup: $0.20$ mm $\to 0.30$ mm layers cut time $\sim 30$–$40\%$.
- **Adding more perimeters increases shell time linearly** but increases strength sub-linearly. Three perimeters is usually the right balance.
- **Travel-move overhead scales with part complexity** more than part size. A part with many small disconnected islands accumulates retraction-and-travel time independent of its volume.

**Practical bound: maximum volumetric flow.** $Q_{\mathrm{shell}}$ and $Q_{\mathrm{infill}}$ are bounded by the printer's hotend melt-rate capacity. A typical $0.4$ mm nozzle on a stock heater block sustains $\sim 12$–$20$ mm³/s; high-flow hotends (E3D Volcano, Bondtech CHT, Bambu high-flow) push this to $35$–$60$ mm³/s. Slicer print speeds beyond this rate produce under-extrusion (layer thinning, gaps, weak layers), not faster prints.

**Corollary — speed limits.** "Print fast" is not a single parameter; it is bounded simultaneously by:
- Volumetric flow rate (hotend melt capacity)
- Maximum acceleration without ringing (motion system rigidity, input shaping)
- Cooling capacity (high deposition rate without cooling causes layer-time-too-short failures)
- Layer adhesion at speed (high-speed extrusion at low temperature causes weak bonds)

Bambu X1, Voron, Prusa MK4, and other "fast" printers achieve their speeds by tuning all four together. Pushing one (e.g., raw print speed) without the others produces fast garbage, not fast parts.

**Quantitative example.** A $50 \times 50 \times 50$ mm hollow box, 3 perimeters, 5 top/bottom solid layers, $20\%$ gyroid infill, $0.20$ mm layers, in PLA, on a tuned Prusa MK4: $\sim 4$h. Same box, $0.30$ mm layers: $\sim 2.5$h. Same box, $100\%$ infill, $0.20$ mm layers: $\sim 14$h. The bounding box never changed.
