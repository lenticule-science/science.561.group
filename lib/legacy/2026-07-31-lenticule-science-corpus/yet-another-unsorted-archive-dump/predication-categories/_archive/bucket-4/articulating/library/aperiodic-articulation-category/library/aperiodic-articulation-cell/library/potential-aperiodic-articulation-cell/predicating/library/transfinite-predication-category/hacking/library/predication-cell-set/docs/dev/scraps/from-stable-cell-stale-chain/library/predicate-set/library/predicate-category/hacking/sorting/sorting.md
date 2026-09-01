---
name: sorting
description: Ordering a collection of records by some named relation that distinguishes earlier from later.
agent-noun: sorter
gerund: sorting
---

Given a collection of records and a relation by which they should be ordered (typically a dependency relation that names which records must come before which others), produce the ordering. The ordering may be total (a single sequence) or stratified into layers (records within one layer have no relation between them and may be processed in any order or in parallel; records in layer N+1 all depend on records in layer N or earlier). Reports cycles if the relation is not acyclic, naming the records that participate. A read transformer; the substrate is unmodified by sorting.

Typically paired with a specific structure noun (`sorting-a-roadmap-by-dependency`, `sorting-tasks-by-priority`) to scope what is sorted and by which relation.
