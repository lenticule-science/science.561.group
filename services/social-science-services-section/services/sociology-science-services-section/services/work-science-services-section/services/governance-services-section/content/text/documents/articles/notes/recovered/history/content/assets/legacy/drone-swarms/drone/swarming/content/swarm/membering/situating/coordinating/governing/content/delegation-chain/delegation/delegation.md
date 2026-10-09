---
type: morphism
class: governance-operation
status: active
depends-on:
  - teaching/explanations/delegation-chain.md
  - teaching/explanations/agentic-system.md
  - ../objects/delegation-record.md
see-also:
  - ../morphisms/agent-composition.md
  - ../morphisms/task-decomposition.md
  - ../objects/agent-session.md
  - ../theorems/delegation-does-not-transfer-accountability.md
  - ../theorems/accountability-chain-must-be-total.md
  - ../terms/human-in-the-loop.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
references:
  - references/bovens2007.md
  - references/mulgan2000.md
---

# Delegation

Delegation is the operation by which a principal transfers authority to an agent within a bounded scope, producing a [delegation record](../objects/delegation-record.md) and initiating an [agent session](../objects/agent-session.md).
It is the governance-level complement to [task decomposition](task-decomposition.md): decomposition splits a goal into subtasks; delegation assigns subtasks to agents with bounded authority.

## Operational structure

A delegation act consists of:

1. **Authority identification.** The principal identifies the subset of its own authority to transfer: which tool schemas, which resource domains, which action types.

2. **Scope definition.** The principal specifies the domain within which the delegated authority applies.
  This may be a file path prefix, an API domain, a task category, or a time window.

3. **Record creation.** The principal creates a [delegation record](../objects/delegation-record.md) — a (principal, agent, scope, authority) quadruple — documenting the delegation.

4. **Session initiation.** The delegation initiates an [agent session](../objects/agent-session.md): the agent begins executing within the delegated scope and authority.

## What delegation transfers and what it does not

**Delegation transfers authority.** After delegation, the agent holds the specified authority and may exercise it within the scope.
The principal's authority is not reduced — delegation does not subtract from the principal's authority, it grants the agent concurrent authority within the same bounds.

**Delegation does not transfer accountability.** The principal remains fully accountable for all outcomes within the scope, regardless of what the agent does.
This is the content of [delegation-does-not-transfer-accountability](../theorems/delegation-does-not-transfer-accountability.md).
A principal cannot delegate away the duty to answer for outcomes.

## Sub-delegation

An agent that has received a delegation may itself delegate sub-tasks to further agents, creating a child delegation record.
Sub-delegation is valid only if the sub-delegated scope is a subset of the agent's own scope and the sub-delegated authority is a subset of the agent's own authority.
An agent cannot delegate powers it does not hold.

When an agent sub-delegates, accountability for sub-delegated outcomes still attaches to the original principal (through the delegation chain), but the sub-delegating agent acquires an additional accountability obligation: it is responsible for managing and validating the sub-agent's work.

## Minimal delegation principle

The principle of least privilege applies to delegation: delegate only the authority required for the specified task.
An agent given write authority to a production database when it only needs read authority has an unnecessarily broad delegation.
Broad delegations increase accountability exposure: more actions are possible, and the principal is accountable for all of them.

## Delegation and the saturation threshold

Each delegation act adds an agent to the coordination graph.
As agent count increases, coordination overhead grows superlinearly.
The [saturation-threshold](../theorems/saturation-threshold.md) at approximately four agents implies that delegation should be used sparingly: delegate when a capability is genuinely unavailable in the delegating agent, not as a default decomposition strategy.
