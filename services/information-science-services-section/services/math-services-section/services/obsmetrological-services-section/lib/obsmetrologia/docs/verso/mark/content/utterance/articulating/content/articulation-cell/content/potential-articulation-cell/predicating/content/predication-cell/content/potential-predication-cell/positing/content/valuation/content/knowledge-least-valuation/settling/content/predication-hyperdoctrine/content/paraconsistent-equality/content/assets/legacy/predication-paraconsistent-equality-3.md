---
name: paraconsistent-equality
description: "The ≤_k-Lawvere image of the constant-⊤ valuation on the diagonal Δ_E, derived in any predication-hyperdoctrine. Δ_E^k(s, o) = ⊤ if s = o, ⊥ if s ≠ o. The knowledge-order dual of classical equality. Stable under ∨_k-merge — the natural equality for distributed and paraconsistent reasoning."
symbol: "Δ_E^k"
depends-on: [predication-hyperdoctrine, predicate-specialization, knowledge-order, entity-set]
derives-from: docs/dev/scraps/paraconsistent-equality.md
---

# Paraconsistent equality

Fix a predicate specialization `g: q → p` with `dom(q) = Δ_E := {(s, s) : s ∈ E}` — the **diagonal sub-support** of `E × E`. The paraconsistent equality on a predication-hyperdoctrine `E` is

$$\Delta_E^k \;:=\; \exists_g^k\bigl(\mathbf{1}_q^k\bigr) \;\in\; \mathcal{E}_p,$$

where `1_q^k` is the `≤_k`-terminal of the fiber `E_q` — the constant-`⊤` valuation on `Δ_E`.

## Computing `Δ_E^k` from the specialization extension formula

By the specialization-hyperdoctrinal-adjoints extension formulas (the `≤_k`-system extends by `⊥` outside the sub-support), explicit values are:

$$\Delta_E^k(s, o) \;=\; \begin{cases} \top & s = o, \\ \bot & s \neq o. \end{cases}$$

The diagonal carries `⊤` (information-maximal — both positive and negative); off-diagonal carries `⊥` (no claim).

## What "paraconsistent" means here

The diagonal-value is `⊤`, NOT `t` — meaning the diagonal carries CONTRADICTORY-fully-determined information. Reading: "for `s = o`, the value is `⊤` because the diagonal is fully-known-from-every-direction; for `s ≠ o`, the value is `⊥` because no claim has been made."

This is the **knowledge-order** form of equality: it asserts what is *known* about the equality relation, not what is *true*. Paraconsistent because it can coexist with contradiction (`⊤` IS a contradiction value), distinguishing it from classical equality which only takes Boolean values.

## Distributed-merge stability

`Δ_E^k` is **stable under `∨_k`-merge**. If two distributed replicas independently hold `Δ_E^k` (or strengthen it elsewhere), their `∨_k`-merge produces a coherent paraconsistent equality everywhere. The `⊥` off-diagonal value is the `≤_k`-bottom and absorbs nothing; the `⊤` diagonal value is the `≤_k`-top and dominates everything.

So:

- Two replicas merging `Δ_E^k` with itself → `Δ_E^k`. (Idempotent.)
- A replica merging `Δ_E^k` with new evidence at `(s, s)` for some `s` → still `⊤` at diagonal (idempotent in `⊤`).
- A replica merging `Δ_E^k` with new evidence at `(s, o)` for `s ≠ o` → `⊥ ∨_k newevidence = newevidence`. The off-diagonal becomes whatever the new evidence says.

This makes `Δ_E^k` an excellent **starting point for distributed predication**: it commits the diagonal as fully-known and leaves the off-diagonal open for evidence to accumulate. CRDT-style monotone-semilattice replication works naturally with `Δ_E^k`.

## Comparison with classical equality

The sibling $thing `classical-equality` uses the **`≤_t`-system**:

$$=_E \;:=\; \exists_g^t(\mathbf{1}_q^t).$$

The `≤_t`-version extends by `f` off-diagonal, giving classical two-valued equality:

| Equality | Diagonal | Off-diagonal |
|---|---|---|
| `=_E` (classical) | `t` | `f` |
| `Δ_E^k` (paraconsistent) | `⊤` | `⊥` |

The two equalities are **structurally dual**: one uses the truth-order adjoint system, the other the knowledge-order adjoint system. Both are derived from comprehension on their respective system; neither is postulated.

Both equalities exist in any predication-hyperdoctrine. The choice between them is application-driven:

- For classical-logic-style reasoning where "are these the same?" is `t` or `f`: use `=_E`.
- For evidence-based distributed reasoning where "what is known about whether these are the same?" is `⊤` or `⊥`: use `Δ_E^k`.

## Equality-via-equalizer corollary

The archive theorem `equality-via-equalizer` shows that `Δ_E^k` is the **equalizer** in the predicate-category structure: the comprehension right-adjoint sends `Δ_E^k` to the diagonal specialization. So paraconsistent equality is the categorical equalizer of the identity-on-`p` with itself, in the bilattice-categorical sense.

This is the formal sense in which paraconsistent equality is the "right" knowledge-order equality: it satisfies the universal property of equalizers in the dual adjoint system.

## Position

`scott-continuous-posit-category/library/predication-hyperdoctrine/library/paraconsistent-equality/`. Inside the predication-hyperdoctrine as a derived sub-term — the equality predicate the hyperdoctrine's `≤_k`-adjoint-system + (B4) comprehension produces from the diagonal sub-support.

## Derivation source

Adapted from `predication-categories/objects/paraconsistent-equality.md`, preserved at `docs/dev/scraps/`.
