---
type: theorem
status: established
class: empirical-law
depends-on: [hygroscopicity]
see-also: []
---

# Dry hygroscopic polymers before processing

**Claim.** Any polymer with equilibrium moisture content above $\sim 0.1$ wt% at $50\%$ RH must be dried below its processing-failure threshold before being heated above its melting/extrusion temperature, or both processing quality and final mechanical properties will be impaired. The impairment is not a failure of process tuning; no amount of slicer or temperature optimization compensates for wet feedstock.

**Two distinct failure mechanisms.**

1. *Process disruption.* Absorbed water vaporizes in the melt zone. Steam bubbles in the molten polymer cause surface defects (popping, hissing, pits, foamy beads), pressure instability (variable extrusion rate causing dimensional inconsistency), and weak inter-bead bonding (steam pockets at fusion interfaces). Drying the polymer eliminates this failure mode immediately; the polymer is otherwise undamaged.

2. *Hydrolytic chain scission.* For polymers containing hydrolyzable bonds in the backbone — esters (PLA, PETG, PC), amides (PA), urethanes (TPU) — water at processing temperature catalyzes chain cleavage. The polymer's number-average molecular weight $M_n$ drops; tensile strength, toughness, and creep resistance drop with it. **This damage is permanent.** Drying the polymer afterward removes the water but does not re-link the cleaved chains.

The rule is "dry *before* processing" because by the time wet polymer reaches the hotend, hydrolysis is happening; subsequent drying salvages future prints from this spool, not the part being printed.

**Polymer-specific drying thresholds and conditions.**

| Polymer | Processing-OK threshold (wt% H₂O) | Drying temp (°C) | Drying time |
|---|---|---|---|
| PLA | $< 0.25\%$ | $40$–$50$ | $4$ h |
| PETG | $< 0.04\%$ | $55$–$65$ | $6$–$8$ h |
| ABS | $< 0.20\%$ | $55$–$65$ | $4$–$6$ h |
| ASA | $< 0.10\%$ | $60$–$70$ | $4$–$6$ h |
| PA6 | $< 0.10\%$ | $70$–$80$ | $8$–$16$ h |
| PA12 | $< 0.10\%$ | $70$–$80$ | $6$–$10$ h |
| PC | $< 0.02\%$ | $70$–$80$ | $10$–$12$ h |
| TPU | $< 0.04\%$ | $50$–$60$ | $6$–$8$ h |
| PEEK | $< 0.02\%$ | $120$–$150$ | $6$ h |

**The PETG "$< 0.04\%$" trap.** PETG looks moderately hygroscopic by EMC ($\sim 0.2\%$), but its hydrolysis sensitivity is high — even a few hundred ppm of water at $245$°C causes measurable chain scission. PETG is the most-commonly under-dried filament because it doesn't *appear* wet by EMC standards and its symptoms (some stringing, slight surface roughness) are easy to attribute to other causes.

**Diagnostic.** Cut a $20$ cm filament length, flame it briefly, listen for popping. Quiet → dry; pops/sizzles → wet. The flame test is qualitative but reliable for "is this filament moisture-acceptable for printing."

**Re-absorption rates.** Even after drying, hygroscopic polymers re-absorb during use. PA6 dried to $0.05\%$ rises back to $0.5\%$ after ~$4$ h of open-air exposure at $50\%$ RH. The operational consequence: PA, PC, TPU need an *in-line heated dry box* during printing, not just pre-drying.

**Cost. ** A dedicated filament dryer is $\$30$–$\$200$ once. Failure cost (failed prints + spoiled material + diagnostic time) typically exceeds the dryer cost within a single PETG-or-harder spool.

**References.** Manufacturer technical sheets (Polymaker, Prusament, BASF, FormFutura, Push Plastic). Halidi & Abdullah (2012). Goff & Whelan (1986) on PET hydrolysis kinetics.
