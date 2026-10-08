---
name: crdt-convergence
kind: property
description: "The property of a distributed-settlement-system that every finite family of replicas admits a coordination-free merge: all finite Mayer-Vietoris gluing obstructions vanish. Equivalently, replica-cover-Čech-cohomology of the settling-associated-sheaf vanishes above degree 0. Realized by every distributed-settlement-system whose closure-rules are commutative-replicated up to settling-equivalence."
holds-on: "a distributed-settlement-system D = (replicas R_i, settling-rules S_i)_i"
equivalent-cohomological-form: "H^≥1(replica-cover, settling-associated-sheaf) = 0 for every replica cover"
proved-by:
  - crdt-convergence-via-mayer-vietoris (all four regimes)
  - crdt-convergence-via-cohomological-calm (strict + Scott-continuous via H^1 vanishing)
specializes-to:
  - crdt-convergence-with-per-observer-rules (when per-observer rule customization is allowed)
minted-from: theorem-context — invoked as the convergence target by crdt-convergence-via-mayer-vietoris, crdt-convergence-via-cohomological-calm, crdt-convergence-with-per-observer-rules, settling-calm-corollary, with no own archive scrap file. Reconstructed from the mayer-vietoris proof's "cohomological restatement" section.
title: crdt-convergence
---

# CRDT convergence

The **CRDT-style convergence property** of a distributed-settlement-system: every finite family of replicas admits a **coordination-free merge**, with all finite Mayer-Vietoris gluing obstructions vanishing.

## Statement

A distributed-settlement-system `D = (R_i, S_i)_i` exhibits **CRDT convergence** if, for every finite family of replicas and every replica cover `{R_i}_i`,

$$\check{H}^{n}(\{R_i\}_i,\; \mathcal{F}_v) \;=\; 0 \qquad \text{for } n \geq 1,$$

where `F_v` is the settling-associated-sheaf of the joint settling and the Čech cohomology is computed on the replica cover.

Cohomological vanishing in positive degree is the **sheaf-theoretic formulation of CRDT semantic convergence**: there are no obstructions to gluing per-replica states into a coherent global state, so the system converges to a deterministic final value regardless of merge ordering.

## Equivalent forms

The vanishing condition is equivalent to several substrate properties:

| Equivalent form | Why |
|---|---|
| Mayer-Vietoris δ⁰ = 0 for every two-replica cover | Direct degree-0 connecting homomorphism vanishes (replica-mayer-vietoris theorem). |
| Coordination-free merge | Two replicas can be merged without ever needing to coordinate, because their joint state assembles from the per-replica states with no compatibility constraint. |
| Commutative-replicated closure-rules | The closure-rules `S_i` commute pairwise modulo settling-equivalence — order of application doesn't matter. |
| Calm distributed-settlement-system | Per `settling-calm-corollary`, calm distributed-settlement-systems converge under CRDT-convergence in the knowledge order. |

These conditions are all equivalent in distributed-settlement-systems.

## Proof paths

Two independent proof paths establish CRDT-convergence for the substrate's distributed-settlement-systems:

**1. Mayer-Vietoris construction (all four regimes).** Per `crdt-convergence-via-mayer-vietoris`: the Mayer-Vietoris δ⁰ on settling-associated-sheaves is identically zero by explicit section-extension construction. The construction works in all four regimes (strict, Scott-continuous, transfinite-bounded, aperiodic) because the extension-by-zero operates on the underlying clopen set structure, which is regime-independent.

**2. Cohomological-CALM (strict and Scott-continuous regimes).** Per `crdt-convergence-via-cohomological-calm`: in regimes where `H^1 = 0` (strict and Scott-continuous, per `strict-regime-cohomology-vanishing` and `scott-continuous-regime-cohomology-vanishing`), the vanishing follows abstractly without explicit construction. This path is more conceptual but limited to those two regimes.

The two paths agree where they overlap (strict and Scott-continuous), with the Mayer-Vietoris path covering the remaining transfinite-bounded and aperiodic regimes.

## Substrate use cases

CRDT-convergence is a load-bearing property for the substrate's distributed-settlement-system tooling:

- **Replicated state machines**: any distributed-settlement-system whose closure-rules satisfy CRDT-convergence runs as a replicated state machine without requiring coordination protocols.
- **Federation**: federated substrate instances can merge their settlements without coordination if CRDT-convergence holds; the merge is associative-commutative-idempotent up to settling-equivalence.
- **Eventual consistency**: CRDT-convergence is the substrate's formal expression of eventual consistency, with the cohomological interpretation making the property checkable from the closure-rule structure.

## Position

`distributed-settlement-system/library/crdt-convergence/`. Settling tier — CRDT-convergence is a property of distributed-settlement-systems, so it lives at direct `library/` of the system object as a derived term (not admitted).

## Derivation source

**Minted from theorem context.** Referenced as the convergence target by `crdt-convergence-via-mayer-vietoris`, `crdt-convergence-via-cohomological-calm`, `crdt-convergence-with-per-observer-rules`, and `settling-calm-corollary`, with no own archive scrap. Reconstructed from the mayer-vietoris proof's "cohomological restatement" section that explicitly identifies the convergence with vanishing Čech cohomology on replica covers.
