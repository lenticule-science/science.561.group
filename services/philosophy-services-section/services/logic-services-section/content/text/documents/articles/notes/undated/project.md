---
name: project
description: A named container of related plans toward a single stated goal. An entity-form whose characteristic predication-shape names a goal, a bounded set of plans, and a completion condition.
title: project
---

## Pure form

A project is a named body of work serving one stated goal. The defining predication: `(project, serves, goal)` together with `(project, contains, plan)` for each plan in the project. A project without a stated goal is a label on a pile of work; a project without plans is a placeholder.

A project is complete when its plans are complete and its goal is satisfied. Because plans contain tasks with defined completion states, project completion rolls up deterministically from leaf-task settlement.

## Characteristic predication-shape

- `serves(project, goal)` — the goal this project advances; the individuating predication.
- `contains(project, plan)` — plan belongs to this project.
- `has-completion-criteria(project, criteria)` — the conditions whose joint settlement marks the project complete.
- `part-of(project, campaign)` — the campaign coordinating this project, when one exists.
- `has-status(project, {draft | open | active | done | abandoned})` — current lifecycle state.

## Single-goal invariant

A project serves *at most one* stated goal. This is what distinguishes a project from a [campaign](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/endeavor/library/project/campaign.md), which coordinates multiple projects across multiple goals toward a strategic intermediate objective. The single-goal invariant lets a project arbitrate scope: a proposed addition either advances the stated goal or it does not belong in the project.
