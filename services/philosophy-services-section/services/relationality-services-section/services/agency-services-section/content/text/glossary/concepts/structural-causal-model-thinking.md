---
type: concept
class: foundational
status: active
depends-on:
  - causal-reasoning.md
see-also:
  - ../objects/structural-equation.md
  - ../objects/causal-graph.md
references:
  - references/peters-elementsbook2017.md
title: Structural causal model thinking
description: "Structural causal model thinking is the conceptual stance of modeling systems as structural causal models (SCMs): collections of variables related by structural equations specifying how each variable is determined by its causes plus noise."
---

# Structural causal model thinking

**Structural causal model thinking** is the conceptual
stance of modeling systems as *structural causal
models* (SCMs): collections of variables related by
structural equations specifying how each variable is
determined by its causes plus noise. Adopting this
stance organizes causal questions in a precise,
manipulable formalism.

## What an SCM is

A structural causal model comprises:

- **Endogenous variables** $V = \{V_1, \ldots, V_n\}$:
  variables of interest.
- **Exogenous (noise) variables** $U = \{U_1, \ldots,
  U_n\}$: independent sources of variation.
- **Structural equations** $V_i := f_i(\mathrm{pa}(V_i),
  U_i)$: each $V_i$ is determined by its causal
  parents and its noise.
- **Distribution over noise** $P(U)$.

The structural equations are *asymmetric* — they
specify how each variable is *generated*, not just an
algebraic relationship. The asymmetry encodes
causality.

## Why "thinking in SCMs" matters

Adopting the SCM stance:

- **Forces clarity.** Causal claims become precise;
  hand-waving is exposed.
- **Distinguishes intervention from observation.**
  $\mathrm{do}(\cdot)$ has clear semantics in SCMs.
- **Supports counterfactual reasoning.** SCMs
  ground counterfactual evaluation.
- **Enables formal manipulation.** Do-calculus,
  identification analysis, and counterfactual
  inference all work over SCMs.

The shift from "X correlates with Y" to "X causes Y
because here is the structural equation" is the
substantive content of Pearl's program.

## SCMs and causal graphs

Every SCM induces a causal graph (DAG): edge $X \to Y$
iff $X \in \mathrm{pa}(Y)$ in the structural equations.

The graph captures structure; the equations add
*functional form*. Many results (identification,
do-calculus) work at the graph level — assuming SCM
exists with that graph but not requiring specific
functions. Other results (counterfactuals) need
functional information.

## SCMs and statistics

The relationship to statistics:

- **Observational distribution.** Determined by SCM
  + noise distribution.
- **Interventional distribution.** Determined by SCM
  with edges into intervened variable cut.
- **Counterfactual distribution.** Requires SCM-
  specific noise inference (abduction step).

Statistics typically works with observational
distributions; SCMs additionally support
interventional and counterfactual queries.

## Markov property and faithfulness

- **Markov property.** Variables are independent of
  non-descendants given parents in SCM. Standard
  consequence.
- **Faithfulness.** Statistical independencies
  exactly correspond to graph d-separations. Strong
  assumption underlying many identification results.

Markov is mild; faithfulness is more demanding and
sometimes violated (e.g., perfect linear
cancellations).

## In contemporary AI

- **Causal-aware ML.** Designing systems that respect
  causal structure (causal RL, causal representation
  learning).
- **Causal benchmarks.** Datasets with known causal
  structure for evaluating causal methods.
- **Causal abstraction.** Relating SCMs at different
  levels of detail (Beckers-Halpern; Geiger et al.
  on causal abstraction in NN interpretability).
- **Causal foundation models.** Treating LLM
  internal computations as approximate SCMs for
  interpretability.

## Limits

- **Untestable structure.** SCM structure (parent
  sets) often isn't learnable from data.
- **Functional-form assumptions.** Counterfactuals
  depend on functional forms that aren't pinned down
  by observations or interventions.
- **Composition.** Composing SCMs at different scales
  is non-trivial (causal abstraction).
- **Real-world fit.** Real systems are richer than any
  practical SCM; SCMs are approximations.

## Status

Foundational stance in causal AI. Standard pedagogical
framework. Necessary for technical engagement with
causal-effect identification, counterfactual
reasoning, and causal discovery.
