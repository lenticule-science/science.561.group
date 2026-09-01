---
type: theorem
status: proved
depends-on: [simply-typed-lambda-calculus, typing-judgment, beta-reduction-step, substitution-operator]
---

# Subject reduction

If $\Gamma \vdash M : A$ and $M \to_\beta N$, then $\Gamma \vdash N : A$.

In words: *types are preserved by reduction*. A well-typed term reduces only to well-typed terms of the same type.

## Proof sketch

By induction on the derivation of $M \to_\beta N$:

- *Base case* (β-step): $M = (\lambda x.\,P)\;Q$ and $N = P[Q/x]$. From $\Gamma \vdash (\lambda x.\,P)\;Q : A$ inversion of the application rule gives $\Gamma \vdash \lambda x.\,P : B \to A$ and $\Gamma \vdash Q : B$ for some $B$; inversion of the abstraction rule gives $\Gamma, x : B \vdash P : A$. The *substitution lemma* (a structural property of the [substitution-operator](../morphisms/substitution-operator.md)) gives $\Gamma \vdash P[Q/x] : A$.

- *Congruence cases*: $M = M_1\;M_2 \to_\beta M_1'\;M_2$ from $M_1 \to_\beta M_1'$. Inversion plus IH plus the application rule gives the result. Symmetric for the other argument and for under-binder reduction.

$\square$

## Corollaries

- *Soundness of $=_\beta$ for typing*: if $M =_\beta N$ and $\Gamma \vdash M : A$, then $\Gamma \vdash N : A$ (apply subject reduction along each step in either direction).
- *Combined with [progress](progress.md)*: every well-typed term either is a value or makes progress to a well-typed term — *type safety*.

## Remarks

Subject reduction is half of the standard *type safety* proof; [progress](progress.md) is the other half. The two together — *well-typed programs do not get stuck* — are the corner of the typed-language guarantees that programming-language designers most rely on. Reference: [Pierce 2002](references/pierce2002.md) §9.3, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) §3.2.
