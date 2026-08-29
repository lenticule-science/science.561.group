---
title: "evidence-graded curriculum"
description: "A curriculum whose units carry an explicit, mechanically checkable evidence grade (Built+green / Research-grade / Roadmap) rather than a flat done/not-done status, with grade advancement proposed by rereading accumulated practice records against an owner-named threshold, never applied silently"
date-created: 2026-08-21
type: term
aliases:
  - "evidence-graded curriculum"
  - "evidence-grading (curriculum)"
tags: []
defines:
  - "evidence-graded curriculum"
produced-by:
  - backward-design
contains:
  - lesson
contrasts-with:
  - banking-model
authors:
  - Claude Opus
---

An evidence-graded curriculum is a [curriculum](./curriculum.md) whose constituent units each carry an explicit evidence grade — **Built+green**, **Research-grade**, or **Roadmap** — instead of a single flat "completed" flag. The grade names a claim about how well-supported the unit's mastery actually is, not merely whether it was once taught: Built+green means the unit has a repeatable, rerunnable check confirming it; Research-grade means real evidence exists but is partial or not independently checked; Roadmap means the unit is scoped but nothing has yet been studied, drilled, or evidenced against it.

The vocabulary and entry shape (`id`/`area`/`summary`, plus `evidence`/`limits` for built and research-grade units or `currentEvidence`/`upgradeEvidence` for roadmap units) are not defined here; this term's canonical home for that grading discipline is the personal-tree guide, [Evidence Grading for Personal Language Study](../../../../../../../../../../../public-services-section/services/personal-services-section/emsenn-services-section/services/emsenn-languages-services-section/services/emsenn-language-learning-services-section/content/text/documents/articles/guides/evidence-grading-for-personal-language-study.md), which is explicit that the threshold separating grades ("94% recall over 60 days," for example) must be "a number [the curriculum's owner] actually picked and can name later, not a feeling."

What this term adds, per §3.10 of *A System Design for Language Learning* — a draft, not-yet-built design, so this mechanism itself is Roadmap-grade evidence, cited here as a proposal rather than a settled practice — is a specific way grade *advancement* should work: a unit's evidence should be tracked per exercise-kind-capability rather than as one flat number, because underlying capability (e.g. recognition versus production) can mature unevenly within a single unit. A grading-pass role reads a unit's current grade, its stated `upgradeEvidence` criterion, and the accumulated dated practice records, and computes directly from that history whether the named bar has actually been met. This role only ever *proposes* a grade change with the evidence cited — it never silently applies one. The design intent is to keep threshold-*setting* fully owned by the curriculum's human author while making threshold-*checking* auditable and mechanical rather than a memory-dependent chore.

An evidence-graded curriculum differs from ordinary [backward design](./backward-design.md) in degree rather than kind: backward design already asks what would constitute acceptable evidence of understanding before planning instruction, but leaves the *checking* of whether that evidence was actually gathered as an implicit, human-remembered step. Evidence grading makes that step an explicit, dated, machine-readable record attached to each unit, so that "I did Unit 6" and "the evidence shows I can do what Unit 6 claims" remain distinguishable statements rather than collapsing into one.

## Related terms

- [curriculum](./curriculum.md) — the structured sequence of lessons that evidence grading is applied to, unit by unit
- [backward design](./backward-design.md) — the design framework evidence-graded curricula extend by making evidence-checking explicit and dated
- [banking model](./banking-model.md) — the deposit-and-recall approach evidence grading resists by requiring rerunnable proof of capability, not a record of exposure
- [Evidence Grading for Personal Language Study](../../../../../../../../../../../public-services-section/services/personal-services-section/emsenn-services-section/services/emsenn-languages-services-section/services/emsenn-language-learning-services-section/content/text/documents/articles/guides/evidence-grading-for-personal-language-study.md) — the canonical source for the Built+green / Research-grade / Roadmap vocabulary and entry shape this term relies on
