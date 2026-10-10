---
title: "Note on Preparing Obsmetrologia for Public Release"
description: "What Obsmetrologia has to become before a public release: a metrology of identification whose only primitive data are marks uttered as (token, claim) and whose only axiom is Quot.sound, seated once at the root as the biextensional collapse of the measured utterance space. Covers the library's measured state on 2026-09-27, where the Lean diverges from the theory, and the ordered work that closes the gap."
date-created: 2026-09-27
type: notes
name: 2026-09-27-note-on-preparing-obsmetrologia-for-public-release
authors:
  - claude-opus-5-5
status: draft-for-review
keywords: ["obsmetrologia", "release", "axiom-law", "quot-sound", "biextensional-collapse", "utterance", "four-generators", "regime", "lineage"]
tags: ["draft"]
leader-utterances:
  - "ni:///sha-256;K7KzRJpiDjKGanLXTD4uIzKXGfTOdRM6d2u3yttZ9k4"
  - "ni:///sha-256;3LfuO1PforRrICkNqylh1me6gsMs_Pon2EacALRkTsw"
  - "ni:///sha-256;sq8yz9zx8K9JHq2NQARa8p_n-2DCVcy-uSO0Kaz4gsY"
  - "ni:///sha-256;MEyrjCUfRJ36DcfXbmttGa3XxGQHdTsDbufsYAeXjlw"
  - "ni:///sha-256;FazwP8J3rfFECLa5OnFTJ_p8tGFQQpvr9bggsLOeSEI"
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

1. **How evidence against enters.** *Settled 2026-09-27.* Two witnesses
   seemed to place denial differently, both at positing: the 2026-06-17
   monograph made it "the articulation of a contrary predicate" (`Contrary` in
   `Language/Positing/Measure.lean`), and the predication-categories
   formulation tells the same cell against ("Alice does not like Bob" is told
   P(a, b) = f). They are one construction. The codec's pairing was already an
   involution on predicate marks, and an involution pairing each claim with
   the mark of its denial is contradiction, not contrariety: contraries such as
   *likes* and *dislikes* can both be false (Horn 1989), contradictories
   cannot. So evidence against a cell is evidence for its contradictory at the
   same subject and object, which is exactly Belnap's telling against the same
   atom (Belnap 1977; Dunn 1976). The Lean now names it by what it is
   (`Contradictory`, `PredicationCell.contradictory`); a genuine contrary is
   a separate predicate whose bearing on its partner is a rule settling
   applies (`dislikes ⊢ not-likes`), not measurement's pairing. Negation is
   derived, not assumed: `measure_contradictory_negate` proves that measuring
   the contradictory cell is Belnap negation (`Reading.negate`, the exchange
   of the evidence sides) of measuring the cell. It depends on no axioms;
   library and manual check clean through `lean-check`.
   *Fixed alongside:* an articulation cell's two slots are the subject and
   object positions of the predication articulating opens, not evidence sides
   and not the utterance's hands (`subjectSlot`, `objectSlot`); articulation
   names its corners only by which positions are filled (`c286ea1ce5e`,
   `9e486934204`); and the modules that read an articulation cell as a value
   (`ArticulationMeasure`, `Valued.ofCell`) are gone, since value enters at
   positing.
2. **Regimes were paired with corners.** *Settled 2026-09-27.*
   `Closure/Regime.lean` pairs each regime with a spine stage instead
   (`Stage.regime`, `regimeStageBij`: aperiodic with articulating, transfinite
   with predicating, Scott-continuous with positing, finite with settling),
   and `spine_settles_in_settling_regime` and `spine_is_strict` hold by `rfl`
   with no axioms (`3a78ce8c741`). `regimeCornerBij` and the percolation spin
   transported across it are gone, as are the blueprint nodes resting on them.
   The change had been built in `13bb572267d` and reverted in `62cc23f874e`
   only because that session excluded Lean.
3. **The four generators were listed, not derived.** Specialization,
   converse and the two projections were definitions, and `Orbital`'s
   exhaustiveness proof was used by nothing. *Fixed:*
   `Language/Predicating/Generators.lean` derives them from the mark's surface
   not being its identity (`166e17e491d`).
4. **The spine read only the head.** *Settled 2026-09-27:* `Spine.predicate` is
   now `Articulating.orientedCell`, the reflexive seed only on the floor. Before, it produced reflexive
   seeds. `Articulating.orientedCell` (`Predicating/Oriented.lean`) is the
   one composition the recursion determines without a choice. The 09-21 note
   seated it beside the spine rather than in it.
5. **The caller supplied the reading.** *Settled 2026-09-27:* `Spine.run` is the
   measured composite at a newly articulated claim (`run_eq_runTrace`), and what is
   articulated is told for (`run_pos`, axiom-free). The caller-supplied composite is
   `Spine.runSupplied`.
6. **There was no root identification.** *Settled 2026-09-27:* `Language/Identification.lean`
   seats it as the biextensional collapse of the measured trace (`measuredChu`,
   `ChuSpace.collapse`, separable and extensional); measurement factors through it with no
   axiom (`measure_factors_collapse`), identity is role (`token_identified_iff`), and Chu
   transforms descend (`ChuMap.collapse`), all on `Quot.sound` alone. Before, nothing quotiented the utterance
   space.

## Ordered work

**A. The spine as the metrology.**

1. Settle how evidence against enters at positing (the monograph's contrary
   predicate or a telling against the same cell), and make measurement read
   utterances through the codec that turns a domain's evidence into them,
   keeping every witness.
2. Re-land the stage and regime pairing. *Done 2026-09-27 (`3a78ce8c741`).*
3. Make the oriented cell the spine's predicate. *Done 2026-09-27.*
4. Make the measured composite the spine. *Done 2026-09-27.*
5. *Done 2026-09-27.* Seat the root identification as the biextensional collapse of the measured
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
The Collatz barrier stays a frontier theorem, stated and proved by `sorry`,
which the census counts as frontier rather than as a violation.

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

- the axiom-law gate at zero violations, with every `sorry`-dependent
  theorem reported as frontier and none tagged proved in the blueprint;
- identification sites equal to one, at the root;
- the lineage census clean;
- no `Unit` carriers and no `leanok` outside the law;
- the manual building against the library.

## Packaging and presentation

The library is licensed Apache-2.0, the license of Lean and Mathlib. The
license text is at `lib/obsmetrologia/LICENSE`, and `lakefile.toml` and
`package.json` carry the identifier.

### What is strange, and why it can be believed

The program is ambitious far beyond what a new library usually claims. It
says one relational foundation generates:

- logic and order;
- category theory;
- sheaf cohomology;
- aperiodic order;
- causal sets;
- quantum contextuality;
- kinetic theory.

Ambition like that is usually unbelievable because it arrives as prose.
This library can be believed for a different reason: its foundational
commitments are **axiom-level facts that a machine reports**.

- *No `propext`* means that nowhere is it assumed that mutually entailing
  propositions are equal. By the 08-17 note, §2, that is the statement that
  the logic's own propositions are not presumed to form a poset.
- *One `Quot.sound`, at the root* means that identity is only ever
  identification by measured indistinguishability.
- *`sorryAx`* marks a theorem as frontier: stated, with its proof still to
  come. It is counted, never hidden, and never a violation of the law.

`#print axioms` on any theorem shows whether that theorem keeps those
commitments. So the release makes each claim's standing visible, and it
does not ask for trust.

That standing is derived, not declared. The census instruments in
`obsmetrologia-theorem-audit` compute three measures per theorem:

- its axiom profile;
- the number of identifications it inherits;
- its lineage to the spine.

The README and the manual print those measures, generated at build time.
No page carries a hand-written grade.

### Three kinds of claim

The manual's Page Law (`BookI/PageLaw`, and the root of
`ObsmetrologiaManual.lean`) already sorts claims by phase and frontier.
The public package presents that sorting as three kinds:

1. **Proved.** Lean theorems under the axiom law, each shown with its
   measured profile.
2. **Recovered.** Familiar mathematics reached as a *comparison* rather
   than assumed. This is where a working mathematician enters. Examples:
   - Belnap–Dunn FOUR and the Klein-four gauge;
   - the Knaster–Tarski least fixed point;
   - the Lawvere fixed-point theorem, as `no_boolean_self_quotation`;
   - CALM monotone coordination-freedom;
   - the 1+1 Minkowski light cone, whose component group `{1, P, T, PT}`
     is the gauge of FOUR (`LightCone`).
3. **Frontier.** The absurdly ambitious claims ship as stated theorems
   whose proofs are `sorry`, which is how Lean itself marks a statement
   awaiting proof. Each carries what would promote it and what would refute
   it, in the Frontier Lab's form (the 09-21 note's void-dimension claim;
   the Collatz barrier). Lean reports each one, and everything that uses
   it, as depending on `sorryAx`, so the census derives the frontier from
   the library itself rather than from a label. The ambition stays in the
   library as mathematics, and the proof record stays honest.

### Flagship results

Each of these is present in the library, is checkable in an afternoon, and
shows the program's character. The first public README leads with them,
each with its `#print axioms` line:

- `Orbital.orbital_exhaustive`: from four entities on, every naturally
  defined reindexing of an oriented pair is one of four generators.
  `thirdMap_not_orbital` shows that at exactly three entities there are
  nine, because a pair can then name its complement. Predication forces
  FOUR because a predication has two positions, subject and object, the same
  two whose fillings give the four articulation corners. This is the cleanest standalone
  paper in the library.
- `LightCone.kle_iff_lightcone` and `k4_is_PT`: the knowledge order is the
  causal order of a 1+1 diamond. Negation is parity and conflation is time
  reversal.
- `Record.bottom_reflecting_hom_eq_reading` and
  `record_escapes_strict_finite`: the four-valued reading is the forced
  collapse of evidence counts, and the finite settling regime is an
  artefact of boundedness.
- `Settling.asserted_liar_settles_kTop`: the liar, once asserted, settles
  at told-both instead of exploding.
- `measure_cons_le`: evidence has an arrow of time.
- The root identification, once seated (ordered work, A.5).

### The non-western grounding, stated so it holds

**The claim.** The corpus describes this as mathematics derived from
relational rather than substantival principles. The claim is that the
foundation begins where the relational derivation begins:

- Articulating relationlessness produces relation, and entities are
  constituted by their relations
  ([On Relationality](../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/on-relationality.md)).
- A mark has no identity but its role.
- Difference is held open in tension, an ordered composite of two, rather
  than collapsed or exploded.
- Knowledge is witnessed, never declared, and only grows.

Standard mathematics then appears as what that foundation recovers. That
is the precise sense in which it is a reformation. It is a different
starting point whose consequences are checked, not a restyling of familiar
results.

**Precedents.** The package cites independent precedent openly instead of
claiming novelty for the four-cornered structure positing's truth order
reads. Nāgārjuna's catuṣkoṭi (affirmation, denial, both, neither;
[Buddhist logic](../../../../../../../../../../../../../philosophy-services-section/services/buddhist-services-section/content/text/documents/articles/notes/buddhist-logic.md))
is the same four-point space. Priest ("The Logic of the Catuṣkoṭi",
*Comparative Philosophy* 1(2), 2010) reads it as First Degree Entailment,
the Belnap–Dunn logic whose algebra is FOUR.

**Where the tradition stays.** The library carries *principles and
mathematics*, never a tradition's substance. The Lakota section's rule
([README](../../../../../../../../../../../../../philosophy-services-section/services/lakota-services-section/README.md))
states it: the substantive tradition is held by its knowledge holders in
living tradition, and the formal apparatus is a tool, never the tradition.
The [Book of Changes](../../../../../../../../../../../../../philosophy-services-section/services/dao-services-section/content/text/documents/articles/books/2026-book-of-changes.md)
states the same stance for the Yijing: "offered to the tradition and not
in its place".

**Cultural formalizations are not library modules.** This covers Lakota
governance, the Yijing and beadwork. They stay out of the public library,
as the section README already requires for applications. They follow the
protocols the
[ethnomathematics survey](../../06/26/2026-06-26-survey-of-ethnomathematics.md)
sets out:

- consent and community review;
- CARE and Local Contexts labelling;
- respect for refusal.

The survey's warning applies with full force to a formal library: formal
correctness does not prevent extraction, and publishing a pattern archive
as data can repeat colonial collection under a technical name.

### Artefacts and channels

**Repository.** Split `lib/obsmetrologia` with its history (`git subtree
split`) into a public GitHub repository whose root is the Lake package.
Lean Reservoir indexes public GitHub repositories that have a root Lake
package and an OSI license; `homepage` in `lakefile.toml` is set once the
repository exists.

**Packages.** The core `Obsmetrologia` is one package. The domain books
that ordered-work step C moves out become sibling packages that require
it.

**The book.** Publish the Verso manual as the primary reading surface and
the blueprint's dependency graph beside it. Add a `CITATION.cff`.

**Papers**, in order of readiness:

1. The orbital theorem with its three-entity counterexample.
2. The axiom discipline as foundations: `propext` as antisymmetry of
   `Prop`, one-quotient foundations, and identification sites as a
   per-theorem measure.
3. FOUR as the 1+1 light cone.
4. Colour as a finite observable of aperiodic order, from the existing
   [paper seed](../../06/26/2026-06-26-public-paper-seed-color-as-finite-observable-of-aperiodic-order.md).

The venues are arXiv (math.LO / cs.LO) and the Lean community's Zulip.

**When to go public.** A research preview can open once ordered-work step A
lands and the README prints generated status. The preview shows the
axiom-law ratchet falling in public, which is itself the most persuasive
evidence the project has. 1.0 is the release criteria above.
