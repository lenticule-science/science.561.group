---
type: morphism
class: agent-operator
realizes: [session]
depends-on: [session-record, agent-record, view-record, predication-settling, settling-bound, application-sublocale]
see-also: [resume-session, close-session, session-as-time-bounded-sublocale]
title: Open session
description: The operator that creates a new session-record for an agent, initializes the agent's view-record, and begins the agent's bounded interaction with the platform.
---

# Open session

The operator that creates a new [session-record](../objects/session-record.md) for an [agent](teaching/explanations/agent.md), initializes the agent's [view-record](../../scope/view/view-record/view-record.md), and begins the agent's bounded interaction with the platform.
Per [session-as-time-bounded-sublocale](../session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md), open-session creates the lower endpoint of the session's bounded ordinal interval and binds the session settling to the agent's authorized [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md).

## Signature

`open-session(agent, scope, trigger) → (session-record, view-record, witness)`

Inputs:

- **`agent`** — reference to the [agent-record](../objects/agent-record.md) opening the session.
- **`scope`** — reference to the [scope](../../scope/scope.md) the session operates within.
  Determines the session settling's sublocale.
- **`trigger`** — predications declaring why the session was opened: an inbox message arrival, an agent-initiated connection, a runbook invocation, a scheduled-tick wake-up.

Outputs:

- **`session-record`** — newly-created session entity with `started-at` set to the substrate ordinal at session start (the lower endpoint of the session's [settling bound](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md) interval), `ended-at` absent.
- **`view-record`** — newly-created view entity associated with the session, with composed-fibers initialized.
- **`witness`** — records the open: agent, scope, trigger, session-id, view-id, the substrate state at session start.

## Operational semantics

Open-session proceeds in five steps:

1. *Authorization check.* Verify the agent is admissible to operate in the cited scope: traversal of the agent's `member-of` to office records to scope-applicability predications.
  Per [governance-as-modal-restriction](../../governance/governance-as-modal-restriction/governance-as-modal-restriction.md), the modal $\Box_R$ of the agent's authorization at the scope's world must produce an affirmative bilattice value.
  Failure aborts.
2. *Construct session-record.* Create the session entity with `agent`, `scope`, `started-at`, `closure-kind: session`, and an event-cursor pointing to the current event-log position.
3. *Construct view-record.* Initialize the view entity with the agent, the session, an initial location (typically the scope's root entity), and the agent's authorization composed against any active mode.
  The view's available-operations and visible-entities are computed.
4. *Persist.* Insert both records via [insertion](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/insertion.md).
  Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), both are substrate-resident.
5. *Witness emit.* Append the session-open witness to the [event log](../../../objects/event-log.md).
  Subsequent operations within the session cite the session-id.

## Engineering invariants

- **Authorization-checked at open.** A session is opened only when the agent is admissible at the scope.
  Authorization changes mid-session are reflected in subsequent view recomputation, but the initial open is gated.
- **Substrate-resident.** Both session-record and view-record are substrate entities; sessions that live only in runtime memory are out-of-band.
- **Event-cursor anchored.** The session's event-cursor records the substrate ordinal at open, allowing later resume operations to determine "what happened in this session."
- **Atomic.** Both records are inserted (and the open witness is emitted) as a single substrate transaction.
  Partial opens are not admissible.

## Failure modes

- **Authorization failed.** The agent is not admissible at the scope; the open aborts; the witness records the rejection.
- **Scope retired.** The cited scope has been retired; sessions cannot be opened in retired scopes.
  The open aborts.
- **Agent-record missing.** The cited agent-record does not exist; the open requires the agent to be substrate-resident first.

## Position in the platform

Open-session is the substrate-level *agent-platform connection primitive*.
Without it, agent activity is anonymous and unaudited; with it, every agent-platform interaction has a substrate-recorded start, a substrate-recorded duration (per the session's bounded ordinal interval), a substrate-recorded view, and a substrate-recorded end (via [close-session](close-session.md)).
The discipline is what makes per-agent audit, multi-agent disambiguation, and federation across agent boundaries operationally tractable.
