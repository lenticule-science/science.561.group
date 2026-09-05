---
type: concept
class: discipline
depends-on: [event-log, source-of-truth, witness, lorentzian-causal-settling, closure-ordinal, four-regime-dichotomy, temporal-2-category]
see-also: [reification, hash-discipline, event-causality-via-lorentzian-settling]
---

# Time and event-ordinals

The substrate's discipline for *when* events happen and *in what order* they participate in replay. In the substrate's hyperdoctrine setting, time is not a host-system clock value pulled in from `gettimeofday()`; it is *substrate-level event time*, structured by the [Lorentzian causal settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) on the substrate's event set — events are spacetime-like points, the partial order is causal precedence, and replay is the closure of this causal order to its transitive closure.

Two distinct time disciplines compose into the substrate's temporal structure: the **event ordinal** (a substrate-monotonic sequence number on a per-substrate frame) and the **declared time** (the wall-clock or logical time the message reports). Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the two correspond to different positions in the causal-set framework.

## Two times, two roles

The substrate distinguishes:

- **Event ordinal.** A substrate-monotonic integer assigned by the substrate when the event is admitted. Per [event-log](../objects/event-log.md), the ordinal orders events in the log: ordinal $n$'s event was admitted before ordinal $n+1$'s. Two substrates that admit the same event set in different orders produce different ordinal-to-event mappings, but the substrate's [content-addressed](hash-discipline.md) deduplication ensures the *content* of the merged log converges (per [federation-convergence](../theorems/federation-convergence.md)).

  In the [Lorentzian-causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) framing, the event ordinal is the substrate-local *worldline parameterization* — a per-observer ordering of events along the observer's history. Two observers may parameterize differently; the substrate-relative content (causal precedence) is observer-independent.

- **Declared time.** A predication on the message's payload recording the wall-clock or logical time the sender reports. This is what answers "when did the user say this?" or "what timestamp is on this sensor reading?" Declared time is substrate content; the substrate's reducers can read it like any other predication. Per [read-discipline](read-discipline.md), reducers do not branch on declared time as a host-runtime read; the time is in the event payload they receive.

  In the Lorentzian framing, declared time is a *content predication on the event* — the sender's claim about the spacetime location at which the event occurred. It feeds the substrate's causal-precedence determination per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md).

The two roles must not be confused. Event ordinal answers "in what order did the substrate process these?" — a substrate-replay concern. Declared time answers "what time did the sender claim?" — a content concern. A reducer that needs to make decisions about *substrate-replay order* uses event ordinal; a closure rule that needs to reason about *real-world time* (a deadline, a sequence-of-real-events, a recency-decay calculation) uses declared time.

## Event-causality as Lorentzian settling

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the substrate's events form a Lorentzian causal set: each event has a causal past (events on which it depends, transitively), and pairs of events are either *timelike-related* (one is in the other's causal past — the apex cone) or *spacelike-separated* (neither is in the other's causal past — the void cone). This structure is exactly what the substrate's replay discipline preserves: the closure of the causal order is the substrate's temporal frame.

Per [closure-ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md), the time it takes for the causal closure to complete is a regime-classified property of the substrate's event set:

- **Strict regime** ($\kappa < \omega$) — finite event sets reach causal closure in $\lceil \log_2 D \rceil$ rounds where $D$ is the longest causal chain. The substrate's replay terminates in finite ordinal time.
- **Scott-continuous regime** ($\kappa = \omega$) — countable event streams (long-running substrates) reach closure at $\omega$; every causal pair is determined at some finite stage, with the $\omega$-supremum being the full causal order.
- **Transfinite-bounded regime** ($\omega < \kappa < \omega_1$) — substrates with countably many ordinal strata; replay is decomposable into bounded sub-replays.
- **Aperiodic regime** ($\kappa \geq \omega_1$) — pathological substrates with continuum-many causal strata; replay accessible only via direct limits.

The substrate's event-ordinal discipline is the substrate's per-instance worldline parameterization within whatever regime the substrate's event set inhabits.

## Why host time is not authoritative

A naive substrate reads host time at admission and uses it as the event's time. This conflates the two roles and breaks several disciplines:

- **Replay determinism breaks.** Per [settlement-determinism](../theorems/settlement-determinism.md), settled state is a function of `(event log, operator specifications)`. If reducers read host time during replay, replaying the same log on a different host produces different state. The substrate's discipline is to record host time at admission as a predication on the event, then read the recorded predication during replay — host time enters the substrate as content, not as a runtime read.

- **Federation breaks.** Two substrates synchronizing their event logs would have different host-time-at-admission values for the same event; the events would deduplicate by content-hash but the times would conflict. The substrate's discipline is that declared time is part of the event's content; the time is canonicalized into the hash, and two substrates with the same event have the same time.

- **Audit breaks.** Reconstructing what the substrate's state was at past wall-clock time $T$ requires the substrate to know which events had declared time $\le T$. If declared time is a host-read at admission, an event admitted at host time $T'$ but with sender-declared time $T \ne T'$ is misordered for the audit's purpose.

The substrate's response is to put time in the message envelope (per [reification](reification.md)) as substrate content. Ordinal is assigned by the substrate at admission; declared time is asserted by the sender. Both are substrate-content predications.

## Ordinal-time properties

Event ordinal is monotonic, dense, and stable on a per-substrate basis. Two events admitted to the same substrate have distinct ordinals, with the earlier-admitted event's ordinal smaller. The ordinal is part of the event's reified envelope, so it survives replay and federation. When two substrates federate, their ordinals do not merge directly — the merged log has its own ordinal sequence on each substrate, with the substrates' content converging through the [merge](../morphisms/merge.md) discipline rather than through a global ordinal.

Per [hash-discipline](hash-discipline.md), the event's ordinal is *not* part of its content hash. The event's identity is its content (sender, payload, declared time) under canonical-form; the ordinal is a substrate-local placement. Two substrates with the same event content assign different ordinals to it but agree on its identity.

In the Lorentzian framing: ordinals are *worldline coordinates*, hash-content is the *event identity in spacetime*. Two observers traveling different worldlines see the same events with different ordinal parameterizations.

## Declared-time properties

Declared time is a predication on the message; its semantics are whatever the substrate's vocabulary says. Common patterns:

- **ISO 8601 wall-clock time** for human-time events: timestamps that should align with real-world clocks. Per [interfacer](interfacer.md), the [canonical-form](canonical-form.md) discipline produces a deterministic byte serialization (no locale, no implicit time zone — UTC or explicit offset).
- **Logical clock time** (vector clock, Lamport timestamp) for events whose ordering matters within a distributed protocol but whose wall-clock alignment is not required.
- **Sequence ordinal in an external system** for events ingested from an upstream system whose own ordering is the relevant temporal frame.

The substrate's closure rules read declared time through ordinary predication match; the substrate has no privileged time primitives.

## Spacelike-separated events admit reorder

Per the [Lorentzian-causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) framework, two events that are *spacelike-separated* (neither in the other's causal past) admit *any* relative ordering — the substrate's replay produces the same fixed-point regardless of which is sequenced first. This is the structural basis for the substrate's parallel-replay optimization: independent events (no causal dependency) can be replayed concurrently.

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the substrate's apex/void cone duality classifies event pairs: timelike-related pairs require sequential replay; spacelike-separated pairs admit parallel replay.

## What the discipline rules out

- **`Date.now()` reads inside reducers.** Per [read-discipline](read-discipline.md) and [settlement-determinism](../theorems/settlement-determinism.md), reducers must be pure. A reducer that reads host time has introduced runtime nondeterminism.
- **Implicit time-based ordering.** A closure rule that "fires when the predication is recent" relative to host time has assumed a host-time read. The right structure is to compare the event's declared time against another event's declared time, both substrate content.
- **Time as gating logic.** A guard that "rejects this event if it's older than 5 minutes" is using time as imperative gating. The right structure is a closure rule whose premises express the time condition declaratively; per [read-discipline](read-discipline.md), the conditional belongs in substrate content, not runtime branches.
- **Forced sequential replay of spacelike-separated events.** A substrate that replays all events sequentially even when they are spacelike-separated is leaving parallelism unused — the Lorentzian causal structure permits independent replay along distinct worldlines.

## Position in the substrate

Time-and-event-ordinals is the substrate's *temporal discipline*. It is what makes the substrate's audit, replay, and federation work consistently across sessions, across hosts, and across federation peers. Without it, the substrate's behavior is host-dependent in subtle ways that surface only when a substrate is replicated, replayed, or rebuilt from logs.

The pattern composes with [reification](reification.md) (declared time is part of the reified envelope), with [event-log](../objects/event-log.md) (ordinal orders events in the log), with [source-of-truth](source-of-truth.md) (replay uses ordinal order; reducers read declared time from event content), and with [witness](witness.md) (witnesses cite both event ordinal and declared time).
