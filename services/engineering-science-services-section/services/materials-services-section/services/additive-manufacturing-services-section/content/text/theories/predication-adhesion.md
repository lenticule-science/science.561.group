---
type: concept
class: bonding
depends-on: [layer]
title: Adhesion (in additive manufacturing)
description: Bonding between materials at an interface during the AM process.
---

# Adhesion (in additive manufacturing)

Bonding between materials at an interface during the AM process. Two distinct adhesion regimes matter:

1. **First-layer adhesion** — bond between the first deposited layer and the build plate. The build must remain anchored throughout printing or the part dislodges and the print fails. See [first-layer-determines-success](./predication-first-layer-determines-success.md).
2. **Inter-layer adhesion** — bond between layer $S_i$ and layer $S_{i+1}$. Sets [Z-axis strength](./predication-anisotropy.md) and the layer-delamination failure mode.

The two regimes share a physical mechanism (polymer chain interdiffusion across the interface in FFF; partial re-melt in PBF; chemical crosslinking across the cure boundary in SLA) but are controlled by very different process parameters.

**First-layer adhesion is controlled by:**
- Build-plate surface chemistry and texture (PEI, glass, BuildTak, garolite, magnetic flex plates).
- Bed temperature (glass transition mismatch with deposited material).
- First-layer height (squish): typically $80$–$100\%$ of nominal layer height to widen first-bead contact.
- First-layer speed (slower → more thermal contact time).
- Adhesion promoters (glue stick, hairspray, ABS slurry, dimethyl-sulfoxide-based primers).

**Inter-layer adhesion is controlled by:**
- Nozzle/laser/light power (energy delivered per layer).
- Layer time (must be short enough that lower layer is still above $T_g$ when upper layer arrives).
- Chamber/ambient temperature (raises baseline temperature so $T_g$ crossing is delayed).
- Layer height (smaller $h$ → more layers per unit of material → more thermal events stacking up at any given depth).

These two regimes are sometimes confused — "my part is delaminating" might mean either. Diagnosis: if the failure surface is the build plate, it is first-layer; if the failure is between two interior layers, it is inter-layer.
