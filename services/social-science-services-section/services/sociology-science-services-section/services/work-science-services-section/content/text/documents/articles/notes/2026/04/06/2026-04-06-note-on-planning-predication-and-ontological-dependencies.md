---
title: Planning Predication and Ontological Dependencies
description: Identifies planning gaps where concepts lack library terms and proposes ontological dependencies, campaigns, and concept grounding to close the vocabulary gap.
date-created: 2026-04-06
type: note
name: planning-predication-and-ontological-dependencies
keywords:
  - ontological-dependency
  - campaign
  - concept-grounding
  - planning-predication
  - library-terms
specialization: plan
application: planning
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
project: system-infrastructure
serves-system: fars
department: command
cross-cuts: [engineering, science]
serves: [operations-loop, endeavor-resource-planning, system-architecture-refactor]
depends-on: [interfacer-entity-system]
horizon: month
work-type: derivation
theory-source: library/theories/humanities/theories/sociology/theories/work/terms/enterprise.md
---

## The Problem

Our plans can say `depends-on: [other-plan]` — scheduling dependencies. But they cannot say "this plan requires the concept 'interfacer' to exist as a defined library term before its tasks are meaningful to the algebra." That's an ontological dependency: the plan operates in a universe that doesn't yet have the vocabulary it needs.

This matters here in a way it doesn't matter in normal software projects (see decision 005-library-operations-general-particular). In a normal repo, concepts come from external frameworks. Here, settle() traverses the library to compute what an entity's predicates are. If a concept has no library entity, the algebra literally has less to work with. An undefined concept isn't a documentation gap — it's a computational gap.

The audit of 7 infrastructure plans found that every single one assumes concepts without library terms. The four FARS operations (message, respond, settle, extract/apply) are the verbs the entire system runs on, and none have library terms. Plans reference H_t, H*_t, heartbeat, CRDT, interfacer, lens — all undefined in the library. This means the plans are, from the algebra's perspective, operating in a universe with missing vocabulary.

## The Campaign Gap

The work taxonomy has: enterprise > endeavor > goal > project > plan > task. What's missing is a coordinating concept between project and the whole endeavor — something that organizes a time-bounded, multi-project, multi-plan push toward a strategic intermediate objective.

"Make FARS read-write and self-learning" spans 9 plans, 3 projects, touches 4 goals. That's not a project (no temporal urgency). Not a plan (too big). It's what military and organizational theory calls a **campaign** — a coordinated push with a defined front and a defined objective, after which the landscape is different enough that the next campaign can begin.

The Haudenosaunee model (from ship.md): "When coordinated action was needed — a diplomatic mission, a military campaign, a trade expedition — the relevant nations commissioned ventures." Campaigns are what confederacies commission ships FOR.

## What Needs To Happen

### 1. Library terms for the planning vocabulary gaps

Before we can predicate plans properly, the concepts must exist:

- `campaign` — the coordinating concept: time-bounded multi-project push toward a strategic objective. Grounded in military theory (Clausewitz), organizational theory (Mintzberg's strategic initiatives), and the Haudenosaunee confederacy pattern.
- `ontological dependency` — the relationship where a plan requires a concept to be defined (have a library term with predicates) before its tasks can compose with the algebra. Distinct from scheduling dependency (plan-waits-for-plan) and resource dependency (plan-needs-capacity).
- `concept grounding` — the work-type for producing a library term that an operational plan needs. Not a "Phase 0" — it's a recognized type of work that produces library artifacts serving operational needs.

Also needed: library terms for the FARS operations themselves (message, respond, settle, extract, apply) — these are the most-used undefined concepts across all plans.

### 2. Planning predication enrichment

Plans need predicates that express:

- `requires-concepts: [list of library term ids]` — ontological dependencies. Each entry is either a library term (defined = satisfied) or a gap (undefined = blocking). The dispatch system can check: are this plan's required concepts all defined?
- `campaign: campaign-id` — which campaign this plan serves, enabling campaign-level views (all plans in a campaign, their collective progress, the campaign's strategic objective).
- `concept-grounding-tasks: [list]` — tasks within the plan that produce library terms (as distinct from implementation tasks that consume them).

### 3. Campaign as an organizing entity

A campaign entity carries:
- `objective` — the strategic intermediate aim (e.g., "FARS is read-write and can persist settlement results")
- `plans` — the plans coordinated under this campaign
- `front` — what the campaign is pushing against (the current state of the gap between where we are and the objective)
- `horizon` — the time bound
- `requires-concepts` — the library terms the campaign collectively needs
- `general/particular check` — for each concept the campaign uses, whether the general term exists (library) and the particular instance exists (operations)

### 4. Enforcing decision 005 (general/particular) in planning

Every plan should be auditable against decision 005: does it assume concepts that lack library terms? The audit we ran today found gaps in all 7 plans. This should be a standing check — when a plan is created or updated, its `requires-concepts` are checked against the library, and missing terms are flagged as ontological blockers.

## The Corrected Dependency Structure

What plans currently encode:
```
plan A depends-on plan B  (scheduling)
```

What plans need to encode:
```
plan A requires-concepts [X, Y, Z]    (ontological — do the concepts exist?)
plan A depends-on [plan B]             (scheduling — is the prerequisite work done?)
plan A part-of campaign C              (coordination — what strategic push is this serving?)
campaign C requires-concepts [X, Y, Z] (collective ontological — what does the whole push need?)
```

The ontological dependencies often cross-cut scheduling dependencies. Multiple plans need "interfacer" defined. Writing the library term once satisfies the ontological dependency for all of them. This is fundamentally different from scheduling, where each plan waits for its own specific predecessor.

## Connection to Cost Reduction

This plan serves the cannibalize-pm-systems goal directly: every concept we properly define in the library is a concept the algebra can compute with at zero inference cost. An agent that knows what an "interfacer" is (because the term has predicates) doesn't need to be told — it can compose. An agent operating without that term needs inference to guess what you mean. Proper planning predication → proper concept grounding → proper interfacers → reduced inference cost.

## What This Is NOT

This is not "add documentation to plans." Prose phases are the least meaningful representation. This is about giving the planning system predicates that express relationships it currently cannot see — so that dispatch, the bridge view, campaign-level reporting, and the CL pipeline can all operate on a world that has the vocabulary to describe itself.
