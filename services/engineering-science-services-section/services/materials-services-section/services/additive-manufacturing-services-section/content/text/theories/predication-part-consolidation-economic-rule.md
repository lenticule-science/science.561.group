---
type: theorem
status: rule-of-thumb
class: design-rule
depends-on: [design-for-am]
title: Part-consolidation favors AM as fastener-and-joint count rises
description: Claim.
---

# Part-consolidation favors AM as fastener-and-joint count rises

**Claim.** AM is economically favorable (at any production volume) for assemblies whose fastener-plus-joint count, multiplied by per-fastener assembly labor and per-joint inspection cost, exceeds the AM single-piece manufacturing premium.

**Heuristic form.** Let

- $C_{\rm AM}$ = AM cost of the consolidated single piece;
- $C_{\rm conv}$ = sum of conventionally-manufactured part costs (machined / cast / formed);
- $N$ = fastener-plus-joint count;
- $C_{\rm assy}$ = per-fastener assembly + inspection cost.

Then AM is favorable when

$$
C_{\rm AM} \;<\; C_{\rm conv} + N \cdot C_{\rm assy}
$$

For aerospace and medical assemblies, $C_{\rm assy}$ is dominated by *inspection* and *traceability* labor and is typically 5–50× the bare assembly time cost. This pushes the crossover sharply in AM's favor for high-fastener-count assemblies, even when the per-part AM cost is much higher than the per-part conventional cost.

**Exemplar.**

- GE LEAP fuel nozzle: 20 conventional parts → 1 AM part. Eliminated 18 brazed joints. The consolidated AM part is more expensive per piece than any single conventional component, but cheaper than the assembly. Production: hundreds per month since 2016.
- Airbus A350 cabin bracket: 4 brackets + fasteners → 1 AM bracket. 30% lighter, certified.

**Design corollary.** When evaluating AM for a part, evaluate it for the *assembly the part is part of*, not the part in isolation. The DfAM exploit ([design-for-am](./predication-design-for-am.md)) here is consolidation, not cleverness in geometry.

**Counterexample.** Single-fastener assemblies (e.g., a bolt-on bracket) rarely benefit from consolidation. The crossover demands $N$ at least order 5–10 for most aerospace cost structures; smaller for medical implants where qualification cost per part is high; larger for consumer products where assembly is cheap.

**References.**

- Atzeni, E., Salmi, A. (2012). "Economics of additive manufacturing for end-usable metal parts." *IJAMT*.
- Yang, S., et al. (2015). "Part Consolidation for Additive Manufacturing: A Multi-Layered Framework." *Procedia CIRP*.
- GE press release 2015: LEAP fuel nozzle production milestone.
