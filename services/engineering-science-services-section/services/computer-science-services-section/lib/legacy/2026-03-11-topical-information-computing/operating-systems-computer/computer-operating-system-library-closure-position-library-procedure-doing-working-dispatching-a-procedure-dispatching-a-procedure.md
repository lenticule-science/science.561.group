---
name: dispatching-a-procedure
description: The procedure-kind branch of dispatching-work — handles work items whose closure-position is procedure. Use when a work item has kind procedure.
specializing: procedure
composes:
  - dispatching-a-script
---

One of the four kind-branches under `dispatching-work`.
Procedures are step-by-step recipes whose bodies are scripts; this dispatcher hands off to `dispatching-a-script`.
