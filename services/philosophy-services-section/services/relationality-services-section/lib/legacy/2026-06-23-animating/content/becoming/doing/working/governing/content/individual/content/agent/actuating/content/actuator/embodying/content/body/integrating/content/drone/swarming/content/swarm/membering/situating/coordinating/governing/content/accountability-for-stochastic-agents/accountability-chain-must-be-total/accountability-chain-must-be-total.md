---
type: theorem
class: governance-claim
status: proved
depends-on:
  - teaching/explanations/delegation-chain.md
  - ../objects/delegation-record.md
  - ../theorems/delegation-does-not-transfer-accountability.md
see-also:
  - teaching/explanations/accountability-in-delegation-chains.md
  - ../objects/execution-trace.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
  - ../terms/human-in-the-loop.md
references:
  - references/bovens2007.md
  - references/mulgan2000.md
---

# Accountability chain must be total

**Claim.** In a well-formed agentic system, for every outcome $O$ produced within a delegation scope, there exists exactly one human principal $P$ who is accountable for $O$.
No outcome may be unaccountable (no principal assigned) and no outcome may be multiply-accountable (two principals assigned, creating accountability conflict).

## Why totality is required

**Part 1: Accountability gaps are structural failures.** A gap occurs when an outcome is produced within a delegation scope but no human principal is assigned accountability for it.
Gaps arise from undocumented delegations (no delegation record created), incomplete scope definitions (the scope definition does not cover the outcome's domain), or broken delegation chains (an agent sub-delegated without its principal's knowledge).

A system with accountability gaps is not a governed system — it is a system that has produced unaccountable actions.
Bovens (2007) requires that accountability be answerable: there must be a forum before which someone answers.
If no principal is assigned, no one answers.
The accountability structure has failed.

**Part 2: Accountability conflicts are structurally incoherent.** Suppose two principals $P_1$ and $P_2$ are both accountable for the same outcome $O$. $P_1$ claims $P_2$ is primarily accountable; $P_2$ claims $P_1$ is.
This is not a distribution of accountability — it is a conflict that leaves accountability undetermined.
Mulgan (2000) identifies this as the accountability diffusion problem: when everyone is accountable, no one is.

The scope-exclusivity invariant from the accountability tracing text resolves this: within a given scope, one and only one person is accountable.
Overlapping scopes in delegation records produce accountability conflicts; non-overlapping scopes are required for coherent accountability assignment.

**Part 3: Totality follows from the non-transferability principle.** From [delegation-does-not-transfer-accountability](delegation-does-not-transfer-accountability.md), every outcome within a delegated scope is the delegating principal's accountability.
If the delegation chain is complete (every node traces back to a human principal), then every outcome is covered by some principal's accountability.
Totality follows from completeness of the delegation chain.

If the delegation chain has gaps — nodes that are not connected to a human principal — then some outcomes are not covered.
Totality requires completeness of the delegation chain.

## Formal statement

Let $D$ be the set of all delegation records in a multi-agent system, and let $O$ be the set of all outcomes produced during a session.
The accountability chain is total if and only if:

1. **Coverage:** For every outcome $o \in O$, there exists a delegation record $d \in D$ whose scope covers $o$.
2. **Assignment:** For every delegation record $d \in D$, the principal field of $d$ is a human principal (or an agent whose own delegation record traces to a human principal).
3. **Non-overlap:** For no two distinct delegation records $d_1, d_2 \in D$ do the scopes of $d_1$ and $d_2$ both cover the same outcome $o$.

Conditions 1 and 2 together ensure no gaps.
Condition 3 ensures no conflicts.

## How gaps arise in practice

**Informal delegation.** An operator prompts an agent to "do task X" without creating a formal delegation record.
If X produces harmful outcomes, the operator is accountable (because they instructed the agent) but the accountability structure does not document this — tracing is retroactive and contested.

**Scope underspecification.** A delegation record specifies scope as "research domain" but the agent writes to production systems.
The write is outside the specified scope; the delegation record does not cover it.
Who is accountable for the write is undocumented.

**Sub-delegation without principal knowledge.** An orchestrator agent sub- delegates to a worker agent without informing or receiving authorization from the human principal.
The sub-delegation creates a new scope; the human principal's delegation record does not cover it.
The human principal is still accountable (by the non-transferability principle) but the gap is structural.

## Engineering consequences

**Create delegation records explicitly.** Every agent deployment should produce a documented delegation record specifying principal, agent, scope, and authority.
Informal delegation creates gaps.

**Design non-overlapping scopes.** Multiple agents operating on overlapping resource domains create the conditions for accountability conflict.
Non- overlapping scopes (agent 1 owns directory A, agent 2 owns directory B) prevent conflicts.

**Trace accountability before deployment.** Before deploying a multi-agent system, trace the delegation chain for every possible outcome category and verify that each outcome maps to exactly one human principal.
Gaps discovered in deployment are harder to remedy than gaps discovered in design.
