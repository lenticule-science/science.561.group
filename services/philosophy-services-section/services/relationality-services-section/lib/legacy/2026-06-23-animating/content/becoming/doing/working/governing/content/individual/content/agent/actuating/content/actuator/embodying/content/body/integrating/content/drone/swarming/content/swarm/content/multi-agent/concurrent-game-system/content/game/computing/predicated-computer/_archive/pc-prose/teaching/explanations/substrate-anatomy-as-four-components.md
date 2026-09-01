---
type: narrative
status: current
recaps: [engine, port, substrate-modes, predication-graph-store, sensor]
introduces: []
---

# A predicated computer has four components, and confusing them is the most common pathology

A predicated computer is one object — a system that admits predications and settles them. But that one object is composed of four structurally distinct components, and the engineering discipline of the substrate depends on keeping the four named, separately specified, and separately auditable. The pathologies of predicated-computer engineering — silent drift between two implementations, untestable settlement, irreproducible audit trails, lost portability — are almost always the result of a component absorbing responsibility that belongs to another.

The four components are the **input boundary**, the **store**, the **engine**, and the **observation surface**. Each has a determinate role and a published contract; each is the substrate's answer to a different question.

## The input boundary: what the substrate will accept

The input boundary is the substrate's mouth — the structural edge between the substrate and the outside world, where messages from external systems become substrate-admissible. Three sub-components live here:

- The [port](../teaching/explanations/port.md) — the typed message vocabulary, with its independence relation declaring which message kinds commute. The port is the substrate's published input contract: an external system reading the port can shape its emissions to fit.
- The [interfacer](../teaching/explanations/interfacer.md) — the discipline that translates between external representations (markdown text, JSON documents, file changes, agent context windows) and port-typed messages. An interfacer is what makes a markdown file's edits round-trip losslessly into and out of the substrate.
- The [sensor](../objects/sensor.md) — the specialization of an interfacer for phenomena outside the substrate's control: filesystem changes, plant readings, human-authored content. Sensors carry calibration records and error models so the substrate can audit its inputs at the level of *how confident the measurement was*, not just *what the measurement said*.

Every byte that becomes substrate content does so through some combination of these three. The boundary's discipline is what makes the substrate's content auditable to its source: any predication can be traced back to a port-typed message, admitted by a specific interfacer, possibly originated by a specific sensor.

The pathology to refuse here is *boundary code carrying program logic*. A boundary that decides "if the external content matches pattern X, emit predication Y" has encoded program logic in the runtime; the right structure is per [driver/substrate split](../teaching/explanations/driver-substrate-split.md) — the boundary admits the raw content, and the substrate's closure rules produce the derived predication.

## The store: what the substrate has accepted

The store is the substrate's memory. Two parts:

- The [predication-graph store](../objects/predication-graph-store.md) — the live, queryable representation of the substrate's predications. The store is what queries hit; it is what the engine reads from and writes to; it is what the observation surface computes against.
- The [event log](../objects/event-log.md) — the append-only history of admitted messages, settled inferences, retired predications. The event log is the substrate's *rigorous* representation; the predication-graph store is the *practical* representation, and the [two-store coherence](../teaching/explanations/two-store-coherence.md) discipline is what keeps them consistent.

The store is the only place durable substrate state lives. The engine carries no durable memory between invocations; the boundary carries no durable memory between admissions; the observation surface carries no durable memory between queries. If the store is removed, the substrate is gone; if the engine is removed and a different engine attached, the substrate continues from the same store.

The pathology to refuse here is *the store doing inference*. A store that branches on predication content to materialize derived facts is doing engine work; if the materialization is correct, the engine could have done it through normal closure-rule settlement, and putting the logic in the store has hidden it from the witness chain. The discipline: stores serve, engines compute.

## The engine: what makes the substrate live

The [engine](../teaching/explanations/engine.md) is the active component. Its primitive responsibility is the [settle](../morphisms/settle.md) loop — read the store at the wavefront, apply every closure rule whose premise matches, write the conclusions back, advance the wavefront. The engine is what distinguishes a *live* predicated computer from a *content archive* that happens to be predication-shaped: a store with no engine is inert; the same store with an engine attached resumes settling from where the previous engine left off.

The engine is interchangeable. Two engine implementations that respect the substrate's algebra — the canonical-form discipline, the witness contract, the locality-respecting closure-rule application — produce byte-identical settled outputs from byte-identical inputs. This is what makes engines plumbing: the engineering theory does not care which engine you use, as long as it conforms.

The pathology to refuse here is *the engine carrying durable state*. An engine that holds working memory across invocations is silently a second source of truth, in violation of [source-of-truth](../teaching/explanations/source-of-truth.md). The substrate's behavior is then the joint behavior of the store *and* the engine's hidden state, and the engine becomes the audit-trail dependency the substrate's design refuses.

## The observation surface: what the substrate publishes

The observation surface is the substrate's window onto its settled state — the discipline by which substrate content becomes externally readable. Several sub-components, depending on the deployment:

- A [sublocale](../teaching/explanations/sublocale-as-application.md) projection — derived views of substrate content, generated by composing predications into application-level shapes (a markdown file, a JSON response, a CLI rendering).
- The [interfacer](../teaching/explanations/interfacer.md)'s compose direction — the same interfacer pattern that admits content also produces externalizable representations.
- The [witness](../teaching/explanations/witness.md) chain — the substrate's audit record, which is itself substrate-readable: anyone with access can read what produced the current state and replay it.

The observation surface and the input boundary share interfacers, but the two directions are not symmetric. The input direction is governed by the port's admit-kinds; the output direction is governed by the substrate's content and shapes. The asymmetry is what makes [interfacer](../teaching/explanations/interfacer.md)'s extract-apply pair a counit-law commitment: write-then-read round-trips losslessly within an interfacer, but the two directions are otherwise distinct disciplines.

The pathology to refuse here is *the observation surface caching state*. A surface that maintains a separate cache of substrate content has a coherence problem with the store the moment substrate content changes. The substrate's discipline is that the observation surface is computed on demand from the store, and any caching is internal to a single observation invocation — discarded when the invocation completes.

## The four components and the three substrate modes

The [substrate modes](../teaching/explanations/substrate-modes.md) — Base, Foundation, Patient — operate across the four components in a way the engineering should be explicit about:

| Component | Primarily Base | Primarily Foundation | Primarily Patient |
|---|---|---|---|
| Input boundary | Port message types (addressing) | Interfacer counit law, scope policy | Specific admitted predications |
| Store | Entity ids, predicate names, hash space | Canonical-form discipline, two-store coherence | Specific predications stored |
| Engine | (Engine carries no base) | Closure-rule system, fuel discipline | Specific predications being settled |
| Observation surface | View identifiers | Sublocale projection rules, shape conformance | Specific projected content |

Reading the table top-to-bottom: the *base* of the substrate is distributed across the four components — addressing in the boundary, storage in the store, view ids in the observation surface — and is preserved through every operation. The *foundation* is also distributed: each component has its own published contract for what counts as admissible, and the contracts together constitute the substrate's foundation. *Patient*-mode work is the substrate's actual computation: every settled predication, every emitted observation, every admitted message is a patient being transformed.

## The pathologies the four-component anatomy refuses

Three pathologies are worth naming because they are common and silent:

- **Boundary inference.** A boundary that runs closure-rule logic before admission has elevated boundary work into engine work and lost the witness chain for the inferences. The fix: admit raw content, settle through the engine, audit the witness chain.
- **Engine durability.** An engine that carries durable state across invocations is a silent second store. The fix: the engine reads from the store, writes to the store, and forgets between invocations.
- **Observation caching.** An observation surface that caches substrate content has invented a coherence problem with the store. The fix: compute on demand, cache only within one observation, discard when the observation completes.

Each pathology is mode-mismatch in disguise: boundary inference is foundation-mode work being done in patient-mode boundary code; engine durability is base-mode storage being managed in foundation-mode engine code; observation caching is base-mode storage being maintained in foundation-mode observation code. The four-component anatomy is what makes these confusions noticeable as confusions.

## Why the anatomy matters

The substrate's portability — the engineering claim that the same predicated computer can run on different storage backends, different engine implementations, different transport protocols — is not a single claim. It is four claims:

- The boundary's port can be exposed through any transport.
- The store's content can be persisted on any backend respecting the canonical-form discipline.
- The engine can be any implementation respecting the algebra.
- The observation surface can be any projection respecting the substrate's shapes.

Each claim is independently verifiable, independently testable, independently violable. The four-component anatomy lets the engineering theory state the claim precisely: *a predicated computer is portable across the choices the substrate-modes framing leaves open at each component.* Where a particular implementation hardcodes a choice that should have been a degree of freedom, the four-component anatomy is what locates the hardcoding.

The pattern composes with [substrate-universality](../teaching/explanations/substrate-universality.md) (the same engineering machinery applies to any substrate respecting the four-component contract), with [federation-as-substrate-join](federation-as-substrate-join.md) (federation between substrates is store-content exchange across boundaries, with each substrate's engine producing convergence locally), and with [events-as-source-of-truth](events-as-source-of-truth.md) (the event log is the durable record from which the predication-graph store, every engine invocation, and every observation projection are reproducible).
