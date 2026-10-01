---
type: definition
class: type-former
status: current
depends-on: [typing-judgment]
symbol: \mathbf{0}
name: Empty type
description: The empty type $\mathbf{0}$ (also $\bot$) is the type with no inhabitants.
---

# Empty type

The **empty type** $\mathbf{0}$ (also $\bot$) is the type with no inhabitants. There is no introduction rule. The elimination rule says: from a term of $\mathbf{0}$ you can produce a term of any type.

## Structure

- **Formation.** $\vdash \mathbf{0} : \mathrm{Type}$.
- **Introduction.** None.
- **Elimination** (*ex falso quodlibet*). From $\Gamma \vdash P : \mathbf{0}$ and any type $C$, conclude $\Gamma \vdash \mathrm{absurd}(P) : C$.

There are no β- or η-rules: the elimination rule is vacuous because there are no canonical inhabitants to eliminate.

## What this is not

The empty type is *not* the [unit-type](unit-type.md) — unit has one inhabitant; empty has none. Inhabiting $\mathbf{0}$ in a consistent theory is impossible; producing a closed term of $\mathbf{0}$ would witness *inconsistency*, see [consistency-of-mltt](../../documents/articles/research-articles/consistency-of-mltt.md).

## Position

Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md), $\mathbf{0}$ is *falsehood*: the proposition $\bot$ has no proof, and its elimination rule is *ex falso quodlibet* — from a contradiction, anything follows. Negation is then defined as $\neg A := A \to \mathbf{0}$: a "refutation" is a function turning a hypothetical proof of $A$ into a contradiction. The corpus's `status: refuted` (when used) corresponds to having an inhabitant of $\neg A$. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §11.5, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3.5.
