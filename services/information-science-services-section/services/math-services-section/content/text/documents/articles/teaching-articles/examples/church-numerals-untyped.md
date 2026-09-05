---
type: example
status: current
depends-on: [untyped-lambda-calculus, lambda-term, beta-reduction]
---

# Church numerals in the untyped lambda calculus

The natural numbers are encoded in the [untyped-lambda-calculus](../../../../glossary/terms/untyped-lambda-calculus.md) as functions: the *Church numeral* $\mathbf{n}$ is the function that iterates a function $f$ exactly $n$ times.

## The encoding

$$
\mathbf{0} = \lambda f.\,\lambda x.\,x, \quad
\mathbf{1} = \lambda f.\,\lambda x.\,f\;x, \quad
\mathbf{2} = \lambda f.\,\lambda x.\,f\;(f\;x), \quad
\mathbf{n} = \lambda f.\,\lambda x.\,f^n\;x.
$$

A Church numeral takes a function $f$ and a starting value $x$ and returns $f^n(x)$. The number is the iteration count.

## Arithmetic

- *Successor*: $\mathrm{SUCC} = \lambda n.\,\lambda f.\,\lambda x.\,f\;(n\;f\;x)$. Adds one application of $f$.
- *Addition*: $\mathrm{ADD} = \lambda m.\,\lambda n.\,\lambda f.\,\lambda x.\,m\;f\;(n\;f\;x)$. Composes the iteration counts.
- *Multiplication*: $\mathrm{MUL} = \lambda m.\,\lambda n.\,\lambda f.\,m\;(n\;f)$. Iterates iteration.

Worked: $\mathrm{SUCC}\;\mathbf{1} \to_\beta^* \mathbf{2}$, by [beta-reduction](../../../../glossary/terms/beta-reduction.md):

$$
(\lambda n.\,\lambda f.\,\lambda x.\,f\;(n\;f\;x))\;(\lambda f.\,\lambda x.\,f\;x) \to_\beta \lambda f.\,\lambda x.\,f\;((\lambda f.\,\lambda x.\,f\;x)\;f\;x) \to_\beta^* \lambda f.\,\lambda x.\,f\;(f\;x) = \mathbf{2}.
$$

## What this exhibits

- *Data as functions*. The untyped calculus has no built-in numbers; numbers are encoded as iteration. Booleans, pairs, lists, and trees admit similar function-based encodings.
- *Why the untyped calculus is Turing-complete*. Combined with the [y-combinator-untyped](./y-combinator-untyped.md) for recursion, Church numerals plus arithmetic are enough to encode every recursive function.
- *Why STLC cannot do this directly*. In [simply-typed-lambda-calculus](../../../../glossary/terms/simply-typed-lambda-calculus.md), Church numerals are typeable (each $\mathbf{n}$ has type $(P \to P) \to P \to P$ for any $P$), but the encoding is *not* polymorphic — addition would need a type at which $\mathbf{m}$ and $\mathbf{n}$ are both members, which forces System F-style polymorphism.
