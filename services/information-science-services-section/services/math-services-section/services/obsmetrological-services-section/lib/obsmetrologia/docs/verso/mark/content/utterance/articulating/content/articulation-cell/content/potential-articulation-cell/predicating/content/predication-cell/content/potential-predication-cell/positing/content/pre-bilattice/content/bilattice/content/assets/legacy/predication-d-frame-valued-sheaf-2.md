---
name: d-frame-valued-sheaf
description: "The bilattice-native counterpart of the settling-associated-sheaf. A sheaf on the bitopological-settling-site whose values are d-frames, encoding both truth-side and inconsistency-side cells with their consistency/totality structure intrinsically."
kind: sheaf
symbol: "𝔽_U"
on-site: bitopological-settling-site
valued-in: d-frames (dFrm)
sections-meaning: "d-frame ⟨Δ^+_τ(q), Δ^-_τ(q), con_τq, tot_τq⟩ at each (q, τ, U)"
realizes: [cohomological-equivalence, kz-coherent-sheaf]
depends-on: [bitopological-settling-site, d-frame, settling-associated-sheaf, increment-sequence, settlement, paired-priestley-space]
derives-from: docs/dev/scraps/d-frame-valued-sheaf.md
---

# d-frame-valued sheaf

The **bilattice-native** counterpart of the settling-associated-sheaf. Where `F_U` is `Ab`-valued (tracks only newly-`t` cells), the d-frame-valued sheaf

$$\mathbb{F}_U \;:\; \mathbf{T}^*_{\mathrm{site}} \to \mathbf{dFrm}$$

assigns to each site object a **d-frame** that intrinsically encodes BOTH truth-side and inconsistency-side cells, with their consistency and totality structure built in.

## Construction

Fix a settlement `(E, c)` over `(L, C, E, λ)` with increment-sequence `U = (u_τ)_{τ<λ}`. For each `(q, τ)`, define two cell-tracking sets:

**Newly-`t` cells at stage `τ`:**
$$\Delta^+_\tau(q) \;:=\; \{(s, o) : v_\tau(q)(s, o) \in \{\mathbf{t}, \top\} \,\text{ and the }\mathbf{t}\text{-component first appears at } \tau\}.$$

**Newly-`f` cells at stage `τ`:**
$$\Delta^-_\tau(q) \;:=\; \{(s, o) : v_\tau(q)(s, o) \in \{\mathbf{f}, \top\} \,\text{ and the }\mathbf{f}\text{-component first appears at } \tau\}.$$

Note the **intersection** `Δ^+_τ(q) ∩ Δ^-_τ(q)` ⊆ `{(s, o) : v_τ(q)(s, o) = ⊤}` — cells that become `⊤` (both positive and negative evidence) at stage `τ`. These cells are simultaneously in both `Δ^+` and `Δ^-` because the `t`-component and the `f`-component both first appear at `τ`.

`F_U(q, τ, U)` is then assembled as a d-frame:

$$\mathbb{F}_U(q, \tau, U) \;:=\; \bigl\langle\, \mathrm{Pow}\bigl(\Delta^+_\tau(q) \cap U\bigr),\;\; \mathrm{Pow}\bigl(\Delta^-_\tau(q) \cap U\bigr),\;\; \mathrm{con}_{q, \tau, U},\;\; \mathrm{tot}_{q, \tau, U} \,\bigr\rangle$$

with:

- `L_+` = power set of newly-`t` cells in `U`.
- `L_−` = power set of newly-`f` cells in `U`.
- `con_{q,τ,U}` = pairs `(A, B)` such that `A ∩ B = ∅` after identifying the shared-cells (`⊤`-cells) — consistent positive/negative selections.
- `tot_{q,τ,U}` = pairs `(A, B)` such that `A ∪ B` covers all newly-designated cells — total selections.

## Why both sides at once

The `Ab`-valued settling-associated-sheaf `F_U` tracks ONLY positive-evidence cells (the newly-`t` ones). It treats `⊤`-cells (those holding both positive AND negative evidence) as just-positive — losing the negative-side information.

The d-frame-valued sheaf `F_U` carries **both sides simultaneously**. The `⊤`-cells appear in BOTH `Δ^+` and `Δ^-`, with consistency/totality relations recording which combinations are consistent (no contradiction) and which are total (full coverage).

This is the **bilattice-native** sheaf: it tracks all four possible cell-states (`⊥`, `t`, `f`, `⊤`) and their interactions, rather than only the truth-side.

## Two complementary sheaves

The substrate has two natural sheaves on the bitopological-settling-site:

| Sheaf | Values | What it tracks |
|---|---|---|
| `settling-associated-sheaf F_U` | `Ab` (Abelian groups) | newly-`t` cells only |
| `d-frame-valued-sheaf F_U` (this $thing) | `dFrm` (d-frames) | both newly-`t` and newly-`f` cells, plus consistency/totality |

The `F_U` sheaf is simpler and supports classical cohomology (the cohomological framework's `H^n` invariants). The `F_U` sheaf is richer and supports d-frame-valued cohomology (cohomological framework #2, Tarski-Laplacian on discrete-points fiber).

For most cohomological-classification work, `F_U` suffices. For bilattice-native analyses, `F_U` is preferred.

## KZ-coherence

Like `F_U`, the d-frame-valued sheaf is **KZ-coherent** — values respect the closure-2-monad structure on the algebraic side via Jung–Rivieccio duality, lifted to the d-frame setting via the bilattice ↔ d-frame correspondence.

KZ-coherence ensures the sheaf's cohomology is meaningful — connected to the inferential structure of the settlement.

## Position

`finite-settlement-algebra/hacking/library/d-frame-valued-sheaf/`. Settling tier — the bilattice-native sheaf on the bitopological-settling-site, sibling of `settling-associated-sheaf`.

## Derivation source

Adapted from `predication-categories/objects/d-frame-valued-sheaf.md`, preserved at `docs/dev/scraps/`.
