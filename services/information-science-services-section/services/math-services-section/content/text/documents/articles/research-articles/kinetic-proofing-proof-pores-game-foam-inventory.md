---
title: "Kinetic Proofing, Proof Pores, and Game Foam: An Asset Inventory"
description: "Full-corpus inventory of the kinetic-proofing concept cluster (proof pores, proof foam, kinetic obstruction), all currently uncommitted working-tree state."
date-created: 2026-07-26
kind: research-note
keywords:
  - kinetic-proofing
  - proof-pores
  - game-foam
  - kinetic-proofreading
  - asset-inventory
status: settled
declared-by: claude-interactive-session
type: research-article

---

This note is the object: a full-corpus inventory of every asset tied to "kinetic proofing" and its supporting vocabulary (proof pores, proof foam, kinetic obstruction). A subagent produced it by grepping the tree for `kinetic.?proof`, `proof.?kinetic`, and variants, by searching file names, and by running a full git-history search (commit-message grep, content pickaxe, and a full deletion sweep) through the sanctioned Git Services Section wrapper, since raw `git` is blocked by standing order. It also checked git tracking status for every matched file, because that status turned out to be load-bearing: every asset below sits currently as either an untracked new file or an uncommitted modification, in each of the three git repositories these paths span (top-level `/home/emsenn/info`, the `red-cup-engineering` submodule, and the `board-of-directors/services/executive-office` sub-repo). None of it has yet been committed anywhere, which is why full-history pickaxe searches for the phrase return zero matching commits — there is no commit yet to find.

## 1. Canonical definitions (live, uncommitted)

`docs/dev/semiotic-vitrimer-runtime-specification.md` is named by this node's own `AGENTS.md` as the authoritative glossary for this work. It defines: "**Kinetic proofing** — Repeated, economically accountable challenge of a candidate result through structurally independent evidence before settlement. Additional checking MUST be purchased when its expected reduction in acceptance risk exceeds its expected cost; it MUST NOT be a ceremonial fixed checklist." It also defines **Proof pore** (a typed admission boundary keyed to a state transition), **Proof game**, and **Game foam** ("the network of proof games whose shared dry interfaces retain only behavior reached by valid counter-strategies"), and lists "kinetic proof pores enforcing typed artifacts and evidence-bound acceptance" as a required runtime-topology item.

The root `AGENTS.md` carries an uncommitted addition: "A reaction advances only through the artifact and independent receipt required by its next proof pore. An agent may choose among enabled bids; it may not invent an easier next step."

## 2. Research notes (lenticule-science, entire 2026-07-24/25 note directories untracked as a block)

`2026-07-25-note-on-kinetic-obstruction-as-a-third-verification-failure-mode.md` ("Proof Pores") is the core theory document for this cluster. It names "the kinetic obstruction" as a third verification-failure mode alongside local disagreement and cohomological frustration, states "That gap between 'connected' and 'conducts fast enough' is where kinetic proofing lives," and applies Hopfield-Ninio kinetic proofreading formally to proof-pore theory in its Theorem 5.2 ("Two conditions for the squared floor") and Corollary 5.3 ("Two passes of one method are one pass"). It cites Hopfield, J. J. (1974), *Kinetic proofreading: A new mechanism for reducing errors in biosynthetic processes requiring high specificity*, PNAS 71(10), 4135-4139.

`2026-07-24-research-on-fabrication-with-fidelity-kinetic-proofreading-germline-and-error-catastrophe.md` ties the "evidence-bound fixation gate" (`induct-work-products.mjs`) directly to Hopfield/Ninio kinetic proofreading as the model for why the gate buys fidelity. `2026-07-24-allosteric-governance-of-a-polycapcellular-union.md` states: "Hopfield (1974) and, independently, Ninio (1975) showed that biological fidelity... is bought by spending free energy and time," and carries a full references section with DOI links (below). `2026-07-24-research-on-the-central-dogma-of-code-fabrication.md` names "Hopfield's 1974 kinetic-proofreading result" and distinguishes its own claim from the sibling note's.

Five further 2026-07-25 notes (physarum-zeosemiocenum monograph and system specification, diagenetic ladder, arena-instantiated medicinal design software, the CapCell AP-EVM standard note) cite or apply the same Hopfield-Ninio framing, one of them explicitly disclaiming positive transfer of the biological result to its own verification architecture. Two companion notes on "game foam" and "capability attack surface via drying and placement" are cross-referenced by the kinetic-obstruction note as sibling treatments of the same authored cluster, using Girard's ludics rather than the word "kinetic" itself.

## 3. Live source code implementing the concept (uncommitted, across two submodules)

`acceptance-capsule-procurement-service/src/proof-foam.mjs` exports `observeProofFoam`, `observeProofKinetics`, and `proofIncarnation`; its `disposition` field takes the value `"kinetic-obstruction"` when the computed Deborah fraction (`proofingDeborah`) exceeds 1. A companion `proof-pore-journal.mjs` implements "provider-local write head for kinetic proof pores," and a full test suite (`proof-foam.test.mjs`) asserts the exact disposition. A private data directory of proof-pore journals (three `.jsonl` files, 88KB-203KB) shows this pipeline has already been run locally.

The entire `planned-transition-admission-service` is new and untracked. Its contract states: "local and kinetic proof-pore permeability, placement of every proposed effect, Girard incarnation," with the postcondition "Timestamps are reported as kinetic evidence and never authorize, expire, retry, or refuse a transition." Its test suite asserts `result.proof.kinetic.authority === "timestamps-are-evidence-not-deadlines"` and a test titled "a propagating proof pore refuses kinetically without a timer."

In the executive-office sub-repo, `sovereign-improvement-board-service` carries uncommitted `+` edits requiring `kineticProofRequired: true` and a receipt of type `ImprovementGameKineticProofReceipt` (`game-board.mjs`, `board.mjs`, `service.mjs`).

## 4. First appearance

"Kinetic proofreading" is the earlier phrase. "Kinetic proofing" is the later formulation for a planned monograph.

## 5. Bibliography links found

`2026-07-24-allosteric-governance-of-a-polycapcellular-union.md` carries a references section with DOI links for Coase (1937), Eigen (1971), Grassé (1959), Hopfield (1974, "Kinetic proofreading," https://doi.org/10.1073/pnas.71.10.4135), Kiers et al. (2011), Koshland/Nemethy/Filmer (1966), Monod/Wyman/Changeux (1965), Ninio (1975, "Kinetic amplification of enzyme discrimination," https://doi.org/10.1016/S0300-9084(75), and Noë & Hammerstein (1994). No arXiv, nLab, or Wikipedia links appear anywhere in the matched corpus.

## Legacy/historical-only findings

None found for the actual term. A commit-message grep for "kinetic" across full history returns exactly one unrelated hit (an Infomaterial submodule bump). A full-history content pickaxe for "kinetic proof"/"kinetic-proof" returns zero commits in either the top-level repo or the sub-repos, consistent with the fact that this material has never been committed. A deletion sweep filtered for the same terms surfaces only unrelated material: a pulp-fiction essay using "telekinetic," pharmacology archive pages on "pharmacokinetics," and a deleted Lean module (`Infomaterial/Relational/Kinetic/{BoltzmannClosure,DiscreteVelocityCollision,MolecularChaosGluing}.lean`) that is literal Boltzmann-gas kinetic theory — physical-chemistry kinetics, unconnected to kinetic proofing, and confirmed as such by reading its still-live successor, `Obsmetrologia/KineticTheory.lean`. Four deleted "Lean proofing" memos about agentic theorem-proving were checked directly and contain no mention of "kinetic" at all.

## What would falsify this inventory

A commit anywhere in the repository's three git roots containing the phrase "kinetic proof" or "kinetic-proof" would falsify the claim that this entire cluster remains uncommitted working-tree state.
