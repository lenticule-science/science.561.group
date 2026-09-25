---
type: object
class: foundational
status: active
depends-on: []
see-also:
  - structural-equation.md
  - teaching/explanations/structural-causal-model-thinking.md
references:
  - references/pearl-causality2009.md
title: Causal graph
description: "A causal graph is a directed acyclic graph (DAG) whose nodes are variables and whose edges represent direct causal influence: $X \\to Y$ means \"$X$ is a direct cause of $Y$.\""
---

# Causal graph

A **causal graph** is a directed acyclic graph (DAG)
whose nodes are variables and whose edges represent
*direct causal influence*: $X \to Y$ means "$X$ is a
direct cause of $Y$."

## Structural meaning

The graph encodes:

- **Direct causes.** $\mathrm{pa}(Y)$ is the set of
  direct causes of $Y$.
- **Causal paths.** Directed paths represent chains
  of causal influence.
- **Backdoor paths.** Paths starting with $\to X$
  (i.e., into $X$); represent confounding routes
  between $X$ and $Y$.
- **Colliders.** Nodes with two arrows in
  ($X \to Z \leftarrow Y$); $Z$ is a collider on
  this path.

These graph-theoretic features control identifiability
and adjustment.

## Markov property and d-separation

A causal graph induces:

- **Markov factorization.** $P(V) = \prod_i P(V_i |
  \mathrm{pa}(V_i))$.
- **D-separation.** Graph criterion characterizing
  conditional independencies implied by the
  factorization.
- **Faithfulness.** Assumption that conditional
  independencies in $P$ correspond exactly to
  d-separations in the graph.

Together these connect graph structure to statistical
behavior.

## Variants

- **DAGs.** Standard; no cycles.
- **Maximal ancestral graphs (MAGs).** Allow
  representation of unobserved confounders.
- **Partial ancestral graphs (PAGs).** Markov
  equivalence class representations.
- **Cyclic causal graphs.** Some work allows feedback
  cycles; less developed.
- **Causal graphs with selection bias.** Account for
  selection.

The basic DAG is the standard starting point.

## Causal graphs vs Bayesian networks

A causal graph and a Bayesian network can have the same
structure but differ in interpretation:

- **Bayesian network.** Encodes a factorization of
  joint distribution; edges are conditional dependence.
- **Causal graph.** Edges are causal influence;
  factorization holds but additionally supports
  intervention semantics.

Same syntax, different semantics. Pearl's structural
account makes the causal interpretation primary.

## Where causal graphs come from

Three sources:

- **Domain knowledge.** Expert specification.
- **Causal discovery.** Inferred from data.
- **Mixed.** Some structure from theory; rest
  inferred.

In practice, causal graphs are usually mixed
constructions; pure data-driven discovery is hard.

## Operations on graphs

- **Edge surgery.** Cut edges to model
  intervention ($G_{\overline{X}}$).
- **Backdoor identification.** Find sets blocking
  backdoor paths.
- **D-separation tests.** Check conditional
  independence implications.
- **Equivalence-class manipulation.** Work with
  Markov equivalence classes when individual graphs
  not identified.

## Limits

- **Acyclicity assumption.** Real systems often have
  feedback; DAG approximation may distort.
- **No-hidden-confounder assumption.** Often
  violated in real data; latent confounders need
  MAG treatment.
- **Functional form absent.** Graph encodes
  structure but not functional relationships.
- **Unique-graph assumption.** Real systems may not
  have a single privileged causal graph (depends on
  variable choice).

## Status

Foundational object. Standard pedagogical and
analytical tool. Standard input format for causal
inference algorithms.
