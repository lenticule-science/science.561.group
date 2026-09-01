---
type: narrative
class: conceptual-walkthrough
status: active
depends-on:
  - ../teaching/explanations/delegation-chain.md
  - ../theorems/delegation-does-not-transfer-accountability.md
  - ../theorems/accountability-chain-must-be-total.md
see-also:
  - ../objects/delegation-record.md
  - ../objects/execution-trace.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
  - ../terms/human-in-the-loop.md
references:
  - ../references/bovens2007.md
  - ../references/mulgan2000.md
---

# Accountability in delegation chains: authority flows down, accountability stays

When a multi-agent system makes an error, two questions typically arise.
First: who caused it?
Second: who is accountable for it?
These questions have different answers, and confusing them is the source of most governance failures in agentic systems.

## Authority flows down

Consider a research system.
The operator deploys an orchestrating agent with authority to conduct research and produce reports.
The orchestrator, given a specific research task, delegates to a search agent with authority to call the web search API.
The search agent makes a malformed query and returns useless results.
The orchestrator accepts the results without checking.
The report is wrong.

Authority flowed downward through this chain:

```
Operator
  → grants research authority to Orchestrator
    → grants search authority to Search Agent
      → executes (malformed) query
```

At each step, a party with authority transferred a subset of that authority to a downstream agent.
The search agent acted within its granted authority — it called the search API, which it was authorized to call.
The call was malformed, but that is a capability failure, not an authority violation.

## Accountability stays

Who is accountable?
Not the search agent — it is not a legal person.
Not in the sense of "the search agent is responsible so we blame the search agent."
An agent is software; blaming it changes nothing.

The accountability chain traces upward:

- The search agent produced a malformed query.
  The search agent has no accountability — it has no forum before which it answers.
- The orchestrator received useless results and did not validate them before incorporating them into the report.
  The orchestrator is the locus of the *validation failure* — but the orchestrator is also not a legal person.
- The operator deployed the orchestrator without adequate validation mechanisms.
  The operator is the human principal at the top of the chain.
  The operator is accountable for the report's quality, for the orchestrator's failure to validate search results, and for the search agent's capability failure.

The operator did not cause the malformed query.
The operator is nonetheless accountable for it.
This is not unfair — it follows from the structure of authority.
The operator chose to deploy this system, granted it research authority, and is answerable for everything that authority produced.

## Why this structure is sound

The accountability-stays principle protects the integrity of authority systems.
If delegation transferred accountability, a principal could create an unlimited chain of sub-delegations and be accountable for nothing, because each delegation shifted accountability to the next agent in the chain.
In a world with AI agents capable of sub-delegating indefinitely, this would create a mechanism for complete accountability evasion.

The Bovens (2007) framework for accountability requires an answerable party: a forum, someone to answer before it, an explanation of what happened, and consequences.
If accountability transfers to an agent, there is no one to answer — the agent cannot appear before a forum, cannot receive consequences, cannot explain.
The forum is empty.
Accountability requires a person; agents are not persons.

## The practical test: could the principal have caught it?

When an agent system errs, accountability assessment converges on one question: Did the principal have sufficient visibility into the agent's operation that the error should have been caught?

If yes: the principal is accountable for failing to catch it.

If no: the principal is accountable for deploying a system with insufficient visibility.
The remedy is more observability, not less accountability.

This question is answerable from the [execution trace](../objects/execution-trace.md): the trace shows what the agent saw and did at each step.
If the principal had access to the trace, the question is whether a reasonable review would have caught the error.
If the principal had no access to the trace — no observability was instrumented — the accountability for that gap belongs to the principal who chose to deploy without observability.

## Implications for system design

**Document every delegation.** An undocumented delegation is a gap in the accountability structure.
When the error happens, tracing the chain to the principal is guesswork rather than a chain of delegation records.

**Instrument every agent.** Accountability requires visibility.
Deploy agents without execution traces and you deploy accountability exposure without the means to assess it.

**Retain authority over irreversible actions.** Because the principal is accountable for everything the agent does, the principal should be in the decision loop for the highest-stakes actions: permanent deletions, public-facing publications, financial transactions, system configuration changes.
The [human-in-the-loop](../terms/human-in-the-loop.md) pattern keeps the human principal in control of consequential actions while delegating the preparatory work to agents.

**Narrow the scope.** The scope of a delegation defines the set of outcomes the principal is accountable for.
Narrow scopes mean fewer categories of outcomes.
The minimal-authority principle is simultaneously a security principle and an accountability management principle.
