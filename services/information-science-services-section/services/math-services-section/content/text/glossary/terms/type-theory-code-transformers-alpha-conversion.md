---
type: definition
class: syntactic-operator
status: current
depends-on: [alpha-equivalence, binder]
name: Alpha-conversion
description: Alpha-conversion is the operation of consistently renaming a bound variable in a lambda-term.
---

# Alpha-conversion

**Alpha-conversion** is the operation of consistently renaming a bound [variable](../../documents/articles/research/2026/07/31/lenticule-import/_archive/teaching/explanations/variable.md) in a [lambda-term](lambda-term.md). Replacing the bound $x$ in $\lambda x.\,M$ with a fresh $y$ produces $\lambda y.\,M[y/x]$, which is [alpha-equivalent](alpha-equivalence.md) to the original.

## Definition

For a fresh $y$ (not free in $M$ and not equal to $x$):

$$
\lambda x.\,M \;\equiv_\alpha\; \lambda y.\,M[y/x].
$$

The fresh-variable side condition is what avoids accidental name clashes. Iterating α-conversion produces all alpha-equivalent representatives of a term.

## Properties

- α-conversion is invertible (it produces an α-equivalence, not just a one-way reduction).
- Every term has *some* representative in which all bound variables are pairwise distinct and distinct from every free variable — the *Barendregt convention*. Operating under this convention removes the need for explicit α-conversion in most arguments.
- The de Bruijn index representation eliminates α-conversion entirely: bound variables are natural-number distances to their binders, so terms equal up to α-conversion become syntactically identical.

## Position

α-conversion is the operator that realises the [alpha-equivalence](alpha-equivalence.md) concept; it is the renaming that [substitution-operator](substitution-operator.md) invokes to avoid capture. Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §2.1.
