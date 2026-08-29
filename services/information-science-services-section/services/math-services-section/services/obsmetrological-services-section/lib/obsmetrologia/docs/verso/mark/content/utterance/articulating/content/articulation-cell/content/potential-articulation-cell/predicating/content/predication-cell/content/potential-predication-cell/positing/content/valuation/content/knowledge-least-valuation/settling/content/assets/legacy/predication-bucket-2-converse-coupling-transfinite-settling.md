---
type: example
status: verified
depends-on: [predication-settling, closure-rule, closure-operator, predicate-category, predicate-converse, predicate-category-naturality, four-regime-dichotomy, non-scott-continuous-firing-ordinal, settling-associated-sheaf, c-naturality-coupling-realizability-refinement]
instantiates: [predicate-category-naturality, c-naturality-coupling-realizability-refinement, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
---

# Converse-coupling transfinite settling

A [transfinite-bounded-regime](../theorems/four-regime-dichotomy.md) settling on a non-discrete predicate category with a [predicate converse](../morphisms/predicate-converse.md) morphism, demonstrating the swap-coupling structure of the [$\mathcal{C}$-naturality coupling realizability refinement](../theorems/c-naturality-coupling-realizability-refinement.md). The complementary case to [coupled-predicate transfinite settling](coupled-predicate-transfinite-settling.md), which exemplifies specialization.

## Construction

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega + 1$, [predicate set](../objects/predicate-set.md) $\Pi = \{P, P^c\}$ with $\mathrm{dom}(P) = \mathrm{dom}(P^c) = E \times E$. [Predicate category](../objects/predicate-category.md) $\mathcal{C}$ has a single non-identity generator: a [predicate converse](../morphisms/predicate-converse.md) $f : P^c \to P$ with cellwise action $(s, o) \mapsto (o, s)$.

[Settling bound](../objects/settling-bound.md) $\lambda = \omega + 2$.

A single [closure rule](../concepts/closure-rule.md) at $P$:

$$(\forall \alpha < \beta.\; v(P)(\alpha, 0) \geq_k \mathbf{t}) \;\Longrightarrow\; v(P)(\beta, 0) \geq_k \mathbf{t}, \qquad \beta < \omega + 1.$$

The rule is non-symmetric in cell positions: it propagates along the column $(\cdot, 0)$ of $P$, not the diagonal. This makes the converse coupling visible.

The closure operator's $\mathcal{C}$-naturality $f^* \circ \mathrm{cl}_P = \mathrm{cl}_{P^c} \circ f^*$ determines $\mathrm{cl}_{P^c}$. Since $f^*$ is the swap, the closure on $P^c$ acts on the column $(0, \cdot)$ of $P^c$ in the same pattern as $\mathrm{cl}_P$ on $(\cdot, 0)$ of $P$.

[Increment sequence](../objects/increment-sequence.md): $u_0(P)(0, 0) = \mathbf{t}$. By $\mathcal{C}$-naturality of increments, $u_0(P^c)(0, 0) = \mathbf{t}$ (the swap of $(0, 0)$ is itself).

## Settling stages

Each successor stage advances both fibers by one step:

- $v_n(P)(k, 0) = \mathbf{t}$ for $k \leq n$, by Rule's iteration.
- $v_n(P^c)(0, k) = \mathbf{t}$ for $k \leq n$, by $\mathcal{C}$-naturality (swap of the above).

At $\tau = \omega$ (limit): $v_\omega(P)(k, 0) = \mathbf{t}$ for all $k < \omega$; $v_\omega(P^c)(0, k) = \mathbf{t}$ for all $k < \omega$. The cells $(P, \omega, 0)$ and $(P^c, 0, \omega)$ are $\bot$.

At $\tau = \omega + 1$: closure fires. Rule's antecedent for $\beta = \omega$ at $P$ is satisfied. Adds $(P, \omega, 0) = \mathbf{t}$. By $\mathcal{C}$-naturality, $\mathrm{cl}_{P^c}$ adds $(P^c, 0, \omega) = \mathbf{t}$ (the swap).

## Closure ordinal and regime

$\kappa = \omega + 1$. Transfinite-bounded regime.

## Non-Scott-continuous firings

$L_{\mathrm{ns}}(\kappa) = \{\omega\}$. Both fibers' firings happen at the same setting-stage $\omega + 1$, with a single $L_{\mathrm{ns}}$-element.

## Cohomology

By [transfinite-bounded-regime $H^1$-generators](../theorems/transfinite-bounded-regime-h1-generators.md): $H^1_t \cong \mathbb{Z}$ with the generator at $\omega$ corresponding to the new cells (one at $P$, one at $P^c$, but they share the firing ordinal). The classifying invariant: $\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v) = e_\omega$.

## Realizability observation

The example illustrates the *swap coupling* of $\mathcal{C}$-naturality:

When $\mathcal{C}$ has a converse $f : P^c \to P$, the firing patterns at $P$ and $P^c$ are identical *as ordered sets of firing ordinals* but with the cells fired at each ordinal swapped under $(s, o) \mapsto (o, s)$. The two predicates' firings cannot be independently chosen: the closure-operator's $\mathcal{C}$-naturality forces $P^c$'s firings to be the swap-image of $P$'s.

Compared to the [specialization coupling](coupled-predicate-transfinite-settling.md): there, $Q$'s firings were a *strict subset* of $P$'s (restriction to $\mathrm{dom}(Q) \subseteq \mathrm{dom}(P)$). With converse, both predicates have the same support $E \times E$, and the coupling is by *bijective swap* rather than by sub-support restriction. The realizable per-predicate firing-pattern pair is therefore not "$L_{\mathrm{ns}}^{(P^c)} \subseteq L_{\mathrm{ns}}^{(P)}$" but "$L_{\mathrm{ns}}^{(P^c)}$ is the swap-image of $L_{\mathrm{ns}}^{(P)}$" — they share firing ordinals exactly.

If the rule on $P$ were diagonal-targeted (firing $(\beta, \beta)$), the converse swap is the identity on the diagonal, so the firing pattern at $P^c$ would coincide with $P$'s exactly. The rule on $P$ here is column-targeted ($(\beta, 0)$), which the swap maps to $(0, \beta)$ — a row of $P^c$. The swap is non-trivial cellwise but the firing-ordinal set is identical.

## Role

The second worked instance in the [$\mathcal{C}$-naturality coupling realizability refinement](../theorems/c-naturality-coupling-realizability-refinement.md). Pairs with [coupled-predicate transfinite settling](coupled-predicate-transfinite-settling.md) (specialization) to cover two of the four predicate-category generator classes. The remaining two — subject-projection and object-projection — would have similar diagonal-collapse structures and are not constructed here.
