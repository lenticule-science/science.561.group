---
name: Obstacle
description: A condition that, if it holds, prevents a goal from being satisfied. A goal is a state assertion (what will be so), never the activity that reaches it; an obstacle is the goal's negated precondition, and it is resolved by eliminating it, reducing it, or weakening the goal it obstructs.
identity: obstacle
date-created: 2026-10-02
aliases:
  - obstacle
  - obstacles
  - obstacle analysis
provenance:
  authors:
    - emsenn
    - claude-opus-5-5
  sources:
    - "van Lamsweerde, A. and Letier, E. (2000). Handling Obstacles in Goal-Oriented Requirements Engineering. IEEE Transactions on Software Engineering 26(10), 978–1005."
    - "van Lamsweerde, A. (2009). Requirements Engineering: From System Goals to UML Models to Software Specifications. Wiley."
---

## Goals are states, not activities

In goal-oriented requirements engineering (KAOS), a **goal** is a prescriptive statement of intent about the system's states: *Achieve* (some state eventually holds), *Maintain* (a state holds throughout), *Avoid*, *Cease*. "The catalog lists every sibling series" is a goal. "Implement the catalog" is not: it names a means and leaves the end unsaid, so nobody can check whether it was met, and it takes from whoever does the work the choice of how. A goal is refined into subgoals until each is assignable to a single agent as a **requirement** (on the system) or an **expectation** (on its environment); see [requirements to specification](../topics/requirements-to-specification.md).

## Obstacles

An **obstacle** O to a goal G is a condition satisfying, for a domain theory Dom:

- **obstruction**: {O, Dom} ⊨ ¬G — if O holds, G cannot be satisfied;
- **domain consistency**: {O, Dom} ⊭ false — O can actually occur.

The obstacle is thus a *negated precondition* of the goal. Obstacle analysis runs alongside goal refinement: for each leaf goal, ask what could prevent it, and refine obstacles into sub-obstacles (AND/OR) until each is a leaf condition that can be observed. Classic obstacle categories are hazards, threats, *information unavailable*, *wrong belief*, *lack of capability*, *lack of resource* and *conflict* between goals.

## Resolution

An obstacle is not a work item: it is a fact about the world standing between a goal and its satisfaction. Its resolution is one of:

- **elimination**: make it impossible (prevent its precondition, substitute an agent that does not suffer it);
- **reduction**: make it less likely or less severe (deter, mitigate);
- **tolerance**: accept it and restore the goal after it occurs;
- **goal weakening**: restate the obstructed goal so the obstacle no longer obstructs it — the creditor's prerogative, since the goal is theirs.

## In the house

The work arena reads an obstacle as a `report` that `obstructs` a request or aim (or one stated requirement of it, `<thread>#<requirement>`) and names its `obstacle` kind: *capacity*, *capability*, *information*, *authority*, *dependency*, *resource*, *conflict*. A report of one kind on one thread is one condition: a second report corroborates it. *Information*, *authority*, *dependency*, *resource* and *conflict* block the thread — its horizon is *eventually*, nobody grabs it, and it awaits its opener's goal weakening (refine) or withdrawal while the obstacle awaits its own resolution. *Capacity* and *capability* do not block: an enterprise that cannot staff what it holds says so, and the market reads the thread as open to whoever can. A request whose need is a staffing need ("a qualified available carrier") is refused for the same reason: hands are a means, and a missing hand is an obstacle, not a goal. See the [note on the work arena's fifth edition](../../../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/10/02/2026-10-02-note-on-the-work-arenas-fifth-edition.md).
