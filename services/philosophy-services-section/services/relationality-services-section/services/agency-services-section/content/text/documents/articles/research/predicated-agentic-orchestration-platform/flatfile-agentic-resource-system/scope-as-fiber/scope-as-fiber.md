---
name: scope-as-fiber
description: "The discipline that scope in FARS is a fiber composition, not a permission list: an agent's effective scope at any moment is the composition (per compose) of its AgentRecord's scope predicates, its inhabited offices' OfficeRecord scope predicates, and any active ModeRecord restrictions."
type: concept
class: framing
depends-on: [scope, fiber, agential-self-generation]
see-also: [check-authorization, modal-restriction, kit-assembly, office-record, scope-composition-is-knowledge-order-monotone]
title: scope-as-fiber
---

# Scope as fiber

The discipline that *scope in FARS is a fiber composition, not a permission list*: an agent's effective scope at any moment is the composition (per [`compose`](../morphisms/compose.md)) of its [`AgentRecord`](../objects/agent-record.md)'s scope predicates, its inhabited offices' [`OfficeRecord`](../objects/office-record.md) scope predicates, and any active [`ModeRecord`](../objects/mode-record.md) restrictions.
Scope is computed at substrate-read-time from substrate content; the substrate does not maintain a separate authorization table.

The framing is the engineering content of the convergent prior-art finding: "the sandbox is a list of entity references (or controlled vocabulary), loaded at investiture, not checked per action."
Scope as a fiber means: the *list* is fiber predicates; the *loading* is fiber composition at session-open; the *not-checked-per-action* property holds because fiber predicates are already in working memory and authorization decisions read them directly.

The framing depends on [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md): authorization predicates are themselves substrate entities, queryable through the same operators as ordinary content.
Editing scope is editing predications.
Audit of authorization is replay of edits.

## How scope is computed

A session's effective scope is the composition of three contributions:

- **Agent-level scope.** The agent's own `scope` predicate, declaring the substrate region the agent operates within across all sessions and offices it inhabits.
  Typically broad; specific offices narrow it.
- **Office-level scope.** Each inhabited office's `scope-bound` predicate.
  Offices typically narrow the agent's scope (a generalist agent inhabiting a specialized office operates only at the specialization's scope).
- **Mode-level restriction.** The active [`ModeRecord`](../objects/mode-record.md)'s `restricts` predicate, if a mode is active.
  Per [modal-restriction](../modal-restriction/modal-restriction.md), a mode further constrains scope below the office level.

The composition uses [`compose`](../morphisms/compose.md): pointwise $\odot$ on cells.
Concordant restrictions sustain (agent says "scope: department-X" AND office says "scope: department-X" → `t` at both).
Conflicting restrictions produce $\top$ (agent says "scope: department-X" AND office says "scope: department-Y" → $\top$ at both, surfacing the contradiction for resolution per [validation-as-settlement](../settlement/validation-as-settlement/validation-as-settlement.md)).
Absent agreement (one says scope-X, the other is silent on scope) propagates the asserting side's value.

The result is the session's *effective scope fiber*.
Authorization checks (per [`check-authorization`](../code/transformers/check-authorization.md)) operate on this fiber.

## Reads and writes

Scope is decomposed into two predicate families:

- **`reads`** — channels and predicates the agent (in this office, under this mode) is admitted to consume.
  Used by [`emit-event`](../code/transformers/emit-event.md) for read-policy checks; used by query operators to know what subset of substrate content is admissible.
- **`writes`** — channels and predicates the agent is admitted to produce.
  Used by [`apply-edit`](../code/transformers/apply-edit.md) for emit-policy checks; an edit attempting to write a predicate not in the agent's `writes` is rejected with a `guard` diagnostic.

The two families are *orthogonal*: an agent may be allowed to read a channel without writing to it (typical for observation channels) or to write to a channel without reading from it (rare, but admissible — fire-and-forget instrumentation).
Per the prior-art's open question on whether "the sandbox applies to reads as well as writes," FARS commits to *both*: scope governs both directions.

## What scope-as-fiber makes possible

- **Substrate-edits change authorization.** Adding a capability to an office is a substrate edit; subsequent sessions reading that office see the new capability.
  No authorization-system reload is required.
- **Replay-determinism on authorization decisions.** A past authorization decision's witness cites the cited rule-system version and the substrate state at decision time; replay reproduces the decision byte-for-byte.
  Auditors can verify "this action was admitted because at that moment the agent's effective scope included this predicate."
- **Federation-coherent authorization.** Two FARS instances exchanging events under [federation](../../teaching/explanations/federation.md) can verify each other's authorization decisions because both substrates' scope-as-fiber discipline produces the same kind of evidence.
- **Modal sub-restriction.** Per [modal-restriction](../modal-restriction/modal-restriction.md), a mode is a fiber restriction admitted *atop* the agent + office composition.
  Cline's Plan/Act split is one instance: Plan-mode's restriction removes write predicates from the effective scope.

## What scope-as-fiber is not

- **Not a permission lookup.** Authorization is not a hash-table lookup against a permission list.
  It is a fiber composition followed by a value-domain query against the resulting fiber.
- **Not run-time-only.** The fibers contributing to scope are substrate-resident records (agent, office, mode); the composition operates over substrate content; the result IS substrate content (recorded in the session's working fiber).
  Authorization decisions are replayable against substrate state, not against runtime memory.
- **Not bypassable.** A FARS realization that exposes a "skip-authorization" path for performance has lost the discipline.
  Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), every action's authorization decision SHALL be recorded as a witness; bypasses are non-conformant.

## Position

Scope-as-fiber is what makes [`check-authorization`](../code/transformers/check-authorization.md) coherent — that morphism reads the session's effective scope fiber and tests action predicates against it.
The framing depends on [`compose`](../morphisms/compose.md) (the operator producing the effective scope) and [`fiber`](../code/structures/fiber.md) (the container).
It composes with [`OfficeRecord`](../objects/office-record.md), [`AgentRecord`](../objects/agent-record.md), and [`ModeRecord`](../objects/mode-record.md) — the three contributing fibers — and with [kit-assembly](../kit-assembly/kit-assembly.md), which describes the broader session-start composition that includes scope as one of its components.
