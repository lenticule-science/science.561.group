---
title: Relational MUD Architecture
description: Describes MASH, a MUD-based architecture that unifies the agent harness, knowledge graph, and operational systems as an integrated virtual environment.
date-created: 2026-04-03
type: note
name: relational-mud
keywords:
  - mash
  - knowledge-graph
  - agent-harness
  - system-architecture
  - event-system
  - spatial-navigation
specialization: project
goal:
  - endeavor-resource-planning
  - paradigm-applications
  - ordering-first-computation
serves: [endeavor-resource-planning, paradigm-applications, ordering-first-computation]
campaign: build-the-coordination-substrate
serves-system: application
requires: [respond, knowledge-graph, spatial-navigation, fiber-rendering, mcp]
produces: [navigable-world, interactive-paradigm-demo, spatial-knowledge-interface]
depends-on: [fars-architecture-coherence, convergent-enrichment-plan, user-boundary-system]
sub-projects:
  - mash-tui
  - teraum-relational-mud
reference-implementations:
  - operations/engineering/fars/src/bussard/
prior-implementations:
  - operations/engineering/triage/software/fennel-gaz-mud/
  - operations/engineering/triage/software/fennel-mud/
  - operations/engineering/triage/software/fennel-marmud/
  - operations/engineering/triage/software/fennel-teraum-mud/
  - operations/engineering/triage/software/racket-mud/
  - operations/engineering/triage/software/racket-mud-ecosystem/
  - operations/engineering/triage/software/fennel-digital-garden-mud/
triage-sources:
  - operations/engineering/triage/content/buckets/tech/slop/2026-03-11/
  - operations/engineering/triage/content/buckets/tech/slop/2026-03-12/
  - operations/engineering/triage/content/relationality/domains/universes/semiotic-universe/
  - operations/command/personnel/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/
  - operations/engineering/fars/docs/terms/
  - library/theories/science/theories/relationality/theories/technology/theories/computing/
enabled-by: user-boundary-system
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---


The MUD is not a separate application — it is the interaction paradigm for all four computer systems. The agent harness already IS a MUD: the context-injector composes "room descriptions" (operational context) around each user action (prompt), the skill-matcher suggests available actions, and the knowledge graph makes the world navigable. You log in (start a session), you look around (context loads), you tell your party (agents) what to do.

The library IS the world — domains are rooms, terms are objects, texts are documents you can read. The operational records (tasks, plans, projects) live in the same world as the knowledge entities. This is MASH (Multi-Agent Semiotic Hub) — the virtual environment that emerges from agents operating on the FARS substrate.

**The architecture is proven.** The Teraum Racket MUD codebase (`operations/engineering/triage/software/teraum-racket-mud/`) demonstrates the identical data model: rooms are entities with names, descriptions, exits (relations), contents, actions, and trivia. The base `recipes.rkt` defines constructors (area, object, person) that match the library's type system (term, text, plan). See `library/.../multi-user-dungeons/the-mud-as-system-architecture.md` for the formal mapping. Decision record `001-convergence-through-minimum-viable-instance` recognizes the convergence.

**mash-engine IS the driver.** The Rust binary handles connections (tmux sessions), manages sessions (player objects), and reads the world state (EAVT datastore). The offices are the crew — each officer is a person in the MUD with specific capabilities. The first officer stands on the bridge and dispatches crew to work in different rooms. The daemon is the NPC that derives work from state.

What the project adds: spatial navigation in the TUI (replace tabs with rooms), multi-user login (`561 --as cassia`), and the event system that lets the world react to changes.

**Multi-user is a boundary system, not a feature.** The user-boundary-system plan (2026-04-04, enriched 2026-04-06) defines how humans project onto the system. `561 --as cassia` resolves cassia to a personnel entity, composes her fibers (personnel + office) via `message(cassia-lorne, {action: connect})`, and the settlement result IS the boundary.

**The interface is a programmable environment, not a command filter.** Analysis of technomancy's Bussard (operations/engineering/fars/src/bussard/) shows the right model: each user gets a "ship computer" — a computing environment with filesystem, REPL, modes, and editor — scoped by their boundary. The system (knowledge graph, agents, operations) is the "station" they connect to from their ship. MUD commands (look, go, tell) are one mode among many. See: bussard-interface-architecture.

## Computer system models to mine

The repo contains multiple models of computer systems developed at different times. Each contributes something. The project's first job is to survey and consume all of them:

- **TAB** — entity/attribute/behavior architecture, command system, dimension/systems, tick loop
- **FARS** — flatfile substrate, seven enabling conditions, how files ARE the system
- **Semiotic cell machine** — 12 files, cell-based computation (needs reading)
- **Event-stream record spec** — 6 files, event sourcing and integrity (needs reading)
- **Relational computer architecture** — full ISA, 30+ service specs
- **Old specifications** — 36+ files covering audit, concurrency, interface, networking, etc.
- **Emsemioverse engine** — earlier engine design (needs reading)
- **Decision records** — 11 numbered architectural decisions with rationale

Each model gets its own consumption plan with specific tasks for reading, evaluating, and connecting to operational records.
