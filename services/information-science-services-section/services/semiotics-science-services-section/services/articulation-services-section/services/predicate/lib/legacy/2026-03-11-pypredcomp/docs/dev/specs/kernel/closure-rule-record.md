---
title: "Closure-rule record"
description: "Canonical format for a closure rule, which is itself a substrate entity."
kind: spec
status: normative
version: "0.1"
---


Closure rules are first-class substrate entities (per the agential-orchestration-platform's [self-representation](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/self-representation.md) commitment).
They are stored, addressed, hashed, and replayed by the same machinery as cell records.

## 1. Schema

A closure-rule record is a JSON object:

| Key | Type | Required | Meaning |
|---|---|---|---|
| `id` | string | yes | SHA-256 of canonical bytes without `id`. |
| `kind` | string | yes | Always `"rule"`. |
| `name` | string | yes | Human-readable slug. Lower-kebab-case. |
| `description` | string | no | One-line summary. |
| `premise` | array of patterns | yes | Cell-pattern conjunction the substrate must satisfy for the rule to fire. |
| `conclusion` | array of cell-templates | yes | Cells produced by the firing. |
| `bind` | object | no | Variable bindings introduced by the premise; consumed by the conclusion. |
| `priority` | integer | no | Tie-breaker among rules whose premises match in the same closure round. Default 0; lower fires first. |
| `fuel` | integer | no | Maximum invocations of this rule per `respond` call. Default unbounded. |
| `scope` | string | no | Optional scope-slug bounding which entities the rule applies to. |
| `provenance` | string | no | Authoring entity slug or peer node-id. |

Unknown top-level keys MUST be rejected with `PCC_UNKNOWN_FIELD`.

## 2. Cell pattern grammar

A premise pattern is a JSON object representing a cell with optional bind-variables:

```jsonc
{
  "s": "agent:planner",     // literal entity slug
  "p": "$predicate",        // bind variable (prefix $)
  "o": "$obj",              // bind variable
  "v": "True"               // literal value, or "$value" to bind
}
```

Bind variables match any value at that position; their bindings are unified across the premise's patterns.
A literal must match exactly.
Predicate slugs may use the wildcard `*` to match any predicate (no binding).

The `bind` block in a rule record is optional documentation listing the variables a premise introduces:

```json
"bind": {"$predicate": "predicate-slug", "$obj": "entity-slug"}
```

This is for tooling; the rule firer infers the bind set from the patterns.

## 3. Conclusion templates

Conclusions are cell templates that may reference bind variables:

```jsonc
{
  "s": "$obj",
  "p": "is-target-of",
  "o": "agent:planner",
  "v": "True"
}
```

Each premise unification produces one conclusion-bound-instance.
The rule firer constructs the corresponding cell record (computing its `id` per [canonicalization.md](canonicalization.md)) and appends it as a `cell` event in the same `respond` round.

## 4. Firing semantics

Per `respond` round:

1. Substrate state is the current fiber map.
2. For each rule in priority order: enumerate matches of `premise` against the current fiber map, in lexicographic order of bind-variable assignments.
3. For each match, build the `conclusion` cells and propose them.
4. Apply $\odot$-merge to the proposed cells against the substrate; record any monotonicity violations as repair-log entries (`PCC_MONOTONICITY_FAIL` is fatal; $\top$-promotion when affirmative-meets-denying is normal).
5. Iterate.
  The closure operator is bounded; a single `respond` round caps total firings at the rule's `fuel` (per-rule) or the engine default fuel (global).
  Exceeding fuel surfaces `PCR_FUEL_EXCEEDED` with the partial state preserved.

The bilattice algebra's bounded-settlement property guarantees termination at most 2 rounds per fiber for non-pathological inputs (see [respond.md](respond.md) and PredCat's settlement convergence).

## 5. Wire example

```json
{
  "bind": {"$task": "task entity"},
  "conclusion": [
    {"o": "agent:planner", "p": "needs-attention", "s": "$task", "v": "True"}
  ],
  "description": "Tasks marked open without an assigned owner attract the planner.",
  "fuel": 1000,
  "id": "1a2b3c…",
  "kind": "rule",
  "name": "unowned-tasks-attract-planner",
  "premise": [
    {"o": "task", "p": "is-a", "s": "$task", "v": "True"},
    {"o": "open", "p": "status", "s": "$task", "v": "True"},
    {"o": "*", "p": "owner", "s": "$task", "v": "None"}
  ],
  "priority": 10,
  "provenance": "personnel:emsenn"
}
```

The premise's third pattern uses `"v": "None"` literally to match cells whose value is $\bot$ — the rule fires on tasks that are open and have no owner.

## 6. Adding and retiring rules

A rule is added by appending a `rule-add` event whose payload is the rule record.
The rule's `id` and the event's `prev`/`ord` linkage are independent (the rule record's hash is over the rule itself, not the event).

A rule is retired by appending a `rule-retire` event with `rule_id`.
The rule record file remains in `$ROOT/rules/`; only its membership in the active rule set changes.
Retirement does not undo past firings; settled cells remain settled.

## 7. Rule conflict and contradiction

Two rules whose conclusions disagree at the same cell produce $\top$ at that cell — exactly the bilattice's $\top$ semantics.
This is not an error; the substrate honestly records that two rules said opposite things.
Downstream rules can act on $\top$ explicitly.

A rule whose conclusion is $\top$ is a valid rule (it asserts paraconsistent settlement); the firer accepts it.

## 8. Provenance and peer rules

In a federated deployment, peer nodes may contribute their own rules.
A `rule-add` event with a `peer` field on the event envelope (see [event-log.md](event-log.md)) is a peer-authored rule.
Local closure rules MAY filter rules by `provenance` or by event-`peer` to scope which authorities can fire which rules.
The default is permissive: any added rule fires.
