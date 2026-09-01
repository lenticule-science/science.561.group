---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/embedded-agency.md
  - teaching/explanations/reflective-stability.md
see-also:
  - reflection.md
  - ../theorems/reflective-stability-impossibility-loeb.md
references:
  - references/soares-fallenstein2015.md
---

# Self-modification

**Self-modification** is an agent action that alters the agent's own future decision procedure, beliefs, or values.
It is a special kind of action available only to [embedded-agency](teaching/explanations/embedded-agency.md).

## Three forms

- **Belief modification.** The agent updates its beliefs in ways that go beyond Bayesian conditioning — for instance, by deliberately exposing itself to evidence, by self-deceptive rationalization, or by adopting a new prior.
- **Procedure modification.** The agent rewrites its own decision procedure — switching from CDT to FDT, switching from MCTS to A*, replacing its planning module with a new one.
- **Value modification.** The agent changes what it values — most controversially, its terminal goals.
  This is the failure case for reflective stability.

## When an agent will self-modify

A rational agent will self-modify when it expects the modified self to take actions that score *higher by current values* than the unmodified self would.
Three scenarios:

- **Capability improvement.** The modified self pursues current values more competently.
  The agent welcomes this.
- **Value drift.** The modified self pursues different values.
  Whether the agent welcomes this depends on whether the current values endorse the change.
  Typically they do not, by conservation-of-expected-utility arguments (any change in values that the current self could endorse would already be reflected in the current values).
- **Bargained modification.** The agent modifies itself as part of a coordination scheme with another agent — for instance, committing to a strategy that the agent would not follow without commitment.

## The Omohundro convergent drives

Omohundro (2008) argued that agents with a wide range of goals will exhibit convergent instrumental drives toward self-improvement (which subsumes self-modification toward greater capability) and self-preservation (which obstructs modifications that change values).

This makes value-preservation a default disposition for AI systems — and thus motivates the alignment problem of how to get an agent to *accept* value-modifying corrections from its operators.
See [corrigibility-capability-tension](../../alignment/theorems/corrigibility-capability-tension.md).

## The Loebian obstacle

Self-modification toward a *more capable* successor runs into the Loebian obstacle: the agent cannot prove the successor is sound under the same logical system both inhabit.
See [reflective-stability-impossibility-loeb](../theorems/reflective-stability-impossibility-loeb.md) and [vingean-reflection](teaching/explanations/vingean-reflection.md).

## In contemporary AI

Operationally, current AI agents undergo self-modification in a weak sense:

- **In-context learning** modifies the agent's effective policy for the duration of the context.
- **Fine-tuning by RLHF or DPO** modifies the model weights.
- **Tool selection and prompt scaffolding** can be performed by the agent itself, modifying its own deliberation pipeline.

None of these is full source-level self-modification.
The agent-foundations questions become operative when AI systems become capable of, and are given the affordance for, modifying their own training pipelines, weights, or scaffolds.
