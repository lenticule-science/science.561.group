---
type: theorem
status: proved
depends-on: [simply-typed-lambda-calculus, typing-judgment, type-checking]
---

# Principal typing for STLC

Every typeable [lambda-term](../objects/lambda-term.md) $M$ in the [simply-typed-lambda-calculus](../objects/simply-typed-lambda-calculus.md) admits a *principal type*: a typing $\Gamma_0 \vdash M : A_0$ such that every other typing $\Gamma \vdash M : A$ is obtained from it by a *substitution* on type variables.

In algorithmic form: there is an algorithm (Hindley's algorithm, equivalently Damas–Milner) that, given a term, returns its principal type or rejects the term as untypeable.

## Proof sketch

The algorithm proceeds by structural recursion on the term, generating *type equations* and solving them by *unification*:

- *Variable* $x$: assign a fresh type variable $\alpha$ as the type of $x$, return $x : \alpha \vdash x : \alpha$.
- *Application* $M\;N$: recursively type $M$ as $\Gamma_M \vdash M : A_M$ and $N$ as $\Gamma_N \vdash N : A_N$. Generate the equation $A_M \stackrel{?}{=} A_N \to \alpha$ for a fresh $\alpha$. Unify; the result is $\sigma(\Gamma_M \cup \Gamma_N) \vdash M\;N : \sigma(\alpha)$ where $\sigma$ is the most general unifier.
- *Abstraction* $\lambda x.\,M$: recursively type $M$ as $\Gamma, x : A \vdash M : B$ (introducing a fresh $A$ for $x$ if not constrained). Return $\Gamma \vdash \lambda x.\,M : A \to B$.

Unification of simple types is the standard Robinson algorithm; it always terminates and produces a most general unifier when one exists. The principal type $A_0$ is the type produced when only the equations forced by the term's structure are solved. $\square$

## Corollaries

- *Decidability of type inference for STLC*: linear in term size when annotations are present, polynomial without.
- *Compositional inference*: principal types let typing be performed locally and composed.

## Remarks

Principal typing is what makes ML-family languages (Standard ML, OCaml, Haskell) usable without explicit type annotations: the compiler reconstructs the most general type. Adding polymorphism (System F) breaks principal typing in general; the Hindley-Milner system carves out a restricted polymorphic fragment for which principal typing is recovered. Reference: [Pierce 2002](references/pierce2002.md) §22, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) §3.6.
