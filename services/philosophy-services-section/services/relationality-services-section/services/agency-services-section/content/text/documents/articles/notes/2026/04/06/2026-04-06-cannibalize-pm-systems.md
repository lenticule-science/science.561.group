---
name: cannibalize-pm-systems
specialization: plan
date-created: 2026-04-06
project: system-infrastructure
serves-system: fars
department: engineering
cross-cuts: [command, science]
serves: [agent-efficiency, erp-capabilities, operations-loop]
depends-on: [interfacer-entity-system]
horizon: quarter
work-type: inquiry
sources:
  - library/theories/engineering/theories/tech/theories/computing/texts/agentic-harness-landscape-2026.md
  - library/theories/engineering/theories/tech/theories/computing/texts/ecc-skill-system-analysis.md
  - library/theories/engineering/theories/tech/theories/computing/texts/ecc-hook-architecture-analysis.md
  - library/theories/engineering/theories/tech/theories/computing/texts/ecc-agents-and-commands-analysis.md
  - library/theories/engineering/theories/tech/theories/computing/texts/cline-architecture-analysis.md
  - library/theories/engineering/theories/tech/theories/computing/texts/openclaw-architecture-analysis.md
  - library/theories/engineering/theories/tech/theories/computing/texts/multi-agent-orchestration-frameworks-2026.md
  - library/theories/engineering/theories/tech/theories/computing/texts/dwarf-fortress-simulation-for-agentic-systems.md
  - library/theories/engineering/theories/tech/theories/computing/texts/rimworld-colony-management-for-agentic-systems.md
  - library/theories/engineering/theories/tech/theories/computing/texts/lpmud-architecture-for-agentic-systems.md
  - library/theories/engineering/theories/tech/theories/computing/texts/voyager-skill-library-analysis.md
  - library/theories/humanities/theories/sociology/theories/work/terms/progressive-automation.md
enabled-by:
  - create-as-message
  - foah-self-install
  - interfacer-entity-system
  - planning-predication-and-ontological-dependencies
aliases:
  - Cannibalize modern PM and agentic systems into FARS interfacers
title: cannibalize-pm-systems
description: "The focus: reduce computational cost by building FARS interfacers that replicate what project management and agentic systems provide — but at zero inference cost, because the algebra does the computation."
---

The focus: reduce computational cost by building FARS interfacers that replicate what project management and agentic systems provide — but at zero inference cost, because the algebra does the computation.

Every Asana feature, every ECC skill, every Jira workflow is an interaction pattern.
The question for each: can respond() compose the answer?
If yes, the interfacer replaces the agent's inference with the algebra's computation.
Cost drops from ~$0.10/query to ~$0.00/query.

**What to cannibalize from PM tools** (Asana, Linear, Jira, Notion): - CRUD on work items → message(entity, {predicate changes}) → settle → persist - Status views (Kanban, Gantt, calendar) → respond(project, {lens: view-type}) → format - Notifications → heartbeat-subscribed entities + channel delivery - Search/filtering → respond(query-fiber, {filter predicates}) - Reporting/metrics → respond(accounts, {lens: transaction, period: week}) - Automation rules → hooks + entity heartbeat subscribers

**What to cannibalize from agentic systems** (ECC, Cline, OpenClaw, Voyager): - Continuous learning → CL pipeline via respond()-based detection (already planned) - Skill evolution → settlement path (instinct → skill → tool → hook → interfacer) - Memory systems → entity fibers (the entity's fiber IS its memory) - Context composition → interfacer contract (what the agent-session interfacer sends) - Progressive automation → each interfacer deployed = permanent cost reduction

**What to cannibalize from game systems** (DF, Rimworld, LPMud, Voyager): - Task assignment → respond(office, task) dispatch - Skill progression → formality staircase F0→F3 - Mood/needs → running balance on office fibers - Production chains → entity flow through predicate changes - Heartbeat → fiber gap computation (H_t ≠ H*_t) - Inter-object messaging → message() IS call_other()

**The measurement:** cost-per-workunit tracked per session.
A workunit = one task completed, one term written, one plan step advanced.
As interfacers deploy, cost-per-workunit declines.
Captain's directive: "don't enforce budgets — track cost-per-workunit declining over time."
