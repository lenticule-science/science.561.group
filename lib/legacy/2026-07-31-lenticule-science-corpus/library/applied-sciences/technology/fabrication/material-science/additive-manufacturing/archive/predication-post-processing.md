---
type: morphism
class: physical-transformation
depends-on: []
---

# Post-processing

The transformation $\mathrm{post} : \mathrm{GreenPart} \to \mathrm{FinishedPart}$ — every operation between the green part leaving the machine and the part being usable. Post-processing is often the largest cost component of AM by labor-hour, and "the AM workflow" includes it; a process that requires 4 hours of post-processing per print is not a 1-hour print.

Post-processing categories:

**Universal:**
- **Support removal.** Mechanical for break-away supports, dissolution for soluble supports.
- **Build-plate removal.** Spatula, flex plate flexion, heat cycling.
- **Cleaning.** Loose powder removal (PBF), uncured resin rinse (SLA), washing.

**FFF-specific:**
- **Layer-line removal.** Sanding (coarse → fine), filling-and-painting, vapor smoothing for ABS/ASA (acetone) or HIPS (limonene).
- **Annealing.** Heat-treat below $T_m$ to drive crystallization (PLA, PA) — increases strength and heat resistance, causes 1–3% dimensional shrinkage.
- **Drilling/tapping.** AM-printed holes are dimensionally inaccurate (Z holes are stair-stepped, XY holes are bridged); post-process by drilling or installing heat-set inserts.
- **Joining.** Friction welding, solvent welding, adhesive bonding for multi-part prints exceeding build volume.

**SLA-specific:**
- **IPA wash.** Two-bath isopropyl alcohol rinse to remove uncured resin.
- **UV post-cure.** Chamber UV cure, often at elevated temperature, to drive crosslinking to completion. Mechanical properties typically double from green to post-cured state.
- **Thermal post-cure.** For high-performance dental/medical resins.

**PBF-specific:**
- **Powder removal (depowdering).** Brushing, blasting, ultrasonic cleaning.
- **Sintering.** For binder-jet green parts, kiln cycle to fuse particles.
- **Infiltration.** Bronze infusion for binder-jet steel; epoxy seal for plastic SLS.
- **Surface finishing.** Bead-blasting, dyeing, vibratory tumbling, electroplating.

**Metal AM:**
- **Stress relief.** Heat treatment on build plate before removal.
- **Cut-off from build plate.** Wire EDM, bandsaw.
- **HIP (hot isostatic pressing).** $\sim 1000$°C, $\sim 100$ MPa, several hours — closes internal porosity, dramatically improves fatigue life.
- **Heat treatment.** Solution + age for precipitation-hardening alloys.
- **CNC finishing.** Mating surfaces machined to tolerance.

The design-for-AM principle that emerges: **post-processing requirements should be a primary input to part design**, not an afterthought. A part that needs no support and tolerates as-printed surface finish costs $1\times$; a part that needs supports plus sanding plus annealing plus tapped inserts costs $5$–$10\times$ in total labor-hour.
