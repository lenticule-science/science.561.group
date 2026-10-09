---
term-kind: definition
class: syntactic-operator
status: current
depends-on: [substitution, lambda-term]
---

# Substitution operator

The **substitution operator** $[-/-]$ is the binary operation taking a [lambda-term](./lambda-term.md) $M$, a [variable](./variable.md) $x$, and a term $N$, and producing the capture-avoiding [substitution](./substitution.md) $M[N/x]$.

## Definition

By recursion on $M$, modulo [alpha-equivalence](./alpha-equivalence.md):

- $x[N/x] = N$.
- $y[N/x] = y$ for $y \neq x$.
- $(M_1\;M_2)[N/x] = (M_1[N/x])\;(M_2[N/x])$.
- $(\lambda y.\,M)[N/x] = \lambda y.\,(M[N/x])$, where $y$ is chosen (via [alpha-conversion](./alpha-conversion.md)) so that $y \notin \mathrm{FV}(N)$ and $y \neq x$.

The last clause is the *capture-avoiding* clause: a naïve substitution that ignores it is silently incorrect.

## Properties

- *Identity*: $M[x/x] = M$.
- *Commutation*: when $x \neq y$ and $x \notin \mathrm{FV}(P)$, $M[N/x][P/y] = M[P/y][N[P/y]/x]$.
- *Substitution lemma* (typed setting): if $\Gamma \vdash N : A$ and $\Gamma, x : A \vdash M : B$, then $\Gamma \vdash M[N/x] : B$.

## Position

Substitution is what [beta-reduction-step](./beta-reduction-step.md) implements; the substitution lemma is the engine of [subject-reduction](../../documents/articles/research-articles/subject-reduction.md). Categorically, substitution along a projection is the *pullback* functor that [pi-types](./pi-type.md) and [sigma-types](./sigma-type.md) are adjoint to. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §2.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
