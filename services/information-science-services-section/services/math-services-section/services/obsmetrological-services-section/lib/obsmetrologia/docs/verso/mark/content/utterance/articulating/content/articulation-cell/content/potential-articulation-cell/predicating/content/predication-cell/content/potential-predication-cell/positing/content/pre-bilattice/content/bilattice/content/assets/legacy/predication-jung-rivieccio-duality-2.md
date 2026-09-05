---
type: theorem
status: proved (cited as established result throughout the archive; no dedicated archive scrap)
minted-from: theorem-context — referenced by 5+ archive theorems and several objects with no own scrap; reconstructed from those references plus Rivieccio's published work
depends-on: [bilattice, paired-priestley-space, distributive-bilattice]
---

# Jung–Rivieccio duality

The category `DBiLat(L)` of **distributive bilattices over `L`** (with bilattice-homomorphisms preserving all five operations `∧_t, ∨_t, ∧_k, ∨_k, ~`) is contravariantly equivalent to the category `PairedPriSp` of **paired Priestley spaces**:

$$\mathbf{DBiLat}(\mathbf{L})^{\mathrm{op}} \;\simeq\; \mathbf{PairedPriSp}.$$

The equivalence sends:

- A distributive bilattice `B` to its **spectrum** `Spec(B)` — a paired Priestley space.
- A bilattice-homomorphism `B → B'` to a continuous order-preserving swap-preserving map `Spec(B') → Spec(B)` (note the contravariance).

## Why bilattice ↔ paired-Priestley

Bilattice negation `~` corresponds, on the spatial side, to the **swap involution** `σ` of the paired Priestley space. Under this correspondence:

- Truth-order `≤_t` ↔ underlying Priestley order on points.
- Knowledge-order `≤_k` ↔ the order obtained by composing with the swap.
- Bilattice meet/join in either order ↔ Priestley-space meet/join in the corresponding direction.

So the bilattice's two-order structure lifts to a Priestley structure with an order-reversing involution — exactly the paired-Priestley framework.

## Specialization at L = 2

For `L = 2`, `DBiLat(2)` contains `FOUR` as the canonical small object. Its paired-Priestley dual is the two-point space `{+, -}` with `σ: + ↔ -`. The correspondence:

| `FOUR` value | `Spec` subset of `{+, -}` |
|---|---|
| `⊥` (told nothing) | `{+, -}` (both points survive) |
| `t` (told positive) | `{+}` (negative point excluded) |
| `f` (told negative) | `{-}` (positive point excluded) |
| `⊤` (told both) | `∅` (both points excluded — contradiction) |

So FOUR's four values correspond exactly to the four subsets of the two-point dual space.

## Proof sketch

The proof follows from **two layers of classical Stone-type duality**:

1. **Priestley duality** for the underlying distributive lattice: `DLat^op ≃ PriSp`.
2. **Twist-product duality**: the twist-product structure of a bilattice `B ≅ L^⋈` corresponds to a paired structure on `Spec(L)`, with the swap involution implementing negation.

Combining, one gets `DBiLat^op ≃ PairedPriSp`. The detailed verification — that the twist-product structure on `B`'s carrier dualizes exactly to the paired-Priestley structure on `Spec(B)`, that bilattice-homomorphisms correspond to swap-preserving Priestley morphisms, and that the contravariant equivalence's unit and counit are natural isomorphisms — uses Rivieccio's published results on bilattice representation theory.

## Why this matters for the substrate

Jung–Rivieccio duality is **the structural foundation** for the substrate's algebra ↔ topology bridge:

- The substrate's algebraic side (predication-fiber-algebras, bilattice-valued cell values) is `DBiLat(L)`-valued.
- The substrate's topological side (paired-Priestley duals, sheaves on bitopological-settling-site) is `PairedPriSp`-valued.
- The two sides are **categorically equivalent** under this duality.

Every Priestley-side construction in the substrate (settlement-priestley-dual, dual-predication-hyperdoctrine, dualized-closure-2-comonad, settling-associated-sheaf on the bitopological-settling-site) is dualized from an algebraic-side construction via Jung–Rivieccio. Without this theorem, the topological side would be a separate development; with it, the two sides are unified.

## Position

`paired-priestley-space/docs/dev/theorems/jung-rivieccio-duality.md`. Settling tier — the foundational duality theorem at paired-Priestley-space, since paired-Priestley spaces are the topological side of the duality.

## Derivation source

**Minted from theorem context, not from a dedicated archive scrap.** Jung–Rivieccio duality is referenced as `[Jung-Rivieccio duality](../theorems/jung-rivieccio-duality.md)` in at least 5 archive theorems (closure-fixed-points-priestley-correspondence, predication-priestley-dual, dualized-closure-2-comonad, settling-associated-sheaf, dual-predication-hyperdoctrine, plus the `Jung-Rivieccio duality` mention in `bitopological-stone-duality`'s body) and in several object scraps. The theorem statement and proof sketch here are reconstructed from those references plus Rivieccio's published bilattice-representation results.
