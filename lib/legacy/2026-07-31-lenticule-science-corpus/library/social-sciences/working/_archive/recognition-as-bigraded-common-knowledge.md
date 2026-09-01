---
type: theorem
status: sketch
depends-on: [office-as-double-settlement, bigraded-common-knowledge, modal-necessity-operator, bilattice-accessibility-relation, normative-system]
realizes: [office, recognition]
---

# Recognition and induction are bigraded common-knowledge fixed points

The [office-as-double-settlement](../objects/office-as-double-settlement.md) construction requires *two* required predicates — recognition and induction — for full incumbency (*dignitas*). This theorem identifies the structural source of the two-axis requirement: the recognition predicate is the *truth-axis* common-knowledge fixed point $C^t$ of the polity's witness frame on the candidate-incumbency claim, and the induction predicate is the *knowledge-axis* common-knowledge fixed point $C^k$. By [bigraded-common-knowledge](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md), these two fixed points generically diverge to different bottoms — which is exactly the substrate-algebraic content of the *honor-without-dignitas* and *interrex* states.

## Setup

Let $O$ be an office and $\iota$ a candidate. Let $W$ be the polity's *witness frame*: each $w \in W$ is an agent of the polity, and the [bilattice accessibility relation](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R(w, w') \in \mathbf{FOUR}$ records, for each pair, the bilattice-valued degree to which $w$ has access to $w'$'s evidence about $\iota$'s candidacy. Let $\phi$ be the candidate-claim cell: $\phi(w) := \langle \iota, \texttt{candidate-for}, O\rangle$ as observed at $w$.

Per [bigraded-common-knowledge](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md), the polity admits two distinct common-knowledge fixed-point operators on $\phi$:

$$C^t \phi := \mathrm{gfp}_{\leq_t}\, \psi.\, \phi \wedge_t E^t \psi, \qquad C^k \phi := \mathrm{gfp}_{\leq_k}\, \psi.\, \phi \wedge_k E^k \psi.$$

## Statement

**Theorem.** *On any non-degenerate polity witness frame:*

(a) *The recognition predicate's settled value $\langle \iota, \texttt{recognized-as-incumbent-of}, O\rangle$ is the truth-axis common-knowledge fixed point: it equals $C^t \phi$ at the witnessing agent $w$.*

(b) *The induction predicate's settled value $\langle \iota, \texttt{inducted-into}, O\rangle$ is the knowledge-axis common-knowledge fixed point: it equals $C^k \phi'$ for the analogous forward-binding claim $\phi'$.*

(c) *(Generic divergence.) On any frame with non-trivial witness disagreement on $\phi$, $C^t \phi$ and $C^k \phi$ collapse to **different bottoms**: $C^t$ to truth-axis $\mathbf{f}$ (the polity commonly knows $\iota$'s candidacy fails on truth), $C^k$ to knowledge-axis $\bot$ (the polity has no consensus evidence about $\iota$'s candidacy). The four corners of the dignitas table* (vacant, munus-only, recognition-only, dignitas) *are exactly the four pairs $(C^t \phi, C^k \phi') \in \{\bot, \mathbf{t}\}^2$ in the non-divergent case, with the divergence cases corresponding to the $\mathbf{f}$- and $\top$-rows that the dignitas table marks as failed-induction and repair-condition respectively.*

## Proof

**Part (a).** The recognition predicate is the polity-wide settled value of "$\iota$ is recognized as legitimately holding $O$." Per the office text's *honor* axis, recognition is the *backward, history-sensitive* axis: the value at any agent $w$ is determined by aggregation over $w$'s view of *every other agent's* prior recognition-witnessing evidence. This is exactly the per-axis everyone-knows operator $E^t$ followed by the truth-axis fixed-point closure: an agent $w$'s recognition value is $\mathbf{t}$ iff every accessible agent $w'$ also recognizes — which is the antecedent of the truth-axis modal necessity $\Box^t_w \phi$. Iterating until stable gives $C^t \phi$ at $w$.

The closure-rule realization in [operations-settling](../../../objects/operations-settling.md) — "the recognition cell settles when accumulated witnesses across the polity converge" — is the substrate-algebraic implementation of $C^t \phi$: the cell's settled value is exactly the gfp the bigraded theorem characterizes.

**Part (b).** The induction predicate is the *forward-active* axis: the value at $w$ is determined by $w$'s commitment-evidence about $\iota$'s forward obligation, aggregated against every accessible $w'$'s commitment-evidence. The aggregation is in the *knowledge order*: an agent's induction-value is $\mathbf{t}$ when there is consistent forward-binding evidence across the polity, and $\bot$ when evidence is missing or scattered. This is the per-axis everyone-knows $E^k$ followed by the knowledge-axis fixed-point closure on the forward-binding claim $\phi' := \langle \iota, \texttt{committed-to-forward-obligation-in}, O\rangle$, giving $C^k \phi'$ at $w$.

**Part (c).** Direct application of [bigraded-common-knowledge](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) part (c). On any polity with non-trivial witness disagreement (some agents have positive witness, others have negative or contested witness on the same candidate), the truth-meet collapses Boolean disagreement to $\mathbf{f}$ while the knowledge-meet collapses it to $\bot$. The two fixed points propagate these distinct bottoms through the iteration.

The *dignitas table* in [office-as-double-settlement](../objects/office-as-double-settlement.md) reads as a typing of the four non-degenerate $(C^t \phi, C^k \phi')$ pairs, with the additional rows ($\mathbf{f}$ in either, $\top$ in either) corresponding to the bigraded divergence outcomes from part (c) of the cited theorem:

| $C^t \phi$ | $C^k \phi'$ | dignitas-table entry | Bigraded source |
|---|---|---|---|
| $\bot$ | $\bot$ | Vacant | Both fixed points at their respective bottoms — no witness convergence on either axis |
| $\bot$ | $\mathbf{t}$ | Munus-only (interrex) | $C^k$ converges (forward commitment is consistent) but $C^t$ has no convergence (no aggregated recognition) |
| $\mathbf{t}$ | $\bot$ | Recognition-only | Inverse — recognition aggregates but no forward commitment evidence |
| $\mathbf{t}$ | $\mathbf{t}$ | Dignitas | Both fixed points at the potential-positive value |
| $\mathbf{f}$ in either | — | Failed induction | The disagreement-collapse outcome of bigraded part (c): one axis has stabilized to its falsity-bottom |
| $\top$ in either | — | Repair condition | Paraconsistent witness on the relevant axis; the LES connecting morphism is non-trivial |

## What the theorem buys

Three structural consequences:

1. **The two-axis requirement is not stipulative.** The dignitas requirement (recognition AND induction) is not an extra commitment of the office construction — it is the *only* faithful expression of incumbency on a substrate that admits bigraded common knowledge. The single-axis classical reading (either truth or knowledge alone) loses content that the substrate carries; the two-axis reading is the substrate's natural form.

2. **The interrex case has a precise structural meaning.** The traditional interrex — a candidate with forward obligation but no accumulated recognition — is exactly the bigraded divergence pattern $C^t \phi = \bot$ but $C^k \phi' = \mathbf{t}$. The history of Roman governance has interregnum periods of varying duration; the substrate's bigraded structure predicts that this state is *generic* on multi-witness polities, not exceptional. Most candidates pass through interrex en route to dignitas because the two axes converge at different rates.

3. **Common-knowledge attacks on incumbency operate per-axis.** A challenge to recognition (truth-axis) — disputing that $\iota$ has been validly acknowledged — operates on $C^t$; a challenge to induction (knowledge-axis) — disputing that $\iota$ has committed forward — operates on $C^k$. The two challenge types have *different cohomological signatures* per [truth-knowledge LES](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) and require different repair operations. Substrate-aware governance must distinguish them; conflating them produces miscategorized challenges.

## Status

`sketch`. The proof depends on:

- [bigraded-common-knowledge](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) at sketch status. Promotion is downstream of that theorem's promotion path.
- The identification of the polity's witness frame with a [bilattice accessibility relation](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) is informal; making it formal requires writing the polity's witness graph as an explicit $R: W \times W \to \mathbf{FOUR}$ from the polity's enrollment cells, currently scattered across [polity](../objects/polity.md) and [normative-system](../objects/normative-system.md).
- The dignitas-table-to-bigraded-pair correspondence in part (c) is verified by inspection of the four positive corners; the $\mathbf{f}$ and $\top$ rows depend on the bigraded theorem's part (c) generic-divergence claim.

## Position

This theorem is the structural justification for the [office-as-double-settlement](../objects/office-as-double-settlement.md) construction. Without it, the two-required-predicate stipulation reads as a design choice; with it, the stipulation reads as forced by the substrate's bigraded modal calculus. The same structural pattern applies to [normative-system](../objects/normative-system.md)'s two-axis norm-operativity (recognition + forward-binding) — that construction is the same theorem applied to norms rather than incumbents.
