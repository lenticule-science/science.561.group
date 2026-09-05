---
type: theorem
status: proved
depends-on: [simply-typed-lambda-calculus, curry-howard-translation, typing-judgment, function-type, product-type, sum-type, empty-type]
---

# Curry-Howard correspondence

There is a bijective, structure-preserving correspondence between derivations of intuitionistic propositional natural deduction and typing derivations in the [simply-typed-lambda-calculus](../objects/simply-typed-lambda-calculus.md) (extended with [products](../objects/product-type.md), [sums](../objects/sum-type.md), [unit](../objects/unit-type.md), and [empty](../objects/empty-type.md)) under the [curry-howard-translation](../morphisms/curry-howard-translation.md). Specifically:

1. A proposition $A$ is provable in intuitionistic propositional logic iff the corresponding type $A^{\flat}$ is [inhabited](teaching/explanations/inhabitation.md): $\vdash A^{\flat} : \mathrm{Type}$ has some closed term $\vdash t : A^{\flat}$.
2. Proof-normalization (cut-elimination) in the natural-deduction system corresponds step-for-step to [beta-reduction](teaching/explanations/beta-reduction.md) in the type system.
3. The correspondence extends to first-order intuitionistic logic via [pi-types](../objects/pi-type.md) for $\forall$ and [sigma-types](../objects/sigma-type.md) for $\exists$, yielding [dependent-type-theory](../objects/dependent-type-theory.md).

## Proof sketch

The two directions are induction on derivations:

- *Logic to types* (Curry's direction): given a natural-deduction derivation of $A$, decorate every node with a term, where the term at the conclusion has type $A^{\flat}$. Implication-introduction becomes λ-abstraction; implication-elimination becomes application; and-introduction becomes pairing; and-elimination becomes projection; etc.
- *Types to logic* (Howard's direction): given a typing derivation $\Gamma \vdash t : A$, erase the term and read off a natural-deduction derivation of $A$ from the assumptions in $\Gamma$.

Each translation is shown to be a left-inverse of the other, and to preserve reduction/normalization. $\square$

## Corollaries

- *Computational content of proofs*: every proof in intuitionistic logic is, secretly, a program — and the corresponding program runs by proof normalization.
- *Decidable proof checking*: combined with decidability of [type-checking](../morphisms/type-checking.md), checking that a proof-term proves the claimed proposition is decidable.
- *Foundation of proof assistants*: the entire interactive-theorem-proving enterprise (Lean, Coq, Agda) rests on this correspondence.

## Remarks

The correspondence is the load-bearing semantic claim of this directory: it makes the corpus's `status: proved` field a type-theoretic statement (the type corresponding to the theorem's proposition is inhabited) rather than a metaphysical one. The downstream `depends-on: [pi-type]` edge added to [logic/concepts/quantifier.md](../../logic/concepts/quantifier.md) is the typographic acknowledgement of this correspondence at the universal-quantifier site. Reference: [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md), [Pierce 2002](references/pierce2002.md) §9.4, [Girard, Lafont & Taylor 1989](references/girard-lafont-taylor1989.md).
