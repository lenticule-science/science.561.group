---
form: research
title: Judgment Calculus Term Structure
tags:
  - lambda
  - term
layer: internal-theorem
status: plan
depends-on:
  - equate-eventually
  - form-term-body
  - form-function-term
  - form-application-term
  - pair-least-fix
  - form-least-fix-term
  - pair-greatest-fix
  - form-greatest-fix-term# Judgment Calculus Term Structure

The acts

- `EquateEventually` through `FormTermBody`,
- `FormFunctionTerm` through `FormApplicationTerm`,
- `PairLeastFix` through `FormGreatestFixTerm`

induce a term structure whose points are terms in the internal judgment calculus with:

- variables and bodies,
- abstractions and applications,
- least and greatest fixpoint constructors.

In particular, every syntactic constructor of this internal judgment calculus
has a corresponding earned act in the relational calculus, and compositions of
these acts generate all well-formed judgment-calculus terms.
