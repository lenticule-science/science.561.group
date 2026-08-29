---
type: theorem
status: proved
depends-on: [simply-typed-lambda-calculus, typing-judgment, beta-reduction-step]
---

# Progress

If $\vdash M : A$ (a closed term of type $A$ in the empty [typing-context](teaching/explanations/typing-context.md)), then either $M$ is a *value* (a term in normal form whose top constructor is canonical for $A$) or there is some $N$ with $M \to_\beta N$.

In words: *a closed well-typed term is never stuck*. It either represents a final answer or can take a step.

## Proof sketch

By induction on the derivation of $\vdash M : A$. The variable rule cannot apply (the context is empty). The remaining cases:

- *Abstraction*: $M = \lambda x.\,P$ at type $A_1 \to A_2$. This is a value (a canonical form for the function type).
- *Application*: $M = P\;Q$ at type $A$, with $\vdash P : A_1 \to A$ and $\vdash Q : A_1$.
  - By IH on $P$: either $P$ is a value (hence $P = \lambda x.\,R$ by the *canonical forms lemma*) or $P \to_\beta P'$.
  - If $P$ is a value: $M = (\lambda x.\,R)\;Q \to_\beta R[Q/x]$.
  - If $P \to_\beta P'$: $M = P\;Q \to_\beta P'\;Q$.

The *canonical forms lemma* (closed values of function type are λ-abstractions) is what makes the case analysis go through. $\square$

## Corollaries

- *Type safety* (combined with [subject-reduction](subject-reduction.md)): every well-typed program either reduces to a value or reduces forever — never to a stuck non-value.
- *Decidability of evaluation*: combined with [strong-normalization-stlc](strong-normalization-stlc.md), every closed STLC term has a value as its normal form, computable by repeated β-stepping.

## Remarks

Progress and subject reduction are the *two halves* of the standard type-safety theorem. They generalise to every typed calculus: the form of the canonical-forms lemma changes with the type formers, but the inductive structure of the proof is the same. Reference: [Pierce 2002](references/pierce2002.md) §9.3, §11 (extended to product, sum, etc.).
