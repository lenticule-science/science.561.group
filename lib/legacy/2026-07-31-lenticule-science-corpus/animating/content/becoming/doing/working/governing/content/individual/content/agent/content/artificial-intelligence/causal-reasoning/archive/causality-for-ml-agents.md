---
type: narrative
status: active
references:
  - ../references/scholkopf-towards-causal-rl2021.md
  - ../references/scholkopf-toward-causal2022.md
  - ../references/bareinboim-causalai2020.md
---

# Causality for ML agents

ML and causality have largely run on parallel tracks.
ML built impressive predictive systems — image
classifiers, language models, game-playing agents —
on the back of correlational learning. Causality
built rigorous frameworks for inference under
intervention, mostly without ML. The two worlds
talked past each other.

But for *agents* — systems that *act* in the world —
this separation breaks down.

## Why agents need causality

An agent that takes action $a$ to influence outcome
$y$ needs to know $P(y | \mathrm{do}(a))$ — the
intervention distribution — not $P(y | a)$ from data.

These differ when:

- **Confounders link action to outcome in data.**
  Past action $a$ and outcome $y$ may both be caused
  by some unobserved factor.
- **Distribution shifts under intervention.** The
  agent's intervention may move the system out of
  the training distribution.
- **The agent's policy itself confounds.** Past data
  reflects past policy; that policy is a confounder
  for new actions.

A purely correlational agent will systematically
mispredict effects of its own actions.

## Causal RL

The synthesis is **causal reinforcement learning**.
Key directions:

- **Causal off-policy evaluation.** Predict outcomes
  of new policies from data collected under old
  policies; standard RL methods are causal under
  the hood.
- **Sample-efficient transfer.** Causal models
  enable transfer to new environments by reasoning
  about what changes (interventions) and what
  doesn't (mechanisms).
- **Counterfactual policy evaluation.** Reason
  about what trajectory would have occurred under
  alternative policies.
- **Causal discovery in RL.** Learn the causal
  structure of the environment; use it for planning.

These are potential research directions; integration
with deep RL is in progress.

## Causal foundation models

A more speculative direction: **foundation models
that reason causally**. Possible flavors:

- **Causality from text.** Pre-train on text that
  describes causal relationships; hope the model
  learns causal patterns.
- **Causal scaffolding.** Augment models with
  explicit causal modules (graph extractors, do-
  calculus checkers).
- **Multi-environment training.** Train on data from
  many environments; force the model to learn
  invariants (which are good candidates for causal
  factors).
- **Active interventions during training.** RLHF and
  similar give models intervention experience.

Whether any of this produces models that genuinely
*reason* causally — vs producing causal-sounding
text — is contested.

## Robustness via causality

Closely related: **causal interventions for
robustness**. The idea:

- ML models trained on observational data overfit to
  spurious correlations.
- Robust models would rely on *causal* features.
- Causal representation learning aims to extract
  features that correspond to causal factors and are
  therefore stable under intervention.

Practical methods include:

- **Invariant Risk Minimization (IRM).** Train across
  multiple environments; penalize features whose
  predictive power varies (signaling spurious
  correlation).
- **Causal data augmentation.** Generate
  intervention-style examples to train robust
  models.
- **Counterfactual data.** Use counterfactual
  augmentation to test and improve robustness.

Empirical results are mixed; causal robustness is a
direction more than a settled solution.

## Causality in interpretability

Mechanistic interpretability uses causal language
even when it doesn't use Pearl's formalism:

- **Activation patching.** Intervene on internal
  activations and observe behavioral effects —
  literal interventions on a neural network's
  computation.
- **Causal abstraction.** Relating
  high-level conceptual descriptions to low-level
  network computations as causal abstractions.
- **Circuit-level intervention.** Identify and
  intervene on specific computational circuits.

This is causality applied to *the model itself*, not
just the world the model models.

## Limits

The integration is still partial:

- **Theoretical-empirical gap.** Causal theory has
  strong results; practical algorithms lag.
- **Identifiability.** Many causal questions aren't
  identifiable in agent-relevant settings.
- **Discovery.** Learning causal structure of
  complex environments is hard.
- **Foundation-model integration.** Whether and how
  large pre-trained models do causal reasoning is
  unsettled.

## Where this goes

The trajectory:

- **Short-term.** Causal methods integrated into
  specific ML pipelines (off-policy evaluation,
  fairness, robustness).
- **Medium-term.** Causal representation learning
  matures; foundation-model causal capability becomes
  measurable.
- **Long-term.** Synthesis where ML systems do
  appropriate causal reasoning natively for their
  agent contexts.

The agent setting forces the issue: you cannot avoid
causality if you're acting on the world. ML and
causality must converge.
