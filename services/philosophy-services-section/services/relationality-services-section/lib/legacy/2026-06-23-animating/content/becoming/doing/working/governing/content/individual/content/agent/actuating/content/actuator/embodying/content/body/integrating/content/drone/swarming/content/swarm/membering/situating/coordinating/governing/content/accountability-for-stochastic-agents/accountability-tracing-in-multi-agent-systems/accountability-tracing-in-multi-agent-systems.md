---

title: "Accountability Tracing in Multi-Agent Systems"
description: "Following the delegation chain from an action back to who bears accountability. The difference between responsibility (you caused it) and accountability (you answer for it), and why that distinction matters when LLM agents make mistakes."
domain: agents
examines: multi-agent-system, delegation, accountability
governs: agentic-system
requires: delegation, accountability
factors-through: coordination-overhead, agent-observability, multi-agent-failure-modes
related: agent-reliability-in-production
date-created: 2026-04-04
sources:
  - bovens2007
  - mulgan2000
  - navy-regulations
  - hohfeld1919

---

When an LLM agent makes an error, who is accountable?
Not the agent—the agent has no legal standing, no authority, no capacity to bear accountability.
Accountability always attaches to a human officer.
The question is which one.

The answer requires understanding the difference between responsibility and [accountability](../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/accountability.md), tracing the [delegation](../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md) chain from the error back to the person who installed the system and issued the grant.

## Responsibility vs. Accountability

These are not synonymous, and the confusion between them is a major source of governance failures in multi-agent systems.

**Responsibility** is causal and backward-looking: A is responsible for outcome O if A's action caused O, and A had the relevant knowledge or intention.
Responsibility attaches to the efficient cause—the actual doer.
It can be absent if causation is absent.

**Accountability** is positional and totalizing: A is accountable for outcome O if O falls within A's scope of responsibility, *regardless of who caused it*.
Accountability is the formal structure that says "you installed this system, you delegated authority through it, therefore you answer for what happens within its scope."
The canonical formulation from U.S. Navy Regulations (Article 0802): "delegation of authority shall in no way relieve the commanding officer of continued responsibility."

A commanding officer is accountable for a navigation error made by a sleeping junior watchstander.
The officer did not cause the error.
The officer is still accountable for it.
Why?
Because the officer held the position (installed watchstanders, set standing orders, established the system of watch rotations) that made the error possible.

## The Delegation Chain in Multi-Agent Systems

In a multi-agent system, the delegation chain runs from a human principal through one or more intermediary agents to a leaf agent that produces the error.

Consider a simple two-agent research system:

```
Captain
  |
  v (delegates research authority)
Research Agent (orchestrator)
  |
  v (delegates literature search)
Search Agent (tool executor)
  |
  v (executes)
[Calls web search API incorrectly]
```

The search agent produces an error: it calls the API with a malformed query.
Who is accountable?

- The search agent is not accountable.
  It is not a legal person.
  It holds authority only derivatively, from a delegation.
- The research agent is not accountable for the error itself—the research agent did not cause the malformation.
  But the research agent is accountable for failing to validate the search agent's output.
- The captain is accountable for the research agent's failure, because the captain delegated the research authority to the research agent without sufficient oversight.

The accountability chain goes backward from the error to the top:

1. **Leaf error**: Search agent produces malformed query.
2. **First accountability**: Research agent is accountable because it delegated the search task to the search agent and did not validate the result.
3. **Second accountability**: Captain is accountable because the captain delegated the research authority to the research agent and is answerable for all outcomes in the research domain, regardless of whether the captain is present or aware of the delegation chain.

## Invariants of Accountability Through Delegation

Four formal invariants govern accountability as it propagates through delegation chains:

### 1. Totality

Accountability must be total—every outcome within a scope must be assigned to exactly one accountable party.
There must be no "accountability gap" where an error occurs but no one is accountable for it.

In multi-agent systems, this means: when an agent makes an error, there must be a chain of delegations that leads backward to a human officer who bears the accountability.
If a gap exists (a delegated agent whose delegator is not assigned responsibility for its errors), the system has a structural flaw.

Example of a gap: A captain delegates authority to an agent A, which delegates to agent B, but does not specify whether the captain is accountable for B's errors or only for A's.
Until this is settled, accountability is undefined.

### 2. Non-Transferability

Delegation transfers authority; it does not transfer accountability.
A principal cannot give the duty to answer away.
When the captain delegates research authority to the research agent, the captain retains the full accountability for the research scope.
The fact that the captain delegated does not reduce the captain's answerability.

This is not a statement about fairness.
It is a structural fact.
If a subordinate could delegate away their accountability, the entire system of answerability would collapse.
The subordinate could create an unbounded chain of sub-delegations and claim they are not answerable for any of them.

### 3. Installation-Anchoring

Accountability comes into force at the moment of [investiture](../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/investiture.md)—when a person is formally installed in a position that carries a scope.
Before installation, the accountability does not apply.
After installation, it applies in full until the person is relieved.

For multi-agent systems, this means accountability for the system attaches at the moment the principal deploys the system with delegated authority.
Physical absence, the principal's ignorance of the delegation chain, even the principal's incapacity does not suspend accountability.

Installation-anchoring applies even to AI agents: when the principal delegates authority to the agent (installs the agent in a role), the principal's accountability begins immediately and does not suspend.

### 4. Scope-Exclusivity

Within a given scope, one and only one person is accountable.
Two people cannot both hold the same accountability without creating indeterminacy—ambiguity about who is answerable for which outcomes.

In multi-agent systems, this means: a given task domain must have a clear apex of accountability.
If two agents are both partially responsible for research, and both claim the other is accountable for the error, accountability is diffused and the system has failed.

## Tracing Accountability Through Error Propagation

When a multi-agent system fails, the accountability chain reveals itself through error propagation.
Understanding the propagation pattern shows who is accountable where.

### Pattern 1: Local Error, Unvalidated Output

The search agent produces a malformed query.
The research agent accepts it without checking.
The result is wrong.

- Causal responsibility: Research agent (failed to validate before passing downstream)
- Accountability: Captain (delegated research authority to research agent)

The error originated in the search agent, but the *failure point from an accountability perspective* is the research agent's validation step.
The research agent is where the error could have been caught and was not.

### Pattern 2: Cascading Misalignment

Two agents are supposed to coordinate.
Agent A produces output in Format X.
Agent B expects Format Y.
Agent B misinterprets A's output and makes a decision based on the misinterpretation.

- Causal responsibility: Agent B (misinterpreted the input)
- Accountability: The human who delegated to both agents without ensuring they agreed on data format

The MASFT study (arXiv 2503.13657, March 2025) identified "cascading misinterpretation" as one of the six core failure modes in multi-agent systems.
When one agent's error propagates and amplifies through subsequent agents, the accountability chain usually breaks at the level of *coordination oversight*—the human (or higher-level agent) responsible for ensuring that agents have compatible expectations.

### Pattern 3: Specification Gap

The captain delegates a research task to the research agent with vague instructions: "Find good sources on accountability in AI systems."
The research agent interprets this as "find any sources that mention AI and accountability" and misses the most relevant papers because they use different terminology.

- Causal responsibility: Research agent (did not recognize the gap in its instructions)
- Accountability: Captain (delegated with insufficient specification; U.S. Navy Regulations Article 0801 requires delegations be "clear and concise")

This is the specification failure category (FC1) in the MASFT study.
The agent system failed at the point where the human delegation was insufficient.
Accountability rises to the person who made the delegation.

## Implementation: Observability Produces Traceability

Making accountability traceable requires observability.
You cannot assign accountability to a chain you cannot see.

The minimum observability requirements:

1. **Full execution trace**: Record every agent invocation, every tool call, every output.
  The trace must be complete enough to reconstruct the error's origin and the chain of agents and validations that led to it.

2. **Decision points recorded**: At each agent's step, log what state it saw, what action it chose, and why (the model's reasoning or policy).
  This reveals where errors originate (incorrect state perception, incorrect reasoning, incorrect policy).

3. **Validation checkpoints**: Log where validation should have occurred (agent B should have checked that agent A's output was in the expected format) and whether it did.
  A missing validation point is a breach of the delegating principal's answerability.

4. **Delegation bounds recorded**: Document what each agent was delegated to do, what authority limits apply, and what outcomes fall within its scope.
  When an agent acts outside its bounds, the accountability shifts to the principal who failed to enforce the bounds.

The [Agent Reliability in Production](./agent-reliability-in-production.md) text documents current best practices.
The core finding: token usage per step, decision traces, and failure classification are the most informative metrics.
These are precisely the data needed to trace accountability.

## Accountability in the Face of AI Unpredictability

Modern LLM agents are stochastic—the same input can produce different outputs.
This creates a tension with traditional accountability structures, which assume predictable agents who can follow orders.

The structure resolves as follows:

- **Non-delegable duties**: For irreversible actions (deployments, deletions, entity data modifications), the principal must retain decision authority and place the delegated agent in an advisory role.
  The [human-in-the-loop](../terms/human-in-the-loop.md) pattern assigns formal authority to the human for the final decision.

- **Bounded delegation with review**: The principal delegates the agent authority to take actions within a bounded scope, with the understanding that the principal will review all outcomes in that scope before they propagate downstream.
  If an agent's output would violate a constraint or contradict prior guidance, the principal's role is to catch it.

- **Durable execution with checkpointing**: The [durable-execution](../terms/durable-execution.md) pattern (as implemented in LangGraph and PydanticAI) saves the agent's state at each step.
  On failure, the system resumes from the last good state.
  The accountability for the failure attaches to the principal who chose not to implement resumable execution.

## Responsibility Chains for Compliance and Audit

From a compliance perspective, accountability tracing produces the evidence needed for audit and regulatory response.

The EU AI Act (requirements in force August 2026) requires that high-risk AI systems maintain post-market monitoring documentation showing:

- What was delegated to the agent, in what scope, with what authority
- What happened (complete execution trace)
- Who is answerable for the outcome (the accountability chain)

A responsible multi-agent system must be able to answer the question: "For this error, who is accountable?" by reconstructing the delegation chain and showing where the error originated and where it should have been caught.

Mulgan's (2000) accountability framework from public administration identifies five forms of accountability: political, legal, administrative, professional, and social.
Multi-agent systems must implement at least the administrative and legal forms:

- **Administrative accountability**: Documented procedures, delegations, and decision traces sufficient to answer "how did this happen?"
- **Legal accountability**: Clear assignment of responsibility to a named individual or office such that a court or regulator can determine liability.

Without this clarity, the system has not actually delegated authority—it has abdicated it.

## The Question That Settles Everything

When an agent errs, one question settles the accountability chain:

**Did the principal have sufficient visibility into the agent's operation that the error should have been caught?**

If yes: The principal is accountable.
The principal had the information and authority to prevent the error and did not.

If no: The principal is still accountable (accountability does not transfer), but the breach is one of insufficient oversight structure, not insufficient vigilance.
The remedy is to add observability and validation checkpoints.

If the principal had no reasonable way to know: The accountability still attaches to the principal, and the principal's remedy is to restructure the delegation—move the agent into a non-delegable role, require higher oversight, narrow its authority, or replace it with a simpler system that produces predictable output.

The principal cannot escape accountability by claiming they did not know.
The principal can only meet accountability by establishing a system where errors are visible and caught before they propagate.

## See Also

- [Delegation](../../../../../../../../../humanities/theories/sociology/theories/work/terms/delegation.md) — the structure of authority transfer
- [Accountability](../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/accountability.md) — the formal definition and mathematical structure
- [Agent Observability](../terms/agent-observability.md) — how to make agent operations visible
- [Multi-Agent Failure Modes](./multi-agent-failure-modes.md) — the MASFT study's taxonomy of failure
- [Agent Reliability in Production](./agent-reliability-in-production.md) — engineering practices for reliable agents
- [Durable Execution](../terms/durable-execution.md) — checkpointing and resumable agent execution
- [Human-in-the-Loop](../terms/human-in-the-loop.md) — patterns for retaining human oversight of delegated agents

## Sources

- Bovens, M.
  (2007).
  "Analysing and Assessing Accountability: A Conceptual Framework." *European Law Journal*, 13, 447–468.
  Foundational modern framework distinguishing accountability as a relational structure requiring forum, explanation, judgment, and consequences.

- Mulgan, R.
  (2000).
  "'Accountability': An Ever-Expanding Concept?" *Public Administration*, 78(3), 555–573.
  Analysis of accountability vs. responsibility in public administration; establishes accountability as distinct from causal responsibility.

- U.S. Navy Regulations, Article 0802.
  "Delegation of authority shall in no way relieve the commanding officer of continued responsibility."
  The foundational naval legal statement of non-transferability of accountability.

- Hohfeld, W.N. (1919). *Fundamental Legal Conceptions as Applied in Judicial Reasoning*.
  Yale University Press.
  Establishes the formal framework of powers, duties, rights, and liabilities that underlies accountability structure.

- MASFT Study.
  "Why Do Multi-Agent LLM Systems Fail?" arXiv 2503.13657, March 2025.
  Empirical analysis of 14 failure modes in multi-agent coordination, with focus on misalignment and cascading error propagation.
