---
type: concept
class: deductive-judgment
status: current
depends-on: [variable, typing-context]
title: Typing judgment
description: "A typing judgment is the basic deductive statement of any type theory: \"in context $\\Gamma$, term $t$ has type $A$\", written"
---

# Typing judgment

*A typing judgment* is the basic deductive statement of any type theory: "in context $\Gamma$, term $t$ has type $A$", written

$$
\Gamma \vdash t : A.
$$

It is not a proposition of the object theory but a *judgment about* terms — the four standard judgments of a type theory are *$A$ is a type* ($\Gamma \vdash A : \mathrm{Type}$), *$t$ has type $A$* ($\Gamma \vdash t : A$), *$A$ and $B$ are equal types* ($\Gamma \vdash A \equiv B$), and *$s$ and $t$ are equal terms of type $A$* ($\Gamma \vdash s \equiv t : A$).

A judgment holds when it is the conclusion of a derivation built from the typing rules of the calculus — the variable rule, the abstraction rule, the application rule, and the type-former-specific introduction and elimination rules. The collection of derivable judgments is the *typing relation* of the calculus.

## Position

Typing judgments are the primary objects [type-checking](../terms/type-checking.md) decides. The structural rules ([typing-context](../terms/typing-context.md) weakening, exchange, contraction) describe how the context can be manipulated without disturbing a judgment. Under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md), a typing judgment $\Gamma \vdash t : A$ is exactly a natural-deduction derivation of $A$ from the assumptions in $\Gamma$, with $t$ being the proof-term that records the derivation. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §9.1, [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md).
