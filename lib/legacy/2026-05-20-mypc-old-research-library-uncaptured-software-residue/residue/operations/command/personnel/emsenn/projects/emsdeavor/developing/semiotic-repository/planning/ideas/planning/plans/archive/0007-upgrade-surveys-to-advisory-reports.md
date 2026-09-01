---
title: "Upgrade survey texts from slop to policy advisory reports"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: []
goal: "003"
milestone: "governance-foundation"
---

## Summary

Survey and research texts should not live in slop/. They should be
written as proper policy advisory reports following best practices
for that genre, and filed in the appropriate discipline directory as
published texts.

## Motivation

emsenn's correction: "when you write these survey texts, they
shouldn't be slop, they should be written as real policy advisory
reports, according to the best standards of that."

Currently several survey/research documents live in `slop/`:
- `slop/foss-planning-practices-survey.md`
- `slop/lean-agda-survey.md` (referenced by TODO.md)
- `slop/ai-math-agents-survey-2026.md` (referenced by TODO.md)

And at least one exists as a text but may not meet advisory report
standards:
- `technology/texts/policy-as-code-for-knowledge-repositories.md`
- `technology/texts/encoding-disciplinary-methods.md`

These should be rewritten as proper policy advisory reports — with
executive summary, methodology, findings, recommendations, and
references — and filed in the correct discipline directory.

## Steps

1. Research the genre conventions for policy advisory reports:
   what sections they contain, how recommendations are structured,
   what citation standards apply.
2. Create a `write-advisory-report` skill (SKILL.md) encoding those
   conventions.
3. Rewrite `slop/foss-planning-practices-survey.md` as a proper
   advisory report and move to
   `technology/texts/foss-planning-practices.md`.
4. Rewrite `slop/lean-agda-survey.md` as a proper advisory report
   and move to `mathematics/texts/` or `technology/texts/`.
5. Rewrite `slop/ai-math-agents-survey-2026.md` similarly.
6. Review existing texts that originated as surveys
   (`policy-as-code-for-knowledge-repositories.md`,
   `encoding-disciplinary-methods.md`) and upgrade to advisory
   report standards if needed.
7. Write policy 009: "Research outputs are advisory reports, not
   notes" (or amend policy 006 to specify the genre).

## Done when

- [ ] Advisory report genre conventions documented (skill or text)
- [ ] All slop/ surveys rewritten as advisory reports in proper
      discipline locations
- [ ] Existing survey-origin texts reviewed and upgraded
- [ ] Policy established for future research output format

## Dependencies

None.

## Log

**2026-03-07** — Created. emsenn corrected that survey texts should
be proper policy advisory reports, not slop-quality notes.
