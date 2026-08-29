---
type: term
term-kind: definition
class: type-former
status: current
depends-on: [function-type, binder, universe]
symbol: "\\Pi(x : A).\\,B(x)"
---

# Pi type

A **Pi type** $\Pi(x : A).\,B(x)$ is the type of dependent functions: functions whose output type may depend on the input value. When $B$ does not depend on $x$, the Pi type degenerates to the ordinary [function-type](./function-type.md) $A \to B$.

## Structure

- **Formation.** From $\Gamma \vdash A : \mathrm{Type}$ and $\Gamma, x : A \vdash B : \mathrm{Type}$, form $\Gamma \vdash \Pi(x : A).\,B : \mathrm{Type}$.
- **Introduction.** From $\Gamma, x : A \vdash M : B$, conclude $\Gamma \vdash \lambda x.\,M : \Pi(x : A).\,B$.
- **Elimination.** From $\Gamma \vdash M : \Pi(x : A).\,B$ and $\Gamma \vdash N : A$, conclude $\Gamma \vdash M\;N : B[N/x]$.
- **β-rule.** $(\lambda x.\,M)\;N \equiv M[N/x]$ at type $B[N/x]$.
- **η-rule.** $\lambda x.\,(M\;x) \equiv M$ when $x$ does not occur free in $M$.

## What this is not

A Pi type is *not* a [function-type](./function-type.md) in general — it is dependent. A Pi type is *not* a [sigma-type](./sigma-type.md): Π is universal, Σ is existential. A Pi type is *not* the same as set-theoretic dependent product (the Cartesian product of a family) — it carries the computational content of how the dependence is realized.

## Position

The Pi type is *universal quantification* under the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md): $\Pi(x : A).\,P(x)$ is the proposition $\forall x : A.\,P(x)$, and a closed term is a uniform proof of $P(x)$ for every $x$. Categorically, Π is the right adjoint to substitution along a projection — the same adjunction that defines the [universal quantifier in logic](./quantifier.md), now read as a type former. The downstream `depends-on: [pi-type]` edge from `logic/concepts/quantifier.md` makes that exact correspondence typographically explicit. Reference: [Martin-Löf 1984](../../documents/articles/bibliographies/martin-lof1984.md), [Univalent Foundations Program 2013](../../documents/articles/bibliographies/univalent-foundations2013.md) §1.4.
