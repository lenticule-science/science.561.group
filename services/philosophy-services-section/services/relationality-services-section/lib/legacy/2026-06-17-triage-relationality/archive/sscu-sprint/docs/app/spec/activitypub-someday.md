---
title: ActivityPub on the Relational Computer
keywords:
  - idea
  - activitypub
  - social
part-of: relational-computer
description: "Hosts an ActivityPub-compatible social server on the universal relational computer using recognitions."
---
# Idea: ActivityPub as Recognitions

This design note describes how to host an ActivityPub-compatible social server
on the universal relational computer. The goal is to treat ActivityPub objects
(Actors, Notes, Follows, Likes, etc.) as recognitions, so that:

- intake, topology, measurement, and traceability apply to all social activity,
- social graphs, posts, and interactions live in the same lattice as math, MUD,
  ecology, and personal notes.

## 1. Core mapping

We model ActivityPub concepts as recognitions:

- `ActorRecognition` (Person, Application, Service)
  - fields: ActivityPub ID, inbox/outbox URLs, public keys, profile metadata.
  - topology: social graph (followers/following), instance relationships,
    permission scopes.
- `NoteRecognition`
  - fields: content, attachments, visibility (public/unlisted/followers),
    tags/mentions.
  - measurement: engagement metrics (likes, boosts, replies), spread across
    instances.
- `ActivityRecognition` (Create, Like, Announce, Follow, Undo…)
  - fields: type, actor, object, targets, timestamps.
  - traceability: incoming HTTP request, signature, validation status,
    policy decisions.
- `InboxEventRecognition` / `OutboxEventRecognition`
  - records of inbound/outbound ActivityPub deliveries, retries, errors.

Each recognition is versioned, measured, placed in topology (social + instance
graphs), and recorded in traceability.

## 2. Intake and validation

Incoming ActivityPub messages are handled by the existing **ingestion gateway**
and **intake stack**:

- **Schema**: JSON-LD payloads are validated against ActivityStreams/ActivityPub
  schemas (wrapped as recognition schemas).
- **Policy**:
  - instance-level policies (blocklists, rate limits, content filters),
  - actor-level policies (trust scores, verification).
- **Normalization**:
  - canonicalize IDs, strip/encode HTML to internal representation,
  - map ActivityPub types to internal recognition types.
- **Metadata**:
  - record `intake_trace_id`, instance origin, HTTP signature verification
    result.

Only if intake succeeds do we create/update `ActorRecognition`, `NoteRecognition`,
or `ActivityRecognition` instances.

## 3. Topology for social graphs

We use topology for:

- **Social graph**:
  - edges: follows, blocks, mutes, group membership.
  - used for visibility (who sees what), delivery prioritization, and policy
    evaluation (e.g., “distance” from known spam sources).
- **Instance graph**:
  - recognitions for remote instances; edges for federation relationships and
    trust levels.
- **Conversation graph**:
  - threads as recognitions linking Notes and Activities, with partial views
    depending on visibility.

The **topology integration service**:

- encodes constraints like: “boost cannot increase visibility outside allowed
  circles” or “content from blocked instances cannot enter certain strata”,
- provides placement hints for storage/sharding.

## 4. Measurement and observability

Measurement channels capture:

- per-note metrics: likes, boosts, replies, reach,
- per-actor metrics: posting rates, interaction patterns, trust/abuse scores,
- per-instance metrics: latency, failure rates, moderation load.

The **measurement fabric**:

- stores these observables as measurement recognitions,
- enforces invariants (rate limits, abuse thresholds),
- feeds dashboards, moderation tools, and runbooks.

## 5. Traceability and moderation

Traceability allows:

- reconstructing why a post was accepted, delivered, filtered, or removed,
- showing “how this instance came to trust/distrust another,”
- providing proofs for moderation decisions (to players/users or external
  auditors).

Recognitions:

- `ModerationDecisionRecognition`: depends on content, policies, measurements
  (e.g., abuse scores), and past behavior.
- `AppealRecognition`: user challenges to moderation decisions.

Runbooks encode workflows for:

- handling reports,
- applying/removing blocks,
- propagating decisions across instances.

## 6. Minimal slice to implement later

When ready, a minimal vertical slice could be:

- single-user server hosting:
  - one `ActorRecognition` (you),
  - `NoteRecognition` for posts,
  - simple `Follow`/`Like` Activities to/from one remote instance.
- runbooks for:
  - `create_note`, `receive_note`, `receive_like`, `send_outbox`,
  - `moderate_note`, `block_instance`.

All surfaced via:

- HTTP ActivityPub endpoints,
- `/api` endpoints for recognitions and runbooks,
- optional UI page (“Social”) built on top of these recognitions.

