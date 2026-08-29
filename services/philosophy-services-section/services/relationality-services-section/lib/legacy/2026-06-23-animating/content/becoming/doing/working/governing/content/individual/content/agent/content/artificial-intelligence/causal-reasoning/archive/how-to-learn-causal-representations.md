---
type: question
status: open
references:
  - references/scholkopf-towards-causal-rl2021.md
  - references/scholkopf-toward-causal2022.md
---

# How to learn causal representations?

## The question

Causal representation learning aims to learn
representations whose components are *causal factors*
— manipulable, intervention-stable, transferable.
This is technically hard. *How* should we approach
it?

## Why it's hard

- **Identifiability.** Pure unsupervised
  disentanglement is unidentifiable (Locatello et
  al. 2019). Multiple representations are
  consistent with the same data.
- **No causal labels.** Real datasets don't come
  with "this is the causal factor" labels.
- **Functional-form assumptions.** Identifiability
  results require functional restrictions that may
  not hold.
- **Scale.** Most causal-representation work is at
  small scale; scaling is open.

## Current approaches

- **Auxiliary supervision.** iVAE-style: assume
  observed auxiliary variable indexing causal
  factor distribution; identifiable under
  conditions.
- **Multi-environment.** Train across distinct
  environments; force features to be invariant
  (IRM); causal features should be invariant.
- **Time-series structure.** Use temporal structure
  (causal factors should evolve coherently in
  time).
- **Interventional data.** Direct interventions on
  latent causes provide identification signal.
- **Contrastive learning.** Some contrastive
  methods provably learn causal-related
  representations under structure.
- **Causal generative models.** Combine generative
  models with causal structure assumptions.

## What's been shown

- **iVAE (Khemakhem et al. 2020).** Identifiability
  with auxiliary variables.
- **Locatello et al. 2019, 2020.** Limits and
  feasibility of disentanglement.
- **IRM and its critiques.** IRM works in some
  cases, fails in others; current state is
  empirical.
- **Causal RL benchmarks.** Causal-aware methods
  outperform on transfer benchmarks; integration
  with deep learning improving.

## Open challenges

- **Without supervision.** Can causal
  representations be learned from purely
  observational data?
- **At scale.** Methods that work on toy benchmarks
  often don't scale.
- **In continuous spaces.** Most theory is for
  discrete or low-dimensional latents.
- **Robustness.** When does causal representation
  *actually* improve robustness vs theoretical
  promise?

## Why it matters

- **Robustness.** Causal representations should
  transfer across distribution shift.
- **Counterfactual reasoning.** Need causal
  representations to evaluate counterfactuals over
  features.
- **Agent action.** Agents need causal
  representations to reason about effects of their
  own actions.
- **Interpretability.** Causal representations are
  more interpretable than spurious features.

## What might resolve it

- **Stronger identifiability theory.** Under what
  realistic-data conditions does causal
  representation become identifiable?
- **Algorithms that exploit identifiability
  conditions.** When auxiliary information,
  multi-environment data, or interventions are
  available, exploit them maximally.
- **Hybrid systems.** Combine learned
  representations with explicit causal structure
  (graphs, SCMs).
- **Empirical clarification.** When does causal
  representation actually help downstream tasks
  vs not?

## Status

Active research with growing theoretical foundation.
Practical impact still limited. Key direction for
the next phase of integrating causality with deep
learning.
