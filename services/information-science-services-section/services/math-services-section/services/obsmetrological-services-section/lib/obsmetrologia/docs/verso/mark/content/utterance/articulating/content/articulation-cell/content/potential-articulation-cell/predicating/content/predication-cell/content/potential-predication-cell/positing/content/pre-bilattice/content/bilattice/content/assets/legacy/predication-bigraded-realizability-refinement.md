---
type: theorem
status: proved
depends-on: [transfinite-bounded-regime-realizability, aperiodic-regime-realizability, bigraded-aperiodic-regime-trichotomy, paraconsistent-classification, bigraded-settling-cohomology, inconsistency-sheaf, settling-associated-sheaf, four-regime-dichotomy]
---

# Bigraded realizability refinement

A refinement of [transfinite-bounded-regime realizability](../../../../../../valuation/content/knowledge-least-valuation/settling/references/transfinite-bounded-regime-realizability.md) and [aperiodic-regime realizability](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-realizability.md) along the bigraded value-type axis. Within each of the two non-trivial-cohomology regimes, the [bigraded classifying invariant](../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) $(c_t, c_\top) \in H^1_t \oplus H^1(\mathcal{F}_U^{(\top)})$ has independently-realizable components on a *discrete* predicate category.

**Claim.** Let $B$ be a base in either the transfinite-bounded or aperiodic regime, with discrete $\mathcal{C}$ on $\geq 2$ predicates. The realizable bigraded classes in the bare $\Pi_1$+$<$ rule language are exactly pairs $(\mathbf{1}_{S_t}, \mathbf{1}_{S_\top})$ where each of $S_t, S_\top$ is an initial segment of countable limit ordinals (with possibly different upper bounds $\eta_t, \eta_\top$ in the regime's range).

The realizable family is a *two-parameter* family indexed by $(\eta_t, \eta_\top)$, with the [bigraded aperiodic-regime trichotomy](../../../../../../valuation/content/knowledge-least-valuation/settling/references/bigraded-aperiodic-regime-trichotomy.md)'s sub-strata distributed by:

- **Consistent** ($\eta_\top = $ "no firings", $\mathbf{1}_{S_\top} = 0$): the family $\{(\mathbf{1}_{S_t}, 0) : S_t \text{ an initial segment}\}$.
- **Paraconsistent** ($\eta_t = $ "no firings", $\mathbf{1}_{S_t} = 0$): the family $\{(0, \mathbf{1}_{S_\top}) : S_\top \text{ an initial segment}\}$.
- **Mixed** (both non-zero): the family $\{(\mathbf{1}_{S_t}, \mathbf{1}_{S_\top}) : S_t, S_\top \text{ both non-empty initial segments}\}$.

## Proof

**Lower bound (constructive).** Given an initial-segment pair $(S_t, S_\top)$, construct a settling on $\mathcal{C} = \{P, Q\}$ (two-object discrete category) by combining:

- A truth-side rule on $P$: $(\forall \alpha < \beta.\, v(P)(\alpha, \alpha) \geq_k \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$, with $E_P$ chosen so that the chain reach is $\eta_t$. Realizes $L_{\mathrm{ns}}^{(t,P)} = S_t$.
- An inconsistency-side rule on $Q$: $(\forall \alpha < \beta.\, v(Q)(\alpha, \alpha) \geq_k \top) \Rightarrow v(Q)(\beta, \beta) \geq_k \top$, with $E_Q$ chosen so that the chain reach is $\eta_\top$. Realizes $L_{\mathrm{ns}}^{(\top,Q)} = S_\top$.

By [mixed-stratum two-firing settling](../examples/mixed-stratum-two-firing-settling.md)'s construction, the two rules act independently on disjoint fibers (since $\mathcal{C}$ is discrete), and the resulting settling has $\mathrm{cl}\text{-}\mathrm{inv}^{(k,t)}(v) = (\mathbf{1}_{S_t}, \mathbf{1}_{S_\top})$.

**Upper bound (no other classes realized).** With discrete $\mathcal{C}$, the closure operator's $\mathcal{C}$-naturality is vacuous (no inter-predicate morphisms to coordinate), so per-predicate firings are independent. By [transfinite-bounded-regime realizability](../../../../../../valuation/content/knowledge-least-valuation/settling/references/transfinite-bounded-regime-realizability.md) and [aperiodic-regime realizability](../../../../../../valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-realizability.md), each per-predicate per-value-type $L_{\mathrm{ns}}$-component is an initial segment of countable limit ordinals. The bigraded classifying invariant therefore has each of its two components an initial-segment indicator function.

The per-component proofs are independent because of $\mathcal{C}$ discreteness: the closure operator restricts to each fiber separately, and within each fiber the rule's value-type ($\mathbf{t}$ or $\top$) determines which sheaf the firing contributes to. Each fiber's realizability is independently characterized by its per-regime theorem. $\square$

## Coupling cross-axis

Whether bigraded value-type independence persists when $\mathcal{C}$ has non-trivial morphisms is the natural cross-axis question. Specifically: with a specialization $f : Q \to P$, can we still independently choose $S_t$ at $P$ and $S_\top$ at $Q$? The answer involves whether $f$ is required to commute with the value-type splitting — a structural question about the closure 2-monad's interaction with the bigraded sheaf decomposition.

This sub-question is open and not addressed by this theorem; the theorem's scope is restricted to discrete $\mathcal{C}$.
