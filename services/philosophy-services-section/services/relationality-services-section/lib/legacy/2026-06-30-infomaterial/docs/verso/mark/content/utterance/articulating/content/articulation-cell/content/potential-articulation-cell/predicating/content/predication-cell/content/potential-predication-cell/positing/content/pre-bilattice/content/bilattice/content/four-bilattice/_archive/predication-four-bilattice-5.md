---
name: four-bilattice
description: "The smallest non-trivial bilattice, denoted FOUR. The canonical specialization of the twist-product construction: FOUR ≅ 2^⋈, the twist of the two-element Boolean lattice with itself. The four FOUR-values are the four Belnap states of predication — told nothing, told true, told false, told both."
symbol: "FOUR"
realizes: [knowledge-order, truth-order, evidence]
depends-on: [twist-product, bilattice]
derives-from: docs/dev/scraps/four-bilattice.md
---

# Four-element bilattice

The smallest non-trivial bilattice. Carrier:

$$\mathbf{FOUR} \;=\; \{\,\bot, \mathbf{t}, \mathbf{f}, \top\,\}.$$

## As a twist product

`FOUR ≅ 2^⋈` — the twist product of the two-element Boolean lattice `2 = {0, 1}` with itself, equipped with the swap-negation `~⟨a, b⟩ = ⟨b, a⟩`. Coordinate identification:

$$\mathbf{f} = \langle 0, 1 \rangle, \qquad \bot = \langle 0, 0 \rangle, \qquad \top = \langle 1, 1 \rangle, \qquad \mathbf{t} = \langle 1, 0 \rangle.$$

Reading: first coordinate is positive evidence (0 = no, 1 = yes); second coordinate is negative evidence (0 = no, 1 = yes).

## The four states

| Symbol | Coord | Positive | Negative | Meaning |
|---|---|---|---|---|
| `⊥` | `⟨0, 0⟩` | no | no | told nothing |
| `t` | `⟨1, 0⟩` | yes | no | told positive only |
| `f` | `⟨0, 1⟩` | no | yes | told negative only |
| `⊤` | `⟨1, 1⟩` | yes | yes | told both (contradiction) |

These are the four **Belnap states**. They are not "true / false / undefined / unknown" — that would be three categories smushed together. They are the four distinct combinations of positive-evidence-status (binary) and negative-evidence-status (binary): `2 × 2 = 4`.

## The two orders

**Knowledge order** `≤_k` (componentwise on coords, both coordinates UP):

```
       ⊤
      / \
     t   f
      \ /
       ⊥
```

`⊥` (bottom) is least known; `⊤` (top) is most known (both kinds of evidence present); `t` and `f` are knowledge-incomparable (both hold one piece of evidence, but of different polarity).

**Truth order** `≤_t` (first coord UP, second DOWN):

```
       t
      / \
     ⊥   ⊤
      \ /
       f
```

`f` (bottom) is most false; `t` (top) is most true; `⊥` and `⊤` are truth-incomparable (both truth-neutral, for opposite reasons).

The two diagrams use the same four points but place them in different positions — knowledge-rhombus vs truth-rhombus, rotated 90°.

## Negation

`~` fixes `⊥` and `⊤` (the truth-neutral values), swaps `t ↔ f` (the truth-asymmetric values):

$$\sim \bot = \bot, \qquad \sim \mathbf{t} = \mathbf{f}, \qquad \sim \mathbf{f} = \mathbf{t}, \qquad \sim \top = \top.$$

On coordinates: `~⟨a, b⟩ = ⟨b, a⟩`, just swap. Geometrically: reflection across the diagonal in the `(positive, negative)` plane.

## Conflation (optional)

`−` fixes `t` and `f` (the truth-asymmetric values), swaps `⊥ ↔ ⊤` (the truth-neutral ones):

$$-\bot = \top, \qquad -\mathbf{t} = \mathbf{t}, \qquad -\mathbf{f} = \mathbf{f}, \qquad -\top = \bot.$$

Conflation flips the knowledge dimension while fixing the truth dimension. Together with `~`, conflation generates a **Klein-four symmetry** on FOUR:

$$\{\,\mathrm{id}, \sim, -, \sim\circ-\,\}.$$

The `Z₂ × Z₂` action: `id` is the identity; `~` swaps `t/f`; `−` swaps `⊥/⊤`; `~∘−` swaps both pairs simultaneously.

## Klein-four symmetry table

| Operator | Acts on `⊥` | Acts on `t` | Acts on `f` | Acts on `⊤` |
|---|---|---|---|---|
| `id` | `⊥` | `t` | `f` | `⊤` |
| `~` | `⊥` | `f` | `t` | `⊤` |
| `−` | `⊤` | `t` | `f` | `⊥` |
| `~∘−` | `⊤` | `f` | `t` | `⊥` |

The four operators form a group of order 4 isomorphic to `Z₂ × Z₂`, with the diagonal-axis structure: `~` reflects across one diagonal, `−` reflects across the other, their composition is a 180° rotation, and identity does nothing.

## Why FOUR specifically — derived from Frege's two slots

The CLAUDE.md "Fregean predication forces FOUR" central result derives the four-element structure from first principles:

1. Predication has exactly two argument-slots (subject, object) — by Frege.
2. Each slot has a binary saturation status — saturated or unsaturated.
3. The two slots are independent — typed-asymmetric.
4. Two independent binary states give `2 × 2 = 4` joint states.
5. None of the four states is redundant — they encode distinct content.
6. The four states carry two independent orders — knowledge and truth.

The conclusion: predicating's codomain-carrier is exactly FOUR. The four-bilattice is not chosen; it is **forced** by the structure of predication.

The active tree realizes FOUR as the four cells of each regime-category (potential / active / stable / absurd) — structural identity, not analogy. The bilattice element `⊥` corresponds to the potential-cell; `t` to active-cell; `f` to stable-cell; `⊤` to absurd-cell.

## Avron + universality

By Avron's representation theorem (see `bilattice` $thing), `FOUR ≅ 2^⋈` is the **universal smallest** non-trivial bilattice: every interlaced bounded bilattice has FOUR embedded as a sub-algebra (the embedding sends `⊥, t, f, ⊤` to the corresponding extremes of the larger bilattice's two orders).

So when one says "the substrate's value algebra is a bilattice," FOUR is always sitting inside as the basic substructure. Larger bilattices `L^⋈` for `L ≠ 2` add finer-grained intermediate values but keep the FOUR-shape at the four extreme corners.

## Operations table (negation)

Already given above. For the four lattice operations `∧_k, ∨_k, ∧_t, ∨_t` on FOUR, see the worked example in the `bilattice` $thing.

## Position

`twist-product/library/four-bilattice/`. The path: four-bilattice is the term `L = 2` specialization of twist-product. Sibling of `bilattice` (which is the general twist-product + negation) and `pre-bilattice` (twist-product without negation).

## Derivation source

Adapted from `predication-categories/objects/four-bilattice.md`, preserved verbatim at `docs/dev/scraps/four-bilattice.md`. The archive content is already in essentially current grammar.
