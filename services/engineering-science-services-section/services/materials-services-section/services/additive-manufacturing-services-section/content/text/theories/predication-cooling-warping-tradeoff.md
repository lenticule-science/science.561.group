---
type: theorem
status: established
class: empirical-law
depends-on: [adhesion, anisotropy]
---

# Cooling–warping tradeoff

**Claim.** In FFF with high-$T_g$ polymers — both amorphous (ABS, ASA, PC) and semi-crystalline (PA, PEEK) — the rate at which deposited material cools below its glass transition $T_g$ is in tension with two desired outcomes:

- **Slow cooling** (warm ambient, no part fan, enclosure) → strong [layer adhesion](./predication-adhesion.md), low warping risk on tall parts, but poor overhang/bridging quality and slow build rate.
- **Fast cooling** (cold ambient, full part fan, no enclosure) → crisp overhangs and bridges, high build rate, but weak layer adhesion and severe warping/cracking on tall semi-crystalline prints.

There is no globally optimal setting; the optimum depends on the (material, geometry) pair.

**Mechanism.** Cooling rate sets two simultaneous things:

1. *Inter-layer bond quality.* A new bead bonds to the layer below it via polymer chain interdiffusion across the bead-to-layer interface. Diffusion happens only while both surfaces are above $T_g$. Slow cooling → longer time in the bond-forming window → more interdiffusion → stronger Z-direction strength.
2. *Cooling-shrinkage stress accumulation.* Polymer cooling from melt to ambient contracts. For amorphous polymers (ABS, ASA, PC) shrinkage is gradual through the cooling range and stress accumulates as a function of temperature drop. For semi-crystalline polymers (PA, PEEK, PLA) an additional densification step occurs during crystallization between $T_m$ and $T_g$, contributing extra contraction. If the cooling part is anchored at the build plate, this contraction shows up as warping stress at the corners. The proximate driver of warping is the *temperature gradient between upper (still hot) and lower (already below $T_g$) layers* during the print — wider gradients produce stronger differential contraction; this is why the open-printer ABS warping problem is dominated by ambient-vs-$T_g$ separation rather than by the polymer's bulk shrinkage coefficient alone.

The two effects are coupled in a complicated way that depends on geometry, build rate, polymer crystallization kinetics, and chamber conditions; the net effect is that ABS and similar high-$T_g$ polymers (whether amorphous like ABS/ASA/PC or semi-crystalline like PA/PEEK) want to be printed in a heated enclosure with no part cooling, while PLA wants to be printed in a cold open ambient with full part cooling.

**Material-specific optima.**

| Material | Part cooling | Bed temp | Chamber | Justification |
|---|---|---|---|---|
| PLA | $100\%$ | $50$–$60°$C | open | Crystallizes slowly; warping low; cooling helps overhangs without harming bond. |
| PETG | $30$–$60\%$ | $70$–$85°$C | open | Intermediate; full cooling causes layer separation. |
| ABS / ASA | $0$–$20\%$ | $100$–$110°$C | enclosed, $\geq 40$°C | Severe warping without enclosure; full cooling cracks layers. |
| PA (nylon) | $0\%$ | $70$–$110°$C | enclosed, hygroscopic considerations dominate | Layer adhesion delicate; needs warm chamber. |
| PC | $0\%$ | $110$–$120°$C | enclosed, $\geq 70°$C | High $T_g$; needs hot chamber to avoid warping; cooling kills layer adhesion. |
| PEEK | $0\%$ | $130$+°C | $\geq 90°$C, possibly active heat | Crystallinity-sensitive; chamber control determines whether amorphous (weak, transparent) or semi-crystalline (strong, opaque). |

**Design corollary.** For high-$T_g$ engineering polymers (amorphous or semi-crystalline), **buy or build an enclosed printer** before attempting them. Open desktop FFF is fundamentally not the right hardware for ABS-class materials; the warping rule is not a tuning failure but a chamber-temperature control failure.

**Counterexamples.** Very small ABS parts (single-bead-width perimeters, $\leq 30$ mm footprint) can print on open desktop FFF if a brim and slow first-layer compensate. Very tall PLA parts in a hot ambient can warp.

**References.** Cantrell et al. (2017) on ABS warping kinetics. Spoerk et al. (2018) on FFF inter-layer adhesion thermal modeling.
