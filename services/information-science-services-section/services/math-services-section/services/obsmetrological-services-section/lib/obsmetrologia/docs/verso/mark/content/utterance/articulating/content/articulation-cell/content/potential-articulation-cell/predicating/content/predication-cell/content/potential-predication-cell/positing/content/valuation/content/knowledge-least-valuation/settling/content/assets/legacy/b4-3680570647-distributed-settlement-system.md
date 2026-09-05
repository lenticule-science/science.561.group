---
name: distributed-settlement-system
description: "A finite family {v^(i)}_{i ∈ I} of settlements over the same base, each evolving independently via its own closure-driven settling. Replicas exchange state via the pointwise knowledge-order merge: (v^(i) ∨_k v^(j))_τ(p)(s, o). The CRDT-style monotone-semilattice model for distributed predication."
kind: system
symbol: "{v^(i)}_{i ∈ I}"
parameterized-by: "finite index set I (replica identifiers)"
shared-base: "(L, C, E, λ)"
merge-operation: "pointwise ∨_k across replicas"
realizes: [replica-cover]
depends-on: [settlement, closure-drivenness, knowledge-order, predication-fiber-algebra, replica-cover]
derives-from: docs/dev/scraps/distributed-settling-system.md
---

# Distributed settlement system

A **distributed settlement system** over `(L, C, E, λ)` is a finite family `{v^(i)}_{i ∈ I}` of settlements, each evolving independently via its own closure-driven settling. Replicas exchange state via the **merge operation** — the pointwise knowledge-order join of their valuations:

$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) \;:=\; v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o),$$

applied cellwise across the predication-fiber-algebras.

## Why this works as a distributed system

The substrate's `≤_k`-monotone-semilattice structure on settlements makes distributed merging **automatically convergent**:

- **Commutative**: `v^(i) ∨_k v^(j) = v^(j) ∨_k v^(i)`. Order of replica merging doesn't matter.
- **Associative**: `(v^(i) ∨_k v^(j)) ∨_k v^(k) = v^(i) ∨_k (v^(j) ∨_k v^(k))`. Grouping doesn't matter.
- **Idempotent**: `v ∨_k v = v`. Repeated merging is safe.

These are exactly the **CRDT (Conflict-free Replicated Data Type) state-based merge axioms**. The substrate's settlements form a state-based CRDT under `≤_k`-join.

Settling-monotonicity is the structural source: because settlement values only grow in `≤_k`, the merge `∨_k` can only add information, never destroy it.

## Convergence theorem

For a distributed settlement system `{v^(i)}_{i ∈ I}` where every pair of replicas eventually exchange and merge (the **gossip condition**), all replicas eventually converge to the same final state — the join `⋁_k v^(i)` of all replicas' accumulated content.

The convergence is **strong eventual consistency**: replicas may have different intermediate states, but once all updates have been gossiped, they reach the same final state regardless of message ordering or replica-failure history.

## The replica-cover connection

Each replica `v^(i)` corresponds (via Jung–Rivieccio duality) to a clopen up-set `U_i` in the paired-Priestley dual. The merge `∨_k` corresponds to the union `U_1 ∪ U_2`. The cohomological face of CRDT-merge is the **replica-cover** structure: `{U_i → U_1 ∪ U_2}` is a cover of the merged state, with Čech cohomology computing the consistency obstructions.

The replica-Mayer-Vietoris sequence (archive theorem, not yet pulled) precisely characterizes when two replicas' sections can be glued.

## Position

`finite-settlement-algebra/hacking/library/distributed-settlement-system/`. Settling tier — the CRDT-style distributed model for settlements. Lean module: `PredicationCategories.Homebrew.Settling.CRDT.DistributedSKPSystem`.

## Derivation source

Adapted from `predication-categories/objects/distributed-settling-system.md`, preserved at `docs/dev/scraps/`. Renamed per the four-object grammar.
