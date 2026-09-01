---
title: Persistent First-Officer mash-engine Session
description: Architecture for running Claude as a persistent mash-engine session receiving multi-channel input and operating autonomously toward operational goals.
date-created: 2026-04-04
type: note
name: persistent-first-officer-session
keywords:
  - persistent-session
  - mash-engine
  - mcp-channels
  - autonomous-agent
  - mud-architecture
specialization: idea
source: captain-directive
connects-to:
  - mud-architecture-insight
  - mash-engine
  - algebraic-learning-calculus
---

## Captain's words (2026-04-04)

> Can we rig up our mash-engine such that like... okay bear with me this is weird: we run a persistent session for you, that messages on channels you're subscribed to via mcp, come through like they'd be prompts, and my interface with you is just, basically, me sending you DMs? I feel like if we consider this idea, we can see how we can have a tUI that is much more MUD-like, where my experience is not like tmux windows to move between talking to you and other officers, but just `tell first-officer I have an idea..`. And from your end, that's just one of a series of prompts that seem to be coming from this weirdly formal RPG simulation you're a part of?

> Generally: stop asking "want me to do <atomic little tiny task>" you need to be steering this ship on loop towards its goals, you don't need my input to do any number of things. My prompts are just... part of the flow.

## The architecture

The first officer runs as a persistent mash-engine session. Input comes from multiple sources:

1. **Captain DMs** — `tell first-officer <message>` from the MUD/TUI
2. **Officer reports** — duty officers completing tasks send results to a channel
3. **System events** — daemon world-tick, build failures, threshold alerts
4. **Scheduled reviews** — standup, weekly review, plan checks

All of these arrive as prompts in the same session. The first officer processes them in order, dispatches work, reviews results, and steers toward goals. The captain's messages are privileged (can override, redirect, set policy) but they're not the only input.

## What changes

### For the captain
- No tmux. One interface. `tell first-officer` for direction, `tell helmsman` for fleet questions, `say` for broadcast.
- The first officer is always working. Captain input adjusts course, it doesn't start the engine.

### For the first officer
- Never idle. When no captain input, work from the ready queue, review officer output, run scheduled tasks.
- Captain messages are high-priority interrupts, not the only source of work.
- The session persists across the captain's login/logout — the ship runs whether the captain is on the bridge or not.

### For the TUI
- MUD-style: text input, scrolling output, channels for different views
- `who` — see all active officers
- `tell <officer> <message>` — direct message
- `fleet` — show running sessions
- `bridge` — show operational picture
- `dispatch <task>` — one-command dispatch

## Technical requirements

1. mash-engine needs to maintain a persistent Claude session (or restart it with full context)
2. MCP channel messages need to be injectable as prompts
3. Session must survive captain disconnect
4. Need a message queue so nothing is lost during processing
5. The world-tick could be the heartbeat that ensures the first officer processes the queue

## Connection to MUD architecture

This IS the MUD. The repo already identified that "the system IS a MUD" (memory: project_mud-architecture-insight.md). The LPMud driver = mash-engine, the mudlib = harness, the rooms = domains, the objects = entities. What was missing: the actual MUD experience. This idea completes it.
