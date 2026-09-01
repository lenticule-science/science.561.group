---
name: classical-equality
description: "The ≤_t-Lawvere image of the constant-t valuation on the diagonal Δ_E, derived in any predication-hyperdoctrine. =_E(s, o) = t if s = o, f if s ≠ o. Classical two-valued equality, DERIVED from the truth-order quantifier adjoints, not postulated."
symbol: "=_E"
depends-on: [predication-hyperdoctrine, predicate-specialization, truth-order, entity-set]
derives-from: docs/dev/scraps/classical-equality.md
---

# Classical equality (derived)

Fix a predicate specialization `g: q → p` with `dom(q) = Δ_E := {(s, s) : s ∈ E}` — the **diagonal sub-support** of `E × E`. The classical equality on a predication-hyperdoctrine `E` is

$$=_E \;:=\; \exists_g^t\bigl(\mathbf{1}_q^t\bigr) \;\in\; \mathcal{E}_p,$$

where `1_q^t` is the `≤_t`-terminal of the fiber `E_q` — the constant-`t` valuation on `Δ_E`.

## Computing `=_E` from the specialization extension formula

By the specialization-hyperdoctrinal-adjoints extension formulas (the `≤_t`-system extends by `f` outside the sub-support), explicit values are:

$$=_E(s, o) \;=\; \begin{cases} \mathbf{t} & s = o, \\ \mathbf{f} & s \neq o. \end{cases}$$

The diagonal carries `t` (told true); off-diagonal carries `f` (told false). This is classical two-valued equality — equality holds on the diagonal and fails elsewhere, with truth/falsity at full strength.

## Why "derived"

Classical equality is NOT postulated as a primitive in this substrate. It is **constructed** from the hyperdoctrine's `≤_t`-quantifier-adjoint system, via Lawvere's classic diagonal-`Σ` construction:

- Take the diagonal sub-support `Δ_E ⊆ E × E`.
- Take the constant-`t` valuation on the fiber over the diagonal predicate `q`.
- Extend along the specialization `g: q → p` via `≤_t`-existential.

The extension fills the off-diagonal cells with the `≤_t`-bottom (`f`), giving classical two-valued equality.

This is a **structurally important fact**: bilattice first-order logics in the literature (BD∆, Kamide–Zohar, Běhounek–Daňková–Dvořák) postulate classical equality as a primitive. Here it falls out of the dual adjoint triple. The postulate is unnecessary.

## Comparison with paraconsistent equality

The sibling $thing `paraconsistent-equality` uses the **`≤_k`-system** instead of the `≤_t`-system:

$$\Delta_E^k \;:=\; \exists_g^k(\mathbf{1}_q^k) \;\in\; \mathcal{E}_p.$$

The `≤_k`-version extends by `⊥` (the `≤_k`-bottom) off-diagonal, giving values

$$\Delta_E^k(s, o) \;=\; \begin{cases} \top & s = o, \\ \bot & s \neq o. \end{cases}$$

So:

| Equality | Diagonal | Off-diagonal |
|---|---|---|
| `=_E` (classical) | `t` | `f` |
| `Δ_E^k` (paraconsistent) | `⊤` | `⊥` |

Classical: asserts truth on diagonal, falsehood off. Paraconsistent: asserts maximal evidence on diagonal, no claim off.

The two equalities answer different questions:

- **Classical equality** asks "are these the same in truth?" — yields `t` or `f`.
- **Paraconsistent equality** asks "are these the same in evidence?" — yields `⊤` (both are equally-asserted on diagonal) or `⊥` (no claim, undetermined).

Classical equality `≤_t`-distinguishes; paraconsistent equality `≤_k`-distinguishes.

## Why this is settling-tier-relevant via comprehension

In a predication-hyperdoctrine, the (B4) comprehension axiom yields a right adjoint to the extension functor:

$$\mathrm{Ext}^t: \mathcal{C}/p \to \mathcal{E}_p, \qquad (g: q \to p) \;\mapsto\; \exists_g^t(\mathbf{1}_q^t).$$

The extension functor's right adjoint is the comprehension `{p : -}_t: E_p → C/p`. The classical equality `=_E` is `Ext^t(g)` for the diagonal-`g` — the canonical extension that comprehension's right adjoint sends to the diagonal sub-predicate.

So classical equality IS the comprehension-image of the diagonal sub-predicate. The (B4) axiom is what guarantees its existence.

## Position

`scott-continuous-posit-category/library/predication-hyperdoctrine/library/classical-equality/`. Inside the predication-hyperdoctrine as a derived sub-term — the equality predicate the hyperdoctrine's `≤_t`-adjoint-system + (B4) comprehension produces from the diagonal sub-support.

## Derivation source

Adapted from `predication-categories/objects/classical-equality.md`, preserved at `docs/dev/scraps/`.
