---
type: question
class: open
status: open
depends-on:
  - teaching/explanations/delegation-chain.md
  - ../theorems/delegation-does-not-transfer-accountability.md
  - ../theorems/accountability-chain-must-be-total.md
see-also:
  - ../objects/execution-trace.md
  - teaching/explanations/accountability-in-delegation-chains.md
  - ../texts/accountability-tracing-in-multi-agent-systems.md
references:
  - references/bovens2007.md
---

# How does accountability structure change for non-deterministic agents?

## Question

Traditional accountability structures in organizational theory assume that delegated parties are capable of following predictable procedures — what Bovens calls the "loyal agent" assumption.
LLM-based agentic systems are stochastic: the same input can produce different outputs.
How does the accountability structure change when the delegated agent is fundamentally non-deterministic?

## Background

The [delegation-does-not-transfer-accountability](../theorems/delegation-does-not-transfer-accountability.md) theorem holds regardless of the agent's internal behavior: the principal is accountable for outcomes in the delegated scope whether the agent behaved predictably or not.
Accountability attaches to the position (principal who deployed the system) rather than to the cause (agent's output).

However, the stochastic character of LLM agents creates challenges that deterministic agents do not pose:

**Predictability gap.** A principal who instructs a deterministic script can precisely predict what will happen.
A principal who deploys an LLM agent cannot: the agent may make different tool calls on different runs, produce different outputs for the same inputs, and behave differently under distributional shift (novel inputs unlike its training data).
The "loyal agent" assumption fails: the principal cannot verify in advance that the agent will do what is intended.

**Verification difficulty.** For deterministic agents, a principal can verify behavior by testing.
For stochastic agents, testing covers only the tested inputs; behavior on untested inputs is probabilistic, not guaranteed.
No finite test suite can verify an LLM agent's behavior on all possible inputs.

**Non-repeatable errors.** When a deterministic agent errs, the error can be reproduced and debugged.
When a stochastic agent errs, the error may not recur under identical conditions.
Accountability tracing must be based on the [execution trace](../objects/execution-trace.md) from the actual erroneous run, not from a reproduction.

## Proposed extensions

The [accountability-tracing](../texts/accountability-tracing-in-multi-agent-systems.md) text proposes three structural responses:

1. **Non-delegable duties.** For irreversible actions, the principal retains decision authority.
  The stochastic agent proposes; the human approves.
  This moves the stochastic step before the irreversible action rather than after.

2. **Bounded delegation with review.** The principal delegates actions within a scope but reviews outcomes before they propagate downstream.
  The review step provides a human check on the stochastic output before it becomes a commitment.

3. **Durable execution with checkpointing.** State is saved at every step.
  Stochastic failures are recoverable by resuming from the last good checkpoint; the trace provides full documentation of what the stochastic agent did.

## Open subquestions

1. **Does the non-transferability principle require modification?** The principle holds for stochastic agents as stated (accountability attaches to the principal).
  But is the practical accountability of a principal who deployed a system that cannot be fully tested meaningfully different from that of a principal who deployed a deterministic script?
  The principle's application may require different remedies even if the principle itself holds.

2. **Is there a due-diligence standard for stochastic delegation?** Traditional accountability frameworks assume principals can verify delegate behavior before delegation.
  For stochastic agents, what constitutes due diligence: testing on N representative inputs?
  Red-teaming?
  Formal uncertainty bounds?
  Can due diligence reduce (not eliminate) accountability exposure?

3. **How do regulatory frameworks (EU AI Act, US executive orders) treat stochastic non-determinism?** The EU AI Act requires high-risk AI systems to be predictable and accurate.
  Is an LLM-based agentic system with no deterministic output guarantee certifiable as high-risk?
  If not, what architectural changes would make it certifiable?

4. **Does stochastic non-determinism affect the total-accountability theorem?** The theorem requires that every outcome maps to exactly one principal.
  For stochastic agents, an outcome that occurs on 1% of runs may not be anticipatable.
  Is the principal accountable for an outcome that had a 1% probability of occurring?
  Is probability a relevant concept in accountability attribution?
