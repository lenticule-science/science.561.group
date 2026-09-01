---
type: morphism
class: contemporary
status: active
depends-on:
  - teaching/explanations/causal-discovery.md
  - ../objects/causal-graph.md
see-also: []
references:
  - references/peters-elementsbook2017.md
---

# Causal discovery algorithm

A **causal discovery algorithm** infers causal
structure (a causal graph or Markov equivalence class)
from observational and/or interventional data. The
canonical algorithms are PC, FCI, GES, NOTEARS, and
LiNGAM.

## Algorithm families

### Constraint-based

- **PC algorithm** (Spirtes et al.).
  - Test conditional independence systematically.
  - Start fully connected; remove edges where
    conditional independence holds.
  - Orient remaining edges by collider rules and
    propagation.
  - Output: Markov equivalence class.
- **FCI** (Spirtes et al.).
  - Extension handling unobserved confounders.
  - Output: PAG (partial ancestral graph).

### Score-based

- **GES (Greedy Equivalence Search).**
  - Search over Markov equivalence classes.
  - Forward phase: add edges if score improves.
  - Backward phase: remove edges if score improves.
  - Score: BIC, BDe, etc.
- **NOTEARS** (Zheng et al. 2018).
  - Continuous optimization over weighted adjacency
    matrices.
  - Acyclicity as smooth constraint
    ($\mathrm{tr}(e^{W \circ W}) = d$).
  - Enables gradient-based discovery.

### Functional / restricted

- **LiNGAM** (Shimizu et al.).
  - Linear non-Gaussian SEMs.
  - Identifiable via ICA on residuals.
  - Recovers full structure (not just MEC).
- **Additive noise models (ANM).**
  - $X_i = f_i(\mathrm{pa}_i) + U_i$ with non-linear
    $f_i$.
  - Cause-effect direction often identifiable.

### Interventional

- **Active causal discovery.** Choose interventions
  to maximize information gain.
- **Markov chain monte carlo over DAGs.** Bayesian
  posterior over structures with intervention data.
- Strong identifiability when interventions
  available.

## Workflow

A practical discovery workflow:

1. **Data preparation.** Variable selection,
   discretization, missingness handling.
2. **Algorithm selection.** Based on assumptions
   (linearity, confounding, intervention
   availability).
3. **Run algorithm.** Produce graph or MEC.
4. **Validate.** Domain-knowledge checks; sensitivity
   analysis.
5. **Use.** For identification, intervention design,
   etc.

Iteration is common; initial outputs prompt new data
collection.

## Failure modes

- **Faithfulness violations.** Independencies in
  data not implied by graph (perfect cancellations)
  produce wrong outputs.
- **Sample size.** Conditional independence tests
  are noisy at small samples.
- **Confounder violations.** Unobserved confounders
  break causal-sufficiency assumption.
- **Linearity violations.** Linear methods give
  wrong answers on non-linear data.
- **Hyperparameter sensitivity.** Discovery
  algorithms can be sensitive to thresholds and
  scoring choices.

## Empirical performance

- **Constraint-based.** Reliable when faithfulness
  holds and samples large.
- **Score-based.** Often more sample-efficient.
- **NOTEARS.** Scales well; quality varies.
- **Functional methods.** Strong when functional
  assumptions hold; brittle otherwise.

No universal best; choice depends on assumptions and
data regime.

## In contemporary AI

- **Causal discovery libraries.** causal-learn,
  pcalg, gCastle.
- **Differentiable discovery.** NOTEARS and
  successors enable end-to-end learning.
- **Causal foundation models.** Emerging research on
  using pre-trained models to assist discovery.
- **Multi-environment discovery.** Distribution shift
  across environments as identification signal
  (invariant causal prediction).

## Limits

- **Pure observation insufficient in general.**
  Either functional restrictions or interventions
  needed for full identification.
- **Computational hardness.** Exact methods don't
  scale; heuristic methods sacrifice optimality.
- **Assumption-dependence.** Outputs contingent on
  assumptions data cannot validate.
- **Markov equivalence ceiling.** Without functional
  assumptions, observational data identifies only
  the MEC.

## Status

Active research area with mature algorithmic
foundations. Practical use depends on domain
knowledge supporting assumptions. Continued
development on scaling, weakening assumptions, and
integrating with deep learning.
