---
title: Reading List & Media Queue
status: someday
keywords:
  - idea
  - reading
  - media
---
# Idea: Reading List & Media Queue

Keep books, articles, podcasts, and videos as recognitions with clear status.

## 1. Recognitions

- `MediaItemRecognition`: title, type, source, length, topics.
- `QueueEntryRecognition`: ordering in a queue (to-read, to-watch, etc.).
- `CompletionRecognition`: when/how something was finished.

## 2. Measurement and topology

- Topology:
  - items ↔ topics ↔ projects; items ↔ people who recommended them.
- Measurement:
  - completion rates, time spent, topical balance over time.

Runbooks: `add_to_queue`, `choose_next_item`, `review_consumption`.
