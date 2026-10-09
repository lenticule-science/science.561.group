---
type: object
class: foundational
status: active
depends-on: []
see-also:
  - causal-graph.md
  - teaching/explanations/structural-causal-model-thinking.md
references:
  - references/pearl-causality2009.md
title: Structural equation
description: where $\mathrm{pa}(Xi)$ are $Xi$'s causal parents, $Ui$ is exogenous noise, $fi$ is the structural function, and $:=$ denotes a generative assignment (not an equality).
---

# Structural equation

A **structural equation** has the form

$$X_i := f_i(\mathrm{pa}(X_i), U_i)$$

where $\mathrm{pa}(X_i)$ are $X_i$'s causal parents,
$U_i$ is exogenous noise, $f_i$ is the *structural
function*, and $:=$ denotes a *generative assignment*
(not an equality). The set of structural equations,
together with $P(U)$, constitutes a structural causal
model.

## The asymmetry

The notation $:=$ is critical:

- **Algebraic equality.** $X = f(Y, U)$ implies $Y =
  g(X, U)$ for some $g$ — symmetric.
- **Structural assignment.** $X := f(Y, U)$ specifies
  *generation*: given $Y$ and $U$, $X$ is determined.
  Asymmetric.

The asymmetry encodes causality. Reversing the
assignment (swapping LHS and RHS) generally produces a
different SCM with different intervention semantics.

## What they specify

Structural equations specify:

- **Causal mechanism.** *How* each variable is
  determined.
- **Functional form.** What mathematical relationship
  governs.
- **Stochasticity.** Through noise $U_i$.
- **Modularity.** Each equation describes one
  mechanism, replaceable independently.

This modularity is the basis for intervention: to
$\mathrm{do}(X = x)$, replace $X$'s equation with
$X := x$, leaving others intact.

## Functional restrictions

Equations may be:

- **Linear.** $X_i := \sum_j \alpha_{ij} \mathrm{pa}(X_i)_j
  + U_i$.
- **Linear non-Gaussian (LiNGAM).** Linear with
  non-Gaussian noise; identifiable by ICA.
- **Additive noise (ANM).** $X_i := f_i(\mathrm{pa}(X_i)) +
  U_i$ with non-linear $f_i$.
- **General non-parametric.** Arbitrary $f_i$.

Restriction trades expressiveness for identifiability.

## What's identifiable

From observational data:

- **Linear-Gaussian.** Markov equivalence class only.
- **LiNGAM.** Full structure identifiable.
- **Non-linear ANM.** Often identifiable.
- **General non-parametric.** Markov equivalence
  class only.

Functional restrictions help; they're often plausible
in practice.

## Counterfactuals require equations

Per [counterfactual-inference](counterfactual-inference.md):

- **Interventional queries** depend only on graph
  structure (under mild conditions).
- **Counterfactual queries** depend on the *specific
  functional form* of equations.

Two SCMs with the same graph but different functions
can give different counterfactual answers from the
same observed evidence.

## Estimation from data

- **Parametric.** Fit functions in restricted family
  (linear, GLMs).
- **Non-parametric.** Fit flexible functions
  (kernels, neural nets).
- **Discrete.** Conditional probability tables.

Estimation accuracy bounds counterfactual prediction
accuracy.

## Limits

- **Modularity assumption.** Independent
  manipulability of mechanisms is sometimes
  questioned (e.g., when "mechanisms" are intertwined
  in physics).
- **Noise distribution.** $P(U)$ is often unidentified
  from data; affects counterfactual conclusions.
- **Functional-form choice.** Often arbitrary;
  results depend on choice.
- **Real-world fit.** Real systems are richer than any
  practical SCM.

## Status

Foundational. Standard formal apparatus for causal
modeling. Necessary for counterfactual reasoning;
optional (graph alone often suffices) for
interventional reasoning.
