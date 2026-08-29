---
name: d-frame
description: "The algebraic dual of a bitopological space, generalizing the frame/topological-space correspondence to two-frame settings. A quadruple ⟨L_+, L_−, con, tot⟩: two frames plus a consistency relation and a totality relation. The bilattice-native data structure for the substrate's Priestley-side cohomological framework."
kind: bitopological-algebra
symbol: "𝕃"
data-shape: "⟨L_+, L_−, con, tot⟩"
components:
  positive-frame: L_+
  negative-frame: L_−
  consistency-relation: con ⊆ L_+ × L_−
  totality-relation: tot ⊆ L_+ × L_−
realizes: [knowledge-order, truth-order]
depends-on: [bilattice, predication-fiber-algebra, paired-priestley-space]
derives-from: docs/dev/scraps/d-frame.md
---

# d-frame

A **d-frame** is the algebraic dual of a bitopological space, generalizing how a frame is the algebraic dual of a topological space (Jung–Moshier 2006). The bitopological structure of the substrate's Priestley side is naturally a d-frame.

## Data

A d-frame is a quadruple

$$\mathbb{L} \;=\; (L_+,\, L_-,\, \mathrm{con},\, \mathrm{tot})$$

where:

- **`L_+`** is the **positive frame** — a complete lattice satisfying the **infinite distributive law** `a ∧ ⋁ S = ⋁_{s ∈ S}(a ∧ s)`. Carries positive evidence.
- **`L_−`** is the **negative frame** — same kind of complete lattice, carrying negative evidence.
- **`con ⊆ L_+ × L_−`** is the **consistency relation**: `(a, b) ∈ con` asserts that the positive datum `a` and the negative datum `b` are jointly **consistent** (their joint extension is non-empty).
- **`tot ⊆ L_+ × L_−`** is the **totality relation**: `(a, b) ∈ tot` asserts that `a` and `b` together **cover** (their joint extension is the whole space).

## Axioms on con and tot

The two relations satisfy:

- **`con` is downward-closed**: `(a, b) ∈ con` and `a' ≤ a`, `b' ≤ b` ⟹ `(a', b') ∈ con`. Less evidence stays consistent.
- **`tot` is upward-closed**: `(a, b) ∈ tot` and `a ≤ a'`, `b ≤ b'` ⟹ `(a', b') ∈ tot`. More evidence stays total.
- **`con` is closed under directed joins on each side**: consistency lifts through colimits.
- **`tot` is closed under finite meets on each side**: totality persists through intersections.
- **Compatibility**: structural axioms tying `con` and `tot` (Jung–Moshier 2006 §3; Jakl 2018 Ch. 2 — not reproduced here).

The category of d-frames with structure-preserving morphisms is `dFrm`.

## Canonical example: bitopological space duality

For a bitopological space `(X, τ_+, τ_-)`, the d-frame of opens is

$$\mathbb{L}(X, \tau_+, \tau_-) \;=\; (\tau_+,\, \tau_-,\, \mathrm{con}_X,\, \mathrm{tot}_X)$$

with:

- `(U, V) ∈ con_X` iff `U ∩ V = ∅` — disjoint opens are consistent (no point is told both).
- `(U, V) ∈ tot_X` iff `U ∪ V = X` — together-covering opens are total (every point is told at least one).

This is the **Belnap reading**: positive evidence `U` and negative evidence `V` are **consistent** when they don't overlap (no contradiction), **total** when they cover (no gap).

## Relation to bilattices

Jakl 2025 §4.1: every distributive bilattice determines a d-frame, with `L_+` the truth-side lattice and `L_−` the order-dual of the inconsistency-side lattice. The consistency and totality relations encode the bilattice's `≤_t / ≤_k` structure.

In the other direction, every **spatial** d-frame arises from a bilattice. So d-frames and (distributive) bilattices are **equivalent algebraic structures** under spatial conditions — d-frames are the bitopological-natural presentation; bilattices are the order-natural presentation.

## Worked example: d-frame of FOUR

For `B = FOUR` viewed as a bilattice, the corresponding d-frame is:

- `L_+ = {⊥, t}` (the positive-evidence component; binary).
- `L_− = {⊥, f}` viewed in order-dual (the negative-evidence component; binary).
- `con = {(⊥, ⊥), (⊥, f), (t, ⊥)}` — consistent pairs (no `(t, f)` because that's the contradiction `⊤` in bilattice form).
- `tot = {(t, f)}` — total pair (the bilattice's `⊤` = "told both" covers the whole spectrum of evidence).

This is the smallest non-trivial d-frame — the Belnap d-frame.

## Why d-frames are used at settling tier

The substrate's Priestley-side computations (settling-cohomology, settlement-priestley-dual) work in d-frame-valued sheaves and d-frame-related structures. The d-frame is the **algebraic packaging** of Priestley duality that makes the substrate's cohomological framework run.

Specifically, the cohomological framework #2 (Tarski-Laplacian on discrete-points fiber) uses d-frame-valued sheaves directly; framework #3 (cellular-sheaf-on-clopen-lattice) uses Q-enriched sheaves that include d-frames as a special case.

## Position

`finite-settlement-algebra/hacking/library/d-frame/`. Settling tier — the d-frame is the algebraic structure the Priestley side of settlements lives in.

## Derivation source

Adapted from `predication-categories/objects/d-frame.md`, preserved at `docs/dev/scraps/`. The archive cites Jung–Moshier 2006 and Jakl 2018 for the foundational d-frame theory.
