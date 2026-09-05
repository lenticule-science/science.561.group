---
type: question
status: open
depends-on: [formal-context, conceptual-projection]
see-also: [scale-measure]
---

# What is the right scope discipline for FCA-shaped knowledge systems?

A formal context $\mathbb{K} = (G, M, I)$ is a single global view of the data. The FCA lineage admits two operations that *restrict* the view — conceptual projection (per [conceptual-projection](../morphisms/conceptual-projection.md)) restricts the attribute set, and the implicit operation of restricting the object set produces a sub-context. Neither is community-relative in the way the predicated framing's [scope](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/scope.md) discipline is community-relative.

The open question:

> What scope discipline does an FCA-shaped knowledge system need to handle multi-community data — data where different communities supply different attribute vocabularies, different incidence claims about overlapping object sets, and different acceptance of derived implications?

## What the question opens

Three sub-questions follow:

- **Sub-context federation.** Given two contexts $\mathbb{K}_1 = (G_1, M_1, I_1)$ and $\mathbb{K}_2 = (G_2, M_2, I_2)$ over partially-overlapping object and attribute sets with potentially-conflicting incidences, what is the right *combined* context? Apposition and subposition (per [apposition](../morphisms/apposition.md), [subposition](../morphisms/subposition.md)) cover the easy disjoint cases; the conflicting overlap case is unanalysed in the lineage.
- **Community-relative implications.** An attribute implication $B_1 \to B_2$ may hold in one community's context and not in another's. Should the combined system carry both implications with provenance, suppress conflicting implications, or supply an aggregation rule?
- **Multi-scale data.** Two communities may scale the same many-valued attribute differently (per [scale](teaching/explanations/scale.md)) — one ordinally, the other nominally. The two scaled contexts have incomparable concept lattices. What does the combined system look like?

## Why the question matters

FCA is the canonical Galois-closure substrate, and Galois closure is one of the substrate-level operations the predicated framing inherits. If the FCA framework cannot internally handle community-relative scope, then deploying FCA in multi-community settings (cross-discipline scientific data, cross-organisation enterprise data, cross-jurisdiction regulatory data) requires an external scope discipline supplied by a richer substrate.

The predicated framing's answer: scope is substrate primitive, and FCA-shaped subsystems inherit it from the predicated substrate's [scope discipline](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/scope.md). But this is the *predicated framing's* answer; the FCA lineage's own answer is open. A FCA-internal scope discipline would let the FCA tradition stand more independently of the predicated framing.

## What an answer would look like

A positive answer would supply: a definition of *scoped formal context* generalising the standard formal context; an extension of the basic theorem to scoped contexts; a discipline for cross-scope merge that handles conflicting incidences principally; a worked example of multi-community FCA on cross-scope data.

A theoretical answer might also clarify: whether the FCA-internal scope discipline reduces to the predicated framing's scope discipline (and is therefore not independent), or whether FCA admits a strictly weaker scope discipline that suffices for FCA-internal purposes.
