---
type: definition
class: type-former
status: current
depends-on: [lambda-term, typing-judgment]
symbol: A \to B
name: Function type
description: A function type $A \to B$ is the type of lambda-terms that, given an argument of type $A$, produce a result of type $B$.
---

# Function type

A **function type** $A \to B$ is the type of [lambda-terms](lambda-term.md) that, given an argument of type $A$, produce a result of type $B$. The introduction rule is λ-abstraction; the elimination rule is application.

## Structure

- **Formation.** From $A$ a type and $B$ a type, form $A \to B$.
- **Introduction.** From $\Gamma, x : A \vdash M : B$, conclude $\Gamma \vdash \lambda x.\,M : A \to B$.
- **Elimination.** From $\Gamma \vdash M : A \to B$ and $\Gamma \vdash N : A$, conclude $\Gamma \vdash M\;N : B$.
- **β-rule.** $(\lambda x.\,M)\;N \equiv M[N/x]$.
- **η-rule.** $\lambda x.\,(M\;x) \equiv M$ when $x$ does not occur free in $M$ (see [eta-equivalence](eta-equivalence.md)).

The function type is *right-associative*: $A \to B \to C$ means $A \to (B \to C)$, the type of curried two-argument functions.

## What this is not

A function type is *not* a [pi-type](pi-type.md) in general — it is the special case where the codomain $B$ does not depend on the input. A function type is *not* a set-theoretic function space (it carries computation, not just an input-output relation), although under the standard set-theoretic semantics of STLC the inhabitants of $A \to B$ correspond to total functions $|A| \to |B|$.

## Position

The function type is the load-bearing type former of every λ-calculus. Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md) it is *implication*: $A \to B$ is "if $A$ then $B$", and a closed term of type $A \to B$ is a proof of the implication. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §9.2, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3.1.
