---
title: "Pebble Games, Percolation, Graph Coloring, and Sorting: An Asset Inventory"
description: "Full-corpus inventory (live, legacy, and git-history-only) of assets tied to pebble games, percolation, graph coloring, and sorting methods used in their support."
date-created: 2026-07-26
kind: research-note
keywords:
  - pebble-game
  - percolation
  - graph-coloring
  - rigidity
  - combinatorics
  - asset-inventory
status: settled
declared-by: claude-interactive-session
---
# Pebble Games, Percolation, Graph Coloring, and Sorting: An Asset Inventory

This note is the object: a full-corpus inventory of every asset tied to pebble games, percolation, graph coloring, and any sorting method used in their support, across the live working tree and full git history. A subagent produced it using `grep -riIn` and `find` across the tree (excluding `.git`, noting but not detail-scanning vendored/generated directories), plus a full git-history search through the sanctioned Git Services Section wrapper, since raw `git` is blocked by standing order.

## 1. Pebbling / pebble games

No graph-pebbling-number or reversible-pebbling Lean formalization exists anywhere in the repository (`grep -rli pebbl -- *.lean` returns zero hits).

What exists, live and as of 2026-07-25 still untracked (`git status --porcelain` shows `??`, no commit history yet), is the Jacobs-Hendrickson / Jacobs-Thorpe generic-rigidity-percolation pebble game, used as a real algorithmic component for testing 2D/3D rigidity-matroid independence in a physical-fabrication design. `2026-07-25-note-on-direct-fabrication-system-blueprint.md:55` states: "Rather than using simple Union-Find algorithms (which can only evaluate graphic connectivity), the EDA engine executes the Pebble Game algorithm. This algorithm dynamically distributes two 'pebbles' per node (representing coordinate degrees of freedom in 2D) to determine whether an added structural contact is independent or redundant." The same note cites generic rigidity percolation on the 2D triangular lattice as continuous and second-order (Jacobs & Thorpe, Phys. Rev. Lett. 75, 4051, 1995; Phys. Rev. E 53, 3682, 1996), and states that Laman's condition fails in 3D — the double-banana graph satisfies the 3|V|-6 count on every subgraph yet is flexible — so the pebble-game solver is exact only on the planar layers. `2026-07-25-note-on-opposition-signature-report.md:37` states: "Independence is tested by the pebble game, not union-find... The (2,3)-pebble game decides whether an edge is an independent constraint, which union-find cannot see." The same citation and distinction recur across nine further 2026-07-25 notes (physarum-zeosemiocenum fabrication and system specification, ossification, sclerotium/sporangia lifecycle, semiotic and game foam, diagenetic ladder, silica ring topology, naming structures) — one of which warns that a controller using union-find instead of the pebble game will misreport a floppy structure as load-bearing.

A `pebble.webp` git-LFS art asset (added 2026-05-30) was deleted 2026-07-15 and 2026-06-06 and is no longer present anywhere in the current tree.

## 2. Percolation

**Live formal Lean development.** `Obsmetrologia/AperiodicOrder/Tiling/Percolation.lean` (413 lines) titles itself "Lenticular percolation: condensate density crosses into conduction/load-bearing topology." It defines `percolationThreshold(N) := N.entities - N.components`, proves `theorem loadBearing_iff_critical` ("a network conducts/bears load exactly when its contacts reach the spanning forest plus one"), `theorem percolation_onset`, and `theorem density_not_sufficient` ("density crosses the threshold but does not determine load — placement does"). Twelve further live Lean modules consume `percolationThreshold`/`loadBearing` downstream (Bead, Quasicrystal, Crystal, Glass, DiamondBeads, Temperature, MatterTopology, CondensateMatter, GlassDynamics/Rotation, CurrencyCocone, CohomologicalContextuality, AperiodicOrder).

**Live blueprint prose.** `docs/blueprint/src/chapters/information/beads/04-lenticular-percolation-density-crosses-into-load-bearing-topology.tex` states seven theorems by name, including the open frontier `thm:percolation-critical-fraction`.

**Reference-ledger discrepancy, stated as fact only.** Seven reference-ledger files cite the namespace `Obsmetrologia.Persistence.Aperiodic.Percolation`, which does not match the live source path `Obsmetrologia/AperiodicOrder/Tiling/Percolation.lean`.

**A recorded self-correction.** The 2026-07-25 leader-speech log states: "'Rigidity percolation is first-order' — I introduced this and propagated it into 9 sites across 9 files... Second-order per Jacobs & Thorpe. Swept."

**Financial-analogy application, live.** The [financial methods catalog](../../../../../../../../../../../../../../../../../../561-group-services-section/services/561-group-science-services-section/services/financial-services-section/content/documents/2026-07-18-obsmetrologia-financial-methods-catalog.md) states: "A cover-nerve is 'load-bearing' iff cells ≥ (entities − components) + 1," sourced to `Percolation.lean` and `CoordinationCohomology.lean`.

**Git-history-only.** `RelMath/Aperiodic/Percolation.lean` was deleted 2026-07-03. A separately-named `Infomaterial/Persistence/Aperiodic/Percolation.lean` was added 2026-06-29 and deleted 2026-06-30 when the Infomaterial project was restored as its own repository, then renamed Infomaterial → Obsmetrologia at commit `5a0a70962e` (2026-07-15). The earliest commit containing the string "percolat" anywhere in history is a squashed-history baseline commit (2026-05-30) whose own message states prior history was discarded — the true origin is unrecoverable.

## 3. Graph coloring / chromatic number

This is the largest cluster (roughly 30 note files, roughly 2,200 combined term hits), descending from one proved Lean program. `GraphColoring.lean:59-65` proves `theorem properColoring_iff_hom`: "A proper C-colouring of G is precisely a graph homomorphism... into the complete-graph colour shift on C." `ChromaticNumber.lean:105-107` proves `theorem K4_requires_FOUR`: "every proper colouring of K₄... is injective... χ(K₄)=4=FOUR," alongside χ(K₂)=2 and χ(K₃)=3. `ColoringEntropy.lean` computes `properK4Colourings_count = 24` (4!) and an edge-coloring entropy of one bit. `Ramsey.lean:85-89` proves `theorem ramsey_three_three`: "Every symmetric 2-colouring of the edges of K₆ contains a monochromatic triangle... R(3,3) ≤ 6." Live Python and TypeScript ports of the coloring proof exist (`pymetrologic/colouring.py`, `.../relating/coloring.mts`), with the Python docstring stating: "Lean proves that a proper colouring is exactly a graph homomorphism into the complete graph on the colour palette, and then computes concrete complete-graph chromatic numbers."

"Chromatic" is separately reused, unrelated to graph coloring, to name a transfinite "settling" construction (`ChromaticLorentzian.lean`, `CausalSets/Action/Chromatic.lean`, the `LenticleChromatic` namespace) — flagged in the source inventory as a distinct sense sharing only the name.

A reference-ledger discrepancy: `.agents/docs/references/relational-coverage.md:74` cites a namespace and path that do not exist; the live file is `Obsmetrologia/CausalSets/Action/Chromatic.lean`.

**Git-history-only.** The coloring Lean trio (`ChromaticNumber`, `ColoringEntropy`, `GraphColoring`) was deleted from the `RelMath` tree 2026-07-03 and from the `Infomaterial` tree 2026-06-30, both superseded by the live Obsmetrologia tree under the same rename lineage as percolation.

## 4. Sorting in support of pebbling, percolation, or coloring

Essentially nothing qualifies. `SetNumberGraphTheory.lean` contains a genuine topological-sort/DAG treatment (`def TopoOrder`, `theorem topo_irreflexive`), but no file in the coloring/percolation cluster references it in either direction — excluded as not clearly tied. `2026-06-18-reference-on-internal-products.md:624` lists "deterministic segment sorting" beside "charge coloring" in a verification checklist, but does not develop a sorting algorithm in support of coloring. No other match ties a sorting algorithm to pebbling, percolation, or coloring anywhere in the working tree or its history.

## 5. Other closely tied combinatorial-game content

`Ramsey.lean` (R(3,3) ≤ 6) is a coloring-adjacent combinatorial-game result built directly on the same complete-graph apparatus. `SoficShift.lean`/`FiniteLocalRule.lean` establish "coloring = factor map = SFT morphism" as one structural fact, bridging symbolic dynamics and graph coloring. A legacy copy of `RelMath/CombinatoricsExtremal.lean` (the bipartite/2-coloring half of the coloring program) has no live counterpart under the current Obsmetrologia tree — flagged as a possibly-orphaned proof, matching an open question already recorded in an executive-office idea record: "The legacy archive holds 5,178 Lean files against Obsmetrologia's 355 current files. Which proven results died in the rewrite without being re-seated?"

## Registries checked

No dedicated concept or algorithm registry names pebbling, percolation, or coloring as a first-class entry anywhere in the repository. The only records that name these concepts are the quantitative-methods-lead office record and the orphaned-theorems idea record above.

## What would falsify this inventory

A Lean file anywhere under the tree matching `pebbl` in its content, or a sorting algorithm whose call site sits inside the percolation or coloring cluster, would falsify the two null results stated in §1 and §4 respectively.
