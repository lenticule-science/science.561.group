---
type: concept
class: discipline
depends-on: [substrate-state, port, settling-coalgebra-structure, closure-2-monad-lax-idempotence]
see-also: [engine, time-and-event-ordinals, hash-discipline]
---

# Stepping

The discipline by which the substrate advances its [state](substrate-state.md) by one admitted message. Every port-typed message that crosses the [boundary](boundary.md) becomes a step; each step transforms the substrate's indexed family of [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) — adding a new fiber at the new history, with a restriction map back to the previous history — and the substrate's [engine](engine.md) settles the new fiber under the closure-rule system. The stepping discipline is what makes this advancement well-defined: which messages are valid steps, which transitions are admissible, what laws each step must satisfy.

Stepping is the substrate's *change unit*. The substrate is not directly mutable; it advances by stepping. A claim that "the substrate changed" is shorthand for "the substrate received an admitted step that produced a new [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) at the next index of the [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md)." This is the substrate's commitment that all change is observable, replay-able, and auditable through the event log.

## Two laws every step must satisfy

The substrate's stepping discipline is bound by two laws — both substrate-observable, both falsifiable:

- **Counit law.** Stepping forward by `s` and then restricting back recovers the prior fiber. Formally: if step `s` advances history `t` to `t' = t · s`, the restriction map from the new fiber at `t'` to the old fiber at `t` must compose with the step to give the identity on the old fiber's content. The engineering reading is that no step silently destroys earlier substrate content. A step that adds new predications can be undone (in the read sense — by restricting back) to recover the prior state; a step that overwrites prior content in a way that restriction cannot reverse is *not* a step in the substrate's sense, it is a re-creation.
- **Coassociativity.** Two consecutive steps `s₁` then `s₂` cohere: the result of stepping by `s₁` and then by `s₂` is structurally the same as stepping by their composition. The engineering reading is that stepping is associative — a substrate's history at any moment is the composition of all admitted steps, in any order consistent with the [port](port.md)'s independence relation. This is what makes batched admissions and incremental admissions interchangeable.

The two laws together mean: stepping is a *coalgebra discipline* on the substrate's state. The substrate's state and its stepping family are the carrier and the structure; the laws are the substrate's contract that history advances coherently. Mathematically, this is the substrate-side instance of the [settling-equipped predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-coalgebra-structure.md) coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ for the [settling endofunctor](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-endofunctor.md): the counit law is the coalgebra's projection back along the increment-sequence index, and coassociativity is the coalgebra's coherence with the endofunctor's iteration. Per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md), the closure-driven step from $v_\tau \vee_k u_{\tau+1}$ to $v_{\tau+1} = \mathrm{cl}^{\mathcal{S}}(v_\tau \vee_k u_{\tau+1})$ is determined up to unique iso — there is no semantic latitude in *what* a step computes, only in *how* the engine schedules it.

## What a step carries

Every step carries enough provenance to be replay-correct:

- **The port-typed message.** The original admitted message, in its canonical form per [hash-discipline](hash-discipline.md). The same message admitted again must produce the same step (idempotence under at-least-once delivery).
- **The history extension.** The mapping from prior history to new history. For independent steps (per the port's independence relation), the extension is a parallel branch in the history index; for dependent steps, the extension is a sequential branch.
- **The witness.** The [witness](witness.md) record produced by the engine when settling the step. The witness includes the input fiber's hash, the rule-system version, the conclusions derived, the output fiber's hash. Per the [event log](../objects/event-log.md), the witness becomes the durable record of what the step did.

A step missing any of the three is not replayable: without the message it has no input; without the extension it has no place in the history index; without the witness it has no durable trace.

## Stepping is per-port-message, not per-runtime-tick

A common misreading is that "stepping" refers to the engine's internal scheduling — the per-tick advancement of the wavefront within a single settle. It does not. Stepping is *substrate-observable* advancement: each admitted port message produces one step, regardless of how many internal layers the engine spent settling it. The engine's scheduling is a degree of freedom (per [engine](engine.md)); the step boundary is the substrate's contract.

The distinction matters for two engineering invariants:

- **Witness chains are at the step level.** Two engines settling the same admitted message produce different internal scheduling but identical step witnesses. The witness chain in the event log is therefore engine-independent; the substrate's audit trail is reproducible across engine implementations.
- **Federation observes steps, not internal layers.** When two substrates federate, they exchange admitted messages and the resulting steps. The internal layers each engine spent settling those messages are private to that engine; they do not cross the federation boundary.

## Independent stepping: parallel admission without coordination

When the [port](port.md)'s independence relation declares two message kinds independent, the substrate may receive them as parallel steps without coordinating their order. Two independent steps `s₁` and `s₂` admitted at history `t` produce two parallel extensions `t · s₁` and `t · s₂`; their combined extension `t · s₁ · s₂` is the *same fiber* as `t · s₂ · s₁`. This is the substrate's commitment that order does not matter for declared-independent messages, and it is what makes the substrate's engine parallelizable: independent steps can be settled on separate workers without coordination, and the merged result is canonical.

Conversely, two *dependent* steps must be ordered: the substrate's [event log](../objects/event-log.md) records a canonical ordering, and replay produces the same fiber in the same order on every replay. The substrate's [hash-discipline](hash-discipline.md) makes the ordering checkable: a step's witness records the hash of the prior fiber it stepped from, and a divergent ordering would produce a different hash.

## The stepping family across the four components

The stepping discipline shows up across the [four-component anatomy](teaching/explanations/substrate-anatomy-as-four-components.md) in coordinated ways:

- The **boundary** admits port-typed messages that *become* steps; until admitted, an external message is not a step.
- The **store** records each step's effect: the new fiber, the restriction map back, the witness. Per [two-store coherence](two-store-coherence.md), the event log carries the step's message and witness, and the predication-graph store carries the resulting fiber.
- The **engine** settles each step's fiber under the closure-rule system. Settlement is per-step; the engine's invocation boundary is the step boundary.
- The **observation surface** projects the substrate's state at any chosen step — the latest, an earlier one (per restriction), or a branch's tip. Observation is on a fiber identified by a step.

## Position in the substrate

Stepping is the substrate's *name for how it changes*. Without an explicit stepping discipline, claims about substrate change are imprecise: change might mean any of in-flight settlement progress, internal engine scheduling, or admitted message effects. With the discipline, change is the application of a step; everything else is engine internals. The substrate's audit trail is reproducible because each entry is a step, the steps compose under the two laws, and replay reconstructs the state by re-applying steps in canonical order.

The pattern composes with [time-and-event-ordinals](time-and-event-ordinals.md) (steps are the substrate's atomic events; the event log's ordinals are step ordinals), with [snapshot](../objects/snapshot.md) (a snapshot is the substrate's state at a chosen step), and with [branched-substrate-state](branched-substrate-state.md) (a branch is two stepping sequences sharing an ancestor).
