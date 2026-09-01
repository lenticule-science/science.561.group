---
extends: open
restricts: open
title: In Progress
description: "A unit of work that an agent is actively performing — the potentiality of the open state being realized through action."
instance-of: state
state-of: [task]
precedes: [completed, failed, blocked]
next-via: [finish, fail, block]
follows: open
follows-via: [begin, assign, start]
can-become: [completed, failed, blocked]
contributes-to-whole: partially-complete
date-created: 2026-04-06
---

In-progress is the state of a unit of [work](./work.md) that an agent is actively performing. In Aristotle's terms, this is energeia — the actualization of the capacity that the [open](./open.md) state held as dunamis. The work is happening.

In-progress follows [open](./open.md) via an act of beginning (assign, start). It precedes [completed](./completed.md) via an act of finishing, [failed](./failed.md) via an act of failing, or [blocked](./blocked.md) via an act of blocking.
