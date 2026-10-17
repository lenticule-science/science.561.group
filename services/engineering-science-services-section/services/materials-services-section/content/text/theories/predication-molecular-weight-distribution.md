---
type: concept
class: polymer-property
depends-on: [crystallinity]
realizes: []
title: Molecular weight distribution
description: For a polymer, the distribution $w(M)$ of chain molecular weights, summarized by the number-average $Mn$, weight-average $Mw$, and dispersity $\mathcal D = Mw / Mn$.
---

# Molecular weight distribution

For a polymer, the distribution $w(M)$ of chain molecular weights, summarized by the number-average $M_n$, weight-average $M_w$, and dispersity $\mathcal D = M_w / M_n$. A property of the *feedstock* and not strongly modifiable by the FFF user, but it sets the ceiling on what the printed part can achieve.

## Why FFF cares

1. **Melt viscosity scales as $M_w^{3.4}$ above the entanglement molecular weight $M_e$** (Berry–Fox 1968; classical reptation prediction). A 20% increase in $M_w$ doubles the melt viscosity. This sets:
   - The maximum volumetric flow rate the hot-end can deliver (see [max-volumetric-flow-rate-bounds-print-speed](../../../services/additive-manufacturing-services-section/services/fused-filament-fabrication-services-section/content/text/theories/predication-max-volumetric-flow-rate-bounds-print-speed.md)).
   - The pressure-advance value needed for clean corners.
   - The bead spreading behavior at the nozzle exit.

2. **Mechanical properties scale with $M_n$ and chain entanglement.** Tensile strength rises with $M_n$ until $M_n \gg M_c$ (critical entanglement molecular weight), then plateaus. Toughness (impact strength, elongation at break) is more sensitive: high-$M_n$ polymer is tough; low-$M_n$ is brittle. A polymer that has been thermally degraded (chain scission during reprocessing) loses toughness disproportionately to strength.

3. **Dispersity matters for processing.** A broad MWD (high $\mathcal D$) means a long low-$M$ tail that acts as plasticizer (lower viscosity, easier flow) and a long high-$M$ tail that drives entanglement strength. Commodity FFF feedstocks have $\mathcal D \sim 1.5$–$3.0$.

## Why recyclate-FFF cares

Mechanical recycling (grind, redry, re-extrude) reduces $M_n$ and $M_w$ by chain scission at each cycle:

- *PLA.* ~10–25% $M_n$ reduction per recycling cycle (Beltran et al. 2021).
- *PETG.* ~5–15% $M_n$ reduction per cycle, plus moisture-induced hydrolysis if not fully dried.
- *ABS.* Less affected by cycling; degradation is mostly oxidative and thermal.

The non-monotonic effect on processing: lower $M_w$ means easier flow (apparent improvement) but lower toughness (real degradation). Recycled-feedstock manufacturers add chain extenders (e.g., Joncryl ADR-4368 for PLA/PET) to rebuild $M_w$. Effectiveness varies; this is the active research area in polymer recycling for AM.

## Measurement

- *GPC / SEC (gel permeation chromatography).* The standard. Yields $M_n$, $M_w$, $\mathcal D$ from elution times calibrated against polystyrene standards.
- *Melt-flow index (MFI).* Cheap and standard in industrial practice; inversely correlated with $M_w$ but not a direct measurement.
- *Solution viscometry.* Mark–Houwink relation $[\eta] = K M^a$.
- *Rheology (small-amplitude oscillatory shear).* Gives the relaxation spectrum from which $M_w$ and MWD can be inferred.

## References

- Berry, G. C., Fox, T. G. (1968). "The viscosity of polymers and their concentrated solutions." *Adv. Polymer Sci.* 5.
- Beltran, F. R., et al. (2021). "Mechanical recycling of poly(lactic acid)." *Journal of Cleaner Production* 269.
- Cuiffo, M. A., et al. (2017). "Impact of the fused deposition (FDM) printing process on PLA chain architecture." *Applied Sciences* 7.
- Sanchez, F. A. C., et al. (2017). "Polymer recycling in an open-source additive manufacturing context." *Additive Manufacturing* 17.
