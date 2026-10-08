---
source: [agent, office, scope, closure-rule-system, description]
target: [session, witness]
name: open-session
description: "The morphism that opens a new SessionRecord: given an agent, an office, and a scope, install the agent in the office for this session, compose the always-loaded tier from the office's fiber, create the session record, emit the session-opened event, and return a session handle the realization binds to its compute resources."
type: morphism
class: composed-operator
instantiates: [open-session]
depends-on: [session-record, agent-record, office-record, three-tier-memory, apply-edit, emit-event]
see-also: [resume-session, close-session, invoke-skill]
title: open-session
---


The morphism that opens a new [`SessionRecord`](../objects/session-record.md): given an agent, an office, and a scope, install the agent in the office for this session, compose the always-loaded tier from the office's fiber, create the session record, emit the `session-opened` event, and return a session handle the realization binds to its compute resources.

`open-session` is FARS's realization of AgOP's [open-session](../../../morphisms/open-session.md) at the bilattice value-domain.
The morphism is the *substrate-side* of session establishment; the realization-side binding (instantiating an LLM stream, opening a TUI, attaching a process) follows the substrate-side completion.

## Signature

```
open-session(agent, office, scope; closure-rule-system, description) → (session, witness)
```

Inputs:

- **`agent`** — reference to the [`AgentRecord`](../objects/agent-record.md) to invest in the session.
- **`office`** — reference to the [`OfficeRecord`](../objects/office-record.md) the agent will inhabit.
  SHALL be in the agent's `offices` list, OR the agent's investiture into the office SHALL be a recorded substrate event reachable from the session-open's substrate state.
- **`scope`** — substrate region the session operates in.
  Typically inherited from the office's `scope-bound`; MAY be narrower.
- **`closure-rule-system`** — reference to the [`ClosureRuleSystem`](../objects/closure-rule-system.md) version active for this session.
  Pinned at session-open for replay determinism.
- **`description`** — optional human-readable session description.

Outputs:

- **`session`** — newly-created [`SessionRecord`](../objects/session-record.md).
  The handle the realization binds to its compute resources.
- **`witness`** — [`Witness`](../objects/witness.md) recording the open-session: agent, office, scope, rule-system version, the resulting session record's hash.

## Operational semantics

`open-session` SHALL proceed in seven phases:

1. **Eligibility check.** Verify the agent is admissible to inhabit the office (agent is in office.bearer or admitted via charter-binding); the agent's scope covers the session's scope; the office is currently installed (per office.installation-markers); the cited rule-system version is in the substrate's registry.
  Failures produce a `guard` diagnostic; the open is rejected.

2. **Compose always-loaded fiber.** Per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md), compose the office's fiber with the agent's identity fiber via [`compose`](compose.md), producing the session's `always-loaded` content.
  The composition includes office.constructors (skills the agent can invoke), office.deontic-profile (duties/powers/privileges/immunities), office.action-domain (entities the office governs).

3. **Construct session record.** Create the [`SessionRecord`](../objects/session-record.md): a unique session name, the cited agent and office, the scope, the rule-system version, the `state: open` predicate, the composed always-loaded fiber, an empty `working-state`, an `observation-cursor` set to the substrate's current event-log position.

4. **Apply edit.** Per [`apply-edit`](apply-edit.md), commit the session record to the substrate.
  The substrate's edit discipline runs validation-as-settlement against the session-record shape; if shape-validation fails (rare; the realization should compose conformant records), abort with a `guard` diagnostic.

5. **Investiture event.** Emit a substrate event on the office's primary channel (or `mutation` channel by default) with `action: investiture`, `subject: session`, `actor: agent`, `payload: {office, scope, rule-system-version}`.
  This event is the substrate's record of "this agent is installed in this office for this session."

6. **Open event.** Emit a `session-opened` event on the session's primary channel with `subject: session`, `actor: agent`, `payload: {agent-hash, office-hash, scope-hash, rule-system-version, always-loaded-hash}`.
  Distinct from the investiture event; investiture is *who is in office*, session-open is *the session has begun*.

7. **Return.** Return the `(session, witness)` pair.
  The realization binds the session to its compute resources (LLM stream, TUI, process).
  The session enters `state: active` once the realization confirms the binding; the transition is a substrate event.

## Normative invariants

- **Eligibility-gated.** Open-session SHALL fail before any substrate edit if the agent or office is ineligible.
  Eligibility checks are substrate read-discipline; failures produce guard diagnostics.
- **Always-loaded composed.** The session SHALL hold the composed always-loaded fiber at session-open.
  A session whose always-loaded is empty cannot do work bounded by the office's deontic profile.
- **Rule-system pinned.** The cited rule-system version SHALL be the one the session's subsequent operators cite.
  Subsequent rule-system edits do not retroactively change the session's behavior; replay reproduces the session under the cited version.
- **Investiture-witnessed.** The investiture event SHALL be in the substrate before the session-opened event.
  A session whose investiture is missing from the substrate is non-conformant.
- **Deterministic.** Same `(agent, office, scope, rule-system, description)` and same substrate state at open-time SHALL produce byte-identical session records (modulo the session name's content-derived component, which depends on substrate state at open-time).

## Failure modes

- **Eligibility failure** (agent not admissible, office not installed, scope mismatch).
  Substrate unchanged.
  `guard` diagnostic.
- **Rule-system mismatch** (cited version not in substrate).
  Substrate unchanged.
  `guard` diagnostic.
- **Always-loaded composition produces $\top$.** The composition of the office and agent fibers contradicts on a cell — the agent has a duty the office prohibits, or the agent's scope conflicts with the office's.
  Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md), the $\top$-cell is substrate-visible; the open MAY proceed (with the contradiction recorded) under a `force` flag, OR fail with a `guard` diagnostic by default.
- **Substrate write failure** (per [`apply-edit`](apply-edit.md)).
  Standard apply-edit failure handling.

## Position

`open-session` is the morphism that brings a session into substrate existence.
Without it, sessions are runtime-only objects the substrate cannot replay or audit.
With it, every session is born in the substrate, the realization's runtime presence is a *binding* to substrate content, and the session's lifecycle is fully substrate-driven.

The morphism composes with [`AgentRecord`](../objects/agent-record.md), [`OfficeRecord`](../objects/office-record.md), [`apply-edit`](apply-edit.md), [`emit-event`](emit-event.md).
It is the *first half* of the session's lifecycle pair (with [`close-session`](close-session.md) being the second), and the *non-resume entry-point* (with [`resume-session`](resume-session.md) covering the resume case).
