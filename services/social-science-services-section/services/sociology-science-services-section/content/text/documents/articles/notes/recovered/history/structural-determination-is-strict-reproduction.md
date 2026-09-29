---
type: theorem
status: sketch
depends-on: [social-settling, social-base, structural-determination, habitus-closure, capital-fiber-bundle, four-regime-dichotomy]
---

# Structural determination correlates with strict-regime settling

A social agent $e$ is *highly structurally determined* — their action-predicate cells are tightly constrained by their positional profile — if and only if the closure operator restricted to $e$'s action-predicate cells lives in the strict regime: the closure ordinal of $\mathrm{cl}|_{\Phi_{\mathrm{action}}^e}$ is finite.

## Statement

Let $\Pi_e^\tau$ be $e$'s positional profile at stage $\tau$, and let $\Phi_{\mathrm{action}}^e$ be the action-predicate cells for $e$. Define the *determination coefficient* $\Delta(e)$ as the fraction of action cells whose values are fully determined by positional cells via direct antecedent chains in $\mathcal{S}_{\mathrm{soc}}$:

$$\Delta(e) \;=\; \frac{\bigl|\{\phi \in \Phi_{\mathrm{action}}^e : v_\tau(\phi) \text{ is determined by } \Pi_e^\tau \text{ via finite rule-chain}\}\bigr|}{|\Phi_{\mathrm{action}}^e|}$$

**Theorem.** $\Delta(e) = 1$ if and only if the closure operator $\mathrm{cl}|_{\Phi_{\mathrm{action}}^e}$ is strict-regime (closure ordinal $\kappa < \omega$) under any increment sequence consistent with $e$'s positional evidence.

## Sketch

**(⇒) Full determination implies strict regime.**

Suppose $\Delta(e) = 1$: every action cell has a finite rule chain from positional cells to its value. By assumption, each antecedent chain is finite (the chain terminates at positional cells, which are themselves settled by $\Pi_e^\tau$). Therefore, the closure operator on action cells fires in finitely many steps: apply the rules in topological order of their antecedent chains. The closure ordinal is bounded by the maximum chain length, which is finite by the finiteness of the rule set in $\mathcal{S}_{\mathrm{soc}}$. Hence the closure operator is strict-regime. $\square$ (forward).

**(⇐) Strict regime implies full determination.**

Suppose the closure operator $\mathrm{cl}|_{\Phi_{\mathrm{action}}^e}$ is strict-regime: the closure ordinal is $\kappa < \omega$. Then the closure reaches a fixed point in finitely many steps for any increment sequence consistent with $\Pi_e^\tau$. At the fixed point, every action cell has a settled value derived from the antecedent cells that fired in the closure sequence. If those antecedent cells all lie in $\Pi_e^\tau$ (the positional profile), then the determination is positional — the action cells are determined by position. If some antecedent cells are action-predicate cells themselves (action cells determining other action cells), the chain terminates at positional cells (since the rule chain is finite and the social base's closure rules are positional-antecedented at the base). Hence all action cell values are derivable from the positional profile in finite steps: $\Delta(e) = 1$. $\square$ (reverse).

## Corollary: high capital correlates with predictable action

By the [capital fiber bundle](../objects/capital-fiber-bundle.md), an agent's positional profile $\Pi_e^\tau$ is a function of their capital section $\kappa_e$. Agents with high, settled capital sections (all capital cells at $\mathbf{t}$ or $\mathbf{f}$, no $\top$ states) have settled positional profiles. Settled positional profiles are the antecedents for the action-predicate closure rules. Hence high, settled capital correlates with dense, fast-firing action rules — and by this theorem, with strict-regime action-cell settling.

This is the substrate-algebraic content of the sociological observation that privilege is predictive: agents in dominant social positions (high capital, settled positional profile) have their trajectories structurally determined with high reliability. Their actions are not free in any deep sense — they are structurally predicted by the accumulated evidence of their position.

Conversely, agents with $\bot$ or $\top$ capital states (undocumented, displaced, contested standing) have action-predicate cells that are less antecedented — their closure rules fire on partial or contradicted positional inputs, producing more indeterminate action-cell values. This structural indeterminacy is experienced as precarity: the social system is not predicting their actions because the positional antecedents are unsettled.

## Caveat: reflexivity and meta-positional rules

This theorem holds under the assumption that the closure rules in $\mathcal{S}_{\mathrm{soc}}$ are positional-antecedented at the base: ultimately derived from positional cells, not from action cells feeding back into themselves. When reflexive agents produce theoretical or political accounts of their own structural position — when action (producing a critical account) changes the positional predicate cells (recognized as a structural analyst, rather than a structural participant) — the antecedent chain is no longer purely positional-to-action. The meta-positional rule (producing a structural account changes position) creates a feedback loop that may move the action-cell closure into Scott-continuous or transfinite-bounded territory.

This is the substrate-algebraic content of reflexivity as a structural resource: theoretical knowledge of one's own structural determination is a closure rule that feeds back into the positional profile, potentially breaking the strict-regime determination that it diagnoses.
