---
title: Newsfeed & Activity Stream Analysis
status: someday
keywords:
  - idea
  - news
  - activitypub
  - feeds
description: Use the relational computer to analyze and reshape newsfeeds (RSS, ActivityPub, social timelines) as recognitions, instead of opaque ranked lists.
---
# Idea: Newsfeed & Activity Stream Analysis

Use the relational computer to analyze and reshape newsfeeds (RSS, ActivityPub,
social timelines) as recognitions, instead of opaque ranked lists.

## 1. Core recognitions

- `FeedSourceRecognition`
  - a source (RSS feed, ActivityPub actor, newsletter, site).
  - fields: URI, type, topics, trust level, update cadence.
- `FeedItemRecognition`
  - an individual item (article, note, thread head).
  - fields: title, summary, link, timestamp, tags.
  - topology: replies/threads, cross-posts, duplicates.
- `TopicClusterRecognition`
  - dynamic clusters of items around a theme or event.
- `SignalRecognition`
  - signals derived from items (e.g., sentiment, detected entities, “this is
    about your research”, “this mentions your friends”).

## 2. Intake and normalization

- Runbooks for `import_rss` and `import_activitypub_stream`:
  - ingest items as `FeedItemRecognition`,
  - map metadata into schemas (authors, links, media),
  - enforce policy (blocklists, NSFW, spam).
- Deduplication and threading:
  - link items that are cross-posts, quotes, or replies into conversation
    recognitions.

## 3. Measurement and topology

- Measurement channels:
  - per-source reliability, timeliness, relevance to you,
  - per-topic saturation, diversity (how many distinct voices?),
  - personal metrics (what you actually read, save, or ignore).
- Topology:
  - graph of sources, topics, and your own recognitions (research, projects,
    values).

## 4. Views and runbooks

- Views:
  - “Firehose”: raw intake view.
  - “Digest”: clustered, de-duplicated view by topic and trust.
  - “For this project”: items linked to specific research or tasks.
- Runbooks:
  - `generate_daily_digest`, `highlight_underrepresented_sources`,
    `surface_conflicting_claims`, `summarize_topic_for_you`.

The goal is a newsfeed that is:

- grounded in recognitions and their relations,
- transparent about why items appear,
- and alignable with your other domains (research, ecology, MUD, etc.).
