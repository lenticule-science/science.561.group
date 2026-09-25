---
type: object
class: machine-component
depends-on: []
title: Part-cooling fan
description: A blower or axial fan mounted on the print head, directing airflow at the just-deposited bead to accelerate cooling below $Tg$.
---

# Part-cooling fan

A blower or axial fan mounted on the print head, directing airflow at the just-deposited bead to accelerate cooling below $T_g$. Distinct from the **hotend cooling fan** (which cools the heat-sink above the heat-break and runs continuously at full speed) — the part-cooling fan is software-controlled and varies between $0\%$ and $100\%$ duty depending on layer, material, and feature type.

Part cooling controls the [cooling-warping-tradeoff](../../../../../content/text/theories/predication-cooling-warping-tradeoff.md):

- **More cooling** → crisper [overhangs](../../../../../content/text/theories/predication-overhang.md), shorter [bridges](../../../../../content/text/theories/predication-bridging.md), better detail, but weaker [layer adhesion](./predication-layer-adhesion.md) and severe warping on amorphous engineering polymers (ABS, ASA, PC).
- **Less cooling** → strong layer adhesion, low warping, but droopy overhangs and failed bridges.

Per-material defaults:

| Material | Part fan |
|---|---|
| PLA | $100\%$ from layer 3 onward |
| PETG | $30$–$60\%$ |
| ABS / ASA | $0$–$20\%$ (only for overhangs, if at all) |
| PA, PC | $0\%$ |
| TPU | $50$–$100\%$ (high cooling helps stringing) |
| PEEK | $0\%$ (chamber-controlled) |

Slicers ramp the part fan up over the first 2–3 layers (the **first-layer fan-off period**) to preserve first-layer adhesion: cooling the first bead before it bonds to the build plate degrades adhesion. After bond formation, the fan ramps to material default.

**Bridge-fan override.** Most slicers raise the fan to $100\%$ regardless of material default during bridge moves — bridge quality strictly requires fast cooling, and the layer-adhesion penalty on a single-bead-thick bridge is irrelevant.

**Minimum-layer-time interaction.** When a layer is small enough that the per-layer print time falls below a threshold (typical $\sim 15$ s), the slicer either slows down the print or temporarily ramps cooling — both serve the goal of giving the lower layer enough time to cool before the next deposition. Without this, small features at the top of a tall print soften and slump.

Hardware: blower (squirrel-cage) fans direct flow more precisely than axial fans and are standard on printers built since ~2018. The blower's duct geometry (the "fang" or "manifold") matters as much as the fan: a poorly-designed duct can deliver $40\%$ of nominal airflow to the bead. Voron, Stealthburner, and CNC Kitchen ducts are well-characterized open designs.

A printer with marginal part-cooling cannot print PLA at high speed; it cannot print ABS without an enclosure. Cooling capacity is a hardware ceiling that profile tuning cannot lift.

## Earlier material

Part cooling controls the [cooling-warping-tradeoff](../../../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/theorems/cooling-warping-tradeoff.md):

- **More cooling** → crisper [overhangs](../../../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/teaching/explanations/overhang.md), shorter [bridges](../../../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/teaching/explanations/bridging.md), better detail, but weaker [layer adhesion](../../../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/fused-filament-fabrication/archive/teaching/explanations/layer-adhesion.md) and severe warping on amorphous engineering polymers (ABS, ASA, PC).
- **Less cooling** → strong layer adhesion, low warping, but droopy overhangs and failed bridges.
