---
title: "Priority"
description: "The importance ranking of work that determines what gets done first — distinct from urgency, measured against the endeavor's goals."
defines: priority
date-created: 2026-04-04
instance-of: quality
contrasts-with: [urgency]
applies-to: [task, plan, objective]
part-of-stage: dispatch
enables: [dispatch, task-sequencing]
requires: [goal, endeavor]
references:
  covey1989:
    authors: ["Stephen R. Covey"]
    title: "The 7 Habits of Highly Effective People"
    publication: "Free Press"
    year: 1989
  reinertsen2009:
    authors: ["Donald G. Reinertsen"]
    title: "The Principles of Product Development Flow"
    publication: "Celeritas Publishing"
    year: 2009
---

Priority is the ranking of work items by importance — which tasks matter more to the goals of the [endeavor](./endeavor.md). It answers the question "how much does this matter?" High-priority work advances the mission; low-priority work is incidental. Priority is not intrinsic to the task; it is a relation between the task and the endeavor's current needs and goals.

Priority is distinct from [urgency](./urgency.md). Priority asks "how much does this matter?" Urgency asks "how soon must this happen?" Stephen Covey (1989) formalized this distinction in the Eisenhower matrix: do first (urgent + important), schedule (important + not-urgent), delegate (urgent + not-important), drop (neither). The critical failure mode in any dispatch system is conflating the two — doing what screams loudest instead of what matters most. A fire alarm is urgent; a house with poor insulation in winter is important. A [deadline](./deadline.md) creates urgency, but priority determines whether the deadline should exist at all. A trivial task with a tight deadline is still trivial; a critical task with a distant deadline is still critical.

Priority sources from four dimensions. First, **goal alignment** — does this task advance the [charter's](../theories/governance/terms/charter.md) stated goals? A task that directly supports a declared objective is higher priority than a task that supports only adjacent goals. Second, **dependency leverage** — does completing this task unblock other high-priority work? A task that blocks five downstream tasks is higher priority than one that stands alone. Third, **cost of delay** — how much value is lost per unit of time? Reinertsen (2009) formalized this as the economic framework for priority: a task with $1,000 per day cost of delay is higher priority than one with $100 per day, regardless of effort required. Cost of delay makes priorities commensurable — it answers "which of these competing important tasks should I do first?" by comparing the rate at which value deteriorates. Fourth, **risk** — does inaction increase danger? A task that prevents system failure is higher priority than one that improves an already-functioning system, even if the improvement is larger.

Priority is static or dynamic. Static priority is assigned once and stays fixed — the MoSCoW classification (Must/Should/Could/Won't). Dynamic priority changes with context. A low-priority maintenance task becomes high-priority when the system it maintains fails. A low-priority exploratory task becomes high-priority when it reveals a critical risk. Most real systems need dynamic priority: the endeavor's situation changes, new information arrives, and what counts as important shifts accordingly. The dispatch system must support both — some work items with truly fixed priority, and others whose priority is computed dynamically based on the current state.

Priority is policy-relative. What counts as high-priority depends on the endeavor's goals and the current situation. The same task — "update documentation" — is low-priority during a crisis response and high-priority during a consolidation phase. The same "optimize performance" task is low-priority for a startup in growth phase and high-priority for a mature system facing competition. This is not weakness; it is how priorities reflect real constraints. Priority changes because the world changes. An endeavor that ignores context and maintains static priorities regardless of circumstance is brittle.

Priority is consumed by the dispatch stage. The guiding principle: select work by leverage against goals, not by proximity or recency. Priority IS leverage — the quality that determines which action makes other actions easier or unnecessary. When the queue holds five ready tasks and the agent has capacity for one, priority determines which one gets assigned. Priority may be stored as a static attribute on tasks or computed dynamically from cost-of-delay data and goal-alignment data. The dispatch logic sorts the queue by priority and assigns the highest-priority available task first.

See also: [urgency](./urgency.md), [deadline](./deadline.md), [goal](../terms/goal.md), [dispatch](./dispatch.md), [queue](./queue.md).
