---
name: truth-order
description: "The order ≤_t associated with the truth lattice ⟨B, ∧_t, ∨_t⟩ of a bilattice. Raises positive evidence and lowers negative evidence — the 'more true' direction. The order classical Boolean true/false reading derives from as a shadow."
symbol: "≤_t"
depends-on: [bilattice]
derives-from: docs/dev/scraps/truth-order.md
---

# Truth-order

The order `≤_t` associated with the **truth lattice** `⟨B, ∧_t, ∨_t⟩` of a bilattice. When the underlying lattice is bounded, `≤_t` has bottom `f` and top `t`.

## Defining property

`a ≤_t b` iff `a ∧_t b = a`, equivalently `a ∨_t b = b`. Standard lattice definition; operations and order determine each other.

The induced order has `f` as least element (most-false) and `t` as greatest element (most-true). `⊥` and `⊤` sit between but are truth-incomparable: both are truth-neutral, for opposite reasons (`⊥` has no evidence, `⊤` has contradictory evidence).

## Twist-product expression — direction asymmetry

In a twist product `L_1 ⋈ L_2`,

$$\langle a_1, a_2\rangle \;\leq_t\; \langle b_1, b_2\rangle \quad \Longleftrightarrow \quad a_1 \leq_1 b_1 \text{ in } L_1 \;\text{and}\; b_2 \leq_2 a_2 \text{ in } L_2.$$

**Direction asymmetry**: first coordinate goes UP, second coordinate goes DOWN. Truth-order raises positive evidence and *lowers* negative evidence — the direction in which "more true" goes.

This asymmetry is the structural reason truth-order and knowledge-order are independent: they disagree on every comparison where the two coordinates move in different directions.

## Hasse diagram on FOUR

The Hasse diagram of `≤_t` on `FOUR`:

```
       t
      / \
     ⊥   ⊤
      \ /
       f
```

Reading: `f ≤_t ⊥`, `f ≤_t ⊤`, `⊥ ≤_t t`, `⊤ ≤_t t`. Same "rhombus" shape as `≤_k` but with **different** vertices at top/bottom/sides:

| Position | `≤_k`-vertex | `≤_t`-vertex |
|---|---|---|
| top | `⊤` (most evidence) | `t` (most true) |
| bottom | `⊥` (least evidence) | `f` (most false) |
| left mid | `t` | `⊥` |
| right mid | `f` | `⊤` |

So the two diagrams rotate the four values 90° relative to each other. The same four values, two different orderings.

## Negation is antitone in `≤_t`

On a bilattice, negation `~` is **antitone** in `≤_t`:

$$a \leq_t b \quad \Longrightarrow \quad {\sim}b \leq_t {\sim}a.$$

Classical logic has the same property: "not p" is true where "p" is false; negation flips the truth direction. The bilattice's negation behaves classically with respect to truth-order — it differs from classical logic only in additionally being monotone in `≤_k`.

This dual behavior of negation (antitone in `≤_t`, monotone in `≤_k`) is what makes the bilattice's structure richer than a single ordered set. Classical logic has one order and one notion of negation; bilattice has two orders and one negation that interacts differently with each.

## Why classical logic is the shadow

The classical Boolean reading recovers when **the truth-order is total and the knowledge-order is collapsed**. Specifically: take a bilattice where every value is either `f` or `t` (no `⊥`, no `⊤`), with `f ≤_t t` and nothing else. The truth-order is total; the knowledge-order is trivial (since `⊥ = f` and `⊤ = t` would force degeneracies if knowledge-distinct values existed, but here they don't).

This sub-algebra is the **two-element Boolean lattice** `2 = {0, 1}` — exactly classical truth. The truth-order on `2` is the classical `0 ≤ 1` order. Classical Boolean logic IS the truth-order-only fragment of the bilattice structure, with knowledge collapsed.

Conclusion: classical logic is what falls out of the bilattice when one **throws away the knowledge-order** and restricts to truth-asymmetric values. The current foundation keeps the knowledge-order alongside; classical math collapses it.

This is the precise sense in which classical truth is a *shadow* of bilattice truth: it's what remains after a specific structural collapse.

## Comparison with knowledge-order

The two orders disagree on every non-trivial bilattice comparison:

| Pair | `≤_k`-comparable | `≤_t`-comparable |
|---|---|---|
| `t, f` | NO (knowledge-incomparable; both have one piece of evidence) | YES (`f <_t t`) |
| `⊥, ⊤` | YES (`⊥ <_k ⊤`) | NO (both truth-neutral) |
| `⊥, t` | YES (`⊥ <_k t`) | YES (`⊥ <_t t`) |
| `⊥, f` | YES (`⊥ <_k f`) | YES (`f <_t ⊥`) |
| `⊤, t` | YES (`t <_k ⊤`) | YES (`⊤ <_t t`) |
| `⊤, f` | YES (`f <_k ⊤`) | YES (`f <_t ⊤`) |

No single total order captures both — see the CLAUDE.md FOUR derivation, Step 6.

## Predicate-category morphisms use `≤_t`

Beyond the knowledge-order (where settling-monotonicity lives), the truth-order is the natural setting for **predicate-category morphisms** that flow truth. Predicate-specialization, converse, and projections induce bilattice-homomorphisms on fiber algebras that respect both orders, but their structural action is most easily read against the truth-order.

For example, predicate-specialization extends a sub-support by `⊥` (the `≤_k`-bottom AND `≤_t`-bottom... actually wait — `⊥` is `≤_k`-bottom but not `≤_t`-bottom). The extension uses `⊥` because it's the value that "introduces nothing" — and for a specialization-extending-by-⊥ to be a bilattice-homomorphism, it must respect both orders, which `⊥` does in both ("no evidence" lands at `⊥` for the knowledge-side and at the truth-neutral position for the truth-side).

This dual-order respect is what makes the four canonical predicate-category morphism classes work as bilattice-homomorphisms.

## Behavior on the predication-fiber-algebra

Lifting pointwise to `A_p = L^⋈^(E×E)`:

$$v \;\leq_t\; v' \quad \Longleftrightarrow \quad \forall (s, o).\; v(s, o) \leq_t v'(s, o).$$

A valuation `v` is `≤_t`-below `v'` iff every cell of `v` is `≤_t`-below the corresponding cell of `v'`. Pointwise per cell.

This is the order in which "true valuations" sit above "false valuations" in the predicating-tier value space. It's NOT the order that settling-monotonicity uses — that's `≤_k`. But it IS the order in which the truth-order Frobenius reciprocity and truth-order quantifier adjoints of the predication-hyperdoctrine operate.

## Position

`twist-product/library/bilattice/library/truth-order/`. Sibling of `knowledge-order/`.

## Derivation source

Adapted from `predication-categories/concepts/truth-order.md`, preserved at `docs/dev/scraps/`.
