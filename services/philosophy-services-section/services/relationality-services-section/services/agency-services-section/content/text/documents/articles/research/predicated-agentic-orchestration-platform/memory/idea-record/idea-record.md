---
type: definition
class: substrate-entity
realizes: [settlement-path]
depends-on: [office-record]
see-also: [plan-record, observation-record]
title: Idea record
description: "An idea record is the substrate-entity formal definition of an item of uncommitted potential work: a possibility the platform has noted but has not yet committed to performing."
---

# Idea record

An **idea record** is the substrate-entity formal definition of an item of *uncommitted potential work*: a possibility the platform has noted but has not yet committed to performing.
Ideas sit before [plan-records](plan-record.md) in the work-item progression: an idea is a candidate; a plan is a commitment.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the proposed work.
- **`motivation`** — predications declaring why the idea is worth considering: which observed pattern, which gap, which opportunity, which user request the idea responds to.
- **`scope`** — reference to the [scope](../../scope/scope.md) the idea would operate within.
- **`proposed-by`** — reference to the entity (agent, office, or external party via boundary) that proposed the idea.
- **`derived-from`** — optional references to substrate content that motivated the idea: [observation-records](observation-record.md), failure diagnoses, recurring patterns, governance discussions.
- **`considered-against`** — optional predications declaring what alternatives the idea is competing with.
  Multiple ideas in the same area inform each other.
- **`status`** — declarations of where the idea stands: `proposed`, `under-review`, `accepted`, `rejected`, `dormant`.
  Most ideas are dormant most of the time.
- **`closure-kind`** — `idea`.

## Invariants

- **Motivation substrate-stated.** The idea's motivation cites substrate content; uncited "I think we should..." motivations don't satisfy the discipline.
- **Status-transitions reversible (compared to plans).** Unlike plan-records (whose status moves forward), idea-records' status may return to dormant after rejection or after-rejection-reconsideration is admissible.
  Ideas have a less-strict status discipline than plans.
- **Substrate-resident.** Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), ideas are queryable.

## Operations

- *Propose.* An entity creates an idea-record citing motivation.
  The proposal is witnessed; the idea enters the substrate at status `proposed`.
- *Review.* The idea is examined by an authority (governance, a specific office, the agent community).
  Review may produce predications elaborating the motivation, considering alternatives, identifying risks.
  The review process is substrate-recorded.
- *Promote.* Per [promote](../../office/promote/promote.md), an idea may be promoted to a [plan-record](plan-record.md): the substrate creates a new plan-record citing the idea-record as `promoted-from`.
  The idea's status becomes `accepted` (or remains `proposed` if multiple plans derive from one idea); the new plan begins its own status arc.
- *Reject.* An idea can be rejected explicitly with a recorded reason.
  Rejected ideas remain queryable; they may be re-proposed later if circumstances change.
- *Park.* An idea can be moved to `dormant` — neither pursued nor rejected, but kept for possible later consideration.

## Position in the platform

Idea records are the platform's *speculative-work-item* substrate.
They are how possibilities accumulate before they become commitments.
A platform that does not record ideas has uncommitted thinking living only in agent memory or external documents; a platform that does accumulates ideas as substrate content, available for review, promotion, or comparison.

Per [settlement-path](teaching/explanations/settlement-path.md), the work-item progression — *idea → plan → runbook → completed-execution* — parallels the learning progression — *observation → instinct → skill → tool*.
Both are substrate-level maturation arcs; both produce settled content from raw input over time.
The platform's economy depends on both maturations: learning produces reusable engineering capacity; work-item maturation produces accomplished work.
