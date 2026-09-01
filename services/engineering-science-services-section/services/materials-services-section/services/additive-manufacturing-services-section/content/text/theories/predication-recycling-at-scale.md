---
type: question
status: open
depends-on: []
---

# Open: Can AM feedstock loops be closed at production scale?

A central sustainability claim of distributed AM is that it enables circular feedstock loops: print-fail and end-of-life parts are reground into new feedstock locally. The open question is whether this works at production scale and at acceptable property loss.

## The polymer-recycling story (FFF)

Open-source projects (Precious Plastic, RecycleBot, RepRapable Recyclebot) and commercial extruders (Filabot, 3devo) demonstrate that local FFF feedstock recycling is *feasible* at the workshop scale. The properties question:

- *Cycle 1.* Recycled-PLA filament from clean print-fail PLA shows ~5–15% reduction in tensile strength vs virgin (Cruz Sanchez et al. 2017).
- *Cycle 2–5.* Property degradation accumulates from chain scission during reprocessing. By cycle 5, PLA properties are 50–70% of virgin (Beltran et al. 2021).
- *Beyond cycle 5.* Strongly material-dependent; PETG and ABS degrade faster than PLA, in part because of moisture pickup during the recycling steps.

The **practical maximum cycle count** is the open empirical question. It depends on cleanliness of feed, drying discipline, and additive replenishment.

## The metal-recycling story (LPBF)

Metal LPBF powder is reused across builds with *blending* (mix used powder with virgin to refresh particle morphology). The open questions:

- How many cycles before the powder PSD (particle size distribution) shifts enough that the process window changes? Industry practice: ~10 builds with 30% virgin make-up, but this is empirical and machine-specific.
- How does powder-handling (sieving, drying, blending) affect contamination — particularly oxygen and nitrogen pickup in reactive alloys (Ti, Al)?
- How does the blended powder property variation interact with [qualification-and-certification](./predication-qualification-and-certification.md) — pedigree-based qualification needs powder-lot pedigree.

## The systems question

Even if material recycling works locally, the *system* must work: collection of waste, sorting by material, drying, regrinding, recompounding (with additive package), re-extrusion. At the scale of a household 3D printer, this is hand-labor-intensive. At the scale of a production AM facility, it is industrial. The open question is whether distributed/community-scale recycling is economically viable, or whether AM circularity necessarily centralizes back into industrial recyclers.

## What would unlock this

- Standardized recyclate-feedstock specifications and property datasheets (analogous to virgin-feedstock datasheets). ASTM F42 working group on "secondary feedstock" is drafting these.
- Better in-line property monitoring during reprocessing (real-time MFI, real-time moisture).
- Bio-based feedstocks designed for repeated reprocessing (e.g., reactive-extrusion-compatible PLA grades).

## References

- Cruz Sanchez, F. A., et al. (2017). "Plastic recycling in additive manufacturing: A systematic literature review and opportunities for the circular economy." *Journal of Cleaner Production* 264.
- Beltran, F. R., et al. (2021). "Mechanical recycling of poly(lactic acid): Evaluation of a chain extender and a peroxide as additives for upgrading the recycled plastic." *Journal of Cleaner Production* 269.
- Sanchez, F. A. C., Boudaoud, H., Hoppe, S., Camargo, M. (2017). "Polymer recycling in an open-source additive manufacturing context: Mechanical issues." *Additive Manufacturing* 17.
