---
title: Syntax as Admissible Derivations
keywords:
  - syntax
  - derivation
  - flow
layer: internal-theorem
status: plan
depends_on:
  - step-trace
  - reduce
  - seed-evaluation-context
  - build-evaluation-context
---
# Syntax as Admissible Derivations

Given a chosen collection of acts witnessing step relations and context
manipulations, the relational calculus induces a **syntactic structure** whose
points are derivation steps and whose edges are the admissible flows between
them.

Concretely, fix a set of acts including:

- `StepTrace`, recording reduction/expansion steps along a trace,
- `Reduce`, generating primitive step witnesses, and
- `SeedEvaluationContext` and `BuildEvaluationContext`, extending local steps
  into whole-program contexts.

These acts determine:

- a graph of **derivations**, whose vertices are recognitions equipped with
  traces and whose edges are single-step witnesses from `Reduce` lifted into
  contexts, and
- a distinguished subgraph of **admissible derivations**, obtained by selecting
  exactly those steps the proof or runtime policy allows (for example, (beta)-steps
  but not (eta)-expansions, or only terminating rewrites).

The syntactic structure is this admissible-derivation graph: “syntactic
equality” and “syntactic legality” are always evaluated with respect to which
edges have been declared admissible. Changing syntax means changing the set of
allowed edges (acts or compositions) while leaving the underlying recognitions
and traces fixed.
