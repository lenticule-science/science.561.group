---
title: "Extend dispatch.py to filter by requires-capabilities subset of provides-capabilities"
specialization: task
date-created: 2026-04-30
plan: dispatch-graph-completion
depends-on: [dispatch-add-capabilities-to-agents]
status: open
work-type: procedure
priority: 2
requires-capabilities: [code-edit, dispatch]
requires-skills: [improve-skill]
produces: capability-aware-dispatch-script
touches: [operations/engineering/triage/operations/engineering/services/dispatch/triage/dispatch.py]
---

Replace the current fuzzy-text capability match in `eligible_agents()` with a strict set check: `requires_capabilities <= agent.provides_capabilities`.
Drop the legacy `fuzzy_requires` branch.

Acceptance: `dispatch.py achievement-system` returns the right agents based on capability match (or surfaces decomposition need); the rejection reasons cite specific missing capabilities.
