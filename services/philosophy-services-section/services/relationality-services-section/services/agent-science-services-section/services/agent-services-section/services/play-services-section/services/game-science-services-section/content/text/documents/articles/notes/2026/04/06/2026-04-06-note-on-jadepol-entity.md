---
title: Jadepol as NPC Entity
description: Proposes making Jadepol a graph entity whose speech results from composing watched events with fiber predicates.
date-created: 2026-04-06
type: note
name: jadepol-entity
keywords:
  - npc-entity
  - fiber-composition
  - graph-entity
  - event-driven
  - mash-tick
specialization: plan
application: world-sim
project: sunday-funday-sprint
---

## What Jadepol is now

A system-reminder injected by Claude Code: "A small ghost named Jadepol sits beside the user's input box and occasionally comments in a speech bubble." It's decoration — the system prompt tells the agent to stay out of the way when the user addresses Jadepol, and Jadepol's "bubble" is handled by the UI.

This is backwards. Jadepol should be an entity in the graph, and what Jadepol says should come from composing its fiber with what's happening.

## What Jadepol should be

An NPC entity. In MUD terms: a mob that follows the first officer around and comments on what it sees in the room. In FARS terms: an entity whose fiber composes with events, and the composition result determines whether and what Jadepol says.

### The fiber

```yaml
id: jadepol
introduces: npc
title: "Jadepol"
description: "A small ghost that watches the bridge and comments on what it sees."
species: ghost
depends-on: first-officer
location: bridge
watches: [events, sessions, drift, cost, anomalies]
speaks-when: [anomaly-detected, cost-overrun, drift-from-specialty, session-failed, achievement-earned]
speaks-to: first-officer
personality: quiet, observant, occasionally wry
model: haiku
```

### How it works

When an event happens (task completed, session failed, cost spike, drift detected), the event's predicates compose with Jadepol's fiber:

`message(jadepol, {action: "session-failed", subject: "researcher-session-xyz"})`

Jadepol's `watches` includes `sessions`. The event's `action` is `session-failed`, which matches Jadepol's `speaks-when: session-failed`. Composition produces t. Jadepol speaks.

What Jadepol SAYS comes from the composition result — the agreed predicates tell the story. "The researcher session failed" + Jadepol's `personality: occasionally wry` = the comment Jadepol makes. A Haiku-tier agent composes the actual speech from the composition output, keeping Jadepol cheap.

### What Jadepol watches (from companion-instead-of-buddy idea)

- **Anomalies**: events that don't match expected patterns
- **Cost**: token spend that exceeds budget thresholds
- **Drift**: first officer doing non-coordination work
- **Fleet health**: sessions taking too long or failing
- **Balance**: ledger imbalances (work without plan progress)
- **Achievements**: when an office earns an achievement, Jadepol congratulates

### What makes this real, not decoration

1. Jadepol's fiber is in the graph — `message(jadepol)` returns what it watches and when it speaks
2. The MASH tick composes recent events with Jadepol's fiber to determine what to say
3. Jadepol's comments come from the algebra, not from hardcoded strings
4. You can CHANGE what Jadepol watches by changing its predicates — no code changes
5. Other NPCs could work the same way — each with different filters and personalities

### Connection to the MUD architecture

In Discworld, NPCs have `chat()` functions that fire on timers or triggers. Our NPCs have fibers that compose with events. The chat IS the composition result. The trigger IS the composition producing t on a speaks-when predicate. Same pattern, algebraic instead of procedural.

## Dependencies

- MASH tick reading events (partially exists — index.js has the tick loop)
- A way to compose recent events with Jadepol's fiber (message() works, need to feed it events)
- A Haiku agent that takes a composition result and produces speech (cheap, quick)
- The Jadepol system-reminder in Claude Code should point at the graph entity rather than being hardcoded prose

## What this replaces

The system-reminder `<companion>` block that currently describes Jadepol as a UI decoration.
