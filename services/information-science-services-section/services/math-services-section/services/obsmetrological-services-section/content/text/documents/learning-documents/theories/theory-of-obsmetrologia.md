---
title: "Theory of Obsmetrologia"
date-created: 2026-10-15
description: "Obsmetrologia is the metrology of identification: marks uttered as (token, claim) pairs are articulated, predicated, posited and settled, and every value, order, time and agent the Group reasons about is a measured fixed point of that one descent."
type: theory
name: theory-of-obsmetrologia
reading-order: 1
depends-on: []
used-by: [theory-of-relationality, theory-of-predication-categories, theory-of-locution, theory-of-agency, theory-of-work, theory-of-governing, theory-of-concurrent-game-systems, theory-of-computer-systems, theory-of-market-systems]
keywords: [obsmetrologia, mark, utterance, token, claim, articulating, predicating, positing, settling, charge, four, knowledge-order, closure-ordinal, regime, quot-sound]
provenance:
  authors: [emsenn, claude-opus-5-5]
  derived-from:
    - "OBS/content/text/documents/articles/notes/2026/10/10/2026-10-10-note-on-the-leaders-statements-of-obsmetrologias-foundations.md"
    - "OBS/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md"
    - "OBS/content/text/documents/articles/notes/2026/09/21/2026-09-21-note-on-the-axiom-law-spine-lineage-and-the-light-cone.md"
    - "OBS/lib/obsmetrologia (Lean 4 library; import spine is the derivation order)"
  note: "OBS = this section, obsmetrological-services-section."
---

# Theory of Obsmetrologia

Obsmetrologia is the Group's foundational mathematics. In engineering the Group calls it semiotics, in mathematics Obsmetrologia, and in philosophy relationality (Leader, 2026-09-10). It is one theory in three registers.

Obsmetrologia is a **metrology of identification**. The only primitive data are marks. Marks enter only as utterances, and an utterance is a pair (token, claim). Everything else is derived by four morphisms in a fixed order: articulating, predicating, positing, settling. The library that formalizes it admits exactly one axiom, `Quot.sound`, used once at the root as the identification of marks by their role.

This document states the theory's primitives and laws, and what they force on every system the Group builds. The other nine theories in the reading order are stated in its terms.

## Primitives

1. **Mark.** An atom with no internal structure. Its surface string is presentation, not identity. A mark's identity is its role.
2. **Token and claim.** The two carriers of a mark: a token is a mark carried on the left hand, a claim a mark carried on the right hand. There are exactly two because the pair gives articulating its four-cell partition. One kind would collapse the cells to two; three would give eight, which nothing derives.
3. **Utterance.** The ordered pair (token, claim). It is the sole admission boundary. Nothing enters the theory except by articulating utterances.
4. **Articulating.** The morphism applied to an utterance. It opens a cell with two witness slots. Its four phases (neither slot filled, token only, claim only, both) are the value object one level down.
5. **Predicating.** The morphism out of the potential articulation cell. It produces the predication cell (subject, predicate, object), an oriented position that carries no value. Predicates compose, so predicating generates a category. See [theory of predication categories](../../../../../../../content/text/documents/learning-documents/theories/theory-of-predication-categories.md).
6. **Positing.** The morphism that measures a value into a cell. Value enters here and nowhere earlier.
7. **Settling.** The morphism that iterates closure to its least fixed point.

## The value: charge and FOUR

A **charge** is a pair ⟨α, β⟩ of evidence strengths: α for a relation, β against it, recorded separately. Over the two-element lattice there are four charges, the bilattice FOUR:

| charge | pair | reading | name |
|---|---|---|---|
| ⊥ | ⟨0,0⟩ | told nothing | absurd |
| t | ⟨1,0⟩ | told true only | potential |
| f | ⟨0,1⟩ | told false only | active |
| ⊤ | ⟨1,1⟩ | told both | stable |

FOUR carries two orders. The **knowledge order** ≤k raises both components; it measures how much is recorded. The **truth order** ≤t raises the first and lowers the second; it measures how true. The orders are independent: one diamond turned a quarter turn. FOUR ≅ Chu(2, 0), the star-autonomous object that carries linear logic's tensor and residual and its dualizing involution at once.

**Negation** swaps the components. Its fixed points are {⊥, ⊤}. Boolean negation has no fixed point, which is why a self-referential sentence explodes in classical logic. In FOUR it settles to told-nothing or told-both and the system continues.

## Laws

These are laws of the theory. Each is a theorem or a ruled commitment of the Leader; none is a convention.

- **L1. Axiom law.** The library admits no axiom except `Quot.sound`. `propext` and `Classical.choice` are excluded: `propext` is exactly antisymmetry of entailment, so admitting it would assume at the base the poset structure the theory refuses. A `sorry` marks a frontier theorem. It is counted and reported, and it is not a violation (Leader, 2026-09-21 and 2026-09-27).
- **L2. Lineage law.** Every theorem derives from articulating: a spine constant (Mark, Utterance, Articulating, the cells, PredicationCell, Charge, Valuation, the settling closure) occurs in its dependency closure.
- **L3. Admission law.** Evidence enters only by articulating utterances. No operation asserts a charge directly.
- **L4. No denial.** A contrary fact is the articulation of a contrary predicate, never the negation of a prior claim. Negative evidence exists only where the codec's contrary predicate was articulated (`no_denial`).
- **L5. Measurement, not seeding.** Charges are measured from accumulated utterances, never seeded. A mark carries no charge, because a charge is relational data and a mark is nullary.
- **L6. No deletion.** The knowledge order is the dynamical axis. Merging two charges is the knowledge join ∨k, and no operation lowers a charge in ≤k. The substrate only accumulates.
- **L7. Settledness is a property.** Closure is the monad of an adjunction and is lax-idempotent (Kock–Zöberlein), so a closure-algebra structure is unique where it exists. Whether a relation is settled is a fact about it, not data chosen for it.
- **L8. Four regimes.** Every settling falls in exactly one regime by its closure ordinal κ: finite (κ < ω), Scott-continuous (κ = ω), transfinite-bounded (ω < κ < ω₁), aperiodic (κ ≥ ω₁). The bands partition the ordinals.
- **L9. Predication forces FOUR.** From four entities on, every natural reindexing of an oriented pair is one of four maps: identity, converse, subject-projection, object-projection (`orbital_exhaustive`). With three entities a fifth map exists; the bound is four.
- **L10. Pure mathematics only.** The library holds only pure mathematics. Applications live in packages that import it. Mathematics never bends to technology; technology adapts to the mathematics (Leader, 2026-10-01 and 2026-10-02).

## What the descent generates

The four morphisms line up with the four regimes, and the same four-fold appears in every domain the engine is run on:

| register | aperiodic | transfinite | Scott | finite |
|---|---|---|---|---|
| morphism | articulating | predicating | positing | settling |
| value | value-free | value-free | charge enters | settled |
| obstruction | H¹ ≠ 0 | H¹ ≠ 0 | H¹ = 0 | H¹ = 0 |
| moment of existence | becoming | doing | working | governing |
| face of agency | animism | agential | agentic | individual |
| face of inquiry | question | judgement | belief | knowledge |

**Cohomology.** A settling is a cellular sheaf. Its H⁰ is consensus. Its H¹ is irreducible disagreement: "the obstruction one measures rather than argues". H¹ is nonzero in the transfinite and aperiodic regimes and drains to zero at the Scott and finite floors.

**Spacetime.** A charged settling read flat is a Chu space: points are cells, states are valuations, entries are charges. Settled cells (the apex) are time's order; cells still at ⊥ (the void) are space's extent. Time's arrow is the monotonicity of settling: the past is fixed and the future open because knowledge accumulates and never retracts. Read the two evidence bits as null coordinates and ≤k is the causal order of 1+1 Minkowski space (`kle_iff_lightcone`, proved without axioms).

**Re-entry.** A settled fixed point is itself a relation, so the engine runs on it again one scale up. A settled self seeds a society; a settled relation seeds a world. A concept's address is its derivation.

**Two-face typing.** Transverse to the regimes, every unit the corpus holds is exactly one of Object, Quality, Relation or Act: the type, proposition, category and computation faces of one content (Curry–Howard–Lambek, extended by Scott).

## The method: running the engine on a domain

To apply the theory to any field, perform five moves. Only the second is domain-specific.

1. **Name the relation** and its lattice of evidence strengths.
2. **Write the codec to the boundary**: turn the domain's configurations into utterances. "Get the codec right and the rest is mechanical; get it wrong and no later step recovers."
3. **Descend**: articulate, predicate, posit, settle.
4. **Read the invariants**: κ names the regime, H⁰ is consensus, H¹ is disagreement.
5. **Re-enter** at the next scale.

## Consequences for the Group's systems

Required: every system the Group builds conforms to these, because the theory is the reason the system exists.

1. **One admission boundary.** A system admits facts only as utterances (token, claim) addressed to cells. A field set directly (`status: done`) is an assertion of a charge without an utterance, which L3 forbids.
2. **No overwrite.** A record only grows. Retraction is an added utterance of a contrary predicate (L4, L6). A state that changes is a reading over a growing record, not a mutated field.
3. **Contradiction is a value.** When two parties disagree about one cell, the cell settles to ⊤. It is held and shown. It does not crash a process and is not resolved by arrival order.
4. **Status is computed.** "Done", "accepted" and "in force" are settled readings: the fixed point of the owning section's closure over the record (L7). Nobody writes them.
5. **Disagreement is where attention goes.** H¹ is measurable. A system that computes it knows where work is needed without being told.
6. **Losing the record breaks the theory.** Deleting legacy material, archiving a repository without carrying its content into its living section, or rewriting history in place violates L6. The Group's lost theory is a breach of its own foundational law, not only an inconvenience.

## Open

- Open: whether 3+1 dimensions can be proved from the Chu space, not only estimated (`thm:void-dimension`). The Leader holds the 3+1 reading as theory (2026-09-21).
- Open: which setoid constructions in the current Lean are drift to remove, and which the root identification already discharges.
- Open: which modules under `Obsmetrologia/Computing/` are pure mathematics and which belong in importing packages.

## Sources

- The Leader's statements, held as theory: `OBS/content/text/documents/articles/notes/2026/10/10/2026-10-10-note-on-the-leaders-statements-of-obsmetrologias-foundations.md`. Where a house note disagrees with this note, this note governs.
- The monograph, the most complete prose statement: `OBS/content/text/documents/articles/notes/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`.
- The axiom law, admission boundary and orbital theorem: `OBS/content/text/documents/articles/notes/2026/09/21/2026-09-21-note-on-the-axiom-law-spine-lineage-and-the-light-cone.md`.
- The release plan: `OBS/content/text/documents/articles/notes/2026/09/27/2026-09-27-note-on-preparing-obsmetrologia-for-public-release.md`.
- The Lean library and Blueprint: `OBS/lib/obsmetrologia/` (canonical carrier `lenticule-science/obsmetrologia`).
- The pre-Lean formal library (175 theorems, deleted from the corpus): `git show 9be46127758:lib/emsenn/services/561-group/lib/legacy/2026-03-30-research-library/library/domains/humanities/domains/math/theories/categories/theories/predication-categories/`.
- The earliest first-person statement: `emsenn/2025-12-15-on-relationality`, `proposing-a-reflexive-existence.org` (2025-11).
