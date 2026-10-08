---
type: morphism
class: agent-operator
realizes: [mode]
depends-on: [mode, agent, view]
see-also: [authorization, session]
title: Mode transition
description: The operator that changes an agent's active mode within a session — entering a new mode, exiting a mode, switching between modes.
---

# Mode transition

The operator that changes an [agent](teaching/explanations/agent.md)'s active [mode](teaching/explanations/mode.md) within a [session](teaching/explanations/session.md) — entering a new mode, exiting a mode, switching between modes.
Mode transition is what makes phased work within a session expressible: the agent is in planning mode, then editing mode, then committing mode; each transition narrows or widens the agent's effective authorization for the next phase.

## Signature

`mode-transition(agent, session, target-mode | exit-mode) → (post-transition-state, witness)`

Inputs:

- **`agent`** — reference to the agent whose mode is changing.
- **`session`** — reference to the [session](teaching/explanations/session.md) within which the transition occurs.
- **`target-mode`** — reference to the mode the agent is entering (for entry transitions).
- **`exit-mode`** — reference to the mode the agent is exiting (for exit transitions).

Outputs:

- **`post-transition-state`** — the agent's session state with the new mode predication active.
- **`witness`** — records the transition's pre and post mode predications, the originating cause (an explicit mode-switch by the agent, an automatic transition by a runbook step, an enforced transition by governance), and the resulting effective authorization predications.

## Operational semantics

Mode transition proceeds in five steps:

1. *Validate eligibility.* Check that the agent is admissible to enter (or exit) the cited mode.
  Mode entry typically requires an authorization predication (an agent must be admitted to "planning mode" by a power); mode exit typically requires the mode's exit conditions to be met (e.g., a planning-mode session with no pending plans cannot exit until plans are recorded).
2. *Pre-transition checks.* Run any closure rules associated with the originating mode's exit (cleanup behaviors, audit-record-emit) or the target mode's entry (initialization, role announcement).
3. *Update mode predication.* Insert (or retract) the appropriate mode predication on the session entity.
  Per [mode](teaching/explanations/mode.md), the mode is a substrate predication, not a runtime flag.
4. *Recompute view.* The agent's [view](../../scope/view/view.md) is updated: the active mode constrains the view's [authorization](../../governance/authorization/authorization.md) — powers admissible in the target mode are visible; powers unavailable in the target mode are hidden.
5. *Witness emit.* Append the transition witness to the [event log](../../../objects/event-log.md).

## Engineering invariants

- **Substrate-recorded.** Mode transitions are substrate events, not runtime state changes.
  The [event log](../../../objects/event-log.md) records every transition; an auditor replays the session by replaying mode transitions.
- **Eligibility-checked.** A mode transition the agent is not admissible for produces a rejection witness, not a silent no-op. The agent learns from the witness which authorization is missing.
- **Atomic.** A transition either succeeds (post-transition mode predications are written) or fails (no mode predications change).
  Partial transitions are coherence violations.
- **Witness-replayable.** Replaying the witness reproduces the transition.
  The substrate's view computation is deterministic given the mode predications.

## Failure modes

- **Ineligibility.** The agent lacks the power to enter the target mode, or the originating mode's exit conditions are unmet.
  The witness records the rejection cause; the agent (or the runbook) may take corrective action.
- **Soul-violation on entry.** The target mode's authorization narrowing would, in this scope, violate the [governing soul](../../agent/governing-soul/governing-soul.md).
  The transition is blocked; per [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md), the violation is recorded.
- **Conflicting active modes.** Two modes that cannot be active simultaneously (a mutually-exclusive pair declared in the substrate's mode catalog) — the substrate's coherence check rejects the transition.

## Position in the platform

Mode transition is what makes phased agency expressible at the substrate level.
Without it, agents have one fixed authorization for the duration of a session; with it, agents move through structured phases of work, each with its own authorization narrowing.
The [event log](../../../objects/event-log.md)'s record of transitions is the substrate's narrative of the agent's session: when planning began, when editing started, when commit happened.
