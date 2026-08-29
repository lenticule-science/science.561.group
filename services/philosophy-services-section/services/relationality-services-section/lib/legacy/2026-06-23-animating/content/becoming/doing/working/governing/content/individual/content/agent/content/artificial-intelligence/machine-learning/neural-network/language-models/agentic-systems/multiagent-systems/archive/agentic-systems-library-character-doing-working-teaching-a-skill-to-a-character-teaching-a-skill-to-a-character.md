---
name: teaching a skill to a character
description: The teaching-a-skill-to-a-character skill record.
specializing: character
closure-position: procedure
operation-kind: mutation
derives-from:
  - ../../../../code/transformers/teaching.md
  - ../../../../code/structures/skill.md
  - ../../../../code/structures/character.md
requires:
  - ../../../../work/governance/rules/specifications/teaching-a-skill.md
contains:
  - SKILL.md
  - scripts/teach-a-skill-to-a-character.mjs
composes: []
---

The skill record for `teaching-a-skill-to-a-character`. The operational body is the script at [`scripts/teach-a-skill-to-a-character.mjs`](scripts/teach-a-skill-to-a-character.mjs); the Claude Code surface and the eight-step procedure live in [`SKILL.md`](SKILL.md). Invariants the script enforces are pinned by [`teaching-a-skill.md`](../../../../work/governance/rules/specifications/teaching-a-skill.md), which derives from the [`teaching` transformer](../../../../code/transformers/teaching.md).

`composes:` is empty because the script does the substrate edit and witness write directly; it does not invoke other skills.
