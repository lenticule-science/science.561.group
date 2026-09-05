---
title: "Log aggregation"
description: "Structured log search, filtering, retention. The substrate's event log is already structured; this spec adds the search/filter UI."
kind: spec
status: normative
version: "0.2"
---


The substrate's event log is already structured (canonical JSON, queryable by ord, kind, source, predicate).
This spec adds search/filter conveniences for admins.

Compared to traditional log aggregation (ELK, Loki, Grafana): the substrate's event log is the canonical store; we don't ship logs out, we provide tools to query them in place.

## Grounded in

- [`predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/audit-content-via-inconsistency-sheaf-cohomology.md) — search and saved-search queries (§1, §2) operate on the substrate's content; the event log is the canonical store of this content.
  Aggregating across peers (§5) is the cross-peer specialization of the same sheaf-cohomology query — disagreements surface as $\top$-cells in the inconsistency sheaf, not as silent merges.
- [`predicated-computing/theorems/cost-discipline-reads-free`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cost-discipline-reads-free.md) — log searches (§1) and saved-search invocations (§2) are reads; they contribute the cost quantale's unit and so do not consume the closure-fuel envelope.
  The performance discipline (§4) — large-log search must remain sub-second for narrow filters — depends on this: without reads-free, indexing would itself be costed and the filter cost composition would dominate.
  Per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md).
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Log search

The web GUI shell and TUI provide a log-search panel:

- Filter by ord range (`since`, `until`).
- Filter by `kind` (cell, settle, rule-add, federation-merge, signal, etc.).
- Filter by `peer` (local-only, specific peer, all peers).
- Filter by `source-session` (events from one session).
- Filter by `personnel` (events authored by one personnel).
- Free-text search over canonical bytes.

Implemented via `project` stdlib (per [stdlib/project.md](../stdlib/project.md)).

## 2. Saved searches

A saved search is a substrate cell:

```json
{"subject": "saved-search:driver-failures", "predicate": "kind", "object": "saved-search", "value": "True"}
{"subject": "saved-search:driver-failures", "predicate": "filter", "object": "kind=cell&predicate=anomaly:repeated-failures", "value": "True"}
{"subject": "saved-search:driver-failures", "predicate": "owned-by", "object": "personnel:emsenn", "value": "True"}
```

Captain can re-run with one click.

## 3. Retention

Per [decisions/event-log-is-jsonl.md](../../decisions/event-log-is-jsonl.md), the event log grows monotonically.
Retention strategies:

- **Keep all** (default; substrate is small enough that this works for years).
- **Snapshot + compact** (advanced; prune old events while preserving snapshots).
- **Tiered** (recent events fast-access; old events archived to cold storage).

Per-deployment policy:

```json
{"subject": "system", "predicate": "log-retention-policy", "object": "keep-all", "value": "True"}
{"subject": "system", "predicate": "snapshot-cadence", "object": "every-10000-ords", "value": "True"}
```

## 4. Search performance

For large event logs (>1M events), naive scan is slow.
The substrate maintains indexes:

- By ord (trivial; the file is ord-ordered).
- By kind (in-memory map).
- By peer.
- By source-session.

Custom indexes can be created for frequent queries; defined as substrate cells.

## 5. Cross-peer log search

Search across federated peers (subject to capability):

```sh
project events --since 12345 --kind anomaly --across-peers
```

Returns matching events from local + all peers' contributions.
Results include `peer` field for attribution.

## 6. Export

```sh
runbook export-log --since 12345 --until 67890 --format jsonl > /tmp/audit.jsonl
```

Produces a portable JSONL file.
Useful for compliance audits, debugging, sharing.

## 7. Conformance

Log aggregation passes:

1. Filter by ord/kind/peer returns expected results.
2. Saved search round-trips.
3. Retention policy honored.
4. Large-log performance acceptable (sub-second for narrow filters).
