---
title: "Obsmetrologia weaving mathematics as a source for knitting science"
date-created: 2026-10-12
type: research-note
status: source-grounded-with-open-hypotheses
---

# Weave-to-knit scientific basis

## Current implementation context

The user asked specifically about our weaving math. Read the real code:

- [Fibercraft package / WeaveDraft](../../../lib/obsmetrologia-fibercraft/ObsmetrologiaFibercraft/WeaveDraft.lean) — downstream domain-specific package ObsmetrologiaFibercraft; the current science-services checkout uses **Reading** terminology.
- [Fibercraft package / LenticleCrossing](../../../lib/obsmetrologia-fibercraft/ObsmetrologiaFibercraft/LenticleCrossing.lean) — connects crossings with clopen overlap and bead ports.
- [Upstream Obsmetrologia / PortGrowth](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/AperiodicOrder/Tiling/PortGrowth.lean) — stationary port-incidence towers and composition law.
- [Upstream Obsmetrologia / SubstitutionMatrix](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/AperiodicOrder/Tiling/StepN/SubstitutionMatrix.lean) — Padovan/Fibonacci substitutions and the Padovan identity.
- [Upstream / PortGraph](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/AperiodicOrder/Tiling/PortGraph.lean) — bead/ported routing as a walk, not a mere line segment.
- [Upstream / MatterTopology](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/AperiodicOrder/Tiling/MatterTopology.lean) — combinatorial cycle-rank model.
- [Upstream / LocalMldClassification](https://github.com/lenticule-science/obsmetrologia/blob/main/Obsmetrologia/Language/Positing/LocalMldClassification.lean) — a FOUR-level gauge classification.
- [Blueprint / Möbius inversion](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/blueprint/src/chapters/information/tiles/06-reading-the-draft-back-is-m-inversion.tex) — **open** recognizability/frontier.
- [Blueprint / fabric mechanics vs Landauer](https://github.com/lenticule-science/obsmetrologia/blob/main/docs/blueprint/src/chapters/information/beads/01-friction-jamming-and-the-landauer-cost-of-un-weaving.tex) — **open** physical equivalence, not an achieved theorem.

## Facts established at the finite formal level

1. The plain weave warp-word rule alternates Boolean over/under observations. It is realized by an SFT/sofic word model with a no-identical-adjacent-pairs law. This is a **word model**, not a verified knitting pattern.
2. Each crossing can be assigned a two-slot FOUR/Reading value: unknown (neither over asserted), definite one-way over, definite the other way, and incompatible (both over asserted). Negation exchanges the two definite values and fixes the two extremes. Reading both over is not a physically realized double-over yarn geometry.
3. On a finite plain weave swatch with both row alternation and column complementation, any two rows are equal or complements in the current Lean model. The code proves this finite result, even though some historical module documentation still describes its two-dimensional frontier as unfinished. **Do not extend it silently to the infinite analytic model.**
4. A growth tower has portGrowth(M,k)=M^k and the telescoping law M^(a+b)=M^a M^b. The source Padovan substitution is a→b, b→c, c→ab. Its matrix satisfies M^3=M+I. This describes a finite incidence rule; it is **not** a proof that the produced geometry can be hand-knit.
5. The discrete contact-graph cycle rank increases by one on adding a redundant edge when vertex and component counts remain unchanged. That is a graph fact, not a universal law of woven/knitted rigidity.

## Source-level concern: handedness is erased

In the current Fibercraft WeaveDraft, warpClaim and weftClaim are assigned the same Obstruction value (1,1). The purported left/right bias demonstration uses those untagged values. The function assignmentOf reads whether the selected list has an index 0/1 using only its length, not which named claim occupied that position. A singleton returned by either solver therefore decodes to the same physical direction. The proven result “each choice avoids the unsupported two-over assignment” does **not** establish a distinct left/right textile result. A future implementation needs tagged claim identities/slots and a decoder preserving actual choices.

This is a concrete observation for code review, not a claim that the entire upstream attention solver is mathematically invalid. Do not encode a wearable cable direction in that lossy representation.

## Research conjectures and tests, not settled textile laws

- **Defect-carrying cablework:** translate local constraint disagreements into specific knit/purl/transfer/eyelet/ladder moves with an executable loop graph. Show global obstruction forces at least one local deviation in a declared model; then verify the actual fabric.
- **Padovan/Bratteli growth textiles:** derive chartable graded stitch blocks from the substitution, preserving yarn order, conservation/count updates, and tension constraints. Determine what information can be read back from a finished swatch.
- **Fabric as a propagator:** proposed correspondence between knitted loop dependency, causal propagation and incidence inversion; compare computational predictions to unraveling experiments. “The woven sheet is the propagator” is a mathematical analogy in the blueprint, not measured constitutive mechanics.
- **Metamaterial energy and friction:** build swatches with controlled knit topology and compare applied work, hysteresis and unravelling. The identity of topological cycle rank and actual Landauer erasure cost remains **open**.
- **Generative stitch admissions:** supply typed, nontrivial stitches and a legality/scheduling witness when an intended visual path cannot be achieved with existing operations. Keep honest about hand versus machine capabilities.
- **Quasiperiodic fabrics:** investigate substitution sequences, visible cable rhythm, fabric density and blocking response. Avoid asserting the unproved Pisot diffraction connection as a finished experiment.

## Required bridge to knitted materials

A woven warp-over/weft-over matrix cannot be copied into a weft-knitting chart. A knit loop structure additionally needs:

- an ordered yarn path and the order of successive loops;
- the old-loop/new-loop support edge, not merely an over/under image;
- a front/back and working-side convention;
- per-row live needle state and stitch counts;
- typed increases, decreases, transfers, short rows, cables, joins and dropped-stitch operations;
- geometric and measured constraints: yarn bending/contact, float and pull, gauge, ease, wash response, skin/arm comfort;
- a schedulable needle/tool plan and an independent knitter-readable chart.

A sufficient future intermediate representation would have: loop graph + chronological operations + needle/work-side state + yarn specifications + proven/local constraints + unproved material assumptions + target garment geometry. The exact one cannot be invented by changing a theoretical adjacency to a color block.

## Open engineering debts

- Locate and repair duplicated or drifting weaving code across upstream Obsmetrologia and downstream ObsmetrologiaFibercraft without assuming one file supersedes the other.
- Decide which pieces of PortGrowth belong in the downstream fibercraft package, while preserving no-new-primitives discipline.
- Fix handed-choice identity loss before using it to generate over/under or cable moves.
- Implement and test a proper typed knitted-loop carrier, then translation/optimization and Knitout/code generation downstream.
- Show measured evidence for drape, fabric mechanics and shape after washing, not just algebraic consistency.