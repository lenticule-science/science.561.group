---
type: concept
class: substructure
status: draft
depends-on: [world-as-nucleus]
see-also: [portal, mediating-nucleus]
---

# Hole

A **hole** in a [nucleus](../objects/world-as-nucleus.md) $H$ is a monomorphism $j : U \hookrightarrow H$ satisfying:

- **(H1) Structural degeneration.** The quasicrystalline structure $\mathrm{QC}(U)$ is strictly less symmetric or lower-complexity than the restriction $\mathrm{QC}(H)|_U$.
- **(H2) Boundary factorization.** Every morphism $g : U \to X$ in the ambient category factors uniquely through a boundary object $\partial U$, written $$U \to \partial U \to X.$$

(H1) says a hole is a region where the host's structure has thinned.
(H2) says all "outgoing" relations from a hole are mediated by its boundary — nothing from inside a hole reaches an external object except via the hole's interface.

## Lemma: pullback stability

If $j : U \hookrightarrow H$ is a hole and $f : H' \to H$ is any morphism, then the pullback $U' = H' \times_H U \to H'$ is also a hole.

*Argument:* (H1) is preserved because the QC-structure cannot gain symmetry under pullback.
(H2) is preserved by stability of boundaries under pullback in the ambient category. ∎

## Cosmological reading

A hole is the formal object behind the informal multiverse-cosmology image of *a region of low structure inside a high-structure host*.
In the [Wood Between the Worlds](../objects/wood-between-worlds.md), holes are the *pools* in the Wood from which [portals](portal.md) reach into individual worlds; in a [world](../objects/world-as-nucleus.md), a hole could model a region whose internal structure has degenerated relative to the rest of the world (a black-hole interior is a candidate cosmological example, though the analogy is not built into the framework).

## Provenance

Translated from §2.4 ("Holes") and §2.5 ("Pullback Stability of Holes") of [`wood-between-worlds.md`](../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
