---
type: object
class: thermoplastic
depends-on: [glass-transition]
title: ASA (acrylonitrile styrene acrylate)
description: A terpolymer mechanically near-identical to ABS, with the butadiene rubber phase replaced by an acrylate elastomer.
---

# ASA (acrylonitrile styrene acrylate)

A terpolymer mechanically near-identical to [ABS](./predication-abs.md), with the butadiene rubber phase replaced by an acrylate elastomer. The substitution costs little impact resistance but greatly improves UV stability — ASA is the correct material choice for any outdoor-exposed FFF part.

**Properties (unfilled, generic spool):**

| Property | Value |
|---|---|
| Glass transition $T_g$ | $\sim 105$°C |
| Density | $\sim 1.07$ g/cm³ |
| Tensile strength (XY) | $35$–$45$ MPa |
| Tensile modulus | $\sim 2.0$ GPa |
| Elongation at break | $\sim 10$–$25\%$ |
| Impact (Izod) | $\sim 150$ J/m |
| Service temperature | $\leq 90$°C |
| UV stability | Excellent (years of outdoor exposure) |
| Hygroscopicity | Moderate |

**Process window.** Same as [ABS](./predication-abs.md): $240$–$260$°C nozzle, $100$–$110$°C bed, $0$–$20\%$ fan, enclosure required. ASA prints essentially with ABS profiles.

**Strengths.**
- All ABS strengths except slightly less impact-resistant.
- UV-stable: ASA outdoor parts hold color and mechanical properties for $5$+ years; ABS in the same exposure cracks in months.
- Acetone-smoothable like ABS (slightly less effective; vapor cycle longer).
- Lower fume odor than ABS during printing.

**Weaknesses.**
- Same warping problem as ABS — enclosure required.
- Modestly more expensive than ABS.
- Slightly less impact-resistant.

**Use case.** Anything outdoors: solar-charger enclosures, garden equipment, drone parts, automotive exterior trim, satellite-receiver brackets. Whenever a part will see direct sun and the user wants it to last a year or more.

**ABS-vs-ASA decision.** Indoor: ABS (cheaper, slightly tougher). Outdoor: ASA (UV stability is decisive). Mixed/uncertain: ASA is the safer default at modest cost premium.

**Common confusion.** ASA's UV stability is *intrinsic* — no surface treatment, no UV inhibitor needed. ABS that has been "UV stabilized" via additive packages is rarely competitive with ASA's intrinsic UV resistance and degrades faster than the marketing implies.
