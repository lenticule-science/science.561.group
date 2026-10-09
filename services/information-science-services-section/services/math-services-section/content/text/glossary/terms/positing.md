---
name: Positing
description: "The third stage of the language spine: admitting evidence at predicated cells, so that syntax gets its values. A cell's reading is measured off a trace of articulatings, read in two orders (knowledge and truth), and valuations over cells form a hyperdoctrine; positing's regime is Scott-continuous."
aliases: [posit, valuation, valuations, measuring]
---
**Positing** is the third stage of the language spine, after [articulating](articulating.md) and [predicating](predication.md): it admits evidence at predicated cells. Predicating says what is claimed of what; positing says how the claim stands, as a reading carrying [evidence](evidence.md) for and evidence against ([`Language/Positing`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing.lean)).

**Measured, not seeded.** A cell's reading is read off a trace of articulatings: the witnesses that landed on the cell tell for it, and those that landed against it tell against it ([`Positing/Measure.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/Measure.lean)). The measurement is built from exactly its own witness lists, and extending the trace can only add witnesses (`measure_cons_le`): evidence has an arrow of time. The spine's measured composite articulates a trace, predicates its cells, measures each reading from the trace itself and then settles (`runTrace`, [`Spine.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Spine.lean)).

**Two orders.** A reading sits in a [bilattice](bilattice.md) with two orders: the knowledge order rises with any evidence, the truth order rises with evidence for and falls with evidence against. The four corners of the [articulation cell](articulation-cell.md) are the four readings: absurd (no evidence), potential (told true), active (told false), stable (told both). [Negation](negation.md) swaps the two sides of the evidence.

**Valuations as a hyperdoctrine.** A valuation assigns a reading to every predication cell. Reindexing along a predicate morphism is a contravariant functor on valuations (`reindex_comp`, `reindex_mono`), and the quantifiers are its adjoints, $\exists_f \dashv f^* \dashv \forall_f$, with Beck–Chevalley and Frobenius for the converse. Negation and conflation generate a Klein four group acting on readings as an internal gauge (`klein_four`, `inGauge`); read as null coordinates, that group is the discrete Lorentz group of the reading's [light cone](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/LightCone.lean).

**Stage and regime.** Positing's [regime](regime.md) is Scott-continuous: evidence is admitted along directed finite prefixes, and the reading of the whole is the union of what the prefixes established.

## From observation to semantics

In the acts derivation positing is reached through two strata.

**Observation.** An observation is a value recognized in the context of a normalized trace. Observations step with the computation, are carried through the trace and re-enter it, and the trace closes when observation re-enters itself; flowing, evaluating and normalizing observations follow. Two observations are equivalent when their normalized forms agree in context, head and tail alike, and that equivalence is closed under re-entry: observational equivalence reached by measurement rather than by definition.

**Semantics.** Semantics gives syntax its values. The recognitions form a [Heyting algebra](heyting-algebra.md) under order, [meet](meet.md), [join](join.md), [implication](heyting-implication.md) and [complement](complement.md), and implication between recognitions gives morphisms, which compose. Types, contexts and terms are constructed and typing is judged; the calculus's metatheory follows: typing is preserved by reduction ([subject reduction](subject-reduction.md)) and a well-typed term is a value or can step ([progress](progress.md)), reduction is confluent ([confluence](confluence.md)), and terms normalize strongly by reducibility candidates up to the fundamental lemma ([strong normalization](strong-normalization.md)). The syntax is sound and complete for its canonical semantics ([soundness](soundness.md), [completeness](completeness.md)), where entailment is read in the semantic structure.

## Related

- [Evidence](evidence.md)
- [Bilattice](bilattice.md)
- [Predication](predication.md)
- [Regime](regime.md)
