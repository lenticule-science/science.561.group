---
type: theorem
status: established
class: empirical-law
depends-on: [crystallinity, coefficient-of-thermal-expansion]
title: Crystallization rate determines warping in semi-crystalline FFF polymers
description: Claim.
---

# Crystallization rate determines warping in semi-crystalline FFF polymers

**Claim.** For semi-crystalline polymers (PLA, PA, PEEK, PP), the dominant determinant of FFF warping is *not* the bulk CTE but the *crystallization-induced volumetric contraction* and its rate. Polymers that crystallize slowly (PLA) warp less than polymers that crystallize quickly (PP, HDPE) at the same CTE.

## Mechanism

Semi-crystalline polymer cooling from melt to ambient passes through three regimes:

1. *Melt cooling, $T_m$ to crystallization onset.* Linear thermal contraction at $\alpha_{\rm melt}$.
2. *Crystallization, $T_c$ window.* Additional volumetric contraction of 5–15% (specific to polymer) as amorphous melt converts to higher-density crystalline phase. Rate set by nucleation density and growth velocity.
3. *Solid cooling, below $T_g$.* Linear thermal contraction at $\alpha_{\rm solid}$.

The "extra" contraction in step 2 happens over a narrow temperature range. If crystallization is *fast* (PP, HDPE: complete in seconds), the contraction is sudden and concentrated; the warping force builds quickly and exceeds bed adhesion before the upper layers can constrain it. If crystallization is *slow* (PLA: half-time minutes to hours; some PEEK formulations: minutes), the contraction is gradual and the upper layers stiffen the part before the contraction completes.

## Quantitative summary

| Polymer | $\alpha_{\rm solid}$ /°C | Crystallization $\Delta V$ | Crystallization half-time | Warping severity |
|---|---|---|---|---|
| PLA | $0.7 \times 10^{-4}$ | 4–6% | minutes-hours | Low |
| PETG | $0.7 \times 10^{-4}$ | 1–2% (low crystallinity) | (slow, often glassy) | Low |
| PA12 | $0.9 \times 10^{-4}$ | 8–10% | seconds | Severe |
| PP | $1.5 \times 10^{-4}$ | 12–15% | seconds | Most severe (without nucleator) |
| HDPE | $1.5 \times 10^{-4}$ | 12–15% | seconds | Most severe (essentially un-printable) |
| PEEK (slow-cooled) | $0.5 \times 10^{-4}$ | 6–8% | minutes (with chamber) | Moderate |
| PEEK (fast-cooled) | $0.5 \times 10^{-4}$ | (suppressed; amorphous) | n/a | Low (but weak amorphous part) |

## Operational consequences

1. **PP needs nucleating agents.** Adding $\beta$-nucleator particles to PP feedstock makes nucleation density very high; crystallites are smaller and contraction is distributed in space rather than concentrated. This is the fundamental reason FFF-PP became viable. See [polypropylene](./predication-polypropylene.md).

2. **PEEK needs chamber control of crystallization regime.** A PEEK chamber that cools too fast (open ambient) produces amorphous PEEK — weak but warp-free. A chamber that cools at the right rate (1–10 °C/min through 200–300°C) produces semi-crystalline PEEK — strong but warp-prone. Industrial PEEK printers (Apium, Roboze, Intamsys) implement chamber thermal programs explicitly to land in the right regime. See [peek](./predication-peek.md).

3. **Annealing post-process amplifies warping.** Annealing PLA at 80°C raises crystallinity from ~5% (as-printed, glassy) to ~30–40%. This delivers the warping that did not happen during printing. The standard practice is to anneal in a constrained jig.

4. **Copolymer grades suppress warping.** Random copolymers (PP-PE, PA6-PA66 random copolymer, "amorphous PEEK" copolymers like AvaSpire AV-651) have suppressed crystallization due to chain regularity disruption. The trade-off is reduced ultimate strength.

## Caveat

The theorem is about *additional* warping from crystallization. CTE-driven warping (linear thermal contraction below $T_g$) operates on all polymers and is set by [coefficient-of-thermal-expansion](./predication-coefficient-of-thermal-expansion.md). The two mechanisms add: a high-CTE semi-crystalline polymer (PP) is the worst-case combination.

## References

- Spoerk, M., Holzer, C., Gonzalez-Gutierrez, J. (2020). [Annotated separately](../../../services/additive-manufacturing-services-section/services/fused-filament-fabrication-services-section/content/text/theories/predication-spoerk-et-al-2020.md).
- Yang, C., et al. (2017). "Influence of thermal processing conditions in 3D printing on the crystallinity and mechanical properties of PEEK material." *Journal of Materials Processing Technology* 248.
- Morales, M. A., et al. (2023). "Crystallization kinetics in FFF semi-crystalline polymers: a review." *Additive Manufacturing*.
