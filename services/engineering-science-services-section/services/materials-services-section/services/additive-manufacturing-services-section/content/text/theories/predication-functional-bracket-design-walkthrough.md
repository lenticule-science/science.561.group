---
type: example
class: design-walkthrough
instantiates: [build-orientation, build-orientation-aligns-load-with-xy, overhang-angle-rule, rib, infill]
depends-on: []
---

# Worked example — functional L-bracket for FFF

A walkthrough of design-for-AM choices on a small functional part.

**Part.** L-bracket, 50 mm × 50 mm × 30 mm, 5 mm wall thickness, two M4 mounting holes on each leg. Material: PETG. Service load: 20 N normal to one leg, applied at the leg tip, in steady-state (not impact, not cyclic above 100 cycles).

**Step 1: Identify dominant load.**
- Tensile/bending stress concentrated at the inner radius of the L corner.
- Stress direction at the corner: tension on the outer fiber, compression on the inner fiber, both perpendicular to the L's bend axis (along Y, say).

**Step 2: Choose build orientation per [build-orientation-aligns-load-with-xy](./predication-build-orientation-aligns-load-with-xy.md).**
- The corner stress is in-plane to *both* L legs. Aligning the L with the XY plane (printing flat, with the L lying on the build plate) places the stress in the XY direction. Z anisotropy is irrelevant.
- Verify against the [overhang rule](./predication-overhang-angle-rule.md): a flat L has no overhangs except possibly the inside corner radius. With the L flat on the plate, this prints cleanly.
- Verify against build-volume: 50 × 50 × 5 mm fits in any printer.
- Conclusion: **print flat on the build plate.**

**Step 3: Reinforcement design ([ribs](./predication-rib.md)).**
- For 20 N at 30 mm lever arm in PETG with 5 mm wall, simple beam check: stress ≈ $6 F L / (b t^2)$ ≈ $6 \cdot 20 \cdot 30 / (50 \cdot 25)$ ≈ $2.9$ MPa. PETG yield ≈ 50 MPa. Factor of safety 17, no rib needed for strength.
- Stiffness: for $\delta = F L^3 / (3 E I)$ with $E_{\mathrm{PETG}}$ ≈ 2 GPa, $I = b t^3 / 12 = 50 \cdot 125 / 12$ ≈ 520 mm⁴, deflection ≈ $20 \cdot 27000 / (3 \cdot 2000 \cdot 520)$ ≈ 0.17 mm. Acceptable for most uses; if not, add a single triangular gusset rib at the corner (height 15 mm, thickness 1.6 mm = 4 perimeters at 0.4 mm).

**Step 4: [Infill](./predication-infill.md) choice.**
- For 5 mm wall thickness, 3 perimeters at 0.45 mm width = 1.35 mm of solid wall on each side. Remaining 2.3 mm cross-section is infill.
- 20% gyroid is fine — far above the strength margin needed.

**Step 5: Hole accuracy.**
- M4 holes (4.0 mm) printed in the XY direction — they will print as approximately circular (well, octagonal-ish at 0.20 mm layer height). Expect $-0.1$ to $-0.3$ mm hole shrinkage from extrusion squish.
- Print holes at $4.2$ mm nominal; ream to $4.0$ mm with a hand reamer if precision required.
- Alternative: print at $5.0$ mm and use M4 [heat-set inserts](https://www.cnckitchen.com/blog/heat-staking-of-fdm-printed-parts) for repeated assembly.

**Step 6: Profile choices.**
- Layer height: 0.20 mm (standard).
- Perimeters: 3 (gives 1.35 mm wall, exceeds 5 mm/2 = 2.5 mm at outermost; structural).
- Top/bottom: 5/5 layers (1 mm solid skin).
- Cooling: 50% (PETG mid-range).
- Nozzle: 235°C, bed: 80°C.
- Brim: 5 mm (PETG sticks well to PEI; brim is insurance, not required).

**Outcome and verification.**
- Print time on a Prusa MK4: ~1h 30 min, ~25 g of filament.
- Verify by load test: should sustain 20 N indefinitely with $\leq 0.2$ mm deflection at the tip.
- If part fails in service, expected failure mode is at the inside corner — cracking along the layer plane in the corner region. Mitigation: add a fillet at the inside corner (radius 3 mm) to reduce stress concentration; this is a CAD change, not a slicer change.
