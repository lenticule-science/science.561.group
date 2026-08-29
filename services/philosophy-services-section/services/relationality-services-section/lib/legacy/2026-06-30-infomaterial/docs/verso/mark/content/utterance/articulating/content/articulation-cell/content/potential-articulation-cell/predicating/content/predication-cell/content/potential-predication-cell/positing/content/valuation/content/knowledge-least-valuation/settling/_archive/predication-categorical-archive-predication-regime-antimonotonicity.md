---
type: theorem
status: proved
depends-on: [regime-chain-order, antecedent-regime-bound, four-regime-dichotomy, closure-ordinal, non-scott-continuous-firing-ordinal]
see-also: [closure-rule-system, settling-convergence, antecedent-regime-bound]
---

# Regime is antimonotone under closure-rule system inclusion

Let $\mathcal{S}' \subseteq \mathcal{S}$ be [closure-rule systems](teaching/explanations/closure-rule-system.md) over the same base $B$. Then

$$\mathrm{reg}(\mathcal{S}') \;\leq\; \mathrm{reg}(\mathcal{S})$$

in the [regime chain order](regime-chain-order.md). Removing rules from a closure-rule system cannot increase the settling regime.

## Proof

Let $L_{\mathrm{ns}}(\mathcal{S})$ denote the set of [non-Scott-continuous firing ordinals](teaching/explanations/non-scott-continuous-firing-ordinal.md) of $\mathcal{S}$. Every firing at a limit ordinal $\mu$ under $\mathcal{S}'$ uses a rule $r \in \mathcal{S}'$; since $\mathcal{S}' \subseteq \mathcal{S}$, $r \in \mathcal{S}$ also. Hence every non-Scott-continuous firing of $\mathcal{S}'$ is also a non-Scott-continuous firing of $\mathcal{S}$:

$$L_{\mathrm{ns}}(\mathcal{S}') \;\subseteq\; L_{\mathrm{ns}}(\mathcal{S}).$$

The closure ordinal $\kappa(\mathcal{S})$ is determined by the supremum of non-Scott-continuous firing ordinals (plus the Scott-continuous settling time after the last such ordinal, which is at most $\omega$). Since $L_{\mathrm{ns}}(\mathcal{S}') \subseteq L_{\mathrm{ns}}(\mathcal{S})$:

$$\kappa(\mathcal{S}') \;\leq\; \kappa(\mathcal{S}).$$

By the [regime chain order](regime-chain-order.md), the regime label is a monotone function of $\kappa$, so $\kappa(\mathcal{S}') \leq \kappa(\mathcal{S})$ implies $\mathrm{reg}(\mathcal{S}') \leq \mathrm{reg}(\mathcal{S})$. $\square$

## Corollary — Regime as a monotone functor

The regime label defines a monotone map $\mathrm{reg}: (\mathrm{Sub}(\mathcal{S}), \subseteq)^{\mathrm{op}} \to (\{A,B,C,D\}, \leq)$ from the inclusion-ordered set of closure-rule sub-systems, ordered *contravariantly* (smaller rule set $\mapsto$ lower or equal regime). Equivalently, regime is a monotone map $(\mathrm{Sub}(\mathcal{S}), \supseteq) \to (\{A,B,C,D\}, \leq)$: adding rules can only increase the regime.

## Corollary — NSC-rule removal decreases or preserves regime

Let $\mathcal{S}_{\mathrm{nsc}} = \{r \in \mathcal{S} : r \text{ has a universal antecedent over an infinite domain}\}$ be the set of non-Scott-continuous rules of $\mathcal{S}$. Then $\mathcal{S}' = \mathcal{S} \setminus \mathcal{S}_{\mathrm{nsc}}$ is the maximal quantifier-free sub-system of $\mathcal{S}$, and by [antecedent-regime-bound](antecedent-regime-bound.md) Part 1:

$$\mathrm{reg}(\mathcal{S}') \;\leq\; \mathrm{scott\text{-}cont}.$$

Removing all non-Scott-continuous rules drops the regime to at most Scott-continuous, regardless of the original regime of $\mathcal{S}$.

## What this theorem does not claim

- The drop in regime may be strict or may be equality. If $\mathcal{S}$ is already in the strict regime, removing rules still gives strict regime. If $\mathcal{S}$ is aperiodic but $\mathcal{S}'$ removes the rules responsible for the $\omega_1$-cofinality, the regime drops; if $\mathcal{S}'$ still has rules producing $\omega_1$-many non-Scott-continuous firings, the regime stays aperiodic.

- This theorem does not bound the *rate* of regime descent. The regime change (if any) is determined entirely by which non-Scott-continuous firing ordinals are removed, not by the cardinality of $\mathcal{S} \setminus \mathcal{S}'$.

## Engineering consequence

The settlement-path maturation (F₀ → F₁ → F₂ → F₃) is a sequence of *rule replacements* — infinite-antecedent inference rules are replaced by finite-antecedent substrate records. Each replacement removes non-Scott-continuous rules from the system governing the operative element and replaces them with quantifier-free rules. By this theorem and [antecedent-regime-bound](antecedent-regime-bound.md), each such replacement cannot increase the regime and the replacement with quantifier-free rules forces the regime to $\leq \mathrm{scott\text{-}cont}$. The engineering theorem's "strict regime-descent" claim is a corollary.
