---
type: morphism
class: portal
symbol: "\\phi : P \\to W"
status: draft
depends-on: [portal, hole, world-as-nucleus]
see-also: [portal-jump, boundary-primacy-of-traveller-identity]
---

# Portal morphism

A **portal morphism** is a morphism $\phi : P \to W$ in the ambient relational category $\mathsf{R}$ from a [hole](teaching/explanations/hole.md) $P$ in some host nucleus into a [world](../objects/world-as-nucleus.md) $W$, satisfying:

- **(PM1) Boundary determination.** For all $p, q \in P$ with identical germs at $\partial P$, $\phi(p) = \phi(q)$.

That is, the value of $\phi$ at any interior point of $P$ depends only on that point's behaviour at the hole's boundary.
This is what licences the cosmological reading of $\phi$ as *a controlled connection*: nothing about the deep interior of the hole reaches the destination world; only the boundary information does.

## What this morphism is doing

Portal morphisms are the inter-world moves of the framework.
They are the categorical correlate of the informal multiverse-cosmology image of *a way of getting from one place to another across worlds*, made precise by (PM1).
Two consequences follow immediately:

1. The portal morphism pre-composes with [hole](teaching/explanations/hole.md) inclusions, so a hole's outgoing data is already factored through its boundary; (PM1) is the additional condition that the *portal*-typed outgoing data behaves coherently with that factoring.
2. The traveller-jump construction [portal-jump](portal-jump.md) is exactly the pushforward $\phi_*$ of portal morphisms along a chosen [traveller fibration](../objects/traveller-fibration.md).

## Provenance

Translated from §3.3 (definition) and §3.6 (boundary-determination axiom) of [`wood-between-worlds.md`](../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relating/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md).
