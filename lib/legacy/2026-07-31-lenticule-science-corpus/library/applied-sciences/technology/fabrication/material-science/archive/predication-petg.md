---
type: object
class: thermoplastic
depends-on: [glass-transition, hygroscopicity]
---

# PETG (polyethylene terephthalate glycol-modified)

An amorphous copolyester — PET (the bottle plastic) modified by replacing some ethylene glycol with cyclohexanedimethanol to suppress crystallization. The result is a transparent, tough, FDA-compliant amorphous thermoplastic widely used in food packaging and increasingly the FFF default for functional parts.

**Properties (unfilled, generic spool):**

| Property | Value |
|---|---|
| Glass transition $T_g$ | $\sim 80$°C |
| Density | $\sim 1.27$ g/cm³ |
| Tensile strength (XY) | $45$–$55$ MPa |
| Tensile modulus | $\sim 2.0$ GPa |
| Elongation at break | $\sim 100$–$200\%$ |
| Impact (Izod) | $\sim 70$ J/m (high) |
| Service temperature | $\leq 65$°C |
| Hygroscopicity | High; days tolerance; hydrolyzes during processing |

**Process window.**
- Nozzle temperature: $230$–$250$°C.
- Bed temperature: $70$–$85$°C on PEI.
- Part-cooling fan: $30$–$60\%$. More cooling kills layer adhesion; less causes droopy overhangs.
- Enclosure: not required; helpful for layer adhesion on tall parts.
- Drying: required if spool has been open more than ~1 week.

**Strengths.**
- Tough, not brittle — high elongation at break and impact resistance.
- UV-stable enough for indoor and short-term outdoor use.
- Chemically resistant to many solvents (acids, salts, dilute bases).
- FDA-compliant (food-contact safe at room temperature; thermal exposure limited).
- Higher service temperature than PLA.
- Optical clarity if printed thin and slowly.

**Weaknesses.**
- **Stringy.** Highest stringing tendency among common FFF materials. Drying is essential; retraction tuning is finicky.
- **Sticks too well to PEI.** PETG can fuse to a hot PEI plate aggressively enough to damage the plate on removal. Mitigations: brim, glue stick (release agent), let bed cool before removing.
- **Layer adhesion dependent on process.** PETG has a narrower good-adhesion window than PLA; under-extrusion or over-cooling produces visible delamination.
- **Hydrolysis on extrusion.** Wet PETG produces permanent chain damage; the part is mechanically inferior even after drying.

**Variants.**
- **PETG-CF.** Carbon-fiber filled. Stiffer, less stringy, abrasive.
- **CPE / CPE+.** Co-polyester, similar to PETG but tuned for specific properties (Ultimaker's branded variants).
- **Tritan / Eastman Amphora.** Higher-grade copolyesters; clearer, marginally tougher, more expensive.

**When to use.** Functional parts that need toughness, modest heat resistance, or chemical resistance. PETG is the right default for "I want a working part, not a decorative one." Move to ABS/ASA only if PETG's $65$°C ceiling is exceeded; move to PA only if even higher temperature, fatigue, or specific chemical resistance is required.

**The PLA-vs-PETG choice for hobbyists** is essentially: PLA for everything aesthetic and PETG for everything functional. The slight added difficulty of PETG (drying, stringing, plate-sticking) is worth the substantial gain in toughness for any part that will be used.
