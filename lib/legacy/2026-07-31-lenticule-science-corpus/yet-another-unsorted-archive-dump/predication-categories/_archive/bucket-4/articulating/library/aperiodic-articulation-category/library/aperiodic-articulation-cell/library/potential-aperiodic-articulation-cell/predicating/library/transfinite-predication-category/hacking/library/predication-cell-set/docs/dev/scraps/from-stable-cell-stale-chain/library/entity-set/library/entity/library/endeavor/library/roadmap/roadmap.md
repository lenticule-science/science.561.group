---
name: roadmap
description: A dependency-graph representation of an endeavor's planned work as programs, tasks, objects, and morphisms. Programs group related tasks; tasks declare requires and adds over objects and morphisms; objects carry fields with typed references; morphisms carry input and output signatures. Milestones are not stored on a roadmap; they are derived from the task DAG by topological sort.
---

A roadmap is the planning artifact through which an endeavor's intended work is made mechanically inspectable. The roadmap is a collection of records — programs (coherent capability groupings), tasks (atomic work units), objects (types the work introduces), and morphisms (functions the work introduces, with explicit type signatures) — organized so that the dependency edges between tasks (X depends on Y iff X.requires names anything in Y.adds) are derivable rather than authored.

Roadmaps live in the substrate's canonical directories: a roadmap's objects and programs at `$root/code/structures/`, its morphisms at `$root/code/transformers/`, its tasks at `$root/doing/working/hacking/doing/working/planning/library/task/library/`. The structure-form earns its place because dispatch and gap-finding both need a roadmap as the addressable target — exploring-a-roadmap, validating-a-task in a roadmap, finding-gaps-in-a-roadmap, sorting-a-roadmap-by-dependency are all skills that take a roadmap directory as their primary argument.

A roadmap is a planning artifact, not a build artifact. The records the roadmap admits may not yet exist as runnable code; the discipline is that the roadmap names the records the eventual implementation will need, in shape sufficient that find-gaps-in-a-roadmap can surface missing pieces mechanically.
