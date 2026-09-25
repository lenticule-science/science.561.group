---
type: definition
class: decision-procedure
status: current
depends-on: [typing-judgment, typing-context, simply-typed-lambda-calculus]
title: Type checking
description: "Type checking is the operator (and the algorithm implementing it) that decides whether a given typing-judgment $\\Gamma \\vdash M : A$ holds."
---

# Type checking

**Type checking** is the operator (and the algorithm implementing it) that decides whether a given [typing-judgment](typing-judgment.md) $\Gamma \vdash M : A$ holds. The input is a [typing-context](typing-context.md), a term, and a candidate type; the output is *yes* (the judgment is derivable) or *no*.

The dual problem — *type inference* — takes only $\Gamma$ and $M$ and produces a type $A$ if any exists.

## Properties

- For [simply-typed-lambda-calculus](../../documents/articles/research/2026/07/31/lenticule-import/objects/simply-typed-lambda-calculus.md): type checking is decidable in linear time (with explicit type annotations on binders) or polynomial time (with full inference, by Hindley-Milner-style unification).
- For System F: type inference is undecidable; type checking remains decidable when explicit annotations are provided.
- For [dependent-type-theory](dependent-type-theory.md): type checking is decidable iff judgmental equality is decidable, which holds when the calculus is [strongly normalizing](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/normalization.md). Type *inference* in full MLTT is undecidable.

## Position

Type checking is what every proof assistant *does* at its core: given a candidate proof-term, mechanically verify that it produces the claimed judgment. The decidability of type checking is what makes MLTT-based assistants (Lean, Agda, Coq) usable: the kernel performs only checking, and untrusted elaboration produces the candidate terms. Reference: [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §22, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §3.6.
