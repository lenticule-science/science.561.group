---
type: narrative
status: current
recaps: [engine, predication-graph-store, event-log, predication-substrate, federation-as-substrate-join, substrate-anatomy-as-four-components]
introduces: []
---

# The substrate is a composition of stacks; each stack is a substrate-internal discipline

The [four-component anatomy](substrate-anatomy-as-four-components.md) names the substrate's structural decomposition. But within each component, several distinct *stacks* of substrate functionality compose to produce the component's behavior. Naming the stacks makes the engineering visible at a finer grain: an engineer reasoning about the substrate can ask "which stack does this concern belong to?" and the answer is a substrate-level commitment, not a deployment detail.

The framing draws on prior research articulating the substrate's machinery as a layered composition of stacks ([persistence stack](../../../../../../../../../../operations/engineering/research/triage/library/triage/relationality/narratives/relational-applications/internal/persistence-stack.md), [replication stack](../../../../../../../../../../operations/engineering/research/triage/library/triage/relationality/narratives/relational-applications/internal/replication-stack.md), and others). What follows reorganizes those into the substrate's own vocabulary: each stack is a discipline the substrate carries, and the substrate's whole behavior is the composition of all of them under the four-component anatomy.

## Eight substrate stacks

The substrate's stacks decompose into eight distinct disciplines:

- **Intake stack.** The boundary's discipline for converting external bytes into substrate-admissible port-typed messages. Per [interfacer](../teaching/explanations/interfacer.md) and [sensor](../objects/sensor.md), the intake's responsibilities are extract (parse external content into predications), classify (against the [port](../teaching/explanations/port.md)'s admit kinds), validate (per [doctrine fidelity](../teaching/explanations/doctrine-fidelity.md) and shape conformance), and witness (record the admission). External bytes that fail any of these stages are surfaced as rejection witnesses, not silent drops.

- **Persistence stack.** The store's discipline for keeping substrate state durable across engine restarts, host failures, and process boundaries. Per [predication-graph store](../objects/predication-graph-store.md) and [event log](../objects/event-log.md), the persistence stack maintains [two-store coherence](../teaching/explanations/two-store-coherence.md): the event log is the rigorous record from which any fiber is reproducible, and the predication-graph store is the practical projection of the latest fiber for fast query. The math reformulation is the indexed-family of [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over a [settling-bound](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md).

- **Evaluation stack.** The engine's discipline for applying the substrate's closure machinery to admitted predications. Per [engine](../teaching/explanations/engine.md), the evaluation stack runs the [settle](../morphisms/settle.md) loop: read the wavefront, apply matching closure rules, write conclusions, advance until quiescence. The math reformulation is the application of a [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) on each fiber, producing a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) under [closure-drivenness](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md). The stack's locality discipline is what makes the evaluation tractable: per [wavefront](../teaching/explanations/wavefront.md), each closure-rule application reads at the rule's match radius, not the global graph.

- **Scheduling stack.** The engine's discipline for *when* to run evaluation. Per [stepping](../teaching/explanations/stepping.md), each admitted message produces one substrate-observable step; the scheduling stack decides which steps to take in parallel (per the [port](../teaching/explanations/port.md)'s independence relation), which to serialize, and how many wavefront layers to spend per step (per [fuel-bound](../teaching/explanations/fuel-bound.md)). The stack's freedom is *internal*: scheduling choices don't change substrate-observable outputs, only throughput and latency.

- **Concurrency stack.** The substrate's discipline for safe parallel execution. Per the port's independence relation, two declared-independent steps produce the same merged fiber regardless of execution order. The concurrency stack is the substrate's *commutation guarantee*: independent operations parallelize without coordination overhead, and the resulting fiber is canonical-form-identical to a serial execution. The math reformulation is the Mazurkiewicz-trace structure on the history monoid.

- **Distribution stack.** The substrate's discipline for moving predications between substrate components, between containers, and between federation peers. Per [container](../teaching/explanations/container.md), each container's distribution-stack responsibilities include routing admissions to the right engine actor, propagating settled predications to the observation surface, and federating cross-container content per [federation-as-substrate-join](federation-as-substrate-join.md). The stack's commitments are sourced from the substrate's algebra (commutativity, associativity, idempotence of merge), not from a separate routing protocol.

- **Audit stack.** The substrate's discipline for reconstructing what happened. Per [witness](../teaching/explanations/witness.md), every closure-rule application emits a witness; the [event log](../objects/event-log.md) accumulates them; the audit stack provides the read-side that lets an auditor traverse the chain back from any current state to the admitted messages and rule applications that produced it. Per [events-as-source-of-truth](events-as-source-of-truth.md), the audit chain is the durable record from which any prior state is reproducible by replay.

- **Observation stack.** The substrate's discipline for projecting settled state into externally-readable form. Per [interfacer](../teaching/explanations/interfacer.md), the observation stack composes substrate fibers into [sublocale](../teaching/explanations/sublocale-as-application.md) views that external systems consume — markdown files, JSON responses, CLI renderings, federation outputs. The stack's discipline is that observations are computed on demand from the store; per [cost-discipline](../teaching/explanations/cost-discipline.md), observations are *free* (reads don't pay), and the substrate's content is the source of truth for any observation.

The eight together cover the substrate's full operational surface. An engineering question about the substrate is a question about which stack carries the relevant responsibility.

## How stacks map to the four-component anatomy

The eight stacks compose under the four-component anatomy:

| Component | Stacks hosted |
|---|---|
| Input boundary | Intake, Concurrency (independence relation declaration), Distribution (admission routing) |
| Store | Persistence, Audit |
| Engine | Evaluation, Scheduling, Concurrency (settlement parallelism) |
| Observation surface | Observation, Distribution (peer federation), Audit (read-side) |

Three stacks span multiple components: the Concurrency stack is split between boundary (where independence is declared) and engine (where it's exercised); the Distribution stack handles both inbound admissions and outbound emissions; the Audit stack is hosted in the store but read by the observation surface. The cross-component stacks are why the four-component anatomy is the *minimum* decomposition — finer decompositions break stacks across components, requiring coordination the substrate's algebra would otherwise eliminate.

## Why the stack framing matters

The framing produces several engineering decisions that would otherwise be ad-hoc:

- **Stack responsibility refuses to leak.** A bug in the persistence stack does not become a bug in the evaluation stack; the two have different commitments and different tests. An engineering team working on one stack doesn't need to understand the others to make changes that conform.
- **Implementation choices are stack-local.** The persistence stack's choice of storage backend (rqlite, Postgres, flatfile) doesn't affect the evaluation stack's choice of scheduling discipline (single-thread, fan-out, distributed actor). Each stack's implementation is interchangeable as long as its substrate-level commitments hold.
- **Cost accounting is per-stack.** Per [cost-discipline](../teaching/explanations/cost-discipline.md), only the evaluation stack's settlement is billable; the audit, observation, and intake stacks are free up to per-operation transport cost. The stack framing makes the distinction precise.
- **Failure modes are stack-local.** A persistence-stack failure (storage corruption) is recoverable from the audit stack's event log. An evaluation-stack failure (closure-rule bug) leaves the persistence stack intact and replays cleanly under a corrected rule. A distribution-stack failure (network partition) leaves both intact and recovers when partition heals. The stack-by-stack decomposition tells operators which recovery procedure applies.

## The stack composition

Reading the substrate as a stack composition produces a cleaner engineering picture than any single layer can:

- *What* the substrate stores: persistence + audit.
- *How* the substrate accepts content: intake + concurrency.
- *How* the substrate computes: evaluation + scheduling.
- *How* the substrate publishes content: observation + distribution.

Each pair shares a component but addresses a different concern. The substrate's behavior is the composition of all eight, each running its own discipline, with the four-component anatomy as the structural frame holding them together.

The pattern composes with [substrate-anatomy-as-four-components](substrate-anatomy-as-four-components.md) (the structural decomposition the stacks compose under), with [substrate-modes](../teaching/explanations/substrate-modes.md) (each stack operates on different substrate modes — base for addressing, foundation for invariants, patient for content under transformation), and with [container](../teaching/explanations/container.md) (a container hosts all eight stacks; multi-container substrates split stacks across deployable units while preserving the substrate's algebra).

The reader's takeaway: the substrate isn't a monolith. It is eight composable disciplines, each named, each engineering-checkable, each deeply implicated in the substrate's algebra. An engineer building or auditing a substrate can work stack-by-stack; the substrate's whole behavior follows when each stack respects its commitments.
