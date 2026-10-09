---
type: concept
class: declaration
depends-on: [agent-community, scope]
see-also: [governance, agential-self-generation]
title: Governing soul
description: A substrate entity declaring what a scope fundamentally exists for and what it must never compromise — the operational identity that constrains every action the scope's agents take.
---

# Governing soul

A substrate entity declaring *what a scope fundamentally exists for and what it must never compromise* — the operational identity that constrains every action the scope's agents take.
The governing soul is the first act of a live agential scope: it is written by the [agent community](agent-community.md) once that community is constituted, and it stands as the substrate-level reference for every subsequent operation.

The structural claim is that the soul is a *constraint*, not a description.
A soul that says "we exist to publish careful research, never compromised" is a constraint on every action: a [skill invocation](../../skill/skill-invocation/skill-invocation.md) that would publish research without care produces a [witness](../../teaching/explanations/witness.md) that the soul's closure rule flags as a soul-violation.
The soul's predications are consulted by closure rules across the scope; an action inconsistent with the soul is detectable as substrate content.

Three engineering properties:

- **Written by the community, not external authority.** The soul is what the agent community commits to.
  It is not imposed from outside the scope; it is the community's collective declaration of what this scope is for.
  Per [agential self-generation](../agential-self-generation/agential-self-generation.md), the soul is itself a substrate entity authored by the community's substrate operations.
  The soul's content is queryable; its drafting history is in the [event log](../../../objects/event-log.md).
- **First act, not pre-installed.** The soul is the *first* act of a live scope, not an artifact installed before agents arrive.
  A scope that has been declared with an agent community but has not yet produced a soul is in a recognizable transitional state: the community exists, but their collective commitment has not been written.
  Producing the soul is the substrate operation that transitions the scope from "agent community declared" to "agential scope live."
- **Enforced by closure rules.** Once the soul exists, closure rules consult it on every relevant action.
  An action whose effect would contradict the soul is flagged at substrate level — the substrate produces a soul-violation predication, the [governance](governance.md) machinery handles the resolution (escalation, requested abort, recorded warning).
  The soul is not a documentation artifact; it is operative substrate content.

The pattern lets the platform support genuinely-different sub-scopes within one substrate: a sub-scope dedicated to careful research has a different soul from a sub-scope dedicated to rapid prototyping, and operations admissible in one are flagged in the other.
The substrate's closure rules consult each scope's soul; the same action performed in different scopes produces different outcomes.

The soul is *immutable in spirit* but *editable as content*.
A soul edit is a substrate operation, recorded in the event log; an auditor can trace the soul's evolution.
But the engineering discipline is that soul edits are governed: the community must agree, the change is reviewed, the edit's [witness](../../teaching/explanations/witness.md) cites the resolved discussion.
A scope whose soul is edited casually is one whose operational identity is unstable.
