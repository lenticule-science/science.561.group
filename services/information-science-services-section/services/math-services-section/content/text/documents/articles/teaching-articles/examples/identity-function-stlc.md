---
type: example
status: current
depends-on: [simply-typed-lambda-calculus, function-type, typing-judgment]
---

# The identity function in STLC

The identity function $\lambda x.\,x$ is the smallest non-trivial typed term. This example walks the typing derivation step by step.

## The term and its type

For any base type $P$:

$$
\vdash (\lambda x.\,x) : P \to P
$$

The same syntactic term can be typed at different types — $P \to P$, $Q \to Q$, $(P \to Q) \to (P \to Q)$, etc. — but the [principal-typing-stlc](../../research-articles/principal-typing-stlc.md) theorem says there is a *most general* one: $\alpha \to \alpha$ for a type variable $\alpha$. Every other typing is an instance.

## Derivation

Apply the abstraction rule:

$$
\frac{\Gamma, x : P \vdash x : P}{\Gamma \vdash \lambda x.\,x : P \to P} \quad (\text{abs})
$$

The premise is the variable rule with $\Gamma = \emptyset$:

$$
\frac{}{x : P \vdash x : P} \quad (\text{var})
$$

Done. The full derivation is two rule applications.

## What this exhibits

- *The smallest closed inhabitant of a function type.* Every function type $A \to A$ has at least this one inhabitant, the identity.
- *The Curry-Howard image.* Under the [curry-howard-correspondence](../../research-articles/curry-howard-correspondence.md), the same derivation is a proof of $P \Rightarrow P$ — the trivial implication, true by the assumption.
- *The behaviour under reduction.* For any closed term $N : P$, $(\lambda x.\,x)\;N \to_\beta x[N/x] = N$. The identity returns its argument.
- *The polymorphic generalisation.* Allowing System F-style polymorphism, the identity has type $\Pi(\alpha : \mathrm{Type}).\,\alpha \to \alpha$ — the polymorphic identity. In [dependent-type-theory](../../../../glossary/terms/dependent-type-theory.md) this is $\lambda \alpha.\,\lambda x.\,x$ at type $\Pi(\alpha : \mathrm{Type}).\,\alpha \to \alpha$.
