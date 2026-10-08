---
type: definition
class: substrate-entity
realizes: [session]
depends-on: [session, agent, scope, predication-settling, settling-bound, application-sublocale]
see-also: [view-record, memory, session-as-time-bounded-sublocale]
title: Session record
description: "A session record is the substrate-entity formal definition of a session: the predication-graph entity recording one bounded interaction between an agent and the platform."
---

# Session record

A **session record** is the substrate-entity formal definition of a [session](teaching/explanations/session.md): the predication-graph entity recording one bounded interaction between an [agent](teaching/explanations/agent.md) and the platform.
Structurally, a session is a [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) restricted to an [application sublocale](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/application-sublocale.md) over a bounded ordinal interval — see [session-as-time-bounded-sublocale](../session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md).
Every session — whether triggered by a message arrival, a runbook invocation, an interactive connection, or an autonomous loop — has a corresponding session record that the substrate carries from session start to session end.

## Structural fields

- **`id`** — kebab-case identifier; typically derived from the session's start-time and originating agent.
- **`description`** — one-line summary of the session's purpose.
- **`agent`** — reference to the primary agent for this session.
- **`scope`** — reference to the [scope](../../scope/scope.md) the session operates within.
  The scope determines the application-sublocale the session settling is restricted to.
- **`started-at`** — the session's start ordinal in the substrate's settling.
  The session's [settling bound](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-bound.md) lower endpoint.
- **`ended-at`** — the session's end ordinal.
  Absent on active sessions; set when the session closes.
  The session's settling-bound upper endpoint.
- **`active-mode`** — reference to the currently-active [mode](teaching/explanations/mode.md) record, if any.
  Updated by [mode-transition](../../mode/mode-transition/mode-transition.md) operations.
- **`view`** — reference to the agent's [view-record](../../scope/view/view-record/view-record.md) for this session — the substrate's record of what the agent currently sees (a sublocale projection per the agent's authorization).
- **`memory`** — references to the [memory](teaching/explanations/memory.md) recall records accumulated during this session.
- **`event-cursor`** — the session's most-recent event-log position, updated by every operation the agent performs.
  Used for resume-after-interruption.
- **`witness-chain`** — references to the witnesses produced during the session, ordered by emission time.
- **`closure-kind`** — `session`.

## Invariants

- **Single primary agent.** A session has exactly one agent reference.
  Multi-agent work is multiple sessions, possibly federated; the substrate's audit treats each agent's work in its own session.
- **Scope-coherent.** All operations the session performs are within the session's scope (or in scopes the agent has [authorization](../../governance/authorization/authorization.md) to act on from this scope).
  Cross-scope operations require explicit substrate routing.
  The scope-coherence is the substrate-side condition that the session settling is genuinely restricted to its declared sublocale.
- **Time-bounded.** A session has a start ordinal and either an end ordinal or an active state.
  A session record with no `started-at` is incomplete; a record with `ended-at` is closed and admits no further predications.
  The bounded-interval discipline matches the math's settling bound $\lambda$.
- **Resumable.** The combination of `event-cursor` and `memory` is sufficient to resume the session after interruption.
  A session whose state cannot be reconstructed from the substrate is a violation of the resumability discipline.

## Operations

- *Open.* A session is opened by inserting a session-record entity with `started-at` set and `ended-at` absent.
  The opening produces a witness; subsequent operations within the session cite the session-id.
- *Update.* Session operations (mode transitions, skill invocations, view changes, memory edits) update the session record's predications.
  Each update produces a witness contributing to the session settling's [increment sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md).
- *Close.* A session is closed by setting `ended-at`.
  Closed sessions admit no further predications.
  Replay can re-derive a closed session's full activity by traversing its witness chain.
- *Resume.* An interrupted session can be resumed by reading the session record's `event-cursor` and `memory`; the agent's next operation continues from that state.
  Resume is itself a substrate operation, witnessed.

## Position in the platform

The session record is the platform's *temporal slice of agential activity*: where the agent is now, what it is doing, what it has done in this stretch.
Per [session-as-time-bounded-sublocale](../session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md), it is the substrate's representation of a bounded-interval restriction of the platform's predication settling to the agent's authorized sublocale.
The session record is queryable through the same operators as content, replayable from the event log, federatable through inbox/outpost handshakes.

Sessions compose with [scope](../../scope/scope.md) and [view](../../scope/view/view.md): a session is bounded by a scope, the session's view is a substrate-recorded projection of that scope through the agent's current authorization, and the agent's operations within the session are admissible only when the view's authorization admits them.
