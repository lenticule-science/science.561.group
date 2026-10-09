---
name: closure-rule-system
description: Closure rule system
type: definition
class: record
depends-on: [closure-rule-record, four-layer-rule-architecture, scope]
see-also: [settle, respond, apply-edit, dispatch]
title: closure-rule-system
---

# Closure rule system

The substrate-record carrying a *versioned, scope-bounded collection* of [`ClosureRuleRecord`](closure-rule-record.md)s: the substrate-resident object that operators ([`settle`](../transformers/settle.md), [`respond`](../transformers/respond.md), [`apply-edit`](../transformers/apply-edit.md), [`dispatch`](../morphisms/dispatch.md)) cite when invoking the substrate's algebra.
A `ClosureRuleSystem` is the answer to the question "which rules apply at this scope, at this version, with what coherence guarantees?"

A `ClosureRuleSystem` is itself a substrate entity.
Editing the rule system — adding a rule, removing a rule, changing a rule's severity, retiring a rule version — is editing a substrate entity, per [`apply-edit`](../transformers/apply-edit.md).
The rule system's history is in the event log; replaying the events reconstructs every past version.

A `ClosureRuleSystem` is the *spec-side* counterpart to the upstream gap noted earlier: AgOP and RC have [`closure-rule`](../../../../teaching/explanations/closure-rule.md) and [`closure-rule-record`](../../../../../objects/closure-rule-record.md) for individual rules, but no standalone object for the *system* — the versioned, scoped collection that operators cite.
FARS commits to this object at the realization scope; the upstream-promotion question is open.

## Required fields

Every conforming realization SHALL hold, for each `ClosureRuleSystem`:

- **`name`** — the rule system's canonical identifier (e.g., `fars-substrate-rules`, `dispatch-rules`, `learning-rules`).
  Used for citation in operator witnesses and event payloads.
- **`version`** — the rule system's content-hash version.
  Computed deterministically from the rules the system holds; two rule systems with the same `version` are byte-identical in their rule content.
  Operators that cite a `version` are committing to that version's behavior; subsequent edits to the rule system produce a new version.
- **`rules`** — the set of [`ClosureRuleRecord`](closure-rule-record.md) references at this version.
  Order is canonical (lexicographic by rule name) for determinism; the underlying set semantics is order-independent.
- **`scope`** — the predication pattern declaring where this rule system applies.
  May be substrate-wide (`scope: root`), department-bounded (`scope: engineering`), or context-bounded (`scope: federation-handshake`).
  Operators read the scope at invocation time and select the applicable rule system from the substrate's registry.
- **`predecessor`** — optional reference to the prior `ClosureRuleSystem` version.
  Forms a version chain that an auditor can traverse.
  The first version has `predecessor: null`.
- **`description`** — human-readable note.
  Provenance only.
- **`coherence-properties`** — the rule system's declared algebraic properties: which combinations of rules are *known* to produce $\top$-free settlement (per a substrate-level theorem), which combinations are not.
  Used by the realization's stepping map to short-circuit settlement when the rule combination is known-coherent.

## Invariants

- **Substrate entity.** A `ClosureRuleSystem` SHALL be a substrate entity, addressable like any other entity.
- **Version-immutable.** Once a `ClosureRuleSystem` version is in the substrate (one or more witnesses cite it), the version SHALL NOT be edited.
  Rule changes produce a new version; the old version remains for replay.
- **Content-hashed.** The `version` is the content hash of the rule set under canonical-form serialization.
  Two rule systems whose `rules` sets are equal under canonical form SHALL hash to the same `version`; rule systems with different content SHALL have different hashes.
- **Scope-bounded.** A `ClosureRuleSystem` declares its `scope`.
  Operators SHALL load the rule system applicable at their invocation scope; rules from a non-applicable scope SHALL NOT be applied.
- **Citable.** Every operator invocation that uses a rule system SHALL cite its `version` in the operator's witness.
  Replay verifies the cited version produces the recorded output.
- **Composable.** Two rule systems applicable at overlapping scopes compose: their `rules` sets union, with conflicts (two rules with the same name but different content) producing $\top$ in the composed system.
  The substrate's repair catalog has admissible recipes for resolving such conflicts.

## Selection at invocation

When an operator (`settle`, `respond`, `apply-edit`, `dispatch`) is invoked, it SHALL determine the active rule system by:

1. Looking at the invocation's *scope* (the substrate region the operator is acting on).
2. Reading the substrate's rule-system registry — the set of `ClosureRuleSystem` entities whose `scope` patterns match the invocation's scope.
3. Composing the matching rule systems' `rules` sets per the composition discipline above.
4. Pinning the composed `version` (a content hash of the composed rules) and citing it in the operator's witness.

A realization that pre-computes scope-to-rule-system mappings (for performance) SHALL re-derive the mapping when any matching `ClosureRuleSystem` changes; the mapping is a derived view, not authoritative.

## What a `ClosureRuleSystem` is not

- **Not a versioned codebase.** The rule system's versioning is content-hashing of substrate entities, not git-style commit hashing.
  A rule system version has no "branches" or "merges" in the version-control sense; concurrent versions across federated substrates merge via the substrate's value-domain $\vee_k$, not via three-way merge.
- **Not a registry of all rules.** The substrate has many `ClosureRuleSystem`s, each scope-bounded.
  There is no single global rule registry; the registry is the set of `ClosureRuleSystem` entities, and operators select the applicable subset by scope.
- **Not a runtime configuration.** A rule system change is a substrate edit producing an event; it is not a runtime configuration reload.
  Operators that ran against an older version cited that version in their witnesses; replaying their work uses that version, not the current one.

## Position

`ClosureRuleSystem` is the substrate-record under which closure rules acquire *operational identity*.
A bare `ClosureRuleRecord` declares what a rule does; a `ClosureRuleSystem` declares which rules are active, where they apply, and at what version.

The object is what makes settle's `rules` parameter coherent.
When [`settle`](../transformers/settle.md) is invoked with `rules: <ClosureRuleSystem>`, the system pins which rules fire and what their composed version is.
Two settles with the same target and the same rule-system version produce byte-identical output per [`settle`](../transformers/settle.md)'s deterministic invariant.

The object also realizes the [four-layer rule architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md)'s top layer at scale: the substrate's *rule book* is the union of `ClosureRuleSystem` entities; the rule book's edits go through `apply-edit`; the rule book's history is in the event log.
