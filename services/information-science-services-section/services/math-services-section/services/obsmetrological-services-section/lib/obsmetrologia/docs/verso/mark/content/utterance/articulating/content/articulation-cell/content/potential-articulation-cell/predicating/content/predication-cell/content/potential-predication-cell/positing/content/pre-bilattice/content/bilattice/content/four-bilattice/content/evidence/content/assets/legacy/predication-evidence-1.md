---
name: evidence
description: "The role borne by the two coordinates of a twist-product value ⟨a_+, a_-⟩. First coordinate is positive evidence (information for the assertion); second coordinate is negative evidence (information against). The semantic role that makes the two bilattice orders interpretable as 'how much known' and 'which direction.'"
depends-on: [twist-product, four-bilattice]
derives-from: docs/dev/scraps/evidence.md
---

# Evidence

The role borne by the two coordinates of a twist-product value `⟨a_+, a_-⟩ ∈ L₁ × L₂`:

- First coordinate `a_+` — **positive evidence** (information *for* the assertion).
- Second coordinate `a_-` — **negative evidence** (information *against*).

The carrier of the value is `L₁ × L₂`; the interpretation of the coordinates as evidence is the *semantic role* the substrate assigns them.

## Why role-vs-carrier matters

The twist-product construction `L^⋈` produces a bilattice from a lattice `L`. As an algebra, the carrier is just `L × L` — a pair of lattice elements. The bilattice operations operate on these pairs componentwise (knowledge-meet) or with sign-flips (truth-meet).

Adding the "evidence" interpretation does not change the algebra. It assigns the first coordinate the role of "what is supported" and the second the role of "what is opposed." The interpretation is what makes the algebraic structure operationally meaningful for predication: every cell value `v(p)(s, o)` says "here's how much positive evidence we hold, and here's how much negative."

This separation (carrier vs. role) is what lets the substrate compute with bilattice values without losing track of what they mean.

## Dual behavior under the two orders

The two evidence kinds behave **dually** under the bilattice's two orders. This duality is the structural source of why the two orders are independent.

**Truth order `≤_t`**:

| Coordinate | Behavior under `≤_t` |
|---|---|
| `a_+` (positive evidence) | UP — more truth requires more positive |
| `a_-` (negative evidence) | DOWN — more truth requires less negative |

Moving up in `≤_t` means "more positive AND less negative" — the direction of "more true."

**Knowledge order `≤_k`**:

| Coordinate | Behavior under `≤_k` |
|---|---|
| `a_+` (positive evidence) | UP — more knowledge includes more positive |
| `a_-` (negative evidence) | UP — more knowledge includes more negative |

Moving up in `≤_k` means "more positive AND more negative" — the direction of "more known regardless of which way it points."

## Negation interchanges the two coordinates

Negation `~⟨a_+, a_-⟩ = ⟨a_-, a_+⟩` swaps positive evidence with negative evidence. Equivalently: negating a value asks "what would the situation be if positive and negative evidence were swapped?"

This is exactly the right operation for classical "not": "not p" has positive evidence wherever "p" has negative evidence and vice versa. Bilattice negation generalizes classical negation by carrying through the swap on both axes (positive ↔ negative for both how-much-positive and how-much-negative).

## The four configurations on FOUR

For `L = 2`, evidence components are `{0, 1}` — Boolean: have-it or don't. The four canonical evidence configurations:

| Value | `⟨pos, neg⟩` | Evidence state | Frege reading |
|---|---|---|---|
| `⊥` | `⟨0, 0⟩` | no evidence (told nothing) | both slots unsaturated |
| `t` | `⟨1, 0⟩` | positive only (told true) | positive slot saturated only |
| `f` | `⟨0, 1⟩` | negative only (told false) | negative slot saturated only |
| `⊤` | `⟨1, 1⟩` | both (told contradictory) | both slots saturated |

The CLAUDE.md "Fregean predication forces FOUR" derivation arrives at the same four states from the Frege-slot argument: each of the two slots being filled-or-not gives `2 × 2 = 4`, and the slots correspond to the two evidence kinds here. The bilattice's evidence interpretation is therefore the structurally-correct match for the Fregean derivation — not a chosen labeling, but the labeling that the math forces.

## Why this is a concept, not a separate carrier

Evidence is the *role* the twist-product coordinates play, not a separate datum. The carrier is still `L₁ × L₂`; "evidence" is the interpretive label that says: when this carrier values a predication-cell, the two coordinates are the cell's positive-evidence and negative-evidence accumulators.

If one strips the evidence interpretation, the algebra still works — it's just a pair-of-lattices algebra with two derived orders. But the operational reading becomes opaque: one no longer knows what "going UP in `≤_k`" *means*; one just sees coordinates growing.

So evidence is not a structural addition; it is the structural label that makes the bilattice operationally interpretable.

## Cross-bilattice generalization

For `L ≠ 2`, evidence components are arbitrary lattice elements. The reading generalizes:

- `L = [0, 1]` (unit interval): evidence components are real-valued degrees of confidence. Bilattice `[0, 1]^⋈` carries pairs `⟨degree-for, degree-against⟩`.
- `L = N` (natural numbers): evidence components are counts. Useful for "how many independent sources confirm" vs "how many oppose."
- `L = MV-algebra`: evidence components are MV-values. Used in Łukasiewicz infinite-valued logic with bilattice twist.

In each case, the role-vs-carrier distinction holds: the carrier is `L × L`, the role is `⟨for, against⟩`.

## Position

`twist-product/library/evidence/`. Placed under twist-product because the coordinate-pair structure of twist-product values IS what gives evidence its formal home. Sibling of `bilattice` (the algebra with negation) and `four-bilattice` (the smallest specialization) and `pre-bilattice` (the structure without negation).

## Derivation source

Adapted from `predication-categories/concepts/evidence.md`, preserved at `docs/dev/scraps/`.
