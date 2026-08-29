---
type: definition
class: type-former
status: current
depends-on: [function-type]
symbol: A \times B
---

# Product type

A **product type** $A \times B$ is the type of ordered pairs $(a, b)$ with $a : A$ and $b : B$. The introduction rule is pairing; the elimination rules are projection.

## Structure

- **Formation.** From $A$ and $B$ types, form $A \times B$.
- **Introduction.** From $\Gamma \vdash M : A$ and $\Gamma \vdash N : B$, conclude $\Gamma \vdash (M, N) : A \times B$.
- **Elimination.** From $\Gamma \vdash P : A \times B$, conclude $\Gamma \vdash \pi_1(P) : A$ and $\Gamma \vdash \pi_2(P) : B$.
- **β-rules.** $\pi_1(M, N) \equiv M$ and $\pi_2(M, N) \equiv N$.
- **η-rule.** $(\pi_1(P), \pi_2(P)) \equiv P$.

## What this is not

A product type is *not* a [sigma-type](sigma-type.md) in general — it is the special case where the type of the second component does not depend on the value of the first. A product type is *not* a [sum-type](sum-type.md): pairs and tagged unions are dual.

## Position

The product type is *conjunction* under the [curry-howard-correspondence](../theorems/curry-howard-correspondence.md): a closed term of type $A \times B$ is a proof of $A$ together with a proof of $B$. Categorically, $A \times B$ is the categorical product in the [cartesian-closed category](../../categories/theories/ordinary-categories/objects/category.md) modeling the calculus. Reference: [Pierce 2002](references/pierce2002.md) §11.6, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) §3.5.
