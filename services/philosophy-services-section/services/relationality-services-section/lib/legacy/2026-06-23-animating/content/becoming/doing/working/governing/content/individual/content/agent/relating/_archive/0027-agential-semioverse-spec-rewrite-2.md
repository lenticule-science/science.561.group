---
title: "Agential semioverse specification rewrite"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: [33]
goal: "006"
milestone: ""
---

## Summary

Rewrite the agential semioverse specification with the same treatment the semiotic universe spec received: proper terminology, motivation, literature grounding, and clear mathematical structure.

## Motivation

The agential semioverse is the central mathematical object — it describes the structure that the ASR instantiates.
The current spec needs the same rigor applied to the semiotic universe spec: discipline-grounded definitions, cited literature, explicit construction, and separation of the mathematical object from its implementation.

## Steps

1. Read the current agential semioverse spec and the semiotic universe spec.
  Note what the semiotic universe spec does well that the agential semioverse spec lacks.
2. Read the interactive semioverse spec (the intermediate layer).
  The rewrite must be consistent with both layers.
3. Research literature on multi-agent systems, institutional frameworks, and normative structures that inform the agential layer.
4. Rewrite the spec: terminology section, motivation, mathematical definition, examples, relationship to adjacent layers.
5. Ensure the ASR implementation spec references the rewritten spec correctly.

## Done when

- [ ] Agential semioverse spec has terminology, motivation, and
      literature sections
- [ ] Mathematical definitions are explicit and constructive
- [ ] Relationship to semiotic universe and interactive semioverse
      is clearly stated
- [ ] ASR spec references are updated

## Dependencies

None.

## Open questions

- **"Agent" terminology**: modern AI agent discourse has shifted what "agent" connotes.
  If there was ever a time to reconsider the terminology, this is it.
  (Decision 0005, item 8.)

## Log

**2026-03-07** — Created from TODO.md unplanned item.

**2026-03-08** — Decision 0005 records emsenn's direction: consider revising "agent" terminology during this rewrite.
Also: purpose is immanent (not declared), check relationality slop for multi-agent coordination guidance.
