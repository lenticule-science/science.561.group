---
title: MASH Primitives and the Tick
description: Examines candidate primitives for MASH—relating, transaction, trace—and argues the tick cycle, not object types, is fundamental.
date-created: 2026-04-04
type: note
name: primitive-hierarchy
keywords:
  - mash-primitive
  - tick-cycle
  - relating
  - entity-hierarchy
  - processual-database
specialization: idea
serves: endeavor-resource-planning
relates-to:
  - relational-architecture-grounding
  - fars-mash-as-packages
  - all-records-are-transactions
aliases:
  - Primitive Hierarchy — What Each Layer Adds
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

## Captain's words (2026-04-04)

> We "entity" as a kind of ontological primitive, we have resource as a fars primitive, I'm wondering if cell isn't our mash primitive, or... I don't think that's right, actually.

> I suspect looking at our old ideas related to "cellular computer system" might be relevant. We've grown a much more basic/agnostic computer system than we are actually seeing, because we've been so focused on using it for the specific work of orchestrating teleology into workflows, actions, change, etc.

## The existing spec hierarchy

From the semiotic cell machine specs in triage:

- **Cell** (CDS) — a closed-world JSON object packaging: site (topology), fibers with σ/Δ, RTL signature, constructors, laws. Self-contained universe.
- **Node** (node.md) — a long-running process owning cells, running the Closure Engine, exposing RPC. Has cycles: store/fetch, apply/refine, merge, shutdown.
- **GFRTU** — the Generative Fibered Recognition Trace Universe. The mathematical object from which cells are localized pieces.

## What we actually built

- **FARS**: files with frontmatter → composed into knowledge graph. Primitive = file/entity.
- **MASH**: daemon + EAVT graph + MCP + events/transactions. mash-engine IS a node in the spec sense — it owns storage, runs closure (world tick), exposes services (MCP).

## The question: what's the MASH primitive?

The captain's instinct that "cell" isn't quite right is correct. A cell is a whole closed universe with internal dynamics — that's more like a domain or project, not an individual entity.

**Entity** is the FARS primitive — a thing-with-attributes, inert, described.

**Resource** is the FARS accounting primitive — a thing-that-can-be-tracked. Entities can be resources.

What MASH adds is not a new kind of thing but a new kind of *happening*: **relating**. The dual σ/Δ structure where every record both IS something (saturated state) and DOES something (transfer between accounts). MASH entities don't just exist — they participate in processes.

Possible MASH primitives:
- **Relating** — the processual primitive. Every MASH event is a relating.
- **Transaction** — the accountable relating. What moved, from where, to where.
- **Trace** — the temporal primitive. A session is a trace through the system's state space.

Or maybe the primitive ISN'T a type of object at all. Maybe the MASH primitive is the **tick** — the heartbeat cycle that makes everything happen. Without the tick, you have FARS (static files). With the tick, you have MASH (dynamic relating). The node-cycle spec says exactly this: a node is a process that runs cycles.

## What we're not seeing

The captain says we've built something more basic/agnostic than we realize. That rings true. The EAVT graph + events + daemon tick + MCP is a general-purpose graph-processing system with:
- append-only event log (JSONL)
- materialized graph view (EAVT)
- periodic closure/consistency checking (world tick)
- query/mutation API (MCP)
- double-entry accounting on all state changes

This isn't just "an ops tool for orchestrating AI agents." It's a processual database with built-in accounting. The cellular specs describe the mathematical ideal of what this system is the practical implementation of.
