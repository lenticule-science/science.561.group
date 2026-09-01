---
type: concept
class: substrate-discipline
status: sketch
depends-on: [predication-fiber-algebra, knowledge-order, predication-cell]
see-also: [knowing-as-settling, assertion-monotonicity, aboutness]
---

# Evidence accumulation

The substrate-level discipline by which multiple sources asserting the same predication-cell *accumulate* their evidence on the cell's bilattice value rather than overwriting, replacing, or averaging it. Evidence accumulation is the structural fact that makes the predicated substrate a *multi-source-aware* knowledge representation, in contrast to single-source-overwriting representations like property graphs or document stores.

## The discipline

For a predication-cell $c = (s, p, o)$ and a sequence of assertions
$$\mathrm{assert}(c, \alpha_1, \sigma_1), \mathrm{assert}(c, \alpha_2, \sigma_2), \ldots, \mathrm{assert}(c, \alpha_n, \sigma_n)$$
from sources $\sigma_1, \ldots, \sigma_n$ with positive-evidence values $\alpha_1, \ldots, \alpha_n \in \mathbf{L}$, the substrate's settled value at cell $c$ is
$$v(c) = \bigvee_{k}^{i=1..n} (\alpha_i, \mathbf{0})$$
the bilattice-knowledge-order join of the per-source contributions. Symmetrically for denials, on the negative-evidence channel.

The four bilattice values $\bot, t, f, \top \in \mathbf{FOUR}$ each carry a substrate-level reading of *how the evidence stands*:

- $\bot$ — **silence**. No source has asserted or denied $c$.
- $t$ — **affirmed**. At least one source has asserted $c$; no source has denied it.
- $f$ — **denied**. At least one source has denied $c$; no source has asserted it.
- $\top$ — **contested**. At least one source has asserted *and* at least one has denied; the substrate carries both.

In the general residuated-lattice case ($\mathbf{L} \neq \mathbf{2}$), the values graduate: $(\alpha, \beta)$ with $\alpha, \beta \in \mathbf{L}$ records the joined positive-evidence and joined negative-evidence at $c$, with $\alpha \vee_{\mathbf{L}} \beta$ measuring how much evidence has been accumulated and the partial order on $\mathbf{L} \times \mathbf{L}$ classifying the cell's evidence-state.

## Properties

**(E1) Order-independence.** The order of assertions does not affect the settled value: $\mathrm{assert}(c, \alpha_1, \sigma_1) \circ \mathrm{assert}(c, \alpha_2, \sigma_2) = \mathrm{assert}(c, \alpha_2, \sigma_2) \circ \mathrm{assert}(c, \alpha_1, \sigma_1)$, by commutativity of the bilattice join. The substrate's settled state is a function of the *set* of asserted-events on $c$, not their sequence.

**(E2) Source-tracking.** Each contribution to a cell carries its source. The substrate's [witness](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/witness.md) discipline records the source per contribution; the cell's settled value is derivable from the union of contributions, but the contributions themselves are recoverable from the witness chain — supporting "who said what when" queries.

**(E3) Strength-dependent.** When $\mathbf{L}$ is richer than $\mathbf{2}$, the per-source value $\alpha_i$ records the strength of source $\sigma_i$'s evidence (probabilistic confidence, fuzzy membership, lattice-of-trust value). The bilattice join $\bigvee_k$ accumulates the strengths, not the indicator-functions. A cell with values $(0.6, 0)$ from one source and $(0.7, 0)$ from another settles to $(0.7, 0)$ in $[0, 1]$-valued settings — the joint evidence is the join.

**(E4) Contestation as substrate state.** When at least one source asserts and at least one denies, the cell's settled value is $(\alpha, \beta)$ with both coordinates non-trivial — the bilattice's contestation marker. This is *not* a conflict to be resolved before the cell is "valid"; it is a recorded substrate-level fact about the cell's epistemic status.

**(E5) Closure-derivable assertions accumulate too.** A cell whose value is derived by closure from other cells also accumulates: the closure rule's firing adds the derived value to the cell, and multiple firings of the same rule (or different rules) producing the same cell each contribute via $\vee_k$. Closure-rule-derived contributions inherit the witness chain of the premise-cells (the [predicated-computing](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md) substrate carries this).

**(E6) Evidence is not double-counted.** A given source asserting $c$ multiple times (per [assertion idempotence](../theorems/assertion-monotonicity.md) corollary C4) contributes only once. The accumulation discipline is across *distinct sources*, not across the count of assertion events; per-source idempotence and across-source accumulation are both consequences of the bilattice join.

