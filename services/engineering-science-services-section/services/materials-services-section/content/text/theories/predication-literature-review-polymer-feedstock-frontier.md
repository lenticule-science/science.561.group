---
type: prose
class: literature-review
status: draft
---

# A literature review of FFF polymer-feedstock development (2008–2026)

The history of FFF can be told as a sequence of feedstock unlocks: each new printable polymer opens an application class, then drives hardware and process refinement until the next polymer becomes accessible. This narrative traces that arc.

## The pre-2008 era: ABS only

Stratasys's commercial FFF systems shipped with ABS, polycarbonate, and ULTEM (PEI) — chosen for compatibility with the Stratasys hot-end and chamber, not for application breadth. Open-ambient hobbyist printing was not yet a thing. The single Stratasys catalog defined "what FFF prints."

## 2008–2012: PLA and the open-source hardware revolution

The expiry of key Stratasys patents (2009) and the RepRap project (Bowyer, 2005–) opened the FFF market to the hobbyist polymer market. PLA — already commodified for compostable food packaging — became the first feedstock outside the Stratasys catalog because its low $T_g$ (60°C) and slow crystallization made it printable on open-ambient hardware. PLA's properties became the implicit baseline for "what FFF feels like" to the next decade of users.

Early academic studies: Wittbrodt & Pearce (2015) "PLA color affects mechanical properties," Drummer et al. (2012) on PLA-TCP biocomposite. The literature was largely characterizing-what-already-works rather than developing-new.

## 2012–2017: PETG and the engineering-polymer wave

PETG (polyethylene terephthalate, glycol-modified) emerged as a consumer-grade engineering polymer for FFF: tougher than PLA, more thermally stable, water-resistant, prints cleanly without enclosure. The combination of properties was a new niche between PLA (decorative, prototyping) and ABS (durable but warp-prone).

The same period saw the practical commodification of:

- *Nylon (PA12, PA6, PA-CF).* Hard but worth it. Hygroscopicity-management literature (drying, sealed feeding) developed during this period.
- *TPU.* Flexible FFF feedstock; opened the door to gaskets, dampers, soft-rigid composites. Required direct-drive extruders.
- *ABS-PC, ASA, HIPS.* Engineering polymer blends with FFF-tuned formulations.

Key references: Cantrell et al. (2017) — the still-cited mechanical-property benchmark for ABS and PC. Spoerk et al. series (2017–2018) — the systematic process-property characterization that turned "ABS warping" from a tuning problem into a science.

## 2017–2021: Fiber reinforcement and the Markforged moment

Markforged (founded 2013, first system shipped 2014) commercialized continuous-carbon-fiber FFF in a tabletop format. Property numbers — specific stiffness approaching aluminum — were industry-disrupting. The same period saw chopped-fiber-loaded FFF feedstocks (PA-CF, PETG-CF, PEEK-CF) become commodity products from Polymaker, Bambu, Fillamentum.

The fiber-reinforced FFF science consolidated:

- Brenken et al. (2018) — the comprehensive review.
- Heller et al. (2016) — fiber-orientation kinetics in nozzle flow.
- van der Klift et al. (2016) — first published continuous-CF FFF tensile data.

Process-physics implication: fiber-reinforced FFF *amplifies* anisotropy (fibers align in-bead but cross no layer interfaces), so build orientation and chamber control become more important, not less. The metal-AM-style PSP framing (see [process-structure-property-linkage](../../../services/additive-manufacturing-services-section/content/text/theories/predication-process-structure-property-linkage.md)) starts to land in polymer FFF here.

## 2018–2024: PEEK becomes accessible

Through the early 2010s, FFF-PEEK existed only on industrial machines (Apium, Roboze) at >$100k. Through the mid-2010s, machine prices dropped (Intamsys FUNMAT HT at ~$5k–$10k, Creator3 at lower tiers); feedstock prices dropped from >$1000/kg to ~$300/kg by 2024.

The crystallinity-control problem (chamber thermal program → crystallinity → mechanical properties) was the hard science problem. Yang et al. (2017) is the canonical study. The current frontier: in-process measurement and control of crystallinity. See [peek](./predication-peek.md).

## 2020–2026: Recycling and the circular feedstock frontier

A research wave driven by the realization that distributed manufacturing is only "green" if feedstock loops are closed. Three threads:

1. **Mechanical recycling at workshop scale.** RecycleBot, Filabot, 3devo, Precious Plastic. Open-source designs and commercial extruders made local recycling feasible. The property-degradation question — how many cycles can PLA / PETG / ABS sustain before recyclate properties become unacceptable — is the open empirical question. Cruz Sanchez et al. (2017, 2020), Beltran et al. (2021).

2. **Bio-based and biodegradable feedstocks.** PLA was the first; the 2020s research front is on PHA (polyhydroxyalkanoates), lignin-filled PLA, cellulose-filled PLA, and protein-based feedstocks. Each opens a niche.

3. **Reactive recycling chemistry.** Adding chain extenders (Joncryl ADR for PLA / PET, isocyanate-functional for PA) during reprocessing rebuilds molecular weight. Effectiveness is partial; commercial recycled-PLA filaments routinely use chain extenders and report 80–90% of virgin properties at one cycle.

## 2024–2026 frontier: feedstock-as-design-variable

The deeper shift is treating feedstock as a *design variable* of the part rather than a fixed catalog choice. Examples:

- **Multi-material FFF** (Bambu AMS, Prusa MMU3, Prusa XL): part contains multiple polymers in different regions. Design problem: which material where, and how to engineer the interface (see [multi-material-interface-strength](../../../services/additive-manufacturing-services-section/services/fused-filament-fabrication-services-section/content/text/theories/predication-multi-material-interface-strength.md)).

- **In-build feedstock blending** (research: Polymaker, BASF prototypes): blend two polymers in real time at the extruder. Continuous spatial gradients. Not yet productized.

- **Functionally graded fiber loading.** Continuous carbon-fiber FFF with variable fiber-density placement: more fibers where stress is high, fewer where stress is low. Markforged Eiger software is partway here.

- **Reactive printing.** Print A and B that polymerize on contact. Two-part epoxy and reactive polyurethane FFF demonstrated in research. The "active matter" frontier: print a part that continues to polymerize or crosslink after deposition.

## What might unlock the next phase

- *In-line feedstock characterization.* MFI, moisture, melt rheology measured at the extruder before printing. Would enable per-spool calibration and recyclate-feedstock confidence. Hardware exists (research-grade); productization pending.
- *AI-formulated feedstocks.* Train models on the (formulation → processability + properties) map and search formulation space for application-specific feedstocks. Active research at BASF, Covestro, Stratasys.
- *Standard recyclate specifications.* ASTM F42 working group on "secondary feedstock"; in draft.

## Reading order for a new researcher

1. Mark, *Physical Properties of Polymers Handbook* — orientation in polymer thermo-mechanics.
2. Wool, *Polymer Interfaces* — bond-strength theory.
3. Spoerk et al. (2020) — modern integrated review (PP-focused, broadly applicable).
4. Brenken et al. (2018) — fiber-reinforced FFF.
5. Yang et al. (2017) — PEEK and crystallinity-control.
6. Cruz Sanchez et al. (2020) — recycling frontier.
