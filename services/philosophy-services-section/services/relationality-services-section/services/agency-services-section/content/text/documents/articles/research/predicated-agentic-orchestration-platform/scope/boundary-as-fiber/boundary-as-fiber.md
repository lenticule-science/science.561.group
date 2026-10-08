---
type: narrative
status: current
recaps: [view, authorization]
introduces: []
title: The boundary is a fiber, not a transport
description: Two questions about a multi-actor system get conflated.
---

# The boundary is a fiber, not a transport

Two questions about a multi-actor system get conflated.
The first is *what does this actor see?* — the boundary, the projection, the visible region.
The second is *how is the actor connected?* — the transport, the protocol, the rendering.
The conflation is the assumption that answering the second answers the first: a TUI, a CLI, a web UI, an MCP host, an SSH session each *defines* what the actor on the other side sees, because each is the actor's interface to the system.

The substrate's commitment is the opposite.
The boundary is substrate content — a fiber composition over the actor's identity, the actor's office, the actor's current location, the actor's mode, the active scope's policy.
The transport is the rendering of that fiber to bytes the actor's terminal can display.
They are different substrate concerns, and conflating them is the source of an entire class of engineering pathologies.

Consider what conflation produces.
A TUI shows the actor a particular set of commands; the actor switches to MCP and gets a different set.
A web session shows certain entities; an SSH session to the same actor's account shows different entities.
Authentication checks live in the TUI's wrapper; the web session has its own; the MCP host has a third.
Each transport reimplements the boundary in its own shape, and the three implementations drift.
The actor's experience depends on which door they came in through, not on who they are.

The substrate's resolution is to make the boundary a [view](../view/view.md) — a substrate-level structure, derivable from substrate content alone, that determines what the actor sees regardless of transport.
The view is composed from:

- The actor's identity predications (who the actor is).
- The actor's [office](../teaching/explanations/office.md) predications (what authority and capability the actor carries).
- The actor's current location predication (which entity the actor is "at" — for human actors, often a notional spatial location like a "room" or "context"; for agents, often the entity they are currently operating on).
- The actor's [mode](../teaching/explanations/mode.md) predications (whether the actor is in plan mode, act mode, observation-only mode, etc.).
- The substrate's [scope](../scope.md) policy (what the scope admits regardless of actor).

The fiber composition's result is the view's content: which entities the actor sees, which predicates are queryable, which operations are admissible.
The transport's job is to render this content — as TUI text, as a web page, as an MCP response, as JSON over a socket.
Different transports render the same view differently; the underlying view is identical.

Software prior art that does this well treats the boundary as composed from layered fibers.
Multi-layer simulation games where the player's interface is determined by their character class, their current location, and their party composition — three distinct fibers, composed at every action.
Multiplayer text-based worlds where the player's available commands come from their guild plus their character's individual abilities — additive composition.
Mode-bound coding agents where switching modes literally removes write tools from the actor's available set — the boundary's `writable` aspect changes by mode, transport-independently.
Each system makes the same architectural move: the boundary is a fiber, and the transport renders it.

Several engineering consequences follow:

- **Transport changes don't change behavior.** An actor switching between TUI and web sees the same view, because the view is substrate content, not transport content.
  New transports can be added without changing the boundary's semantics.
- **Boundary changes are predication edits.** Granting an actor a new capability is inserting a predication on their office or personnel record.
  The view recomputes on the next access; the actor sees the new capability immediately, regardless of transport.
  There is no "deploy a new permission" step.
- **Boundaries compose.** When an actor's office capability is one fiber and the actor's individual privileges are another, the view composes both — additive composition produces the actor's effective capability.
  Per [authorization](../../governance/authorization/authorization.md), the four Hohfeldian positions (powers, duties, privileges, immunities) compose at the substrate level; the view inherits the composition.
- **Multi-presence is consistent.** An actor connecting via two transports simultaneously sees two consistent renderings of the same view, because both renderings derive from the same substrate fiber.
  The traditional pathology — "I see one thing on the desktop app but another on the web" — is structurally impossible when the boundary is substrate content.
- **Boundaries are live.** When the substrate's content changes — the actor's office gains a power, the actor's location updates, the active mode toggles — the view recomputes.
  The view is not loaded once at session start; it is recomputed on the events that affect it, per the substrate's traversal operator.
- **Audit covers boundary access.** Per [witness](../../../teaching/explanations/witness.md), every operation through the view produces a witness; the witness records the view's content at the moment of the operation.
  Reconstructing what an actor saw at a past moment is reading past substrate state — the witnesses cite the view, the view derives from past predications, the past predications are in the [event log](../../../objects/event-log.md).

The discipline's hard edge is a refusal to put boundary logic in transport code.
A TUI that has its own filter for which entities to show, separate from the substrate's view, has erected a parallel boundary the substrate is unaware of.
The result is the drift pathology: the TUI's filter and the substrate's view diverge silently.
The substrate's response is to make the view the only place boundary logic lives, and to make every transport ask the substrate's view operator what to render.

The pattern composes with [federation](../teaching/explanations/federation.md): when an actor crosses substrates, the destination substrate composes the actor's incoming identity claim with its local capability content, producing the actor's view at the new substrate.
With [sessions](../teaching/explanations/session.md): a session is the substrate's record of a particular actor's view-history within a bounded time region.
With [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md): an agent's view is itself substrate content, so an agent can introspect its own boundary, compute what it would see at a different location, or compose an alternative view to reason about.
None of these requires additional infrastructure; each is the same substrate composition discipline applied at a different boundary.

The result is a substrate where what an actor sees is *what the substrate's algebra says they see*, not what the transport happens to show them.
The transport surface has shrunk to rendering; the boundary is substrate content, evaluated by substrate operators, witnessed in the substrate's audit trail.
