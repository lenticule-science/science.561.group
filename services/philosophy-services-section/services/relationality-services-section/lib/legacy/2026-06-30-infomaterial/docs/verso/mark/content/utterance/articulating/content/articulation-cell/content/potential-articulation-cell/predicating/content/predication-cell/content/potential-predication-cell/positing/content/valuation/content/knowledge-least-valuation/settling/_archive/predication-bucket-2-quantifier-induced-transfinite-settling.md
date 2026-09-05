---
type: example
depends-on: [predication-settling, closure-operator, scott-continuous-closure, four-regime-dichotomy, closure-2-monad, temporal-2-category, closure-ordinal]
instantiates: [four-regime-dichotomy, closure-2-monad, temporal-infinity-requires-spatial-infinity, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
---

# Quantifier-induced transfinite settling

**Data.** $\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega + 1$ (naturals plus a limit element $\omega$), [predicate set](../objects/predicate-set.md) $\Pi = \{P\}$, [settling bound](../objects/settling-bound.md) $\lambda = \omega + 2$.

**Closure rules.**

- *Rule 1 (finitary).* $P(n, n) \Rightarrow P(n+1, n+1)$ for $n \in \mathbb{N}$.
- *Rule 2 (infinitary).* $(\forall n \in \mathbb{N}.\ P(n, n) = \mathbf{t}) \Rightarrow P(\omega, \omega) \geq_k \mathbf{t}$.

**Settling from $v_0(P)(0, 0) = \mathbf{t}$.**

- $\tau < \omega$: same as the [natural-number successor settling](natural-number-successor-settling.md) — Rule 1 propagates.
- $\tau = \omega$: $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$. Rule 2's antecedent is now satisfied for the first time.
- $\tau = \omega + 1$: Rule 2 fires. $v_{\omega+1}(P)(\omega, \omega) = \mathbf{t}$.
- $\tau = \omega + 2$: no further closure.

**Closure ordinal.** $\kappa = \omega + 1$. **[transfinite-bounded regime](../theorems/four-regime-dichotomy.md).**

**Scott-continuity check.** Rule 2's antecedent is infinitary — it cannot fire on any finite sub-collection, only at the $\omega$-limit. So $\mathrm{cl}\bigl(\bigsqcup_k v_k\bigr) \neq \bigsqcup_k \mathrm{cl}(v_k)$: the closure is not [Scott-continuous](../concepts/scott-continuous-closure.md), and [transfinite settling convergence](../theorems/transfinite-settling-convergence.md)'s hypothesis is violated.

**Closure-KZ structure.** The [closure 2-monad](../morphisms/closure-2-monad.md) is genuinely [lax-idempotent](../theorems/closure-2-monad-lax-idempotence.md) here, not strict-idempotent: $\mathrm{Cl}(v_0)$ produces $v_\omega$ (the finitely-iterated closure), and $\mathrm{Cl}(\mathrm{Cl}(v_0))$ adds the $\omega$-level consequent. The [temporal 2-category](../objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$ has non-trivial 2-cells at $\tau = \omega$ and $\tau = \omega + 1$.

**Priestley dual.** The [dual settling](../objects/dual-predication-hyperdoctrine.md) on the paired Priestley space over $\omega + 1$ has co-closure ordinal $\omega + 1$.

**Role.** Smallest natural example of temporal infinity. The universal quantifier in Rule 2 is exactly the mechanism by which non-Scott-continuity arises — the same mechanism that [temporal infinity requires spatial infinity](../theorems/temporal-infinity-requires-spatial-infinity.md) identifies as the unique source of $\kappa > \omega$. Stacking similar rules produces $\omega + 2, \omega \cdot 2, \omega^2, \ldots$ closure ordinals.
