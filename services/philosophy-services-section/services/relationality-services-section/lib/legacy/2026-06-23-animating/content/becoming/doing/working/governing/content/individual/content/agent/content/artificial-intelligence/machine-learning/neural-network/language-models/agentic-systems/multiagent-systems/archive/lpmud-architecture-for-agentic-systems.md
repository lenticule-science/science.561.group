---
title: "LPMud Architecture for Agentic Systems"
description: "Source-level analysis of FluffOS and the Discworld mudlib, mapping MUD architectural patterns onto the 561 agentic system. Driver/mudlib, object lifecycle, heartbeat, shadows, commands, guilds, and communication channels."
date-created: 2026-04-04
domain: computing
sources:
  - "https://github.com/fluffos/fluffos"
  - "https://github.com/quixadhal/discworld"
related:
  - "../terms/multi-user-dungeon.md"
  - "the-mud-as-system-architecture.md"
---

This text is a source-level analysis of two production LPMud codebases — FluffOS (the C++ driver) and the Discworld mudlib (the LPC world library) — read specifically for patterns applicable to the 561 agentic system. The mapping between MUD architecture and our system is structural, not metaphorical: the same data structures, the same separation of concerns, the same lifecycle patterns.

## The Driver/Mudlib Separation

The deepest architectural pattern in LPMud is the clean split between the **driver** (a C/C++ runtime that provides primitives) and the **mudlib** (an LPC library that builds the world from those primitives). FluffOS defines its primitive interface through `.spec` files in `src/packages/`:

```c
// core.spec — the contract between driver and mudlib
object clone_object _new(string, ...);
void move_object(object | string);
int call_out(string | function, int|float, ...);
void set_heart_beat(int);
```

Each `.spec` entry maps an LPC function name to a C++ implementation. The compiler validates calls against these specs at compile time. The mudlib never touches driver internals; the driver never assumes mudlib structure.

**The parallel.** `mash-engine` (our Rust binary) is the driver. It provides session management, the EAVT graph store, event dispatch, and the world-tick. The agentic harness — skills, hooks, agents, commands, rules — is the mudlib. The harness never touches engine internals; the engine never assumes harness structure. The MCP tool interface is our `.spec` file: a typed contract between layers.

Where we diverge: LPMud's driver compiles and executes LPC bytecode. Our driver dispatches to external LLM sessions. The execution model differs; the separation of concerns is identical.

## Object Lifecycle: Create, Inhabit, Destruct

Every LPC object follows a lifecycle managed by the driver. FluffOS's `simulate.cc` implements the core operations:

1. **Load**: compiled bytecode loaded from disk, linked into the global object list
2. **Clone**: `clone_object()` allocates a new object from a master template, calls `create()` with arguments
3. **Move**: `move_object()` updates environment pointers, calls `init()` on affected objects
4. **Destruct**: `destruct_object()` removes from environment tree, marks `O_DESTRUCTED`, decrements references

The object structure (`object.h`) holds it together:

```c
struct object_t {
  uint32_t ref;           // reference counting
  unsigned short flags;   // O_CLONE, O_DESTRUCTED, O_HEART_BEAT
  const char *obname;     // file path identity
  program_t *prog;        // compiled bytecode
  object_t *next_inv;     // inventory linked list
  object_t *contains;     // head of inventory
  object_t *super;        // container/environment
  svalue_t variables[1];  // variable storage
};
```

Objects exist in an environment tree. Every object has a `super` (its container) and optionally `contains` (its inventory). Rooms contain objects, objects contain objects. Movement is pointer reassignment in this tree.

**The parallel.** Our entities in the knowledge graph follow the same pattern. An entity is created (added to the graph), inhabits a context (domain membership, plan containment), and can be destructed (archived or removed). The EAVT store is our global object list. Entity relations — `part-of`, `belongs-to`, `contains` — form the environment tree.

What we lack: explicit `create()` and `init()` hooks on entity creation. When a new term is added to the graph, there is no automatic callback that runs initialization logic (checking for duplicates, validating frontmatter, triggering cross-references). FluffOS does this automatically. We should.

## The Heartbeat: Periodic World Processing

FluffOS's heartbeat system (`heartbeat.cc`) provides periodic execution for any object that subscribes:

```c
struct heart_beat_t {
  object_t *ob;
  short heart_beat_ticks;
  short time_to_heart_beat;
};
```

Objects call `set_heart_beat(1)` to subscribe. Every tick (configurable via `__RC_HEARTBEAT_INTERVAL_MSEC__`), the driver iterates all subscribed objects and calls their `heart_beat()` function. Objects can set different intervals. The driver handles cleanup of destructed objects automatically.

The execution loop in `call_heart_beat()` is methodical: merge pending subscriptions, iterate the queue, skip destructed objects, decrement tick counters, call `heart_beat()` on objects whose counter reaches zero, catch errors without crashing the loop.

**The parallel.** Our `mash-engine` has a `world_tick` that maps directly. The daemon's tick loop is the heartbeat. Scheduled agents, cron triggers, and autonomous loops are objects with heartbeats. The continuous learning observer is a heartbeat subscriber.

What the MUD does better: fine-grained tick intervals per object. Our world-tick is currently one frequency for everything. An NPC that wanders every 30 seconds and a torch that burns down every 5 minutes can have different heartbeat intervals. Our scheduled agents should support the same — some duties need minute-level polling, others need hourly review.

## call_other(): Inter-Object Messaging

The `call_other()` efun is how one LPC object invokes a function on another. From `efuns_main.cc`:

```c
void f__call_other() {
  // Validate caller isn't destructed
  if (current_object->flags & O_DESTRUCTED) { push_undefined(); return; }
  
  // Resolve target: object reference, name string, or array of objects
  // Resolve function name
  // Track origin as ORIGIN_CALL_OTHER for security
  // Call via apply() and return result
}
```

Key features: the call tracks its origin (`ORIGIN_CALL_OTHER` vs `ORIGIN_LOCAL` vs `ORIGIN_DRIVER`), supports targeting by name or reference, can broadcast to arrays of objects, and validates that neither caller nor target is destructed.

The Discworld mudlib builds on this extensively. Handler objects are singletons accessed via macros:

```c
#define PLAYER_HANDLER "/obj/handlers/player_handler"
#define SKILL_OB "/std/skills"
PLAYER_HANDLER->test_user("wizard");
```

**The parallel.** MCP tool calls are `call_other()`. When the harness calls `graph_search` on the 561-datastore, that is one object (the agent session) invoking a function on another object (the MCP server) with origin tracking and result return. The typed tool interface is the function signature; the MCP protocol is the calling convention.

What we should adopt: the origin tracking pattern. FluffOS knows whether a function was called locally, by another object, by the driver, or by a simul_efun. We should track whether a tool call originated from a hook, a skill, an agent, a command, or the user directly. This matters for security policy and for understanding causation in the event log.

## Shadows: Behavioral Overlay Without Modification

The shadow system lets objects intercept function calls to another object without modifying it. From FluffOS:

```c
// shadow(target, 1) makes current_object shadow target
current_object->shadowing = ob;
ob->shadowed = current_object;
```

Shadows form a linked chain. When `call_other()` targets a shadowed object, the shadow gets the call first. It can intercept (handle the call itself), modify (change arguments and delegate), or pass through (let the call reach the original object). Multiple shadows stack.

The driver validates shadowing permissions via `validate_shadowing()` — not any object can shadow any other.

**The parallel.** Our hooks and skills are shadows. A pre-tool-use hook intercepts a tool call before it reaches the target. A skill overlays behavior onto the agent without modifying the agent's core prompt. The hook chain — pre-tool-use hooks fire in sequence before the tool executes — is a shadow chain.

What we should adopt: the explicit chain model. FluffOS shadows are bidirectional linked lists with clear ordering. Our hooks fire in settings.json order, but we have no formal model of hook priority, no way for one hook to depend on another's output, and no `validate_shadowing()` equivalent that controls which hooks can intercept which tools.

## Command Parsing: User Input to Function Dispatch

FluffOS provides a two-layer command system. The driver layer (`add_action.cc`) implements `add_action()` for verb registration and `user_parser()` for dispatch:

```
User types "tell wizard hello"
  → user_parser() extracts verb "tell"
  → searches environment chain for add_action("tell", ...)
  → calls registered function with "wizard hello" as argument
```

The environment chain search is spatial: the driver looks for matching actions on the current object, its container, sibling objects, and up through parent containers. Commands are discovered by *where you are*.

The Discworld mudlib adds a sophisticated pattern matcher on top (`new_parse.c`):

```c
add_command("tell", "<indirect:player> <string'message'>", :do_tell:);
```

The pattern `<indirect:player>` tells the parser to find player objects matching the next word. `<string'message'>` captures the rest as a string. The parser resolves object references, handles ambiguity ("which wizard?"), and passes typed arguments to the handler.

**The parallel.** Our slash commands are `add_action()` registrations. `/commit`, `/standup`, `/bridge` — each registers a verb with a handler function. The CLAUDE.md command table is our action registration file.

What we should adopt: the pattern-based argument parsing. Currently our commands get raw string arguments. The Discworld pattern system — `<indirect:entity>`, `<direct:object>`, `<word>`, `<string>` — would let us write commands like:

```
/dispatch <agent:name> <task:id>
/record-event --action <word> --subject <entity:id>
```

And have the parser resolve entity references against the knowledge graph before the command handler runs. This is strictly more powerful than string splitting.

The spatial discovery pattern also applies: in a MUD, the commands available to you depend on the room you are in. In our system, the commands available could depend on the domain you are working in — gardening commands when in the gardening domain, financial commands when in the bookkeeping context.

## Guilds and Skills: Capability Progression

The Discworld mudlib implements a hierarchical skill tree (`skills.h`):

```c
// Skill tree structure
covert
  ├─ stealth (inside, outside, underwater)
  ├─ hiding (person, object)
  ├─ lockpick (doors, safes, traps)
  └─ manipulation (palming, passing, sleight-of-hand, stealing)
```

Each skill tracks level and experience. The living object's `query_skill_bonus()` computes the effective skill level from raw level + stat bonuses + guild bonuses + race bonuses, with caching for performance.

Guilds are objects that attach to players and modify their capabilities:

```c
guild->query_skill_bonus(lvl, skill);  // Guild modifies effective skill
```

Players join guilds, which unlock skill paths and provide bonuses. Advancement requires practice (XP accumulation) and sometimes training from NPCs (`teach_skill()`).

**The parallel.** Our Academy concept maps to guilds. An agent's skills (writing-terms, research-survey, etc.) are its skill tree. The continuous learning system — observing sessions, detecting patterns, creating instincts that evolve into skills — is XP accumulation leading to skill advancement.

What we should adopt:

1. **Skill prerequisites.** The Discworld skill tree has branches — learning `lockpick.traps` requires some level in `lockpick`. Our skills are currently flat. Some should depend on others: `writing-philosophy-surveys` should require familiarity with `writing-surveys`.

2. **Stat bonuses.** A Discworld character's intelligence bonus improves all magic skills. An agent's model tier (haiku/sonnet/opus) should similarly provide baseline capability bonuses — opus gets a bonus on research tasks, haiku on simple lookups.

3. **Teaching.** NPCs teach skills to players. Senior agents could teach capabilities to junior agents — an opus agent that develops a new instinct can formalize it as a skill that haiku agents can use.

## Communication: Channels and Social Points

The Discworld mudlib implements layered communication:

- **say**: broadcasts to current room (all objects in the same container hear it)
- **tell**: private message to a specific player, costs 1 social point
- **shout**: broadcasts to multiple rooms, costs 10 social points
- **emote**: action description visible to current room

Messages are structured as `class message` objects with text, emote prefix, language, type, and status. The communication system tracks social points — a resource that regenerates over time and limits communication frequency.

The event system routes messages: `event_person_tell()`, `event_listen_shout()`. Objects register for events they care about.

**The parallel.** Our MCP channels are tells (direct tool calls to specific servers). Agent-to-agent messaging via the dispatch system is tell. The event log is say — broadcasting to whoever is listening. The session log is a persistent chat room.

The social points concept is unexpectedly relevant. In our system, the resource that limits communication is tokens — context window budget. A "shout" (broadcasting context to all agents) is expensive; a "tell" (targeted dispatch to one agent) is cheap. We already implicitly have social points; we should make the accounting explicit.

## The Simul_Efun Pattern: Library-Level Primitives

FluffOS distinguishes between efuns (built-in C++ functions) and simul_efuns (LPC functions that look built-in):

| Aspect | Efun | Simul_Efun |
|--------|------|-----------|
| Implementation | C++ in driver | LPC in mudlib |
| Performance | Very fast | LPC overhead |
| Customization | Recompile driver | Edit LPC code |

The simul_efun object (`simul_efun.c`) inherits utility modules and makes them available as if they were driver primitives:

```c
inherit "std/json";
inherit "std/break_string";
// These functions now callable as if built-in
```

**The parallel.** Our efuns are the MCP tools provided by `mash-engine` — `graph_search`, `record_event`, `dispatch_report`. Our simul_efuns are the JavaScript tools in `operations/engineering/fars/` — `dispatch-work.js`, `query-library-graph.js`. They wrap driver primitives into higher-level operations.

The distinction matters for the same reason: simul_efuns can be modified without recompiling the driver. Our JS tools can be modified without rebuilding the Rust binary. The install.js script that composes the harness is the simul_efun loader — it makes library-level tools available as if they were primitives.

## The Login Flow: Onboarding as State Machine

The Discworld login system (`secure/login.c`) implements character creation as a formal state machine:

```c
class state {
  string name;       // state identifier
  string action;     // function to call
  string write;      // text to display
  int noecho;        // hide input (passwords)
  mapping events;    // event => next_state transitions
}
```

States transition on events: `"input-ok"` → next state, `"input-fail"` → error state. The master object's `connect()` clones a login object for each new connection, which runs the state machine until the player object is fully initialized.

**The parallel.** Our session start is our login flow. The `session-start.js` hook, the CLAUDE.md loading, the memory index — these are the login state machine. But ours is ad hoc where the MUD's is formalized.

What we should adopt: an explicit state machine for session initialization. Instead of a flat hook that dumps everything, a sequence of states:

1. Load identity (SOUL.md, AGENTS.md)
2. Load memory index
3. Check session continuity (previous session log)
4. Load relevant context for current task
5. Dispatch standing duties

Each state can branch based on what it finds. A session that continues previous work loads different context than a fresh session.

## What We Should Adopt

The analysis yields concrete adoption targets, ordered by leverage:

### Immediate (infrastructure exists, pattern is clear)

1. **Origin tracking on tool calls.** Tag every MCP call with its origin: hook, skill, agent, command, user. Log the origin. Use it in security policy.

2. **Per-object heartbeat intervals.** Let scheduled agents and autonomous loops declare their own tick frequency rather than inheriting one global interval.

3. **Entity lifecycle hooks.** When a new entity enters the knowledge graph, fire `create()` callbacks — validate frontmatter, check for duplicates, update indexes. When an entity is removed, fire `destruct()` callbacks.

### Medium-term (requires design work)

4. **Pattern-based command arguments.** Parse command arguments against the knowledge graph: `<entity:id>`, `<agent:name>`, `<plan:id>` as typed argument slots that resolve before the handler runs.

5. **Contextual command discovery.** Make available commands depend on the current working context — domain-specific commands appear when working in that domain.

6. **Explicit shadow chain for hooks.** Model hook ordering, priority, and dependency. Let hooks declare what they intercept and what they pass through.

### Long-term (Academy / capability system)

7. **Skill prerequisites and trees.** Structure skills hierarchically with dependencies. `writing-philosophy-surveys` requires `writing-surveys` requires `writing-texts`.

8. **Model-tier bonuses.** Formalize that opus agents get bonuses on research and architecture, sonnet on implementation, haiku on lookups and dispatch.

9. **Token budgets as social points.** Make context-window consumption an explicit resource with per-action costs and regeneration (new session = full social points).

## Conclusion

The LPMud architecture is not a metaphor for what we are building — it is the architecture we are building, discovered independently through 40 years of multi-user virtual world engineering. FluffOS and the Discworld mudlib are production codebases that solved the same problems: how to separate a runtime engine from its behavior library, how to manage object lifecycles in a persistent world, how to route messages between autonomous entities, how to parse natural-language commands, and how to grow capabilities over time.

The source code is now available for reference at `operations/engineering/fars/src/fluffos/` and `operations/engineering/fars/src/discworld-mudlib/`. These should be consulted whenever designing mash-engine features, harness architecture, or the TUI navigation system.
