---
name: journaling
description: An agentic character's accreting cell-set about itself over time. Sub-structure of character. Carries sub-structures memory (curated, typed, persisted across sessions) and diary (per-session timestamped EAVT rows). Every character — and by the polysemy theorem, every directory — may carry a journaling subtree at `<$character>/doing/working/journaling/`.
specializing: character
---

A **journaling** is the structural pattern by which an agentic character accretes cells about itself over time. Per the polysemy theorem at [the thing polysemy explainer](../../../../../../../../../teaching/explaining/the-thing-polysemy.md), every directory in the OS is simultaneously a character; so every directory may carry a journaling subtree at `<$directory>/doing/working/journaling/library/<sub-structure>/library/.../<slug>.<ext>`.

## Sub-structures

- [memory](library/memory/memory.md) — curated, typed records persisted across sessions. Four kinds (feedback, reference, user, project) per the Claude Code auto-memory convention.
- (queued) `diary/library/entry/` — per-session timestamped EAVT rows. Currently mid-refactor — the diary structure is partially realized in the hacking holding pen at [the holding-pen diary subtree](../../../../../../../../../doing/working/hacking/doing/working/logging/journaling/library/diary/) and at the deprecated [diary-entry](../diary-entry/diary-entry.md) at the character level.

## Characteristic predication-shape

- `belongs-to(journaling, character)` — every journaling subtree is owned by exactly one character (the $directory whose journaling/ it sits under, treated as a character per polysemy).
- `accretes(journaling, journaling-cell)` — cells are appended; never rewritten retroactively (the witness discipline).
- `realized-at($character, $character/doing/working/journaling/)` — the on-disk position per the common-layout's `doing/working/logging/` pattern, generalized.
