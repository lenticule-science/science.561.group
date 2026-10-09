---
type: concept
class: discipline
depends-on: [identity-by-relations, self-representation]
see-also: [closure-conditions]
---

# Vocabulary completeness

The discipline that **every predicate in use is itself an entity in the predicated computer**. A predicate that appears in a predication but has no corresponding entity node is *vocabulary debt*: an edge in the graph whose label is not itself a node. The system loses self-describing capacity exactly where vocabulary debt appears, because the meaning of the unspecced predicate is unrecoverable from the substrate alone.

The discipline operationalizes the substrate's [self-representation](self-representation.md) commitment at the predicate level. A predicated computer that uses a predicate $p$ in a predication but lacks an entity for $p$ has, at that point, content that cannot be queried, validated, or evolved through the substrate's own operators — the predicate's semantics live only in external implementations, not in the store. The substrate's audit and replay properties are weaker exactly there.

Three engineering practices follow:

- **Adding a predicate adds an entity.** When a new predicate is introduced anywhere in the system, a corresponding entity for the predicate MUST be added before the predicate is used. The order is: spec the predicate, then use it. Reversing the order accumulates vocabulary debt.
- **Vocabulary completeness is mechanically checkable.** Scanning every predication in the store and checking that each predicate has a corresponding entity node is a finite computation. The result is an explicit list of unspecced predicates — the corpus of vocabulary debt. Implementations that do not surface this list are operating without knowing where their substrate is incomplete.
- **Recovery requires writing the entity.** Resolving vocabulary debt for predicate $p$ is *adding the entity for $p$* — its description, the constraints on what entities admissibly carry $p$, the role $p$ plays in the substrate's operations. This is not a documentation task; the entity is part of the substrate, and its absence is a substrate-level incompleteness.

The discipline is what makes the substrate's vocabulary *self-defining*. An entity that uses predicate $p$ refers, through the substrate's own operators, to the entity for $p$, which describes what $p$ means in the substrate's terms. The chain is finite (every predicate's entity is itself in the substrate, accessed by other predicates that are also in the substrate, etc.), bottoming out in the predicates whose definitions are part of the substrate's irreducible vocabulary.

A predicated computer that is vocabulary-complete is one whose substrate can describe itself. A predicated computer with vocabulary debt is one with regions where its self-description fails. The discipline characterizes the difference and provides the operational test.
