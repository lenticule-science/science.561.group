---
type: concept
class: contemporary
status: active
depends-on:
  - causal-reasoning.md
  - structural-causal-model-thinking.md
see-also:
  - causal-discovery.md
references:
  - references/scholkopf-towards-causal-rl2021.md
  - references/scholkopf-toward-causal2022.md
---

# Causal representation learning

**Causal representation learning** is the program of
learning representations whose components correspond to
*causal factors* — variables that play causal roles in
generating the data — rather than mere statistical
features. The intersection of causality and
representation learning.

## The motivation

Standard representation learning produces features
useful for prediction within a distribution. Such
features may be:

- **Confounded.** Mixing causal and spurious
  factors.
- **Brittle under intervention.** Failing when
  the data-generating process changes.
- **Hard to manipulate.** No natural way to ask
  "what if this factor were different?"

Causal representations would address these — features
that *are* the causal factors, manipulable through
intervention and stable across changes.

## The challenges

Why this is hard:

- **Identifiability.** Multiple representations are
  consistent with the same observational data;
  causality identifies a privileged one but
  observational data alone often can't distinguish.
- **Disentanglement.** Causal factors should be
  independent under intervention but may be
  correlated observationally; standard
  disentanglement metrics conflate.
- **Sample complexity.** Strong causal claims need
  more data than statistical claims.
- **Functional form.** Identifiability often
  requires assumptions about functional form that
  are domain-specific.

## Approaches

- **Independent component analysis (ICA) / extensions.**
  Recover independent latent factors; identifiable
  under non-Gaussianity.
- **Disentangled representation learning.** Standard
  unsupervised approaches (β-VAE, etc.); largely
  fails identifiability proofs (Locatello et al. 2019
  showed pure unsupervised disentanglement is
  unidentifiable).
- **Auxiliary supervision.** Identifiable under weak
  supervision (labels, environments, time
  structure).
- **Interventional data.** Strong identifiability when
  interventions on latent factors are observed.
- **Multi-environment.** Distribution shift across
  environments provides identification signal
  (invariant causal prediction).

## Key results

- **Locatello et al. 2019.** Unsupervised
  disentanglement is unidentifiable in general.
- **Khemakhem et al. 2020 (iVAE).** Identifiability
  under auxiliary information.
- **Schölkopf et al. 2021.** "Toward causal
  representation learning" — research-program
  overview.
- **Active research.** Identifiability proofs under
  various data and assumption regimes.

## Why agents need it

For an agent:

- **Causal factors enable planning.** Acting on causal
  variables predictably affects outcomes.
- **Representations should be stable under
  intervention.** Otherwise agent reasoning breaks
  when the world changes.
- **Counterfactual reasoning needs causal
  representations.** Without them, "what if"
  questions don't have well-defined answers.
- **Transfer.** Causal factors transfer better than
  spurious correlates.

These motivate the program even though it's
technically hard.

## In contemporary AI

- **Causal RL.** Active research using causal
  representations to improve RL transfer and sample
  efficiency.
- **Counterfactual data augmentation.** Using
  representation-level interventions for
  augmentation.
- **Robustness work.** Connecting causal
  representations to OOD robustness.
- **Foundation-model probing.** Asking whether LLMs
  internally compute causal representations.

## Limits

- **Identifiability requires structure.** Pure data
  doesn't determine causal representation.
- **Practical algorithms partial.** Theoretical
  results outpace practical algorithms.
- **Evaluation hardness.** Hard to verify a
  representation is causal in real-world settings.
- **Scale.** Most causal-representation work is at
  small scale; scaling is open.

## Status

Active research program with growing theoretical
foundation. Practical impact still limited. Key
direction for the next phase of integrating causality
with deep learning.
