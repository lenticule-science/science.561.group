---
title: "Note on the One Identification and the Site Census"
description: "Quot.sound is the single identification used in Obsmetrologia (once, at the articulating root, inherited downstream; the count of independent identifications a theorem inherits is the settled/postulated measure), the two whole-library measurements taken the same evening against that law, and the structural discharge they point at."
date-created: 2026-09-03
type: notes
name: 2026-09-03-note-on-the-one-identification-and-the-site-census
authors:
  - emsenn
  - claude-fable-5-1
status: active
keywords: ["axiom-discipline", "quot-sound", "landauer", "identification-site", "articulating", "settled", "postulated", "census"]
tags: []
---

## The axiom policy

`Quot.sound` is used once at the root of the articulating spiral and inherited
downstream. In Lean, the number of `Quot.sound` axioms distinguishes a settled
claim from a postulated one. Everything descends from `Mark`, and `Quot.sound`
is the corpus's Landauer bit. This account is not a reading found in public
literature; it builds on and extends that literature.

This refines the axiom policy already carried in
`2026-08-17-note-on-antisymmetry-thinness-and-the-axiom-discipline.md` (same
directory tree, `notes/2026/08/17/`): there, `Quot.sound` is stipulated
identification and `propext` is inferred identification, and a declaration's
axiom list records which identifications its proof was willing to make. The
ruling adds the structural requirement: there is meant to be exactly one
stipulated identification, at the root, and the library's whole proof-path
descends from it. A theorem that inherits only that one identification is
settled; a theorem that inherits identifications introduced elsewhere is
postulated to that degree.

The relationality carrier this descends from is the founding derivation in
`philosophy-services-section/services/relationality-services-section/lib/legacy/2025-11-09-relationality-research/on-relationality.md`:
one primitive (Relationlessness) and one act (Reflex), whose first application
draws the first boundary, relation versus no relation, and every later act
reuses or partitions what that first act produced. The one identification is the
formal shadow of that first act. Which Lean construction realizes it is open (see
below); this note does not decide it.

## The two measurements

Both were taken with `lake env lean` against the built package at
`lib/obsmetrologia`, by Lean meta programs whose source is embedded in the
records so each census reproduces from its record alone.

**Axiom census** (`data/records/2026-09-03-theorem-axiom-census.json`, rows in
the sibling `-rows.tsv`): every theorem under `Obsmetrologia.`, its axiom set by
`Lean.collectAxioms`.

| profile | theorems |
|---|---|
| axiom-free | 4,205 |
| `propext` only | 1,438 |
| `propext` and `Quot.sound` | 2,449 |
| `Quot.sound` only | 207 |
| `Classical.choice` | 0 |
| `sorryAx` | 9 |
| total | 8,308 |

The nine sorries are one open bridge: the Collatz parent-barrier gap
conjectures in `Closure/Collatz` and `AperiodicOrder/Tiling`, and five
`KappaSectorCharges` equivalences that depend on them. No physics sub-corpus
carries a sorry. The library uses no choice anywhere.

**Identification-site census**
(`data/records/2026-09-03-identification-site-census.json`, rows in the sibling
`-rows.tsv`): a constant is an identification site when its own value or type
directly uses `Quot.sound`, `Quot.mk`, `Quot.lift`, `Quot.ind`, `Quot.rec`, or a
`Quotient.*` constructor or eliminator; a theorem inherits every site in the
transitive closure of the house constants it uses.

| measure | value |
|---|---|
| distinct identification sites | 118 |
| sites at the root (`Primitive/Mark`, `Articulation/Articulating`) | 0 |
| theorems inheriting no site | 7,612 |
| theorems inheriting exactly one site | 44 |
| theorems inheriting two or more sites | 652 |
| sites in `Calculus/Real` | 79 |
| sites in `Positing/Bigraded` | 14 |
| sites in `AperiodicOrder` | 11 |
| sites in `Ord`, `Algebra`, `Thermodynamics`, `CausalSets` | 6, 4, 3, 1 |

The most-inherited site is `Real.Internal.Rat.mk`, reached by 595 theorems; the
internal rationals and reals are quotient stacks, and nearly every theorem that
identifies at all identifies through them. Read against the physics-facing
theorems the four-regimes carriers cite: `Thermodynamics.htheorem` inherits 28
sites, all through the internal reals; `KineticTheory.Plasma.reconnection_event_implies_H1_nonzero`,
`CausalSets.Causal.RegimeSection.timeSection_strict_mono`, and
`QuantumContextuality.prBox_hasGlobalSection_iff` inherit none.

## What the measurements say about the ruling

The ruling is not yet true of the library, and the census says exactly how far
off it is. There is no root identification, so today no theorem can be settled
in the ruling's sense; theorems are either identification-free (they never
collapse a distinction) or postulated through the internal reals. The
module-level axiom counts do not concentrate where `H¹` drains (Thermodynamics
and KineticTheory both spend `Quot.sound` in about forty percent of their
theorems), because the spending is inherited from the number stack, not made
at the physics statement. The theory is coherent, while the formalization remains rougher than the
theory.

## The discharge

Two structural moves, both already named in the corpus, make the ruling
measurable and then true:

1. Introduce the one identification at the root. The candidate seat is the
   articulating recursion, since `Articulation/Articulating.lean` calls itself
   "the second and last place Obsmetrologia admits free data" and `Mark` is
   intentionally quotient-free. Which relation the root quotient identifies
   along is the open question of this note; it is the formal form of Reflex's
   first boundary and must be read off the relationality carriers before any
   Lean is written.
2. Rebuild the internal reals so their identifications derive from the root
   rather than standing as 79 independent sites. This is the setoid-reals
   refactor named in
   `notes/2026/07/11/2026-07-11-research-on-infomaterial-top-h1-exchange-thread.md`
   ("the setoid-reals refactor would discharge it tree-wide").

After both, the identification-site census is the ledger the ruling intends:
site count one, at the root, is settled; anything more is postulated, and the
Landauer reading of `Quot.sound` from the 2026-08-17 note prices each extra
site as an erasure the proof made on its own authority.

## Instruments

`scripts/audit-set-of-theorems.mjs` (existing) audits named theorems. The two
census scripts (`census-set-of-theorem-axioms`, `census-set-of-identification-sites`)
are being seated in this section's `scripts/` with tests in the same shape,
each writing its dated record under `data/records/`. Running both after each
change to the Lean is how the discharge is verified: the site count is the
gate, not a reading of the code.
