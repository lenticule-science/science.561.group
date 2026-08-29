---
title: Bookmarks & Saved Links
status: someday
keywords:
  - idea
  - bookmarks
  - links
---
# Idea: Bookmarks & Saved Links

Represent saved URLs as recognitions with context so they’re actually usable.

## 1. Recognitions

- `BookmarkRecognition`: URL, title, tags, saved date.
- `ContextNoteRecognition`: “why I saved this,” links to projects/ideas.

## 2. Measurement and topology

- Measurement:
  - revisit rates, age, link rot detection.
- Topology:
  - bookmarks ↔ projects, topics, people who shared them.

Runbooks: `save_bookmark`, `review_bookmarks`, `prune_stale_links`.
