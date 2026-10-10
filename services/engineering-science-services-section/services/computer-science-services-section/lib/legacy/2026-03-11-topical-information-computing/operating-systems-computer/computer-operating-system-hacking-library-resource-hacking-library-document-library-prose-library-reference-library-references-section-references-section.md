---
name: references-section
description: "A body heading of the form `## References`, `## Bibliography`, or `## Sources` — a forbidden anti-pattern in 561 citing files, since bibliographic records live in `references:` frontmatter."
aliases:
  - bibliography-section
  - sources-section
---

A references-section is a markdown body heading whose text matches one of `References`, `Bibliography`, `Sources`, `Sources cited`, `Sources read`, or any case/punctuation variation of those, typically introducing a hand-maintained list of works.

The polity forbids references-sections in citing files (per [`citations`](../../work/governance/rules/specifications/citations.md) §5.7 and §7.3).
The bibliographic record lives in the file's `references:` frontmatter map; the body cites works only as `[@citekey]` ([`citation`](citation.md)).

A references-section in a body is therefore not a form the 561 Group admits as content — it names a violation to be removed.
[`linting-a-references-section`](../../doing/working/skills/linting-a-references-section/SKILL.md) is the skill that finds them.
