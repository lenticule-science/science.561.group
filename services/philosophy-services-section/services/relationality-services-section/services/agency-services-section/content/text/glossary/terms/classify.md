---
type: morphism
class: substrate-operation
status: sketch
depends-on: [predicated-knowledge-system, four-group-register-as-fibration, upper-ontology-as-predicate-vocabulary, identity-by-relations]
see-also: [assert, specialize, predicate-category-stratification]
name: Classify
description: The substrate operation by which an entity is placed in the predicate-category schema — i.e., assigned to a stratum (per the upper ontology) and to one or more facets within the stratum.
---

# Classify

The substrate operation by which an entity is *placed* in the predicate-category schema — i.e., assigned to a stratum (per the [upper ontology](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/upper-ontology-as-predicate-vocabulary.md)) and to one or more facets within the stratum. Under the [identity-by-relations](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/identity-by-relations.md) discipline, classification is *not* a separate "type assignment" — it is the substrate's settling under the closure rules that propagate from the cell-level predications the entity participates in.

## Operational signature

$$\mathrm{classify}: E \times \mathrm{Stratum} \times \mathrm{Source} \times \Sigma \to (K^S \to K^S)$$

— given an entity, a target stratum (a sub-category of $\mathcal{C}$ per the [predicate-category-stratification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/predicate-category-stratification.md) discipline), a source, and a scope, classify produces the fiber-algebra update that records the classification by asserting the diagnostic predications of the stratum.

## Concrete encoding per stratification

For each of the standard stratifications, classification reduces to a specific assertion pattern:

- **BFO continuant classification.** Asserting `bfo:has_part(e, e')` for $e' \in$ continuant entities, and other continuant-diagnostic relations, in sufficient quantity and consistency that the substrate's closure derives `bfo:Continuant(e)` (or, in the predicated reading, that $e$ participates in continuant-stratum predications without contestation).

- **PMEST faceted classification.** Per [pmest-as-five-axis-decomposition](../concepts/pmest-as-five-axis-decomposition.md), asserting one cell on each of the five facet predicates with the entity as the focal subject; the union of the five assertions is the entity's class number.

- **Domain-analytic classification.** Per Hjorland's domain-analysis approach, asserting `participates-in-discourse-community(e, D)` for the discourse community $D$ whose vocabulary the entity is documented in.

- **Four-group register classification.** Per [four-group-register-as-fibration](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/four-group-register-as-fibration.md), asserting that the entity participates in predicates from one of the four groups' sub-categories. The diagnostic predications are the predicates the entity actually appears in within the group.

- **Concept-lattice classification (FCA).** Asserting the attribute-incidence cells $\mathrm{has\text{-}attribute}(e, a)$ for the attributes $a$ of the entity; the substrate's closure under the FCA Galois connection derives the entity's concept (per [concept-lattice-as-degenerate-fiber](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/concept-lattice-as-degenerate-fiber.md)).

In each case, classify is the substrate's act of *populating the diagnostic cells* — there is no separate type-assignment phase.

## Substrate-level structural facts

**Closure-driven.** Classification is *closure-driven* in the substrate's strict sense: the substrate's settlement under the chosen closure-rule subset *is* the classification. There is no separate "classification phase" — the act of asserting the diagnostic predications is the act of classifying, and the act of running settlement is the act of having the classification take effect. Per [closure-as-fitting-fixpoint](../concepts/closure-as-fitting-fixpoint.md), the classification's settled value is the bilattice fixpoint of the rule system on the asserted-cells.

**Multi-classification is native.** An entity can be asserted into multiple strata or multiple facets simultaneously; the substrate carries the multi-classification as the union of its participating predications. Cross-classification consistency is checked by the substrate's $\top$-detection: a $\top$-valued classification predication signals that the entity has been classified incompatibly under different sources.

**Community-relative.** The same entity can be classified differently in different scopes; the substrate represents this directly because each scope's closure-rule subset and predicate-vocabulary are independent. Library-of-Congress classification of a work and a domain-specific community's classification need not agree, and the substrate carries each in its own scope.

**Reclassification is non-destructive.** Adding a new diagnostic predication that re-classifies the entity does not retract the old classification's predications; the substrate's settling produces the union, with $\top$ marking any incompatibility. To genuinely *retract* a prior classification, the substrate's closure-rule system must explicitly admit retraction rules — a non-monotonic extension per [reified-retraction](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/reified-retraction.md). Without retraction, classification is monotone in $\leq_k$.

**Strength-graded.** When $\mathbf{L} \neq \mathbf{2}$, classification carries strength: a probabilistic value-domain produces probabilistic classification ("60% confident this entity is a continuant"); a fuzzy value-domain produces fuzzy classification; a lattice-of-trust value-domain produces trust-graded classification. The substrate handles all of these uniformly because classification reduces to assertion in the substrate's value-domain.

**Cross-stratification interaction.** Per [predicate-category-stratification](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/predicate-category-stratification.md), an entity can be classified along multiple stratifications simultaneously (BFO + register + domain + regime). The substrate's joint classification is the intersection of stratum-assignments; conflicts between stratifications produce $\top$-valued meta-predications observable per [evidence-accumulation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/evidence-accumulation.md).

## Comparison to upstream

The substrate's classify generalises:

- **OWL `rdf:type` assertion.** OWL `a :Class` is classify restricted to $\mathbf{2}$-valued single-stratum (the OWL class hierarchy).
- **Description-logic concept assertion.** DL ABox concept assertion `e: C` is classify under a chosen DL profile; the substrate's classify is value-domain-and-stratification-general.
- **FCA concept derivation.** FCA's derivation operator $A^\uparrow$ on an attribute set is the substrate's settling-under-Galois-rules, with the entity's concept being the closure. Per [fca-concept-lattice](../../documents/articles/teaching-articles/examples/fca-concept-lattice.md), this is exactly classify in the FCA stratification.
- **Library-classification cataloguing.** Cataloguers' assignment of a class number (Dewey, LCC, UDC, Colon Classification per [pmest-as-five-axis-decomposition](../concepts/pmest-as-five-axis-decomposition.md)) is classify in a specific stratification; the substrate generalises across notation systems.
- **Property-graph label assignment.** A property-graph node's label is the *destructive* counterpart to classify: assigning a label overwrites the previous label. The substrate's classify is monotone, sourced, and structured — it inherits the [knowledge-order](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) and the predicate-category structure that property graphs forfeit.
