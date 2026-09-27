---
title: "Note on Preparing Obsmetrologia for Public Release"
description: "What Obsmetrologia has to become before a public release: a metrology of identification whose only primitive data are marks uttered as (token, claim) and whose only axiom is Quot.sound, seated once at the root as the biextensional collapse of the measured utterance space. Covers the library's measured state on 2026-09-27, where the Lean diverges from the theory, and the ordered work that closes the gap."
date-created: 2026-09-27
type: notes
name: 2026-09-27-note-on-preparing-obsmetrologia-for-public-release
authors:
  - claude-opus-5-5
status: draft-for-review
keywords: ["obsmetrologia", "release", "axiom-law", "quot-sound", "biextensional-collapse", "utterance", "evidence-swap", "regime", "lineage"]
tags: ["draft"]
---

## The thesis a release has to make true

Obsmetrologia is named for observation/obstruction and metrology
(2026-09-23 note on the software ecosystem). Read against its own axiom
notes, it is a **metrology of identification**:

- The only primitive data are [marks](../../../../../../../../../../content/text/glossary/terms/mark.md),
  admitted only on the two hands of an [utterance](../../../../../../../../../../content/text/glossary/terms/utterance.md),
  token and claim (`Primitive/Mark.lean`, `Articulation/Articulating/Utterance.lean`).
- The only admitted axiom is `Quot.sound`. It is *stipulated* identification: a
  construction declares which of its points it cannot tell apart. `propext` is
  *inferred* identification. It is exactly antisymmetry of the entailment
  preorder on `Prop`, so admitting it assumes, at the base of the logic, the
  poset structure the theory refuses (2026-08-17 note on antisymmetry,
  thinness and the axiom discipline, §2; 2026-09-21 note on the axiom law,
  which supersedes the 08-17 note's tolerance of `propext`).
- The one identification is used once, at the root, and inherited
  downstream. The number of identification sites a theorem inherits measures
  how settled or postulated it is (2026-09-03 note on the one identification).

That note left open which relation the root identifies along. The corpus
answers it. `Mark.lean` says a mark's identity "is role, downstream". Read a
trace's measurement as a Chu space, with tokens as points, claims as tests and
the measured reading as the entry. Identity-by-role is then that space's
[biextensional collapse](../../../../../../../../../../content/text/glossary/terms/biextensional-collapse.md).
This is Pratt's reflection onto biextensional Chu spaces, FCA's clarification
of a context (Ganter & Wille 1999), and the separated-extensional quotient of
a Barwise–Seligman classification of tokens by types (Barwise & Seligman 1997,
the linguistics section's own central reference). Rows over a finite reading
are decidable, so the lift out of the quotient lands in `Bool`, and the
construction costs `Quot.sound` and nothing more (08-17 note, §5.1).

## Measured state, 2026-09-27

- `lake build` succeeds: 396 jobs, 393 modules, about 108,000 lines, Lean
  v4.31.0, no dependencies.
- Axiom law, from the 2026-09-21b census (`data/records/2026-09-21b-axiom-law-gate.json`):
  - 6,636 house theorems: 3,085 axiom-free and 205 `Quot.sound` only.
  - 3,346 violations, almost all `propext`.
  - 9 depend on `sorry`. There is one live `sorry`, at
    `Closure/Collatz/SemigroupGap.lean:406`.
  - No theorem uses `Classical.choice`.
- Identification sites (2026-09-03 census): 118 distinct sites, none at the
  root. 79 are in `Calculus/Real`, and `Real.Internal.Rat.mk` is inherited by
  595 theorems.
- Lineage: the named spine is about 1,300 lines. 2,325 theorems touch a spine
  constant, and about 4,300 touch none.
- False certificates named in the 09-21 note:
  - `SettlingCohomologyH1.Hn := Unit`.
  - Bool tables restated as theorems.
  - The Fregean keystone as a bundle of finite checks. The orbital theorem is
    now its real form.
  - A `def` tagged as a theorem in the blueprint.
- Nine objects called H¹ (2026-09-04 note on the one H¹).

## Where the Lean diverges from the theory

1. **Measurement uses contrariety.** `Language/Positing/Measure.lean` reads
   evidence against a cell from articulations of a contrary predicate
   (`Contrary`, `no_denial`). Evidence against is instead a primitive side of
   the same cell, and negation swaps the sides (the math term
   [negation](../../../../../../../../../../content/text/glossary/terms/negation.md);
   Nelson 1949, Belnap, Fitting, Avron). SignChain changed to this in commit
   `207fc831317`, and the Lean has not.
2. **Regimes are paired with corners.** `Closure/Regime.lean` still has
   `regimeCornerBij`. Pairing each regime with a spine stage (aperiodic with
   articulating, transfinite with predicating, Scott-continuous with positing,
   finite with settling; math term `regime.md`) was built in `13bb572267d`
   and reverted in `62cc23f874e` only because that session excluded Lean.
3. **The spine reads only the head.** `Spine.predicate` produces reflexive
   seeds. `Articulating.orientedCell` (`Predicating/Oriented.lean`) is the
   one composition the recursion determines without a choice. The 09-21 note
   seated it beside the spine rather than in it.
4. **The caller supplies the reading.** `Spine.run` still accepts a
   caller-supplied reading. `runTrace` measures it and is the composite the
   theory describes.
5. **There is no root identification.** Nothing yet quotients the utterance
   space.

## Ordered work

**A. The spine as the metrology.**

1. Replace `Contrary` with sided telling: a telling is an articulating plus
   its side. Measure both sides of the same cell, and restate `no_denial` as
   "evidence against comes only from a telling against".
2. Re-land the stage and regime pairing.
3. Make the oriented cell the spine's predicate.
4. Make the measured composite the spine.
5. Seat the root identification as the biextensional collapse of the measured
   utterance space. Prove that measurement factors through it and that Chu
   transforms descend.

**B. Discharge the axiom law.** Work in dependency order: spine, then
`Calculus/Order`, `Algebra` and `Real`, then downstream. Ratchet the gate
after each module. Close the three channels the 08-17 note names:

- propositional `simp`, closed by named homomorphism lemmas and reflective
  normalisation;
- `Quotient.lift` into `Prop`, closed by lifting into `Bool`;
- partial operations, closed by totalising them.

Rebuild the internal reals so their identifications factor through the root.
The Collatz frontier leaves the proof path as a stated `Prop`, not a `sorry`.

**C. Remove the false certificates and consolidate the duplicates.** Take out
the four certificate patterns above, collapse the nine H¹ objects to one, and
enforce the lineage law. Every module either touches the spine or is a
registered carrier with a proved instantiation. The domain books (aperiodic
order, causal sets, contextuality, kinetic theory, reaction networks, dense
matter, thermodynamics, game theory) either meet that law or become sibling
Lean packages on top of the core, as `WeiqiObsmetrologia` already is.

**D. Presentation.**

- Rewrite docstrings as mathematics with literature citations, dropping
  "owner ruling" dates and corpus paths.
- Rewrite the root module docstring, which lists modules that no longer
  exist.
- Prune the Verso manual's 43 orphan Part modules.
- Regenerate `lean_decls`, and give the blueprint real home and GitHub
  links.
- Add a README, a LICENSE, a citation file and Reservoir-ready package
  metadata.
- Seed the bibliography from the predication-categories `references.bib`
  (git `9be46127758`).

**E. Realign consumers after the Lean settles.**

- metrologic's `capturedLeanModule` names (`Obsmetrologia.Relational.*`).
- MetroPlat's hole route.
- SignCell's citation of `Cell.initial`.
- pymetrologic's generator, which reads `Charge.lean`.
- The section README, which describes a gitlink, a root `scripts/`,
  `@lenticule-science/articulating` and `lib/formalization` projects that
  are no longer there.

**Release criteria,** read from the instruments that already exist in
`obsmetrologia-theorem-audit`:

- the axiom-law gate at zero violations and zero `sorry`;
- identification sites equal to one, at the root;
- the lineage census clean;
- no `Unit` carriers and no `leanok` outside the law;
- the manual building against the library.
