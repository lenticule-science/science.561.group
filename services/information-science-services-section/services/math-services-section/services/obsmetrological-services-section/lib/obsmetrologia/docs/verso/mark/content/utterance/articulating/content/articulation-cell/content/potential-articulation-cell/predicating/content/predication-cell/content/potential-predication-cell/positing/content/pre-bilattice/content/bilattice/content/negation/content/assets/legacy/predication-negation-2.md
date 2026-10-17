---
name: negation
description: "A unary operation ~ on a pre-bilattice that is antitone in the truth order, monotone in the knowledge order, and involutive. The operator whose addition to a pre-bilattice produces a bilattice. On a twist product, given by coordinate swap ~⟨a, b⟩ = ⟨b, a⟩ — exchange of positive and negative evidence."
symbol: "~"
realizes: [internal-z2-gauge]
depends-on: [pre-bilattice, truth-order, knowledge-order]
derives-from: docs/dev/scraps/negation.md
---

# Negation

A unary operation `~` on a pre-bilattice is a **negation** if it satisfies three axioms:

- **Antitone in the truth order:** `a ≤_t b ⟹ ~b ≤_t ~a`.
- **Monotone in the knowledge order:** `a ≤_k b ⟹ ~a ≤_k ~b`.
- **Involutive:** `~~a = a`.

A pre-bilattice equipped with a negation is a **bilattice**. This $thing IS the operator that closes the structural step from pre-bilattice to bilattice.

## The three-axiom system

The axioms are independent. None follows from the other two:

- A truth-antitone, involutive operator that is NOT knowledge-monotone — e.g. a permutation that exchanges `t ↔ f` AND `⊥ ↔ ⊤` simultaneously. This breaks knowledge-monotonicity (it would swap the knowledge-extremes).
- A knowledge-monotone, involutive operator that is NOT truth-antitone — e.g. the identity. This is monotone in every order trivially and involutive, but it does not reverse truth.
- A truth-antitone, knowledge-monotone operator that is NOT involutive — e.g. a "weakened negation" that maps `t ↦ ⊥`. This breaks involution.

So all three are required; together they pin down negation up to a small set of choices, and on a twist product they pin it down to exactly **coordinate swap**.

## On a twist product: coordinate swap

When the bilattice comes from `L^⋈`, the negation is:

$$\sim\langle a, b\rangle \;=\; \langle b, a\rangle.$$

The first coordinate (positive evidence) and second coordinate (negative evidence) trade places. This is the canonical form of bilattice negation.

**Why coordinate-swap satisfies the axioms:**

- **Antitone in `≤_t`**: `≤_t` is "first coord UP, second coord DOWN." Swapping reverses both columns, so `≤_t` is reversed. ✓
- **Monotone in `≤_k`**: `≤_k` is "both coords UP." Swapping the two coords keeps "both coords UP" but in the swapped positions. ✓
- **Involutive**: swapping twice returns the original. ✓

## On FOUR: fixes `⊥, ⊤`, swaps `t ↔ f`

For `L = 2`, the four-bilattice's negation:

| `a` | `~a` |
|---|---|
| `⊥ = (0, 0)` | `(0, 0) = ⊥` |
| `t = (1, 0)` | `(0, 1) = f` |
| `f = (0, 1)` | `(1, 0) = t` |
| `⊤ = (1, 1)` | `(1, 1) = ⊤` |

Negation FIXES the truth-neutral values (`⊥, ⊤`) and SWAPS the truth-asymmetric values (`t ↔ f`).

Geometrically: in the `(positive, negative)` plane, negation is reflection across the diagonal `y = x`. The two diagonal points (`⊥, ⊤`) are fixed; the two off-diagonal points (`t, f`) swap.

## The Z₂ gauge interpretation

Negation, being involutive, generates a `Z₂` group action on the bilattice — the "internal" gauge of evidence-flipping. The action's two orbits:

- `{⊥}` and `{⊤}` — the singleton orbits (fixed points).
- `{t, f}` — the size-2 orbit (the swap).

The bilattice is therefore stratified by `Z₂`-orbits into three orbits total: two fixed (`⊥`, `⊤`) and one doubleton (`t, f`). This stratification is the formal sense in which `~` is an "internal" symmetry — it organizes the bilattice into orbits without depending on external structure.

## Why this is what classical negation generalizes

Classical Boolean negation `¬` on `{0, 1}` swaps `0 ↔ 1`. The bilattice negation `~` on FOUR specializes to this when one restricts to the truth-asymmetric values `{t, f}` (mapped to `{1, 0}`): the swap of `t ↔ f` IS the classical swap.

The novelty in the bilattice case is the fixed points `⊥, ⊤`. Classical negation has no analogue for "told nothing" or "told both" — there's no Boolean value `b` with `¬b = b` except in degenerate three-valued systems. The bilattice introduces `⊥` and `⊤` as genuine fixed points of negation, encoding the two truth-neutral states.

## Worked use: negation in evidence-injection

Predicating's evidence-injection `v ↦ v ∨_k δ_{(φ, q)}` injects the increment `q ∈ L^⋈` at cell `φ`. Suppose one wants to inject NEGATIVE evidence at `φ`: take `q = ~q'` for `q'` the positive form. Then:

- Original cell value: `v(φ) = ⟨a_+, a_-⟩`.
- Inject `~q' = ⟨q'_-, q'_+⟩` (negation of `q'`).
- New cell value: `v(φ) ∨_k ~q' = ⟨a_+ ∨ q'_-, a_- ∨ q'_+⟩`.

The negation gets the new evidence into the negative coordinate. So `~` is the structural mechanism for "this is evidence AGAINST the predication, not for it."

## Position

`twist-product/library/bilattice/library/negation/`. Placed as a sub-term of bilattice because negation IS what makes a pre-bilattice a bilattice.

## Derivation source

Adapted from `predication-categories/morphisms/negation.md`, preserved at `docs/dev/scraps/`. The archive's Lean module reference: `PredicationCategories.Homebrew.Algebra.TwistProduct.negation`.
