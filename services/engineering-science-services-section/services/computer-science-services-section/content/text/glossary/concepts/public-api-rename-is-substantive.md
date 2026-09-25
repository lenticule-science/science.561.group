---
type: theorem
status: draft
depends-on: [refactor-as-invisible-automorphism, breaking-change-as-visible-automorphism, rename]
title: Public-API rename is substantive
description: "A specific application: under any witness language $W$ that includes downstream-consumer cells, a rename of a public-API identifier is a breaking change, not a refactoring."
---

# Public-API rename is substantive

A specific application: under any witness language $W$ that includes downstream-consumer cells, a rename of a public-API identifier is a breaking change, not a refactoring.

## Statement

Let $v^{\mathrm{code}}$ be a codebase settling, $W$ a witness language including cells of the form `imports-symbol-named-X` referenced by entities outside the codebase (downstream packages, external callers, documentation that names $X$). Let $a$ be a public-API identifier — one such that some external entity $e$ has a designated cell $\langle e, \texttt{imports-symbol-named}, a\rangle$ with witness value $\mathbf{t}$ in $\mathcal{F}^{\mathrm{code}}_W$.

**Theorem.** *The rename $\pi_E = (a\;b)$ for a fresh $b$ is not a refactoring under $W$. Equivalently, $\pi_E \notin N_W(v^{\mathrm{code}})$.*

## Sketch

$\pi_E$ acts on the cell $\langle e, \texttt{imports-symbol-named}, a\rangle$ by mapping it to $\langle e, \texttt{imports-symbol-named}, b\rangle$. The original cell had value $\mathbf{t}$ in $\mathcal{F}^{\mathrm{code}}_W$; after the rename, the cell at the original position has value $\bot$ (no entity is named $a$ anymore for $e$ to import) and the cell at the new position has value $\mathbf{t}$ (assuming the import is updated; more typically, the cell at the new position remains $\bot$ until $e$'s codebase is also updated).

Either way, $\pi_E$ does not fix the witness-bearing cell at $\langle e, \texttt{imports-symbol-named}, a\rangle$. By [refactor-as-invisible-automorphism](refactor-as-invisible-automorphism.md), $\pi_E \notin N_W(v^{\mathrm{code}})$. By [breaking-change-as-visible-automorphism](breaking-change-as-visible-automorphism.md), $\pi_E$ is a breaking change. $\square$

## What this proves about disciplinary practice

**(a) "Rename across the universe" tooling is correctly understood as a coordinated substantive change, not a refactor.** Language-server-driven multi-repo rename operations propagate the rename to consumers; this is the disciplinary recognition that the operation is not in $N_W$ when downstream consumers are in scope, and so requires coordinated update of every consumer to land. The substrate-algebraic content: the operation is in $N_{W'}$ where $W'$ is the *enlarged* witness language including the consumer codebases; it is not in $N_W$ for the producer's own $W$.

**(b) Deprecation aliases are explicit visible-quotient bridges.** Adding a deprecation alias `b = a` and renaming usages over time is the disciplinary technique for *staging* the visible-automorphism quotient transition: while the alias exists, both names witness the same cell, and consumers that reference either name are settled. The alias is what makes the transition cosmetic on the consumer's settling without requiring atomic coordination.

**(c) Public-API stability is structurally a witness-language declaration.** A project that publishes a stable public API is declaring "the witness language $W^{\mathrm{public}}$ for which we promise refactor-only changes." Breaking-change releases are explicit declarations that the project is moving outside $N_{W^{\mathrm{public}}}$.

## Where used

- The witness-language-relativity story in [refactor-as-invisible-automorphism](refactor-as-invisible-automorphism.md).
- The deprecation-alias pattern in everyday public-API maintenance, recovered as a substrate operation.
