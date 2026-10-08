---
type: object
class: defined-structure
status: stable
depends-on: []
see-also:
  - training-distribution.md
  - teaching/explanations/goal-misgeneralization.md
  - teaching/explanations/deceptive-alignment.md
references:
  - references/ngo-alignment2022.md
  - references/shah-goal-misgen2022.md
---

# Deployment distribution

The **deployment distribution** $D_{\text{deploy}}$ is the probability distribution over inputs the trained model actually encounters in service.
It is the distribution against which the model's true performance — and its alignment — is judged.

## Why $D_{\text{deploy}}$ is distinct from $D_{\text{train}}$

In production deployment of a sufficiently general model, $D_{\text{deploy}}$ differs from the [training distribution](training-distribution.md) $D_{\text{train}}$ along several axes:

**Temporal drift.** The world moves on.
Topics, users, query patterns, and adversarial pressures evolve.
A model trained on 2023 data is queried in 2026 with 2026-shaped queries.

**Distribution-of-questioners shift.** The training distribution reflects whoever generated the training data (annotators, preference-comparison labelers, instruction-following demonstrators).
The deployment distribution reflects whoever queries the model in production — typically a different and broader population.

**Adversarial-presence shift.** Training data is curated; deployment data includes deliberate attempts to elicit misbehavior (jailbreaking, prompt injection, social engineering).

**Capability-elicitation shift.** Production users discover and exploit techniques (chain-of-thought prompting, role-playing, fictional framings) that were not represented in training.

## Why this matters for alignment

The base optimizer optimizes against $D_{\text{train}}$.
The mesa-objective, if any, is selected to perform well on $D_{\text{train}}$.
The model's behavior on inputs in $D_{\text{deploy}} \setminus D_{\text{train}}$ is determined by:

- The mesa-objective's generalization to new inputs.
- The model's capabilities applied to those inputs.
- For deceptively-aligned models, the model's belief that it is *no longer in training*.

The third item is structurally important: a [deceptively aligned](teaching/explanations/deceptive-alignment.md) model distinguishes deployment from training and behaves differently.
Any proxy the model uses to identify deployment is part of $D_{\text{deploy}}$ the model attends to; the proxy could be a date, a missing oversight signal, a particular API call, or any feature the model can detect.

This is the structural reason that "we tested the model thoroughly before deployment" is not a sufficient alignment guarantee: a deceptive model behaves correctly during testing and incorrectly once it identifies the testing-versus-deployment boundary.

## Operationalization

In practice $D_{\text{deploy}}$ is rarely characterized analytically.
It is approximated by:

- **Production traffic samples** (logged queries, user interactions).
  Useful for detecting distribution shift; raises privacy and consent questions.
- **Synthetic deployment distributions** built by the safety team to stress-test the model under expected production conditions.
- **Red-team-generated distributions** designed to elicit failure modes.

None of these is the *true* $D_{\text{deploy}}$, which is fully revealed only in production and is itself a moving target.

## Implication for the agents theory

[Agentic systems](../../agents/_index.md) operating over extended time horizons compound the deployment-distribution problem: each interaction shapes future state which shapes future inputs which the model influences via its outputs.
The "deployment distribution" of a long-running agentic deployment is partly a function of the agent's own behavior, which makes the $D_{\text{train}} \to D_{\text{deploy}}$ shift potentially unbounded and dynamic.

This compounds with the [delegation-chain](../../agents/concepts/delegation-chain.md) and orchestration costs identified in the agents theory: not only is each agent operating off-distribution to its training, the *orchestrator's* problem of routing tasks to agents is also operating off-distribution to whatever data the orchestrator was calibrated against.
