---
title: "Queue"
description: "A container that holds work units in a defined order, awaiting dispatch or processing — the buffer between stages of the operations loop."
date-created: 2026-04-03
instance-of: container
contains: [work-unit, task]
part-of-stage: dispatch
references:
  - id: anderson2010
    type: document
    title: Kanban: Successful Evolutionary Change for Your Technology Business
    author:
      - literal: David J. Anderson
    issued:
      - year: 2010
  - id: little1961
    type: document
    title: A Proof for the Queuing Formula: L = λW
    author:
      - literal: John D. C. Little
    container-title: Operations Research, 9(3)
    issued:
      - year: 1961
---

A queue is a [container](../../../../philosophy/terms/container.md) that holds [work units](./work-unit.md) in a defined order, awaiting dispatch or processing. Work enters the queue when it is ready to be acted on. Work leaves the queue when an agent pulls it or a dispatcher assigns it.

A queue has an ordering principle. The simplest is first-in-first-out (FIFO) — work is processed in the order it arrived. Priority queues order by urgency or value — highest-priority work comes first regardless of arrival time. Cost-of-delay queues order by economic impact — work whose delay costs the most goes first. The ordering principle is a [quality](../../../../philosophy/terms/quality.md) of the queue, not of the work units — the same tasks can be ordered differently in different queues.

Queue length matters. Little's Law ($L = \lambda W$) says: average items in system equals throughput times average time in system. Long queues mean long wait times. In a kanban system (Anderson 2010), work-in-progress limits cap queue length — when the queue is full, new work waits upstream until a slot opens. This prevents the system from accepting more work than it can process.

A queue is the buffer between stages of the operations loop. Planning produces work units and places them in a dispatch queue. The dispatch stage pulls from the queue and assigns. The tracking stage observes queue length as a health metric — a growing queue indicates the downstream stage is slower than the upstream stage.

A [backlog](./backlog.md) is a special queue: it holds candidate work that has not yet been committed to a plan. The backlog is the holding area between "someone thought of this" and "we've decided to do this."
