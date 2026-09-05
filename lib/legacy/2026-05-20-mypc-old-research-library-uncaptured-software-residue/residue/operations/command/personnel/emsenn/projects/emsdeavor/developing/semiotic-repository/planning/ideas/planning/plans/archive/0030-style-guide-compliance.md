---
title: "Style guide compliance"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: medium
depends-on: [16]
goal: "006"
milestone: ""
---

## Summary

Check existing published content against the style guide at
`writing/texts/style-guide.md` and fix violations. Then ensure ongoing
compliance through tooling.

## Motivation

The style guide exists but compliance is not verified. Content written
by agents may not follow the guide. Without a check, style drift
accumulates silently.

## Steps

1. Read the style guide and extract checkable rules (e.g., lowercase
   `emsenn`, no vague adverbs, active voice, no Lakota grounding in
   agent writing).
2. Build or configure a check-note-style skill invocation that covers
   these rules.
3. Run the check across published content directories. Record the
   violations.
4. Fix violations in batches, prioritizing high-traffic pages.
5. Integrate the style check into the improve-files skill family
   (plan 0016) so it runs on edited files.

## Done when

- [ ] Style guide rules encoded as checkable criteria
- [ ] Published content audited for violations
- [ ] Violations fixed
- [ ] Style check integrated into routine editing workflow

## Dependencies

Plan 0016 (improve-files skill family) — the style check should be
part of the file improvement pipeline.

## Log

**2026-03-07** — Created from TODO.md unplanned item. check-note-style
skill already exists at semiotic-markdown/skills/.
