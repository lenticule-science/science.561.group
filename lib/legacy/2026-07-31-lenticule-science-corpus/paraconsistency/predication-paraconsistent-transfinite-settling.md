---
type: example
depends-on: [transfinite-induction-settling, inconsistency-sheaf, paraconsistent-classification, bigraded-settling-cohomology, truth-knowledge-cohomology-long-exact-sequence]
instantiates: [paraconsistent-classification, bigraded-settling-cohomology, inconsistency-sheaf, closure-rule, closure-rule-system, closure-rule-language, non-scott-continuous-firing-ordinal]
---

# Paraconsistent transfinite settling

A paraconsistent extension of the [transfinite-induction settling](transfinite-induction-settling.md) exhibiting genuinely 2-dimensional [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md).

## Setup

Take the transfinite-induction settling on $E = \omega_1$, single predicate $P$, closure rule

$$(\forall \alpha < \beta.\; v(P)(\alpha, \alpha) = \mathbf{t}) \;\Longrightarrow\; v(P)(\beta, \beta) \geq_k \mathbf{t},$$

with one modification: the initial increment is paraconsistent — $u_0(P)(0, 0) = \top$ rather than $\mathbf{t}$.

The settling propagates $\top$ via the rule. Since $\top \geq_k \mathbf{t}$, the rule fires with $\top$-values as well, producing $v_\tau(P)(\alpha, \alpha) = \top$ for all $\alpha \leq \tau$.

## Cell sets

At each settling stage $\tau$:

- $\Delta^{+, \mathbf{t}}_\tau(P) = \emptyset$ — no $\mathbf{t}$-only cells; everything was $\top$ from the start.
- $\Delta^{+, \top}_\tau(P) = \{(\alpha, \alpha) : \alpha = \tau\}$ if $\tau$ is a successor or non-Scott-continuous limit; the newly-added $\top$-cell at stage $\tau$.

The [paraconsistent settling-associated sheaf](../objects/paraconsistent-settling-associated-sheaf.md) tracks $\top$-cells; the [settling-associated sheaf](../objects/settling-associated-sheaf.md) is identically zero.

## Cohomology

- **Truth-order:** $H^1_t(\mathbf{T}^*, \mathcal{F}_U^{(t)}) = 0$ since $\Delta^{+, \mathbf{t}} = \emptyset$ at all $\tau$ — no $\mathbf{t}$-cells to track; the classical cohomology is trivial.
- **Inconsistency:** $H^1(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$ — structurally identical to the [transfinite-induction classifying invariant](../theorems/transfinite-induction-classifying-invariant.md) but tracking $\top$-cells instead of $\mathbf{t}$-cells.
- **Knowledge-order:** $H^1_k(\mathbf{T}^*, \mathcal{F}_U^{(k)}) \cong H^1_t \oplus H^1(\mathcal{F}_U^{(\top)}) \cong \bigoplus_{\aleph_1} \mathbb{Z}$. The decomposition is direct because the underlying SES of sheaves splits — by the [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) (whose proof uses the split decomposition $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$), so $H^n$ inherits the splitting cellwise. Combined with $H^1_t = 0$, this gives the $\bigoplus_{\aleph_1} \mathbb{Z}$ identification.

## Bigraded classifying invariant

By [paraconsistent classification](../theorems/paraconsistent-classification.md):

$$\mathrm{cl}\text{-}\mathrm{inv}_{k, t}(v) \;=\; (0,\; \mathbf{1}_\top) \;\in\; 0 \oplus \bigoplus_{\aleph_1} \mathbb{Z},$$

where $\mathbf{1}_\top$ is the all-ones element in the inconsistency-sheaf cohomology.

## Role

Demonstrates how the $\leq_k$-versus-$\leq_t$ distinction produces cohomologically distinct content. A settling generating only $\top$-evidence has zero classical cohomology but non-zero paraconsistent cohomology — two different stories that the bigraded cohomology captures jointly.

A Belnap-style inconsistent-but-non-trivial epistemic state produces a cohomology class that classical sheaf methods do not see: $\mathcal{F}_U^{(t)}$ is identically zero, so any classical invariant vanishes; only the [inconsistency sheaf](../objects/inconsistency-sheaf.md) records the structural content of the settling. The paraconsistent extension of the [aperiodic-regime classification](../theorems/aperiodic-regime-classification.md) is what makes this settling *cohomologically distinguishable* from the trivial settling despite both having zero classical $H^1$.
