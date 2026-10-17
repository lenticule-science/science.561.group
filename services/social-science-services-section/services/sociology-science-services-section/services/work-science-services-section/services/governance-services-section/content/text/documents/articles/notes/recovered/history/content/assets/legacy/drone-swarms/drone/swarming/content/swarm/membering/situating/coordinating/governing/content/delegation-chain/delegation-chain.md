---
type: concept
class: governance
status: active
depends-on:
  - agentic-system.md
  - coordination-topology.md
see-also:
  - ../objects/delegation-record.md
  - ../morphisms/delegation.md
  - ../theorems/delegation-does-not-transfer-accountability.md
  - ../theorems/accountability-chain-must-be-total.md
  - teaching/explanations/accountability-in-delegation-chains.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
  - ../terms/human-in-the-loop.md
references:
  - references/bovens2007.md
  - references/mulgan2000.md
---

# Delegation chain

A delegation chain is the sequence of authority grants from a human principal through zero or more intermediary agents to a leaf agent that produces a given action.
Every action in a multi-agent system is traceable to a delegation chain terminating at a human principal; this traceability is the basis of accountability in agentic systems.

## Structure of a delegation chain

A delegation chain is a finite sequence of delegation acts:

```
Principal (human)
  → delegates authority A to Agent₁
    → Agent₁ delegates sub-authority A₁ ⊆ A to Agent₂
      → Agent₂ executes action a within authority A₁
```

Each delegation act is a [delegation record](../objects/delegation-record.md): a (principal, agent, scope, authority) quadruple.
The scope defines the domain over which the authority applies; the authority defines the set of actions permitted within that domain.

## Authority and accountability move in opposite directions

Authority flows downward along the chain: each delegation grant transfers some or all of the delegating party's authority to the receiving agent.
Sub-agents can only hold authority that was conferred on them; they cannot exceed their grant.

Accountability flows upward along the chain and does not transfer.
When an agent in the chain takes an erroneous or harmful action, accountability attaches to the human principal at the top, not to the agent that performed the action.
This is the content of [delegation-does-not-transfer-accountability](../theorems/delegation-does-not-transfer-accountability.md).

## Accountability tracing

When a multi-agent system produces an error, accountability is assigned by tracing the delegation chain from the error back toward the principal:

1. Identify the leaf agent whose action caused the error.
2. Identify the agent (or principal) who delegated to that leaf agent.
3. Determine whether the delegating party had sufficient visibility to catch the error before it propagated.
4. If yes: the delegating party is the locus of accountability failure.
5. If no: the error is a structural failure of the delegation design — the delegation was issued without adequate oversight mechanisms.

In both cases, accountability attaches to the human principal.
The tracing exercise determines at what level the delegation failed: insufficient validation by an intermediary, or insufficient oversight structure by the principal.

## Gaps in delegation chains

A delegation gap occurs when an action is traceable to an agent whose delegating principal is not assigned accountability for that agent's errors.
Gaps produce unaccountable actions: actions that occurred within a multi-agent system but for which no human principal answers.
A well-designed agentic system has no delegation gaps.
See [accountability-chain-must-be-total](../theorems/accountability-chain-must-be-total.md).

## Depth and complexity

Delegation chain depth — the number of intermediate agents between the principal and the leaf — increases the difficulty of accountability tracing.
At depth one (principal → leaf agent), tracing is trivial.
At depth three or more (principal → orchestrator → subagent → tool executor), tracing requires complete execution traces across all levels.
Observability infrastructure must capture the full chain, not just individual agent logs.
