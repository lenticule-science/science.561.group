# One adjunction, three faces

The bilattice's two orders, its modalities, and its (eventual) implication are not three separate
structures bolted together — they are **three faces of a single adjoint object**. Naming that object
is what lets you stop re-deriving the same relationship.

## Everything here is an adjunction

In modern terms, an adjunction `F ⊣ G` shows up three ways at once:

1. between two posets, an adjunction **is a Galois connection**;
2. every adjunction induces a **monad `GF` and comonad `FG`** — that's a `◇ ⊣ □` modal pair;
3. when `F = (− ⊗ b)`, its adjoint `G = (b ⊸ −)` is the **residual** (an internal implication).

So "two orders," "the modal pairs," and "implication" are the *same* phenomenon — adjunction — seen
from three sides.

## The object: `FOUR ≅ Chu(2,0)`

The value object is the four-element bilattice, and (Jakl 2025) `FOUR ≅ Chu(2,0)` — a Chu space, the
`*`-autonomous object that carries a monoidal-closed (tensor/residual) structure **and** a dualizing
involution at once. The three faces in this kernel:

| face | math | where in the code |
|---|---|---|
| **Galois orders** | `≤ₖ` and `≤_t`, σ-dual | the four value-ops; [σ-duality](knowledge-and-truth-are-sigma-dual.md) |
| **modal `◇ ⊣ □`** | possibility ⊣ necessity per order | `possibilize-*` / `necessitate-*`; iterated by the cones |
| **residual `⊗ ⊣ ⊸`** | twist-product fusion ⊣ implication = Chu `⊗ ⊣ ⊸` | *not yet built* — the implication morphism is named, not present |

The duality (negation) is `negate`/`conflate`; the orders are the Galois face; the cones are built
from the modal face. The residual face — an actual `⊸` implication on charges — is the one piece the
kernel doesn't yet realize.

## Why this matters in practice

Because the three faces are one object, you don't add "σ" and "residuation" as two features — they're
entangled by construction (the order-swap and the residual are two views of the same `*`-autonomous
duality). It's why the kernel parks them together, and why the **cones** (the modal/fixed-point face)
are deliberately kept separate from the **gauge** (the duality face): conflating the faces is exactly
what made the conflate-dual cone collapse.

## The three projections

The archive frames the downstream invariants as "three projections of one structure" — cohomology, the
hyperdoctrine, and the aperiodic spectrum — each a different reading of the one Chu matrix the settled
section lays out. They are computations *on* this object, deliberately downstream of the kernel
(`voidmath-cohomology`, etc.); the kernel provides the object, not the projections.

## See also

- explanation: [knowledge and truth are σ-dual](knowledge-and-truth-are-sigma-dual.md) · [the two cones and the void](the-two-cones-and-the-void.md)
- reference: [the four states](../references/the-four-states.md)
