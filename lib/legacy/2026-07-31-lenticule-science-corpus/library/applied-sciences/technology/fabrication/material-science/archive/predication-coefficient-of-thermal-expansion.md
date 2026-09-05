---
type: concept
class: thermo-mechanical-property
depends-on: [glass-transition, crystallinity]
realizes: []
---

# Coefficient of thermal expansion (CTE)

The fractional change in length per degree temperature change, $\alpha = (1/L)(dL/dT)$. For polymers it is large (order $10^{-4}$ /°C) compared to metals (order $10^{-5}$ /°C) and is the underlying material parameter behind most warping, distortion, and dimensional-tolerance problems in polymer AM.

## Numbers for FFF feedstocks

| Polymer | $\alpha$ (below $T_g$) | $\alpha$ (above $T_g$) | Comment |
|---|---|---|---|
| PLA | $0.7 \times 10^{-4}$ /°C | $1.5 \times 10^{-4}$ /°C | Low CTE among FFF polymers |
| PETG | $0.7 \times 10^{-4}$ /°C | $1.5 \times 10^{-4}$ /°C | Similar to PLA |
| ABS | $0.9 \times 10^{-4}$ /°C | $1.7 \times 10^{-4}$ /°C | Mid-range |
| ASA | $0.9 \times 10^{-4}$ /°C | $1.7 \times 10^{-4}$ /°C | Similar to ABS |
| PA (nylon) | $1.0 \times 10^{-4}$ /°C | $1.8 \times 10^{-4}$ /°C | Plus moisture-driven dimensional change |
| PP | $1.5 \times 10^{-4}$ /°C | $2.5 \times 10^{-4}$ /°C | Highest CTE; hardest to print without warping |
| PC | $0.7 \times 10^{-4}$ /°C | $1.4 \times 10^{-4}$ /°C | Low CTE among engineering polymers |
| PEEK | $0.5 \times 10^{-4}$ /°C | $1.0 \times 10^{-4}$ /°C | Low CTE, partly because of crystallinity |
| PA-CF (carbon-fiber filled) | $0.3 \times 10^{-4}$ /°C | $0.6 \times 10^{-4}$ /°C | Fibers anchor against thermal contraction |

For comparison: aluminum $\alpha = 0.23 \times 10^{-4}$ /°C; steel $\alpha = 0.12 \times 10^{-4}$ /°C; invar $\alpha = 0.013 \times 10^{-4}$ /°C.

## Why FFF cares

1. **Warping force.** At cooling from melt to ambient ($\Delta T = 200°C$), a 100-mm PLA part contracts by $1.4$ mm of stress-free strain. If the part is anchored at the build plate, this contraction shows up as warping force at the corners — order $E \alpha \Delta T \approx 14$ MPa restraint stress for unfilled PLA, which is less than bed adhesion strength but enough to deform the part. For ABS at $\Delta T = 250°C$ the restraint stress reaches ~25 MPa, which routinely exceeds bed adhesion.

2. **Dimensional tolerance.** A part designed at 25°C and used at 80°C will be ~0.4% larger if PLA, ~0.5% if ABS. Functional tolerances under 0.1 mm on parts longer than 25 mm cannot be held without temperature-compensated design.

3. **Anisotropy of CTE.** Fiber-reinforced FFF (CF-PA) has highly anisotropic CTE: low along the fiber direction (constrained by fibers), nearly normal along the transverse direction. This causes anisotropic warping that does not affect neat polymer.

4. **Chamber temperature design.** A heated chamber reduces $\Delta T$ between deposition and ambient, reducing both warping force and residual stress. The chamber-temperature recommendation for each polymer is essentially the cooling-warping-tradeoff working through CTE.

## Mitigation

- **Match CTE to constraint strategy.** For low-CTE polymers (PLA, PETG, PC), bed adhesion alone can hold the corners. For high-CTE polymers (ABS, PP), a heated chamber is structurally required.
- **Use fiber-filled feedstock.** Drops effective CTE by 50–70% in the fiber direction. PA-CF prints reliably without warping where neat PA does not.
- **Design for thermal stability of features.** Avoid long thin features along high-stress directions; use rounded corners to reduce stress concentration.
- **Stress-relief annealing.** Post-process anneal at $T_g + 20$°C closes some residual stress at the cost of dimensional change. The dimensional change is itself a function of CTE: highly crystalline anneals shrink isotropically; amorphous anneals only relieve stress.

## Why this is a *material-science* concept

CTE is intrinsic to the polymer and to its processing-induced microstructure (crystallinity, molecular-weight distribution, fiber loading). The FFF designer can select a low-CTE feedstock (PC instead of ABS, PA-CF instead of PA) but cannot lower the CTE of a chosen polymer except by composite formulation. This is why the [cooling-warping-tradeoff](../../additive-manufacturing/theorems/cooling-warping-tradeoff.md) reduces ultimately to a feedstock-selection question.

## References

- Mark, J. E. (1996). *Physical Properties of Polymers Handbook.* AIP Press.
- Spoerk, M., et al. (2018). "Effect of the printing bed temperature on the adhesion of parts produced by fused filament fabrication." *Plastics, Rubber and Composites* 47.
- Brenken, B., et al. (2018). "Fused filament fabrication of fiber-reinforced polymers: A review." *Additive Manufacturing* 21. Quantitative CTE for fiber-reinforced FFF.
