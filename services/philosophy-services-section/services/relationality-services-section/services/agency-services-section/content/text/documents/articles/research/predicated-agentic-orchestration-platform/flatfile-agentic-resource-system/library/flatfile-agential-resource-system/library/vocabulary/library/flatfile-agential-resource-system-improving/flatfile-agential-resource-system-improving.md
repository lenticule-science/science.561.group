---
id: flatfile-agential-resource-system-improving
description: "Working applied specifically to SkillfulWorkUnits, with selection bias toward enabling more work, feedback cycles, and error routing."
extends: FlatfileAgentialResourceSystemWorking
uses: FlatfileAgentialResourceSystemSkillfulWork
describes: FlatfileAgentialResourceSystemWorking, FlatfileAgentialResourceSystemSkillfulWork, FlatfileAgentialResourceSystemAgentLoop
takes: SkillfulWorkQueue
writes: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
params:
  skillful-work-queue: relational-universe
  locale: relational-universe
output: relational-history-fiber-fixed-layer
ast:
  prioritized-feedback-loop:
    - skillful-work-queue:
        - unblocking-rank
        - repair-rank
        - gap-filling-rank
    - locale:
        - cours-of-work
        - error-routing
title: Flatfile Agential Resource System Improving
---

# Flatfile Agential Resource System Improving

## What this is

**FlatfileAgentialResourceSystemImproving** is a specialization of FlatfileAgentialResourceSystemWorking ([flatfile-agential-resource-system-working](../flatfile-agential-resource-system-working/flatfile-agential-resource-system-working.md)) that targets SkillfulWorkUnits ([flatfile-agential-resource-system-skillful-work](../flatfile-agential-resource-system-skillful-work/flatfile-agential-resource-system-skillful-work.md)) specifically.
FlatfileAgentialResourceSystemImproving MUST only target SkillfulWorkUnits — ad-hoc work goes through FlatfileAgentialResourceSystemWorking.
It adds three things that plain FlatfileAgentialResourceSystemWorking lacks:

1. **Selection bias** — among available work units, FlatfileAgentialResourceSystemImproving prioritizes those that enable more work: unblocking dependencies, repairing broken skills, filling missing specs.
  A work unit that enables ten more units is preferred over one that enables none.

2. **Feedback cycles** — FlatfileAgentialResourceSystemImproving always ends with a learning capture step (`skills/post-work-update.md`).
  Discoveries made during work are routed back into PLANS and IDEAS.
  Nothing is discarded.

3. **CoursOfWork improvement** — for Derivation and Inquiry work units, FlatfileAgentialResourceSystemImproving triggers a tail-end improvement pass over the skills and units accessed during the work.
  See [CoursOfWork](#coursofwork) below.

## Selection bias rule

When choosing among open work items, FlatfileAgentialResourceSystemImproving MUST rank by:

1. **Unblocking** — items whose completion directly enables one or more currently blocked items to become available
2. **Repair** — items that fix broken or malformed SkillfulWorkUnits
3. **Gap-filling** — items that create new SkillfulWorkUnits where none exist
4. **Ordinary work** — items with no downstream enablement

Within each rank, tie-break by whichever item appears earliest in PLANS.

Plain FlatfileAgentialResourceSystemWorking takes item 1 from the queue regardless of rank.
FlatfileAgentialResourceSystemImproving re-sorts the queue before taking item 1.

## CoursOfWork

The **CoursOfWork** of a Derivation or Inquiry execution is the set of: - Skills invoked (directly or as sub-skills) - Spec files, math entitys, or other files read as context - Skills or files that produced unexpected outputs or errors

At the end of any Derivation or Inquiry, FlatfileAgentialResourceSystemImproving MUST collect the CoursOfWork and pass it to `skills/post-work-update.md` as part of `findings`.
Each item in the CoursOfWork that showed a problem triggers a feedback entry.
Each item that worked perfectly is noted but does not generate work.

This is not optional.
A Derivation or Inquiry that produces a judgment without examining what it used to get there has not closed its loop.

## Error routing

When a Process or Procedure called during FlatfileAgentialResourceSystemImproving emits a SkillError ([flatfile-agential-resource-system-skill-result](../flatfile-agential-resource-system-skill-result/flatfile-agential-resource-system-skill-result.md)), FlatfileAgentialResourceSystemImproving MUST:

1. Attempt local recovery if the error class is `MissingInput` or `ValidationFailure` and the recovery is straightforward.
2. If not locally recoverable: pass the error to `skills/post-work-update.md` as a finding — it becomes a PLANS item in the owning locale.
3. Mark the failed work unit as `error` in PLANS (not ✓) with the SkillError attached — so the next FlatfileAgentialResourceSystemImproving pass can target it.

An error that reaches FlatfileAgentialResourceSystemImproving and is not routed is a bug in FlatfileAgentialResourceSystemImproving.

## Open questions

- Formal proof that the selection bias rule produces optimal ordering — blocked by: skill-algebra construction
- Formal definition of CoursOfWork as a typed object — blocked by: skill-algebra construction
