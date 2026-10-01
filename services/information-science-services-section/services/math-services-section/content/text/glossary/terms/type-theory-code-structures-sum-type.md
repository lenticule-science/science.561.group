---
type: definition
class: type-former
status: current
depends-on: [function-type]
symbol: A + B
name: Sum type
description: A sum type (also coproduct type or disjoint union) $A + B$ is the type of values that are either an $A$, tagged left, or a $B$, tagged right.
---

# Sum type

A **sum type** (also *coproduct type* or *disjoint union*) $A + B$ is the type of values that are either an $A$, tagged left, or a $B$, tagged right. The introduction rules are the two injections; the elimination rule is case analysis.

## Structure

- **Formation.** From $A$ and $B$ types, form $A + B$.
- **Introduction.** $\mathrm{inl} : A \to A + B$ and $\mathrm{inr} : B \to A + B$.
- **Elimination.** From $\Gamma, x : A \vdash M_1 : C$ and $\Gamma, y : B \vdash M_2 : C$ and $\Gamma \vdash P : A + B$, conclude $\Gamma \vdash \mathrm{case}(P; x.\,M_1; y.\,M_2) : C$.
- **β-rules.** $\mathrm{case}(\mathrm{inl}(M); x.\,M_1; y.\,M_2) \equiv M_1[M/x]$ and the symmetric rule for $\mathrm{inr}$.

## What this is not

A sum type is *not* a [product-type](product-type.md) — products bundle, sums choose. A sum type is *not* a set-theoretic union: $\mathrm{inl}(a)$ and $\mathrm{inr}(a)$ are distinct elements of $A + A$ even when $a$ is the same value, because the tag is part of the term.

## Position

The sum type is *disjunction* under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md): a closed term of type $A + B$ is either a proof of $A$ (tagged left) or a proof of $B$ (tagged right) — *constructively*, you must say which. This is exactly why intuitionistic disjunction differs from classical disjunction: a proof of $A \vee \neg A$ requires deciding the case. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §11.10, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3.5.
