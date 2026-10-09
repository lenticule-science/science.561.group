---
source: [session, action]
target: [decision, witness]
name: check-authorization
description: "The morphism that decides whether an action is admissible at a session's effective scope: given an action's required-predicate fiber and the session's working-fiber-with-scope, run restrict to test the action against the scope, project the result to a four-valued admission decision, and emit a guard-channel event recording the decision."
type: morphism
class: composed-operator
depends-on: [scope-as-fiber, fiber, restrict, witness]
see-also: [emit-event, apply-edit, invoke-skill, transition-mode]
title: check-authorization
---


The morphism that decides whether an action is admissible at a session's effective scope: given an action's required-predicate fiber and the session's working-fiber-with-scope, run [`restrict`](restrict.md) to test the action against the scope, project the result to a four-valued admission decision, and emit a `guard`-channel event recording the decision.
`check-authorization` is the substrate's *authorization primitive*; every operator that mutates substrate state ([`apply-edit`](apply-edit.md), [`emit-event`](emit-event.md), [`invoke-skill`](invoke-skill.md), [`transition-mode`](transition-mode.md), edit-shape morphisms) calls `check-authorization` before proceeding.

The morphism realizes the prior-art's claim that *the constraint hook is one fiber composition, not 15 hand-coded checks* (per the seven-channel decomposition's analysis): all authorization decisions across the substrate use this one operator over the agent's effective-scope fiber.

## Signature

```
check-authorization(session, action) → (decision, witness)
```

Inputs:

- **`session`** — reference to the [`SessionRecord`](../objects/session-record.md) the action is performed within.
  The session's working fiber (per [kit-assembly](../../kit-assembly/kit-assembly.md)) carries the agent's effective scope after composition with the active mode.
- **`action`** — the action's *required-predicate fiber* — the predicates the action SHALL be admitted under (e.g., `writes: status, channel: dispatch`).
  May be derived from a skill's `required-capabilities`, an event's channel and policy, an edit's `writes` claims.

Outputs:

- **`decision`** — one of `admit`, `deny`, `contested`, `unknown`.
  Derived from the value-domain projection of the [`restrict`](restrict.md) result.
- **`witness`** — [`Witness`](../objects/witness.md) recording the check: session, action, scope-fiber-hash, restriction-result-hash, decision.

## Operational semantics

`check-authorization` SHALL proceed:

1. **Read effective scope.** Read the session's working fiber.
  The fiber carries the composed scope contributions from agent + office + active mode, with `reads` and `writes` predicates pre-composed.

2. **Restrict against action.** Per [`restrict`](restrict.md), compute `restrict(session.working-fiber, action.required-predicates)`.
  The restriction's output cells indicate, per predicate: $t$ where the scope grants the action's required predicate; $f$ where the scope denies it; $\top$ where there's contested evidence (the office grants but the mode denies, or vice versa); $\bot$ where the scope says nothing.

3. **Project to decision.** Examine the restriction's cells:
   - All required predicates carry $t$ → `admit`.
   - Any required predicate carries $f$ → `deny`.
   - Any required predicate carries $\top$ → `contested`.
     Per the substrate's escalation discipline, contested decisions go to a higher authority (a charter rule, a captain's review, or a substrate-coherence repair).
   - Any required predicate carries $\bot$ (and no $f$ or $\top$) → `unknown`.
     Per the strict/permissive policy of the operator: strict operators treat `unknown` as `deny`; permissive operators treat it as `admit-with-warning`.
     The default is *strict deny*.

4. **Emit guard event.** [`emit-event`](emit-event.md) one event on the `guard` channel with `subject: session`, `actor: agent`, `payload: {action-hash, decision, restriction-result-hash, contested-or-unknown-cells: [...]}
  `.
  The event records the decision; replay reproduces it.

5. **Witness.** Construct the `Witness` per [`emit-event`](emit-event.md)'s discipline; return.

## Decision projection details

The four-valued projection is what makes FARS authorization *informationally richer than Boolean*:

- **`admit`** — the action is admissible.
  The caller proceeds.
- **`deny`** — the action is denied.
  The caller MUST NOT proceed; the deny is recorded in the guard event for audit.
- **`contested`** — the scope's contributions disagree on the action's admissibility.
  Per the substrate's repair discipline, the contested cell is a $\top$ that may resolve under a downstream rule, an escalation, or a manual operator action.
  The caller proceeds OR not depending on the contested-decision policy: typically *deny-by-default with escalation*.
- **`unknown`** — the scope has no opinion on the action's admissibility.
  The default is *strict-deny*: an action whose authorization is unknown is treated as not authorized.
  The opposite policy (*permissive-admit*) is admissible per substrate configuration but should be a deliberate substrate-level commitment, not an implicit fallback.

## Normative invariants

- **Pre-mutation.** `check-authorization` SHALL be called *before* any substrate mutation the action would produce.
  A realization that mutates first and checks second has lost the substrate's authorization-before-mutation discipline.
- **Witness-emitting.** Every check SHALL produce a guard-channel event.
  Authorization decisions that don't make it into the substrate's audit chain are non-conformant; replay can't verify them.
- **Replay-deterministic.** Same `(session, action, substrate-state)` SHALL produce byte-identical `(decision, witness)`.
  The session's working fiber is substrate state; the action's required-predicates are substrate-derivable; the result is determined.
- **Mode-aware.** The check SHALL incorporate the session's active mode (per the working-fiber composition).
  Decisions that ignore the mode are non-conformant.
- **No-bypass.** A FARS realization SHALL NOT expose a "skip-authorization" path for performance or convenience.
  Per [scope-as-fiber](../../scope-as-fiber/scope-as-fiber.md), every action's authorization decision is part of the substrate's audit chain; bypasses make the chain incomplete.

## Failure modes

- **Working fiber not reachable.** The session's working fiber cannot be loaded (the session record is corrupted, the cited rule-system version is missing).
  Decision is `unknown` per default; the action is denied; a `guard` diagnostic surfaces the integrity concern for repair.
- **Action's required-predicates malformed.** The action's required-predicate fiber doesn't conform to fiber shape.
  Decision is `deny`; a `guard` diagnostic flags the malformation.
- **Channel-emission failure for the guard event itself.** The guard event cannot be emitted.
  The substrate's audit chain has a hole; the realization SHOULD escalate (this is a substrate-coherence emergency).

## Position

`check-authorization` is the *authorization primitive* of the substrate.
Every operator that mutates substrate state passes through it.
Every action that flows from agent to substrate carries an authorization decision in the substrate's audit chain.
The morphism is what makes the substrate's authorization story *visible, replayable, and tunable through substrate edits*.

The morphism composes with [`SessionRecord`](../objects/session-record.md) (the source of the working fiber), [`restrict`](restrict.md) (the operator), [`emit-event`](emit-event.md) (the guard channel emission), and [`apply-edit`](apply-edit.md) / [`invoke-skill`](invoke-skill.md) / [`transition-mode`](transition-mode.md) (the operators that call `check-authorization` before proceeding).
