---
type: narrative
introduces: [jung-rivieccio-duality, priestley-space, paired-priestley-space, dual-predication-hyperdoctrine]
see-also: [dualized-closure-2-comonad, equivariant-settling-cohomology, internal-z2-gauge, jung-rivieccio-duality, predication-fiber-algebra, priestley-dualizability, priestley-route-significance]
---

# Priestley duality

The framework develops on two sides — *primal* (algebra, predication structure, settlings) and *dual* (topology, sheaves, cohomology) — connected by Priestley-style dualities. The dualization is what supplies the *site* on which sheaf cohomology lives: there is no natural sheaf-theoretic structure on the algebraic side, but there is one on the dual side, and the two are equivalent in the sense made precise by [Priestley dualizability](../../theorems/priestley-dualizability.md).

The dualization proceeds fiber-by-fiber. Each [predication fiber algebra](../../objects/predication-fiber-algebra.md) $A_q$, being a distributive bilattice, has a Priestley dual: a [paired Priestley space](../../objects/paired-priestley-space.md) $X_q$ — two [Priestley spaces](../../objects/priestley-space.md) related by a swap involution that encodes the bilattice negation. See [Jung–Rivieccio duality](../../theorems/jung-rivieccio-duality.md) for the underlying fiberwise statement: $\mathbf{DBiLat} \simeq \mathbf{PairedPriSp}^{\mathrm{op}}$.

The $\mathbb{Z}/2$-action on the paired Priestley space — the swap that exchanges the positive and negative components — is what licenses the [internal $\mathbb{Z}/2$-gauge](../../teaching/explanations/internal-z2-gauge.md) used downstream in [equivariant settling cohomology](../../theorems/equivariant-settling-cohomology.md). It is the same negation, viewed two ways: as an algebraic involution on the bilattice and as a topological swap on its Priestley dual.

Lifting from fibers to the whole framework: the four-generator predicate-category morphisms dualize to morphisms between paired Priestley spaces; the closure operator dualizes to a [colax-idempotent comonad](../../morphisms/dualized-closure-2-comonad.md) selecting closed subspaces; the settling dualizes to a transfinite system of dual spaces. The result is the [dual predication hyperdoctrine](../../objects/dual-predication-hyperdoctrine.md) — the geometric incarnation of predication categories' algebraic structure, and the natural site for the cohomology to live.

The Priestley route is structurally necessary, not merely convenient: see [Priestley route significance](priestley-route-significance.md) for why the cohomology has nowhere else to go.
