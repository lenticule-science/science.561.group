---
name: retrospective diary entry
description: A per-turn diary entry reflecting backward on what was done versus what would have been better in hindsight.
---

A retrospective-diary-entry is a [diary-entry](diary-entry.md) whose attribute `a` is `writing-a-diary-entry-that-is-retrospective` and whose value `v` addresses a just-completed turn from the standpoint of retrospect: *"this turn I did X but looking back I could have done Y."* The genre is reflection: what was attempted, what was learned, what a different choice would have yielded.

Like every diary-entry, a retrospective is one row in `prose/journals/diary/YYYY-MM-DD.jsonl`, written by the skill named in its attribute and authored per-turn (one row per substantial action) rather than per-moment.

The retrospective register pairs with the [prospective-diary-entry](prospective-diary-entry.md) register: the retrospective surfaces what happened, the prospective distills the surfacing into instructions for future turns.
The parent `writing-a-diary-entry` skill writes one of each at the same timestamp.
