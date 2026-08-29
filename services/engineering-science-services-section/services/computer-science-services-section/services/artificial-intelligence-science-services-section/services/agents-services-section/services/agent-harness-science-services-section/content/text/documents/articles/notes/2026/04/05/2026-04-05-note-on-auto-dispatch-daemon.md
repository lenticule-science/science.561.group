---
title: Auto-Dispatch Daemon
description: Proposes automating routine task dispatching through a daemon that scores and auto-dispatches high-confidence tasks while flagging ambiguous ones for review.
date-created: 2026-04-05
type: note
name: auto-dispatch-daemon
keywords:
  - auto-dispatch
  - daemon
  - task-routing
  - threshold-scoring
  - work-queue
specialization: idea
source: captain-directive
connects-to:
  - progressive-automation-plan
  - persistent-first-officer-session
  - heartbeat
---

## Captain's words (2026-04-05)

> Can we set up some sort of scheduling shit with our engine so that you don't have to keep doing the dispatching? Like surely we can have like... auto-dispatching and shit by now and you just kinda, keep an eye on things and do the big big picture stuff?

## The insight

The first officer currently does THREE things when dispatching:
1. **Decide WHAT** to work on (leverage assessment — which task serves goals best)
2. **Decide WHO** handles it (office matching — which agent fits the task)
3. **Execute the dispatch** (build prompt, call mash-engine start)

Steps 2 and 3 are already deterministic — task-router.js handles #2, and mash-engine start handles #3. Step 1 is the only judgment call, and even that is partially handled by the dispatch-work.js scoring.

The daemon's world-tick should:
1. Run dispatch-work.js to get the ready queue with office matches
2. For tasks scored above a threshold (say, score >= 6), auto-dispatch
3. For lower-scored or ambiguous tasks, flag for first-officer review
4. Respect WIP limits — don't dispatch if too many sessions are running
5. Record every auto-dispatch as an event

The first officer then reviews results and handles the judgment-heavy work. Dispatch of routine tasks becomes background infrastructure.
