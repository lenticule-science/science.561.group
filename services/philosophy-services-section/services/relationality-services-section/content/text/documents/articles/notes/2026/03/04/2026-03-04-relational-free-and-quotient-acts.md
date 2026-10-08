---
title: Relational free and quotient acts
aliases:
  - Relational free and quotient acts
  - relational free and quotient acts
date-created: "2026-03-04T00:00:00"
keywords:
  - text
  - calculus
  - algebra
operations:
  - name: formation
  - name: reduction
  - name: contextual quotient
depends-on:
  - theorem/internal/foundational-witnesses
  - theorem/internal/baseline-renewal
  - theorem/internal/normalization-reducibility
description: This text formalizes how algebraic carriers arise from the relational calculus.
---

# Theorem (Relational Free and Quotient Acts)

This text formalizes how algebraic carriers arise from the relational calculus.
We distinguish two constructions:

1. the **Relational Free Act**, which records every recognition earned by
   formation and reduction without identifications; and
2. the **Relational Quotient Act**, which collapses recognitions only along
   invariances proven by the calculus itself.

Only after both steps do we allow algebraic reasoning.

## Preliminaries

Let $C$ be a finite context (trace) of previously earned recognitions and let
`NF(C)` denote the set of normal forms obtained by closing $C$ under the
calculus’ admissible reductions.  An **invariance** is a predicate
$P : \mathrm{NF}(C) \to \{\text{true},\text{false}\}$ such that:

1. $P(r)$ holds for every $r \in \mathrm{NF}(C)$,
2. if $r \to r'$ is an admissible reduction then $P(r) \Rightarrow P(r')$, and
3. the calculus has already shown that every future admissible rule preserves $P$.

Denote the set of invariances by $\mathrm{Inv}(C)$.

## Definition 1 (Relational Free Act)

Given context $C$, the **Relational Free Act** is
$$
\mathrm{Free}(C) := \mathrm{NF}(C),
$$
with operations induced purely by the calculus’ formation rules.  No quotient is
taken; distinct normal forms remain distinct unless reduction itself identifies
them.

**Remarks.**

- `Free(C)` is purely syntactic data.  It is the “raw material” from which we
  observe stabilization.
- Learning which predicates lie in $\mathrm{Inv}(C)$ is the primary use of the
  Free Act.

## Definition 2 (Relational Quotient Act)

Let $\equiv$ be the smallest congruence on `Free(C)` such that

1. If $P \in \mathrm{Inv}(C)$ and $P(r) = P(r')$ for all $P$, then $r \equiv r'$.
2. If $r \to r'$ is an admissible reduction, then $r \equiv r'$.
3. Every future admissible rule that preserves $\mathrm{Inv}(C)$ factors through $\equiv$.

Then the **Relational Quotient Act** is
$$
\mathrm{Quot}(C) := \mathrm{NF}(C) / \equiv.
$$

## Theorem 1 (Earning a carrier)

Let $C$ be a context and $C'$ the context obtained after applying one stage
of formation and reduction.  A carrier $|A|$ is **earned** at stage $C'$ iff
the congruence $\equiv$ generated above satisfies:

1. (Totality) every recognition in $C'$ has a normal form representative modulo $\equiv$;
2. (Stability) reductions respect $\equiv$;
3. (Extensibility) any future rule that preserves $\mathrm{Inv}(C')$ factors through $\equiv$.

In that case define $|A| := \mathrm{Quot}(C')$, with operations and laws
descending from admissible constructions and invariances.

*Proof sketch.* Conditions (1)–(3) guarantee that $\equiv$ captures exactly the
identifications justified by the calculus.  Quotienting modulo $\equiv$ then
produces the minimal carrier compatible with all earned invariances. ∎

## Relationship summary

| Layer | Contents | Allowed operations |
| ----- | -------- | ------------------ |
| `Free(C)` | All recognitions and their normal forms | Formation + reduction, no identifications |
| `Quot(C)` | Recognitions modulo earned invariances | Identifications enforced only by $\mathrm{Inv}(C)$ |

**Corollary.** Algebraic reasoning may reference $|A|$ only after the
calculus has produced `Free(C)`, detected $\mathrm{Inv}(C)$, and formed
`Quot(C)`.  This enforces the philosophy:

> Calculus records; invariance certifies; quotient realizes.

Future directories such as `/acts/free/` and `/acts/quotient/` should follow
this pattern, making it clear whether a given act is part of the raw calculus or
its earned algebraic quotient.
