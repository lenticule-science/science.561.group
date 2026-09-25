---
type: theorem
status: sketch
class: cohomology-bound
depends-on: [embodied-handedness, witness-chain-record, equivariant-cohomology-decomposition]
see-also: [coordination-cohomologically-bounded-by-h1, predicated-drone-collective-fails-classical-stigmergy]
proof-target: subsequent-session
title: Coordination across handedness — asymmetric participants
description: The polity's coordination-cohomologically-bounded-by-h1 theorem (in the distributed-coordination-platform sub-theory) bounds coordination disagreement by the first cohomology group $H^1$ of the commitment graph.
---

# Coordination across handedness — asymmetric participants

The polity's [coordination-cohomologically-bounded-by-h1](../../../theories/distributed-coordination-platform/theorems/coordination-cohomologically-bounded-by-h1.md) theorem (in the distributed-coordination-platform sub-theory) bounds coordination disagreement by the first cohomology group $H^1$ of the commitment graph.
This sub-theory's analogue extends the bound to participants with **asymmetric handedness coordinates**: the cohomology bound differs because the commitment graph is not a symmetric peer graph but a directed bipartite-like structure with receive-mostly nodes and broadcast-periodic nodes.

## Statement

**Theorem (asymmetric coordination cohomology).** *Let $\mathcal{D}$ be a predicated drone collective with embodied-handedness coordinates as in [predicated-drone-collective-fails-classical-stigmergy](../../predicated-drone-collective-fails-classical-stigmergy/predicated-drone-collective-fails-classical-stigmergy.md).
Let $G_{\mathcal{D}}$ be the commitment graph: vertices are participants, edges are committed-to predications between participants, with edge weights drawn from the participant's send/receive handedness products.
Let $\mathcal{F}_v$ be the settling-associated sheaf on $G_{\mathcal{D}}$.
Then:*

1. *(Asymmetric-handedness $H^1$.)
  The first cohomology $H^1(G_{\mathcal{D}}, \mathcal{F}_v)$ decomposes per [equivariant-cohomology-decomposition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equivariant-cohomology-decomposition.md) into four $\widehat{K_4}$-isotypic sectors.
  The asymmetry contributes additional generators to $H^1_{\chi_\sim}$ (epistemic-frame disagreement sector): each handedness-asymmetric edge contributes one generator to that sector.*

2. *(Coordination-disagreement bound.)
  The polity's coordination disagreement under asymmetric handedness is bounded by:*

$$|\mathrm{disagree}(\mathcal{D})| \leq |H^1_\mathrm{id}| + |H^1_{\chi_\sim}| + |H^1_{\chi_-}| + |H^1_{\chi_{\sim\circ-}}|$$

*This is a strictly weaker bound than the symmetric-handedness $H^1$-only bound; the asymmetric contributions surface in $H^1_{\chi_\sim}$ as `frame-disagreement` cells that the substrate must resolve via frame-clarification operations.*

3. *(Verdier-dual cosheaf homology.)
  Per [verdier-duality-bitopological-site](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/verdier-duality-bitopological-site.md), the cohomology classes have dual cosheaf homology classes $H_1^\chi$.
  In the embodied setting, the cosheaf-side presentation is naturally per-event-firing on the local-generator side: each drone's per-event sensor-read or actuation-step contributes a cosheaf generator, and the cohomology bound's dual is a homology bound on the local-generator side.*

## Why this matters

The Pass-1 [witness-chain-record](../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/witness-chain-record.md) record carries a `k4-grading` predicate computing `(rank H¹_id, rank H¹_χ∼, rank H¹_χ−, rank H¹_χ∼∘−)` per the equivariant-cohomology-decomposition theorem.
This theorem fixes that the K₄-grading computation under asymmetric handedness must include the additional generators from handedness-asymmetric edges.
The Pass-3 implementation of the [accountability-projector](../../../../../../../../../../morphisms/accountability-projector.md) reads from this theorem to compute the K₄-grading correctly.

## Proof sketch

Part (1) follows from the [equivariant-cohomology-decomposition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equivariant-cohomology-decomposition.md) applied to the asymmetric commitment graph.
Each handedness-asymmetric edge between participants $i$ and $j$ contributes a generator to $H^1$ whose K₄-orbit type is determined by the edge's negation- and conflation-equivariance: handedness asymmetry breaks the symmetric-peer assumption that places generators uniformly in $H^1_{\chi_\sim}$ vs. $H^1_\mathrm{id}$.

Part (2) follows from the rank-counting of the four sectors and the standard cohomological bound on disagreement.
The strictly-weaker-bound claim is because the symmetric setting puts all asymmetric contributions in $H^1_\mathrm{id}$, which the certifiability-sectors closure rule does *not* refuse certification on — but in the asymmetric setting they shift into $H^1_{\chi_\sim}$, which is information-bearing but does not block certification either.
The bound is on disagreement *count*, not on certification refusal.

Part (3) is the Verdier dual: the cosheaf-homology bound is the dual presentation, used by the cosheaf-side reading of the witness-chain.
Both presentations are required per the audit-substrate-bootstrap project's question (a) resolution; the projector is the Verdier identification.

The full proof depends on the [coordination-cohomologically-bounded-by-h1](../../../theories/distributed-coordination-platform/theorems/coordination-cohomologically-bounded-by-h1.md) theorem in DCP and on the asymmetric-graph structure of the commitment graph for embodied participants. ∎-sketch

## Position

Resolves the Pass-1 deferral on `witness-chain-record`'s K₄-grading computation under asymmetric handedness.
The Pass-3 implementation of the [accountability-projector](../../../../../../../../../../morphisms/accountability-projector.md) reads from this theorem when the projected cobordism involves embodied participants.

## Open

- The exact algorithm for *detecting* handedness-asymmetric edges from event-log entries.
  Likely follows from the participant's `embodied-handedness` cell-shape declaration; needs the [embodied-handedness](../embodied-handedness.md) concept's algebraic specification.
- Whether the `frame-clarification` operation that resolves $H^1_{\chi_\sim}$ generators is itself a substrate-resident operator or a captain-side intervention.
  Likely former for routine cases (substrate frame-merge under bilattice meet); captain-side for cases where frame disagreement crosses charter-tier boundaries.
