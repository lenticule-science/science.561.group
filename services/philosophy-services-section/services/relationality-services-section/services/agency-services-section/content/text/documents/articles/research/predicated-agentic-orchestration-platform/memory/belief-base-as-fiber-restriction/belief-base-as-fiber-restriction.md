---
type: concept
class: agent
status: sketch
depends-on: [agent, scope, extend-restrict-adjoint, predication-graph-store, rao-georgeff1995, bordini-et-al2007]
see-also: [practical-reasoning-as-runbook-execution, intention-as-scope-bounded-commitment, belief-base-is-scope-restriction]
title: Belief base as fiber restriction
description: "The platform's reformulation of the BDI belief base construct (Rao–Georgeff (1995), AgentSpeak/Jason): a BDI agent's belief base is recovered as the substrate-store predications restricted to the agent's scope, via the substrate's…"
---

# Belief base as fiber restriction

The platform's reformulation of the BDI *belief base* construct ([Rao–Georgeff (1995)](../../goal/rao-georgeff1995/rao-georgeff1995.md), [AgentSpeak/Jason](../../bordini-et-al2007/bordini-et-al2007.md)): a BDI agent's belief base is recovered as the substrate-store predications restricted to the agent's [scope](../../scope/scope.md), via the substrate's [extend-restrict-adjoint](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md) discipline applied to the agent's identity context.

The classical view: a BDI agent maintains a *belief base* — a separate data structure (often a logic-programming database) recording the agent's current representation of the world.
The belief base is updated by *percepts* arriving from the environment, by inter-agent communication, and by the agent's own deliberation (belief-revision constructs in the plan body).
The belief base is *internal to the agent*: each agent has its own; cross-agent belief sharing requires explicit communication.

The platform's reformulation: an agent does not maintain a separate belief base.
The agent's "beliefs" are the substrate's predications visible at the agent's scope, restricted from the substrate-wide [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) through the [extend-restrict-adjoint](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/extend-restrict-adjoint.md) discipline.
Three structural identifications:

- **Agent's scope** ↔ a context $\Gamma_a$ in the predicate category over which the agent's authorization fiber lives.
  The agent's beliefs are the predications in the substrate's predication-fiber-algebra restricted to $\Gamma_a$ via the reindexing functor.
- **Percept update** ↔ admission of new predications at the agent's scope through the substrate's normal admission discipline (boundary input, federation merge, sub-skill emission).
- **Inter-agent belief sharing** ↔ the substrate's [federation](../../teaching/explanations/federation.md): predications visible in scope $\Gamma_a$ may originate from another agent's predications visible in scope $\Gamma_b$ if the scopes overlap or if a federation bridge exists between them.
- **Belief revision** ↔ substrate edit operations admitting or retracting predications, governed by the substrate's [closure-rule system](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) and authorization fiber.

Three engineering consequences:

- **Cross-agent belief consistency without explicit synchronization.** Two agents in the same scope share the same belief content automatically — both see the same substrate predications at that scope.
  Inter-agent disagreement is recorded as substrate $\top$ at contested cells, not as belief-base divergence the agents have to reconcile through messaging.
- **Belief federation across substrates.** Two substrates federating compose their belief content through value-domain join.
  An agent's belief base in the federated substrate is the union (under join) of the contributing substrates' predications visible at the agent's scope.
- **Beliefs are auditable.** Each predication in the agent's belief base traces back through the substrate's witness chain to its admitting event (percept arrival, federation merge, prior closure-rule firing).
  The agent's "why do I believe this?" question is a substrate traversal.

The concept is *sketch* status: it names the relationship between BDI belief bases and the substrate's fiber-restriction discipline so the [upstream-synthesis-bridges](../../upstream-synthesis-bridges/upstream-synthesis-bridges.md) narrative has an atomized referent.
The reformulation is the agential-platform analog of the substrate-level [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) commitment: where self-representation makes the substrate's machinery substrate content, belief-base-as-fiber-restriction makes the agent's beliefs substrate content (rather than agent-internal state).
