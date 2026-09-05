---
type: concept
class: structure
depends-on: [predication-fiber-algebra, parameter-base-category, knowledge-order, bilattice]
see-also: [stratified-predication-fiber, settling-associated-sheaf, predication-fibration]
---

# Presheaf-indexed fiber

A **presheaf-indexed fiber** is a [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$ packaged as a presheaf

$$ \mathcal{F} \;\colon\; \mathcal{C}^{\mathrm{op}} \;\longrightarrow\; \mathbf{Bilat} $$

on a small **context category** $\mathcal{C}$ whose objects are *projection contexts* $c$ and whose morphisms are *context restrictions* $f \colon c' \to c$.
Each restriction map is required to be a [bilattice homomorphism](../morphisms/bilattice-homomorphism.md) preserving knowledge-order joins (i.e. a $\vee_k$-semilattice map); the presheaf laws require $\mathcal{F}(\mathrm{id}_c) = \mathrm{id}_{\mathcal{F}(c)}$ and $\mathcal{F}(g \circ f) = \mathcal{F}(f) \circ \mathcal{F}(g)$.

The data of a presheaf-indexed fiber separates two roles that the bare $A_p$ conflates:

- The **value-domain** at each context, $\mathcal{F}(c) \le A_p$ — a sub-bilattice carrying the cell-atom values that the context $c$ is permitted to see.
- The **restriction discipline** between contexts, $\mathcal{F}(f) \colon \mathcal{F}(c) \to \mathcal{F}(c')$ — the projection morphism that hides cells $c$ exposes but $c'$ does not.

This is the structural carrier of "the same fiber, viewed from different contexts."
The math content is what makes context-indexed reads — by stratum, by peer, by session, by trajectory ordinal — *functorial* rather than ad-hoc filtering.

## The canonical context category for the predicated substrate

The substrate's canonical context category $\mathcal{C}_{\mathrm{sub}}$ has objects

$$ c \;=\; (\mathrm{stratum},\, \mathrm{peer},\, \mathrm{session},\, \mathrm{ord}) $$

drawn from the product

$$ \{0, 1, 2\} \;\times\; \mathrm{Peers} \;\times\; \mathrm{Sessions} \;\times\; \mathbb{N} $$

— stratum from the [stratified predication fiber](../objects/stratified-predication-fiber.md), peer and session from the substrate's federation and session structure, and ordinal from the [canonical firing trajectory](../theorems/canonical-firing-trajectory-via-lex-order.md).

Morphisms $f \colon c' \to c$ in $\mathcal{C}_{\mathrm{sub}}$ are coordinate-wise *narrowings*:

| Coordinate | Allowed narrowing | Reading |
|---|---|---|
| stratum | $s' \le s$, or $s'$ a downward-closed subset of $\{0, 1, 2\}$ | "view at stratum $s'$, having generated up through stratum $s$" |
| peer | $p' = p$ or $p' = \star$ (all peers) | "narrow attention to peer $p'$" |
| session | $\sigma' = \sigma$ or $\sigma' = \star$ | "narrow attention to session $\sigma'$" |
| ord | $\tau' \le \tau$ | "view as of trajectory ordinal $\tau'$" |

A morphism $f$ is the *intersection* of these per-coordinate narrowings.
The induced restriction $\mathcal{F}(f)$ on values is *atom-set restriction*: an atom $\alpha \in A^{\flat}_p$ survives $\mathcal{F}(f)$ iff every coordinate of $c'$ admits $\alpha$ — i.e. $\alpha$ was emitted at or below $\tau'$, by peer $p'$ (or by any peer if $p' = \star$), in session $\sigma'$ (or any session if $\sigma' = \star$), at a stratum the narrowing admits.

The category $\mathcal{C}_{\mathrm{sub}}$ is a *poset* (each object has at most one morphism to each other object): the four coordinate-wise narrowings compose by coordinate-wise composition, and the empty restriction is the identity.
The presheaf $\mathcal{F}$ on $\mathcal{C}_{\mathrm{sub}}$ is therefore a *monotone presheaf on a poset* — equivalently, a $\vee_k$-semilattice-valued sheaf on the Alexandrov topology of $\mathcal{C}_{\mathrm{sub}}$.

## Restriction is structural, not deletion

A restriction morphism $\mathcal{F}(f)$ is a *projection*, not a destructive filter: it forgets atoms outside the narrower context, but the unchosen atoms remain in the un-restricted fiber and re-appear under any context that admits them.
This is the structural difference between the presheaf-indexed fiber and a flat per-context cache:

- A *flat per-context cache* stores `(context, atoms)` pairs and looks them up by exact match.
  Two contexts whose admitted atom-sets overlap don't share storage; cache rebuilds for one context don't reuse the other's content.
- A *presheaf-indexed fiber* stores the *un-restricted* fiber and computes $\mathcal{F}(f)$ on demand or materialises it with byte-deterministic projection.
  The shared structure is the restriction laws; coherence between contexts is structural, not enforced.

The substrate's commitment is the latter: per [cache-coherence-via-functorial-projection](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md), per-context projection caches are content-addressed and *structurally* coherent because the projection is a presheaf morphism, not because invalidation is enforced.

## Naturality of merge with respect to projection

The fiber's [knowledge-join](../morphisms/knowledge-join.md) merge $\odot \colon A^{\flat}_p \times A^{\flat}_p \to A^{\flat}_p$ — the operation that combines two histories' atom sets — is a *natural transformation* of presheaves: for every restriction morphism $f \colon c' \to c$,

$$ \mathcal{F}(f) \circ \odot \;=\; \odot \circ (\mathcal{F}(f) \times \mathcal{F}(f)). $$

This is the [projection-merge naturality square](../theorems/projection-merge-naturality.md).
It is the structural reason cross-context merges (federation peer arrivals, session merges, multi-peer projections) commute with per-context reads: merging then projecting equals projecting then merging.

## Position

The presheaf-indexed fiber names the structure that the substrate's per-context read surfaces have rested on implicitly.
Three downstream entries depend on it:

- [knowledge-join](../morphisms/knowledge-join.md) — the merge $\odot$ is a natural transformation in this presheaf framework; without the framework, "natural" is rhetorical.
- [projection-merge-naturality](../theorems/projection-merge-naturality.md) — the naturality square is the assertion that $\odot$ is a presheaf morphism on $\mathcal{C}_{\mathrm{sub}}$.
- [cumulative-stratum-projection-naturality](../theorems/cumulative-stratum-projection-naturality.md) — the cumulative-stratum projection $\pi_{\le s}$ is one specific restriction morphism whose naturality is the substrate's `project_stratum_at_or_below` discipline.

Engineering-side, the presheaf-indexed fiber is the math object the substrate's $\$ROOT/fibers/<entity>/by-<coord>/<value>.json$ projection layout reflects on disk: every materialised projection file is a value $\mathcal{F}(c)$ at some context $c$, and the on-disk layout's invariants — coherence under federation merge, byte-determinism under cache rebuild, structural agreement between per-stratum and per-peer projections sharing a fiber — are the engineering surface of the presheaf laws.
