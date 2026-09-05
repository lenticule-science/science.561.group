---
name: dual-predication-hyperdoctrine
description: "The Priestley-dual of a predication-hyperdoctrine, obtained by piecewise Jung-Rivieccio duality. Fibers become Spec(A_q) ∈ PairedPriSp; total category Grothendieck-constructs over C^op; variance flips (opfibration); fibration-KZ pair swaps roles (M* lax-idempotent comonad, N* colax-idempotent monad); closure 2-monad becomes dual closure 2-comonad (restriction-to-confirming-Priestley-points); settling coalgebra becomes settling algebra."
depends-on: [predication-hyperdoctrine, settling-coalgebra-structure, paired-priestley-space, closure-2-monad, settling-endofunctor, predicate-category]
derives-from: docs/dev/scraps/dual-predication-hyperdoctrine.md
---

# Dual predication hyperdoctrine

The dual of a predication-hyperdoctrine `E` over `(L, C, E, ...)` is the tuple

$$\bigl(\mathcal{E}^*, \;\; p^*: \mathcal{E}^* \to \mathcal{C}^{op}, \;\; \mathbb{M}^*, \;\; \mathbb{N}^*, \;\; \mathrm{Cl}^*, \;\; \mathbf{T}^*(\mathcal{C}^{op}, \lambda^{op})\bigr)$$

obtained by piecewise application of Jung–Rivieccio duality.

Existence and structural coherence of this entire tuple is the content of the **Priestley dualizability theorem** (archive theorem, not yet pulled).

## Component-by-component duality

### Fibers

$$\mathcal{E}^*_q \;=\; \mathrm{Spec}(A_q) \;\in\; \mathbf{PairedPriSp}.$$

Each predication-fiber-algebra `A_q = L^⋈^(E×E)` dualizes via `Spec` to a paired-Priestley-space. The algebraic-side structure (cells with values in the bilattice) becomes the topological-side structure (Priestley points with order and swap involution).

### Total category

`E^*` is the Grothendieck construction of the dualized fiberwise data over `C^op`. As a category, it organizes all `Spec(A_q)`-fibers and their reindexings into a single fibered object — the dual analogue of the primal total category `E`.

### Variance flip

`p^*: E^* → C^op` is an **opfibration**, not a fibration. Morphisms in `C` stay where they were, but reindexing `(f^*)^*` runs in the **opposite direction** in the fibers. This is the dual structural shape: primal-fibration becomes dual-opfibration under the contravariant `Spec`.

### Dual fibration-KZ pair

The primal `M ⊣ N` 2-adjunction (where `M` is the Gray–Street fibration 2-monad and `N` its right adjoint cofibration 2-comonad) dualizes with **roles swapped**:

- `M^*` is a **lax-idempotent 2-comonad**.
- `N^*` is a **colax-idempotent 2-monad**.
- The 2-adjunction `M^* ⊣ N^*` on `Cat/C^op` has the same diamond shape as the primal, with monad/comonad roles swapped.

This swap is structurally important: KZ ("left-lax") and co-KZ ("right-lax") duality is what makes the dualization coherent at the 2-categorical level.

### Dual closure 2-comonad

The primal closure 2-monad `Cl` becomes a **dual closure 2-comonad** `Cl^*` on `PrFib^*`:

- `Cl^*` is colax-idempotent (the swap of lax-idempotence under Cl ⇄ Cl^*).
- Its action on dual fibers is **restriction-to-confirming-Priestley-points**: from a paired-Priestley-space, restrict to the points that confirm the dual predicates.
- This is the Stone-dual face of the primal's "inflate and add consequences": where primal closure ADDS evidence to the value, dual closure RESTRICTS attention to evidence-confirming points.

Operationally: the algebraic closure makes a value bigger in `≤_k`; the topological co-closure makes a point-set smaller (since `Spec` is contravariant, "bigger value" ↔ "smaller point set").

### Dual temporal 2-category

`T^*(C^op, λ^op)` has:

- **0-cells** `(τ, X^*)` for `τ ∈ λ^op` (the reversed settling bound) and `X^* ∈ Cat/C^op`.
- **1- and 2-cells** dualize via the dual 2-adjunction.

The reversed ordinal `λ^op` is crucial: dual settling runs "backwards" in ordinal time relative to the primal. A primal settling that monotonically grows in `≤_k` toward quiescence corresponds to a dual settling that monotonically *shrinks* its confirming Priestley point-set toward a fixed minimum.

### Dual settling: algebra instead of coalgebra

The primal settlement carries a **coalgebra structure** `c: E → F_U(E)` — the settling-endofunctor consumes the current state and produces the next. This dualizes to a **settling algebra**:

$$c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*.$$

On the dual side, the dualized endofunctor `F_U^*` produces input which gets *consumed* by the algebra `c^*` to produce a current state. The `≤_k`-monotone primal orbit becomes a co-monotone dual orbit (decreasing as the primal increases).

This is one of the most striking dualizations: settling-as-coalgebra and dual-settling-as-algebra are formally interchangeable structures on opposite sides of Jung–Rivieccio duality.

## Quantifier adjoints under dualization

Both primal quantifier triples

$$\exists_f^k \dashv f^* \dashv \forall_f^k \qquad \text{and} \qquad \exists_f^t \dashv f^* \dashv \forall_f^t$$

dualize to **dual adjoint triples** on the Priestley side. Frobenius (for `∧_k` and `∧_t`) and Beck-Chevalley **carry across** the duality, because both bilattice orders correspond to **orthogonal directions** on the paired Priestley space (the underlying Priestley order direction and the swap-involution direction).

This is why the hyperdoctrinal structure survives dualization: the two orders give two adjoint systems, and the paired-Priestley structure carries both directions independently.

## Generator duals

Each of the four predicate-category generator classes has an explicit Priestley dual:

| Primal generator | Dual operation |
|---|---|
| **specialization** `f: q → p` (sub-support inclusion) | **inclusion of Priestley spectra** — `Spec(A_q) ↪ Spec(A_p)`; sub-support → full-support |
| **converse** `p^c → p` (swap of entity-pair) | **swap involution on Priestley pairs** — the `(s, o) ↔ (o, s)` algebraic swap becomes a swap on paired-Priestley points |
| **subject-projection** (`(s, o) ↦ (s, s)` diagonal collapse) | **diagonal-extension** — lifting a function on diagonal points to a rowwise function |
| **object-projection** (`(s, o) ↦ (o, o)` diagonal collapse) | **columnwise extension** — dually, broadcasting from the object-diagonal column |

The diagonal/columnwise extension structure on the dual side is what makes the projection generators correspond to natural Priestley constructions. The unary-projection-via-broadcasting structure is preserved across the duality; what changes is whose direction the broadcast happens in (row vs column).

## Why this lives at settling tier

A settlement lives at settling tier (it is what settling produces). Its full hyperdoctrinal dual is a settling-tier object — same level as `settlement-priestley-dual` (sibling), but lifted from the per-cell value to the whole hyperdoctrine structure.

The dual is where **cohomological invariants** of the settling become accessible: sheaves on the bitopological settling site of `E^*` carry the invariants the algebraic side `E` cannot see directly. This is exactly the kind of invariants the **aperiodic regime** is the natural home for — they exist precisely because the settling does not stabilize within countable ordinals, so no fixed-point argument extracts them.

## Position

`finite-settlement-algebra/hacking/library/dual-predication-hyperdoctrine/`. Settling tier.

## Derivation source

Adapted from `predication-categories/objects/dual-predication-hyperdoctrine.md`, preserved verbatim at `docs/dev/scraps/`.
