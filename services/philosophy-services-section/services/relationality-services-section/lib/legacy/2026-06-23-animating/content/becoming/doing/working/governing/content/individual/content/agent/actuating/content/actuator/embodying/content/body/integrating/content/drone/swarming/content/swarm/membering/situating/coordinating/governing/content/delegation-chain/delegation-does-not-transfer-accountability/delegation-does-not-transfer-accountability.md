---
type: theorem
class: governance-claim
status: proved
depends-on:
  - teaching/explanations/delegation-chain.md
  - ../objects/delegation-record.md
  - ../morphisms/delegation.md
see-also:
  - ../theorems/accountability-chain-must-be-total.md
  - teaching/explanations/accountability-in-delegation-chains.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
  - ../terms/human-in-the-loop.md
references:
  - references/bovens2007.md
  - references/mulgan2000.md
---

# Delegation does not transfer accountability

**Claim.** When a principal delegates authority to an agent, the principal retains full accountability for all outcomes within the delegated scope.
Delegation transfers operational authority; it does not transfer the duty to answer for outcomes.
No delegation act, however complete or formal, shifts accountability from the delegating principal to the delegated agent.

## Why this holds

**Part 1: Accountability is a relational obligation, not a transferable property.** Bovens (2007) establishes accountability as a relational structure requiring: a forum (an audience to whom one answers), an agent (the party who answers), an explanation (what happened and why), and consequences (sanctions or approval).
Accountability attaches to persons who hold positions within systems of oversight; it is not a property of an action or an artifact that can be handed off.

An agentic system is not a person.
It has no legal standing, no capacity to appear before a forum, no capacity to bear consequences.
When an agent makes an error, there is no forum before which the agent answers — there is only the human principal who deployed the agent and holds the position.

**Part 2: The positional argument.** Mulgan (2000) distinguishes accountability from responsibility.
Responsibility is causal: A is responsible for outcome O if A's action caused O.
Accountability is positional: A is accountable for outcome O if O falls within A's scope, regardless of who caused O.

In a delegation chain, the principal installed the system, established the scope, and authorized the agent's operation.
The principal holds the position that makes outcomes in that scope answerable.
The agent's causal role does not change the principal's positional accountability.

**Part 3: The Naval Regulations formulation.** U.S. Navy Regulations Article 0802 states: "Delegation of authority shall in no way relieve the commanding officer of continued responsibility."
This is the oldest and most directly applicable formulation of the non-transferability principle in authority structures.
It has been consistently applied in courts, administrative tribunals, and regulatory proceedings.
The principle generalizes: in any structured authority system, the one who held the position and issued the delegation answers for what happens within the delegated scope.

**Part 4: The collapse argument.** If delegation transferred accountability, the following would hold: a principal could create an unlimited chain of sub- delegations and be accountable for none of them, because each delegation shifted accountability to the next agent in the chain.
This would make accountability structures meaningless — any principal could escape accountability by adding one level of delegation.
The consistency of accountability structures requires that delegation does not transfer it.

## What delegation transfers instead

Delegation transfers operational authority: the agent acquires the right to take actions within the delegated scope that the principal would otherwise have to take directly.
The agent can write files, call APIs, and modify resources — not because those actions are inherently the agent's to take, but because the principal granted that authority.

The grant is conditional: the authority is delegated for a purpose (the task defined in the delegation record).
Actions outside the scope or beyond the authority level are not covered by the grant.

## Accountability at each level of the chain

In a multi-level delegation chain (principal → orchestrator → worker), each principal at each level bears accountability for the operations of its direct delegate:

- The human principal is accountable for the orchestrator's work.
- The orchestrator agent is not a legal person and cannot bear accountability; however, the orchestrator agent's delegating principal (the human) is accountable for the orchestrator's failures to manage its workers.
- The human principal is accountable for the entire tree of outcomes.

The human principal's accountability is not divided across the chain.
It is total: the principal answers for every outcome in the scope, regardless of which node in the chain produced it.

## Engineering consequences

**Accountability exposure grows with scope.** Each additional authority granted to an agent is an additional category of outcomes for which the principal answers.
The minimal-authority design principle follows: grant only what the task requires.

**Observability is not optional.** Since the principal answers for the agent's actions, the principal must have sufficient visibility to know what the agent is doing.
Deploying an agent without observability infrastructure is deploying an accountability exposure without the means to detect or manage it.

**Human oversight for irreversible actions.** Because accountability attaches to the principal, principals should retain direct control over irreversible actions (permanent deletions, public-facing publications, financial transactions) rather than delegating them to agents.
[Human-in-the-loop](../terms/human-in-the-loop.md) patterns operationalize this: the agent proposes; the human approves.
