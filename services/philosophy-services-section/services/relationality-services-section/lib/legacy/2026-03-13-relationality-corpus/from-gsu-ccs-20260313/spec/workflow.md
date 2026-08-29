---
name: workflow

description: "A Workflow is a set of Work whose initial domain type equals its final codomain type. The internal structure (flat sequence, web of derivations, etc.) is unconstrained. A Workflow is itself a WorkItem."
defines: Workflow
describes: Work, Working, Improving
---

## What this is

A **Workflow** is a set of [Work](work.md) — [WorkItems](work-item.md), which may
themselves be atomic or Workflows — with one algebraic constraint:

**Initial domain type = final codomain type.**

The Workflow takes something of type X and produces something of type X, regardless
of what happens internally. The internal structure is unconstrained: flat sequence of
processes, branching web of derivations, parallel inquiries, nested Workflows. What
matters is the boundary: same type in, same type out.

A Workflow is itself a [WorkItem](work-item.md): it is the composite (recursive)
case of WorkItem. Anywhere an atomic WorkItem can appear, a Workflow can appear.

## Note on planning containers

What the current `PLANS.md` format calls a "workflow" (a `### Name / **Produces:** /
**Complete when:**` section grouping checklist items) is more precisely a
[Task](task.md): a named, bounded planning container. A Task IS a Workflow when it
satisfies the domain=codomain constraint. Many Tasks do; not all need to.

The distinction: Workflow is an algebraic type; Task is a planning concept.
Workflow is the *what*; Task is the *where it lives in the plan*.

WorkUnits do not float free. Every WorkUnit belongs to a workflow. A WorkUnit
that does not belong to a named workflow cannot be prioritized, coordinated, or
determined to be done — it is an orphan with no context for what "finished" means.

PLANS.md in each department is the record of that department's potential and
completed workflows.

## Relationship to Working and Improving

**Working** (§working) executes one WorkUnit from a workflow's queue, without
selection bias.

**Improving** (§improving) is a workflow whose WorkUnits are specifically
SkillfulWorkUnits targeting the health and capability of a department. Improving
has selection bias (prefer work that unblocks more work) and tail-end feedback
cycles. The improve-X skills implement the Improving workflow for each department.

Every Improving pass is a Workflow. Not every Workflow is an Improving pass.

## Structure of a workflow

A workflow entry in PLANS.md MUST state:

```
### [workflow name]
**Produces:** [named output — what exists when this workflow is complete]
**Complete when:** [condition — how to know the workflow is done]
**Status:** active | complete | blocked | abandoned

WorkUnits:
- [ ] [work item] — [one sentence]
- [x] [work item] — done
```

## MUST

- Have a named output — a workflow that does not state what it produces cannot
  be known to be complete
- Have a completion condition — without one, the workflow loops indefinitely and
  is an open-ended session, not a workflow
- Contain only WorkUnits that contribute to its named output — work that does not
  advance the workflow's output does not belong in it; it belongs in another
  workflow or in IDEAS
- Be recorded in the department's PLANS.md

## CAN

- Contain WorkUnits of any type (skillful or ad-hoc)
- Spawn new WorkUnits during execution when gaps are discovered (via post-work-update)
- Be blocked (all its current WorkUnits have unmet dependencies) — blocking is a
  valid state, not a failure
- Be abandoned with an explicit reason — abandoned is better than silently stalled

## CANNOT

- Have an unnamed output — "do things in spec/" is not a workflow; "all spec files
  have required frontmatter" is
- Have no completion condition — "ongoing improvement" is not a condition; it is
  a department's perpetual state, which is captured by the Improving workflow type
- Span multiple departments without a named handshake object — cross-department
  work MUST be split into one workflow per department with a named artifact passed
  between them via INBOX

## Pending

- Formal correspondence between Workflow and higher mathematical structures in the
  relational universe — not yet established
