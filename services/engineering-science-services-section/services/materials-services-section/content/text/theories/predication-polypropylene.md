---
type: object
class: commodity-polymer
depends-on: [crystallinity, glass-transition]
---

# Polypropylene (PP)

A semi-crystalline polyolefin; one of the world's highest-volume commodity polymers, used everywhere conventional plastics are: containers, automotive interiors, fibers, films, living-hinge consumer products. Notoriously hard to FFF-print because of high crystallinity, low surface energy, and high CTE.

## Properties

| Property | Value | Notes |
|---|---|---|
| $T_g$ | $-10$°C (atactic) to $+5$°C (isotactic) | Below room temperature; rubbery at use |
| $T_m$ | 130–171°C | Depends on tacticity and copolymer fraction |
| Tensile strength | 25–35 MPa | Low among FFF polymers |
| Elongation at break | 100–600% | High; ductile |
| Density | 0.90 g/cm³ | Lowest of common FFF polymers; floats on water |
| CTE | $1.5 \times 10^{-4}$ /°C | High |
| Chemical resistance | Excellent | Acids, bases, most organic solvents |
| Living-hinge fatigue | $> 10^7$ cycles | Best of common polymers |

## Why FFF-PP was historically impossible

1. **No build sheet adheres to it.** PP has very low surface energy (~30 mJ/m²); it does not wet PEI, glass, BuildTak, or any common FFF build surface. The only thing PP adheres to is *other PP*.

2. **High crystallinity, fast crystallization.** PP crystallizes within seconds of cooling below $T_m$, with substantial volumetric contraction. The result is severe warping immediately at deposition.

3. **High CTE.** Among the highest of common polymers; warping forces at the build-plate corners are large.

## How modern FFF-PP works

The Spoerk-et-al. line of work (2017–2020) figured out how to print PP reliably:

1. **Nucleating agents in feedstock formulation.** Sub-micron particles (often $\beta$-nucleators like NU-100 or hyperbranched polyethylene) trigger nucleation at many sites simultaneously, producing fine-grained crystallinity and reducing macroscale warping. Commercial offerings: Verbatim Primalloy, BASF Ultrafuse PP, Polymaker PolyMide PP-CF.

2. **PP-coated build sheets.** Specialty surfaces (BASF Ultrafuse PP plate; PP packaging tape on glass) provide PP-to-PP bonding.

3. **Glass-fiber filling.** GF-PP (15–30% glass fiber) reduces CTE 2–3×, eliminating most warping. The dominant variant in commercial FFF-PP feedstock.

4. **Heated chamber.** ≥45°C chamber temperature reduces $\Delta T$ during cooling.

## Why use it

- **Living hinges.** PP's fatigue performance at low strain amplitude is unmatched. AM PP enclosures with integrated hinges are a niche but distinctive application.
- **Chemical resistance.** Lab-ware, chemical-process fixtures.
- **Food contact.** Migration-tested PP grades are FDA / EU food-contact compliant.
- **Light weight.** Lowest density of common FFF polymers.

## Open issues

- *Recyclability across cycles.* PP is one of the easier polymers to recycle (mechanically) at scale; recyclate-PP for FFF is feasible but property degradation is steep without nucleator replenishment.
- *Layer adhesion.* Even with optimized process, FFF-PP Z-strength is ~50% of XY. Better than ABS in open ambient but worse than PLA.

## References

- Spoerk, M., Holzer, C., Gonzalez-Gutierrez, J. (2020). "Material extrusion-based additive manufacturing of polypropylene: A review on how to improve dimensional inaccuracy and warpage." *Journal of Applied Polymer Science* 137. (Annotated separately as [`spoerk-et-al-2020.md`](../../../services/additive-manufacturing-services-section/services/fused-filament-fabrication-services-section/content/text/theories/predication-spoerk-et-al-2020.md).)
- Carneiro, O. S., Silva, A. F., Gomes, R. (2015). "Fused deposition modeling with polypropylene." *Materials & Design* 83. The first systematic study of FFF-PP.
- Spoerk, M., et al. (2017). "Optimization of mechanical properties of glass-spheres-filled polypropylene composites for fused filament fabrication." *Polymer Composites* 40.
