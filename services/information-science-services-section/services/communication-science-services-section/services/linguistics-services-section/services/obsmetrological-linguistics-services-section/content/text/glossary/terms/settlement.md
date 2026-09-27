---
name: "Settlement"
date-created: 2026-08-21
date-modified: 2026-09-27
aliases:
  - "settlement"
keywords:
  - obsmetrological-linguistics
  - witnessed-field
  - axiom
  - formal-concept-analysis
status: research-grade
description: "Axiom A7: correctness is a fixed point of the community's closure operator under kin-weighted authority, not a rulebook and not anything-goes; a successful exchange is a Church-Rosser-confluent proof that normalizes."
authors:
  - Claude Opus
---

Settlement is Axiom A7's account of linguistic correctness: not a rulebook
(a fixed grammar that legislates what is right) and not anything-goes (mere
statistical frequency), but a fixed point of the speech community's closure
operator under kin-weighted authority. Correctness is fused uptake — a
measurable, provenance-carrying field quantity that depends on who witnessed
a form as acceptable and with what standing, not a static property a
sentence either has or lacks.

A settlement here is the general [settlement](../../../../../../../../../math-services-section/content/text/glossary/terms/settlement.md)
of a closure, with the community's closure in place of the modal closure.

The theory ties this to two of the estate's existing formal results. First,
it reads Formal Concept Analysis closure as settling closure, so that the
closure operator that computes a concept lattice from an incidence of
objects and attributes is the operator by which a community settles on what
a form means. Obsmetrologia proves only that the two have the same shape:
the FCA derivation closure is extensive, monotone and idempotent, the three
laws of the settling closure (`fca_closure_laws`,
`Obsmetrologia/Calculus/Logic/FCALambekCircle.lean`). That they are the same
operator on a shared carrier is an open node of the blueprint
(`thm:fca-closure-eq-settling`), so this reading rests on a shape match. Second, a successful communicative
exchange is described as a proof that normalizes: Church-Rosser confluence
(`Obsmetrologia/Language/Predicating/CurryHowardLambek.lean`, theorems
`church_rosser` and `chl_quartet_is_nuclear`) is offered as the reason
communication survives ambiguity at all — distinct orders of interpretive
moves converge on the same settled meaning rather than diverging. Classical
truth-conditional semantics is presented as the special case of settlement
where the community's closure operator happens to be classical logic's.

## Status

The two Lean citations prove facts about formal objects (that FCA closure
has the settling closure's laws; that a particular reduction system is
confluent) — they do not by themselves establish that real
communicative exchanges behave as Church-Rosser-confluent proofs, which the
source note treats as an empirical bridge claim under the theory's general
Research-grade status. Obligation #4 in the theory's falsification program —
that confluence failures should co-locate with actual misunderstandings in
recorded discourse — is the stated test.

## Related terms

- [Grammar as gauge](./grammar-as-gauge.md) — what settlement replaces: no
  single chart is privileged as the rulebook
- [Witnessed utterance-event](./witnessed-utterance-event.md) — the events
  whose uptake is fused into a settlement
- [Fused grammaticality](./fused-grammaticality.md) — the instrument that
  computes a settled grammaticality judgment from witnessed data

**Source:** Axiom A7, [Language as Witnessed Field: Working Theory
Note](../../../../../../content/text/documents/articles/notes/2026-08-20-language-as-witnessed-field-working-theory.md).
