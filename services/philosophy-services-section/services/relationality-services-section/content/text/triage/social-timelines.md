---
title: Social Timelines and Personal Streams
status: someday
keywords:
  - idea
  - social
  - timelines
---
# Idea: Social Timelines and Personal Streams

Model Twitter/Mastodon-style timelines as views over recognitions, so your
relational computer can act as both a client and a small Fediverse server.

## 1. Core recognitions

- `ActorRecognition`
  - Accounts/identities (you, other people, bots, services), linked to keys,
    ActivityPub handles, and policies.
- `PostRecognition`
  - Statuses, toots, threads: content, media, references, language, and links
    to recognitions they talk about (papers, measurements, ideas, etc.).
- `InteractionRecognition`
  - Replies, boosts, likes, bookmarks, quote-posts; each with actor, target,
    and context (thread, conversation).
- `TimelineViewRecognition`
  - A particular assembled stream (home, local, federated, “research only”)
    with filters, ranking rules, and measurement channels.

## 2. Topology and measurement

- **Topology**
  - Follows/blocks/mutes as edges between `ActorRecognition`s with policy
    annotations.
  - Threads and conversations as trees or more general process-graphs of
    `PostRecognition`s and `InteractionRecognition`s.
  - Timelines as projections from actors + posts + interactions into ordered
    streams.
- **Measurement**
  - Per-stream metrics: volume, diversity, toxicity, novelty, “resonance” with
    your interests.
  - Health of relationships and communities (how balanced are voices, how often
    do specific actors appear, etc.).

## 3. Runbooks and flows

- `run_sync_activitypub_inbox/outbox`
  - Bridge ActivityPub messages into/out of recognitions, preserving signatures
    and ids.
- `run_build_timeline`
  - Given a `TimelineViewRecognition`, assemble and rank posts, emit measurement
    events, and materialize a view for GUI/API.
- `run_curate_feeds`
  - Suggest follows/blocks/mutes or timeline filters based on measurements and
    policies (e.g. reduce harassment, increase subject-matter diversity).

## 4. Cross-domain connections

- Integrates with:
  - `activitypub.md` for protocol/transport.
  - `newsfeeds-analysis.md` for ranking and health metrics.
  - `external-integrations.md` for bridging to other platforms.
  - Idea notes for domains you post about (finance, ecology, research, MUD) so
    posts can directly reference and update recognitions there.
