---
type: concept
class: defect
depends-on: [layer, adhesion]
realizes: []
---

# Porosity (in additive manufacturing)

Voids inside the printed part — the dominant defect class in metal AM and a significant one in polymer AM. Distinguished from surface roughness (which is also a "defect" but is geometric rather than internal).

## Classification by mechanism

**Metal LPBF / DED:**

- **Lack-of-fusion (LoF).** Voids between scan tracks or between layers caused by insufficient energy input. Geometrically irregular, often elongated along the inter-track or inter-layer interface. The dominant porosity type at low energy density. Detectable by in-situ thermography.
- **Keyhole.** Roughly spherical voids caused by *too much* energy: the laser drills a vapor cavity into the melt pool which collapses unstably and traps gas. Located deep below the melt-pool surface. Detectable by acoustic emission and high-speed imaging.
- **Gas porosity.** Spherical pores from gas dissolved in the feedstock powder or shielding gas. Small, randomly distributed.

**Polymer FFF:**

- **Inter-bead voids.** Triangular or rounded voids at the contact line between adjacent extruded beads (Tronvoll et al. 2018). Reduced by overlap, increased flow rate, higher temperature. Typical FFF parts are 5–15% porous by volume.
- **Inter-layer voids.** Voids between layers, often at sharp internal corners or at retracts. Reduced by ironing, by hot chamber, by overlap.

**Polymer SLA / DLP:**

- *Largely absent* in well-tuned process; cured photopolymer is dense.

## Why it matters

- *Static strength.* Porosity above ~5% noticeably reduces tensile strength.
- *Fatigue.* The dominant fatigue-life killer. Large pores act as stress concentrators; a single large pore at the surface can reduce fatigue life by an order of magnitude. Sanaei & Fatemi (2021) is the canonical review.
- *Fluid impermeability.* Closes-cell porosity is acceptable for structural parts but disqualifies AM parts for pressure vessels and vacuum applications without HIP post-processing.

## Mitigation

- **Process-window optimization.** The "process map" (Bourell 2017, King et al. 2014) plots laser power vs scan speed and identifies the LoF / dense / keyhole regions. Stay in the dense region.
- **Hot Isostatic Pressing (HIP).** Post-process at $T \sim 0.7\, T_m$, $P \sim 100$–$200$ MPa. Closes internal pores by creep. Standard for metal AM aerospace parts; adds $\sim$30% to part cost.
- **In-situ detection.** See [in-situ-monitoring](in-situ-monitoring.md). Defects detected at deposition can be repaired by re-melting or flagged for downstream NDE.
- **FFF: overlap and temperature.** Tronvoll et al. (2018) and Spoerk et al. (2020) give the empirical overlap and temperature settings to minimize inter-bead voids.

## Open question

Predicting fatigue life from a measured pore distribution is partial: the *largest pore in the high-stress region* dominates, and finding it is a sampling problem. Probabilistic fracture-mechanics frameworks (extreme-value statistics on pore sizes) are the potential research direction.
