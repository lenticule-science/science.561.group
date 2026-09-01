---
title: "Design principles for predication from TAB, Bussard, and the foundational ontology"
specialization: analysis
date-created: 2026-04-07
serves: [system-architecture-refactor, operations-loop, charter-and-governance]
sources-read:
  - operations/engineering/toys/tab/engine/models/thing.fnl
  - operations/engineering/toys/tab/engine/models/container.fnl
  - operations/engineering/toys/tab/engine/models/dimension.fnl
  - operations/engineering/toys/tab/engine/behaviors/thing.fnl
  - operations/engineering/toys/tab/engine/behaviors/container.fnl
  - operations/engineering/src/bussard/server.fnl
  - operations/engineering/src/bussard/client/init.fnl
  - operations/engineering/src/bussard/client/disk/init.fnl
  - operations/engineering/src/bussard/client/disk/flight.fnl
  - operations/engineering/src/bussard/client/disk/repl.fnl
  - operations/engineering/src/bussard/client/disk/ssh.fnl
  - operations/engineering/src/bussard/os/orb/sandbox.lua
  - operations/engineering/src/bussard/os/orb/shell.lua
  - operations/engineering/src/bussard/os/orb/session.lua
  - library/terms/thing.md
  - library/terms/container.md
  - library/domains/humanities/domains/sociology/domains/work/terms/office.md
  - library/domains/humanities/domains/sociology/domains/work/terms/plan.md
  - library/domains/humanities/domains/sociology/domains/work/terms/task.md
---

# Design Principles for Predication

How to write better frontmatter, derived from studying TAB, Bussard, and the foundational ontology. These are not new concepts to implement — they are principles for choosing predicates when writing any entity.

## 1. Containment is generic

TAB: `container → {:base :thing, :contents []}`. A room contains objects. A bag contains items. The container behavior (`receive-object`, `remove-object`, `search-contents`) works on any container regardless of what it contains.

**Principle:** When an entity holds other entities, use the same predicates the library's container term uses: `contents`, `can-contain`. A plan containing tasks, a department containing offices, a ship containing departments — all use `contents`. Don't invent `tasks:` on a plan when `contents:` already means the same thing and connects to the container algebra. Moving a task between plans is then the same graph operation as moving anything between any containers.

**What this changes about frontmatter:** Write `contents: [task-a, task-b]` on a plan, not `tasks: [task-a, task-b]`. Write `contents: [first-officer, operations-officer]` on a department, not `offices: [first-officer, operations-officer]`. The type of the contained thing is already on the contained thing — the container doesn't need to redundantly encode it.

## 2. Scope is a list of entity references, not a prose description

Bussard: the sandbox is a Lua table. `safe-globals` is `[:assert :error :next :pcall ...]`. The ship sandbox contains exactly `ship`, `bodies`, `fs`, `editor`, and the safe globals. Nothing else exists. The station sandbox wraps every file operation with `if_readable(env.USER, ...)`. What you can access IS what's in the table.

**Principle:** When an entity has a scope or domain, express it as entity references, not prose. An office's action domain should be `scope: [plan, task, project, event]` — the entity types it can touch. Not `action-domain: "Work management — plans, tasks, projects, events, tracking, metrics"`. The string is human-readable but not traversable. The list of entity references IS the sandbox — what the office can compose with via `respond()`.

**What this changes about frontmatter:** Write `reads: [status, depends-on, assigned-to]` and `writes: [status, event]` as predicate names that are themselves entity references or at least controlled vocabulary. Not `channels-read:` with prose descriptions. The reads/writes lists ARE the permission table — the same way Bussard's `io.readfile = fs.if_readable(...)` IS the read permission.

## 3. Inheritance accumulates additively

TAB: `additive-attributes: [:additive-attributes :behaviors]`. When a container extends thing, it gets thing's behaviors PLUS container's behaviors. Not instead of — in addition to. The child adds; the parent persists.

Bussard: SSH mode's parent is REPL mode, whose parent is console mode, whose parent is base mode. Each child gets all parent keybindings plus its own. `ctrl-o` (open file) works in every mode because it's defined on base.

**Principle:** When an entity extends another, predicates that represent capabilities should accumulate, not override. An office that extends another office gets the parent's duties PLUS its own. A mode that extends another gets the parent's available actions PLUS its own. Use `extends:` and expect the consuming code to merge additively on predicates that represent capabilities, constraints, or vocabulary.

**What this changes about frontmatter:** When writing an office that reports to another, don't restate the parent's constraints — reference the parent via `extends:` or `reports-to:` and trust that the graph will accumulate. The first officer's `binding-rules` don't need to be restated on every office that reports to the first officer — they inherit through the chain.

## 4. The engine is just another thing in the container

TAB: `dimension → {:base :thing, :behaviors [:dimension]}`. The game engine — the thing that runs the tick, processes all entities, drives the simulation — is a thing. It's in the world, not above it. It has a name, behaviors, and attributes like anything else. You can look at it, describe it, modify it.

**Principle:** The department that runs the operations loop is an entity with the same predicates as everything else. It is not a special administrative layer. It has `type: department`, it has `contents`, it has `extends: container`. Its tick behavior is a predicate. When `message(department, {tick: true})` fires, the department processes its contents the same way any container processes its contents — through the container behaviors, composed with the department's specific behaviors.

**What this changes about frontmatter:** Write the operations department as an entity in `operations/command/` with the same frontmatter structure as any other entity. Don't treat it as infrastructure that exists outside the graph. It IS in the graph. It can be queried, composed with, settled. `message(operations-command)` should return the department's fiber — its offices, its work queue, its current state — the same way `message(first-officer)` returns the first officer's fiber.

## 5. Values, not types

Bussard: a ship is `{:name name, :x 0, :y 0, :heading 0, :mass 16}`. Not a Ship class with methods. A table with keys. A mode is `{:name "flight", :parent "base", :map {...}}`. Not a Mode class. A table.

TAB: a thing is `{:name :thing, :behaviors [:thing]}`. Four keys. Everything else is instances with more keys.

**Principle:** An entity's predicates ARE the entity. There is no type system layered on top. The `type:` predicate is just another predicate — it helps the graph find related entities, but it doesn't activate special code paths. A plan with `type: plan, contents: [task-a, task-b], goal: "..."` IS a plan because of its predicates, not because of a Plan class. If you added the same predicates to a thing that didn't say `type: plan`, it would still behave like a plan when composed with other entities — because the algebra operates on predicates, not on types.

**What this changes about frontmatter:** Stop worrying about getting the type taxonomy right. Write the predicates that describe the thing. If it contains other things, give it `contents`. If it has duties, give it `duties`. If it reads certain predicates, give it `reads`. The type is a convenience label, not a load-bearing structure. The predicates ARE the structure.

## 6. Communication is messages through named conduits

Bussard: ship-to-server is `client:send :update data`. Server-to-ships is `socket:sendToAll :positions data`. Ship-to-station is `love.thread.newChannel()` — a named queue. SSH sends `{op: "stdin", stdin: input}` and receives `{op: "stdout", out: output}`.

**Principle:** When entities communicate, name the conduit. An office dispatching work to another office should reference the channel: `channel: dispatch`. An event being recorded should name its channel: `channel: events`. The channel is an entity (or at minimum a controlled vocabulary term) that the graph can traverse. Not just `assigned-to: researcher` but `{action: assign, channel: dispatch, target: researcher, source: first-officer}` — the message carries its routing.

**What this changes about frontmatter:** Events in events.jsonl should have a `channel` field. Duty discharge should name the channel through which discharge is reported. Office-to-office communication should reference named channels, not implicit conventions.

## 7. The tick is dead simple

Bussard server update: iterate bodies, update orbits, update gravity, update autopilots, send positions. TAB dimension tick: iterate systems, call update on each. No scheduling framework. No priority queues. No complex dispatch. Just: for each thing in this container, process it.

**Principle:** The operations loop tick should be equally simple. For each office in the department, check: does it have assigned work? Is the work in a state that needs action? If yes, process it. The "processing" is a `message()` — compose the office's fiber with the work's fiber, check what happens. Settlement cascades handle the rest.

**What this changes about frontmatter:** Don't over-engineer the workflow. The department has `contents` (offices). Each office has `assigned-work` (entity references to tasks). The tick walks the contents, checks the assigned-work, and messages. The predicates for this are: `contents`, `assigned-work`, `status`. Three predicates. Not a workflow engine.

## Summary

These seven principles are about writing better predicates, not building new infrastructure:

1. Use `contents` for containment — same predicate everywhere
2. Use entity reference lists for scope — not prose descriptions
3. Let capabilities accumulate through `extends` — don't restate
4. The department is a thing in the graph — not a special layer
5. Predicates ARE the entity — types are labels, not mechanisms
6. Name the communication channel — messages carry their routing
7. The tick is simple iteration — don't over-engineer workflow

Every entity written from now on should follow these principles. The result: entities whose frontmatter is maximally computable because the predicates are entity references the algebra can traverse, not strings that require interpretation.
