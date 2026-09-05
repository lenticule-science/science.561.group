---
type: example
class: failure-analysis
instantiates: [cooling-warping-tradeoff, adhesion]
---

# Failure analysis — why this print warped

**Symptom.** A 200 mm × 100 mm × 30 mm tall ABS part lifted off the bed at the corners during printing. Lifting began around layer 40 (~ 8 mm height) and progressed; by layer 80 (~ 16 mm) the corners were 3 mm above the build plate and the part detached from the build plate around layer 100. The print failed with the nozzle dragging the partially-attached part.

**Diagnostic chain.**

1. *Was first-layer adhesion adequate?* Yes — the print ran 40 layers without lifting. First-layer issue ruled out by counterfactual: had first-layer adhesion been the proximate cause, the part would have lifted within the first 5–10 layers, not at layer 40.

2. *Is this consistent with [cooling-warping](./predication-cooling-warping-tradeoff.md)?* Yes. ABS has $T_g \approx 105$°C and a substantial cooling contraction. The part footprint is large (200 × 100 mm), maximizing the moment arm of corner-lifting stress against the build-plate adhesion at the part center.

3. *Was the printer enclosed?* No — open desktop printer in an ambient $\sim 22$°C room. Ambient temperature $\sim 80$°C below ABS $T_g$ is the proximate cause: deposited layers cool through $T_g$ rapidly, contract while the upper layers are still being deposited hot, and accumulate stress concentrated at the corners.

4. *Could this have been prevented in software?* Marginally. A brim of 8 mm at the corners would have widened the adhesion footprint and delayed lifting by 10–20 layers. A higher first-layer-only nozzle temperature would have improved first-layer plate bond. Neither would have prevented eventual lifting; the warping force grows with each layer of cooled material.

5. *What is the actual fix?* **Heated enclosure.** ABS prints reliably only when the chamber is held at $40$–$60$°C (well below $T_g$ but high enough to limit cooling-rate gradient and reduce per-layer contraction stress). This is hardware, not slicer settings.

**Underlying principle.** ABS on an open printer is a hardware mismatch: the material's process window does not include "$22$°C ambient." Open-printer ABS prints succeed only at small footprints (footprint × max-cooling-stress fits within first-layer adhesion strength). Above the footprint threshold (~ $80 \times 80$ mm for typical PEI-and-glue setups), failure is a near-certainty regardless of slicer skill.

**Decision tree for the user.**

- *If the user already owns the printer and cannot modify it:* recommend a different material (ASA at low cooling has slightly more forgiving warping; PETG is dramatically more forgiving; PLA is trivially printable but lacks the heat resistance ABS was chosen for) or split the part into smaller sub-parts that each fit within the open-printer ABS footprint envelope.
- *If the user can build a passive enclosure:* a draft-blocking cardboard or acrylic enclosure raises chamber temperature to $\sim 30$–$40$°C in steady state; this is sometimes enough for moderate parts but not for parts of the size at hand.
- *If the user can buy or build an actively-heated enclosure:* the original part design will print without modification.
- *If the user needs the part now and has no enclosure:* re-design in PETG; thermal performance is worse than ABS but adequate for many use cases, and PETG warps trivially less than ABS.

**Lessons.**
- Warping is not a slicer problem.
- "I tuned my settings and it still warped" is consistent with hardware-limit being reached; further tuning will not help.
- Material selection should follow hardware capability, not the other way around.
