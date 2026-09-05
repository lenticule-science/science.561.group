---
type: theorem
class: foundational
status: established
depends-on:
  - teaching/explanations/do-calculus.md
  - ../objects/intervention-distribution.md
see-also:
  - do-calculus-completeness.md
references:
  - references/pearl-causality2009.md
---

# Identifiability (Pearl)

## Statement

A causal effect $P(Y | \mathrm{do}(X))$ is
**identifiable** from observational distribution $P$
and causal graph $G$ if it can be uniquely computed
from $P$ and $G$ — equivalently, if any two SCMs
consistent with $G$ and $P$ produce the same
$P(Y | \mathrm{do}(X))$.

Pearl's program characterizes identifiability through
graph-theoretic conditions.

## Key results

**Backdoor criterion.** If a set $Z$ blocks all
backdoor paths from $X$ to $Y$ and contains no
descendants of $X$, then $P(Y | \mathrm{do}(X))$ is
identifiable via backdoor adjustment.

**Frontdoor criterion.** If a mediator $M$ satisfies
the frontdoor conditions, then $P(Y | \mathrm{do}(X))$
is identifiable via frontdoor adjustment.

**Do-calculus.** The three rules of do-calculus
exhaust the inference operations needed for
identification.

**Completeness (Shpitser-Pearl).** Do-calculus is
complete: identification exists iff do-calculus finds
it. See [do-calculus-completeness](do-calculus-completeness.md).

## What identifiability resolves

- **When is observational data sufficient?**
  Identifiability gives a precise answer.
- **What adjustments work?** Identifiability analysis
  identifies valid adjustment sets.
- **When are experiments necessary?** When
  identification fails, no observational analysis
  suffices.

## Worked condition: backdoor

**The backdoor criterion** for set $Z$ relative to
$(X, Y)$:

- No node in $Z$ is a descendant of $X$.
- $Z$ blocks every path between $X$ and $Y$ that
  contains an arrow into $X$.

Then:

$$P(Y | \mathrm{do}(X = x)) = \sum_z P(Y | X = x, Z =
z) P(Z = z)$$

The simplest and most-commonly-applied identification
result.

## Hedges and unidentifiability

When identification fails, it does so for a
graph-theoretic reason — a *hedge* structure
involving bidirected edges that obstructs all
identification routes.

Hedges characterize unidentifiability: a query is
unidentifiable iff its graph contains a relevant hedge.
This gives a concrete diagnostic for "why this query
can't be identified."

## Implications for practice

- **Use causal graphs to structure analyses.**
  Graphs make identifiability questions answerable.
- **Run identification check before estimation.**
  No point estimating if not identified.
- **Distinguish "don't know" from "can't know."**
  Identifiability says when more data won't help.
- **When unidentifiable, consider:**
  - Better measurement (observe a confounder).
  - Instrumental variables.
  - Sensitivity analysis (bound the effect).
  - Experiments.

## Implications for AI

- **Causal effect estimation in observational ML
  pipelines.** Identification analysis is a required
  first step.
- **Off-policy evaluation.** RL off-policy methods
  rest on identifiability of intervention
  distributions for new policies.
- **Causal foundation models.** Whether LLMs can
  perform identification analysis is an open
  question.

## Limits

- **Graph dependence.** Wrong graph yields wrong
  identifiability conclusion.
- **Causal sufficiency.** Standard results assume
  no unmodeled latent confounders.
- **Estimation gap.** Identifiability doesn't
  guarantee good finite-sample estimation.
- **Faithfulness.** Standard application assumes
  faithfulness of distribution to graph.

## Status

Foundational result. Combined with completeness,
provides a complete theoretical and algorithmic
treatment of identification under standard
assumptions.
