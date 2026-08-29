---
type: theorem
status: sketch
depends-on: [correlate-of, jural-relation, modal-necessity-operator, modal-possibility-operator, klein-four-symmetry, predicate-converse-quantifier-adjoints, deontic-modality]
realizes: [correlate-of, power, duty, privilege, immunity]
---

# Correlative pairing is modal duality composed with frame converse

The Hohfeldian [correlate-of](../morphisms/correlate-of.md) operation, restricted to the second-quartet kinds (power/liability, immunity/disability), is the composite of two operations: (i) the [modal possibility/necessity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md) duality $\Diamond \;=\; \sim \Box \sim$ on the bilattice modal operators of [deontic-modality](teaching/explanations/deontic-modality.md), and (ii) the accessibility-frame swap from $R^O$ to its converse $R^{O,\mathrm{imp}}$, realized by the [predicate-converse](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) on the potential-holder/passive-party pair.
Neither operation alone produces correlative pairing; both are required.
The substantive content is that *exactly these two* — and no further structure — suffice.

Restricted to the first-quartet kinds (duty/claim, privilege/no-claim), the same composite holds with $\Box$ in place of $\Diamond$.
The full correlate-of operation is therefore a *single, two-step* construction: predicate-converse on the agent pair, composed with the modal duality on the kind operator.

## Statement

**Theorem.** *Let $R^O$ be the bilattice accessibility relation realizing office $O$'s authority frame (per [deontic-modality](teaching/explanations/deontic-modality.md)).
Let $R$ be a jural relation with $\langle R, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R, \texttt{potential-holder}, A\rangle = \mathbf{t}$, $\langle R, \texttt{passive-party}, B\rangle = \mathbf{t}$, scope-action $X$, modeled as $\Diamond_{R^O} u_X$ on the action-payload $u_X$ from $A$'s perspective.
Then:*

(a) *(Composite identity.) $\mathrm{corr}(R)$ has cells equivalent to $\sim \Box_{R^{O,\mathrm{imp}}} \sim u_X$ on $B$'s perspective, where $R^{O,\mathrm{imp}}$ is the converse accessibility frame (the imposition frame on the passive party).
The expression decomposes as the modal duality $\Diamond \mapsto \sim\Box\sim$ post-composed with the frame-converse $R^O \mapsto R^{O,\mathrm{imp}}$; either operation alone produces a different jural relation, not the correlative.*

(b) *(Self-adjointness of the agent swap.)
The agent-pair swap from $A$ to $B$ is the [predicate-converse morphism](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) on the (potential-holder, passive-party) predicate-pair, which by [predicate-converse quantifier-adjoints](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-converse-quantifier-adjoints.md) is self-adjoint in both bilattice orders.
The potential-side and passive-side carry identical information up to relabeling — $R$ and $\mathrm{corr}(R)$ are *one fact*, not two.*

(c) *(Klein-four eightfold orbit.)
The Klein-four group action on the modal operator (id, $\sim$, $-$, $\sim\circ-$) combined with the agent-swap involution (correlate-of) generates an orbit of size 8, recovering Hohfeld's full eightfold from the single starting kind.
Each orbit point names exactly one of {power, liability, no-power, immunity, duty, claim, privilege, no-claim}.*

## Proof

**Part (a).** Power is "there exists an authorized continuation in which $u_X$ holds": $\mathrm{Power}_A(u_X)_w := (\Diamond_{R^O} u_X)_w$.
Liability of $B$ is the dual statement on $B$'s side: "every continuation in which $A$ exercises the power, $B$ is subject to its consequence."
Per the bilattice modal-dual identity on $\mathbf{FOUR}$ — proved by direct calculation from [twist-product fusion](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) and [twist-product right-residual](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) — we have

$$\Diamond_R u \;=\; \sim \Box_R \sim u$$

pointwise on $\mathbf{FOUR}$ when the modal frame $R$ and the negation $\sim$ are aligned.
Applied to liability with the converse frame $R^{O,\mathrm{imp}}(w, w') := R^O(w', w)$ (the imposition frame from $B$'s perspective is the converse of the authorization frame from $A$'s), the identity gives liability $= \sim \Box_{R^{O,\mathrm{imp}}} \sim u_X$ — exactly $B$'s subjection statement.

**Part (b).** The agent-swap $A \leftrightarrow B$ in (active-holder, passive-party) cells is the [predicate-converse morphism](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) applied to the implicit 2-place predicate `holds-jural-relation-with`.
By [predicate-converse quantifier-adjoints](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-converse-quantifier-adjoints.md), the converse functor $f^*$ on the predication-fiber satisfies $\exists^t \dashv f^* \dashv \forall^t$ and $\exists^k \dashv f^* \dashv \forall^k$ with both adjunctions equalities (self-adjointness): $\exists_f^t = f^* = \forall_f^t$ and $\exists_f^k = f^* = \forall_f^k$.

This means: *no information is added by computing the correlative*.
The cells of $R$ and the cells of $\mathrm{corr}(R)$ are reflections of each other across the converse functor, with both bilattice-meet aggregations and bilattice-join aggregations preserved by $f^*$ acting on the argument-pair.
The substrate carries both entities as a presentation choice (so the passive-side view is locally readable without recomputation), but a single witness asserting the potential-side is structurally sufficient.

**Part (c).** The Klein-four group $K_4 = \{\mathrm{id}, \sim, -, \sim\circ-\}$ acts on $\mathbf{FOUR}$ by the four symmetries listed in [klein-four-symmetry](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/klein-four-symmetry.md).
The agent-swap involution $\mathbb{Z}/2 = \{\mathrm{id}, \mathrm{corr}\}$ acts independently on the (potential-holder, passive-party) pair.
The combined group $K_4 \times \mathbb{Z}/2$ has order 8.

Acting on the starting kind $\Diamond_{R^O}$ (power):

| Group element | Resulting kind |
|---|---|
| $(\mathrm{id}, \mathrm{id})$ | power |
| $(\sim, \mathrm{id})$ | no-power |
| $(-, \mathrm{id})$ | privilege |
| $(\sim\circ-, \mathrm{id})$ | duty |
| $(\mathrm{id}, \mathrm{corr})$ | liability |
| $(\sim, \mathrm{corr})$ | immunity |
| $(-, \mathrm{corr})$ | no-claim |
| $(\sim\circ-, \mathrm{corr})$ | claim/right |

Each group element produces a determinate substrate operation on the cells, and the orbit is closed: applying any further group element to any orbit point lands at another orbit point.
The eightfold is therefore the *orbit*, not an enumeration. $\square$

## What the theorem buys

Three structural consequences:

1. **Hohfeld's eightfold is single-generated.** A single starting jural relation, plus the $K_4 \times \mathbb{Z}/2$ group action, produces all eight Hohfeldian positions.
  The substrate need not enumerate eight kinds — it can carry a single "generative" cell plus a group-element annotation, and recover the rest by orbit traversal.
  This is the structural source of the *uniformity* of Hohfeldian operations across kinds (every revocation works the same regardless of which kind is being revoked, because the operations are group-equivariant).

2. **Correlative pairing is computational, not axiomatic.** The substrate does *not* require an witness for the correlative side; per part (b), the correlative is computed from the potential side via the self-adjoint converse functor.
  The closure rule for [correlate-of](../morphisms/correlate-of.md) is therefore not an axiom adding new content but a *propagation rule* exposing computed content.
  The substrate's storage of both sides is a query-locality optimization, not a substantive commitment.

3. **The first-quartet/second-quartet split is exactly $\Box$/$\Diamond$.** The classical Hohfeldian distinction between "first-order" relations (claim, duty, privilege, no-claim) and "second-order" (power, liability, immunity, disability) corresponds to the modal split between $\Box$-style operators (universal-over-continuations) and $\Diamond$-style operators (existential-over-continuations).
  The substrate's bilattice modal calculus already respects this split; the Hohfeldian terminology layers on top of a math distinction that exists independently.

## Status

`sketch` because:

- The bilattice modal-dual identity $\Diamond_R u \;=\; \sim \Box_R \sim u$ on $\mathbf{FOUR}$ is stated but not separately catalogued as a corpus theorem; it is implicit in the [modal-non-normality](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-non-normality.md) theorem's apparatus and the [modal-necessity-basic-properties](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md) theorem's calculation set.
  Promotion requires extracting an explicit "bilattice modal duality" theorem in predication-categories.
- The converse-frame construction $R^{O,\mathrm{imp}}(w, w') := R^O(w', w)$ is informally given; promotion requires checking that the converse preserves the bilattice accessibility's well-definedness and that $\Diamond_{R^O}$ on $A$'s side and $\Box_{R^{O,\mathrm{imp}}}$ on $B$'s side compute on compatible payloads.
- The orbit-closure check in part (c) is enumerative; promotion requires writing out the eight group-element actions in full and verifying each lands at the named substrate operation.

## Position

This theorem closes the [office-formalism-equivalence](office-formalism-equivalence.md) gap by giving the explicit math operation behind correlative pairing — previously stated as "predicate-converse plus predicate-specialization" without the modal-duality identification.
It is also the math content behind [deontic-modality](teaching/explanations/deontic-modality.md)'s claim that the eightfold is single-generated by Klein-four and correlate-of acting on one modal generator.
Together with [delegation-as-authority-residuation](delegation-as-authority-residuation.md) and [recognition-as-bigraded-common-knowledge](recognition-as-bigraded-common-knowledge.md), this theorem completes a triangle of predication-categories machinery being instantiated on Hohfeldian governance: the second-quartet kinds are *modal*, delegation is *residuation*, and incumbency is *bigraded common knowledge*.
