---
title: "Predicate-shape refactor plan"
description: "Implementation plan for refactoring PyPredComp toward lawful predicate-shape handling before further payload, closure, federation, or projection development."
kind: implementation-plan
status: open
---


This is a PyPredComp-local refactor plan.
It does not describe FARS, consume FARS frontmatter, or define any cross-project payload bridge.

The goal is to align PyPredComp's implementation with predication-category shape discipline before further development extends payloads, closure, federation, or projections.
The current codebase contains lawful pieces, but shape is still implicit in several places.
The refactor should make shape explicit at the construction boundary, not merely document that future callers should behave better.

## 1. Current implementation pressures

`respond` currently treats payload-derived cells as unary-diagonal cells.
That behavior is coherent for legacy state-flag payloads, but it is implicit rather than registry-mediated.

`process/session_messaging.py` currently writes relational envelope cells through a bounded sibling primitive.
That path is justified by v0.2 needs, but it constructs binary cells as a special-purpose path rather than through a shared shape-validating cell builder.

`closure-rule-record.md` currently documents cell-pattern premises and cell-template conclusions, but does not require premise and conclusion shape signatures.
That means a future closure rule could emit a cell whose `(s, p, o)` shape is not checked against the predicate's declared shape.

Projection code can expose cells by subject-anchored or object-anchored conventions, but those projection choices are not yet named as shape-sensitive surfaces.

## 2. Refactor sequence

### R1. Add a predicate-shape declaration surface

Create a PyPredComp-local registry or declaration module.
It should map predicate slugs to at least:

- shape: `state-flag`, `relational`, `event-record`, or future arity-indexed shape;
- admissible object type: subject-diagonal, entity slug, timestamp, event entity, or future tuple encoding;
- admitted strata: asserted, saturated, settled;
- closure participation: whether the predicate may appear in premise patterns, conclusion templates, or both;
- capability namespace or authorization requirement.

This registry must live in PyPredComp, not in FARS or a shared FARS/PyPredComp document.

### R2. Introduce a shared shape-validating cell builder

Add one internal construction path that receives a subject, predicate, object, value, stratum, and witness fields, then validates the tuple against the predicate-shape registry before producing the canonical cell body.

`respond` and `process.session_messaging` should both call this builder.
This refactor is not arbitrary deduplication; it removes the current split where unary and binary cells are made by different conventions.

### R3. Rebase legacy `respond` payloads onto typed terms

Keep the legacy `{predicate: value}` payload form only as a compatibility shorthand.
The lowering should be:

```text
{P: V} + target S
  => term(shape=state-flag, s=S, p=P, o=S, v=V)
```

That lowering is valid only when the registry declares `P` as `state-flag` or an explicitly compatible typed valuation.
It must not silently lower relational or event-record predicates.

### R4. Rebase session-message envelope emission onto the shared builder

The inter-session messaging path can remain a sibling primitive at the surface level, but its cell emission should go through the shared builder.
That gives binary envelope cells the same slug validation, shape validation, canonicalization, stratum, event-ordinal, and replay obligations as cells emitted by `respond`.

This preserves the v0.2 surface while removing the mathematical asymmetry inside the implementation.

### R5. Add closure-rule shape signatures

Extend rule records, or a companion registry, so every premise and conclusion template declares or resolves predicate shape.
A closure rule with a relational output is valid only when its conclusion binds a meaningful object coordinate.
A closure rule with an event-record output is valid only when its conclusion binds an admissible event witness.

Before this refactor lands, do not add new closure rules with relational or event-record outputs.

### R6. Make projections shape-aware

Name the projection mode for each read surface:

- subject-anchored projection: cells where `s = anchor`;
- object-anchored projection: cells where `o = anchor`;
- traversal projection: explicit graph-style walk over declared relational predicates.

Fiber snapshots and convenience indexes must preserve the object axis.
A `{predicate: value}` projection is not enough for relational predicates unless the object coordinate is already fixed by the projection contract.

### R7. Make authorization shape-aware

A sender capability for a state flag must not automatically authorize arbitrary relational or event-record emission under the same predicate namespace.
Capability checks should be performed after term lowering and shape validation, with access to `(shape, s, p, o, stratum)`.

## 3. Blocking rule

Before PyPredComp adds new payload schemas, closure outputs, federation wire terms, or projection modes, this refactor plan should be either implemented or explicitly split into smaller milestone tasks.
New behavior must not extend the current implicit shape split.

## 4. Conformance tests to add

- Legacy unary payloads lower to diagonal cells only for predicates declared as state flags.
- Legacy unary payloads reject relational predicates and event-record predicates.
- State-flag cells reject sentinel objects and timestamp objects.
- Relational cells require meaningful object slugs.
- Event-record cells require event-record predicate declarations before timestamp objects are accepted.
- `respond` and session-message emission both use the shared shape-validating builder.
- Binary envelope cells replay byte-identically after the builder refactor.
- Closure rules reject conclusion templates whose shape signature does not match the predicate declaration.
- Closure rules with relational outputs produce `derived_from` and `derived_via` in deterministic order.
- Subject-anchored and object-anchored projections expose relational cells without collapsing the object coordinate.
- Capability checks distinguish state-flag, relational, and event-record emission.

## 5. Non-goals

This plan does not require all binary cells to go through `respond`.
It requires all cell construction paths to share the same shape-validating core.

This plan does not require adding n-ary predication now.
It requires current code not to block a lawful future n-ary encoding by hard-coding unary/binary as the only conceptual shapes.
