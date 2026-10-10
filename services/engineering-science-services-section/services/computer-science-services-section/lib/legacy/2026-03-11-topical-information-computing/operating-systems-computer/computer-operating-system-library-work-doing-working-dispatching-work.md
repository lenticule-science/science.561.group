---
name: dispatching-work
description: Entry point of the dispatch chain — reads the work item's kind field and routes to dispatching-a-process, dispatching-a-procedure, dispatching-a-derivation, or dispatching-an-inquiry. Use whenever the swarm has a new work item to handle.
---

## Requirements

- Work item has a `kind:` field whose value is one of `process`, `procedure`, `derivation`, `inquiry`.
  These mirror the `closure-position:` taxonomy from `work/governance/rules/specifications/skill.md`.
- Each of the four kind-dispatcher skills is reachable: `dispatching-a-process`, `dispatching-a-procedure`, `dispatching-a-derivation`, `dispatching-an-inquiry`.

### Inputs

- `workItem` — object with at minimum `{ kind, skill, target }`.
  The rest of the fields are kind-specific and consumed by the kind-dispatcher.

## Steps

1. Read `workItem.kind`.
2. Resolve which kind-dispatcher to use:
   - `process` → `dispatching-a-process`
   - `procedure` → `dispatching-a-procedure`
   - `derivation` → `dispatching-a-derivation`
   - `inquiry` → `dispatching-an-inquiry`
3. Call the resolved kind-dispatcher with the work item.
4. Return its result, augmented with a witness `dispatched-as:` field naming which kind-dispatcher handled it.

## Outcomes

- On success: the kind-dispatcher's result is returned.
  Higher layers (the respond loop, or whoever invoked `dispatching-work`) decide what to do with it — typically write a cell at `workItem.target`.
- On unknown kind: an error is raised naming the kind seen and the four allowed values.
- On kind-dispatcher error: propagated up.
