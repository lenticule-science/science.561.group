---
type: definition
class: type-former
status: current
depends-on: [typing-judgment]
symbol: \mathbf{1}
title: Unit type
description: The unit type $\mathbf{1}$ is the type with exactly one inhabitant, written $\star$ (or $()$ or $\langle\rangle$).
---

# Unit type

The **unit type** $\mathbf{1}$ is the type with exactly one inhabitant, written $\star$ (or $()$ or $\langle\rangle$). Its formation is *nullary*: it takes no arguments.

## Structure

- **Formation.** $\vdash \mathbf{1} : \mathrm{Type}$.
- **Introduction.** $\vdash \star : \mathbf{1}$.
- **Elimination.** From $\Gamma, x : \mathbf{1} \vdash M : C$ and $\Gamma \vdash P : \mathbf{1}$, conclude $\Gamma \vdash M[\star/x] : C$ — i.e. there is nothing to learn from a unit value.
- **η-rule.** Every $P : \mathbf{1}$ is judgmentally equal to $\star$.

## What this is not

The unit type is *not* the [empty-type](empty-type.md) — empty has no inhabitants; unit has exactly one. The unit type is *not* the boolean type — booleans have two distinct inhabitants.

## Position

Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md), $\mathbf{1}$ is *truth*: the proposition $\top$ is provable trivially, and its proof is $\star$. Categorically, $\mathbf{1}$ is the terminal object — every type $A$ has a unique morphism $A \to \mathbf{1}$, the constant function returning $\star$. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §11.2, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3.5.
