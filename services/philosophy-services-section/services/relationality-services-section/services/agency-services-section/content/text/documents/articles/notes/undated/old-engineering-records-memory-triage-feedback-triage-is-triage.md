---

name: feedback_triage-is-triage
description: Files in triage locations (docs/app/spec/, triage/, ideas/) are brainstorms and early sketches. Don't treat them as authoritative specs, module catalogs, or product roadmaps.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_triage-is-triage
---

The ~126 app idea files in `docs/app/spec/` and similar locations are triage — ideas from earlier phases, not authoritative specifications. The user explicitly told Claude this and Claude still wrote objectives treating them as a "module catalog" to curate and prioritize.

**Why:** The user said "what's in relationality is actually triaged content — I actually just moved it around." Claude then wrote an objective called "module-catalog-current" treating the triage ideas as an authoritative product catalog, with priority frameworks and readiness assessments.

**How to apply:** When referencing triage content, always mark it as triage. Don't build plans or objectives that treat triage ideas as deliverables. Triage content may inform future work, but it needs evaluation first. The user decides what's authoritative, not the presence of files in a directory.
