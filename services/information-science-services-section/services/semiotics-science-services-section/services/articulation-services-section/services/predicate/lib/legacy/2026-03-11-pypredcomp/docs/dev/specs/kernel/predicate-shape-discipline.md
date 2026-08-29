---
title: "Predicate-shape discipline"
description: "Normative shape discipline for PyPredComp payload terms, cell records, closure-rule inputs and outputs, projections, and future n-ary work."
kind: spec
status: normative
version: "0.1"
---

# Predicate-shape discipline

This document is the bridge between the predication-category source-of-truth and PyPredComp's engineering surfaces.
The required design artifact is not "binary mode."
It is a typed predicate-shape discipline: every payload term, emitted cell, closure-rule premise, closure-rule conclusion, event witness, and projection MUST preserve the declared shape of the predicate it uses.

## 1. Source-of-truth

The mathematical source-of-truth is:

- `theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md`: a predication cell is the oriented assertion-position `(s, p, o)`; subject and object are not interchangeable; the predicate coordinate is typed, not a label; diagonal cells `(s, p, s)` are structurally meaningful.
- `theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/n-ary-predication.md`: unary, binary, ternary, and higher-arity predication are all arity-indexed cases of `E^n`; the closure two-monad structure is independent of arity; what changes is fiber-algebra size and closure-shape combinatorics; variable-arity predication remains open.
- `theories/humanities/theories/math/morphisms/operation.md`: operation arity is the arity of an operation on a carrier.
  It MUST NOT be confused with the arity or shape of a predication cell.
- `operations/engineering/services/mash/docs/src/explanation/concepts/predicate-shapes.md`: the current engineering explanation of diagonal state flags, relational predicates, and event-record predicates.

PyPredComp inherits those commitments.
A payload or closure rule that forgets the object coordinate, uses sentinel objects, or treats timestamps as ordinary relation targets is not merely inconvenient; it has changed the cell's mathematical signature.

## 2. Shape vocabulary

Every predicate used by PyPredComp SHOULD have a declared shape before it is accepted by authoring, closure, federation, or projection surfaces.

| Shape | Mathematical form | Engineering form | Valid example | Invalid forms |
|---|---|---|---|---|
| `state-flag` | unary predicate embedded diagonally | `(s, P, s)` | `(task:foo, is-open, task:foo) = True` | `(task:foo, is-open, true)`, `(task:foo, is-open, _)`, `(task:foo, is-open, 2026-05-04T12:00:00Z)` |
| `relational` | binary oriented predication | `(s, P, o)` where `o` is a meaningful other entity | `(task:foo, depends-on, task:bar) = True` | using `depends-on` as a generic metadata label with no meaningful object axis |
| `event-record` | event witness predicate | `(s, P, timestamp-or-event-entity)` | `(task:foo, completed-at, 2026-05-04T12:00:00Z) = True` | using the timestamp object to replace `(task:foo, is-completed, task:foo)` |
| future `n-ary` | arity-indexed predication over `E^n` | not yet represented by the current `(s, p, o, v)` atom without an explicit encoding | a future ternary causal term | variable-arity predicates with no declared arity discipline |

State flags are unary propositions.
Their object slot MUST be the subject.
A state flag MUST NOT use `_`, `true`, `false`, `null`, the empty string, or a timestamp as its object.

Relational predicates are oriented binary predications.
Their object slot MUST name the other entity that the relation is about.
Reversing subject and object changes the assertion-position unless the predicate explicitly declares and implements a converse.

Event-record predicates witness a happening.
They MAY use a timestamp or reified event entity as the object, but only when the predicate is declared `event-record`.
Event records do not replace state flags.
A completed task may need both `(task:foo, is-completed, task:foo)` and `(task:foo, completed-at, 2026-05-04T12:00:00Z)`.

Future `n-ary` shapes are theory-backed, but not implemented here.
Until an n-ary encoding is specified, PyPredComp MUST NOT pretend that arbitrary JSON payload arrays are lawful higher-arity predications.
Variable-arity predication remains open upstream.

## 3. Current PyPredComp state

The filesystem cell atom schema is already general enough for binary cells.
`specs/filesystem/cell-record.md` stores canonical cell atoms as `(s, p, o, v)` with stratum, ord, witnesses, sender, and provenance.

Current `respond` payload emission is narrower than the cell atom schema.
`respond` Phase 2 converts payload-derived predicates into unary-diagonal cells with `s = o = target`.
That is the v0.2 payload-emission behavior, not a theorem that all payloads must remain unary forever.

Current binary-cell emission is a bounded sibling primitive, documented in `binary-cell-emission.md`, especially for inter-session messaging.
It shares storage and audit discipline with `respond`, but does not run sigma/Delta closure in v0.2.
That is an engineering limitation and release decision, not a mathematical exception and not a permanent claim that binary cells are closure-free.

## 4. Payload terms

Future payload work MUST answer shape questions before adding new runtime emission paths.

A payload term MUST declare, or be resolved through a predicate registry to, at least:

- `shape`: one of `state-flag`, `relational`, `event-record`, or a future n-ary shape identifier.
- `p`: predicate slug.
- `o` or witness coordinates where the shape requires them.
- `v`: bilattice value or value-like input that canonicalizes to the bilattice value domain.
- authorization scope: which sender capabilities may assert, retract, or derive this shape.

The legacy payload object `{predicate: value}` is interpreted as state-flag shorthand only when the predicate registry declares `predicate` as `state-flag`; it expands to `(target, predicate, target, value)`.
It MUST NOT silently emit relational or event-record cells.

A future typed payload language MAY use a shape-explicit form such as:

```jsonc
{
  "terms": [
    {"shape": "state-flag", "p": "is-open", "v": "True"},
    {"shape": "relational", "p": "depends-on", "o": "task:bar", "v": "True"},
    {"shape": "event-record", "p": "completed-at", "o": "2026-05-04T12:00:00Z", "v": "True"}
  ]
}
```

The exact wire shape is open.
The requirement is not this JSON spelling; the requirement is that payload terms carry predicate shape before settlement.

## 5. Closure-rule shape signatures

Closure rules that consume or emit cells MUST declare shape signatures for their premise and conclusion templates.

A premise signature specifies which coordinate variables are meaningful for each predicate.
For example, a state-flag premise over `is-open` binds the subject and requires `o = s`; a relational premise over `depends-on` binds both source task and dependency task; an event-record premise over `completed-at` binds the subject and the event witness.

A conclusion signature specifies the emitted cell's shape.
A closure rule with a binary output is valid only when it declares the output predicate as relational, provides a meaningful object coordinate, and records the normal witness fields.

For saturated or settled output cells:

- `derived_from` MUST contain the premise cell ids in deterministic emission order.
- `derived_via` MUST name the closure rule or algebraic stabilization operator.
- The emitted `(s, p, o)` MUST satisfy the declared shape of `p`.
- Monotonicity in the bilattice knowledge order MUST be checked at the exact assertion-position `(s, p, o)`.

Binary outputs are not forbidden.
They are underspecified in current runtime behavior.
Any implementation that adds closure rules with binary outputs MUST first specify shape signatures, witness rules, and derived-cell emission semantics.

## 6. Shape admission by stratum

A conforming implementation MUST distinguish three questions:

1. Which shapes may be accepted as asserted cells?
2. Which shapes may enter sigma/Delta closure?
3. Which shapes may be emitted as saturated or settled cells?

The current v0.2 answer is conservative: `respond` asserts unary-diagonal payload cells; the sibling inter-session primitive asserts bounded binary cells; binary cells do not enter sigma/Delta closure.
The future answer MAY be broader, but it MUST be shape-declared rather than mode-switched by informal unary/binary tests.

## 7. Projections and fiber snapshots

Fiber snapshots expose cell atoms through projection, not by replacing the atom schema.
A projection of binary cells MUST preserve the object axis.
A convenience index such as `{predicate: {object: value}}` is valid only when it agrees with the underlying cell atoms byte-identically.

When binary cells are projected into an entity view, documentation and tests MUST state whether the projection is anchored by subject, by object, or by a named traversal.
An inbox view, for example, is not a queue; it is a query over binary cells whose object axis names the recipient session.

Event-record predicates SHOULD be exposed as witnesses, not as replacements for state flags.
A projection may show `is-completed` and `completed-at` together, but they remain different cells with different shape signatures.

## 8. Authorization and capability restriction

Authorization is shape-sensitive.
A sender may be permitted to assert a state flag about one target without being permitted to assert arbitrary relational cells from that target to another entity.
A sender may be permitted to record event witnesses without being permitted to change the corresponding state flag.

Capability checks SHOULD be declared at the same level as predicate shape.
At minimum, a future registry or payload schema MUST be able to answer:

- Who may assert this shape for this predicate?
- Who may emit it through closure?
- Who may project it across subject-anchored or object-anchored views?
- Are timestamps or event entities admissible objects for this predicate?

## 9. Conformance plan

Future tests and validators MUST cover at least the following obligations.

- Reject state flags with timestamp objects.
- Reject sentinel objects such as `_`, `true`, `false`, `null`, or empty string for unary state flags.
- Require declared unary state flags to use `o = s`.
- Require declared relational predicates to use meaningful object slugs.
- Require event-record predicates to be declared as event-record shape before using timestamp objects.
- Verify two predicates compose only when their shape signatures align.
- Verify binary emitted cells replay byte-identically.
- Verify binary cells appear in the expected fiber projections.
- Verify closure rules with binary outputs produce valid `derived_from` and `derived_via`.
- Verify shape admission separately for asserted, saturated, and settled strata.
- Verify sender authorization and capability restrictions by shape, not only by predicate slug.

## 10. Open design questions

The missing v0.3+ design is not merely whether to add `binary_cells` to `respond`.
The prior question is whether PyPredComp adopts a typed predication-term payload language whose terms may be unary-diagonal, relational, event-record, or later n-ary, with shape declarations checked before settlement.

See `../../questions/typed-predication-term-payload.md` for the explicit decision fork.
