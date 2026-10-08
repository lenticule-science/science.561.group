---
type: definition
class: system
realizes: [agential-self-generation]
depends-on: [predicated-computer, agential-relations-system, dispatch, heartbeat, predication-fibration, predication-hyperdoctrine, closure-rule-system, multi-observer-system]
see-also: [agential-relations-system]
title: Agential orchestration platform
description: The system this corpus characterizes.
---

# Agential orchestration platform

The system this corpus characterizes.
An agential orchestration platform is the tuple

$$ \mathcal{P} = (\mathcal{R},\, \mathcal{A},\, \mathcal{D},\, \mathcal{H},\, \mathcal{F}) $$

where:

- $\mathcal{R}$ is the underlying [predicated computer](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predicated-computer.md) — the substrate, formally a [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md) with [closure-rule system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) $\mathcal{S}$ generating the substrate's [closure operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md);
- $\mathcal{A}$ is the [agential-relations-system](agential-relations-system.md) — the agent-bearing predication-graph entity catalog (agents, skills, runbooks, shapes, offices, governance rules) that satisfies [agential self-generation](../agent/agential-self-generation/agential-self-generation.md).
  Formally, $\mathcal{A}$ is a sub-fibration of $\mathcal{R}$'s [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) — every agential element is a predication in the same store;
- $\mathcal{D}$ is the [dispatch table](../dispatch/dispatch-table/dispatch-table.md) — the engineering structure that routes incoming work to agent-skill pairs by [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) of work-type and capability predications;
- $\mathcal{H}$ is the [heartbeat scheduler](../heartbeat/heartbeat-scheduler/heartbeat-scheduler.md) — the loop that emits [ticks](teaching/explanations/tick.md) at unsettled entities, advancing the substrate's [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) from $v_\tau$ toward quiescence;
- $\mathcal{F}$ is the [federation graph](../agent/federation/federation-graph/federation-graph.md) — the predication structure of [outposts](teaching/explanations/outpost.md), [inboxes](teaching/explanations/inbox.md), and routing edges connecting this platform to others.
  Formally, the federation graph realizes a [multi-observer system](../../../../../../../../../../logic-services-section/content/text/glossary/terms/multi-observer-system.md) on the network of federated platforms.

The five components are not loosely coupled.
The agential-relations-system $\mathcal{A}$ is itself a section of $\mathcal{R}$'s [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) (per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md)); the dispatch table $\mathcal{D}$ is a sub-graph of the same store, accessed via [traversal](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) and structurally a sub-rule-system of $\mathcal{R}$'s closure-rule system $\mathcal{S}$; the heartbeat $\mathcal{H}$ is itself an entity in the store with its own scheduling-policy predications; the federation graph $\mathcal{F}$ is the sub-graph of outpost-and-inbox entities and their routing predications, structurally a multi-observer system functor $V_\mathcal{F}: \hat{G} \to \mathrm{Settlings}$.

A platform satisfying this definition exhibits the engineering properties this corpus characterizes: agential self-representation (every operative element is an entity in the store), bilattice-valued [dispatch](teaching/explanations/dispatch.md) (per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md)), per-entity scheduling via the [heartbeat](teaching/explanations/heartbeat.md), federation between platforms via signed-witness messaging (per [federation-convergence](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md) and [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)), and replayability of every orchestration step (per [snapshot-replay-fidelity](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/snapshot-replay-fidelity.md)).

The platform's *value* over a generic agent framework is structural: because everything is in the substrate, the platform's behavior is auditable, replayable, and modifiable through the same operators that act on ordinary data.
Editing a skill is editing predications.
Reorganizing the office graph is editing predications.
Adding a new dispatch rule is editing predications.
Each edit produces an event in the [event log](../../../objects/event-log.md); each event can be replayed; each replay reproduces the platform's behavior cellwise-identically per [settlement-determinism](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md).

The relationship to the [agential-relations-system](agential-relations-system.md) is that the ARS is the *agent-bearing-content* of the platform — the catalog of agents, skills, runbooks, shapes, offices, and governance rules — while the platform is the ARS *plus* the substrate, dispatch, heartbeat, and federation that make the ARS run.
An ARS without those is a static catalog; a platform is a running system.
