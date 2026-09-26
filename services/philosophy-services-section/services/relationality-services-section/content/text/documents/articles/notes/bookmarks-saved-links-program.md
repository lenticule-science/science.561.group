---
title: Bookmarks & Saved Links Program
id: bookmarks-saved-links-program
role: structure
status: someday
proof_refs: []
derives-from:
  - computer/type/documentation-interpreter
description: Program idea to manage bookmarks and saved links as recognitions in the relational computer with useful context.
---



Program idea to manage bookmarks and saved links as recognitions in the
relational computer with useful context.

## Behaviour
- Recognitions:
  - `BookmarkRecognition`: URL, title, tags, saved date.
  - `ContextNoteRecognition`: why it was saved, links to projects/ideas.
- Measurement/topology:
  - revisit rates, age, link rot detection.
  - links between bookmarks ↔ projects/topics/people.
- Runbooks:
  - `save_bookmark`, `review_bookmarks`, `prune_stale_links`.

## Proof
- Derived from: [Documentation Interpreter](./documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
