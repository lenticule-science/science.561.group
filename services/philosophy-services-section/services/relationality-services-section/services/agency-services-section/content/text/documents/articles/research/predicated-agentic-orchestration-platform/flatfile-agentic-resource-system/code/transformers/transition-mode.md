---
source: [session, target-mode, reason]
target: [session, witness]
name: transition-mode
description: "The morphism that switches a session's active mode: given a session reference and a target mode, verify the transition is admissible per the target mode's activation-policy, edit the session's active-mode predicate, re-assemble the working kit per assemble-kit, and emit the mode-transitioned event."
type: morphism
class: composed-operator
instantiates: [mode-transition]
depends-on: [mode-record, session-record, modal-restriction, kit-assembly, check-authorization, apply-edit, emit-event]
see-also: [open-session, resume-session, assemble-kit]
title: transition-mode
---


The morphism that switches a session's active mode: given a session reference and a target mode, verify the transition is admissible per the target mode's `activation-policy`, edit the session's `active-mode` predicate, re-assemble the working kit per [`assemble-kit`](assemble-kit.md), and emit the `mode-transitioned` event.
`transition-mode` is FARS's realization of AgOP's [mode-transition](../../../mode/mode-transition/mode-transition.md).

A mode transition is *not* a session restart.
The session record persists; the agent and office are unchanged; only the active mode (and the resulting effective scope) change.
The transition's audit chain is continuous with the session's prior history.

## Signature

```
transition-mode(session, target-mode; reason) → (session, witness)
```

Inputs:

- **`session`** — reference to the [`SessionRecord`](../objects/session-record.md).
  Must be in `active` state (mode transitions during `paused` or `closing` are non-conformant — sessions that aren't active don't have a working mode to transition from).
- **`target-mode`** — reference to the [`ModeRecord`](../objects/mode-record.md) to activate.
- **`reason`** — optional human-readable rationale for the transition.
  Recorded in the event payload for audit.

Outputs:

- **`session`** — the session record reference, with `active-mode` updated.
- **`witness`** — [`Witness`](../objects/witness.md) recording the transition: prior mode, target mode, re-assembled kit's hash, decision-event-hash.

## Operational semantics

`transition-mode` SHALL proceed:

1. **Read state.** Read the session record.
  Verify state is `active`.
  If not, reject with a `guard` diagnostic naming the disallowed transition source-state.

2. **Authorization check.** Construct the action's required-predicate fiber: the target mode's `activation-policy` predicates.
  Call [`check-authorization`](check-authorization.md).
  If the decision is not `admit`, the transition is rejected; the `check-authorization`'s emitted guard event records the rejection.

3. **Mode-record verification.** Verify the target mode is a substrate entity (resolves to a [`ModeRecord`](../objects/mode-record.md)).
  Verify its `compose-with` policy is compatible with FARS's mode-exclusivity discipline (typically *exclusive*; the new mode replaces the old).

4. **Kit re-assembly.** Per [`assemble-kit`](assemble-kit.md), re-assemble the session's working fiber with the new mode in place of the old.
  The new working fiber is computed by composing office + agent + new-mode + rule-system + state.
  The output is the post-transition working fiber.

5. **Apply edit.** Per [`apply-edit`](apply-edit.md), edit the session record: `active-mode: <prior>` → `active-mode: <target>`, `working-fiber: <new>`.
  Two field updates in one substrate edit; the edit's event payload includes both.

6. **Mode-transitioned event.** Emit a `mode-transitioned` event on the session's primary channel with `subject: session`, `actor: agent`, `payload: {prior-mode-ref, target-mode-ref, reason, prior-working-hash, post-working-hash}`.
  The event surfaces the transition for downstream observers (closure rules that fire on mode-transitions for monitoring, dispatch reordering, etc.).

7. **Return.** Return the `(session, witness)` pair.
  The realization's runtime SHOULD re-render any context that depends on the working fiber (a context-displaying TUI, an LLM prompt-renderer); the substrate-side state is consistent without runtime-side action.

## Normative invariants

- **Active-state-only.** Mode transitions SHALL be admissible only when the session is in `active` state.
  Other states do not have a working mode to transition.
- **Authorization-gated.** Every transition SHALL pass [`check-authorization`](check-authorization.md).
  Bypassing the check is non-conformant.
- **Kit-reassembled.** The session's working fiber SHALL be re-assembled after a mode transition.
  A transition that updates `active-mode` without re-assembling has lost coherence; subsequent operations would read a working fiber inconsistent with the active mode.
- **Substrate-edit-witnessed.** The transition SHALL produce one substrate edit (per [`apply-edit`](apply-edit.md)) and one mode-transitioned event.
  Two-event splits (edit + emit) on a single transition are non-conformant; the audit chain expects one transition event per substrate-state-change.
- **Replay-deterministic.** Same `(session, target-mode, substrate-state)` SHALL produce byte-identical `(session, witness)`.
- **Reason-preserved.** If a `reason` is provided, it SHALL be in the event payload.
  Reasons aren't load-bearing for replay (they're prose) but are preserved for human audit.

## Failure modes

- **Wrong session state.** Session is `paused`, `closing`, or `closed`.
  Reject with `guard` diagnostic.
- **Target mode not found.** The target-mode reference does not resolve.
  Reject with `guard` diagnostic naming the missing mode.
- **Authorization denied.** The agent (or office, depending on the policy's predicates) does not satisfy the target mode's `activation-policy`.
  Reject; `check-authorization` already emitted the guard event.
- **Kit-reassembly $\top$.** The new mode's restrictions, composed with the office and agent fibers, produce $\top$-cells on critical predicates.
  Per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md): admit with $\top$ recorded in the working fiber (the substrate's repair catalog handles), OR fail the transition (default for hard-conflict cases).
- **Apply-edit failure** (per [`apply-edit`](apply-edit.md) discipline).
  The session's mode change cannot be persisted.
  The transition is aborted; the session's mode is unchanged; a `guard` diagnostic surfaces the failure.

## Position

`transition-mode` is the morphism that makes [modal-restriction](../../modal-restriction/modal-restriction.md) operationally meaningful within a session.
Without it, modes would be set-once-at-open-session; with it, sessions can shift authorization scope to fit the work in front of them.
A planning-phase agent transitions to `act` mode when the plan is ready; a reviewing-phase agent transitions to `review` mode while consulting a peer's work; the substrate's authorization discipline accommodates the operational rhythm.

The morphism composes with [`ModeRecord`](../objects/mode-record.md) (the target), [`SessionRecord`](../objects/session-record.md) (the carrier of `active-mode`), [`assemble-kit`](assemble-kit.md) (the kit re-assembly), [`check-authorization`](check-authorization.md) (the gate), [`apply-edit`](apply-edit.md), [`emit-event`](emit-event.md).
