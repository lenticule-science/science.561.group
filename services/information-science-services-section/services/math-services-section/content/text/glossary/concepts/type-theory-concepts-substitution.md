---
type: concept
class: syntactic-operation
status: current
depends-on: [variable, binder]
title: Substitution
description: Substitution is the operation of replacing every free occurrence of a variable in a term with another term.
---

# Substitution

*Substitution* is the operation of replacing every free occurrence of a [variable](../../documents/articles/research/2026/07/31/lenticule-import/_archive/variable.md) in a term with another term. The notation $M[N/x]$ means "the term $M$ with every free occurrence of $x$ replaced by $N$." Substitution is the engine of [beta-reduction](../terms/beta-reduction.md): the rule $(\lambda x.\,M)\;N \to_\beta M[N/x]$ uses substitution to apply a function to its argument.

Substitution is *capture-avoiding*: when substituting under a [binder](../terms/binder.md), bound variables in $M$ that would accidentally capture free variables of $N$ must be renamed first via [alpha-conversion](../terms/alpha-conversion.md). The capture-avoiding form is the only form that respects the meaning of terms; uncareful substitution silently produces wrong results.

## Position

Substitution is one of the two binder-aware operations of the calculus; [alpha-equivalence](../terms/alpha-equivalence.md) is the other. The corresponding operator note is [substitution-operator](../terms/substitution-operator.md). Categorically, substitution along a projection is precisely what [pi-types](../terms/pi-type.md) and the [universal quantifier](../terms/quantifier.md) are right-adjoint to (the Beck-Chevalley setup). Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §2.1, [Pierce 2002](../../documents/articles/bibliographies/pierce2002.md) §5.3.
