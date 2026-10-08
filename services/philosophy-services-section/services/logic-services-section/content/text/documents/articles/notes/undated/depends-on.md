---
name: depends on
description: "The prerequisite morphism. Maps a task to another task that must be done before it can proceed. Domain: task. Codomain: task."
title: depends on
---

Domain: `code/structures/task.md`
Codomain: `code/structures/task.md`

A task T `depends-on` task S means: S must reach a terminal done-state before T can be dispatched. `depends-on` edges must be acyclic. A dangling `depends-on` edge (S has no record) leaves T in an undetermined readiness state.

`depends-on` encodes ordering between tasks. It does not encode decomposition — that is `decomposes-into`. A task can depend on a task it does not decompose into.
