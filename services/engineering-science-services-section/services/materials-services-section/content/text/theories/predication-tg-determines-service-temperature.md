---
type: theorem
status: established
class: design-rule
depends-on: [glass-transition]
title: $Tg$ determines service temperature
description: Claim.
---

# $T_g$ determines service temperature

**Claim.** For an amorphous polymer (or for the amorphous regions of a semi-crystalline polymer at low crystallinity), the maximum continuous-use temperature for any structural application is approximately $T_g - 10$°C to $T_g - 20$°C, depending on load. Exceeding this temperature causes time-dependent deformation (creep) under sustained load, dimensional instability, and in extreme cases collapse of the part under its own weight.

**Mechanism.** Below $T_g$ polymer chains are kinetically frozen — segmental motion is restricted to bond vibration, viscosity is effectively infinite, and elastic moduli are at their glassy values ($\sim$ GPa). Above $T_g$ chain segments have rotational and translational freedom; the polymer behaves as a high-viscosity rubber, with modulus dropping by orders of magnitude. The transition is not sharp — over a $\sim 20$°C window, modulus and creep rate rise smoothly. The "service ceiling" is operationally defined as the temperature at which creep over the part's expected service life produces unacceptable deformation.

**Quantitative reference table.**

| Polymer | $T_g$ (°C) | Continuous service ceiling (°C, light load) |
|---|---|---|
| PLA (as-printed) | $60$ | $50$ |
| PLA (annealed, semi-crystalline) | $60$ (amorphous portions) | $110$ — set by $T_m$, not $T_g$, because the crystalline backbone holds. |
| PETG | $80$ | $65$ |
| ABS | $105$ | $90$ |
| ASA | $105$ | $90$ |
| PC | $145$ | $120$ |
| PEI / Ultem | $215$ | $170$ |
| PEEK (semi-crystalline) | $145$ (amorphous portions) | $260$ — set by crystalline phase; amorphous PEEK is limited to $\sim 130$°C. |

**Counterexample, sort of.** Semi-crystalline polymers above $T_g$ but below $T_m$ retain structural integrity from their crystalline backbone, even though their amorphous phase is rubbery. PLA annealed to $\sim 40\%$ crystallinity behaves as a usable engineering plastic up to $\sim 110$°C — close to its $T_m / 1.6$ — even though its amorphous-phase $T_g$ remains $60$°C. The "$T_g$ determines service temperature" rule applies *to the amorphous fraction*; for highly crystalline parts the $T_m$-based ceiling is the binding constraint.

**Sustained load amplifies the problem.** Even at $T_g - 30$°C, polymer creep under sustained load is significant on multi-month timescales. A PLA bookshelf at room temperature creeps detectably over months because the chains are mobile enough at $20$°C ($40$°C below $T_g$) to flow under load. Recommended: design for service temperature *at most* $T_g - 30$°C if the load is sustained for years.

**Moisture interaction.** PA's $T_g$ drops from $50$°C (dry) to $0$°C (saturated). A "dry-tested" PA part that meets $T_g - 20 = 30$°C service ceiling fails completely after weeks in humid air. This is the dominant practical reason engineering PA parts are drying-controlled.

**Design corollary.** When selecting a polymer for a part with a known service environment, set the polymer's $T_g$ requirement to (max environment temperature + load factor + margin). Light load: $T_g \geq T_{\mathrm{env}} + 15$°C. Sustained heavy load: $T_g \geq T_{\mathrm{env}} + 30$°C. For semi-crystalline polymers post-anneal, use $T_m / 1.6$ as the upper service ceiling instead.
