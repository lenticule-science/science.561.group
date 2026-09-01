---
title: Personal Site as Recognitions
status: someday
keywords:
  - idea
  - site
  - pkm
---
# Idea: Personal Website & PKM on the Relational Computer

This note sketches how to treat a personal website and personal knowledge base
as recognitions inside the universal relational computer.

## 1. Page and content model

- `PageRecognition`
  - fields: slug, title, content (markdown/HTML), status (draft/published),
    tags.
  - topology: navigation hierarchy, backlinks graph.
  - measurement: views, dwell time, link click rates.
- `NoteRecognition`
  - short-form notes, ideas, research snippets.
  - linked to pages, papers, experiments.
- `AssetRecognition`
  - images, code snippets, diagrams.
- `FeedRecognition`
  - describes how pages are aggregated into feeds (e.g., blog index, RSS/Atom).

All are ingested and managed via the same intake/policy/measurement/traceability
pipeline as everything else.

## 2. Intake and editing

- Editing tools (Markdown editor, note capture, upload forms) talk to `/api`:
  - create/update `PageRecognition` and `NoteRecognition`,
  - all mutations go through intake stack for schema + policy + normalization.
- Policy:
  - who may edit/publish/delete (you, future collaborators),
  - which content is public vs private vs internal.
- Traceability:
  - every edit becomes an `EventRecognition` with diff, timestamp, and author,
  - allows time-travel and audit (“when did I change this claim?”).

## 3. Topology and navigation

- Navigation is just topology:
  - edges `rel:linksTo`, `rel:isChildOf`, `rel:backlinks`.
  - site map is a view over the topology slice for `PageRecognition`.
- PKM connections:
  - notes and pages link to papers, experiments, MUD recognitions, etc.
  - cross-domain topology allows “see all recognitions related to X across
    math, ecology, MUD, and social.”

## 4. Measurement and feedback

- Measurement channels:
  - per-page views, reading time, scroll depth (if desired),
  - search queries, navigation paths.
- This supports:
  - refining information architecture (which paths work),
  - spotting stale pages (unused recognitions).

## 5. Publishing and feeds

- Runbooks:
  - `publish_page`: marks a page as public, updates feeds, invalidates caches.
  - `generate_feed`: constructs RSS/Atom/JSON feed from a set of page
    recognitions.
- The frontend (current React client or static export) is a view over:
  - public `PageRecognition` and `NoteRecognition`,
  - layout metadata (theme, ordering),
  - crosslinks into other domains (ActivityPub posts, MUD logs, research).

When implemented, your personal site and PKM would simply be another facet of
the same recognition graph that already holds your math, social data, and MUD
toy.
