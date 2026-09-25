---
type: concept
class: structure
depends-on: [agent, scope, office]
see-also: [governing-soul, governance]
title: Agent community
description: The set of agents declared to operate in a particular scope, together with their operational policies.
---

# Agent community

The set of [agents](agent.md) declared to operate in a particular [scope](../../scope/scope.md), together with their operational policies.
The agent community is a substrate entity (per [agential self-generation](../agential-self-generation/agential-self-generation.md)) recording which agents are members, what their roles are, what their declared capabilities are within this scope, what the policies governing their operation are.

The structural claim is non-obvious: in the agential layer, *the declared agent community* is the substrate's *covering structure* for the scope — the determination of which families of [skill invocations](../../skill/skill-invocation/skill-invocation.md) constitute valid work within the scope.
A [scope](../../scope/scope.md) without a declared agent community has no notion of "valid work was performed here"; the scope cannot say what counts as a complete covering of any of its objects.
A scope with a declared agent community has, by that declaration, the substrate-level structure that says *this set of agents and their declared capabilities can together produce valid work in this scope*.

The agent community is what makes a scope's work *substrate-checkable*.
The substrate's closure rules consult the agent community to determine: is this skill-invocation admissible? does the agent invoking it belong to the community? is the work being done by an admissible covering of agents?
Without the community, these are out-of-band questions; with it, they are predications.

Three engineering uses:

- **Authorization root.** An agent's [authorization](../../governance/authorization/authorization.md) within a scope is grounded in the agent's membership predication: the substrate first checks "is this agent a member of this scope's community?" before checking the agent's specific authorization for the action.
  Membership is the engineering content of "this agent belongs here."
- **Declared first.** The agent community is declared *before* any content begins flowing through the scope's [inbox](inbox.md).
  A scope with no community cannot receive admissible work; declaring the community is the act that makes the scope live for agential operation.
- **Topology root for federation.** When a scope federates with another, the federation's authentication is rooted in the receiving scope's agent community — incoming messages are admissible iff their declared origin is a recognized member of the relevant community.
  The community is the substrate's identity-validation root.

The agent community precedes the scope's [governing soul](../governing-soul/governing-soul.md): the soul is what the agents collectively commit to as the scope's purpose, and cannot be written before the agents are declared.
The order of constitution — agents first, soul second — is not preferential; it follows from the structure (the soul governs the agents, so the agents must exist before the soul governs them).
