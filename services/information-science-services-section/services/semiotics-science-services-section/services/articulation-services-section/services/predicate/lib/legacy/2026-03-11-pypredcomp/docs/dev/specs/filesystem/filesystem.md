---
title: "Filesystem"
description: "The OS's filesystem: cells-as-files. Content-addressed cells, event log, paths, alias mappings, mount points, snapshots."
kind: index
---


The "files" of this OS are predication cells.
Each cell is structured `(s, p, o, v)`, content-addressed by SHA-256, immutable, and stored in a JSONL append-only event log plus a content-addressed projection.

## Specs

### Records and storage

- [cell-record.md](cell-record.md) — canonical predication-cell record format.
- [event-log.md](event-log.md) — JSONL append-only event format.
  The substrate's spine; source of truth.
- [storage-layout.md](storage-layout.md) — `$ROOT/cells/`, `$ROOT/events.jsonl`, etc.
- [presheaf-storage.md](presheaf-storage.md) — fibers as a presheaf indexed by (entity, stratum, peer, session, ord); projection operators; on-disk layout for the per-stratum projections.

### Paths and resolution

- [alias-mapping.md](alias-mapping.md) — human-readable name → cell-id resolver.
- (v0.2+) `paths-and-resolution.md` — hierarchical path resolution from current-scope.
- (v0.2+) `mount-points.md` — closure rules that admit foreign cells under a local prefix.

### Permissions and snapshots

- (v0.2+) `capability-permissions.md` — who can read/write/retract a cell, enforced via $\Rightarrow$.
- (v0.2+) `snapshots.md` — `snapshot` events with verifiable hashes of materialized state.

### Content addressing

- (v0.1) `content-addressing.md` — SHA-256 discipline; addressing patterns; replication semantics.

## Theory grounding

The filesystem implements:

- `predicated-computing/objects/predication-graph-store` — the cell store as graph.
- `predicated-computing/concepts/identity-by-relations` — entities as participants in cells.
- `predicated-computing/concepts/schema-evolution` — non-breaking cell-shape changes.
- `flatfile-agentic-resource-system/concepts/flatfile` — directory-of-`.md`-files concretization.
- `flatfile-agentic-resource-system/concepts/frontmatter-as-presentation` — YAML frontmatter as fiber.
- `flatfile-agentic-resource-system/concepts/entity-as-model` — one file = one entity = stable slug.
- `database-platform/concepts/secondary-index`, `materialized-view`, `online-schema-change` — performance discipline.

## Conformance

The filesystem passes:

1. Two implementations producing byte-identical `events.jsonl` produce byte-identical materialized state.
2. A cell-record file's SHA-256 equals its filename stem.
3. Settling-monotonicity is enforced at log-append; violations rejected with `PCC_MONOTONICITY_FAIL`.
4. Replay determinism: replaying an event log produces byte-identical cell records and fiber caches.
5. Crash recovery: an interrupted append leaves no `*.tmp` files past startup; the log is consistent.

## Plan 9 / Unix analogue

| Unix concept | Filesystem analogue |
|---|---|
| File | Cell |
| Inode | Cell-id (SHA-256) |
| Directory | Predicate-fiber projection |
| Path | Alias mapping → cell-id |
| Mount | Closure rule admitting peer cells under prefix |
| Permissions (rwx) | Capability fiber via $\Rightarrow$ |
| Snapshot | `snapshot` event |

See [texts/unix-substrate-analogue.md](../../texts/unix-substrate-analogue.md) for the full mapping.
