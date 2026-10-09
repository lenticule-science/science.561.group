---
title: Six Dimensions of CL
description: "Outlines six architectural dimensions for CL: operations feedback, messaging, transactions, work ontology, learning theory, and harness parity."
date-created: 2026-04-04
type: note
name: cl-pipeline
keywords:
  - cl-pipeline
  - operations-feedback
  - settlement-path
  - learning-theory
  - work-ontology
specialization: plan
application: learning
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
serves-system: fars
date-revised: 2026-04-06
project: work-operations
department: engineering
cross-cuts: [command, science]
serves: [closed-learning-loop, agent-efficiency, ops-loop-functional]
implements: ops-feedback-stage
horizon: quarter
work-type: derivation
depends-on: [messaging-channel-infrastructure, transactional-record-infrastructure, session-lifecycle-infrastructure, convergent-enrichment-plan]
sources:
  - library/theories/science/theories/math/texts/algebraic-foundations-of-learning-systems.md
  - library/theories/humanities/theories/education/texts/training-as-closure.md
  - library/theories/humanities/theories/education/texts/situated-learning-and-communities-of-practice.md
  - library/theories/humanities/theories/education/theories/learning/terms/experiential-learning.md
  - library/theories/humanities/theories/sociology/theories/work/texts/algebraic-structure-of-work.md
  - library/theories/science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md
  - operations/engineering/fars/docs/specs/messaging-foundations.md
  - operations/command/ideas/algebraic-learning-calculus.md
  - operations/command/ideas/all-records-are-transactions.md
  - operations/engineering/fars/src/everything-claude-code/skills/continuous-learning-v2/SKILL.md
enabled-by:
  - agent-session-interfacer
  - cannibalize-pm-systems
  - entity-actor-model
  - foah-self-install
  - incremental-graph-updates
  - interfacer-entity-system
  - lens-entity-system
  - messaging-channel-infrastructure
  - planning-predication-and-ontological-dependencies
  - session-lifecycle-infrastructure
  - system-infrastructure
  - transactional-record-infrastructure
---

## The six dimensions

CL is not a standalone subsystem. It spans six dimensions that must all be addressed:

**1. Operations loop feedback.** CL IS the feedback stage (ops-feedback-stage). Lessons extraction, single/double-loop learning, settlement path application, decision records, impact analysis — all feedback-stage responsibilities that CL implements.

**2. Messaging.** Every CL record is a message obeying M0-M9. Observations have senders and channels. Instincts have witnesses. The delivery lifecycle (sent → delivered → acknowledged → acted-on → superseded) IS the instinct maturation path.

**3. Transactions.** Every CL event is a debit/credit on the operational ledger. Observation = attention debited, raw-data credited. Detection = raw-data debited, candidates credited. Confirmation = candidates debited, confirmed credited. Promotion = confirmed debited, skills/hooks credited. The detailed balance condition IS the learning-health check.

**4. Work ontology.** The settlement path (inquiry → derivation → procedure → process) IS the CL maturation path. Observation = inquiry. Instinct = derivation. Skill = procedure. Hook = process. Same vocabulary, same math, same code.

**5. Learning theory.** Grounded in Kolb (experiential cycle = the tick), Vygotsky (ZPD = composition ratio), Lave & Wenger (situated in practice = office-scoped), Piaget (accommodation = ⊤ from respond()), Bloom (mastery = fixed point), Gold/Angluin (learning = closure convergence), FCA (concept formation = instinct organization).

**6. Harness parity.** ECC v2.1 ships: observation hooks, project scoping, confidence scoring, 6 CLI commands, background observer, export/import, evolution, backward compat, privacy. Our system must match or exceed before adding novel capabilities.

## Open questions (carried forward + new)

- How large can settlement event JSONL get before generate.js chokes? Windowed parsing? Separate event graph?
- Self-composition granularity: per-session? per-day? per-office?
- Budget allocation: when does the MASH tick run consolidation vs. dispatch?
- Bootstrap: how do the first instincts get created before the algebra has material?
- What concretely is a "settlement partner" for an instinct? Passing test? Captain confirmation? Task completed without failure?
- Single vs. double loop: how does CL detect that the office structure itself needs changing, not just the instincts within it?
- Impact tracking: how do we measure whether an instinct actually improved outcomes? A/B testing? Before/after failure rates?
- Export/import: what format? Just the markdown files? Or a bundle with observation provenance?
