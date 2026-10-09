---
type: morphism
class: thermal-processing
depends-on: [glass-transition, crystallinity]
title: Annealing (of printed polymers)
description: Post-process heat treatment between the polymer's $Tg$ and $Tm$ for a sustained period (typically 30 min to several hours), driving crystallization in semi-crystalline polymers and stress relief in amorphous ones.
---

# Annealing (of printed polymers)

Post-process heat treatment between the polymer's $T_g$ and $T_m$ for a sustained period (typically 30 min to several hours), driving crystallization in semi-crystalline polymers and stress relief in amorphous ones. The result is a part with substantially different mechanical and thermal properties from the as-printed equivalent.

**Effects per polymer class.**

**Semi-crystalline (PLA, PA, PEEK, PEKK):**
- Crystallinity rises significantly. PLA goes from $\sim 5\%$ (as-printed, fast-cooled) to $\sim 40\%$ (annealed at $80$°C, 1h).
- Service temperature rises. Annealed PLA: $50$°C $\to 110$°C.
- Tensile strength rises $20$–$50\%$.
- Stiffness rises.
- Elongation at break drops; impact resistance drops; the part becomes more brittle.
- Dimensions shrink $1$–$3\%$ (anisotropically — typically more in XY than Z for FFF parts because crystallization densifies the bulk).
- Color may shift slightly (PLA may become more opaque).

**Amorphous (PETG, ABS, ASA, PC):**
- No crystallinity change (these polymers do not crystallize).
- Residual stress relief. Internal stresses from differential cooling during print are reduced; warping that didn't occur during print can occur during annealing if the geometry was stressed.
- Modest property changes: small decrease in Young's modulus, modest increase in toughness in some cases.
- Less dramatic than semi-crystalline annealing; sometimes used for SLA UV-cured resins to drive complete crosslinking.

**Standard annealing recipes.**

| Material | Temperature | Time | Notes |
|---|---|---|---|
| PLA | $80$–$110$°C | $30$ min – $2$ h | Above $T_g$ ($60$°C) but below $T_m$ ($175$°C). Higher T → faster, more shrinkage. |
| PA6 | $120$–$160$°C | $1$–$4$ h | In dry environment; PA absorbs moisture during anneal if unprotected. |
| PA12 | $100$–$140$°C | $1$–$4$ h | |
| PEEK | $200$–$300$°C | $1$–$3$ h | Critical for PEEK strength; chamber-controlled printing avoids the need. |
| ABS | $80$–$100$°C | $30$ min | Stress relief only, no crystallinity. |
| PETG | $70$–$90$°C | $30$ min | Stress relief only. |

**Equipment.** Convection oven set carefully. A common error is using a household oven, which often runs $20$–$50$°C above setpoint at low temperatures and will sag the part. Verify with an oven thermometer or use a lab oven / annealing oven with PID control.

**Compensation for shrinkage.** When designing a part that will be annealed, scale the CAD by $1.02$–$1.03\times$ in XY and $1.01\times$ in Z to compensate. The exact factor depends on infill, geometry, and crystallization extent; produce a calibration print first if dimensional accuracy matters.

**Support during anneal.** Parts soften somewhat at temperatures above $T_g$ even before crystallization stiffens them; flat parts can sag if not supported during anneal. Sand or salt bed (covers part, conducts heat uniformly, supports against sag) is a standard trick for thin annealed PLA parts.

**When to anneal.**
- PLA functional parts that need heat resistance above $50$°C.
- PA parts that came off the printer relatively amorphous (most do unless chamber was hot).
- PEEK parts (always — uncrystallized PEEK is mechanically inferior).
- Never required for PETG, ABS, ASA in normal use; anneal only if specifically targeting stress relief.
