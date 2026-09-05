---

title: "Campaign"
extends: [endeavor, container]
restricts: [endeavor]
description: "A time-bounded, coordinated push across multiple projects and plans toward a strategic intermediate objective. The organizing concept between project and enterprise — what confederacies commission ships to execute."
aliases: [campaigns]
contains: [project, plan]
serves: [goal, objective]
has: [objective, front, horizon, requires-concepts]
commissioned-by: [confederacy, enterprise, captain]
executed-by: [ship, crew]
bounded-by: [horizon, objective]
coordinates: [project, plan]
can-be-part-of: enterprise
distinguished-from: [project, plan, endeavor, mission]
date-created: 2026-04-06
references:
  - id: clausewitz1832
    type: document
    title: On War
    author:
      - literal: Carl von Clausewitz
    container-title: Dümmler
    issued:
      - year: 1832
  - id: mintzberg1994
    type: document
    title: The Rise and Fall of Strategic Planning
    author:
      - literal: Henry Mintzberg
    container-title: Free Press
    issued:
      - year: 1994
---

A campaign is a time-bounded, coordinated push across multiple projects and plans toward a strategic intermediate objective.
It is the organizing concept between [project](./project.md) (a container of plans toward one goal) and [enterprise](./enterprise.md) (the indefinite aim-generative activity).
A campaign says: "for this period, these projects and plans are coordinated toward THIS objective, after which the landscape is different enough that the next campaign can begin."

## What makes something a campaign

Four properties distinguish a campaign from a project or a plan:

1. **A strategic intermediate objective.** The objective is not the enterprise's ultimate aim — it is a waypoint that, once reached, materially changes what is possible.
  "Make the database read-write" is a campaign objective: once achieved, a whole class of downstream applications becomes possible.
  The objective is intermediate because the enterprise continues after it; strategic because reaching it transforms the available action space.

2. **Cross-project coordination.** A campaign coordinates work across multiple [projects](./project.md) and their [plans](./plan.md).
  A project groups related plans under one goal.
  A campaign groups related projects under one push.
  The plans within a campaign may belong to different projects, serve different goals, and be owned by different offices — but they share the campaign's objective and horizon.

3. **A time horizon.** Campaigns are bounded.
  Unlike an [endeavor](./endeavor.md) (which may be indefinite) or an [enterprise](./enterprise.md) (which is structurally ongoing), a campaign has an expected duration.
  The horizon may shift, but the commitment to temporal boundedness is constitutive — an open-ended campaign is a contradiction.
  This is what Clausewitz (1832) means by distinguishing a campaign (a season of operations) from the war itself.

4. **A front.** The campaign pushes against something — the gap between the current state and the objective.
  The front is where the actual work happens.
  It advances as plans complete and retreats when plans fail or new blockers emerge.
  The front makes progress visible in a way that individual plan status does not: you can see the campaign advancing even when individual plans are stalled, because other plans on the front are moving.

## The confederacy pattern

In the Haudenosaunee model, when coordinated action was needed — a diplomatic mission, a military campaign, a trade expedition — the relevant nations commissioned ventures with specific leaders and participants.
The campaign IS what confederacies commission [ships](./ship.md) to execute.
The ship's [charter](theories/governance/terms/charter.md) may encompass multiple campaigns over its lifetime, but each campaign is a distinct coordinated push.

Clausewitz distinguishes three levels: the war (political aim — indefinite), the campaign (strategic aim — seasonal), and the engagement (tactical aim — immediate).
This maps onto the work hierarchy: the enterprise is the war, the campaign coordinates projects toward a strategic waypoint, and tasks are the engagements.

## Ontological dependencies

A campaign's objective typically requires concepts to be defined before the coordinated work can proceed.
"Make the database read-write" requires certain concepts — e.g., "apply," "extract," "persist" — to exist as defined terms with predicates the system can compose with.
These are ontological dependencies — not scheduling constraints between plans, but requirements that the universe of discourse contains the vocabulary the campaign's plans need.

A campaign can therefore be audited: do the library terms its plans assume actually exist?
If not, concept-grounding work is part of the campaign whether or not it appears in any individual plan.

## Adjacent concepts

| Concept | Scope | Duration | Coordinates | Objective |
|---------|-------|----------|-------------|-----------|
| **Campaign** | Multiple projects | Time-bounded | Cross-project push | Strategic intermediate |
| [Project](./project.md) | One goal's plans | Until goal met | Plans under one goal | Goal satisfaction |
| [Plan](./plan.md) | One sequence of tasks | Until tasks done | Tasks in dependency order | Plan completion |
| [Endeavor](./endeavor.md) | One committed striving | Aim-terminated or indefinite | Self-contained | The aim itself |
| [Enterprise](./enterprise.md) | Aim-generative activity | Indefinite | All endeavors | Ongoing excellence |
| Mission | Externally commissioned | Defined end-state | Assigned resources | Mission order fulfilled |
