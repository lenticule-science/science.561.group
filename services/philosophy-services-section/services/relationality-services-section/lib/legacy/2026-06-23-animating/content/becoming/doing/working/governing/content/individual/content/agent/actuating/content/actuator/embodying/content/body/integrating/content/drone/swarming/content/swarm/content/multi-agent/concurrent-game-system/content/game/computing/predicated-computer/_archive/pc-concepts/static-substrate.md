---
type: concept
class: framing
depends-on: [engine, substrate-state]
see-also: [predication-graph-store, event-log, substrate-universality]
---

# Static substrate

The substrate without an engine: predication-graph content, event-log content, and the durable record of every prior state — but no active component pumping the wavefront. A static substrate is content addressable, queryable, replay-able, and federation-portable; what it cannot do is *advance*. It holds the substrate's history as artifact rather than process.

The framing exists because the same substrate content has two operational modes — *attached to an engine* and *detached* — and the engineering disciplines that apply to one do not always apply to the other. Conflating them produces confused claims about what the substrate guarantees: when someone says "the substrate is auditable," they may mean the static-substrate audit (the event log can be inspected at rest) or the live-substrate audit (every advance produces a witness). Both are true; they are different.

## What a static substrate is

A static substrate is a complete copy of the substrate's content with no engine attached:

- The [predication-graph store](../objects/predication-graph-store.md) is present, fully populated as of the latest fiber. Queries against it return the same answers a live substrate would return for that fiber.
- The [event log](../objects/event-log.md) is present, fully populated as of the latest admitted message. Replay from any prior point reconstructs that prior fiber.
- The substrate's [self-representation](self-representation.md) is intact: closure rules, shapes, scopes, witness records, all available as ordinary predications.
- The [arena](../objects/predicated-arena.md) is published — the static substrate's input and output type contract is readable.

What is absent: the wavefront is not propagating. New port-typed messages, if they were arriving, would not be admitted; existing un-settled predications, if they were flagged in-flight, would not be settled further. The state is frozen at the latest fiber the prior engine left.

## What a static substrate is good for

Three engineering uses make the static substrate the right thing rather than a degraded thing:

- **Audit and replay.** The static substrate is the substrate's frozen audit object: a researcher, a regulator, a counterparty can inspect it without contending with concurrent advancement. The event log is the durable record; replay from any point reproduces the substrate's behavior at that point. This is the substrate-level analog of a database backup — but unlike a backup, it is not a degraded artifact; it is the substrate in a different operational mode.
- **Forensic comparison.** Two static substrates representing the same logical substrate at two different times can be diffed at the predication-graph level and the event-log level: which predications changed, which messages were admitted, which closure rules fired. The diffs are interpretable because the substrate's content is canonical-form addressable per [hash-discipline](hash-discipline.md). The discipline supports incident investigation, regulatory inspection, and engineering reasoning about what happened.
- **Cold-storage portability.** A static substrate is the substrate's cold-storage form: the durable artifact a different deployment can spin up over by attaching its own engine. Per [substrate-universality](substrate-universality.md), any conforming engine running over the static substrate's content reproduces the substrate's prior behavior. This is what makes substrate migration, multi-runtime testing, and disaster recovery straightforward: the substrate's identity travels with its content, not with any particular engine.

## What a static substrate is not good for

Three things a static substrate cannot do:

- **Live admission.** Without an engine, port-typed messages arriving at the boundary are not admitted. The boundary may queue them, but no settled state is produced; the messages sit pending until an engine is attached.
- **Live settlement.** Existing un-settled predications stay un-settled. The substrate's commitments — that the wavefront propagates to quiescence, that contested predications are repaired, that vocabulary debt is closed — are commitments about *attached* substrates. A static substrate makes no claim that any of those have happened recently; it claims only that they had happened up to the moment the engine was detached.
- **Federation participation.** A static substrate does not respond to peer messages from federated substrates. If two substrates are federated and one becomes static, the federation pauses on that side until an engine is reattached. The substrate's state remains coherent (the static side did not silently drift), but the federation's settlement is bounded by both engines being live.

## Promoting between static and live

Promotion in either direction is a substrate operation:

- **Static → live.** Attach an engine that respects the substrate's algebra. Per [engine](engine.md), the engine's first action is to read the latest fiber from the store, the latest event-log ordinal from the log, and resume settlement from that point. The substrate's [stepping](stepping.md) discipline picks up from the next admitted message. No special "boot" event is required — the engine reads the state and continues.
- **Live → static.** Detach the engine after the wavefront has reached quiescence (per the [fuel-bound](fuel-bound.md) discipline). Detaching mid-wavefront is admissible — the substrate's audit trail records the un-settled state — but the resulting static substrate carries un-settled predications that any future engine will need to finish settling. Many engineering use cases (audit, diff, migration) prefer detachment after quiescence.

The promotion is byte-level invariant: a substrate that was live, became static, and was promoted live again with a different engine produces canonical-form-identical settled outputs to a substrate that stayed live throughout (provided the same admitted messages, the same rule-system version, and the same constraint catalog). This is the substrate's commitment that engine identity does not contribute to substrate identity.

## Position in the substrate

The static substrate is the substrate's *artifact form*, complementary to the live substrate's *process form*. Both are real; both are substrate; the distinction is operational. Without naming the static form explicitly, claims about substrate auditability, portability, and forensic capability collapse into vague handwaving about "the substrate at rest"; with the framing, the static form is a first-class object that engineering can reason about, ship, copy, archive, and replay.

The pattern composes with [event-log](../objects/event-log.md) (which is the durable record at the heart of any static substrate), with [snapshot](../objects/snapshot.md) (a snapshot is a static substrate at a specific history), and with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (federation across substrates can include static peers — they participate in audit and replay even while not advancing).
