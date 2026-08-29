---
name: exploring
description: Walking the records of a domain to build an aggregate view plus any analyses derived from the walk.
agent-noun: explorer
gerund: exploring
imperative: explore
---

Given a directory rooted at a domain's records (typically `$dir/code/structures/`, `$dir/code/transformers/`, and a domain-specific records directory such as `$dir/doing/working/hacking/doing/working/planning/library/task/library/`), walk the conventional subdirectories and produce the aggregated in-memory shape plus any per-record diagnostics the walk surfaces. A read transformer; the records are unmodified by exploration.

The exploration is a recipe-normal-form *orient* operation. It does not commit, does not lint, does not validate beyond the structural parse — those are downstream operations the explorer agent may compose with (typically via paired skills like `validating-a-task`, `finding-gaps-in-a-roadmap`, `sorting-a-roadmap-by-dependency`).
