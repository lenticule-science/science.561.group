---
type: example
status: documented
instantiates: [agentic-orchestration-platform, session, tick, agent]
title: A Rust runtime for an agential orchestration platform
description: A working Rust implementation pairs an EAVT graph store, a session manager, a TUI dashboard, and a tick-driven daemon into an agential platform's runtime.
---

# A Rust runtime for an agential orchestration platform

A working Rust implementation pairs an EAVT graph store, a session manager, a TUI dashboard, and a tick-driven daemon into an agential platform's runtime.
The implementation is named *mash-engine* in its source; the engineering content is what matters here.
It demonstrates an [agentic orchestration platform](../objects/agentic-orchestration-platform.md) as a Rust binary that hosts agent [sessions](teaching/explanations/session.md), schedules them via a daemon [tick](teaching/explanations/tick.md), and exposes its operator state through a terminal UI.

This example traces the runtime's components and how each maps to a substrate-level concept.

## Component structure

The runtime decomposes into five modules:

- **`eavt`** — A writable EAVT (Entity-Attribute-Value-Time) graph store, persisted as JSON.
  Same serialization format as a knowledge-graph snapshot: `{"attrs": {"0": "name", ...}, "eavt": [[eid, aid, value], ...]}
  `.
  Entity IDs are stable hashes (FNV-1a seeded), attribute IDs are sequential and persisted in the attrs map.
  Per [predication-graph-store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md), this is a concrete realization of the substrate's predication store; per [hash-discipline](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md), entity-IDs are content-stable across runs.

- **`session`** — Per-session manager with daemon supervision.
  A session is a bounded interaction between an agent (Claude, Codex, etc.) and the platform; the manager spawns the agent, supervises its lifecycle, persists its state.
  Per [session](teaching/explanations/session.md) and [open-session](../morphisms/open-session.md), the manager realizes the substrate's session-as-substrate-content discipline: each session is an entity in the EAVT graph with predications recording its agent identity, work in flight, and witness chain.

- **`datastore`** — File-based persistence layer wrapping the EAVT graph.
  Per [source-of-truth](../../teaching/explanations/source-of-truth.md), the persisted form is authoritative; the in-memory representation is reconstructed from it on restart.

- **`tui`** — A Ratatui-based terminal dashboard.
  Per [boundary-as-fiber](../scope/boundary-as-fiber/boundary-as-fiber.md), the TUI is a *rendering* of the platform's view; the substrate's content is what the TUI presents, and changes to substrate content surface in the TUI on the next render.

- **`web`** — An optional HTTP exposure surface.
  Like the TUI, it is a transport adapter at the substrate's boundary; both surfaces render the same view.

## The CLI surface

The runtime's command-line interface exposes the platform's substrate-level operations:

- `mash-engine dashboard` — launch the TUI.
- `mash-engine start --task "..." --agent claude` — open a new session targeting an agent and a task.
  Per [open-session](../morphisms/open-session.md), this admits a session-creation event into the substrate.
- `mash-engine sessions` — list active sessions.
  Per [read-discipline](../../teaching/explanations/read-discipline.md), this is an output-producing walk at the I/O surface, returning a configuration of session entities.
- `mash-engine status [<session-id>]` — read substrate predications about session(s).
  Same read-discipline pattern.
- `mash-engine stop <session-id>` — admit a session-close event.
- `mash-engine daemon` — run the platform as a background daemon, ticking periodically.
- `mash-engine log <session-id>` — read session log content.

Each subcommand maps to one or a sequence of substrate operations.
The CLI is the boundary; the substrate is what it operates on.

## The tick loop

The daemon mode runs a periodic [tick](teaching/explanations/tick.md): walk active sessions, advance their state by one closure-rule application, persist the result, repeat.
Per [tick-advance](../tick/tick-advance/tick-advance.md), the tick is one closure-step on one entity; the daemon's loop is the [heartbeat](teaching/explanations/heartbeat.md) scheduler that sequences ticks across the platform's entities.

The tick's per-step cost is bounded by the substrate's locality contract (per [wavefront-and-locality](../../teaching/explanations/wavefront-and-locality.md)): each tick examines a bounded neighborhood of the session's entity, regardless of the platform's overall size.

## What the runtime does *not* implement

Per [driver-substrate-split](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/driver-substrate-split.md):

- **No agent-domain logic in the runtime.** The runtime does not encode "what a Claude session does" beyond launching the binary and routing input/output.
  The agent's behavior is governed by the agent's substrate-resident content (its [skill](teaching/explanations/skill.md) records, its [office](teaching/explanations/office.md) authority, its [authorization](../governance/authorization/authorization.md) fiber), not by runtime decisions.

- **No dispatch logic in the runtime.** When a task arrives, the runtime does not decide which agent to assign it to.
  Per [dispatch](teaching/explanations/dispatch.md) and [dispatch-from-properties](../dispatch/dispatch-from-properties/dispatch-from-properties.md), the dispatch is a substrate composition over capability fibers; the runtime invokes the substrate's dispatch primitive and routes the result.

- **No authorization subsystem.** The runtime does not maintain an authorization table separately from the substrate.
  Per [scope-as-predication](../../teaching/explanations/scope-as-predication.md), authorization is substrate content; the runtime queries the substrate at admission time.

## Position as an example

The mash-engine demonstrates an AgOP runtime in a host language different from the JavaScript implementations in [predication-algebra-engine](../../../examples/predication-algebra-engine.md), [filesystem-backed-substrate](../../../examples/filesystem-backed-substrate.md), and [mcp-exposed-substrate](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/mcp-exposed-substrate.md).
The two implementations are *interchangeable under the substrate's content*: a substrate's event log can be loaded by either runtime, and per [settlement-determinism](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), both produce byte-identical settled state.

The example also shows that AgOP-shaped concerns (sessions, agent supervision, tick scheduling, TUI rendering) are runtime concerns at the boundary, not substrate concerns at the algebra.
The substrate's content carries the program; the runtime carries the plumbing.
Two AgOP runtimes that target the same substrate content produce the same platform behavior, regardless of host language, terminal capabilities, or process supervision strategy.
