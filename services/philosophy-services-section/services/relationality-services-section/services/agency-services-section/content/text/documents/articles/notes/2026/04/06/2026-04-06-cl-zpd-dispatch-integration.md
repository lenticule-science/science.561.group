---
title: "Integrate ZPD lens into dispatch for learning-optimal task assignment"
specialization: task
date-created: 2026-04-06
plan: cl-pipeline
work-type: procedure
requires: [code-editing]
assigned-to: operations-officer
serves-system: fars
depends-on: [cl-self-settlement-consolidation]
theory-source: library/domains/humanities/domains/education/domains/learning/terms/zone-of-proximal-development.md
contributes-to-milestone: cl-pipeline-m5-novel-capabilities
description: "Vygotsky's ZPD: the space between what a learner can do alone and what they can do with scaffolding."
---

Vygotsky's ZPD: the space between what a learner can do alone and what they can do with scaffolding.
The bilattice gives us this for free.

When `respond(office, task)` produces: - All t → below ZPD, too easy, no learning - Mix of t and ⊥ → IN the ZPD, scaffolding available, learning happens - All ⊥ → above ZPD, too hard, no scaffold - Any ⊤ → accommodation needed, fiber restructuring required

**What to build:** - Create the ZPD lens entity (markdown file with threshold predicates, already designed in zpd-lens plan) - Modify FOAH `dispatch.js` to report composition ratios alongside semantic overlap count - Add ZPD interpretation to dispatch output: "in zone", "too easy", "too hard", "conflict" - When multiple tasks are ready and multiple offices available, prefer assignments in the ZPD — hard enough to produce learning, not so hard they fail

**What this connects to:** - Gamification: the composition ratio IS the quest difficulty - The character sheet: an office's ZPD shifts as its fiber enriches — tasks that were too hard become in-zone - Progressive automation: when ALL tasks are "too easy" for an office, it's time for retirement-as-fold

**Definition of done:** `dispatch.js` output includes ZPD classification for each office-task pair.
At least one dispatch decision is influenced by ZPD (choosing the learning-optimal assignment over the trivial one).
