---
title: "Chapter 4 — The Meme: A Quantum of Meaning-with-Evidence"
description: "Outline-with-key-passages for the monograph's second foundations chapter: Axiom A2, the mark-to-token-to-articulation-to-utterance substrate stratification, syntax as ordered binding under the Lambek calculus, and a generous engagement with Peirce, Saussure, and Jakobson. Not a full draft — structure and load-bearing passages only, written so a future session can draft from it without re-deriving the shape."
date-created: 2026-08-21
type: article
name: chapter-04-the-meme
monograph: "Language as Witnessed Field"
part: "II — Foundations"
chapter: 4
keywords:
  - linguistics
  - theory
  - witnessed-field
  - monograph
  - obsmetrologia
  - axiom
  - outline
tags:
  - draft
status: draft-for-review
authors:
  - Claude Opus
---

# Chapter 4 (outline) — The Meme: A Quantum of Meaning-with-Evidence

## Status of this document

This is an outline with key passages, not a finished chapter. Section
headers below carry a thesis statement and a note on what evidence grounds
it; some sections additionally carry a drafted passage — full monograph
prose, ready to be lifted into the eventual draft largely as-is — where the
argument was clear enough in this sitting to write it properly rather than
merely gesture at it. Sections without a drafted passage are left as
structure only, deliberately, rather than filled with weaker prose written
under time pressure. A future session drafting this chapter in full should
treat the drafted passages as load-bearing and the bare structure as a map,
not a draft to smooth over.

Two source facts, checked directly rather than taken on the working theory
note's word, will matter throughout and are recorded here so the eventual
draft does not have to re-derive them:

- The **Meme** is defined in the estate's current (non-legacy) TypeScript
  source at
  `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/semiotics-science-services-section/services/articulation-services-section/lib/articulating/predicating/positing/fiber.mts`,
  whose module comment states: "A `Meme` binds one cell to a charge; a
  `FiberAlgebra` collects the charged cells over one predicate; a
  `Valuation` is one fiber per predicate over a base." The module documents
  itself as "the executable Node carrier surface for finite predicate
  fibers," explicit that "Lean owns the larger Chu-space and proof
  obligations" — meaning the meme's *executable* definition lives here, and
  its *proof-theoretic* grounding is elsewhere and should be cited
  separately, not conflated.
- **Lambek's calculus** is formalized at
  `.../obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Calculus/Logic/LambekCalculus.lean`,
  whose header is unusually rich in exactly the citations this chapter's
  engagement section needs: Lambek (1958) for the syntactic calculus
  itself; Galatos, Jipsen, Kowalski, and Ono (2007) for the proof that the
  calculus is exactly the logic of residuated lattices; Lawvere (1969) for
  the categorical-logic reading of the same bi-residuation as
  ∃ ⊣ ∀; Wurm (2012) for completeness of the full non-commutative
  calculus via syntactic concept lattices; and Pentus (1993) for the result
  that Lambek grammars generate exactly the context-free languages. This
  last citation is worth flagging early: it is a genuine, precise
  connection between the algebra this chapter adopts as its binding
  operation and a classical formal-language-theoretic result, and the
  chapter should use it rather than let it sit uncited.

## 4.1 Where this chapter sits

**Thesis.** Chapter 3 established the witnessed utterance-event as
primitive and named its six fields, but left one of those fields —
form-trace — deliberately unanalyzed, promising that its internal
composition was this chapter's job. Chapter 4 delivers on that promise: it
gives the field's quantum (Axiom A2), the layered substrate a form-trace is
built from, and the algebra by which substrate composes into
charge-carrying bound states.

**Grounding.** Axiom A2 in full, from the working theory note: "the minimal
transmissible unit of meaning-with-evidence: a predication cell bound to a
bilattice charge," where the charge carries [truth, falsity] side
coordinates and witness Marks per side. Sub-quantum substrate — marks,
tokens, articulations, utterances — carries no charge alone. Syntax is the
binding algebra composing substrate into charge-carrying bound states; the
algebra is Lambek's non-commutative residuated calculus, non-commutative
because binding is ordered.

**Key passage (drafted).**

> If Chapter 3 asked what kind of thing a witnessed utterance-event is, this
> chapter asks a narrower and, in a precise sense, more physical question:
> what is the smallest piece of one that still carries meaning at all? The
> answer this book gives is not the word, the morpheme, or the phoneme —
> each of those is a piece of the *substrate*, necessary but, on its own,
> inert — but the meme: one predication cell bound to a bilattice charge. A
> bare mark, a token pairing a mark with its position, an articulation
> composing tokens into a predicate application — none of these carries
> evidence on its own, in the theory's technical sense of *carries*. Charge
> enters only when a cell is bound to it, and a meme just is that binding,
> named as the field's quantum because nothing smaller than it is a unit
> the theory's semantics, in Chapter 6, will find anything to fuse.

## 4.2 The substrate stratification: mark, token, articulation, utterance

**Thesis.** Below the meme sits a four-layer substrate, each layer strictly
thinner than the one above it, culminating in the same `Utterance` object
Chapter 3, Section 3.9 flagged as a different, lower-level construction
than the witnessed utterance-event. This section is where that flag gets
cashed: the substrate stratification *is* the layer Chapter 3 promised, and
the chapter should open by reminding the reader of exactly that promise
before delivering it.

**Grounding, checked directly against source rather than paraphrased.**
`Obsmetrologia/Primitive/Mark.lean` defines a `Mark` as an atomic primitive
carrying only a finite surface string, explicitly "built from nothing," and
a `Kind` — `token` or `claim` — naming which of the two positions a mark
occupies, with two small proven lemmas (`two_kinds`, the exhaustiveness of
the two-way split; `token_ne_claim`, their distinctness).
`Obsmetrologia/Articulation/Articulating/Utterance.lean` defines an
`Utterance` as the ordered pair of a token-side and a claim-side `Mark`,
with the module comment stressing that the ordering is load-bearing and
that an utterance "is *not* an act — it articulates nothing," it is only
the carrier that the articulating act (a further layer this outline has
not yet traced into its own Lean module and should before drafting)
operates on. The fiber.mts module's schema layer — `MarkSchema`,
`TokenSchema`, `ClaimSchema`, `PredicateSchema`, `CellSchema` — gives the
executable, runtime-checked shape of the same stratification one layer
further up, terminating in the `Cell` (subject/predicate/object) that a
`Meme` binds a charge to.

**Open item for the drafting session.** This outline has not yet located
and read the `Articulating` operation itself (the act that takes an
`Utterance` as domain and produces the four-cell-partitioned codomain the
Utterance.lean header alludes to) nor the `PredicateFiber`/`posit`
machinery fiber.mts imports. Before this section is drafted in full, that
reading should happen — citing the stratification's top two layers without
having read the module that connects them to the bottom two would repeat,
in a smaller way, exactly the honesty gap Chapter 3 Section 3.9 was written
to close rather than reopen.

## 4.3 The bilattice charge

**Thesis.** A charge is not a truth value; it is a point in a bilattice
with independent [truth, falsity] side-coordinates, each carrying its own
witness Marks — which is what makes it possible for a form to be evidenced
pro by one section of a speech community and con by another *without*
either side being simply wrong, a structural possibility classical
two-valued semantics cannot represent and that Chapter 7's account of
irreducible obstruction (Axiom A4, H¹ ≠ 0) depends on being available
already at the quantum level.

**Grounding.** `bilattice-charge.mjs` (imported by fiber.mts) supplies
`ChargeCarrier`, `ChargeValue`, and the join/meet operations over both the
knowledge order and the truth order named in the working theory note; the
Lean side's `Cohomology/PairwiseStoneClopen.lean`, read in passing while
gathering source for this outline, independently confirms the same
architecture from the topological side — "the four clopen up-sets of the
two-point dual {+,−} ARE the four bilattice charges" — which is worth
citing as convergent formal evidence for the same structure from two
different developments, a stronger citation than either alone. This
convergence deserves its own short paragraph in the drafted chapter; it was
not something the working theory note itself pointed out explicitly, and
finding it independently while preparing this outline is exactly the kind
of thing the drafting session should not let go unremarked.

## 4.4 Syntax as ordered binding: the Lambek calculus

**Thesis.** Binding substrate into a charge-carrying meme is not free
composition; it is governed by a non-commutative residuated calculus,
non-commutative precisely because word order (and more generally,
binding order) is meaningful — "the dog bit the man" and "the man bit the
dog" bind the same substrate in different orders into different memes, and
a commutative binding algebra could not distinguish them. This section is
the chapter's mathematical core and should be given the most space of any
section in the eventual draft.

**Key passage (drafted).**

> Lambek's insight, stated in 1958 and given its modern algebraic home by
> Galatos, Jipsen, Kowalski, and Ono's proof that the calculus is exactly
> the logic of residuated lattices, is that a predicate combining with its
> arguments is a product with *two* argument slots, one on each side, and
> that a product with two slots has two residuals rather than one. The
> ordinary, commutative case — familiar from classical and intuitionistic
> logic alike — collapses the two into a single implication, because when
> `a · b = b · a` it no longer matters which side of the product you are
> asking to residuate. Natural-language binding does not have this luxury.
> What must combine with a transitive verb *on the right* to yield a
> complete verb phrase is a different question, with a different answer,
> from what must combine with it *on the left* to yield a complete
> sentence, and the calculus keeps the two residuals — the left residual
> `\` and the right residual `/` — exactly because the theory needs to ask
> both questions and expects two different answers. This is not a technical
> convenience borrowed from categorial grammar to make the syntax chapter
> feel rigorous; it is the same substructural discipline — no contraction,
> no weakening, no exchange — that the theory's own bilattice charges
> already require, since a meme's evidence for its truth side and its
> evidence for its falsity side are tracked separately and are not
> permitted to silently exchange places. Binding order is meaningful in
> exactly the sense, and for exactly the structural reason, that charge
> polarity is meaningful.

**A citation to use, not merely to list.** Pentus (1993): Lambek grammars
generate exactly the context-free languages. This gives the chapter a
genuine hostage to fortune worth naming directly — if the binding algebra
this theory adopts is (at least in its unenriched form) no more expressive
than context-free grammar, the chapter owes the reader an account of
whether natural-language phenomena standardly cited as requiring
mildly-context-sensitive power (Swiss German cross-serial dependencies,
Dutch verb clustering — the classical arguments of Shieber 1985 and Huybregts
1984) are handled by some enrichment of the calculus the estate has not yet
formalized, or whether the theory's answer to those phenomena lies
elsewhere (for instance, in the causal-cone and gauge machinery of Part
III rather than in the binding algebra itself). This is a real gap the
outline is flagging rather than papering over: it was not resolved in this
sitting and should not be silently absent from the eventual draft's
research-obligations block either.

## 4.5 Semantics as charge dynamics; pragmatics as charge exchange

**Thesis.** Once binding produces a charge-carrying meme, the working
theory note's compressed formula — "semantics is charge dynamics;
pragmatics is charge exchange; semiotics is the field theory entire" —
needs to be unpacked rather than merely quoted. A plausible reading, to be
tested against the fiber.mts join/meet operations before drafting: semantics
is the statics of a single meme's charge (what evidence it currently
carries, on which side); pragmatics is what happens to charge across an
exchange between participants (how one participant's assertion changes the
charge another participant is willing to assign the same or a related
meme); semiotics, at the widest scale, is the theory of the whole field
these dynamics play out on — which is to say, the theory this entire
monograph is building. This section's job is to make that three-way split
precise enough to be useful, not to restate the slogan.

## 4.6 Engagement: Peirce

**Thesis, given generously.** Peirce's sign-object-interpretant triad
(*Collected Papers*, esp. 2.228 and surrounding) is not an antecedent this
theory merely resembles; it is arguably the closest existing philosophical
home for the mark/articulation/meme stratification, and the chapter should
say so plainly rather than treat Peirce as a distant precursor. A sign
(roughly, the estate's mark or token) stands for an object to an
interpretant — and Peirce's insistence that the interpretant is itself a
further sign, generating potentially unbounded chains of interpretation
(unlimited semiosis), anticipates this theory's refusal to let meaning
terminate in a static dictionary entry rather than in ongoing witnessed use.
The genuine credit to extend: Peirce's icon/index/symbol trichotomy already
distinguishes signs by the *kind* of relation they bear to their object
(resemblance, causal/existential connection, and conventional rule
respectively) in a way this theory's medium and form-trace fields, taken
together, could be read as a formal re-statement of — a spoken form-trace's
indexical connection to its place-time of utterance is not the same kind
of relation a written form-trace bears to what it denotes, and Peirce
named that difference over a century before this book's medium field tried
to make it measurable.

**What the theory adds, stated fairly rather than as a claim of
superiority.** Peirce's interpretant is a further sign, not a further
*witnessed event* — his semiotics has no native place for consent, kin
authority, or the difference between a sign interpreted by someone with
standing to interpret it and the same sign interpreted by an outsider.
This is the same diagnostic move Chapter 3 made against the sentence, the
proposition, and the token, applied here with the same discipline: Peirce's
triad is not wrong, and this theory is substantially built on its shape;
it is a primitive defined at a level of generality (any sign, in any
system of signs whatever, human or otherwise) that trades away exactly the
witnessed, consent-bearing specificity this book's theory of *language*,
rather than of signs in general, needs.

## 4.7 Engagement: Saussure

**Thesis, given generously.** Saussure's *Cours de linguistique générale*
(1916) gives two ideas this chapter must credit precisely rather than in
passing. First, the arbitrariness of the sign — the bond between signifier
and signified is unmotivated by nature, fixed only by convention — is not
a claim this theory disputes; the mark's definition as "the arbitrary
atomic primitive... built from nothing," read directly from
`Mark.lean`'s own doc comment, is close enough to Saussurean arbitrariness
that the chapter should note the terminological echo may not be
coincidental and, if it is coincidental, is worth remarking on as
convergent design anyway. Second, and more consequential for this
theory's structure: Saussure's account of *value* (*valeur*) — a sign's
meaning is not intrinsic to it but is determined by its position within
the whole system of differences from other signs — is arguably the
nearest historical antecedent to Chapter 5's Yoneda argument (an item is
its bundle of witnessed morphisms, not a form with an attached, freestanding
meaning), and the engagement section for Chapter 5 should be written aware
that this chapter has already flagged Saussure's value as the
structuralist ancestor of arrows-first meaning, so the two chapters credit
him once, correctly, rather than twice, redundantly.

**What the theory adds.** Saussurean value is synchronic and
system-internal — it says a sign's meaning depends on its differential
position within *langue* at a given moment, but langue itself, on
Saussure's own famous methodological ruling, is a social fact abstracted
away from any particular speaker's *parole*, which is a second and
distinct instance of exactly the idealizing move Chapter 3 diagnosed in
Chomsky's competence/performance split — not a coincidence, since Chomsky's
own distinction is usually read as a direct descendant of Saussure's. The
theory's answer is the same one already given: value understood as a
witnessed field's arrow-bundle, rather than langue's abstracted system, is
value with its witnesses still attached.

## 4.8 Engagement: Jakobson

**Thesis, given generously.** Two Jakobson contributions earn separate
treatment rather than a single combined paragraph. First, the six
functions of language ("Linguistics and Poetics," 1960) — referential,
emotive, conative, phatic, metalingual, poetic — each keyed to a different
factor in his speech-event model (addresser, addressee, context, message,
contact, code). This model is worth engaging closely because Jakobson's
speech-event factors are strikingly close in spirit to this theory's own
event fields (addresser/addressee anticipate participants; context
anticipates place-time and medium jointly; contact anticipates something
like this theory's medium and uptake combined) — close enough that the
drafted chapter should build a explicit comparison table, factor by
factor, rather than assert the resemblance in prose alone. Second,
Jakobson and Halle's distinctive-feature theory (*Fundamentals of
Language*, 1956) — phonemes as bundles of binary or multi-valued features
rather than unanalyzable atoms — is a direct historical precedent for
treating even the substrate's lowest layer (the mark) as decomposable
rather than primitive in the philosophical sense, and the chapter should
be honest that `Mark.lean`'s choice to make the mark genuinely atomic
("built from nothing") is, at this specific point, a departure from rather
than an extension of the distinctive-feature tradition, made for the
theory's own structural reasons (the mark needs to be the floor the whole
stratification is built on) rather than because distinctive-feature theory
was found wanting.

**What the theory adds.** Jakobson's speech-event model, like Peirce's
triad and Saussure's langue, has no native consent field and treats the
factors as always co-present in any communicative act rather than as
witnessed, individually gateable data — the same diagnostic a third time,
which by this point in the chapter should be stated once, crisply, as a
pattern the reader has now seen three times rather than argued for a third
time at length.

## 4.9 What Chapter 5 inherits

**Thesis.** This section should be short and exists mainly to hand off
cleanly. The meme, bound by ordered Lambek binding and carrying bilattice
charge, is the object whose *meaning* Chapter 5 goes on to identify with
its bundle of witnessed morphisms. This chapter has not yet said anything
about meaning as such — only about what a meme is and how it is built —
and the drafted chapter should resist the temptation to reach for Chapter
5's Yoneda argument early; the handoff should be a single closing
paragraph, not a preview that does Chapter 5's work for it.

## 4.10 Research obligations (provisional — to be finalized when drafted)

1. The `Articulating` operation and `PredicateFiber`/`posit` machinery
   referenced by fiber.mts have not yet been read for this outline (see
   §4.2's open item); citing the full substrate stratification with
   confidence requires closing that gap first.
2. The Pentus (1993) context-free-generative-capacity result is a real
   hostage to fortune (§4.4) not yet resolved: whether the theory's answer
   to mildly-context-sensitive phenomena lies in an unformalized enrichment
   of the calculus or elsewhere in the theory is currently unknown and
   should not be silently omitted from the drafted chapter.
3. The semantics-as-charge-dynamics / pragmatics-as-charge-exchange split
   proposed in §4.5 is this outline's own interpretive reading of one
   compressed sentence in the working theory note, not yet checked against
   the fiber.mts join/meet operations in enough depth to cite with
   confidence; it should be verified, not merely carried forward, when
   drafted.
4. As with Chapter 3, no corpus yet exists at the granularity this
   chapter's machinery presupposes; every claim about what the algebra
   would let the theory measure is a claim in principle, not yet a
   claim demonstrated against witnessed data.
