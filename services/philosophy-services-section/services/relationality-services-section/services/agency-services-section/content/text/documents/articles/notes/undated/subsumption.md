---
type: morphism
class: foundational
status: active
depends-on:
  - ../objects/owl-axiom.md
  - teaching/explanations/description-logic.md
see-also:
  - entailment.md
references:
  - references/baader-dlhandbook2003.md
title: Subsumption
description: "Subsumption is the inference operation determining whether one class is a subclass of another: given knowledge base $K$ and classes $C, D$, is $C \\sqsubseteq D$ entailed?"
---

# Subsumption

**Subsumption** is the inference operation
determining whether one class is a *subclass* of
another: given knowledge base $K$ and classes $C, D$,
is $C \sqsubseteq D$ entailed?

## Why it matters

Subsumption is the *defining* inference task of
description logics. Most other DL inferences (
classification, instance checking, query answering)
reduce to subsumption checking.

## What it captures

A subsumption $C \sqsubseteq D$ asserts:

- Every individual in class $C$ is also in class
  $D$.
- Equivalently: $C$'s instances are a subset of $D$'s
  instances.
- Across *all* models satisfying the knowledge base.

This is a *necessary* relationship — true in every
model — not just empirical.

## Computing subsumption

Subsumption can be:

- **Asserted directly.** $C \sqsubseteq D$ in the
  knowledge base.
- **Derived through transitive closure.** $C
  \sqsubseteq D$ and $D \sqsubseteq E$ imply $C
  \sqsubseteq E$.
- **Derived through axiom chains.** Combining
  multiple axioms.
- **Derived through definitional unfolding.** If
  $C \equiv D \sqcap E$ and we can show $D \sqcap E
  \sqsubseteq F$, then $C \sqsubseteq F$.

Modern DL reasoners use *tableaux* algorithms or
*saturation* methods that systematically derive
subsumption.

## Classification

The full set of subsumption relations is the
*classification*. Computing classification yields:

- Hierarchy of all named classes.
- Detection of cycles (equivalent classes).
- Detection of unsatisfiable classes (subsumed by
  $\bot$).
- Foundation for query answering.

Classification is the standard DL preprocessing step.

## Complexity

- **EL family.** Polynomial-time subsumption.
- **$\mathcal{ALC}$.** ExpTime-complete.
- **$\mathcal{SHIQ}$.** ExpTime-complete.
- **$\mathcal{SROIQ}$ (OWL 2 DL).** N2ExpTime-complete.

For practical ontologies, real reasoners are typically
much faster than worst case.

## Examples

```
Mother ≡ Female ⊓ ∃hasChild.Person
Female ⊑ Person
```

Subsumption queries:

- $\text{Mother} \sqsubseteq \text{Female}$? Yes
  (from definition).
- $\text{Mother} \sqsubseteq \text{Person}$? Yes
  (from Mother ⊑ Female and Female ⊑ Person).
- $\text{Mother} \sqsubseteq \exists\text{hasChild}.\text{Person}$?
  Yes (from definition).

These follow from the axioms; a DL reasoner derives
them automatically.

## In contemporary AI

- **Ontology classification** is a standard
  ontology-engineering operation.
- **Schema integration** uses subsumption to align
  ontologies.
- **Semantic search.** Subsumption-aware queries
  return instances of subclasses.
- **LLM-DL hybrids.** Active research using LLMs to
  suggest subsumption axioms; verifying with
  reasoners.

## Limits

- **Worst-case complexity.** High; requires careful
  ontology design.
- **Faithfulness.** Subsumption only as good as
  ontology axioms.
- **OWA.** Subsumption is open-world; what's not
  explicitly subsumed may still be subsumed under
  additional information.
- **Empirical vs necessary.** Subsumption is
  necessary; statistical regularities are something
  else.

## Status

Foundational inference. Standard DL operation.
Production deployment via reasoners.
