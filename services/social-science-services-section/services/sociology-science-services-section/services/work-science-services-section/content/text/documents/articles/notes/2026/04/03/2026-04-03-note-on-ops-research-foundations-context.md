---
title: Work Operations Research Program
description: Specifies nine parallel research tasks, each producing a survey text grounded in foundational sources, to build a rigorous ontology of work operations.
date-created: 2026-04-03
type: note
name: ops-research-foundations-context
keywords:
  - work-operations
  - ontology
  - scheduling-dispatch
  - feedback-loops
  - organizational-learning
specialization: analysis
serves: ops-research-foundations
---

All nine research tasks parallel. Each produces a survey text. Each reads real sources — academic papers, practitioner literature, standards, indigenous governance — not Wikipedia or productivity blogs. Research is genuine inquiry. Terms come from research; schemas from terms; tools from schemas. Ordering not negotiable.

## research-ops-ontology-mapping — How the repo's own ontology applies to work operations

The foundational task. Repo has `library/terms/` base ontology (thing, object, quality, state, act, vessel, container) and triage app spec pattern (recognitions, topology, measurement, runbooks). Operations loop should be an APPLICATION of this ontology, not a separate system. A task IS a thing with qualities (status, work-type, priority) and a state. Acts change state. A plan IS a container. A project IS a vessel. A session IS a vessel. A milestone IS a state of a plan.

**Sources:** library/terms/ ontology; triage app spec pattern (read several); MUD architecture (LPC, MOO, Evennia); TAB (Things with Attributes and Behaviors); ECS; Evans (*Domain-Driven Design* 2003).

**Produces:** `work/texts/ontology-of-work-operations.md`

## research-ops-planning

**Sources:** CPM (Kelly & Walker 1959); PERT (Malcolm et al. 1959); Goldratt (*The Goal*, *Critical Chain*); Cohn (*Agile Estimating and Planning* 2005); PMBOK; Allen (GTD); Newport (*Deep Work*, *A World Without Email*); Bratman (*Intention, Plans, and Practical Reason* 1987); Haudenosaunee Gayanashagowa; Eisenhower, Forster, Bullet Journal; Claessens et al. (2007); Macan (1994).

**Produces:** `work/texts/planning-and-scheduling-survey.md`

## research-ops-dispatch

**Sources:** Mintzberg (*Structuring of Organizations* 1979); Fayol (1916); Barnard (*Functions of the Executive* 1938); Gulick & Urwick (1937); Conway/Maxwell/Miller (*Theory of Scheduling* 1967); Gerkey & Mataric (2004) MRTA taxonomy; Ohno (*Toyota Production System* 1988); Anderson (*Kanban* 2010); capability-based routing (call centers, hospitals, incident response); Weber on bureaucratic authority.

**Produces:** `work/texts/dispatch-and-delegation-survey.md`

## research-ops-execution

**Sources:** Harel statecharts (1987); van der Aalst (*Workflow Management* 2004); Little's Law (1961); Anderson on WIP caps; Reason (*Human Error* 1990); Dekker (2006); Miller/Galanter/Pribram (*Plans and the Structure of Behavior* 1960) TOTE units; medical handoff (SBAR); ACID/saga patterns.

**Produces:** `work/texts/execution-and-monitoring-survey.md`

## research-ops-tracking

**Sources:** EVM (ANSI/EIA-748); kanban metrics (lead/cycle time, throughput, CFD); burndown/burnup origins; Stevens (1946) measurement scales; Tufte (1983); Few (*Information Dashboard Design* 2006); accounting audit theory; PMI Standard for Portfolio Management.

**Produces:** `work/texts/tracking-and-measurement-survey.md`

## research-ops-review

**Sources:** AAR (US Army TC 25-20, 1993); Derby & Larsen (*Agile Retrospectives* 2006); Deming (*Out of the Crisis* 1986) PDCA; Schön (1983); Allspaw (*Web Operations* 2010) blameless post-mortems; academic peer review / code review / design critique; ISO 9001; Cooper (1990) stage-gate; Haudenosaunee council review.

**Produces:** `work/texts/review-and-retrospective-survey.md`

## research-ops-feedback

**Sources:** Wiener (*Cybernetics* 1948); Ashby (*Introduction to Cybernetics* 1956); Argyris & Schön (*Organizational Learning* 1978) single/double-loop; Imai (*Kaizen* 1986); Rother (*Toyota Kata* 2009); Holling (*Adaptive Environmental Assessment and Management* 1978); Nygard (2011) ADRs; Kohavi/Tang/Xu (*Trustworthy Online Controlled Experiments* 2020); safety-critical impact analysis; the existing instinct → skill → hook pipeline.

**Produces:** `work/texts/feedback-and-organizational-learning-survey.md`

## research-ops-cross-cutting

**Sources:** event sourcing (Greg Young), CQRS; Harel statecharts; Csikszentmihalyi (*Flow* 1990); Reinertsen (*Product Development Flow* 2009); kanban flow metrics; Lencioni (*Death by Meeting* 2004) cadence; ISO 15489; Western linear/indigenous cyclical/generational time; PMI Standard for Portfolio Management.

**Produces:** `work/texts/operations-cross-cutting-concepts-survey.md`

## research-ops-work-types — Are four types enough?

**Sources:** Perrow (*Normal Accidents* 1984) complexity/coupling; Thompson (*Organizations in Action* 1967) pooled/sequential/reciprocal; Cynefin (Snowden & Boone 2007); Stacey matrix; Dreyfus skill model; Klein (*Sources of Power* 1998) RPD. Challenge: routine maintenance? creative work? emergency response? negotiation?

**Key questions:** Is meaning-settled × execution-settled the right 2×2? Does literature use different classification? Third axis (urgency, stakes, reversibility)?

**Produces:** `work/texts/work-types-classification-survey.md` (or equivalent)
