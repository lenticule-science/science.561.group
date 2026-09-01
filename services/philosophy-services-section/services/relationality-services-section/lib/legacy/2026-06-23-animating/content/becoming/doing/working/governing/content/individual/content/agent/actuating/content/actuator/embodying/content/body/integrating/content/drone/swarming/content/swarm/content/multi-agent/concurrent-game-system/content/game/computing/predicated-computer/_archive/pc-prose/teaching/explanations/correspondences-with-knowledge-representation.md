---
type: narrative
status: current
recaps: [predicated-computer, predication-graph-store, predication-substrate, federation-as-substrate-join]
introduces: []
---

# The substrate is a knowledge graph; it speaks RDF/OWL and ActivityStreams natively

A predicated computer's content — predication cells, restriction maps, witnesses, the audit chain — is not just *adjacent* to the semantic-web stack; it *is* a knowledge graph in the working sense the semantic-web literature uses. Naming the correspondence makes two things checkable: that any application built on the substrate inherits semantic-web interop without a separate knowledge store, and that any RDF/OWL or ActivityStreams description of substrate content reflects back into the substrate without introducing new primitive entities.

The narrative makes the correspondence precise in two directions: the substrate's *internal* structure is a knowledge graph by construction, and the substrate's *external* presentation admits a faithful RDF/OWL view (and, where federation is in play, an ActivityStreams view).

## Internal: the substrate is a knowledge graph by construction

Without any additional machinery, a predicated computer presents the structure that knowledge-graph engineering calls for:

- **Nodes are entities, with stable identifiers.** Entities in the [predication-graph store](../objects/predication-graph-store.md) carry canonical-form identifiers (per [hash-discipline](../teaching/explanations/hash-discipline.md)), making them globally addressable. Every entity also carries its participating predications; per [identity-by-relations](../teaching/explanations/identity-by-relations.md), an entity *is* the relations it participates in.
- **Edges are predications, with typed predicates.** The substrate's storage unit is the predication cell $(s, p, o)$ — a typed edge from subject $s$ to object $o$ under predicate $p$. The predicate vocabulary is itself substrate content per [self-representation](../teaching/explanations/self-representation.md): every predicate used is a substrate entity defining what content the predicate carries.
- **Provenance is built in.** Every predication has a [witness](../teaching/explanations/witness.md) entry in the [event log](../objects/event-log.md). The provenance is not a separate metadata layer; it is the substrate's audit chain. An auditor reading any predication can trace it back to the closure rule (or admitted message) that produced it, the prior fiber state it was derived from, and the rule-system version active at the time.
- **Topology and policy travel with content.** Per [scope](../teaching/explanations/scope.md), every predication sits in a substrate scope; per the [agential-orchestration-platform](../theories/agential-orchestration-platform/concepts/authorization.md)'s authorization discipline, every operation is gated by substrate-recorded policy. A query against the substrate respects the querier's scope and authorization automatically; the knowledge graph's access controls are substrate content, not an external layer.

The math reformulation is direct: the substrate's content is a [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) into [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), with the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) as the typed-predicate base. Every node in the knowledge graph is an entity in the predication-cell-set $\Phi = E \times \Pi \times E$; every edge is a predication cell with a value in the [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) carrying positive and negative [evidence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/evidence.md).

The engineering claim: a knowledge graph built on the substrate doesn't need a separate triple store, a separate provenance graph, a separate access-control layer, or a separate federation infrastructure. The substrate's algebra supplies all four; the knowledge graph is just a presentation of substrate content under a particular predicate vocabulary.

## External: the RDF/OWL view

The substrate's predication graph admits a faithful translation to RDF/OWL: predication cells become RDF triples; entity ids become IRIs; predicate vocabulary becomes the RDF/OWL predicate vocabulary; restriction maps become RDF named-graph context. The translation is engineering-realizable as a substrate operation:

- **TracePoint to RDF resource.** Each entity with substrate-recorded identifiers and a content payload becomes an RDF individual, with `rdf:type` derived from its participating predications and data properties derived from its scalar content cells.
- **Predication to RDF triple.** Each predication cell $(s, p, o)$ with a non-bottom value becomes a triple `<s> <p> <o>` in the RDF graph; the predication's value carries to RDF either as a literal, as a typed-property reification, or — for richer value-domains — as a contextualized assertion in a named graph.
- **History and snapshot to RDF named graph.** The substrate's indexed family of fibers (per [substrate-state](../teaching/explanations/substrate-state.md)) admits expression as a sequence of RDF named graphs, one per history. Restriction maps between fibers correspond to RDF graph homomorphisms in the contravariant direction.
- **Topology and policy to RDF resources.** The substrate's scope, authorization, and shape predications become RDF resources of their own, related to the entities they govern by typed predicates. An external SPARQL query can ask "which entities have access policy X?" and get a substrate-derivable answer.

The reverse direction holds too: a well-formed RDF graph (with stable IRIs, recognized vocabulary, and compatible addressing) reflects into the substrate as a set of predication-admit messages. The substrate's [boundary](../teaching/explanations/boundary.md)'s [doctrine fidelity](../teaching/explanations/doctrine-fidelity.md) discipline guarantees that the round-trip preserves the source's structure: extracting from RDF, settling, and re-serializing produces the same RDF (modulo non-predication artifacts the projector explicitly admits as kernel content per the [interfacer](../teaching/explanations/interfacer.md)'s discipline).

The correspondence is *not* an exhaustive cover of OWL — non-monotonic OWL constructs (closed-world assumptions, inverse functional properties used for unique naming, certain reasoning entailments) require substrate operations the predication algebra doesn't admit by default. But for the OWL fragment describing factual claims (instances, types, typed properties), the correspondence is complete and round-trippable.

The engineering consequence: any application currently built on RDF/OWL can move to the substrate without losing semantic content, gaining the substrate's audit chain, federation, and self-representation in exchange. Conversely, any substrate application can publish to the semantic web through the RDF view.

## External: the ActivityStreams / ActivityPub view

When two predicated computers federate, the federation's wire format admits expression as ActivityStreams 2.0 / ActivityPub. Per [federation-as-substrate-join](federation-as-substrate-join.md), the substrate's algebra is itself the federation protocol; what ActivityStreams adds is a *standard wire encoding* compatible with the broader fediverse:

- **Actors are entities with identity predications.** Substrate entities carrying agential identity predications (per [agent-record](../theories/agential-orchestration-platform/objects/agent-record.md)) play the role of ActivityStreams Actors. Their public profile predications become the Actor's profile object.
- **Objects are content entities.** Substrate entities carrying content predications (notes, articles, documents, observations) play the role of ActivityStreams Objects. The substrate's [shape](../theories/agential-orchestration-platform/objects/shape-record.md) discipline supplies the type information ActivityStreams requires (`type: Note`, `type: Article`, etc.).
- **Activities are witnesses.** Substrate witnesses recording state transitions — an admission, a closure-rule application, a settlement, a coherence repair — play the role of ActivityStreams Activities (Create, Update, Delete, Follow, Like, etc.). The witness's substrate content carries enough to reconstruct the activity's actor, object, and effect.
- **Threads and contexts are scope traversals.** ActivityStreams' `inReplyTo` and `context` fields map to substrate predications relating one entity to another within a scope. The substrate's scope discipline supplies the context structure ActivityPub threads require.

The substrate's federation discipline absorbs ActivityPub's semantic concerns:
- Out-of-order delivery is handled by the substrate's value-domain join (per [merge](../morphisms/merge.md)).
- Authentication is signed witnesses crossing the boundary.
- Conflict resolution is the substrate's [coherence-glue](../morphisms/coherence-glue.md) discipline.

What ActivityPub specifies that the substrate doesn't already have: the wire-format JSON-LD encoding, the inbox/outbox HTTP delivery semantics, the discovery protocol (WebFinger). These are pure transport — implemented as substrate-content driver bytes per [driver-substrate-split](../teaching/explanations/driver-substrate-split.md).

The engineering consequence: a substrate publishes to the fediverse by exposing an ActivityStreams projection of its content, and consumes from the fediverse by admitting ActivityStreams JSON-LD through an interfacer. The substrate's existing federation discipline handles the rest.

## What this gives the engineering

Three concrete consequences for someone building on the substrate:

- **No separate knowledge store.** An application that wants RDF/OWL semantics gets them from the substrate's existing storage. Queries are substrate traversals; type-checking is substrate shape conformance; provenance is the substrate's audit chain. There is no second store with its own consistency problem.
- **Federation through any standard wire format.** ActivityPub is one option. RDF/OWL ingest from external triple stores is another. Bare predication exchange between two predicated computers is a third. All three are substrate operations; the wire format is a transport choice, not a semantic commitment.
- **The semantic web is downstream of the substrate.** Per the [substrate-as-infrastructure](../teaching/explanations/infrastructure-as-substrate.md) framing, the substrate is the infrastructure layer; the knowledge graph is one of the practices that runs on it. The same substrate also runs orchestration, work tracking, governance, and other practices simultaneously, all sharing the same audit chain and federation discipline.

The pattern composes with [self-representation](../teaching/explanations/self-representation.md) (the substrate's predicate vocabulary is itself substrate content, including the RDF-mapping declarations); with [doctrine-fidelity](../teaching/explanations/doctrine-fidelity.md) (the RDF-view interfacer must be doctrine-fidel — round-trip-preserving); and with [federation-as-substrate-join](federation-as-substrate-join.md) (federation across substrates can use any wire format whose semantics map into the substrate's algebra).

The reader's takeaway: the substrate didn't have to *try* to be a knowledge graph. It is one by construction. The engineering decisions that followed from "the unit of storage is the predication cell" — entity ids as canonical-form addresses, witnesses as substrate content, scope as the access-control unit, federation as substrate algebra — are precisely the engineering decisions a serious knowledge-graph implementation has to make. Stating the correspondence makes explicit what was already structurally true.
