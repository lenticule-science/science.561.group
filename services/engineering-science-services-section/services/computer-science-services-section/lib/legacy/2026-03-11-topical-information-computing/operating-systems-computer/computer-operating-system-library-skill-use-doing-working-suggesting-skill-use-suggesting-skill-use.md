---
name: suggesting skill use
description: The suggesting-skill-use skill — on PreToolUse, read each installed skill's _index.md suggests-for rules and emit additionalContext when a tool input matches.
specializing: skill-use
contains:
  - SKILL.md
  - scripts/
composes: []
---

The skill record for `suggesting-skill-use`.
The operational body is in [`SKILL.md`](SKILL.md).

This is a leaf skill that brokers the rest of the skill web: when an author wants a skill to self-announce, they add a `suggests-for:` block to that skill's `_index.md` — this dispatcher is what reads those blocks at hook fire time.
It does not itself appear in `suggests-for:` (you cannot suggest the suggester).
