---
type: concept
class: foundational
status: active
depends-on:
  - intervention.md
  - ../objects/causal-graph.md
see-also:
  - ../morphisms/do-operator.md
  - ../theorems/do-calculus-completeness.md
references:
  - references/pearl-causality2009.md
title: Do-calculus
description: Do-calculus is Pearl's set of inference rules for manipulating expressions involving the do-operator $\mathrm{do}(\cdot)$.
---

# Do-calculus

**Do-calculus** is Pearl's set of inference rules for
manipulating expressions involving the do-operator
$\mathrm{do}(\cdot)$. Given a causal graph and
observational distribution, do-calculus provides the
syntactic machinery to determine when interventional
distributions $P(Y | \mathrm{do}(X))$ are
*identifiable* from observational $P$ and how to
compute them.

## The three rules

Given graph $G$ with variables, do-calculus
manipulates conditional probability expressions
involving $\mathrm{do}(\cdot)$:

**Rule 1 — Insertion/deletion of observations.**

$$P(y | \mathrm{do}(x), z, w) = P(y | \mathrm{do}(x), w)$$

if $Y \perp Z | X, W$ in graph $G_{\overline{X}}$
(graph with edges *into* $X$ deleted).

**Rule 2 — Action/observation exchange.**

$$P(y | \mathrm{do}(x), \mathrm{do}(z), w) = P(y | \mathrm{do}(x), z, w)$$

if $Y \perp Z | X, W$ in graph
$G_{\overline{X}\underline{Z}}$ (delete edges into X
and edges out of Z).

**Rule 3 — Insertion/deletion of actions.**

$$P(y | \mathrm{do}(x), \mathrm{do}(z), w) = P(y | \mathrm{do}(x), w)$$

if $Y \perp Z | X, W$ in graph $G_{\overline{X}\overline{Z(W)}}$
(specific surgery rule).

The rules look complex; their content is: "under such-
and-such graph-theoretic conditions, do-expressions
can be simplified to ordinary observational
expressions."

## What they enable

Iterative application of the rules can transform
$P(Y | \mathrm{do}(X))$ — initially containing
intervention notation — into an expression containing
only observational $P$.

When this transformation succeeds, the intervention
distribution is *identifiable* from observational data.
When it doesn't, the intervention distribution is
*not* identifiable from observational data alone (an
experiment or stronger assumptions are needed).

## Completeness

Per [do-calculus-completeness](../../documents/articles/notes/undated/do-calculus-completeness.md)
(Shpitser-Pearl 2006-2008): do-calculus is *complete*
for identifiability in semi-Markovian causal models.
That is: if a causal effect is identifiable, do-
calculus will find an identification.

This is a striking result — the three rules suffice
for the entire identification problem under standard
assumptions.

## Standard identification corollaries

The three rules immediately imply:

- **Backdoor adjustment.** Adjust for a set blocking
  all backdoor paths.
- **Frontdoor adjustment.** Adjust through a
  mediator when no backdoor adjustment available.
- **IDC algorithm.** Algorithmic procedure for
  identifying $P(Y | \mathrm{do}(X), Z)$ via do-
  calculus search.

These derived results often appear in applications
without explicit do-calculus invocation.

## Worked example

Consider $X \to M \to Y$ with confounder $U$ on
$X, Y$ but not $M$ (frontdoor structure):

- Backdoor adjustment fails (cannot adjust for
  unobserved $U$).
- Frontdoor adjustment via $M$ succeeds:
  $P(Y | \mathrm{do}(X)) = \sum_m P(M = m | X)
  \sum_{x'} P(Y | M = m, X = x') P(X = x')$
- This formula is derived through do-calculus
  applications.

## In contemporary practice

- **Identifiability checking.** Implementations
  (DoWhy, R causaleffect package) automate do-
  calculus identification.
- **Causal-effect estimation.** Once identified,
  effects estimated using standard statistical tools.
- **Sensitivity analysis.** When identification
  fails, do-calculus quantifies what additional
  assumptions would suffice.

## Limits

- **Identification, not estimation.** Do-calculus
  shows *whether* effects are identifiable; estimation
  from finite samples is separate.
- **Causal-graph dependence.** Requires knowing the
  causal graph; if graph is wrong, identification is
  wrong.
- **Faithfulness assumption.** Standard application
  assumes faithfulness.
- **Not for counterfactuals.** Do-calculus addresses
  interventional, not counterfactual, queries.

## Status

Foundational and complete (under stated assumptions).
Standard tool in causal inference. Implementations
available in practical libraries. The theoretical
high-water mark of Pearl's program.
