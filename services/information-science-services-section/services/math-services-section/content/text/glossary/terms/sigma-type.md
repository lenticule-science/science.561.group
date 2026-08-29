---
type: term
term-kind: definition
class: type-former
status: current
depends-on: [product-type, binder, universe]
symbol: "\\Sigma(x : A).\\,B(x)"
---

# Sigma type

A **Sigma type** $\Sigma(x : A).\,B(x)$ is the type of dependent pairs: pairs $(a, b)$ where $a : A$ and $b : B(a)$ — the type of the second component may depend on the value of the first. When $B$ does not depend on $x$, the Sigma type degenerates to the ordinary [product-type](./product-type.md) $A \times B$.

## Structure

- **Formation.** From $\Gamma \vdash A : \mathrm{Type}$ and $\Gamma, x : A \vdash B : \mathrm{Type}$, form $\Gamma \vdash \Sigma(x : A).\,B : \mathrm{Type}$.
- **Introduction.** From $\Gamma \vdash a : A$ and $\Gamma \vdash b : B[a/x]$, conclude $\Gamma \vdash (a, b) : \Sigma(x : A).\,B$.
- **Elimination.** Projections $\pi_1(P) : A$ and $\pi_2(P) : B[\pi_1(P)/x]$, with the dependent eliminator (J for Σ) handling the general case.
- **β-rules.** $\pi_1(a, b) \equiv a$ and $\pi_2(a, b) \equiv b$.

## What this is not

A Sigma type is *not* a [product-type](./product-type.md) in general — it is dependent. A Sigma type is *not* a [pi-type](./pi-type.md): Σ is existential, Π is universal. A Sigma type is *not* the same as set-theoretic disjoint union of a family — it carries the witness explicitly as the first projection.

## Position

The Sigma type is *existential quantification* under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md): $\Sigma(x : A).\,P(x)$ is the proposition $\exists x : A.\,P(x)$, and a closed term is a *witness* $a$ together with a proof that $P(a)$. This is the constructive existential — to prove existence you must produce the inhabitant. Categorically, Σ is left adjoint to substitution along a projection. Sigma types are the standard way to bundle a structure with its laws (a group is a $\Sigma$ of carrier, operations, and proofs of axioms). Reference: [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md), [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §1.6.
