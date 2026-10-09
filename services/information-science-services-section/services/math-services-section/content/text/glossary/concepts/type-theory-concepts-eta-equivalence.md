---
type: concept
class: rewrite-rule
status: current
depends-on: [variable, binder, beta-reduction]
title: Eta-equivalence
description: Eta-equivalence is the rule declaring that a function and its η-expansion are the same.
---

# Eta-equivalence

*Eta-equivalence* is the rule declaring that a function and its η-expansion are the same. The η-expansion of a term $M$ at a function type is $\lambda x.\,(M\;x)$ where $x$ does not occur free in $M$.

$$
\lambda x.\,(M\;x) \;=_\eta\; M \quad (x \notin \mathrm{FV}(M))
$$

Read in the η-reduction direction $\lambda x.\,(M\;x) \to_\eta M$, this strips a redundant layer of abstraction. Read as the η-equivalence $\lambda x.\,(M\;x) =_\eta M$, this expresses *function extensionality* at the syntactic level: two functions that agree on every argument are the same function.

## Position

η is optional in many calculi (the pure untyped calculus is usually presented without it), strongly relevant in others (it is mandatory for the [curry-howard-correspondence](../../documents/articles/research-articles/curry-howard-correspondence.md) to extend cleanly to product and sum types via projection-pairing and case-injection η-laws), and a delicate matter in [dependent-type-theory](../terms/dependent-type-theory.md) (where η for [identity-types](../terms/identity-type.md) is exactly what the [univalence-axiom](../terms/univalence-axiom.md) is *not*). The operator note is [eta-reduction-step](../terms/eta-reduction-step.md). Reference: [Barendregt 1984](../../documents/articles/research/2026/07/31/lenticule-import/_archive/references/barendregt1984.md) §3.3, [Sørensen & Urzyczyn 2006](../../documents/articles/bibliographies/sorensen-urzyczyn2006.md) §2.4.
