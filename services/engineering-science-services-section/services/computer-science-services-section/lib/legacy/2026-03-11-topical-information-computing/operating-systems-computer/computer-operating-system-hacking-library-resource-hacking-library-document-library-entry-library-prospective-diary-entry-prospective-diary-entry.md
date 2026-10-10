---
name: prospective diary entry
description: A per-turn diary entry written forward-facing, distilling retrospective surfacing into instructions for future turns.
---

A prospective-diary-entry is a [diary-entry](diary-entry.md) whose attribute `a` is `writing-a-diary-entry-that-is-prospective` and whose value `v` addresses future turns from the standpoint of distilled advice: *"when you do X, you should Y."* The genre is instruction: a maxim, a heuristic, an "if you see this, do this" rule extracted from the writer's experience.

Like every diary-entry, a prospective is one row in `prose/journals/diary/YYYY-MM-DD.jsonl`, written by the skill named in its attribute and authored per-turn (one row per substantial action) rather than per-moment.

The prospective register pairs with the [retrospective-diary-entry](retrospective-diary-entry.md) register: the retrospective surfaces what happened, the prospective distills the surfacing into instructions for future turns.
A prospective without a corresponding retrospective is admissible but typically thinner; the two genres together form the per-turn reflective practice and the parent `writing-a-diary-entry` skill writes both at the same timestamp.
