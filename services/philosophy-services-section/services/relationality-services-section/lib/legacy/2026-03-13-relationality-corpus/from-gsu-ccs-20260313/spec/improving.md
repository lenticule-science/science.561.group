---
name: improving

description: "Working applied specifically to SkillfulWorkUnits, with selection bias toward enabling more work, feedback cycles, and error routing."
defines: Improving
describes: Working, SkillfulWork, AgentLoop
domain: SkillfulWorkQueue
codomain: ImprovedDepartment
---

## What this is

**Improving** is a specialization of Working (§working) that targets
SkillfulWorkUnits (§skillful-work) specifically. It adds three things that plain
Working lacks:

1. **Selection bias** — among available work units, Improving prioritizes those
   that enable more work: unblocking dependencies, repairing broken skills,
   filling missing specs. A work unit that enables ten more units is preferred
   over one that enables none.

2. **Feedback cycles** — Improving always ends with a learning capture step
   (`skills/post-work-update.md`). Discoveries made during work are routed back
   into PLANS and IDEAS. Nothing is discarded.

3. **CoursOfWork improvement** — for Derivation and Inquiry work units,
   Improving triggers a tail-end improvement pass over the skills and units
   accessed during the work. See §course-of-work below.

## Selection bias rule

When choosing among open work items, Improving MUST rank by:

1. **Unblocking** — items whose completion directly enables one or more currently
   blocked items to become available
2. **Repair** — items that fix broken or malformed SkillfulWorkUnits
3. **Gap-filling** — items that create new SkillfulWorkUnits where none exist
4. **Ordinary work** — items with no downstream enablement

Within each rank, tie-break by whichever item appears earliest in PLANS.

Plain Working takes item 1 from the queue regardless of rank. Improving re-sorts
the queue before taking item 1.

## CoursOfWork

The **CoursOfWork** of a Derivation or Inquiry execution is the set of:
- Skills invoked (directly or as sub-skills)
- Spec files, math units, or other files read as context
- Skills or files that produced unexpected outputs or errors

At the end of any Derivation or Inquiry, Improving MUST collect the CoursOfWork
and pass it to `skills/post-work-update.md` as part of `findings`. Each item in
the CoursOfWork that showed a problem triggers a feedback entry. Each item that
worked perfectly is noted but does not generate work.

This is not optional. A Derivation or Inquiry that produces a judgment without
examining what it used to get there has not closed its loop.

## Error routing

When a Process or Procedure called during Improving emits a SkillError
(§skill-result), Improving MUST:

1. Attempt local recovery if the error class is `MissingInput` or `ValidationFailure`
   and the recovery is straightforward.
2. If not locally recoverable: pass the error to `skills/post-work-update.md`
   as a finding — it becomes a PLANS item in the owning department.
3. Mark the failed work unit as `error` in PLANS (not ✓) with the SkillError
   attached — so the next Improving pass can target it.

An error that reaches Improving and is not routed is a bug in Improving.

## MUST

- Only target SkillfulWorkUnits — ad-hoc work goes through Working (§working)
- Apply the selection bias rule before picking each work item
- Call `skills/post-work-update.md` after every work unit
- Collect CoursOfWork after every Derivation or Inquiry and include it in findings
- Route all SkillErrors — locally if possible, to PLANS if not
- Loop until all three exit conditions hold (§agent-loop): PLANS empty, compliance
  clean, no missing concepts

## CANNOT

- Exit while any exit condition is unmet — early exit is a defect in the
  Improving skill, not a valid completion
- Discard a SkillError — every error either gets fixed or enters PLANS
- Skip the CoursOfWork step for Derivations and Inquiries

## Pending

- Formal proof that the selection bias rule produces optimal ordering —
  blocked by: skill-algebra construction
- Formal definition of CoursOfWork as a typed object — blocked by:
  skill-algebra construction
