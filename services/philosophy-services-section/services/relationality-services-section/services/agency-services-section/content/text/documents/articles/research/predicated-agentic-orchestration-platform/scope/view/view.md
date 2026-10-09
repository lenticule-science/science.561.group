---
type: concept
class: structure
depends-on: [agent, scope]
see-also: [authorization, dispatch]
title: View
description: What an agent (human or AI) sees of the substrate at a particular moment — the agent-substrate boundary expressed as a fiber composition.
---

# View

What an [agent](agent.md) (human or AI) sees of the substrate at a particular moment — the *agent-substrate boundary* expressed as a fiber composition.
A view is determined by composing the agent's identity predications, the agent's [office](office.md) capabilities, the agent's current scope and location predications, and any active [mode](mode.md) constraints.
The composition's result determines what entities are visible, what predicates are queryable, what operations are admissible.

A view is structurally distinct from the substrate's external boundary (which lives where the substrate meets external systems): a view is *intra-substrate*, defining what an agent that is itself a substrate entity sees of the rest of the substrate.
Different agents see different views of the same substrate, simultaneously and consistently.

Three engineering properties:

- **Transport-independent.** A TUI, a CLI, a web UI, an MCP host, an SSH session — all are renderings of the same view.
  The view composes the fibers; the transport renders them.
  Particular platform realizations may use any transport; the structural claim is that the *view itself* is substrate content, not transport content.
  An agent connecting via two transports simultaneously sees two consistent renderings of the same view.
- **Live, not static.** When the predications that determine the view change — the agent gains a new capability, the agent's location predicates change, an active mode is toggled — the view updates.
  The view is recomputed on the events that affect it, not loaded once at session start.
  The substrate's traversal operator queries the view at any moment to determine the current rendering.
- **Composed from substrate fibers, not from privileged tables.** The view's contents are derived through substrate operators applied to substrate entities — the agent's identity, the agent's office, the agent's current location entity, and the closure rules that compose them.
  There is no separate authorization-table, view-table, or session-cache that the substrate is unaware of; the view is what the substrate's operators produce when asked "what does this agent see?"

A view's *location* is itself a substrate predication on the view entity (or on the agent's session entity).
When the agent moves — issuing a `go` command, navigating to a new entity — the location predicate is updated, and the view's contents are recomputed at the new location.
Multi-user platforms have multiple views with different location predicates; each agent's view is independent of the others'.

A view is sometimes called a *boundary* in older homebrew vocabulary — the boundary between the agent and the substrate-they-act-on.
The terminology emphasizes the engineering content: this is a place where the agent's perspective composes with the substrate's content to produce a coherent rendering.
It is not a separate API surface; it is substrate content interpreted through the agent's predications.
