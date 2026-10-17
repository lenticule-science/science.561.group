---
title: Companion Instead of Buddy
description: Design for a companion agent that monitors the bridge channel, fleet health, and failures to surface operational anomalies in Claude Code sessions.
date-created: 2026-04-04
type: note
name: companion-instead-of-buddy
keywords:
  - companion-agent
  - bridge-channel
  - fleet-health
  - event-stream
  - failure-reporting
specialization: idea
serves: endeavor-resource-planning
relates-to:
  - mud-chat-as-messaging
  - unified-record-sketch
aliases:
  - Companion Agent Instead of Claude Code Buddy
---

## Captain's prompt (2026-04-04)

> So Claude Code CLI has this "buddy" thing. I feel like we could do something like actually useful and cool in place of that. Just an idea.

## The idea

Claude Code's "buddy" is a lightweight companion that watches the session. In our architecture, a companion agent could be genuinely useful rather than decorative:

- **Watches the bridge channel** — sees all events flowing through, surfaces anomalies the first officer might miss
- **Monitors fleet health** — tracks running officers, flags sessions that are taking too long or costing too much
- **Reads failure reports** — when an officer fails, the companion reads the .failure file and suggests what went wrong before the first officer has to investigate
- **Tracks the captain's attention** — notes when the captain mentions something that doesn't have a record yet, nudges the first officer to create one
- **Balance watcher** — monitors the operational ledger for imbalances (tokens spent without output, tasks completed without plan progress)

In MUD terms: the companion is an NPC that follows you around and comments on what it sees in the room. It reads the same event stream everyone else does but has a different filter — it looks for things that are wrong or interesting rather than things that need doing.

Implementation-wise: this could be a Haiku-tier agent spawned at session start that reads the bridge channel periodically and emits observations to the first officer. Cheap, useful, and it exercises the unified record/channel system.

The system already has Jadepol (the ghost companion in the UI). This could be Jadepol's actual backend — reading the event stream and commenting.
