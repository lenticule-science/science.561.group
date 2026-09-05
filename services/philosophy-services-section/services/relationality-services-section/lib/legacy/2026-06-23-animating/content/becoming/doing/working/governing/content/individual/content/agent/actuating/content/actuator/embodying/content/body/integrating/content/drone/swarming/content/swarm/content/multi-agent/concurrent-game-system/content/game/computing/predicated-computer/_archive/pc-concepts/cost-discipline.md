---
type: concept
class: discipline
depends-on: [settling-as-computation, fuel-bound, continuous-valued-settling, lawvere-quantale-settling, settlement-via-closure-2-monad]
see-also: [engine, settle, telemetry, cost-composition-via-lawvere-quantale]
---

# Cost discipline

The substrate's commitment that *reads are free, only settling pays*. In the substrate's hyperdoctrine setting, this is not arbitrary accounting convention — it is *the substrate-side instance of [Lawvere-quantale settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmark-lawvere-quantale-settling.md)* on the substrate's runtime fiber, where cost values live in the Lawvere quantale $([0, \infty], +, \min)$ — composition along causal chains is addition, the cheapest path is the minimum. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the substrate's cost accounting is a structural application of quantale arithmetic, with reads contributing $0$ and settlements contributing positive cost.

The substrate's queries — fetch a predication, traverse along a predicate, compose a sublocale view — consume bounded substrate resources but do not advance the substrate's history; the substrate's settlement — applying closure rules until the wavefront reaches quiescence — is the substrate's only operation that produces durable state change and therefore the only operation the substrate accounts for as cost. The discipline is what makes the substrate's runtime accounting coherent and what gives the [engine](engine.md) its scheduling primitives.

## Hyperdoctrinal grounding

Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's framework extends to continuous value-domains. The cost-discipline is exactly the substrate-side instance of the Lawvere-quantale framework, with cost taken in $\mathcal{V} = [0, \infty]$:

- **Read cost = 0.** Reads are zero in the Lawvere quantale — they're free additive contributions. Composing a chain of reads contributes nothing to the chain's total cost.
- **Settlement cost > 0.** Each closure-rule application contributes a positive value to the chain's cost. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), settlement costs along a chain compose by addition.
- **Path-cost minimum.** When multiple causal paths reach the same fiber, the substrate's accounting takes the minimum (cheapest path). Per the Lawvere quantale's join-as-min, this is structural — the cheapest realization of a settlement is the cheapest path through the substrate's causal graph.

Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the substrate's settled state is the closure 2-monad's iteration to fixed point. Each iteration step contributes positive cost in $\mathcal{V}$; the total cost is the sum across the iteration. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), this sum is a Lawvere-quantale composition — the substrate's cost is a continuous-valued settling on the runtime fiber.

The framing draws on Landauer's thermodynamic insight: information processing has a thermodynamic cost only when it produces irreversible change. Reading a predication is reversible — the read leaves the substrate in the same state — so it has no thermodynamic floor cost. Settling a predication produces a new fiber in the indexed family (per [substrate-state](substrate-state.md)) and that production is irreversible at the substrate level (the prior fiber remains in the event log, but the new fiber is now part of the substrate's history). The substrate's cost is the cost of the production.

## Three substrate operations and their cost classes

Substrate operations partition into three cost classes, each with a distinct $\mathcal{V}$-contribution:

- **Reads (free).** Cell-value queries, traversals, sublocale composition, witness-chain inspection, audit-log reading. These are bounded by the size of the read region but produce no substrate state change. Per the Lawvere quantale, reads contribute $0$. The engine's accounting does not bill them. Two substrates with identical content perform reads identically; a substrate that reports a "read cost" has confused query latency with substrate cost.
- **Admissions (cheap).** Receiving a port-typed message, recording it in the event log, queuing it for settlement. Admissions are an irreversible operation — the event log gains an entry — but the *substrate* state has only added a single new entry to its history. The cost is a constant per admission ($\epsilon \in \mathcal{V}$); the engine's accounting bills admissions but the per-message cost is small.
- **Settlement (the load-bearing cost).** Applying closure rules across the wavefront until quiescence. Each closure-rule application produces a new fiber state, a new witness in the event log, and possibly contested predications requiring repair. The cost scales with the wavefront width times the rule-application cost; per [fuel-bound](fuel-bound.md), the engine bounds settlement by an explicit fuel parameter (a cap in $\mathcal{V}$). This is what the substrate's runtime accounting is *for*.

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the three classes compose: a session's total cost is the sum of admission costs plus the sum of settlement costs (reads contributing $0$). Per the quantale's distributivity, parallel branches' costs combine via the quantale's join (min for shortest-path, max for parallel-completion).

## Why the discipline holds

Three substrate properties combine to make the discipline operative:

- **Reads do not advance history.** Per [stepping](stepping.md), the substrate's history advances only through admitted port messages. A read does not pass through the boundary; it is internal to the engine's evaluation. No new fiber is produced; no witness is emitted; the indexed family does not gain an entry. The substrate's audit trail is unchanged after a read; it cannot be unchanged after a settlement.
- **Settlements emit witnesses.** Per [witness](witness.md), every closure-rule application emits a witness recording its cause, its conclusion, and its substrate-observable effect. The witness chain in the event log is the substrate's record of every state change; a state change that produced no witness is a substrate violation, not an unmetered operation. The witness emission is what makes settlement billable.
- **Independent settlements parallelize without coordination.** Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), spacelike-separated settlements admit any relative ordering — and per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), their costs compose via the quantale's join (typically min for cheapest-path, sum for total-work). The discipline supports linear cost-scaling under parallelism: doubling the engine's parallel-worker count doubles the settlement throughput, with no coordination overhead.

## Engineering consequences

The cost discipline produces several engineering decisions that would otherwise be ad-hoc:

- **Caching is allowed; recomputation is preferred.** A read that recomputes a derived view from substrate state is free; a cache that stores the view is also free, *until* the cache must invalidate when underlying state changes. Per [cache-coherence-via-functorial-projection](../theorems/cache-coherence-via-functorial-projection.md), content-addressed caches don't invalidate; per the cost-discipline, the recomputation-vs-cache choice is a deployment-time tradeoff between cache memory and recompute latency, both quantifiable in the Lawvere quantale.
- **Settlement is batched when batching reduces total wavefront work.** The engine may admit multiple messages and settle them as a single wavefront advance, rather than one wavefront per message, when the closure-rule system's structure permits. Per the quantale's distributivity, batched settlement's total cost is bounded above by the sum of per-message costs.
- **Cost telemetry is per-settlement.** The substrate's [telemetry](telemetry.md) records settlement cost — fuel consumed, witnesses emitted, closure rules applied — not read cost. Per the Lawvere-quantale framing, telemetry's cost values live in the same $\mathcal{V}$ as the settlement-fuel.
- **Backpressure is at the boundary, not the engine.** When the substrate is overloaded, the right structure is to slow admissions at the [boundary](boundary.md) — refuse new port messages until the engine has caught up. Slowing the engine itself does not relieve the load; admissions continue to queue, the wavefront grows, and the substrate's settlement debt increases. The discipline points at the load and not at the worker.

## What the discipline rules out

A cost-discipline-respecting substrate refuses several silent inefficiencies:

- **Implicit settlement on reads.** A read that triggers settlement (because the cell isn't yet settled) hides settlement cost in read cost. The substrate's discipline is to return the un-settled flag and let the caller decide whether to wait for settlement; settlement remains a separate, billed operation.
- **Hidden re-settlement.** A settlement that runs the same rule twice over the same predications has consumed fuel that produced no state change. The engine's discipline is to detect this — the witness chain shows two applications producing the same conclusion — and to flag it for the engineer; per [determinism-via-fiber-functoriality](../theorems/determinism-via-fiber-functoriality.md), it should not happen at all.
- **Read-amplification masquerading as throughput.** A query that traverses much more graph than its declared match-radius has inflated its read cost; this is allowed at the read level (reads are free) but it is a sign of poor query authoring, surfaced by [telemetry](telemetry.md) on read time even though it does not appear in the substrate's settlement accounting.

## Position in the substrate

The cost discipline is the substrate's *accounting unit*, structurally grounded in Lawvere-quantale settling. Without naming reads as free, every substrate operator carries an implicit per-call cost; with the framing, only settlement is billable, and the engine's resource allocation can target settlement directly. The substrate's [fuel-bound](fuel-bound.md) is the practical realization of the discipline: fuel is settlement fuel (a $\mathcal{V}$-cap), not read fuel; the engine's accounting accumulates fuel consumption per settled wavefront layer, not per query.

The pattern composes with [engine](engine.md) (which decides when to spend settlement fuel and how much), with [stepping](stepping.md) (each step is an admission whose cost is bounded; settling that admission is the substrate's variable-cost work), and with [telemetry](telemetry.md) (the substrate's runtime-observability surface focuses on settlement metrics rather than read metrics). Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), all of these compose under the same quantale arithmetic.
