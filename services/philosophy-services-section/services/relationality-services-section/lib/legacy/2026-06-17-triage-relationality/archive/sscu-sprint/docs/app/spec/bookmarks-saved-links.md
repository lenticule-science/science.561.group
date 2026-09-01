---
title: Bookmarks & Saved Links
keywords:
  - idea
  - bookmarks
  - links
part-of: relational-computer
description: "Represents saved URLs as recognitions with context so they are actually usable."
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

