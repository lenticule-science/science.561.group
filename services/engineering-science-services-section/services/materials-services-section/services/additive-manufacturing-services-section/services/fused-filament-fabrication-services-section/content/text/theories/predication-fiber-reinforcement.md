---
type: concept
class: feedstock-class
depends-on: [bead, melt-flow-rheology]
realizes: []
---

# Fiber-reinforced FFF

FFF feedstock loaded with short or continuous reinforcing fibers — most commonly chopped carbon fiber, chopped glass fiber, or continuous carbon fiber (Markforged-style). Used to raise specific stiffness (ratio of stiffness to density) above what neat polymer can deliver, and to suppress warping in semi-crystalline matrices.

## Two distinct technologies

1. **Short-fiber-loaded filament.** Standard FFF feedstock with 10–30% by weight chopped fibers ($\sim 100$ μm length, $\sim 7$ μm diameter for carbon fiber). Examples: PA-CF (nylon + carbon), PETG-CF, PEEK-CF. Compatible with standard FFF hardware *plus* a hardened steel or ruby nozzle (carbon fiber is highly abrasive and destroys brass nozzles in tens of hours).

2. **Continuous-fiber FFF (Markforged Mark Two, Anisoprint).** A second nozzle deposits a continuous carbon-fiber tow inside selected regions of the part. The tow is bonded to a polymer matrix (nylon, PEEK) deposited by the primary nozzle. Achieves much higher specific stiffness and strength than short-fiber, approaching aluminum performance.

## Mechanics

Short fibers in FFF align preferentially along the bead direction during extrusion (Folgar–Tucker fiber-orientation kinetics in shear flow; Heller et al. 2016, Brenken et al. 2018). The result:

- *In-bead direction.* Stiffness 2–5× neat polymer.
- *Transverse to bead.* Stiffness only slightly elevated.
- *Z (across layers).* No reinforcement; bonds remain matrix-only.

So fiber-reinforced FFF amplifies anisotropy rather than reducing it. Build orientation matters even more, not less.

Continuous-fiber FFF has the same alignment behavior at the bead scale plus the macroscale fiber-tow path. Specific stiffness in the fiber direction approaches CFRP-prepreg values (~80% of vacuum-bagged composite for the highest fiber-fraction Markforged products).

## Why use it

- *Specific stiffness for end-use parts.* Robotic arms, drone frames, fixtures, jigs.
- *Warping suppression.* Fibers act as mechanical anchors against polymer cooling shrinkage. PA-CF warps far less than neat PA. This is the practical reason most "engineering FFF" is fiber-loaded.
- *Dimensional stability.* Lower CTE than neat polymer; better tolerance hold over service temperature.

## Process challenges

- *Nozzle wear.* Carbon and glass fibers are abrasive. Hardened steel nozzles (Olsson Ruby, Nozzle X, Bondtech CHT-HF) are required; lifetime $\sim 100$–$500$ hours of CF printing.
- *Inter-layer bond.* Fibers bridge bead-to-bead in-plane but not layer-to-layer. The matrix at the layer interface still controls Z-strength; high chamber temperature is essential.
- *Print speed.* Higher viscosity than neat polymer at the same temperature; max volumetric flow rate drops.
- *Drying.* PA-CF is doubly hygroscopic (matrix + fiber surface treatment); drying discipline is critical.

## Open frontier

- *Modeling fiber alignment in complex toolpaths.* Folgar–Tucker is well-validated for steady simple shear; FFF flow has acceleration, deceleration, corners. Coupled rheology + fiber-orientation simulation (Heller et al. 2016, Wang et al. 2018) is research-stage.
- *Continuous-fiber path optimization.* The placement of continuous fiber is a design problem analogous to topology optimization. Research: Schmidt et al. 2018, Yamamoto et al. 2020.
- *Recyclability.* Recycled CF-FFF feedstock has poor fiber length retention; the field is unsolved.

## References

- **Brenken, B., et al. (2018).** "Fused filament fabrication of fiber-reinforced polymers: A review." *Additive Manufacturing* 21.
- **Heller, B. P., Smith, D. E., Jack, D. A. (2016).** "Effects of extrudate swell and nozzle geometry on fiber orientation in fused filament fabrication." *Additive Manufacturing* 12.
- **van der Klift, F., et al. (2016).** "3D Printing of Continuous Carbon Fibre Reinforced Thermo-Plastic (CFRTP) Tensile Test Specimens." *Open Journal of Composite Materials* 6.
