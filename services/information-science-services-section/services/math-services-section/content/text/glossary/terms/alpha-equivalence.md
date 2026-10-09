---
term-kind: concept
class: equivalence-relation
status: current
depends-on: [variable, binder]
---

# Alpha-equivalence

*Alpha-equivalence* is the equivalence relation on [lambda-terms](./lambda-term.md) declaring that the names chosen for bound [variables](./variable.md) do not matter. The terms $\lambda x.\,x$ and $\lambda y.\,y$ are alpha-equivalent: both denote the identity function. Formally, $M \equiv_\alpha N$ iff $N$ is obtained from $M$ by consistently renaming bound variables. The act of performing such a renaming is [alpha-conversion](./alpha-conversion.md).

In modern presentations, terms are taken *up to alpha-equivalence*: the syntactic objects of the theory are equivalence classes, not raw concrete syntax. This is what makes [substitution](./substitution.md) well-defined as a function on terms (rather than on raw syntax) and what makes [beta-reduction](./beta-reduction.md) a deterministic relation on terms.

## Position

Alpha-equivalence is the smallest equivalence on terms that makes [binders](./binder.md) opaque to their bound names; [beta-reduction](./beta-reduction.md) and [eta-equivalence](./eta-equivalence.md) extend it with computation rules. The de Bruijn index representation of terms (variables as natural numbers counting binders to the introducing site) makes alpha-equivalence into syntactic identity, which is convenient for proof-assistant implementations. Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §2.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
