---
name: reading-media-queue
keywords:
  - idea
  - reading
  - media
part-of: relational-computer
description: "Keeps books, articles, podcasts, and videos as recognitions with clear status."
---

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

