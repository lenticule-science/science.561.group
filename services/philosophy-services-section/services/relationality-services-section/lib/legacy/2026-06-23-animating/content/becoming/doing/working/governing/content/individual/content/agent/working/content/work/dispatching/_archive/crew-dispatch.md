---
title: "Crew Dispatch"
specialization: duty
description: "Assign work to the right officer based on the goal-work-duty-officer chain"
attached-to:
  - first-officer
triggers:
  - tasks-ready-in-queue
  - captain-requests-work
  - session-start (if ready tasks exist)
actions:
  - Consult dispatch-work.js for task-to-office matching
  - For in-session work, use Agent tool with correct subagent_type
  - For external work, use mash-engine start with office configuration
  - Never dispatch specialized work to generic duty officers
  - Record dispatch events
---

The duty to assign work to the right officer.
The first officer traces: this task serves this plan serves this goal, it's this work-type, so it goes to this office.
Specialized work goes to specialized offices.
Generic dispatch is for infrastructure tasks only.
