---
type: concept
class: form
see-also: [structure, capital]
title: Network
description: The role concept for social structure analyzed as a pattern of relations between nodes (typically actors or organizations).
aliases:
  - Relational Network Simulation
keywords:
  - simulation
  - network
  - orchestration
layer: spec
depends-on:
  - theorem/internal/relational-network
---

# Network

*The role concept for social structure analyzed as a pattern of relations between nodes (typically actors or organizations). Network sociology treats the relational pattern itself as the primary object of analysis, rather than as a derivative of the attributes of the nodes.*

The methodological commitment: explanation runs from relations to outcomes, not from individual attributes to outcomes. Whether you find a job is not (only) about your skills; it is about who you are connected to. Whether a firm survives a market shock is not (only) about its strategy; it is about its position in the inter-organizational network. Granovetter's "strength of weak ties" (1973) is the canonical demonstration: weak ties (acquaintances) connect you to information unreachable through your strong ties (close friends), so weak ties matter disproportionately for outcomes that require novel information.

The schools and their objects. Structural sociology (White, Wellman) treats the network as the unit of analysis, with positions defined by structural equivalence. Social-capital theory (Coleman, Burt, Lin) treats the network as a resource: who you are connected to is a form of [capital](../../triage/capital.md). Field theory (Bourdieu, Fligstein) treats the network as one of the structures of a [field](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/field.md), with positions defined by relative location in a space of relations. Network science (Newman, Barabási, Watts) brings graph-theoretic and computational tools to the study of large-scale network properties (degree distributions, clustering, small-world structure).

Network analysis is also a method — see [methodology/network-analysis](../../../../../../../social-science-services-section/services/sociology-science-services-section/content/text/glossary/concepts/network-analysis.md). The concept and the method co-developed and are not separable in practice.

The critical sociologies have warned that networks are not innocent: who is in a network, who is excluded, and which network properties get optimized are political questions. Platform capitalism's reorganization of social life around networks readable to corporate measurement (Han's transparency society, Zuboff's surveillance capitalism) is one current site of that politics.

---
title: Relational Network Simulation
tags:
  - simulation
  - network
  - orchestration
layer: spec
status: plan
depends_on:
  - theorem/internal/relational-network
---
# Relational Network Simulation

This specification instantiates the **Network Structure**: it fixes concrete
carriers for ports, channels, tasks, edges, and schedules, and describes how
they behave as a routed, scheduled dataflow system.

## State representation

- **Ports.**  
  Carriers representing interface ports from the wiring structure, including
  tags for recognition/carrier type, policy regime, and measurement views.
  Ports are not a separate global registry; they are recognitions or
  finite carriers whose configuration is stored in the kernel’s relational
  state and can be reconstructed from wiring/runbook definitions.

- **Channels.**  
  Message queues or streams representing distribution channels between
  compatible ports. Each channel carries a sequence of packets as in the
  distribution structure. Channel state (buffers, offsets) is a finite,
  ephemeral working set: it is either encoded as recognitions in the
  relational state or held as a cache that can be rebuilt from that state
  and the trace.

- **Tasks and schedules.**  
  Carriers for tasks and their precedence relation, implementing the
  scheduling structure:
  - tasks are attached to ports/channels and earned acts,
  - the schedule orders tasks according to dependency and commutation laws.

## Inputs

1. Wiring description (ports and compatibility) from wiring-related specs.
2. Distribution rules (which packet types travel on which channels).
3. Scheduling hooks for dispatching tasks over channels.

## Procedures

1. **Register ports and channels.**  
   Populate the port registry and create channels between compatible ports.
2. **Route data.**  
   When a packet is emitted at an output port, use the routing rules to enqueue
   it on the appropriate channels toward input ports.
3. **Schedule tasks.**  
   Use the scheduling structure to pick runnable tasks whose predecessors have
   completed and dispatch them against the underlying runtime.
4. **Backpressure and health checks.**  
   Monitor channel states to detect disconnects, bias, or invariant violations;
   apply flow control when consumers lag or constraints are threatened.

## Invariants

- Packets must be intake-compliant (validated before routing).
- Channel ordering mirrors trace and scheduling dependencies (no reordering
  that violates wiring or scheduling).
- Routing decisions must respect policy and measurement constraints attached to
  the ports.

## Outputs

- Network topology snapshots (ports, channels, edges).
- Metrics for throughput, latency, drop events, and scheduling delays.
