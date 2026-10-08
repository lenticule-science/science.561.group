---
name: project_rust-capability-shift
description: mash-engine (Rust TUI + EAVT graph store) exists and runs on persistent VPS — plans involving local services, daemons, and real-time systems are now unblocked
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_rust-capability-shift
---

As of 2026-04-04, the system has a compiled Rust binary (`mash-engine`) at `operations/engineering/fars/mash-engine/` with:
- ratatui TUI dashboard (tabs: Overview, Sessions, Graph, Help)
- EAVT graph store (sessions + ops data in same format as knowledge graph, no SQLite)
- EAVT datastore reader (queries 11k+ entities from knowledge-graph.json)
- Datastore MCP server (5 tools: search, entity, stats, query, sessions)
- Background daemon with heartbeat monitoring
- tmux launcher (`561` command) that starts everything from any SSH session

**Why:** This means plans that say "requires persistent process" or "blocked by VPS" are now unblocked. The Rust binary can grow into the local service system, the MUD server, the relational engine — all as one thing.

**How to apply:** When evaluating plan readiness or proposing work, factor in that we now have a compiled, running service with database access and TUI. Don't treat these capabilities as future — they exist. Also: ECC Rust skills (rust-patterns, rust-testing) and agents (rust-build-resolver, rust-reviewer) are installed in the harness.
