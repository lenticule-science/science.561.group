---
type: example
class: math-side
status: draft
depends-on: [rename, refactor-as-invisible-automorphism, codebase-cell-system]
title: Private rename as cosmetic
description: "Worked instance: a rename of a private variable in a small codebase, classified as a refactoring under the test-only witness language by refactor-as-invisible-automorphism."
---

# Private rename as cosmetic

Worked instance: a rename of a private variable in a small codebase, classified as a refactoring under the test-only witness language by [refactor-as-invisible-automorphism](../../../../glossary/concepts/refactor-as-invisible-automorphism.md).

## Setup

Codebase $v^{\mathrm{code}}$ has entities including:

- A function $f$ defined in module $m$.
- A local variable $a$ used only inside $f$.
- A test $t$ for $f$, comparing $f$'s return value to an expected output.

Witness language $W = W^{\mathrm{test}}$ — only test-witness cells are designated witness-bearing. The relevant cell in $\mathcal{F}^{\mathrm{code}}_W$ is $\langle t, \texttt{passes-on}, f\rangle$ with value $\mathbf{t}$.

## The transformation

Apply $\pi_E = (a\;b)$ — rename the local variable $a$ to a fresh name $b$.

## Classification

The cells touched by $\pi_E$ are:

- $\langle f, \texttt{contains-binding}, a\rangle \to \langle f, \texttt{contains-binding}, b\rangle$
- Several `references` cells inside $f$ from $f$'s body to $a$, rewritten to reference $b$.

None of these are in $W$. The cell $\langle t, \texttt{passes-on}, f\rangle$ is in $W$, has value $\mathbf{t}$, is not touched by $\pi_E$, and so retains value $\mathbf{t}$.

By [refactor-as-invisible-automorphism](../../../../glossary/concepts/refactor-as-invisible-automorphism.md), $\pi_E \in N_W(v^{\mathrm{code}})$. The rename is a refactoring under $W$.

## What this confirms

Three substrate-algebraic facts disciplinary practice already knows:

1. **Renaming a private variable does not break tests.** This is *because* private variables are absent from any witness language tracking only test outcomes — equivalently, $\pi_E$'s action is wholly within the permanently-$\bot$ region of $\mathcal{F}^{\mathrm{code}}_W$.
2. **The rename is reversible.** $\pi_E^{-1} = \pi_E$ is also a rename, also in $N_W$, also a refactoring.
3. **The classification depends on $W$.** Under a witness language tracking source-text content of $f$'s body, the rename touches witness cells (the body's text) and is *not* in $N_W$. Both classifications are correct under their respective witness languages.

## Where used

- [refactor-as-invisible-automorphism](../../../../glossary/concepts/refactor-as-invisible-automorphism.md) — the worked-instance side of the central theorem.
