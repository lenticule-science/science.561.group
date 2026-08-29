---
name: dispatching-a-process
description: The process-kind branch of dispatching-work — handles work items whose closure-position is process. Use when a work item has kind process.
specializing: process
composes:
  - dispatching-a-script
---

One of the four kind-branches under `dispatching-work`.
Processes are continuous activities (respond loops, watchers, periodic settlers); this dispatcher hands off to `dispatching-a-script`.
