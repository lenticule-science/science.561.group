---
title: Predicated Computer
description: A computer whose primary substrate is the predication — data is (s, p, o) predication cells carrying bilattice values, and computation is settling (the addition, retraction, and traversal of cells to a fixed point). The substrate choice is ontological, not architectural. Placed under the hyperdoctrine by minimal proof support: it depends on the hyperdoctrine, the fibration, the fiber algebra, valuation, settling, the cell, and the closure machinery — all upstream here.
date-created: 2026-06-19
date-modified: 2026-06-19
tags: [predicated-computer, computer, predication-substrate, settling-as-computation, closure-rule-system, locale, wavefront, relational-identity, agent, system]
---

# Predicated Computer

> **⚠️ Disambiguation — this is NOT the 561 Group's theory of computing.**
> This node is the **predication SUBSTRATE** (computation = settling over `(s,p,o)` cells) — i.e.
> the kind of machine a computer *runs on*, derived from the settling/hyperdoctrine apparatus.
> The Group's **theory of computing** — what computation *is*, categorically — is a separate,
> far larger body of work whose resolved answer is **CGS** (concurrent games with symmetry), with
> the effective topos **`Eff ≃ Kl(!_CGS)`**. It lives in its own `computing/` node. Read it there:
>
> Base: `content/_archive/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/`
> - `questions/what-is-the-theory-of-computing.md` — the resolved answer (CGS; `Eff ≃ Kl(!_CGS)`; FOUR; Church–Turing & Rice as internal theorems). **Start here.**
> - `questions/what-are-the-subtheories-of-computing.md`
> - `code/structures/computing-structures.md` — the structures index (`pca` → `k1` → `eff` → `four` → `opca` → `dial-eff` → `cgs`)
> - `code/structures/cgs.md`, `code/structures/eff.md`, `code/structures/dial-eff.md`
> - `prose/learning/claims/` — `eff-is-minimum-level.md`, `f-dial-eff-to-cgs-exists.md`, `k1-is-initial-turing-complete-pca.md`, `opca-equivalent-to-reat.md`, …
> - `theories/` — `concurrent-computation/`, `computability/`, `linear-computation/`, `type-theory/`, `decidability/`

## What this node is, and why it sits here

A **predicated computer** is a computer whose primary substrate is the
[predication](../../../../../../predication-cell/predication-cell.md): data is
stored as $(s, p, o)$ predication cells carrying values in a bilattice
value-domain, and **computation is [settling](../../../settling.md)** — the
addition, retraction, and traversal of cells toward a fixed point. The substrate
choice is *ontological*, not architectural: it concerns what data primitively
*is* and what computation primitively *does*, not how a machine is built. A graph
database on a boolean computer is not a predicated computer; the addressing,
storage primitives, and operator semantics here all proceed in predication cells,
not memory cells.

It is placed at exactly this depth by **minimal proof support**. Its definition
`depends-on` the [predication-hyperdoctrine](../../predication-hyperdoctrine.md),
the predication-fibration and fiber algebra, the
[valuation](../../../../../valuation.md), [settling](../../../settling.md), the
[predication-cell](../../../../../../predication-cell/predication-cell.md), and
the closure-rule-system / closure-operator. The deepest node at which **all** of
those already exist is right here, beneath the hyperdoctrine — so this is the
lowest, and therefore correct, place the computer can be stated.

## What the substrate commits to

Three engineering invariants follow from the substrate being a fibered
predication-valuation:

- **The unit of storage is the predication cell, not the memory cell.** Storage
  holds $(s,p,o)$ triples valued in the fiber algebra at $p$; a cell is
  identified by its triple, not an address. There is no fetch-from-address.
- **The unit of operation is the relational primitive.** *Assert*, *retract*,
  *traverse from $e$ along $p$* — higher operators decompose into these or are not
  operators on the substrate. A query is a structured traversal; a write is the
  admission or retraction of a predication (or a monotone raise toward
  fixed-point in the knowledge order).
- **Identity is relational.** An entity is constituted by the predications it
  participates in — same incident-predication structure means same entity;
  persists when its predications persist; observed by traversal.

A complete sub-region (satisfying the seven closure conditions within its scope)
is a **locale** — a predicated computer at its scope; the whole is the locale of
itself. The substrate does *not* commit to a particular value-lattice $\mathbf L$
(Boolean $\mathbf 2$, four-valued $\mathbf{FOUR}=\mathbf 2^\bowtie$, larger
residuated lattices all admissible), operator vocabulary, storage realization, or
closure-rule fragment — those are degrees of freedom whose variation the
different **regimes** classify.

## What it grounds

The predicated computer is the corpus's bridge from the predication mathematics
to the **complex concepts the user names** — agent, system, computer. Each
*requires at least one settling and a richer fiber algebra*, which is exactly why
they belong here, deep under settling and the hyperdoctrine, rather than as
spine siblings.

The machinery those carriers waited on is **now on the spine** — the
[closure-2-monad](../../../closure-2-monad/closure-2-monad.md) as its own node, the
[dual predication hyperdoctrine](../dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md),
the Chu/Priestley/Jung–Rivieccio dualities, and the four-regime dichotomy — so each
specialization is now **cut as a real carrier subnode** by its own settling-signature,
the honest `local` proposition the cut requires:

- [system](content/system/system.md) — the multi-participant computer (CRDT/federated/
  concurrent-game-coupled settling); it generates the **agent**, and its beyond-CRDT
  [distributed-coordination](content/system/content/distributed-coordination) (consensus,
  locking, quorum) hangs beneath it;
- [database-computer](content/database-computer) — storage/query-dominant settling over the
  predication-graph store;
- [functional-runtime](content/functional-runtime) — the strict/finite regime: pure,
  terminating settling;
- [web-serving-computer](content/web-serving-computer) — request-response settling projected
  over the package-bin/eavt transport;
- [interactive-application](content/interactive-application) — settling-to-quiescence under
  interaction;
- [concept-computer](content/concept-computer) — concept-stabilization settling.

Each is a *kind of* predicated computer: `recognize_kind = recognize_predicated-computer ∧
local-settling-signature`. The former un-promoted `_archive/platform-research` fiber is now
spent into these codomains.

## Orientation

The closure machinery is the one [settling](../../../settling.md) iterates; the
fibration/quantifier structure is the
[predication-hyperdoctrine](../../predication-hyperdoctrine.md) above; the storage
unit is the [predication-cell](../../../../../../predication-cell/predication-cell.md).
The predicated-computing corpus develops this object's parts (substrate, locale,
work, closure-rule-system, agent) — each re-paths into this subtree by its own
concept.
