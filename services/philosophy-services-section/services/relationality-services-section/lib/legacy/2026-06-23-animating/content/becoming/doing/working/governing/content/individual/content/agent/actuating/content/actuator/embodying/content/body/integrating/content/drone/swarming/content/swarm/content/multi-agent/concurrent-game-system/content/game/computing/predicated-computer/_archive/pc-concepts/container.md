---
type: concept
class: pattern
depends-on: [engine, port, predication-graph-store]
see-also: [predicated-computer, substrate-universality, federation-as-substrate-join]
---

# Container

A *separately operable unit* that instantiates the [four-component anatomy](teaching/explanations/substrate-anatomy-as-four-components.md) — input boundary, store, engine, observation surface — completely enough to run as a standalone predicated computer. A container is what the substrate's deployment vocabulary calls a deployable; it is what a federation's peers exchange messages between; it is what a substrate's runtime composes with other containers to produce a whole substrate.

The framing matters because a substrate's content can be carved into multiple containers — one per agent, one per locale, one per service — and each carving has engineering consequences for how the substrate is deployed, federated, and audited. Without the explicit framing, "the substrate" is treated as monolithic, and the substrate's natural composability is hidden behind ad-hoc deployment topologies. With the framing, a substrate is *one or more* containers federated according to declared arenas.

## What a container is

A container is the smallest substrate-realization unit that can independently:

- **Receive input.** A container has its own input [boundary](boundary.md), exposing its own [port](port.md) — the typed message vocabulary it accepts. External systems address the container at this boundary.
- **Hold durable state.** A container has its own [predication-graph store](../objects/predication-graph-store.md) and [event log](../objects/event-log.md), per [two-store coherence](two-store-coherence.md). Restarting the container loads from its own stores; it does not depend on another container's persistence to recover.
- **Settle its content.** A container has its own [engine](engine.md) running the substrate's settle loop on its own content. The engine is not shared with another container; the container's settlement progresses independently.
- **Emit observations.** A container has its own observation surface — sublocale projections, witness chains, federation outputs. External systems read the container at this surface.

A unit missing any of the four cannot operate independently. It is then a *component* of some other container, not itself a container. A predication-graph store with no engine is not a container — it is a [static substrate](static-substrate.md). An engine with no store is not a container — it is unattached compute. The four-component completeness is what defines container-hood.

## Why the framing exists

Three engineering uses make the container framing the right unit rather than just naming "the substrate":

- **Substrate composition.** A substrate may be composed of many containers — a container per agential locale, a container per service in a distributed deployment, a container per replicated peer in a CRDT cluster. Each container is independently operable; their composition is governed by [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md). The substrate's identity at the whole level is a function of its containers and their federation topology, not of any single container.
- **Deployment unit.** When the substrate is deployed, the deployable artifact is a container: a process, a container image, a Kubernetes pod, a virtual machine. The container's [arena](../objects/predicated-arena.md) is the deployable's external interface; the container's stores are the deployable's persistent volumes; the container's engine is the deployable's main program. The framing is the substrate's correspondence to deployment-time vocabulary.
- **Audit and inspection.** A container's audit trail is self-contained: its event log records every step admitted at its own boundary, every settlement performed by its own engine, every observation emitted at its own surface. An auditor inspecting one container does not need access to other containers in the substrate to reason about *that container's* behavior. The container is the audit unit.

## What a container is not

- **A container is not a process.** A container may be deployed as one process, multiple processes, or a distributed service cluster (per [distributed-predicated-runtime](../examples/distributed-predicated-runtime.md)). The four-component completeness is a logical property; the deployment topology is a separate engineering decision.
- **A container is not a sublocale.** A [sublocale](../objects/locale.md) is a derived view of a substrate's content — a region projected through a particular shape system. A sublocale lives *within* a container's substrate; multiple sublocales can be projected from a single container, and a single sublocale can span multiple containers via federation. The two are different kinds of structures.
- **A container is not an entity.** Entities (per [identity-by-relations](identity-by-relations.md)) are participants in the substrate's predication graph. Containers are the substrate's runtime carvings — the unit at which the substrate is realized as separately-operable code. An entity is something the substrate has predications about; a container is something the substrate runs in.

## Containers in the substrate's composition

A whole substrate is one or more containers connected through their arenas:

- **Single-container substrates.** A predicated computer realized as one container — one boundary, one store, one engine, one observation surface — is the simplest realization. Most filesystem-backed and single-host substrates are single-container.
- **Per-locale containers.** A substrate carved by [scope](scope.md) — one container per locale — gives each locale its own admission boundary, its own store, its own engine, its own observation surface. Federation between locales is container-to-container; per-locale operations stay local.
- **Per-service containers.** A substrate carved by service — one container per substrate function (admission, settlement, observation, repair) — gives each service its own deployable. The carving requires careful arena alignment between services so the federation behaves as a single substrate.
- **Per-replica containers.** A substrate carved by replication — one container per replicated peer in a CRDT cluster — gives each replica its own four-component instance. Federation between replicas is the CRDT's join operation; substrate convergence is the cluster's federation outcome.

Each carving is admissible; the substrate's identity at the whole-substrate level is a function of the carvings *and* the federation discipline that connects them. Two substrates with byte-identical content but different container carvings are different substrates at the operational level — they have different arenas, different audit topologies, different deployment requirements.

## Engineering invariants

A container that conforms to the framing commits to four invariants:

- **Self-contained boot.** Starting the container produces a fully operational predicated computer from the container's own stores. No external service is required for boot beyond the container's declared dependencies.
- **Arena-published interface.** The container publishes its [arena](../objects/predicated-arena.md) — its full input/output type contract — as substrate content readable from the container itself. External systems can integrate without inspecting the container's internal code.
- **Independent settlement progress.** The container's settlement progresses on its own content without coordination with other containers. Federation-induced messages are admitted at the container's boundary like any other; they do not bypass the substrate's algebra.
- **Audit chain ownership.** The container's audit chain is the container's own event log. Cross-container audit reconstruction follows the federation topology — each container contributes its chain, and the whole-substrate audit is the merged record.

## Position in the substrate

The container framing is the substrate's *deployment-time correspondence*. Without naming the framing, the substrate's deployment is an ad-hoc topology of services with implicit coupling; with the framing, deployment is a federation of containers with explicit arenas, explicit audit chains, and explicit substrate-level guarantees.

The pattern composes with [predicated-computer](../objects/predicated-computer.md) (the abstract object that any container realizes), with [arena](../objects/predicated-arena.md) (the per-container published contract), with [substrate-universality](substrate-universality.md) (any container conforming to the substrate's algebra is interchangeable with any other, given the same content), and with [federation-as-substrate-join](teaching/explanations/federation-as-substrate-join.md) (which is what connects multiple containers into one substrate).

The framing is what makes "the predicated computer" deployable as a real engineering artifact rather than only a theoretical object: a container is the computer realized.
