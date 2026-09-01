---
type: example
status: verified
depends-on: [predication-settling, closure-rule, closure-operator, four-regime-dichotomy, non-scott-continuous-firing-ordinal, transfinite-bounded-regime-h1-generators, bigraded-settling-cohomology, bigraded-aperiodic-regime-trichotomy, paraconsistent-classification, inconsistency-sheaf, settling-associated-sheaf, bigraded-realizability-refinement]
instantiates: [bigraded-aperiodic-regime-trichotomy, paraconsistent-classification, bigraded-realizability-refinement, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
lineage: 4
---

# Mixed-stratum two-firing settling

A [transfinite-bounded-regime](../theorems/four-regime-dichotomy.md) settling whose bigraded classifying invariant has *both* a non-zero truth-side and a non-zero inconsistency-side component — placing the settling in the mixed sub-stratum of the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md). The smallest concrete realization the corpus had previously asserted to exist but not constructed.

## Construction

$\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \omega + 1$, [predicate set](../objects/predicate-set.md) $\Pi = \{P, Q\}$ with $\mathrm{dom}(P) = \mathrm{dom}(Q) = \Delta_E$, [predicate category](../objects/predicate-category.md) $\mathcal{C}$ a *discrete* two-object category on $\{P, Q\}$ (no morphisms between them), [settling bound](../objects/settling-bound.md) $\lambda = \omega + 2$.

Two [closure rules](teaching/explanations/closure-rule.md), each a $\Pi_1$-schema:

- **Rule T (truth-side):** $(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) \geq_k \mathbf{t}) \;\Longrightarrow\; v(P)(\beta, \beta) \geq_k \mathbf{t}$, $\beta < \omega + 1$.
- **Rule TOP (inconsistency-side):** $(\forall \alpha < \beta.\; v(Q)(\alpha, \alpha) \geq_k \top) \;\Longrightarrow\; v(Q)(\beta, \beta) \geq_k \top$, $\beta < \omega + 1$.

[Increment sequence](../objects/increment-sequence.md): $u_0(P)(0, 0) = \mathbf{t}$ and $u_0(Q)(0, 0) = \top$, all other increments $\bot$. Both increments are vacuously $\mathcal{C}$-natural since $\mathcal{C}$ has no inter-predicate morphisms to coordinate.

## Settling stages

Both rules act independently on disjoint fibers (one at $P$, one at $Q$). At each successor stage $\sigma + 1$, the closure adds:

- $(P, \sigma + 1, \sigma + 1) = \mathbf{t}$ via Rule T (when antecedent satisfied);
- $(Q, \sigma + 1, \sigma + 1) = \top$ via Rule TOP (when antecedent satisfied).

For $\tau < \omega$, the state is $\{(P, \alpha, \alpha) = \mathbf{t} : \alpha \leq \tau\} \cup \{(Q, \alpha, \alpha) = \top : \alpha \leq \tau\}$.

At $\tau = \omega$ ([settling continuity](teaching/explanations/settling-continuity.md)), both diagonals are filled through $[0, \omega)$ with the appropriate values; the cells $(P, \omega, \omega)$ and $(Q, \omega, \omega)$ remain $\bot$.

At $\tau = \omega + 1$, both rules fire:

- Rule T: antecedent "$\forall \alpha < \omega.\, v(P)(\alpha, \alpha) \geq_k \mathbf{t}$" satisfied (the join of the natural-number diagonal cells). Adds $(P, \omega, \omega) = \mathbf{t}$.
- Rule TOP: antecedent "$\forall \alpha < \omega.\, v(Q)(\alpha, \alpha) \geq_k \top$" satisfied (each cell already has $\top$, so $\geq_k \top$ holds). Adds $(Q, \omega, \omega) = \top$.

Both firings happen at the same setting-stage $\omega + 1$.

## Closure ordinal

$\kappa = \omega + 1$. Beyond $\omega + 1$, no rule has new content to fire (the diagonals are filled). The settling lies in the [transfinite-bounded regime](../theorems/four-regime-dichotomy.md), $\omega < \kappa < \omega_1$.

## Non-Scott-continuous firings

Both firings happen at setting-stage $\omega + 1$, with each rule's antecedent committing at the directed-join at $\mu = \omega$. Therefore $L_{\mathrm{ns}}(\kappa) = \{\omega\}$ — *one* non-Scott-continuous firing ordinal, recording two distinct cell additions across two distinct predicates.

The cardinality of $L_{\mathrm{ns}}$ doesn't multiply with predicate count; multiple cells fired at the same setting-stage collapse into a single $L_{\mathrm{ns}}$-element.

## Bigraded classifying invariant

The cohomology splits by sheaf:

- **Truth-side** [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U^{(t)}$ has a generator at $\mu = \omega$ from the new $\mathbf{t}$-cell at $(P, \omega, \omega)$. So $H^1_t \cong \mathbb{Z}$.
- **Inconsistency-side** [sheaf](../objects/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$ has a generator at $\mu = \omega$ from the new $\top$-cell at $(Q, \omega, \omega)$. So $H^1(\mathcal{F}_U^{(\top)}) \cong \mathbb{Z}$.

The [bigraded classifying invariant](../theorems/paraconsistent-classification.md) is

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) \;=\; (e_\omega^{(t)},\; e_\omega^{(\top)}) \;\in\; \mathbb{Z} \oplus \mathbb{Z},$$

with both components non-zero. By the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md) (specialized to the transfinite-bounded regime), the settling lies in the *mixed* sub-stratum: $\mathrm{cl}\text{-}\mathrm{inv}^{(t)} \neq 0$ AND $\mathrm{cl}\text{-}\mathrm{inv}^{(\top)} \neq 0$.

## Realizability observation

The example demonstrates that the bigraded classifying invariant's two components can be *independently realized* via two independent closure rules acting on disjoint predicates. With Rule T producing $\mathbf{t}$-firings at limits in some initial-segment pattern and Rule TOP producing $\top$-firings at limits in some (possibly different) initial-segment pattern, the realized bigraded class is a pair of independent components.

In particular: combining a base-shift truth-side construction (Rule T with $E_T = \eta_T + 1$) with a base-shift inconsistency-side construction (Rule TOP with $E_\top = \eta_\top + 1$) on disjoint predicates realizes the bigraded class

$$\bigl(\mathbf{1}_{\{\mu \leq \eta_T : \mu \text{ a countable limit}\}},\; \mathbf{1}_{\{\mu \leq \eta_\top : \mu \text{ a countable limit}\}}\bigr).$$

This is a *two-parameter* family in the bigraded space, indexed by $(\eta_T, \eta_\top)$. The mixed stratum is non-empty (and substantially populated) by such constructions.

## Where this stops short

This example uses a *discrete* predicate category (no $\mathcal{C}$-morphisms between $P$ and $Q$), which makes the two predicates' firings genuinely independent. With a non-discrete $\mathcal{C}$ — e.g., a specialization $f : Q \to P$ — the closure operator's $\mathcal{C}$-naturality couples the predicates' firings, reducing the dimensionality of independent realizability. See [coupled-predicate transfinite settling](coupled-predicate-transfinite-settling.md) for the next refinement.

## Role

The smallest concrete mixed-stratum example. Asserts a positive answer to the existence claim in the [bigraded aperiodic-regime trichotomy](../theorems/bigraded-aperiodic-regime-trichotomy.md): mixed bigraded classes are realized by explicit constructions, not just abstractly possible. Pairs the [transfinite-induction settling](transfinite-induction-settling.md) (consistent stratum) and [paraconsistent transfinite settling](paraconsistent-transfinite-settling.md) (paraconsistent stratum) by sitting at the smallest setting where both directions co-occur.
