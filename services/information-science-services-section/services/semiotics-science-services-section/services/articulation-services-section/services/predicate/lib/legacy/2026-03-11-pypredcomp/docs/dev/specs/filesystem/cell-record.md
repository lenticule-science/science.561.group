---
title: "Cell record"
description: "Canonical PyPredComp predication-cell record format on the wire and on disk, with predicate-shape obligations."
kind: spec
status: normative
version: "0.2"
---

# Cell record

A **cell record** is the canonical PyPredComp wire form of a single predication cell at one event-ordinal moment.
Every state change in the substrate is expressed as one or more cell records embedded in event bodies in [`events.jsonl`](event-log.md).

The canonical atom schema is already general enough for unary-diagonal, relational/binary, event-record, and future arity-indexed work that lowers into `(s, p, o, v)` atoms.
Generality of the atom schema does not remove the need for predicate-shape declarations.
A cell can be structurally representable and still be unlawful if its predicate shape, object coordinate, stratum, witness fields, projection rule, or capability gate is invalid.

See [`../kernel/predicate-shape-discipline.md`](../kernel/predicate-shape-discipline.md) for the governing PyPredComp shape discipline.

## Cell atom and fiber snapshot

The substrate distinguishes between two related but structurally distinct objects:

- **Cell atom** — the normative wire form.
  A single `(s, p, o, v)` predication carrying `stratum`, `ord`, and, where applicable, `derived_from` / `derived_via` witness fields.
  Cell atoms live inside event bodies in `events.jsonl`.
  They MAY also be materialized as per-cell files at `$ROOT/cells/<pp>/<id>.json`.
- **Fiber snapshot** — the materialized projection of the presheaf at a specific context point.
  A snapshot bundles selected cell atoms in one `(entity, stratum, peer, session)` projection.
  Snapshots are caches; the source of truth is the cell atoms in the event log.

Operations that touch per-predication semantics — stratum tagging, witness chains, federation merge, retraction, sigma/Delta pass derivations, and shape validation — operate on cell atoms.
Operations that touch per-entity-view semantics — `get_fiber(entity)` reads, fiber-cache writes, and traversal under an anchor — operate on fiber snapshots.

## Unary predicates use diagonal objects

PyPredComp MUST NOT encode unary predicates by omitting `o` or by using sentinel objects such as `_`, `true`, `false`, `null`, or the empty string.

A unary state predicate is represented diagonally: `s = o`.
For example, a state flag saying `task:foo` is open lowers as `(task:foo, is-open, task:foo, True)`.

This diagonal representation is not a temporary hack.
It is the lawful embedding of a unary/state predicate into the cell atom schema.
Relational predicates and event-record predicates differ because their object coordinate is load-bearing.

## Predicate-shape obligations

Before a payload term, closure conclusion, federation record, or sibling primitive emits a cell atom, PyPredComp MUST know the term's predicate shape.

| Shape | Lawful object coordinate | Notes |
|---|---|---|
| `state-flag` | `o = s` | Unary predicate embedded diagonally. |
| `relational` | meaningful other entity | Binary oriented predication. Subject and object are not interchangeable. |
| `event-record` | timestamp or event entity | Witness coordinate. Does not replace a state flag. |
| future `n-ary` | explicit arity-indexed encoding | Ordinary `(s,p,o,v)` atoms alone do not express arbitrary variable arity. |

A completed task may need both a state flag and an event record: `(task:foo, is-completed, task:foo, True)` and `(task:foo, completed-at, 2026-05-04T12:00:00Z, True)`.
The timestamp is lawful only under the event-record predicate; it is not a state-flag object.

## Cell atom schema

A cell record is a JSON object with the following keys:

| Key | Type | Required | Meaning |
|---|---|---|---|
| `id` | string | yes | Lowercase hex SHA-256 of canonical bytes, computed without `id`, then re-included. |
| `kind` | string | yes | Always `"cell"`. |
| `s` | string | yes | Subject entity slug. |
| `p` | string | yes | Predicate slug. |
| `o` | string | yes | Object entity slug, diagonal subject slug, timestamp witness, or event entity according to declared predicate shape. |
| `v` | string | yes | Bilattice value: `"None"`, `"True"`, `"False"`, or `"Both"`. |
| `ord` | integer | yes | Event ordinal at which this record entered the log. |
| `stratum` | string | yes | Derivation stratum: `"asserted"`, `"saturated"`, or `"settled"`. |
| `derived_from` | array of strings | conditional | Cell ids that justified this record's emission. Required for `"saturated"` and `"settled"`; MUST be omitted for `"asserted"`. |
| `derived_via` | string | conditional | Closure-rule id for `"saturated"` or algebraic operator for `"settled"`. Required when `derived_from` is present. |
| `sender` | string | no | Authoring entity slug; omitted means system-authored. |
| `provenance` | string | no | Optional content hash of an upstream record this one settles or derives from. |
| `wall_clock_at` | string | no | RFC 3339 timestamp recorded at append time; instrumentation only, never used in algebra. |

Unknown top-level keys MUST be rejected with `PCC_UNKNOWN_FIELD`.
A record at stratum `"saturated"` or `"settled"` lacking `derived_from` MUST be rejected with `PCC_MISSING_WITNESS`.
A record with an unknown `stratum` value MUST be rejected with `PCC_UNKNOWN_STRATUM`.

## Stratum and witness

The stratum tag and witness fields are part of the canonical bytes.
The same `(s, p, o, v)` at different strata or with different witness chains produces a different SHA-256 id.

- `asserted` cells MUST omit `derived_from` and `derived_via`.
- `saturated` cells MUST include `derived_from` and `derived_via` naming the closure rule that emitted them.
- `settled` cells MUST include `derived_from` and `derived_via` naming the settling operator.

These rules apply to every shape.
Binary or event-record cells emitted by future closure rules are not exempt.
If a closure rule emits a relational cell, that rule must declare premise and conclusion shape signatures and the derived cell must carry valid witnesses.

## Fiber snapshot schema

A **fiber snapshot** is the materialization of one presheaf projection at one event-ordinal cursor.
It bundles cell atoms selected by a declared projection rule and indexes them for fast reads.

| Key | Type | Required | Meaning |
|---|---|---|---|
| `entity` | string | yes | Anchor entity slug. |
| `stratum` | string | yes | Projection stratum: `"asserted"`, `"saturated"`, `"settled"`, or `"full"`. |
| `peer` | string | no | Peer projection, if any. |
| `session` | string | no | Session projection, if any. |
| `ord` | integer | yes | Event-ordinal cursor. |
| `cells` | array of cell-atom objects | yes | Cell atoms in projection order. |
| `predicates` | object | no | Convenience index computed from `cells`; contents MUST agree with `cells` byte-identically. |

Binary cells require explicit projection rules.
A subject-anchored projection and an object-relevant projection may expose different views of the same atom.
Implementations MUST verify that expected binary cells appear in expected projections and that replay reconstructs those projections byte-identically.

## Canonical form and value discipline

Object keys are lexicographically sorted per [`canonicalization.md`](../kernel/canonicalization.md).
The `id` field is computed from the canonical bytes of the record without `id`, then `id` is inserted, then the whole record is re-canonicalized.
Implementations verify on read that `SHA-256(canonical(record_without_id)) == record.id`; mismatch is `PCC_ID_MISMATCH`.

`v` is one of `"None"`, `"True"`, `"False"`, or `"Both"`.
Successive records with the same `(s, p, o)` MUST be monotone in the bilattice knowledge order.
A record violating monotonicity is rejected with `PCC_MONOTONICITY_FAIL` at log-append time.

## Relationship to event log

The event log is the source of truth.
Cell atoms live inside event bodies; fiber snapshots are derived caches written to `$ROOT/fibers/`.
Both snapshots and optional per-cell files can be discarded and rebuilt by replaying the event log.

The atom-and-snapshot split mirrors the distinction between a predication cell and a fiber.
PyPredComp stores atoms because operations need per-predication semantics; it materializes snapshots because reads need stable projected views.

## Cross-references

- [`../kernel/predicate-shape-discipline.md`](../kernel/predicate-shape-discipline.md) — predicate shape discipline for PyPredComp payloads, closure rules, and projections.
- [`../kernel/binary-cell-emission.md`](../kernel/binary-cell-emission.md) — bounded v0.2 sibling emission for binary cells.
- [`../kernel/respond.md`](../kernel/respond.md) — current unary-diagonal payload emission.
- [`../../questions/typed-predication-term-payload.md`](../../questions/typed-predication-term-payload.md) — v0.3+ typed payload-term fork.
