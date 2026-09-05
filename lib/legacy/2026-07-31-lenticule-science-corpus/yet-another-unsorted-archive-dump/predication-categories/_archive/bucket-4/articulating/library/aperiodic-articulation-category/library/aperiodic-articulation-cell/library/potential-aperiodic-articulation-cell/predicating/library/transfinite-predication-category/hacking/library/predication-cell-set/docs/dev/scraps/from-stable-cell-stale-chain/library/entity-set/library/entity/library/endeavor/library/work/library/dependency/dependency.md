---
name: dependency
description: A typed relation between two records — record X depends on record Y when X cannot be admissible until Y is admissible. The relation is derived from explicit references (a task's requires field naming objects or morphisms that another task adds; a record's field types naming records that produce them) rather than authored as a separate edge record.
---

A dependency is a relation between records that names which must be in place before which other can be. In a roadmap, the principal dependency relation runs across tasks — task X depends on task Y iff anything in X.requires (objects or morphisms) appears in Y.adds (objects or morphisms). The dependency is implicit in the requires/adds pair; no separate dependency-record file is authored.

Dependencies compose into a directed acyclic graph (the substrate refuses cycles; a cycle indicates a contradiction in authorship that must be resolved by either re-authoring one of the records or recognizing that a dependency was misclaimed). The sorting-a-roadmap-by-dependency skill produces a topological layering of the task DAG; each layer is a derived milestone — a set of tasks whose combined adds lands a new addressable capability after all earlier layers have completed.

The dependency-form is the relation by which work-ordering is derivable. Without it, milestone authorship is hand-rolling — a decision the operator makes and writes down. With it, milestones fall out of the structure of the work itself, and the operator's role shifts from authoring layers to validating the layers the algorithm produces.
