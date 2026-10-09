---
term-kind: concept
class: syntactic-operation
status: current
depends-on: [variable, binder]
---

# Substitution

*Substitution* is the operation of replacing every free occurrence of a [variable](./variable.md) in a term with another term. The notation $M[N/x]$ means "the term $M$ with every free occurrence of $x$ replaced by $N$." Substitution is the engine of [beta-reduction](./beta-reduction.md): the rule $(\lambda x.\,M)\;N \to_\beta M[N/x]$ uses substitution to apply a function to its argument.

Substitution is *capture-avoiding*: when substituting under a [binder](./binder.md), bound variables in $M$ that would accidentally capture free variables of $N$ must be renamed first via [alpha-conversion](./alpha-conversion.md). The capture-avoiding form is the only form that respects the meaning of terms; uncareful substitution silently produces wrong results.

## Position

Substitution is one of the two binder-aware operations of the calculus; [alpha-equivalence](./alpha-equivalence.md) is the other. The corresponding operator note is [substitution-operator](./substitution-operator.md). Categorically, substitution along a projection is precisely what [pi-types](./pi-type.md) and the [universal quantifier](./quantifier.md) are right-adjoint to (the Beck-Chevalley setup). Reference: [Barendregt 1984](../../documents/articles/bibliographies/barendregt1984.md) §2.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
