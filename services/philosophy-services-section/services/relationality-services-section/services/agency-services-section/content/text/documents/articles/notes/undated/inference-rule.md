---
type: object
class: foundational
status: active
depends-on: []
see-also:
  - proof.md
  - deduction-step.md
references:
  - references/russell-norvig-ai2020.md
title: Inference rule
description: An inference rule licenses moving from one or more premises to a conclusion.
---

# Inference rule

An **inference rule** licenses moving from one or
more premises to a conclusion. The atomic operation
of formal reasoning systems.

## Form

A rule has shape:

$$
\frac{P_1 \quad P_2 \quad \cdots \quad P_n}{C}
$$

read as: from $P_1, \ldots, P_n$, conclude $C$.

Examples:

- **Modus ponens.** From $A \to B$ and $A$, conclude
  $B$.
- **Conjunction introduction.** From $A$ and $B$,
  conclude $A \land B$.
- **Universal elimination.** From $\forall x.\phi(x)$,
  conclude $\phi(t)$ for any term $t$.
- **Resolution.** From $A \lor B$ and $\neg A \lor
  C$, conclude $B \lor C$.

## Soundness

A rule is **sound** if applying it to true premises
yields true conclusions:

- $P_1, \ldots, P_n \models C$.

Sound rules combine into sound proof systems.

Per [modus-ponens-soundness](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/reasoning/_archive/from-language-models-reasoning/theorems/modus-ponens-soundness.md),
modus ponens is sound under standard semantics.

## Categories

### Introduction rules

Introduce a connective: how to *prove* it.
- $\land$-intro: from $A$ and $B$, conclude $A \land
  B$.

### Elimination rules

Use a connective: how to *exploit* it.
- $\land$-elim: from $A \land B$, conclude $A$.

This intro/elim symmetry is structural in natural
deduction.

### Structural rules

About proof structure rather than connectives:
- Weakening, contraction, exchange.

### Cut rules

Eliminate intermediate lemmas:
- Cut: from $\Gamma \vdash A$ and $\Delta, A \vdash
  B$, conclude $\Gamma, \Delta \vdash B$.

## Rule systems

Collections of rules form proof systems:

- **Hilbert systems.** Few rules, many axioms.
- **Natural deduction.** Many rules, few axioms;
  Gentzen-style.
- **Sequent calculus.** Operates on sequents
  $\Gamma \vdash \Delta$.
- **Tableaux.** Systematic refutation procedures.
- **Resolution.** Single rule for clausal logic.

Different systems offer different ergonomics for
different tasks.

## Rules in DLs

Description-logic reasoners use rule-like operations:

- **Subsumption rules.** When $C \sqsubseteq D$
  follows.
- **Tableau rules.** Expansion rules in tableau
  algorithms.
- **Saturation rules.** Forward-chaining
  derivation.

## Inference rules in non-classical logics

- **Intuitionistic.** No double-negation
  elimination.
- **Linear logic.** Resources tracked.
- **Modal.** Necessity and possibility rules.
- **Probabilistic.** Rules over probability
  expressions.

Each tradition has its rule set.

## In contemporary AI

- **Theorem provers** apply rules systematically.
- **Type checkers** are essentially rule
  applications.
- **DL reasoners** apply tableau / saturation rules.
- **LLMs and rules.** LLMs can be prompted to apply
  rules; reliability varies.
- **Logic programming.** Programs *are* rules
  (Prolog).

## Limits

- **Rule selection.** Many rules potentially apply;
  search is hard.
- **Soundness depends on system.** Adding rules can
  break soundness if not careful.
- **Naturalness.** Some rules natural to humans,
  others not.

## Status

Foundational construct. Standard substrate for
formal reasoning systems. Production deployment
across theorem provers, type checkers, DL reasoners.
