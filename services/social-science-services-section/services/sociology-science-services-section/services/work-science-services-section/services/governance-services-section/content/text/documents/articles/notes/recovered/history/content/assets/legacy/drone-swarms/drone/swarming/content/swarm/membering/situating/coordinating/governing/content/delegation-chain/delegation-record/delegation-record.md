---
type: object
class: governance
status: active
depends-on:
  - teaching/explanations/delegation-chain.md
  - teaching/explanations/agentic-system.md
see-also:
  - ../morphisms/delegation.md
  - ../objects/agent-session.md
  - ../theorems/delegation-does-not-transfer-accountability.md
  - ../theorems/accountability-chain-must-be-total.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
references:
  - references/bovens2007.md
  - references/mulgan2000.md
---

# Delegation record

A delegation record is the formal artifact of a delegation act.
It is a quadruple **(principal, agent, scope, authority)** that specifies who delegated, to whom, over what domain, and with what permissions.
Delegation records are the atomic units from which [delegation chains](teaching/explanations/delegation-chain.md) are composed.

## Components

**Principal.** The party issuing the delegation — either a human operator or an intermediary agent acting within its own delegated authority.
The principal is accountable for all outcomes within the scope, regardless of what the agent does.

**Agent.** The party receiving the delegation — an agentic system that will operate within the specified scope and authority.
The agent holds derivative authority: it cannot exceed what the principal delegated.

**Scope.** The domain of operation: the set of resources, tasks, or environments within which the agent is authorized to act.
Scope may be specified by file path prefix, API domain, task category, or other bounded region.
An agent acting outside its scope has exceeded its authority; accountability for out-of-scope actions is still the principal's, but the principal may have grounds to contest the appropriateness of the design.

**Authority.** The set of actions the agent is permitted to take within the scope.
Authority is typically specified as a set of tool schemas (from the agent's [action space](action-space.md)) plus any policy constraints on how those tools may be used.
Authority is a subset of what the principal holds: a principal cannot delegate more than it has.

## Delegation record as a governance document

A delegation record is not merely a technical parameter but a governance artifact.
It answers the accountability question: "Who authorized this agent to do this?"
When accountability is traced backward through a [delegation chain](teaching/explanations/delegation-chain.md), it is traced through the sequence of delegation records.
An undocumented delegation — one where no record was created — creates a delegation gap: an action that occurred without traceable authorization.

Best practice: every agent deployment creates a delegation record, even in informal development contexts.
The record need not be elaborate — a brief specification of scope and authority is sufficient — but its existence is necessary for accountability tracing.

## Sub-delegation

When an agent re-delegates to a sub-agent, it creates a child delegation record whose scope and authority are subsets of its own delegation record.
An agent cannot create a child delegation record with broader scope or greater authority than it holds.
The tree of delegation records mirrors the tree of agent sessions: each session is authorized by a delegation record, and sub-sessions are authorized by child delegation records.

## Accountability properties

From the delegation record, three accountability properties follow directly:

1. The principal is accountable for all outcomes within the scope.
2. The agent's authority is bounded by the authority field.
3. The scope defines which outcomes belong to this accountability assignment.

These properties are the content of [delegation-does-not-transfer-accountability](../theorems/delegation-does-not-transfer-accountability.md) and [accountability-chain-must-be-total](../theorems/accountability-chain-must-be-total.md).
