---
title: Obsmetrologia and Go Strategy
description: "Audience: researchers and future sessions. Findings of the 2026-08-19 board-posed inquiry into whether Obsmetrologia contributes potentially novel Go strategy space: two surviving candidates, six rejections, and falsification paths. Questions and candidate structures, not results. Worked positions deliberately deferred."
date-created: 2026-08-19
date-updated: 2026-08-19
type: text
authors:
  - claude-fable-5
tags: []
---


The board asked: *is there anything the Obsmetrologia mathematics contributes to the strategy of Go that is potentially novel and opens new Go strategy spaces?* An Opus investigator studied the Obsmetrologia corpus (the Lean library's Site/Sheaf/Cohomology stack, pymetrologic's theorem ledger, and seven research notes), the weiqi corpus and kernel, and the actual state of Go theory — Berlekamp–Wolfe combinatorial game theory, thermography and miai counting, and engine-era ownership analysis, with literature checks rather than memory. Eight candidate bridges were assessed. Two survived; six did not.

This note records the findings so they are not re-derived. It deliberately contains **no worked positions**: constructing and verifying candidate positions is deferred until the weiqi content checker (weiqi-lsp) can machine-verify diagrams, and until someone chooses to extend this inquiry. Everything below is conjecture and is labeled as such.

## Surviving candidate 1 — Coordination cohomology as an obstruction to whole-board decomposability

Berlekamp–Wolfe endgame theory draws its power from treating a position as a disjunctive sum of independent local games; it has no formal device for a single move whose effect is shared across otherwise-independent regions — a ladder-breaker serving two ladders, a stone that is aji for two separate fights. When decomposition fails, the theory stops applying rather than quantifying the failure, and engine evaluation, being monolithic, does not localize it.

`Obsmetrologia/Cohomology/CoordinationCohomology.lean` proves, for its federated-cover domain, that the cover nerve's Ȟ¹ = |E| − |V| + |C| counts exactly the cells in excess of a spanning forest — the irreducible cross-region coordination. **Conjecture:** building the analogous nerve from Go regions (vertices) and shared-effect points (edges) yields a localized, computable measure of *how much, and exactly where, whole-board reading rather than regional reading matters* — a formalization of "whole-board vision" that neither CGT, classical thickness/aji heuristics, nor engine evaluation expresses. Literature search found no existing sheaf-theoretic or cohomological treatment of Go decomposability.

**Falsification path:** once the platform's engine review service exists (platform plan, Phase 3), compute the nerve's cycle rank over positions from real games and test whether it predicts where region-local analysis and whole-board engine analysis disagree. No correlation kills the idea.

## Surviving candidate 2 — The inconsistency sheaf as a formalization of aji

Aji is latent potential whose resolution depends on context not yet played — a local-to-global compatibility question. `Obsmetrologia/Cohomology/InconsistencySheaf.lean` (on `Site/Section.lean` and `SettlingCohomologyH1.lean`) formalizes a structured object carrying evidence-for and evidence-against separately, with restriction maps and an explicit gluing obstruction. Applied to a contested group's status across read-lines or assumed future contexts, this differs in kind from KataGo's shipped per-point ownership standard deviation and score variance, which are scalar sampling statistics. **Conjecture:** the obstruction class distinguishes two things engines blur — *"this resolves with deeper reading"* (the obstruction vanishes as settling proceeds) from *"this structurally depends on undetermined context elsewhere on the board"* (the obstruction persists) — and the second is aji, captured as a formal object. No paraconsistent-logic-for-Go or sheaf-theory-for-Go literature was found.

**Falsification path:** correlate a computed obstruction measure against engine review data — cases where deeper search changes a local status assessment versus cases where it does not. If obstruction persistence fails to track context-dependence, the idea dies.

## Rejected candidates, with reasons

- **Sheaf-gluing as miai** — miai's operative content (equal counting value) is already fully captured by established miai counting; the germ-preorder vocabulary restates it without new predictive content.
- **Chu-space / concurrent-game semantics for sente and gote** — the corpus's own 2026-06-18 note derives Conway's CGT as the finite/agon regime of the same category, i.e. the machinery is presented as subsuming existing theory, not exceeding it.
- **Occupation entropy as whole-board heat** — the Boltzmann multiplicity over occupation counts collapses onto what KataGo's ownership variance and CGT's temperature already expose.
- **Germ orders / antisymmetry-thinness as settledness** — real, machine-checked mathematics, but proof-architecture hygiene (relevant to building candidate 2 correctly), not itself a strategic claim.
- **Transfinite regime tower as a reading-depth axis** — Go is finite, perfect-information, chance-free; the whole game sits at one point of the tower, and finite complexity theory (PSPACE/EXPTIME results) already covers settling hardness.
- **Caillois four-regimes reading of Go's phases** — vocabulary import onto standard phase theory with no new evaluative content.

## Status and next steps

Both surviving candidates are analogies with construction sketches, not results. Candidate 1's instrument exists: `scripts/derive-coordination-nerve.mts` builds the nerve of groups and shared liberties from a kernel position and reads its Ȟ¹ through `@lenticule-science/metrologic/obstruction/cochain` (see [Weiqi as Arena, Chu Space, Predication, and Manifold](2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md) §3). The natural next step, if the board chooses to fund it, is a single worked-position study per candidate — authored only once weiqi-lsp can verify the diagrams mechanically — followed by the Phase 3 falsification experiments above. The full investigator's report, including per-file study notes, exists in the 2026-08-19 session record.
