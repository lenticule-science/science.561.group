---
type: concept
class: equivalence-relation
status: current
depends-on: [variable, binder]
title: Alpha-equivalence
description: Alpha-equivalence is the equivalence relation on lambda-terms declaring that the names chosen for bound variables do not matter.
---

# Alpha-equivalence

*Alpha-equivalence* is the equivalence relation on [lambda-terms](../terms/lambda-term.md) declaring that the names chosen for bound [variables](../../documents/articles/research/2026/07/31/lenticule-import/_archive/variable.md) do not matter. The terms $\lambda x.\,x$ and $\lambda y.\,y$ are alpha-equivalent: both denote the identity function. Formally, $M \equiv_\alpha N$ iff $N$ is obtained from $M$ by consistently renaming bound variables. The act of performing such a renaming is [alpha-conversion](../terms/alpha-conversion.md).

In modern presentations, terms are taken *up to alpha-equivalence*: the syntactic objects of the theory are equivalence classes, not raw concrete syntax. This is what makes [substitution](../terms/substitution.md) well-defined as a function on terms (rather than on raw syntax) and what makes [beta-reduction](../terms/beta-reduction.md) a deterministic relation on terms.

## Position

Alpha-equivalence is the smallest equivalence on terms that makes [binders](../terms/binder.md) opaque to their bound names; [beta-reduction](../terms/beta-reduction.md) and [eta-equivalence](../terms/eta-equivalence.md) extend it with computation rules. The de Bruijn index representation of terms (variables as natural numbers counting binders to the introducing site) makes alpha-equivalence into syntactic identity, which is convenient for proof-assistant implementations. Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §2.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
