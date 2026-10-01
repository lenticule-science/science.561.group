---
title: "Language as Witnessed Field: Working Theory Note"
description: "A standalone working statement of the Witnessed Field theory of language founded in the 2026-08-20 design dialogue: axioms, the meme quantum with bilattice charge, community cohomology, gauge, causal cones, settlement — with every claim anchored to the house's formal assets and graded by the house evidence discipline."
date-created: 2026-08-20
type: notes
name: 2026-08-20-language-as-witnessed-field-working-theory
keywords:
  - linguistics
  - theory
  - witnessed-field
  - obsmetrologia
  - curry-howard-lambek
  - formal-concept-analysis
  - semiotics
tags:
  - draft
status: draft
authors:
  - Claude Opus
---


This note states the theory in full working form. It is science-side because
it is theory about language as such, not about any learner. The dialogue
notes (see provenance) record how it was reached; this note records what it
claims, what in this tree already formalizes each part, and what would
falsify it.

## 0. The instrument thesis

Sciences leap when instruments arrive. Linguistics has description,
statistics, and formalism, but has never had metrology: measurement with
provenance, fusion laws, consistency conditions, and error budgets.
Obsmetrologia (Lean 4 foundations; pymetrologic executable shadows) is such
an instrument, and its primitives — marks, articulations, utterances, memes,
charges — are already semiotic. The theory below is what language looks like
when the instrument is taken as ontologically serious: the theory of the
measurable, not of the idealized.

## 1. Axioms

**A1 — Primitive: the witnessed utterance-event.** An event comprises
participants (each with kin/social position), place-time, medium, a form
trace, uptake, and consent status. There are no unobserved linguistic facts;
there are only witnessed observations, fused with provenance. Consent is
axiomatic: regions of the field may be legitimately kin-gated or
season-gated, and the theory represents gating natively rather than treating
all data as extractable. (No predecessor theory carries consent in its
foundations.)

**A2 — Quantum: the meme.** The house definition, verbatim
(articulation-services-section, lib/articulating/predicating/positing/fiber.mts):
"the minimal transmissible unit of meaning-with-evidence: a predication cell
bound to a bilattice charge," where the charge carries [truth, falsity] side
coordinates and witness Marks per side. Sub-quantum substrate — marks,
tokens, articulations, utterances — carries no charge alone. Syntax is the
binding algebra composing substrate into charge-carrying bound states; the
algebra is Lambek's non-commutative residuated calculus
(Obsmetrologia/Calculus/Logic/LambekCalculus.lean), non-commutative because
binding is ordered. Semantics is charge dynamics; pragmatics is charge
exchange; semiotics is the field theory entire.

**A3 — Yoneda: an item is its arrow-bundle.** A linguistic item is the
totality of its witnessed morphisms (uses, uptakes, repairs, substitutions,
translations, refusals) and is fully recovered from them
(Obsmetrologia/Language/Predicating/YonedaArrowsFirst.lean:
object_is_its_morphisms; executable shadow pymetrologic/yoneda.py). Meaning
is the presheaf of witnessed use. Corollary (the projection lemma, informal):
a distributional embedding is the provenance-forgetting projection of this
presheaf — which is why LLMs exhibit meaning-shaped behavior while lacking
accountable authority.

**A4 — Community: a language is a gluing that generically fails.** Speakers
and speech-situations hold local sections of the field; a language is a
maximal glued object over the community site. Empirical founding claim: for
a living language, H¹ ≠ 0 — irreducible obstructions to gluing exist, and
they are not noise. Obstruction classes are where change nucleates and where
identity lives. Standardization is the forced projection H¹ → 0; it deletes
the cohomology that carries identity, which is why it is experienced as
erasure. Vitality has a cohomological signature. (Machinery: pymetrologic
sheaf parity, filtration, and integral cohomology extension; local mechanism
via A2's paraconsistent charges — a form witnessed pro by one section and
con by another is a meme stably charged on both sides, and irreconcilable
charge assignments across sections realize obstruction classes.)

**A5 — Gauge: a grammar is a chart.** Grammars, dictionaries, and
orthographies are coordinate choices on the field — gauge fixings that
enable local computation and carry no ontological priority. Rival
orthographies are charts on one manifold; their transition maps are
linguistics; mistaking a chart for the territory is the colonial error,
diagnosed as gauge confusion. Competence/performance dissolves: competence
is gauge-fixed compression of the witnessed field.

**A6 — Dynamics: causal cones with curvature.** Utterance-events are
causally ordered; the field is a causal set carrying light cones.
Acquisition, meaning change, and comparative reconstruction are
cone-propagation at three scales; the synchrony/diachrony cut dissolves into
cones at different scales. The reverse-lightcone emergence function 𝓡
(math-services-section glossary) reconstructs constraint-valid pasts:
applied to a learner it computes generative envelopes for desired targets;
applied to a language it is reconstruction with error budgets; applied
forward it grades a proposed coinage by whether it lies within the
language's own generative cone (the neologism conformance readout).
Curvature enters through Lambek bi-residuation
(ObsmetrologiaPhysicalScience/CausalSets/Curvature/Lambek.lean:
residuals_coincide_iff_commutative): where composition is most
non-commutative the field curves, and curvature concentrates at typological
obstructions. Typology is field geometry; L2 difficulty is transport cost
between curvature regions.

**A7 — Normativity: kin-weighted settlement; understanding: normalization.**
Correctness is fused uptake under the community's authority weights —
a measurable, provenance-carrying field quantity, neither rulebook nor
anything-goes. Settlement is a fixed point of the community closure
operator, and FCA closure equals settling closure
(Obsmetrologia/Calculus/Logic/FCALambekCircle.lean, with executable shadow
fca-lambek-circle.mts inside the articulating library). A successful
exchange is a proof that normalizes; Church-Rosser confluence
(Obsmetrologia/Language/Predicating/CurryHowardLambek.lean: church_rosser,
chl_quartet_is_nuclear) is why communication survives ambiguity — distinct
orders of interpretive moves converge. Classical truth-conditional semantics
is the special case where the closure operator is classical logic's.

**A8 — The cone of a language.** A language is the apex of a cone over its
column-leg diagram (SPOTCOMP CHL Language Cone profile, 2026-05; PPA
Language Cone, 2026-07): type-theoretic, proof-theoretic, categorical,
domain-theoretic, path-theoretic, and transfer legs — with the classical
Curry-Howard-Lambek three-column pattern as a specialization. The
coincidence theorem (all legs commute; PPA-FR-040) is an open obligation at
language scale; at speaker scale, per-item leg-commutation (production
agrees with comprehension agrees with audition) is the definition of
mastery. Fluency is the coincidence theorem, item by item.

## 2. The extraction theorem

The house's critical linguistics ("Marked Speech, Borrowed Grammar"; the
glossary's meme-grammar, dead-english, linguistic-extraction entries)
formalizes inside the theory rather than sitting beside it. Extraction is
the functor that transports charge while forgetting its witness Marks;
charge without witnesses is bottom in the information order. Platform meme
grammar (affect simulated over empty witness sets), dead English (charge
collapse), distributional embeddings (A3's projection lemma), and colonial
standardization (A4's forced H¹ → 0) are one witness-forgetting operation at
different scales. A kin-witnessed corpus-and-learning system is the
constructive negation: machinery that only moves charges with their
witnesses.

## 3. Predecessor embeddings

Chomsky's C_HL / Minimalism: the H⁰ gauge-fixed compression of the field —
recovered as the binding algebra's idealized core, real but not fundamental.
Montague semantics: classical-closure special case of settlement (A7).
Distributionalism and LLMs: provenance-forgetting quotient (A3). Labovian
variationism: section statistics without gluing laws (A4 supplies the laws).
Construction grammar and usage-based theories: the arrow-bundle intuition
(A3) without the mathematics. Documentary linguistics: field observation
without fusion or cohomology. Peirce: the mark/articulation/meme
stratification is a formal home for sign-vehicle/interpretant talk, with
uptake as interpretant made measurable. Related formal precedents to engage
honestly: Goguen's institutions; Abramsky-Brandenburger sheaf-theoretic
contextuality; Belnap/Ginsberg/Fitting bilattices; Lawvere hyperdoctrines
(already cited by the house's CHL module).

## 4. Obligations (what would falsify this)

Per house discipline, the theory self-grades Research-grade until these run:

1. Measured H¹ over a healthy speech community is nonzero and shrinks under
   documented standardization pressure (first apparatus: the Lakota living
   corpus and dialect continuum).
2. Cone-edge input outperforms off-cone input in acquisition, measured in
   practice records (first apparatus: the Mandarin learning stack).
3. Curvature-derived difficulty predicts observed L2 error distributions.
4. Confluence failures co-locate with actual misunderstandings in recorded
   discourse (instrument: the engine's discourse-cohomology receipts).
5. The neologism conformance readout agrees with fluent-speaker judgment
   above chance, with the community as referee.

Each Lean citation above proves facts about formal objects, not about human
acquisition or communities; the bridge claims are empirical hypotheses and
are the monograph's burden.

## 5. Two sciences, one loop

The theory supports two research programs sharing one measurement loop: the
kinematics of the learner (martial space of composable moves; mastery as
commuting cones; progress as growth in the information order of held
charges) and the physics of the language (computed dialects, persistence
over filtrations, grammaticality as fused belief, reconstruction and
conformance by cones, curvature typology). Learner practice generates the
witnessed observations that feed the language science; the language science
sharpens the instrument that measures the learner. Every learner is a field
researcher of a living language.
