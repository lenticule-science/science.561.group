---
type: theorem
class: foundational
status: established
depends-on:
  - teaching/explanations/do-calculus.md
  - identifiability-pearl.md
see-also: []
references:
  - references/pearl-causality2009.md
---

# Do-calculus completeness

## Statement

**Do-calculus is complete for identifiability of
intervention distributions in semi-Markovian causal
models.** That is: an intervention distribution
$P(Y | \mathrm{do}(X))$ is identifiable from
observational distribution $P$ and causal graph $G$
*if and only if* there exists a sequence of
do-calculus rule applications that transforms the
former into a function of the latter.

Result due to Shpitser-Pearl (2006-2008) building on
Pearl's earlier identification theorems.

## Formal content

Given:

- A semi-Markovian causal graph $G$ (DAG with
  possibly bidirected edges representing latent
  confounders).
- An interventional query $P(Y | \mathrm{do}(X = x))$.

There exists an algorithm (the **ID algorithm**) that:

- Either produces an explicit identification formula
  expressing the query in terms of $P$.
- Or returns FAIL, in which case no identification
  exists from observational data alone.

The completeness claim: ID algorithm finds an
identification iff one exists.

## Why it matters

Before Shpitser-Pearl, identifiability was an open
question for many cases. The completeness result:

- **Closes the question.** Identifiability is
  algorithmically decidable.
- **Justifies do-calculus as the canonical inference
  system.** No additional rules needed for
  identification problems.
- **Enables tooling.** Implementations (causaleffect
  R package, DoWhy) can definitively report
  identifiable/not-identifiable status.

## Algorithmic implications

The ID algorithm operates on graph manipulations
guided by do-calculus rules. Worst-case complexity is
polynomial in graph size. Practical for graphs of
hundreds of nodes.

When the algorithm fails, it does so for a specific
*hedge* structure in the graph — a graph-theoretic
configuration that obstructs identification. Hedges
characterize unidentifiability.

## Variants and extensions

- **IDC algorithm.** Conditional intervention
  distributions $P(Y | \mathrm{do}(X), Z)$.
- **g-identifiability.** Identification under
  experimental data from a set of intervention
  variables.
- **Transportability.** Identification of effects
  from one population to another (Bareinboim-Pearl).
- **Counterfactual identifiability.** Stricter
  conditions; see counterfactual-specific results.

The completeness theorem extends to many of these
generalizations.

## Implications for AI

- **Causal-inference automation.** Any causal-effect
  identification question (under standard assumptions)
  is algorithmically resolvable.
- **Limits of observational data.** When ID returns
  FAIL, no further analysis of observational data
  helps; experiments or stronger assumptions needed.
- **Pipeline design.** Causal-inference pipelines
  can use ID as a check before estimation.

## Limits

- **Causal sufficiency.** Standard formulation
  assumes you've correctly modeled latent
  confounders.
- **Faithfulness.** Standard tools assume
  faithfulness of distribution to graph.
- **Counterfactuals.** Completeness statement is
  about interventions; counterfactual
  identifiability is more restrictive.
- **Estimation separate.** Identifiability is
  necessary for estimation but not sufficient (need
  enough data, etc.).

## Status

Foundational and definitive result. Standard content
in causal inference courses. Underlies modern
causal-inference toolchains.
