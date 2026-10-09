---
type: morphism
class: foundational
status: active
depends-on: []
see-also:
  - subsumption.md
  - ../theorems/tarski-truth-conditions.md
references:
  - references/brachman-levesque-kr2004.md
title: Entailment
description: "Entailment is the central inference relation in formal knowledge representation: knowledge base $K$ entails statement $\\phi$ ($K \\models \\phi$) if $\\phi$ is true in every model of $K$."
---

# Entailment

**Entailment** is the central inference relation in
formal knowledge representation: knowledge base $K$
*entails* statement $\phi$ ($K \models \phi$) if
$\phi$ is true in every model of $K$.

## The model-theoretic definition

Per Tarski-style semantics:

- A *model* of $K$ is an interpretation that makes
  every statement in $K$ true.
- $K \models \phi$ iff every model of $K$ also makes
  $\phi$ true.
- Equivalently: there is *no* model of $K$ in which
  $\phi$ is false.

This is *necessary truth* (relative to $K$): $\phi$
follows from $K$ no matter what interpretation we
adopt.

## Entailment vs derivation

Two related concepts:

- **Entailment** ($\models$): semantic; about models.
- **Derivation** ($\vdash$): syntactic; about proof
  rules.

A logic is *sound* if $\vdash$ implies $\models$
(only entailed things are derived).

A logic is *complete* if $\models$ implies $\vdash$
(everything entailed is derivable).

For first-order logic, sound and complete proof
systems exist (Gödel completeness theorem). For
description logics, sound and complete decision
procedures exist.

## Entailment in DLs and OWL

In description logics, entailment includes:

- **Subsumption.** $K \models C \sqsubseteq D$.
- **Class membership.** $K \models a : C$.
- **Property membership.** $K \models r(a, b)$.
- **Class equivalence.** $K \models C \equiv D$.
- **Inconsistency.** $K \models \bot$ (knowledge
  base unsatisfiable).

Standard DL reasoners decide all of these.

## Open vs closed world

Entailment under different assumptions:

- **Open-world entailment** (OWL standard):
  $K \models \neg \phi$ requires contradiction with
  $K$. Absence of assertion is *not* assertion of
  absence.
- **Closed-world** (databases): $K \not\models \phi$
  is treated as $K \models \neg \phi$. Standard for
  query answering in databases.

The choice has substantive consequences for
inference.

## Monotonicity

Standard logical entailment is *monotonic*:

- $K \models \phi$ and $K \subseteq K'$ implies
  $K' \models \phi$.
- Adding information never invalidates conclusions.

Some KR formalisms support *non-monotonic*
reasoning (default logic, autoepistemic logic,
defeasible reasoning) where added information can
retract conclusions. Useful for representing
defaults and exceptions.

## Conjunctive query answering

A common form of entailment:

- Given query $Q(\vec{x}) = \exists \vec{y}\
  \phi(\vec{x}, \vec{y})$.
- Find all bindings $\vec{a}$ such that $K \models
  Q(\vec{a})$.

This is the basic SPARQL-style query, evaluated under
DL semantics.

## Decidability and complexity

- **Propositional logic.** Entailment is co-NP-
  complete.
- **First-order logic.** Entailment is undecidable.
- **DLs.** Entailment is decidable (high complexity
  for expressive DLs).
- **Datalog.** Entailment polynomial-time.

DLs are designed to be decidable while expressive.

## In contemporary AI

- **DL reasoning.** Core service of OWL reasoners.
- **Theorem proving.** Entailment in higher-order
  systems (Lean, Coq, Isabelle).
- **Constraint satisfaction.** Entailment checking.
- **LLM evaluation.** "Does the LLM entail $\phi$
  given context $K$?" — testing logical
  consistency.

## Limits

- **Computational cost.** High for expressive
  formalisms.
- **Knowledge-base accuracy.** Entailment only as
  good as KB.
- **Open-world expectation mismatch.** Database
  thinkers expect closed-world.
- **Approximation needs.** Real systems often need
  approximate or probabilistic entailment.

## Status

Foundational inference relation. Standard semantics
for KR formalisms. Production deployment via
reasoners.
