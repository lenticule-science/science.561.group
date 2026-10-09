---
kind: theorem
status: proved
depends-on: [aperiodic-regime-classification, aperiodic-regime-moduli-classification, aperiodic-classifying-invariant, transfinite-bounded-regime-realizability, moduli-classifying-function, four-regime-dichotomy, non-scott-continuous-firing-ordinal, closure-rule, closure-2-monad-lax-idempotence, settling-endofunctor]
---

# Aperiodic-regime realizability (bare $\Pi_1$+$<$ language)

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathbf{L} = \mathbf{2}$, single predicate $\mathcal{C}$ on $P$, $E = \omega_1$ (or any well-ordered $E$ of cofinality $\omega_1$), and $\lambda = \omega_1 + 1$, restrict to the bare [closure-rule language](../concepts/closure-rule.md) of positive $\Pi_1$-schemas with atoms over the inherited $\{<\}$-signature on $E$.

For any closure-rule system $\mathcal{S}$ in this language and any countable-support increment sequence $U$, with closure ordinal $\kappa = \kappa(\mathcal{S}, U) \leq \omega_1$:

$$L_{\mathrm{ns}}(\mathcal{S}, U) \;=\; \{\mu < \kappa \,:\, \mu \text{ a countable limit ordinal}\}.$$

The realizable $L_{\mathrm{ns}}$-subsets at the $\omega_1$-scale are exactly the *initial segments* of countable limit ordinals up to $\omega_1$.

## Proof

The same structural argument as in [transfinite-bounded-regime realizability](../../../references/transfinite-bounded-regime-realizability.md) lifts to the $\omega_1$-scale.

The bare-language structural lemmas (antecedent monotonicity, no early closure stability) and the closure-non-Scott-continuity argument are scale-independent — they hold for any countable-or-$\omega_1$ closure ordinal.

For $\kappa = \omega_1$ specifically: the direct-limit structure of [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md) Step 1 ensures that per-truncation realizability composes. For each $\tau < \omega_1$, the truncated settling $v|_{[0, \tau]}$ falls in the transfinite-bounded or Scott-continuous regime, and its $L_{\mathrm{ns}} \cap [0, \tau)$ is an initial segment of countable limits below $\tau$ (by the per-regime theorem). The colimit over $\tau \to \omega_1$ produces $L_{\mathrm{ns}}(\mathcal{S}, U) = \{\mu < \omega_1 : \mu \text{ countable limit}\}$, as the directed union of initial segments is an initial segment up to the supremum. $\square$

**Realizability of every initial segment up to $\omega_1$.** For each $\kappa \leq \omega_1$, an explicit construction realizes $L_{\mathrm{ns}} = \{\mu < \kappa : \mu \text{ countable limit}\}$. For $\kappa < \omega_1$: by the transfinite-bounded construction. For $\kappa = \omega_1$: by [transfinite-induction settling](../examples/transfinite-induction-settling.md) on $E = \omega_1$, which realizes $L_{\mathrm{ns}} = \{$all countable limits$\}$. $\square$

## Reading

The aperiodic regime's realizability extends the transfinite-bounded statement to the $\omega_1$-scale. The same structural proof — antecedent monotonicity + chain advancement forcing closure non-commutation at limits — works at countable bounded $\kappa$ and at $\kappa = \omega_1$. The aperiodic regime is structurally distinguished from transfinite-bounded by the *cofinality* of $E$ (state-space cofinality $\geq \omega_1$ permits $\kappa = \omega_1$), but the realizability characterization itself is uniform.

The maximal realizable class — $L_{\mathrm{ns}} = \{$all countable limits$\}$ — is the canonical class of the [transfinite-induction settling](../examples/transfinite-induction-settling.md), realized by the rule's chain reaching the full $\omega_1$-cofinal entity set.

## Position in the realizability program

Closes the per-regime realizability theorems for non-trivial-cohomology regimes. With this and [transfinite-bounded-regime realizability](../../../references/transfinite-bounded-regime-realizability.md), the bare-language realizable family is fully characterized: initial segments of countable limit ordinals, parametrized by closure ordinal in $[\omega, \omega_1]$.

Refines via the same three axes — [bigraded](../../../references/bigraded-realizability-refinement.md), [$\mathcal{C}$-naturality](c-naturality-coupling-realizability-refinement.md), and [rule-language](rule-language-fragment-realizability-refinement.md) — as the transfinite-bounded version.
