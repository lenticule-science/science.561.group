---
name: decomposes into
description: The decomposition morphism. Maps a task to a subtask it contains. Domain: task. Codomain: task.
---

Domain: `code/structures/task.md`
Codomain: `code/structures/task.md`

A task T `decomposes-into` subtask S means: S is a component of T. T's goal is settled when the goals of all its `decomposes-into` targets are settled (AND-composition by default). The decomposition graph must be acyclic.

`decomposes-into` does not imply ordering. Ordering between subtasks is expressed via `depends-on` edges on the subtasks themselves.
