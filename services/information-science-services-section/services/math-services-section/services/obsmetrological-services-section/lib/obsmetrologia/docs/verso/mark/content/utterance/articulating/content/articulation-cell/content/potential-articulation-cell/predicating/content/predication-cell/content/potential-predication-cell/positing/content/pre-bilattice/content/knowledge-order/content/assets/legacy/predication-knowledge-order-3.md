---
name: knowledge-order
description: "The order ≤_k associated with the knowledge lattice ⟨B, ∧_k, ∨_k⟩ of a bilattice. Raises both positive and negative evidence. The order in which predication-cell values monotonically accumulate as evidence is added — the operational order settling produces."
symbol: "≤_k"
depends-on: [bilattice]
derives-from: docs/dev/scraps/knowledge-order.md
---

# Knowledge-order

The order `≤_k` associated with the **knowledge lattice** `⟨B, ∧_k, ∨_k⟩` of a bilattice. When the underlying lattice is bounded, `≤_k` has bottom `⊥` and top `⊤`.

## Defining property

`a ≤_k b` iff `a ∧_k b = a`, equivalently `a ∨_k b = b`. Standard lattice-order definition; the operations and the order determine each other.

The induced order has `⊥` as least element (no evidence) and `⊤` as greatest element (contradictory evidence — both positive and negative). The interesting bilattice content sits between: `t` and `f` are `≤_k`-incomparable (both have *one* piece of evidence, but of different polarity).

## Twist-product expression

In a twist product `L_1 ⋈ L_2`,

$$\langle a_1, a_2\rangle \;\leq_k\; \langle b_1, b_2\rangle \quad \Longleftrightarrow \quad a_1 \leq_1 b_1 \text{ in } L_1 \text{ and } a_2 \leq_2 b_2 \text{ in } L_2.$$

Both coordinates go UP. The knowledge-order is the **componentwise product order** on the twist-product carrier.

This is the "more evidence" direction in the most direct sense: moving up in `≤_k` adds positive evidence (first coordinate grows) AND negative evidence (second coordinate grows). Both kinds of evidence accumulate together.

## Hasse diagram on FOUR

The Hasse diagram of `≤_k` on `FOUR`:

```
       ⊤
      / \
     t   f
      \ /
       ⊥
```

Reading: `⊥ ≤_k t`, `⊥ ≤_k f`, `t ≤_k ⊤`, `f ≤_k ⊤`. The "rhombus" shape with `⊥` at bottom, `⊤` at top, and `t, f` as parallel middle elements.

This is exactly the shape predication needs: evidence-injection at a cell can take it from `⊥` (no evidence) UP to `t` (positive) or `f` (negative), and from there UP to `⊤` (both). It cannot go sideways from `t` to `f` because they are knowledge-incomparable — moving directly from positive to negative evidence would not be a monotone knowledge-order move; it requires going through `⊤` (accepting both).

## Negation is monotone in `≤_k`

On a bilattice, negation `~` is **monotone** in `≤_k`:

$$a \leq_k b \quad \Longrightarrow \quad {\sim}a \leq_k {\sim}b.$$

On the twist product, `~⟨a, b⟩ = ⟨b, a⟩` (coordinate swap). The swap preserves the componentwise-product structure: if both coordinates grow, then after swapping they still both grow (in their new positions). Monotonicity is automatic.

This is in striking contrast to negation's behavior under truth-order, where it is *antitone*. The two-order duality of negation is the structural source of much of the bilattice's richness.

## Why this is THE order predicating uses

Predicating's evidence-injection function is

$$v \;\mapsto\; v \vee_k \delta_{(\phi, q)}$$

The cell value moves UP in the knowledge-order toward the join with the new evidence atom. The order `≤_k` is therefore the natural setting for predicating's monotonicity: cells only gain evidence, never lose it.

Three operational readings of `a ≤_k b`:

1. **Information accumulation:** `b` holds at least as much evidence as `a` — both polarity coordinates of `b` are `≥` those of `a`.
2. **Refinement:** any predicate-cell behavior consistent with `a` is consistent with `b` (more knowledge constrains more).
3. **Settling-direction:** as settling progresses, `v_τ(p)(s, o)` moves up in `≤_k`. Settling-monotonicity (`σ ≤ τ ⟹ v_σ ≤_k v_τ`) is the formal statement.

## Behavior on the predication-fiber-algebra

Lifting pointwise to `A_p = L^⋈^(E×E)`:

$$v \;\leq_k\; v' \quad \Longleftrightarrow \quad \forall (s, o) \in E \times E.\; v(s, o) \leq_k v'(s, o).$$

A valuation `v` is `≤_k`-below another `v'` iff *every cell* of `v` is `≤_k`-below the corresponding cell of `v'`. There is no averaging or summing — the order is **pointwise**.

This is what makes settling-monotonicity tractable: to check that `v_σ ≤_k v_τ`, one checks each cell independently. The check parallelizes over cells.

## Directed joins and Scott-continuity

A `≤_k`-directed subset `S ⊆ B` is one where every two elements have an upper bound in `S`. The knowledge-order's bounded lattice structure means directed joins always exist: `⋁_k S` is the supremum of `S` in `≤_k`.

A closure-operator `cl: A_p → A_p` is **Scott-continuous in `≤_k`** iff it commutes with directed joins:

$$\mathrm{cl}\!\left(\bigvee_k S\right) \;=\; \bigvee_k\{\,\mathrm{cl}(s) : s \in S\,\}.$$

Scott-continuity at `≤_k` is the precondition for the closure-ordinal to be `ω` (the Scott-continuous regime). When `cl` is Scott-continuous, the orbit's `ω`-limit value is forced by the directed-join of its preceding values — settling-continuity at `ω` holds automatically.

The four-regime tower's distinguishing condition at the `ω` boundary IS Scott-continuity of `cl` in `≤_k`.

## Position

`twist-product/library/bilattice/library/knowledge-order/`. The path: knowledge-order is a term of bilattice (one of its two orders), which is a term of twist-product equipped with negation.

## Derivation source

Adapted from `predication-categories/concepts/knowledge-order.md`, preserved at `docs/dev/scraps/`.
