---
title: "First message as initialization"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - Emsemioverse
  - AgentialSemioverse
  - SignalDispatch
description: "The first message of an agent session is structurally different from subsequent messages and requires a distinct interpretation skill."
---

The first message of an agent session is not a command in the same
sense as subsequent messages. It is an initialization signal: it sets
context, establishes session goals, references past work, defines
priorities, and may include meta-commentary about the interaction
itself. The current
[prompt routing](../../technology/specifications/agential-semioverse-repository/theory/prompt-routing.md)
specification and the
[interpret-message](../../technology/specifications/agential-semioverse-repository/skills/interpret-message/SKILL.md)
skill treat all messages identically, which means the first message
either gets routed to a skill it doesn't fit (command dispatch) or
falls through to the full encoding loop when what it actually needs
is session initialization.

## What first messages do

A first message typically:

1. **Establishes continuity** — references what was done in previous
   sessions, what state the work is in, what the user has been
   thinking about since.
2. **Sets session scope** — declares what this session should focus
   on, what counts as success.
3. **Provides meta-guidance** — how the agent should approach the
   work (e.g., "use less context for mechanical tasks," "focus on
   creative thought").
4. **Embeds corrections or priorities** — things that should change
   about how the agent operates, based on the user's experience
   since the last session.

## Why this matters for context economy

Session initialization is expensive. The agent currently reads
CLAUDE.md, the working notes, the TODO, the registry, recent plans,
and the relevant specs — all before doing any actual work. Much of
this reading is mechanical and repetitive. A dedicated first-message
skill can structure this initialization so that the reading is
targeted (only read what the session goals require) and the results
are summarized efficiently (so the agent's context window is not
consumed by boilerplate).

The goal is not just to interpret the first message but to use it
as a key that unlocks only the relevant context, rather than loading
everything and hoping the agent filters it.

## Source

emsenn identified this gap on 2026-03-07: the system has improved
prompt interpretation for individual messages but has no special
handling for session-initializing messages, which are structurally
different.
