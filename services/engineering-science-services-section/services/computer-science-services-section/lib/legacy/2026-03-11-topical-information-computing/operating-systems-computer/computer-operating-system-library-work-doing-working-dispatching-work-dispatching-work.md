---
name: dispatching-work
description: The single entry point of the OS's dispatch chain — every work item enters here. Use to route a work item to the right kind-dispatcher.
specializing: work
composes:
  - dispatching-a-process
  - dispatching-a-procedure
  - dispatching-a-derivation
  - dispatching-an-inquiry
---

The top of the dispatch chain.
Every work item enters here.
The body is a switch on `workItem.kind` against the four `closure-position:` values.
Each kind branch is its own skill; this skill carries no kind-specific logic.
