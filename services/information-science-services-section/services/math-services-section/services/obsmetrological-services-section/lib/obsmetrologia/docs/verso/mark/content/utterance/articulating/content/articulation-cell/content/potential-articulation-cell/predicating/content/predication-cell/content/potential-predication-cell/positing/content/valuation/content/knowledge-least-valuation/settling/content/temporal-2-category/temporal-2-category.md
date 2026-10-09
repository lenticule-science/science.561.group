---
name: temporal-2-category
kind: 2-category
description: "The 2-category T(C, λ) packaging the predicate-category C with the settling-bound λ into a single temporal structure. 0-cells are pairs (τ, A) with τ ∈ λ and A ∈ Cat/C; 1- and 2-cells encode both predicate-category morphisms and settling-direction advances. The categorical home for temporal Beck-Chevalley and the settling-endofunctor's 2-categorical structure."
symbol: "T(C, λ)"
zero-cells: "(τ, A) with τ ∈ λ and A ∈ Cat/C"
one-cells: "(f, h): (τ', A') → (τ, A) — f: A' → A in Cat/C, h: τ → τ' in λ-op"
two-cells: "pseudo-morphisms compatible with both predicate-axis and settling-axis structure"
dual: "T*(C^op, λ^op) — the dualized temporal 2-category"
minted-from: theorem-context — referenced by temporal-beck-chevalley (just placed), dual-predication-hyperdoctrine (already placed), and several other places without own scrap. Content reconstructed from those references plus the bitopological-settling-site's two-direction indexing pattern.
---

# Temporal 2-category

The 2-category `T(C, λ)` packaging the predicate-category `C` with the settling-bound `λ` into a **single temporal structure**.

## 0-cells

Pairs `(τ, A)` with:

- `τ ∈ λ` — a settling step ordinal.
- `A ∈ Cat/C` — a category over `C` (the predicate-category).

## 1-cells

Morphisms `(f, h): (τ', A') → (τ, A)` consisting of:

- `f: A' → A` — a `Cat/C`-morphism (compatible with the predicate-category structure).
- `h: τ → τ'` — a `λ^op`-morphism (equivalently `τ' ≥ τ`; settling advances forward in time, so morphisms in the `λ^op` direction).

The two components encode **both** the predicate-axis movement (via `f`) and the settling-axis advancement (via `h`).

## 2-cells

Pseudo-morphisms compatible with both axes. Specifically, for parallel 1-cells `(f_1, h_1), (f_2, h_2): (τ', A') → (τ, A)`, a 2-cell `α: (f_1, h_1) ⇒ (f_2, h_2)` consists of:

- A natural transformation `α_f: f_1 ⇒ f_2` in `Cat/C`.
- Compatibility with the `h`-components (which are usually ordinal-comparable, so this often reduces to a coherence condition).

## Why this 2-category

The temporal 2-category is the **categorical home** for the substrate's two-axis structure:

- **Predicate axis** (contravariant in morphisms): predicate-category `C` with its four-generator structure.
- **Settling axis** (covariant in settling-progression but contravariant in morphism direction): settling-bound `λ^op`.

Operations that need both axes — temporal Beck-Chevalley, the settling-endofunctor's 2-categorical structure, the bitopological-settling-site's indexing — naturally live in `T(C, λ)`.

## Use in temporal Beck-Chevalley

The temporal-beck-chevalley theorem states the Beck-Chevalley commutation for pseudo-pullback squares in `T(C, λ)`. The 2-category provides the right setting: pseudo-pullbacks of `T(C, λ)` are pseudo-pullbacks of both the predicate-axis and the settling-axis simultaneously.

## Dual: `T*(C^op, λ^op)`

The dual-predication-hyperdoctrine uses the **dualized temporal 2-category** `T*(C^op, λ^op)` — the same 2-category structure with both axes reversed via Jung-Rivieccio duality.

| Primal axis | Dual axis |
|---|---|
| `C` (predicate-category) | `C^op` |
| `λ^op` (settling-bound reversed) | `λ` (re-reversed) |
| Forward settling | Backward dual settling |

## Position

`finite-settlement-algebra/hacking/library/temporal-2-category/`. Settling tier — the 2-category that packages predicate-axis and settling-axis structure for cohomological and Beck-Chevalley work.

## Derivation source

**Minted from theorem context.** Referenced by temporal-beck-chevalley (just placed), dual-predication-hyperdoctrine (already placed), bitopological-settling-site (in its two-direction indexing), with no own archive scrap. Reconstructed from those references.
