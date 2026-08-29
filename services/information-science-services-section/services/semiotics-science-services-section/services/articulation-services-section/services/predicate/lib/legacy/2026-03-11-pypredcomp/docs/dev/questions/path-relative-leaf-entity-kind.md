---
kind: question
title: "Path-relative leaf-entity-kind: how is a substrate cell's leaf 'kind' projected onto its host-path leaf segment?"
slug: question:path-relative-leaf-entity-kind
status: open
opened-at-ord: 2026-05-04
owned-by-office: office:engineering
captain-input-required: true
blocks: [fixture:v0.2a-§4-leaf-entity-kind-projection]
---

# Question: path-relative leaf-entity-kind

## What is being asked

When a substrate cell's subject is a path-addressed leaf entity (e.g. a record under `operations/<polity>/<office>/personnel/<name>.md`), the leaf segment of the host path encodes — by convention — the entity's kind (here, `personnel`).
Two consequences depend on how the substrate handles this convention:

1. **Round-trip determinism**: if the leaf-segment-as-kind convention is *projected by the substrate* (the substrate reads the host path and emits a `(record:<X>, kind, <Y>) = t` cell automatically), then renaming a directory silently mutates the substrate's view of every record under it.
  The round-trip `cell → host-path → cell` is no longer the identity.

2. **Ship-target witness coverage**: v0.2a §4 has a fixture that asserts the leaf-entity-kind cell exists for every path-addressed record.
  The fixture's emission shape depends on which side (substrate or host) is canonical.

The captain question is which of three positions the substrate occupies relative to this projection.
The question blocks one v0.2a §4 fixture assertion (the leaf-entity-kind projection cell shape) and is gated on captain choice.

## Categorical positioning

The host-path → kind projection is structurally a **fiber projection** in the predication category sense: the host filesystem is a stratum (per [`predication-categories/objects/stratum`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/stratum.md)) and the path-leaf-as-kind reading is a fiber over the entity-kind axis.
The captain is choosing which side of the substrate↔host adjunction owns the fiber.

## Options

### Option K — Substrate-canonical: kind is a substrate cell; host path is a renderer-derived view

The substrate cell `(record:<X>, kind, <Y>) = t` is authored in the substrate as content.
The host path `<office>/<kind>/<name>.md` is *generated from* the cell by the host-projection driver (per [decisions/drivers-are-substrate-entities](../decisions/drivers-are-substrate-entities.md)).
Renaming a directory on the host is a witness-emitting drift event (substrate vs host disagree); the substrate's cell is the source of truth.

- **Substrate consequence.** Round-trip determinism is structural: cell → renderer → host path → re-read = cell, byte-identical.
  Drift detection is a substrate-checkable closure rule.
- **Ship-target witness shape.** v0.2a §4 fixture asserts the cell exists; absence is a `boot-failure`-class witness per [`_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md).
  The host-side check is a separate driver-fidelity witness on drift.
- **Back-out path.** Symmetric: switch to Option L by emitting the substrate cell from a host-side scan and then dropping the substrate-canonical assertion.

### Option L — Host-canonical: kind is read off the host path; substrate cell is a derived view

The substrate cell `(record:<X>, kind, <Y>) = t` is *derived* by the substrate's path-scanner from the host filesystem layout.
The host path is the source of truth; the substrate caches it as a cell for query convenience.

- **Substrate consequence.** Round-trip determinism is *not* structural: a host-side rename silently rewrites the cached cell on next scan.
  The substrate's view tracks the host without alarming.
- **Ship-target witness shape.** v0.2a §4 fixture asserts the path scan emits the expected cell shape; the absence/presence of the cell is a property of the scan, not the substrate.
  No drift witness — host edits are by definition canonical.
- **Back-out path.** Asymmetric: switching to Option K requires materialising existing host-derived cells as substrate-authored content, then writing a renderer for re-emission.

### Option M — Bilateral with witness on disagreement: both surfaces author independently; substrate emits a `kind-projection-disagreement` witness when they diverge

The substrate cell and the host-path projection are both authored independently.
The substrate runs a closure rule that asserts they agree; on disagreement, it emits a witness (`open` lifecycle state, captain-resolved per [`_patterns/witness-lifecycle.md`](../specs/_patterns/witness-lifecycle.md) §4).

- **Substrate consequence.** Maximum information preservation: the substrate records both sides and the disagreement is observable.
  Round-trip is *not* identity (deliberately) — divergence is the surface that captures captain attention.
- **Ship-target witness shape.** v0.2a §4 fixture asserts both the cell and the path-derived projection exist and agree (or, if they disagree, that the witness exists).
  New witness class `kind-projection-disagreement` to add to the witness-lifecycle pattern's §2 enumeration.
- **Back-out path.** Captain may collapse to K or L later by promoting one side to canonical (the disagreement-witness backlog records what was lost in the collapse).

## Recommendation

**K (substrate-canonical) for v0.2b authoring.** Rationale:

- It preserves round-trip determinism structurally (per [`deployment-determinism`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/deployment-determinism.md) and the round-4 §1.4 + round-5 t02-91 deployment-config-as-cell line; the discipline is the same).
- It composes with [decisions/self-representation-everywhere](../decisions/self-representation-everywhere.md) — the kind is content, not host-incidental.
- It composes with the round-5 t02-83 pattern-cross-citation-discipline (substrate-queryable graphs) and t02-91 deployment-config-as-cell (host-files-from-cells) into a single substrate-authoritative rendering line.
- Option M is correct in principle but adds a witness class and a closure rule to the v0.2b runtime envelope without a forcing v0.2b consumer; defer until a captain-observed real disagreement appears.
- Option L is the Western default (the filesystem is canonical) and silently loses round-trip determinism — refused.

If the captain disagrees with K, M is the next-best position; L is structurally inconsistent with the round-3+4+5 rendering-from-substrate line and is recommended against.

## Disposition

- **Default**: `defer-to-v0.2b` (the v0.2b host-projection driver authoring slice is the natural landing point per [t02-91](../tasks/engineering/t02-91-v0.2b-deployment-config-as-cell.md) + [t02-83](../tasks/engineering/t02-83-v0.2b-pattern-cross-citation-discipline.md); both compose with K).
- **Captain answer needed before**: v0.2a §4 fixture ships (the fixture's witness assertion shape depends on which option is chosen).
