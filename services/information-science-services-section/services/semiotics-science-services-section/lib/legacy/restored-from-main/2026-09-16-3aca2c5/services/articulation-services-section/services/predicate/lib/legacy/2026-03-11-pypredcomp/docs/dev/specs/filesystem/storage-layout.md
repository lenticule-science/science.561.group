---
title: "Storage layout"
description: "On-disk directory structure for the predicated-computing substrate."
kind: spec
status: normative
version: "0.1"
---


The substrate persists to a single **storage root** directory `$ROOT`.
All on-disk artifacts live within `$ROOT` or its subdirectories.

## Grounded in

- [`predicated-computing/theorems/hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — content-addressed cell paths (§3 — `$ROOT/cells/<pp>/<cell-id>.json` with `<cell-id>` = SHA-256 of canonical bytes) are hash-injective; same content → same path → same file.
  The replay-determinism property (§9) is structural: byte-identical event logs produce byte-identical cell-record sets because the path-to-content mapping is injective.
- [`predicated-computing/theorems/index-as-alexandrov-up-set`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/index-as-alexandrov-up-set.md) — the cell and rule indices implied by the directory structure (§3, §4) are Alexandrov up-sets on the fiber-algebra; the two-character prefix sharding is a coarsening that preserves the up-set structure.
  Index lookups are monotone in the partial order on cell-ids.
- [`predicated-computing/theorems/cache-coherence-via-functorial-projection`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cache-coherence-via-functorial-projection.md) — the fiber projections (§5 — `$ROOT/fibers/<entity-slug>/fiber.json`) are content-addressed by the underlying event log; cache invalidation is structural rather than imperative ("Deletion does not lose information: a node can rebuild any fiber by replaying the event log restricted to events naming that entity").
  Crash recovery (§11 step 3 — discard fibers, mark stale, rebuild on demand) is the cache-coherence theorem applied operationally.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Top-level structure

```
$ROOT/
  events.jsonl        — append-only event log (source of truth)
  cells/              — content-addressed cell records (indexed projection)
  rules/              — content-addressed closure-rule records
  fibers/             — materialized fiber projections (regenerable cache)
  evidence/           — closure-execution audit trails (optional profile)
  aliases/            — human-readable alias → cell-id mappings (optional profile)
  config.json         — node configuration: node-id, base-uri, peer list (see federation)
  signatures/         — record signatures keyed by content hash (federation profile)
```

Implementations MAY add auxiliary files in `$ROOT`, provided they do not conflict with these reserved paths.

## 2. Event log

`$ROOT/events.jsonl` is the source of truth.
See [event-log.md](event-log.md).
It is append-only; any operation that "edits" the substrate appends one or more events.
The materialized cells, rules, and fibers are deterministic projections of the log up to the current event ordinal.

## 3. Cell records

```
$ROOT/cells/<pp>/<cell-id>.json
  where  pp = cell-id[0:2]
```

- `<cell-id>` is the lowercase hex SHA-256 of the file's canonical bytes (also equal to the record's `id` field).
- Files are immutable.
  The substrate MUST NOT modify a cell-record file in place.
  State changes are new cell records with new ids; the old file remains.
- Two-character prefix sharding is the minimum; implementations MAY use longer prefixes if a deployment justifies it.
  The mapping from cell-id to path MUST be deterministic.

## 4. Closure-rule records

```
$ROOT/rules/<pp>/<rule-id>.json
  where  pp = rule-id[0:2]
```

Rule records are stored identically to cell records.
See [closure-rule-record.md](closure-rule-record.md).
Rules being substrate entities means they live alongside cells, addressed by the same scheme.

## 5. Fibers (materialized projection)

```
$ROOT/fibers/<entity-slug>/fiber.json     — sparse map, current settled fiber for an entity
$ROOT/fibers/<entity-slug>/history.jsonl  — optional: per-entity event subset for fast slicing
```

Fibers are caches.
Deletion does not lose information: a node can rebuild any fiber by replaying the event log restricted to events naming that entity.
Fiber files are not signed and not federated; only events are.

Entity-slug paths are URL-percent-encoded if the slug contains `/`.
The recommended convention uses `:` as the type/identity separator, which is path-safe.

## 6. Evidence (optional profile)

```
$ROOT/evidence/<exec-id>.json
```

If the evidence profile is enabled, every closure execution writes one evidence file containing the full hash-sequence audit trail.
See [evidence-vector.md](evidence-vector.md).
`<exec-id>` is the message id from the originating MCP request, treated as opaque.

## 7. Aliases (optional profile)

```
$ROOT/aliases/<alias-name>
```

A simple file containing exactly the cell-id (64 hex chars, no trailing newline).
Aliases are mutable — an alias can be re-pointed by overwriting the file — but the cells they point to are immutable.
See [alias-mapping.md](alias-mapping.md).

## 8. Atomicity

- Event log appends MUST be `O_APPEND`-style atomic writes, preferably with `fsync` at the end of a batch.
- Cell-record and rule-record file writes MUST be atomic via temp-file-and-rename: write `<id>.json.tmp` with canonical bytes, fsync, rename to `<id>.json`.
  A reader MUST NOT observe a partially written file.
- Fiber-cache writes MAY use the same temp-and-rename pattern; corruption-on-crash is recoverable by replaying the log.

## 9. Replay determinism

Given an `events.jsonl` file:

1. The set of cell records under `$ROOT/cells/` is *exactly* the set of distinct cell-ids appearing in the events.
2. The set of rule records under `$ROOT/rules/` is *exactly* the set of distinct rule-ids appearing in the events.
3. The fiber at any entity is the deterministic fold over the events restricted to that entity, applying $\odot$/$\Rightarrow$ in event-ordinal order.

Two nodes with byte-identical `events.jsonl` files MUST produce byte-identical contents in `cells/`, `rules/`, and `fibers/`.
Mismatch indicates a non-conforming implementation.

## 10. Path safety

- `cell-id`, `rule-id`, and `pp` are lowercase hex; they cannot contain path-traversal characters by construction.
- Alias names are restricted to the slug alphabet (lower-kebab-case, `:`, `/`); the substrate validates before forming a path.
- Implementations MUST validate identifier formats before constructing paths from them.
  `..
  `, `/`, leading-`-`, NUL bytes are rejected at the API boundary.

## 11. Crash recovery

On startup, the runtime (see [runtime-cycles.md](runtime-cycles.md)):

1. Validates `$ROOT/events.jsonl` parses and every event hashes consistently.
2. Spot-checks (configurable percentage) of cell-record and rule-record files to verify hash agreement; mismatches surface `PCC_CORRUPT_STORE`.
3. Discards fibers/, marks them stale, and rebuilds on demand.
4. Discards any `*.tmp` files left from interrupted writes.

Recovery is deterministic.
The agent does not write recovery scripts that "guess"; the event log is authoritative.
