---
title: "Binary cell emission (s ≠ o)"
description: "How PyPredComp v0.2 binary cells are authored by bounded sibling primitives while the typed predicate-shape discipline remains the governing design target."
kind: spec
status: normative
version: "0.3"
---

# Binary cell emission

The PyPredComp cell atom schema admits both unary-diagonal cells (`s = o`) and relational/binary cells (`s != o`).
The distinction is not an invitation to add ad hoc "binary mode."
It is a predicate-shape question: each emitted cell must have a declared shape, target coordinate discipline, stratum admission rule, authorization rule, and projection rule.

In v0.2, `respond` emits payload-derived asserted cells as unary-diagonal cells: every payload predicate becomes one cell at `s = o = target`.
The inter-session messaging path writes binary EAVT envelope cells directly through `StorageLayout` and `EventLog` because current `respond` Phase 2 has no payload term form for `o != s`.

This sibling path is a bounded v0.2 engineering bridge.
It is not a mathematical exception, not a proof that binary cells are closure-free, and not the final PyPredComp payload language.
The governing specification is [`predicate-shape-discipline.md`](predicate-shape-discipline.md); the design fork is [`typed-predication-term-payload.md`](../../questions/typed-predication-term-payload.md).

## Grounded in

- [`cell-record.md`](../filesystem/cell-record.md) — the canonical cell atom schema is already `(s, p, o, v)` plus stratum, ordinal, witnesses, sender, and provenance.
- [`predicate-shape-discipline.md`](predicate-shape-discipline.md) — PyPredComp shape declarations for state flags, relational cells, event records, and future n-ary terms.
- [`respond.md`](respond.md) — current payload emission is unary-diagonal only.
- [`typed-predication-term-payload.md`](../../questions/typed-predication-term-payload.md) — the v0.3+ fork is typed payload terms, not merely adding a `binary_cells` field.
- [`single-respond-primitive.md`](../../decisions/single-respond-primitive.md) — the surface doctrine this bounded sibling path reconciles with.

## Why `respond` cannot author binary cells in v0.2

Current `respond` payload-to-cell emission has no object-coordinate term.
It receives a target entity and a map of predicate/value pairs.
That can lawfully lower state-like payload terms as diagonal cells `(target, P, target, v)`, but it cannot express a relational term `(target, P, other, v)` or an event-record term `(target, P, witness, v)` without adding a typed payload grammar.

Three options exist:

1. Extend `respond` with shape-specific fields such as `binary_cells` and `event_records`.
2. Keep bounded sibling primitives for binary authoring while documenting them as bridges.
3. Adopt typed predication payload terms whose terms declare `shape`, `p`, optional object/witness coordinates, value, and authorization requirements.

Option 3 is the conceptual target.
Option 2 is the v0.2 bridge.
Option 1 may be a transitional wire spelling, but field names must not replace predicate-shape declarations.

## v0.2 sibling discipline

A conforming v0.2 binary-cell sibling path MUST:

1. use the same `StorageLayout` and `EventLog` as `respond`;
2. stamp `next_ord = event_log.height()` before append and verify ordinal coherence after append;
3. emit authored cells at `stratum = "asserted"`;
4. omit `derived_from` and `derived_via` for asserted cells;
5. run the path-specific capability gate before storage writes;
6. persist fiber projections so subject-anchored and object-relevant reads can find the cells without re-scanning arbitrary snapshots;
7. appear in the event log as typed events so replay reconstructs byte-identical cells and projections.

The current inter-session path satisfies this as a bounded envelope-cell use case.
It should not be generalized by copying the bypass.
New shape-bearing payload work should first add the shared shape-validating construction layer named in the refactor plan.

## Closure is a current limitation, not a theorem

The v0.2 sibling path does not run sigma/Delta closure on binary envelope cells.
That is a current implementation boundary.

Future PyPredComp closure rules MAY consume or emit relational/binary cells, event records, or later n-ary terms only if the closure rule declares explicit premise and conclusion shape signatures.
Any derived binary output MUST record `derived_from` and `derived_via` exactly like other saturated or settled cells.
A binary cell emitted at `stratum = "saturated"` or `stratum = "settled"` without valid witnesses is invalid.

Therefore implementations MUST NOT infer either of these false rules:

- all binary cells skip closure;
- all binary cells must be authored outside `respond`.

The lawful rule is narrower: v0.2 session-message binary envelope cells are asserted sibling emissions; future shape-declared terms require explicit admission rules.

## Fiber projections

Binary cells remain cell atoms.
Fiber snapshots are projections over those atoms, not a second source of truth.
A projection that exposes binary cells MUST specify its anchor and selection rule.
For example, an inbox view can be an object-relevant projection over cells whose predicate/object coordinate identifies the recipient.
Such a view is a query over cells, not a queue.

Projection conformance MUST verify that binary emitted cells appear in the expected fiber snapshots and that replay reconstructs the same snapshot contents byte-identically.

## Conformance gates

A conforming PyPredComp binary-emission implementation MUST verify:

- emitted binary cells replay byte-identically;
- emitted binary cells appear in expected fiber projections;
- asserted binary cells omit `derived_from` and `derived_via`;
- saturated or settled binary cells include valid `derived_from` and `derived_via`;
- closure rules with binary outputs declare premise and conclusion shape signatures;
- capabilities authorize the shape and predicate being emitted;
- timestamps are accepted only under event-record predicates, not as fake state-flag objects;
- no sentinel object is used to simulate unary predication.

## Cross-references

- [`respond.md`](respond.md) — current unary-diagonal emission and pointer to future typed terms.
- [`predicate-shape-discipline.md`](predicate-shape-discipline.md) — normative shape discipline.
- [`cell-record.md`](../filesystem/cell-record.md) — canonical `(s, p, o, v)` cell atom schema.
- [`inter-session-messaging.md`](../process/inter-session-messaging.md) — current bounded binary-cell authoring path.
- [`respond-binary-cell-mode.md`](../../questions/respond-binary-cell-mode.md) — older binary-mode question; now subordinate to typed terms.
- [`typed-predication-term-payload.md`](../../questions/typed-predication-term-payload.md) — real v0.3+ design fork.
