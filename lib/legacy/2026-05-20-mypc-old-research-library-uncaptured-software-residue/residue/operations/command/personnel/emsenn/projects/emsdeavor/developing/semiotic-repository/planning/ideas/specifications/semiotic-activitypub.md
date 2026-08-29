---

title: ActivityPub Simulation
aliases:
  - ActivityPub Simulation
  - activitypub simulation
date-created: "2026-03-04T00:00:00"
keywords:
  - simulation
  - activitypub
  - activitystreams
depends_on:
  - theorem/external/relational-activity-streams
  - specifications/policy
  - specifications/traceability-graph
type: specification
description: Specification for simulating ActivityPub federation by routing ActivityStreams interactions through the relational knowledge graph and policy layers.
target-discipline: technology
triage-status: promotable
---


# Specification (ActivityPub Simulation)

Implement the Relational ActivityStreams correspondence by routing
ActivityPub interactions through the knowledge graph and policy/trace
layers, without introducing a separate ActivityPub-specific store.

## State representation

- **Actors.**
  - Represent local users and contexts as TracePoints whose content
    includes ActivityStreams-compatible fields (id, type, inbox,
    outbox, followers, preferredUsername, etc.).
- **Objects.**
  - Represent posts, notes, articles, and other resources as knowledge
    TracePoints with additional ActivityStreams type annotations
    (Note, Article, Document, etc.).
- **Activities.**
  - Represent ActivityStreams Activities as TracePoints and/or trace
    steps whose content records:
    - actor, object, target IDs,
    - activity type (Create, Update, Delete, Follow, Like, Announce),
    - timestamps and addressing information.

## Inputs

1. Inbound ActivityPub HTTP requests (inbox) carrying ActivityStreams
   JSON-LD payloads.
2. Outbound publication requests from local actors (e.g. "publish this
   knowledge resource").

## Procedures

1. **Inbound handling (inbox).**
   - Validate HTTP request (signatures, addressing, content-type).
   - Parse ActivityStreams JSON-LD into an observation payload and
     normalise it into one or more TracePoints plus edges in the
     knowledge graph.
   - Apply policy regimes to decide whether to accept, restrict, or
     reject the activity; log audit entries and measurement events.
2. **Outbound publication (outbox).**
   - Given a local knowledge resource or activity, construct an
     ActivityStreams object/activity from the corresponding TracePoints
     and edges.
   - Apply policy and topology constraints to determine recipients and
     addressing.
   - Deliver to remote inboxes via HTTP, recording trace/audit entries
     for the send.
3. **State reconciliation.**
   - Periodically reconcile ActivityPub state (followers, likes,
     boosts) with the internal knowledge graph by updating TracePoints
     and edges rather than maintaining a separate follower/like model.

## Invariants

- All ActivityPub-visible state (actors, objects, activities) is
  representable as TracePoints and edges in the knowledge graph.
- Policy evaluation and audit logging occur for both inbound and
  outbound activities, respecting the same regimes used for other
  simulations.
- ActivityPub operations do not bypass the knowledge graph: they are
  always implemented via acts and runbooks, preserving traceability
  and topology constraints.

