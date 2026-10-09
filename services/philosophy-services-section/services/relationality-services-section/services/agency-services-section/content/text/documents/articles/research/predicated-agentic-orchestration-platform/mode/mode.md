---
type: concept
class: pattern
depends-on: [view, authorization]
see-also: [scope, dispatch]
title: Mode
description: "A further restriction within an agent's active view: a substrate-recorded constraint that narrows what the agent can do during a particular interaction phase, beyond what the agent's general authorization admits."
---

# Mode

A further restriction within an [agent](agent.md)'s active [view](../scope/view/view.md): a substrate-recorded constraint that narrows what the agent can do *during a particular interaction phase*, beyond what the agent's general [authorization](../governance/authorization/authorization.md) admits.
A planning-mode agent has all its planning powers but its mutation powers are temporarily withdrawn; an editing-mode agent has all its editing powers but its dispatch powers are deferred; a read-only mode agent retains its query powers and gives up everything that would change substrate content.

A mode is recorded as predications on the view (or on the agent's session entity), declaring which authorization positions are *active* during the mode.
The substrate's closure rules consult both the agent's general authorization and the mode-active subset; the operation is admitted only when the operation's required authorization is in the mode-active subset.

Three engineering properties:

- **Modes are substrate entities.** A mode declaration — what it constrains, when it is active, how it is exited — is itself a substrate entity, queryable through the same operators as the rest of the substrate.
  Particular platform realizations may declare modes for different agents differently; the structural claim is that mode is *predications*, not a privileged runtime state.
- **Mode transitions are events.** Entering or exiting a mode produces a [witness](../../teaching/explanations/witness.md) entry recording the transition's content, the rule that admitted it, and the resulting predications.
  An auditor replaying the agent's session reproduces the mode transitions.
- **Mode is constraint, not declaration.** A mode that the agent is *in* but that admits all operations is not a meaningful mode; mode is structurally a *narrowing* of the agent's authorization for the duration of the mode.
  An agent that is in no declared mode operates with the full authorization its identity and office afford it.

The pattern lets the platform express phased work within a single session without proliferating session-types or agent-types.
An agent that planned, then edited, then committed traveled through three modes within one session; the modes shaped what the agent could do at each phase; the substrate recorded the transitions.

In particular agent platforms (the planning-vs-acting split in some agentic-coding tools, the flight-vs-repl split in some operating environments), the mode constraints are often hardcoded into separate runtime states.
The substrate-level pattern lifts the hardcoded states into substrate predications; mode behavior becomes editable through the same operators as content behavior.
