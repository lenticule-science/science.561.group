---
title: Session Lifecycle Infrastructure
description: Proposes session entities with investiture/relief lifecycle to enable bounded observation windows for continuous learning pipelines.
date-created: 2026-04-06
type: note
name: session-lifecycle-infrastructure
keywords:
  - session-entity
  - investiture-relief
  - observation-window
  - office-dispatch
  - cl-pipeline
specialization: plan
project: local-service-system
serves-system: fars
department: engineering
cross-cuts: [command]
serves: [operations-loop, endeavor-resource-planning]
depends-on: [messaging-channel-infrastructure, fars-architecture-coherence]
horizon: quarter
work-type: derivation
sources:
  - library/theories/humanities/theories/sociology/theories/work/theories/governance/terms/investiture.md
  - operations/engineering/fars/docs/terms/hohfeldian-relief.md
  - library/theories/humanities/theories/sociology/theories/work/terms/watch.md
  - library/theories/humanities/theories/sociology/theories/work/terms/shift.md
  - library/theories/humanities/theories/sociology/theories/work/terms/lifecycle.md
  - library/theories/engineering/theories/tech/theories/computing/texts/dwarf-fortress-simulation-for-agentic-systems.md
  - library/theories/humanities/theories/education/texts/naval-and-military-officer-training.md
enabled-by:
  - agent-session-interfacer
  - incremental-graph-updates
---

A session is a trace through the history monoid T. It has a beginning (investiture — an office assumes a duty), a middle (observation window — bounded work producing settlement events), and an end (relief — office released, session summarized).

Currently sessions are tracked informally: session-start.js writes some state, session-end.js counts tool calls, mash-engine spawns processes. None of this uses FARS entities. A session is not a message on any channel. The system can't answer "what did session X produce?" via respond().

## What a session entity looks like

```yaml
id: session-2026-04-06-first-officer-001
form: session
office: first-officer
task: cl-pipeline-enrichment
invested-at: 2026-04-06T10:00:00Z
relieved-at: 2026-04-06T12:30:00Z
channel-subscriptions: [operations/events, learning/observations]
settlement-events: 47
entities-created: 12
entities-modified: 8
status: completed
```

## Reference systems

**Naval watch system** (naval-and-military-officer-training.md): watches have defined start/end, officer-of-the-deck, specific duties, relief protocol. A watch IS a session. PQS qualification gates determine who can stand watch. The Voidfleet Academy certifies which offices can be invested.

**Dwarf Fortress** (dwarf-fortress-simulation-for-agentic-systems.md): dwarves have job assignments with implicit investiture (assigned to a workshop) and relief (job completed or interrupted). DF tracks what each dwarf produced during their assignment. Our analog: session entities track what each office produced.

**Rimworld** (rimworld-colony-management-for-agentic-systems.md): colonists have work schedules (sleep/work/joy). The transition between work periods is an implicit investiture/relief. Mood effects accumulate during work periods. Our analog: session-bounded observation accumulation.

## Why this enables CL

The CL pipeline needs bounded observation windows. "What did the researcher learn during this session?" requires knowing when the session started and ended, what office was invested, and what task was assigned. Without session entities, observations are an unbounded stream with no context.

## Open questions

- Should investiture require captain approval (per the investiture term: μ=1 mutual acknowledgement) or can offices self-invest for routine work?
- How does this connect to MASH session management? MASH already spawns/reaps processes — should those become investiture/relief messages on a channel?
- What happens when a session is interrupted (not relieved properly)? Emergency succession per hohfeldian-relief?
