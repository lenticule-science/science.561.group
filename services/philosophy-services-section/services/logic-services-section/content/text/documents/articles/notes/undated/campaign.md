---
name: campaign
description: A time-bounded coordinated push across multiple projects toward a strategic intermediate objective. An entity-form whose characteristic predication-shape names an objective, a horizon, and a set of coordinated projects.
title: campaign
---

## Pure form

A campaign is a bounded coordinated push toward a strategic waypoint. The defining predication: `(campaign, has-objective, objective)` together with `(campaign, coordinates, project)` for each project under the campaign. The campaign's objective is *intermediate* — it is not the commissioning agent's ultimate aim, but reaching it materially changes what is possible afterward.

A campaign is what a confederacy commissions a [ship](../../../../../../../../../social-science-services-section/content/text/glossary/terms/ship.md) to execute. The ship may sustain multiple campaigns across its charter; each campaign is a distinct push with its own horizon.

## Characteristic predication-shape

- `has-objective(campaign, objective)` — the strategic intermediate target; the individuating predication.
- `coordinates(campaign, project)` — project under this campaign's coordination.
- `has-horizon(campaign, date | duration)` — the expected duration; the time bound.
- `has-front(campaign, front-description)` — the gap between current state and objective that the campaign pushes against.
- `commissioned-by(campaign, confederacy | enterprise | captain)` — who commissioned the campaign.
- `executed-by(campaign, ship | crew)` — who carries the campaign.
- `requires-concepts(campaign, term)` — ontological dependencies; vocabulary that must exist for the campaign's plans to compose.
- `has-status(campaign, {draft | active | done | abandoned})` — current lifecycle state.

## Time-bounded invariant

Campaigns are bounded. An open-ended campaign is a contradiction. The horizon may shift, but the *commitment to temporal boundedness* is constitutive.

## Cross-project coordination

A campaign coordinates work across multiple projects. A project groups plans under one goal; a campaign groups projects under one push. The plans within a campaign may belong to different projects, serve different goals, and be owned by different offices — but they share the campaign's objective and horizon.
