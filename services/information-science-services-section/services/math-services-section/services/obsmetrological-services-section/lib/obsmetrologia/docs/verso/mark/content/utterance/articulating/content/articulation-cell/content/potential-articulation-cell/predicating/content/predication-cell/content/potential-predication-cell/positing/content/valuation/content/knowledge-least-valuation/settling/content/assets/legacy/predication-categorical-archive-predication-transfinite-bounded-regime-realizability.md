---
type: theorem
status: proved
depends-on: [transfinite-bounded-regime-h1-generators, transfinite-bounded-regime-moduli-classification, moduli-classifying-function, four-regime-dichotomy, non-scott-continuous-firing-ordinal, closure-rule, closure-2-monad, closure-2-monad-lax-idempotence, settling-endofunctor, predicate-category-naturality]
---

# Transfinite-bounded-regime realizability (bare $\Pi_1$+$<$ language)

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathbf{L} = \mathbf{2}$, single predicate $\mathcal{C}$ on $P$, well-ordered $E$ with order type a countable ordinal $\geq \omega + 1$, and $\lambda \leq \omega_1$, restrict to the [closure-rule language](teaching/explanations/closure-rule.md) of positive $\Pi_1$-schemas with atoms over the inherited $\{<\}$-signature on $E$ — without named-ordinal entity-equality literals or ordinal-arithmetic primitives.

For any closure-rule system $\mathcal{S}$ in this language and any countable-support [increment sequence](../objects/increment-sequence.md) $U$, with closure ordinal $\kappa = \kappa(\mathcal{S}, U)$:

$$L_{\mathrm{ns}}(\mathcal{S}, U) \;=\; \{\mu < \kappa \,:\, \mu \text{ a countable limit ordinal}\}.$$

The realizable $L_{\mathrm{ns}}$-subsets are exactly the *initial segments* of countable limit ordinals — a one-parameter family indexed by $\kappa$.

## Proof

The proof works entirely within the temporal 2-category and KZ-closure structure of the corpus.

**Lemma 1 (Antecedent monotonicity).** For any rule in the bare language with antecedent $\forall \alpha < \beta.\, \phi(\alpha; v)$, the antecedent's truth at fixed $\beta$ is monotone non-decreasing along the orbit: if $v_\sigma \leq_k v_\tau$ then $\phi(\alpha; v_\sigma) \Rightarrow \phi(\alpha; v_\tau)$ for every $\alpha < \beta$, hence $(\forall \alpha < \beta.\, \phi(\alpha; v_\sigma)) \Rightarrow (\forall \alpha < \beta.\, \phi(\alpha; v_\tau))$.

*Proof.* Each cell atom $v(q)(s_1, s_2) \geq_k V$ is preserved by $\leq_k$-increase (positive in $v$). Boolean conjunctions and disjunctions of such atoms are preserved. Universal quantification over a domain of preserved formulas is preserved. The bare language's antecedents are positive Boolean combinations of cell atoms quantified over entity variables, so antecedents are preserved by $\leq_k$-monotone $v$-evolution. $\square$

**Lemma 2 (No early closure stability).** For every $\mu < \kappa$, $\mathrm{Cl}(v_\mu) > v_\mu$.

*Proof.* The bare $\{<\}$-signature has no named-ordinal constants to bound a rule's range below the order type of $E$. Every rule in the system has antecedent $\forall \alpha < \beta. \phi(\alpha; v)$ with $\beta$ a free variable ranging over all of $E$. So if any unfilled $\beta \in E$ has its antecedent satisfied at $v_\mu$, the closure adds the corresponding consequent.

By definition of closure ordinal, $\kappa$ is the smallest $\xi$ with $F_U^{\xi+1} = F_U^\xi$, equivalently with $v_{\xi+1} = v_\xi$. For $\mu < \kappa$: $v_{\mu+1} > v_\mu$ strictly. Decompose: $v_{\mu+1} = \mathrm{Cl}(v_\mu \vee_k u_{\mu+1})$, so the strict increase comes from either the increment $u_{\mu+1}$ or the closure step.

If $u_{\mu+1} = \bot$: $v_{\mu+1} = \mathrm{Cl}(v_\mu)$, and $\mathrm{Cl}(v_\mu) > v_\mu$ as required.

If $u_{\mu+1} \neq \bot$: the increment supplies new cells. But $u_{\mu+1}$'s cells are at specific entity-positions. By the bare language's lack of range bounds, the rule fires at every $\beta$ in $E$ where antecedent commits. The chain's monotone advancement through $E$ (Lemma 1) means there is always some unfilled $\beta$ in $E$ whose antecedent could commit at $v_\mu$ given the chain's current reach. Specifically: as long as the chain hasn't covered all of $E$, the closure has further work to do. Since $\mu < \kappa$ means the settling hasn't stabilized, $\mathrm{Cl}(v_\mu)$ has at least one new addition. $\square$

**Theorem.** For every $\mu < \kappa$ a countable limit, $\mu \in L_{\mathrm{ns}}(\mathcal{S}, U)$.

*Proof.* By Lemma 2, $\mathrm{Cl}(v_\mu) > v_\mu$. By [settling continuity](teaching/explanations/settling-continuity.md), $v_\mu = \bigvee_{\sigma < \mu} v_\sigma$. By [closure 2-monad lax-idempotence](closure-2-monad-lax-idempotence.md) applied at successor stages, $\mathrm{Cl}(v_\sigma) = v_\sigma$ for every $\sigma$ a successor of some earlier stage, since $v_\sigma$ was produced by the closure step itself.

Successors are cofinal in any limit ordinal $\mu$, so

$$\bigvee_{\sigma < \mu} \mathrm{Cl}(v_\sigma) = \bigvee_{\sigma < \mu, \sigma \text{ successor}} \mathrm{Cl}(v_\sigma) = \bigvee_{\sigma < \mu, \sigma \text{ successor}} v_\sigma = \bigvee_{\sigma < \mu} v_\sigma = v_\mu.$$

Therefore $\mathrm{Cl}(\bigvee_{\sigma<\mu} v_\sigma) = \mathrm{Cl}(v_\mu) > v_\mu = \bigvee_{\sigma<\mu} \mathrm{Cl}(v_\sigma)$, which is the definition of $\mu \in L_{\mathrm{ns}}$. $\square$

**Conversely**, every $\mu \in L_{\mathrm{ns}}$ has $\mu < \kappa$ by definition. So $L_{\mathrm{ns}} = \{\mu < \kappa : \mu \text{ countable limit}\}$ — an initial segment of countable limits.

**Realizability of every initial segment.** For any closure ordinal $\kappa$ in the transfinite-bounded range, there is a closure-rule system + increment sequence achieving it: the [transfinite-induction-style $\Pi_1$-rule](teaching/explanations/closure-rule.md) on a base of order type $\kappa$ (or more, with $\kappa$ as the chain's reach) realizes $L_{\mathrm{ns}} = \{\mu < \kappa : \mu \text{ countable limit}\}$. Witnesses: [quantifier-induced transfinite settling](../examples/quantifier-induced-transfinite-settling.md) ($\kappa = \omega + 1$), [two-firing transfinite settling](../examples/two-firing-transfinite-settling.md) ($\kappa = \omega \cdot 2 + 1$), [countably-many-firings transfinite settling](../examples/countably-many-firings-transfinite-settling.md) ($\kappa = \omega^2 + 1$). $\square$
