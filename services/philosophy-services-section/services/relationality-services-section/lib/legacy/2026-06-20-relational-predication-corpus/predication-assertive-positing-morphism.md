---
type: morphism
class: operator
symbol: "\\mathrm{assert}_{\\phi}"
status: draft
depends-on: [positing-morphism, truth-order, truth, four-bilattice, predication-settling-category]
see-also: [denial-positing-morphism, contestation-positing-morphism, belnap-speech-act-partition, temporally-bounded-positing, positing-naturality]
---

# Assertive positing morphism

The **assertive positing morphism** at cell $\phi = (s, p, o)$ is the [positing morphism](positing-morphism.md) $\mathrm{posit}_{(\phi, q)}$ with datum $q$ **truth-designated**: $q \geq_t \mathbf{t}$ in the [truth order](teaching/explanations/truth-order.md). On $\mathbf{FOUR}$, the truth-designated values are $\{\mathbf{t}\}$ (only positive evidence); denoted $\mathrm{assert}_\phi := \mathrm{posit}_{(\phi, \mathbf{t})}$.

For a general residuated-lattice bilattice $\mathbf{L}^\bowtie$, the assertive class is all positing morphisms with datum $q = \langle q_+, q_- \rangle$ satisfying $q_+ = 1_\mathbf{L}$ (positive coordinate at maximum) and $q_- < 1_\mathbf{L}$ (negative coordinate strictly below maximum). The condition $q_- < 1_\mathbf{L}$ distinguishes asserting from contesting (which has $q_- = 1_\mathbf{L}$ as well).

## Characterization

An assertive positing morphism:
1. **Injects positive evidence only.** The datum $q$ has $q_+ = 1$ (full positive evidence) and $q_- < 1$ (no confirming negative evidence).
2. **Is $\leq_t$-increasing.** For a cell $\phi$ at value $v(\phi)$, the posit raises $v(\phi)$ in the truth order: $v(\phi) \leq_t \mathrm{assert}_\phi(v)(\phi)$ whenever $v(\phi) \leq_t \mathbf{t}$.
3. **Is not $\leq_k$-maximal.** Unlike contestation positing, assertive positing does not maximize information — a subsequent denial positing can still raise the $\leq_k$-value by adding negative evidence.

## Under the Klein-four symmetry

The [Belnap speech-act partition theorem](../theorems/belnap-speech-act-partition.md) gives: negation $\sim$ converts an assertive positing morphism into a [denial positing morphism](denial-positing-morphism.md) and vice versa, while conflation $-$ converts it into itself (asserting is fixed by conflation since $-(\mathbf{t}) = \mathbf{t}$). The assertive class is an orbit under $\langle \sim \rangle$ together with the denial class.

## Under closure

Assertive positing is not stable under closure: the closure operator may add negative evidence to a cell currently at $\mathbf{t}$, raising it to $\top$ (contested). An assertive positing morphism followed by closure may produce a contesting outcome if the closure rules include rules that add negative evidence to truth-designated cells.

A closure operator is **assertion-preserving** at $\phi$ if $\mathrm{cl}_p(u)(s, o) \geq_t u(s, o)$ for all $u$ with $u(s, o) \geq_t \mathbf{t}$ — it never moves a truth-designated cell to a non-truth-designated one. Characterizing which closure-rule shapes are assertion-preserving is addressed in [declarations-as-comprehension-positing](../theorems/declarations-as-comprehension-positing.md): assertion-stability at $\phi$ is the special case of declaration-support for datum $\mathbf{t}$.

## Speech-act reading

An assertive positing morphism is the PredCat formalization of an **assertion** in the sense of Austin ([@austin1962]) and Searle ([@searle1969]): a speech act with word-to-world direction of fit, positive sincerity condition (the speaker holds the evidence), and truth-class datum. It is the act of committing positive evidence to a predication cell — stating that $s$ bears $p$ to $o$ as a matter of truth, without concurrently holding negative evidence against it.

Distinctions within the assertive class (asserting vs. claiming vs. hypothesizing in Searle's taxonomy) are not captured by the datum alone on $\mathbf{FOUR}$ — they are relational properties depending on the multi-observer merged settling (see [agentive-positing-morphism](agentive-positing-morphism.md)).
