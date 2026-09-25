---
type: narrative
introduces: [pla, petg, abs, asa, nylon, tpu]
discusses: [glass-transition, hygroscopicity]
title: Material selection for functional FFF parts
description: The FFF material-selection question is, in practice, a small decision tree.
---

# Material selection for functional FFF parts

The FFF material-selection question is, in practice, a small decision tree. The dominant constraints are **service temperature**, **load type**, **environment**, and **operational overhead the user can sustain** — not exotic property requirements. The decision tree below covers ~$95\%$ of practical part choices.

**Step 1 — Service temperature.**

- Below $50$°C: any common material works. Continue to step 2.
- $50$–$65$°C: rule out as-printed [PLA](./predication-pla.md). Continue with [PETG](./predication-petg.md) or above.
- $65$–$90$°C: rule out PETG. Continue with [ABS](./predication-abs.md), [ASA](./predication-asa.md), or [PA](./predication-nylon.md).
- $90$–$120$°C: rule out ABS/ASA. PC, PA-CF, or PEEK.
- $> 120$°C: PC, PEEK, PEI/Ultem; specialty hardware required.

(Annealed PLA exceptions: PLA annealed to $\sim 40\%$ crystallinity reaches $\sim 110$°C service. Useful when annealing is acceptable and parts are not too large to dimensionally control through the shrinkage.)

**Step 2 — Load type.**

- Decorative, no load: [PLA](./predication-pla.md). Easy, cheap, sharp detail.
- Sustained tensile/bending load, indoor: [PETG](./predication-petg.md) or [ABS](./predication-abs.md). PETG if no enclosure; ABS if enclosure available.
- Cyclic load (gears, hinges, parts that flex repeatedly): [PA](./predication-nylon.md), preferably PA-CF.
- Impact load (drops, snaps, bumps): ABS, ASA, or [TPU](./predication-tpu.md). Avoid PLA.
- Flexible part (gaskets, bumpers, hinges-as-flex): TPU.

**Step 3 — Environment.**

- Indoor, climate-controlled: any choice survives.
- Outdoor, sun-exposed: [ASA](./predication-asa.md) is the only PLA-class material that survives sun reliably. Avoid PLA (UV-cracks within months) and ABS (UV-cracks within a year).
- Wet / humid (continuous): avoid PA — hygroscopic plasticization is severe. PETG, ASA, PC, TPU all tolerate humidity better than PA.
- Chemical exposure (oils, fuels, solvents): PA is the engineering-plastic choice. PETG resists many but not all solvents; PLA dissolves in acetone-class solvents.
- Food-contact: PETG is FDA-compliant; some PLA grades; specialty food-safe PEEK. Verify per-spool — pigments and additives complicate the food-contact story.

**Step 4 — Operational overhead.**

- Open desktop printer, beginner: PLA, PETG. ABS will fail; PA will fail.
- Open desktop printer, willing to dry filament: PLA, PETG.
- Enclosed printer, intermediate user: any of PLA/PETG/ABS/ASA, plus PC if hotend is all-metal.
- Enclosed printer with chamber heating + in-line dryer + abrasive-resistant nozzle: any material including PA, PA-CF, PC, PEEK.

**The default ladder.**

For a user starting from "I want a functional part" with no specific constraint:

1. **Default to PETG.** Tougher than PLA; survives modest heat; less brittle; printable on open hardware.
2. **Move down to PLA** only if appearance/detail dominates and load doesn't matter.
3. **Move up to ABS/ASA** only if PETG's $65$°C ceiling is exceeded or impact strength dominates — and only if an enclosure is available.
4. **Move up to PA-CF** only if cyclic load or chemical resistance demand it.
5. **Move up to PC, PEEK** only if both heat *and* load demand it, accepting professional-machine operating overhead.

**The two-spool starting kit** for a serious functional-FFF user is one good PLA and one good PETG. Together they cover most use cases. ASA enters when the user prints outdoor parts; ABS rarely justifies itself anymore (ASA's UV stability or PETG's printability usually wins). PA enters when low-friction cyclic-loaded parts are the design driver.

The most common selection error is **over-selection** — choosing PA-CF for a part that PETG would handle, paying for the operational overhead unnecessarily. The second most common is **under-selection** — printing in PLA a part that needs PETG's toughness because PLA was already loaded. Selecting before printing, not the other way around, avoids both.

## Earlier material

- Below $50$°C: any common material works. Continue to step 2.
- $50$–$65$°C: rule out as-printed [PLA](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/pla.md). Continue with [PETG](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/petg.md) or above.
- $65$–$90$°C: rule out PETG. Continue with [ABS](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/abs.md), [ASA](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/asa.md), or [PA](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/nylon.md).
- $90$–$120$°C: rule out ABS/ASA. PC, PA-CF, or PEEK.
- $> 120$°C: PC, PEEK, PEI/Ultem; specialty hardware required.

- Decorative, no load: [PLA](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/pla.md). Easy, cheap, sharp detail.
- Sustained tensile/bending load, indoor: [PETG](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/petg.md) or [ABS](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/abs.md). PETG if no enclosure; ABS if enclosure available.
- Cyclic load (gears, hinges, parts that flex repeatedly): [PA](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/nylon.md), preferably PA-CF.
- Impact load (drops, snaps, bumps): ABS, ASA, or [TPU](../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/objects/tpu.md). Avoid PLA.
- Flexible part (gaskets, bumpers, hinges-as-flex): TPU.
