---
type: concept
class: substrate
see-also: [predicated-computer, operator, identity-by-relations]
---

# Relational substrate

The choice that the underlying carrier of computation is the relation — the directed association between entities — rather than the addressed memory cell. A computer built on the predication substrate stores no values at addresses; it stores predications between entities and computes by inserting, retracting, and traversing those predications.

The substrate choice is ontological, not architectural. A graph database layered on top of a Boolean computer is not a predicated computer in this sense — its storage, addressing, and operations still presume the Boolean substrate. A predicated computer's primitive operations are constrained to what the substrate offers natively: assertion of a predication, retraction of a predication, traversal of predications incident to an entity under a named predicate. Any operator with a richer signature must decompose into a finite sequence of those three primitive forms (see [operator](operator.md)).

Two consequences shape the engineering:

- ***Identity is relational.*** An entity is constituted by the predications it participates in, not by a position in memory and not by a class declaration. Two entities are the same when their participating-predications structure is the same. This is the engineering content of [identity-by-relations](identity-by-relations.md): the substrate has no class-membership notion separate from predicate-participation.
- ***Computation is local.*** The response of a single entity to a new predication depends on its own predications and on the predications of immediately-related entities, not on the global graph (see [wavefront](wavefront.md)). The substrate's operators read at bounded radius; their cumulative effect is the substrate's global behavior.

The two consequences together are why a predicated computer can scale to a graph far larger than RAM: each step is bounded by the fiber width and the rule's match radius, not the graph size, so the substrate's working memory is the potential wavefront, not the stored graph.

The substrate is independent of the choice of value-domain (relations may carry Boolean values, multi-valued evidence, weighted confidences, bilattice values for paraconsistent reasoning, etc.) and of the choice of operator vocabulary beyond the three primitives. These are degrees of freedom for particular predicated computers; the substrate-level commitment is to the three primitives and the two consequences.
