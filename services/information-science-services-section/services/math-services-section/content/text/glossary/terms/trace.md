---
name: Trace
description: "A finite record that folds a sequence of steps into one carrier: each move is an address in a finite ordinal slice, each step the record carried there, the trace the accumulated carrier. Articulating traces fold utterances; traces are also the objects of a trace site, and in a predicated computer the causally ordered chain of witnesses a unit of work leaves."
aliases: [traces, head, tail, trace step]
---
A **trace** is a finite record that folds a sequence of steps into one carrier ([`Articulation/Articulating/Trace.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Trace.lean)). A **move** is one address in a finite ordinal slice `Fin len`; a **step** is the record carried at that move; the trace folds every move's step through an advance function, starting from a seed, into the accumulated **carrier**. The correspondence is *move → step → trace*, parallel to *it → bit → byte*: the carrier preserves the whole record. Appending a step advances the carrier once (`Trace.carrier_snoc`).

The articulating trace takes utterances as its steps, starts from an innermost articulation and advances by pairing one more utterance over what came before. Its depth is the number of moves, and reading a trace back from an articulating and folding it again returns the original (`Trace.ofArticulating_carrier`). A finite trace is finite in regime (`Trace.ord_regime_strict`); it is articulating's unbounded recursion, not any one trace, that is aperiodic.

In the relationality derivation the trace is assembled from the entry's two positions: a trace starts when the leading position witnesses the trailing one, advances and continues, and completes. Its **head** is what the leading position isolates in the completed trace and its **tail** the remainder; a **step** removes the head and re-engages the start, and renewing, reheading and retailing carry the orientation through the next round. Binding a name at a trace's head is where contexts begin, the edge between articulating and predicating.

## Traces as a site

Traces can also be taken as the objects of a **trace site**: a finite record of an interaction is the minimal unit of relational history, a morphism $t \to t'$ says that $t'$ is a more detailed or later record than $t$, and a Grothendieck topology says which families of refinements cover. Each trace carries a local recognition algebra of what can be told at it, and a sheaf over the site glues compatible local data across traces. A trace is then an index, mediating between an outside process and the algebra of what that process established.

## In a predicated computer

A trace is the causally ordered record of the operations in one unit of work: a session, a message-handling cascade, a federation round trip. It is not a flat list. Operations form a Lorentzian causal set; a trace is a seed operation, the apex cone of everything causally reachable from it, and a section over that cone assigning each operation the [witness](witness.md) it emitted ([event causality via Lorentzian settling](../../../../../../../../../engineering-services-section/content/text/glossary/concepts/event-causality-via-lorentzian-settling.md)). Concurrent operations within a trace are spacelike-separated inside the cone; a reply from a federation peer joins because it lies in the request's cone; traces with spacelike-separated seeds do not interfere. Where two traces share operations, gluing them is Mayer–Vietoris on the overlap ([trace causality via Mayer–Vietoris spans](../../../../../../../../../engineering-services-section/content/text/glossary/concepts/trace-causality-via-mayer-vietoris-spans.md)).

A trace carries an identifier (the canonical hash of its seed), the causal chain of its witnesses and per-witness annotations. Reading one costs no settlement, since it is assembled from witnesses that already exist. No format is mandated: OpenTelemetry spans, W3C Trace Context propagation, or the witness chain queried directly all serve, and exporting to an outside observability platform is a federated operation whose round trip preserves the predications it carries.

## Related

- [Articulating](articulating.md)
- [Witness](witness.md)
- [Regime](regime.md)
