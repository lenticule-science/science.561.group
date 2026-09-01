---
type: concept
class: interface
status: draft
depends-on: [hole, world-as-nucleus]
see-also: [portal-morphism, portal-jump, wood-between-worlds]
---

# Portal

A **portal** is the pairing of a [hole](hole.md) $P \hookrightarrow M$ in a [mediating nucleus](mediating-nucleus.md) $M$ with a [portal morphism](../morphisms/portal-morphism.md) $\phi : P \to W$ into a [world](../objects/world-as-nucleus.md) $W$.
Concretely a portal is a tuple

$$(P, \phi)$$

where $P \hookrightarrow M$ is a hole and $\phi : P \to W$ is a morphism in the ambient category whose value at any point of $P$ depends only on that point's behaviour at the hole's boundary $\partial P$ — the **boundary-determined portal** condition (axiom 3.6 of the source).

Portals are the points of contact between a mediator and the worlds it mediates.
In the [Wood Between the Worlds](../objects/wood-between-worlds.md), each pool $P_i$ of the Wood comes with a portal $\phi_i$ into the corresponding world $W_i$; the family of portals is what makes the Wood a candidate mediator at all.

## Boundary primacy

The defining condition — that $\phi(p)$ depends only on the germ of $p$ at $\partial P$ — captures the intuition that *what arrives in the destination world is fixed by what is happening at the hole's edge, not by what is happening deep inside the hole*.
This is what underwrites the [boundary primacy of traveller identity](../theorems/boundary-primacy-of-traveller-identity.md): a traveller crossing a portal arrives in the destination world determined by their boundary state at the moment of crossing.

## Cosmological reading

A portal is the formal object behind the informal multiverse-cosmology image of *a controlled connection between worlds*.
The framework does not predict that portals exist physically; it specifies what a portal would have to be, structurally, for it to make categorical sense.
Whether anything in observable cosmology realizes a portal — wormhole connections, brane intersections, Everettian branch-points read this way — is a separate empirical question.

## Provenance

Translated from §3.3 and §3.6 ("Boundary-Determined Portal") of [`wood-between-worlds.md`](../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
