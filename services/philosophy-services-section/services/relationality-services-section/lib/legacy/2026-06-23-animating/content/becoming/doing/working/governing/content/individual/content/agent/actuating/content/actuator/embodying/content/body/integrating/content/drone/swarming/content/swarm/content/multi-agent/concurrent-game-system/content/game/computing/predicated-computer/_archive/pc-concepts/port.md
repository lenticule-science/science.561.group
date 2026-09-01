---
type: concept
class: input-contract
depends-on: [boundary, interfacer]
see-also: [insertion, retraction, scope]
---

# Port

The typed input vocabulary of a [predicated computer](../objects/predicated-computer.md): the finite set of message kinds the substrate is willing to receive at its [boundary](boundary.md), together with the *independence relation* declaring which message kinds may arrive in any order without the substrate's settled output depending on the order. The port is what the substrate publishes about itself as a contract for the outside world: *these* are the moves the substrate accepts; *these* pairs of moves commute.

## What the port names

A port is presentation data, not a runtime structure. Two parts:

- **A finite set of message kinds.** Each kind is a substrate-recognized shape — `admit-predication`, `retract-predication`, `request-traversal`, `submit-witness-batch`, etc. — and corresponds to a primitive substrate move (per [operator](operator.md)). The set is finite and explicit; messages outside the set are rejected at the boundary, before they reach the substrate's algebra. This is the substrate's input contract: external systems learn the port and shape their emissions to it.
- **An independence relation between kinds.** A pair of message kinds `(a, b)` is independent when admitting `a` then `b` produces the same settled state as admitting `b` then `a`. Independence is *not* a property of all message pairs — two retractions targeting the same predication are not independent; an admission that creates an entity and a traversal that reads from it are not independent. The port declares precisely which pairs are.

The port is finite because the substrate's primitive moves are finite. The substrate's richness comes from the closure-rule system, the shapes, and the content the moves operate on — not from an open-ended message vocabulary.

## Independence is what makes histories equivalence-classed

When two messages are declared independent, the substrate may receive them, settle them, witness them in *either* order without producing observably different output. The port's independence relation is what makes histories equivalence-classed: two message sequences that differ only in the order of independent pairs are the *same history* from the substrate's perspective, and any operator on the history (replay, branch comparison, federation merge) treats them as one.

Concretely, two parallel admissions of independent predications by two clients can be witnessed in the order each client emitted them; the event log records a canonical history (per [time-and-event-ordinals](time-and-event-ordinals.md)), and the canonicalized history is independent of which client's emission landed first. This is what makes the substrate's witnessing concurrent without coordination: the port's independence relation is the substrate's published guarantee that order does not matter for declared-independent messages.

The substrate's settlement on a sequence of independent messages can also be batched. The engine may receive a tier of independent messages and apply them in any internal order — including in parallel within a single layer — and the settled output is the same as a serial application in any order. This is what makes the engine's internal scheduling a degree of freedom.

## What the port is not

- **The port is not the protocol.** A protocol is the wire format and transport — JSON-RPC, MCP, HTTP, a filesystem watch. The port is the substrate's input vocabulary, expressed at the algebra level. A single port can be exposed through multiple protocols (the same admit-predication kind reachable through both an HTTP endpoint and an MCP tool); a single protocol can carry multiple port kinds. Port and protocol are orthogonal.
- **The port is not the closure rule system.** Closure rules operate on substrate content after admission; the port governs what reaches admission. The two are separately editable: changing a closure rule changes how admitted content settles; changing the port changes what content is admissible. Per [self-representation](self-representation.md), both live in the substrate, but they live as different kinds of records.
- **The port is not the boundary.** The boundary is the structural edge between the substrate and the external world; the port is the substrate's declared input vocabulary at that edge. A single boundary may host multiple ports (the substrate has different input vocabularies for different scopes, per [scope](scope.md)); a single port may sit at multiple boundaries.

## Port composition

When two predicated computers federate, their ports must be composable: each computer's accepted messages must be expressible in the other's vocabulary, or the federation must include a translator at the boundary. Two computers with the same port (same message kinds, same independence relation) can federate without translation; two computers with disjoint ports cannot federate at all without an explicit interfacer-mediated translation layer. The substrate's [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) discipline assumes federated computers share a port or have explicit translators between their ports.

The substrate may publish *port extensions*: additional message kinds that subclasses of the substrate accept but the parent does not. An extension is admissible at the parent only after the parent's port has been augmented to include it (a substrate edit, per [self-representation](self-representation.md)). This is what keeps the input contract explicit: the substrate cannot silently accept a message kind it has not declared.

## Position in the substrate

The port is the substrate's *name for its mouth*: the typed signature of what the substrate will hear. Ports are how external systems plan their integrations — a publisher that wants to feed predications into the substrate looks at the port to know which message kinds the substrate accepts, what their shapes are, and which pairs commute. Without an explicit port, integration is reverse-engineering against the runtime; with a port, integration is reading a finite contract.

The pattern composes with [boundary](boundary.md) (the boundary is where the port-typed messages cross into the substrate), with [interfacer](interfacer.md) (the interfacer translates between external representations and port-typed messages), and with [reification](reification.md) (every admitted port message is reified into substrate content; the reified record carries enough provenance to replay the admission per [hash-discipline](hash-discipline.md)).
