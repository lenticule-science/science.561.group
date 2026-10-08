---
type: concept
class: contemporary
status: active
depends-on:
  - causal-reasoning.md
  - structural-causal-model-thinking.md
see-also:
  - ../morphisms/causal-discovery-algorithm.md
  - ../objects/causal-graph.md
references:
  - references/peters-elementsbook2017.md
title: Causal discovery
description: Causal discovery is the inference of causal structure from data.
---

# Causal discovery

**Causal discovery** is the inference of causal
structure from data. Given observations (and possibly
interventions), recover the causal graph or structural
causal model that generated the data.

## Why it's hard

The fundamental challenge:

- **Multiple causal models can produce the same
  observational distribution.** Markov equivalence
  classes group causally distinct models with
  identical observational implications.
- **Confounders mask causal links.** Unobserved
  confounders create spurious associations.
- **Pure observation underdetermines structure.**
  Often interventional data is needed for
  unambiguous discovery.
- **Scale.** Search over DAGs is super-exponential.

Causal discovery from observational data alone is
*generally not possible* without assumptions.

## Approaches

### Constraint-based

- **PC algorithm.** Test conditional independence;
  prune edges; orient by collider/non-collider rules.
- **FCI.** Extension handling latent confounders.
- **Recovers the Markov equivalence class.** Cannot
  resolve all directions from observational data.

### Score-based

- **GES (Greedy Equivalence Search).** Search over
  Markov equivalence classes; score by likelihood
  + complexity penalty.
- **NOTEARS.** Continuous optimization formulation
  (Zheng et al. 2018); enabled scaling to many
  variables.
- Resolves orientations within MEC by score.

### Functional

- **LiNGAM.** Linear non-Gaussian additive noise
  models; identifiability through non-Gaussianity.
- **ANM (Additive Noise Models).** Non-linear
  identification under additive noise.
- Resolves Markov equivalence by exploiting
  functional asymmetries.

### Interventional

- **Interventional discovery.** When experiments are
  available, identification is much stronger.
- **Active causal learning.** Choose interventions
  to maximize information gain.

## Key results

- **Markov equivalence.** Observational data
  identifies only the equivalence class, not the
  specific DAG.
- **Faithfulness assumption.** Standard discovery
  algorithms assume independencies in the
  distribution exactly match graph d-separations.
  Violations break recovery.
- **Causal sufficiency.** Standard algorithms assume
  no unobserved confounders. FCI relaxes this with
  cost.
- **Identifiability under functional restrictions.**
  Non-Gaussianity, non-linearity with additive noise,
  and other functional restrictions enable
  identification beyond MEC.

## In contemporary AI

- **Genomics.** Causal discovery for gene regulatory
  networks.
- **Economics.** Discovery of causal economic
  relationships from observational data.
- **Neuroscience.** Functional connectivity from
  fMRI / spike data.
- **Differentiable causal discovery.** ML-style
  discovery (NOTEARS and successors).
- **Causal foundation models.** Emerging research
  on using pre-trained models for discovery.

## Failure modes

- **Confounder violations.** Unobserved confounders
  break causal-sufficiency assumption.
- **Faithfulness violations.** Distributions can
  encode independencies not implied by the graph
  (e.g., perfect cancellations).
- **Sample complexity.** Conditional independence
  tests are noisy in small samples.
- **Scale.** Exact methods don't scale; heuristic
  methods sacrifice optimality.

## Limits

- **Pure observation doesn't suffice in general.**
  Either functional restrictions or interventions
  needed.
- **Computational hardness.** General DAG search is
  super-exponential; even MEC search is hard.
- **Assumption-dependence.** Discovery results are
  contingent on assumptions that data cannot
  validate.
- **Composition.** Discovered local structures don't
  always combine cleanly into global models.

## Status

Active research area. Practical use in domains where
domain knowledge supports the assumptions
(genomics, economics with strong theory). Emerging
work on integrating causal discovery with deep
learning.
