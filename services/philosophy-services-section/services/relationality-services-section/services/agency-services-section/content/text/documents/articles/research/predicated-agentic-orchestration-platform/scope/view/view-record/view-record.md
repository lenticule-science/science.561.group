---
type: definition
class: substrate-entity
realizes: [view]
depends-on: [view, agent, session]
see-also: [session-record, authorization]
title: View record
description: "A view record is the substrate-entity formal definition of an agent's view: the predication-graph entity recording what the agent currently sees of the substrate, recomputed as the underlying predications change."
---

# View record

A **view record** is the substrate-entity formal definition of an [agent](teaching/explanations/agent.md)'s [view](../view.md): the predication-graph entity recording what the agent currently sees of the substrate, recomputed as the underlying predications change.
The view record is the substrate-level rendering target — the data structure that any transport (TUI, CLI, web, MCP) renders for the user.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`agent`** — reference to the agent whose view this is.
- **`session`** — reference to the active [session-record](session-record.md).
- **`scope`** — reference to the [scope](../../scope.md) the view operates within.
- **`location`** — reference to the substrate entity the agent is "currently looking at."
  The location is what `look` operations consult; `go` operations update it.
- **`active-mode`** — reference to the active [mode](teaching/explanations/mode.md) record (if any), which constrains the view's visible operations.
- **`composed-fibers`** — references to the fibers composing the view: the agent's identity fiber, the agent's [office](teaching/explanations/office.md) fiber, the location's content fiber, plus any active mode constraint fibers.
  Per [view](../view.md), the view is the composition of these fibers.
- **`available-operations`** — the derived list of operations admissible at the current view, computed by composing the agent's [authorization](../../../governance/authorization/authorization.md) (powers, duties, privileges, immunities) with the active mode's constraints.
  Updated whenever any composing fiber changes.
- **`visible-entities`** — the substrate entities currently visible at the view, computed from the location and the agent's authorization.
  Updated alongside available-operations.
- **`closure-kind`** — `view`.

## Invariants

- **Composed fibers are substrate references.** Each composing fiber is itself a substrate entity, queryable.
  A view that depends on out-of-band fiber data violates the [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) discipline.
- **Live recomputation.** When any composing fiber's predications change, the view's derived fields (available-operations, visible-entities) are recomputed.
  The recomputation is itself a substrate operation; the new view state has its own canonical hash.
- **Transport-independent.** The view record's content is independent of transport.
  A TUI rendering reads the same view record as a web rendering; both produce different presentations of identical underlying state.

## Operations

- *Initialize.* On session start, a view record is created by reading the agent's identity, the session's scope, the initial location, and the initial mode (if any).
  The composing fibers are read; the derived available-operations and visible-entities are computed; the view record is inserted.
- *Update on event.* When an event occurs that affects the view (predications change at the location, the agent's authorization changes, a mode transition fires), the view's derived fields are recomputed.
  The recomputation produces a witness; the previous view state remains in the [event log](../../../objects/event-log.md) for replay.
- *Render.* A transport reads the view record and produces its presentation.
  The render is a read-only query, not a substrate mutation; multiple transports rendering the same view simultaneously see the same content.

## Position in the platform

The view record is the platform's *state-as-substrate-data* for what the agent currently experiences.
It is what lets multi-user platforms support multiple agents seeing different views of the same underlying content simultaneously, with each view's authorization and visibility independently determined by substrate predications.

The view record's existence as substrate content (rather than as runtime session state) is what makes session resume, federation, and audit straightforward: a resumed session's view is recomputed from the substrate's current state plus the session's persisted predications; a federated session can carry its view across hosts; an audit can replay the view's evolution by replaying the events that changed its composing fibers.
