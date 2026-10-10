---
title: "Projection naturality (project ∘ merge = merge ∘ project)"
description: "Per-stratum projection materialisation commutes with knowledge-join merge across the substrate's history. The presheaf indexed by (stratum, peer, session, ord) is functorial; cache coherence is structural rather than invalidation-driven."
kind: spec
status: normative
version: "0.2"
---

# Projection naturality

The substrate stores its fibers as a presheaf indexed by `(stratum, peer, session, ord)` ([filesystem/presheaf-storage.md](../filesystem/presheaf-storage.md) §4.2).
Materialised reads at a context `(c)` are projections $\pi_c$ of that presheaf.
Mutations are knowledge-join merges $\mu = \odot$ ([algebra.md](../filesystem/algebra.md), [stratified-facts.md](stratified-facts.md) §1).

This spec records the **naturality square** the substrate must honour:

$$ \pi_c \circ \mu \;=\; \mu \circ \pi_c. $$

In words: projecting after merging gives the same result as projecting both sides and merging the projections.
In particular, the three by-stratum disk projections under `$ROOT/fibers/<entity>/by-stratum/{asserted,saturated,settled}.json` are *recomputable from history*; the on-disk cache is byte-equal to a fresh recompute (per [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md)).

## Grounded in

- [`predication-categories/concepts/presheaf-indexed-fiber`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/presheaf-indexed-fiber.md) — fibers as presheaves $\mathcal{F} \colon \mathcal{C}^{\mathrm{op}} \to \mathbf{Bilat}$; projections are restriction maps $\mathcal{F}(f)$ for $f$ in $\mathcal{C}$.
- [`predication-categories/morphisms/knowledge-join`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/knowledge-join.md) — the $\odot$ morphism is a natural transformation between presheaves; commutation with restriction is the naturality of $\odot$.
- [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — the engineering envelope: content-addressed projection caches are coherent without invalidation, because functorial projection commutes with merge.
- [`predicated-computing/theorems/hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — same projected content → same canonical bytes → same SHA-256 → same on-disk filename.

## 1. The naturality square

Let $H$ be an entity's full cell history (the chain of `FiberSnapshot.cells:[]` arrays accumulated across every respond round per [`projection.py`](../../../../src/substrate/projection.py) `_collect_history_cells`).
Let $\mu \colon (H_1, H_2) \mapsto H_1 \cdot H_2$ denote append-merge: concatenate the cell lists, sort by $(\mathrm{ord}, \mathrm{id})$, knowledge-join values per predicate.
Let $\pi_s$ denote `project_stratum(cells, stratum=s)`.

The square commutes:

$$ \begin{array}{ccc} H_1, H_2 & \xrightarrow{\mu} & H_1 \cdot H_2 \\ \downarrow{\pi_s, \pi_s} & & \downarrow{\pi_s} \\ \pi_s H_1, \pi_s H_2 & \xrightarrow{\mu} & \pi_s(H_1 \cdot H_2) \end{array} $$

Equivalently: `project(merge(H₁, H₂), s) = merge(project(H₁, s), project(H₂, s))`.

The square also commutes for `project_stratum_at_or_below` (the cumulative variant, [`projection.py`](../../../../src/substrate/projection.py) §`STRATUM_AT_OR_BELOW`); the visibility filter is a set-membership test on `stratum`, which is monotone over $\odot$.

## 2. Why it matters operationally

Three engineering consequences of naturality:

1. **Cache rebuilds are byte-deterministic.** Discarding the three by-stratum projection files and re-invoking `materialize_by_stratum_projections` MUST produce byte-identical bytes — no stale-cache bug class exists, because there is no invalidation step.
  ([`presheaf-storage.md`](../filesystem/presheaf-storage.md) §10 gate 4; [`projection.py`](../../../../src/substrate/projection.py) docstring §1–§4 enumeration.)
2. **Federation merges commute with stratum reads.** When a peer's cells arrive via `network/federation.py` `merge_peer_fiber`, the local `by-stratum/<s>.json` is the merge of the local projection and the peer's projection at the same stratum — projections do not have to be recomputed from a global history each time.
  (v0.4 federation will rely on this.)
3. **Per-peer / per-session projections are first-class.** [`presheaf-storage.md`](../filesystem/presheaf-storage.md) §4.2 promises `by-peer/peer:<peer-id>.json` and `by-session/<session-id>.json` projections (v0.2 task t02-114).
  Each is $\pi_{(\mathrm{stratum}, \mathrm{peer})}$ or $\pi_{(\mathrm{stratum}, \mathrm{session})}$ of the same presheaf; the conformance startup check `PCC_PROJECTION_DIVERGED` is exactly the naturality assertion at boot.

## 3. Conformance gates

A conforming implementation:

1. Materialises the three by-stratum projection files after every respond that touches an entity ([`presheaf-storage.md`](../filesystem/presheaf-storage.md) §10 gate 1).
2. Discarding the three files and re-invoking `materialize_by_stratum_projections` reproduces byte-identical bytes (`presheaf-storage.md` §10 gate 4).
3. Federation receive computes `local_projection ⊙ peer_projection` and the result equals `project(local_history ⊙ peer_history, s)` (the naturality square).
  Disagreement surfaces as `PCC_PROJECTION_DIVERGED`.
4. The `by-peer` and `by-session` projections (v0.2 task t02-114) honour the same square, with `peer:<peer-id>` and `<session-id>` as additional context coordinates.

## 4. Out of scope

- The wire format of `by-peer` and `by-session` projection files (covered by [`presheaf-storage.md`](../filesystem/presheaf-storage.md) §4.2).
- The federation handshake protocol that exchanges per-stratum projections (v0.4 [`network/federation-protocol.md`](../network/federation-protocol.md)).
- Multi-context simultaneous projection (e.g., `by-stratum-and-peer`); v0.2 materialises one context coordinate at a time.
  The naturality square composes, so multi-context projections are derivable when needed.
