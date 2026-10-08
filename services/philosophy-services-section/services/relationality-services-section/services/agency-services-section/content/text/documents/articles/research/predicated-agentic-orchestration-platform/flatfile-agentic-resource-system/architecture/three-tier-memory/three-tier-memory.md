---
name: three-tier-memory
description: "The discipline that agent memory in FARS decomposes into exactly three persistence tiers with distinct cost, capacity, and access semantics: always-loaded (the agent's office fiber, loaded into context at session-start, capacity bounded by context-window economics); searchable (the substrate's event log plus its derived indexes, queried by filter at moderate cost); deep storage (the full predication-graph store, accessed by traversal at substrate cost)."
type: concept
class: framing
depends-on: [memory, session-as-entity, fiber, event-sourcing]
see-also: [session-record, observation-record, instinct-record, consolidate]
title: three-tier-memory
---

# Three-tier memory

The discipline that *agent memory in FARS decomposes into exactly three persistence tiers* with distinct cost, capacity, and access semantics: **always-loaded** (the agent's office fiber, loaded into context at session-start, capacity bounded by context-window economics); **searchable** (the substrate's event log plus its derived indexes, queried by filter at moderate cost); **deep storage** (the full predication-graph store, accessed by traversal at substrate cost).
Every piece of agent memory in FARS lives in exactly one tier; the substrate's discipline pins which.

The three-tier discipline emerged from convergent precedent across agent-memory systems (Letta/MemGPT's core/recall/archival, Cline's structured Memory Bank sections, OpenClaw's session/curator/dream split, ECC's structured compaction template).
The pattern repeats: *memory needs different costs for different access patterns*; *some memory is in every prompt, some is searchable on demand, some is deeply archived but reachable*; *the discipline of which content goes in which tier is editorial, not arbitrary*.

FARS's three-tier instantiation has zero novel infrastructure: the always-loaded tier IS the office fiber loaded by [`open-session`](../morphisms/open-session.md); the searchable tier IS the event log and its indexes per [event-sourcing](event-sourcing.md); the deep storage tier IS the substrate's full content per [flatfile](../../flatfile/flatfile.md).
The tiers are *names for substrate regions accessed differently*, not new substrate machinery.

## The three tiers

### Always-loaded — the office fiber at investiture

The agent's [`OfficeRecord`](../objects/office-record.md) (or set of office records, when the agent inhabits multiple offices) IS the always-loaded tier.
At session-start, [`open-session`](../morphisms/open-session.md) loads the office fiber and composes it into the agent's working context.
The agent reads this content directly without traversal cost; every prompt sees it.

Capacity: bounded by context-window economics.
An agent inhabiting a F2 (structured-fiber) office consumes characteristic budget; an agent inhabiting an F1 (prose-narrative) office consumes more.
The substrate's [formality-progression](../../formality-progression/formality-progression.md) discipline applies here: sharpening the office's fiber from F1 to F2 reduces always-loaded budget without reducing capability.

Edits: the agent MAY edit always-loaded content during a session per the substrate's `apply-edit` discipline.
The edits become substrate events; subsequent sessions see the edited office fiber.
(Compare Letta/MemGPT: the agent edits its core memory blocks; OpenClaw: SOUL.md is mutable across sessions.)

### Searchable — the event log and indexes

The substrate's [`Event`](../objects/event.md) log plus its derived indexes (entity-index, value-index, channel-filtered views) IS the searchable tier.
The agent does not read this content into every prompt; the agent *queries* it on demand by filter (channel + subject + actor + time-range).

Capacity: bounded only by storage.
The substrate's event log retains every event by default per [event-sourcing](event-sourcing.md)'s append-only discipline.
Search-index size is bounded by indexing-policy choice (which fields are indexed, which aren't).

Cost: characteristically lower than always-loaded (no per-prompt overhead) and higher than deep-storage (the indexes accelerate access).
Most operational queries hit this tier.

Examples of searchable content: past dispatch decisions (filter: channel=dispatch); recent observations on a session (filter: subject=session-id, channel=observation); accounting transactions over a period (filter: channel=accounting, time-range).

### Deep storage — the substrate

The substrate's full predication-graph (all `Note` entities, all fibers, all relations) IS the deep-storage tier.
Access is by traversal per [identity-by-relations](../../../../teaching/explanations/identity-by-relations.md): from a starting entity, walk relation predicates to neighbors.
Cost is bounded by the traversal's match-radius.

Capacity: the substrate's full size.
A large FARS substrate (49K+ entities in some operational deployments) holds effectively unlimited content for an agent's purposes; the agent reaches what's relevant via traversal.

Cost: highest per-access.
Deep-storage reads are typically reserved for *queries the agent cannot answer from always-loaded or searchable*: novel research questions, cross-domain syntheses, infrequently-needed reference material.

## What the discipline pins

- **Editorial discipline.** Content destined for the always-loaded tier (office fibers, session-startup material, kit-assembly composition) is curated by sharpening: prose narratives get structured into fiber predicates, redundancies are deduplicated, low-leverage content is moved to searchable.
  Per [formality-progression](../../formality-progression/formality-progression.md), the editorial work IS sharpening.
- **Cost-tier alignment.** Content's *cost-of-access* aligns with its *frequency-of-access*: high-frequency content lives in always-loaded; mid-frequency content in searchable; low-frequency content in deep-storage.
  Misalignment (a high-frequency lookup that requires deep-storage traversal every time) is a substrate-coherence diagnostic.
- **Consolidation between sessions.** Per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md), the substrate runs consolidation passes between sessions: observations from the searchable tier compose with one another to produce instincts, which (when crystallized) MAY be promoted to skill records and from there to office-fiber predicates in the always-loaded tier.
  The flow is *up the tier hierarchy* over time; this IS what learning looks like in FARS.

## What three-tier memory is not

- **Not a cache hierarchy.** The three tiers are not L1/L2/L3 cache; they are *editorial categories*.
  Content does not get "evicted" from always-loaded to searchable based on usage frequency; the substrate's discipline is editorial — content gets *moved* by [`apply-edit`](../../code/transformers/apply-edit.md) operations the substrate audits.
- **Not three storage systems.** Always-loaded is *not* a separate database; it's the office fiber, which lives in the substrate's entity store like any other entity.
  Searchable is the event log, which lives in the substrate's append-only log like any other event sequence.
  Deep storage is the substrate.
  One substrate, three views.
- **Not memory-as-side-effect.** A FARS session's context is not "what got mentioned in the chat history."
  It is *substrate content explicitly composed at session-start*.
  The agent's memory IS substrate predications, not transient runtime state.

## Position

Three-tier memory is the framing under which session machinery, consolidation passes, and learning are coherent.
Without the three-tier discipline, "session memory" would be either too costly (everything always-loaded) or too inaccessible (everything in deep storage).
With the discipline, session designers and corpus curators have a substrate-level vocabulary for *which tier a piece of content belongs in*, and the substrate's audit chain records every editorial move between tiers.

The framing depends on [event-sourcing](event-sourcing.md) (which makes the searchable tier authoritative) and [flatfile](../../flatfile/flatfile.md) (which makes the deep-storage tier human-editable).
It composes with [formality-progression](../../formality-progression/formality-progression.md) (which says always-loaded content benefits from sharpening) and [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md) (which describes how content moves up the tiers over time).
