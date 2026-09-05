---
type: theorem
status: proved
depends-on: [simply-typed-lambda-calculus, normalization, beta-reduction, function-type]
---

# Strong normalization for STLC

In the [simply-typed-lambda-calculus](../../../glossary/terms/simply-typed-lambda-calculus.md) under [beta-reduction](../../../glossary/terms/beta-reduction.md), every well-typed term is *strongly normalizing*: every reduction sequence starting from a well-typed term terminates in a [β-normal form](../../../glossary/terms/normalization.md).

## Proof sketch

The textbook proof uses *Tait's reducibility candidates* (also called *logical relations*). Define, by recursion on types, a predicate $\mathrm{SN}_A$ on closed terms of type $A$:

- For base type $P$: $\mathrm{SN}_P(M)$ iff $M$ is strongly normalizing.
- For function type $A \to B$: $\mathrm{SN}_{A \to B}(M)$ iff for every $N$ with $\mathrm{SN}_A(N)$, $\mathrm{SN}_B(M\;N)$.

Two lemmas are needed:

1. Every $\mathrm{SN}_A$-term is strongly normalizing (by induction on $A$, using that $\lambda$-abstractions are *neutral* in the sense that they don't reduce on their own).
2. Every well-typed term is in $\mathrm{SN}$: by induction on the typing derivation, using a substitution lemma that closes terms in $\mathrm{SN}$ under $\mathrm{SN}$-substitution.

Combining: every well-typed term is strongly normalizing. $\square$

## Corollaries

- *Decidable type checking*: combined with [church-rosser](./church-rosser.md), every typed term has a unique normal form, and judgmental equality reduces to comparing normal forms.
- *No fixed-point combinator in STLC*: the [y-combinator-untyped](../teaching-articles/examples/y-combinator-untyped.md) has no STLC type — if it did, it would witness a non-terminating reduction, contradicting strong normalization.
- *Loss of Turing-completeness*: STLC cannot express general recursion. This is the *price* of normalization.

## Remarks

The proof idea generalises: the same reducibility-candidate technique proves strong normalization for System F, the Calculus of Constructions, and the predicative core of MLTT, with progressively more elaborate definitions of the candidates. The result fails for any calculus admitting general recursion or impredicativity at the term level. Reference: [Girard, Lafont & Taylor 1989](../bibliographies/girard-lafont-taylor1989.md) Ch. 6, [Sørensen & Urzyczyn 2006](../bibliographies/sorensen-urzyczyn2006.md) §4.
