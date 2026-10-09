---
name: replica-cover
description: "A two-element pairwise-Stone cover on the bitopological-settling-site corresponding to two replicas in a distributed settlement system. The cover's Čech nerve is a truncated simplicial object encoding the merge structure: U_1, U_2, U_1 ∩ U_2. The cohomological face of CRDT-style replica merging."
kind: site-cover
symbol: "{(q, τ, U_i) → (q, τ, U)}_{i ∈ {1, 2}}"
covers: "(q, τ, U) ∈ T*_site"
cover-shape: "two-element, pairwise-Stone"
cech-nerve: "U_1 ⊔ U_2 ⇇ U_1 ∩ U_2 (truncated at degree 1)"
depends-on: [bitopological-settling-site, distributed-settling-system, paired-priestley-space]
derives-from: docs/dev/scraps/replica-cover.md
title: replica-cover
---

# Replica cover

A **two-element pairwise-Stone cover** on the bitopological-settling-site corresponding to two replicas in a distributed-settlement system.

Fix `(q, τ, U) ∈ T*_site` with `U = U_1 ∪ U_2` a union of two pairwise-Stone clopens. The pair

$$\{\, (q, \tau, U_i) \to (q, \tau, U) \,\}_{i \in \{1, 2\}}$$

is a **replica cover** of `(q, τ, U)`.

## Čech nerve

The cover's Čech nerve is the simplicial object

$$U_1 \sqcup U_2 \;\leftleftarrows\; U_1 \cap U_2,$$

truncated at simplicial degree 1 — two-element covers contribute only the 0-simplices `U_1, U_2` and the 1-simplex `U_1 ∩ U_2`. Higher-degree simplices vanish because there are no triple intersections.

This truncated nerve is what cohomology Čech-computations sum over: a 0-cochain assigns sections at `U_1` and `U_2` separately; a 1-cochain measures the difference at `U_1 ∩ U_2`.

## Why "replica"

Under Jung–Rivieccio duality:

- A settlement state `v_i` on the **primal** side ↔ a clopen up-set `U_i = φ(v_i)` on the **dual** (paired Priestley) side.
- The knowledge-order merge `v_1 ∨_k v_2` ↔ the union `U_1 ∪ U_2`.

So each `U_i` is the **spectral image of a replica** — a single distributed-system node's accumulated evidence. The replica-cover assembles the two replicas as a topological cover of their merge.

This is the formal sense in which "replica cover" is the right name: each cover-piece corresponds to one replica's content; the cover-target corresponds to the merge.

## CRDT convergence

Local sections of a sheaf on `(q, τ, U_i)` represent **replica `i`'s view of the data**. Gluing two such sections to a section on `(q, τ, U)` is the **cohomological face of CRDT-merge**:

- 0-cochain: `(σ_1, σ_2)` — replica 1's section + replica 2's section.
- Coboundary: `σ_1|_{U_1 ∩ U_2} − σ_2|_{U_1 ∩ U_2}` — the disagreement on the intersection.
- Cocycle condition: the disagreement is zero (`σ_1 = σ_2` on `U_1 ∩ U_2`) — the two replicas agree on shared content.

When the cocycle condition holds, the replica-cover **glues** to a unique section on `U`, formalizing CRDT-convergence.

The **replica Mayer–Vietoris sequence** (archive theorem, not yet pulled) is the long exact sequence in cohomology for the replica cover. It precisely characterizes when two replicas' sections can be merged: in degree 0 (sections), the sequence's exactness encodes the merge-conditions.

## Why this is a settling-tier concept

Replica-covers operate on the bitopological-settling-site (settling-tier object) to compute cohomology of settlement-related sheaves. They're settling-tier infrastructure for the distributed-systems side of settlements.

The placement `finite-settlement-algebra/hacking/library/replica-cover/` records this.

## Position

`finite-settlement-algebra/hacking/library/replica-cover/`. Settling tier — distributed-system cover-pattern on the bitopological-settling-site.

## Derivation source

Adapted from `predication-categories/concepts/replica-cover.md`, preserved at `docs/dev/scraps/`. The CRDT-cohomology connection and the Mayer–Vietoris note are both directly stated in the archive scrap; this restatement keeps that content with structural cleanup.
