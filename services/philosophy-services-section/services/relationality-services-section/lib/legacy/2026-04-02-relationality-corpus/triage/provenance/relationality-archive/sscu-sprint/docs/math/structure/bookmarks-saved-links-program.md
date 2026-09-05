---
name: bookmarks-saved-links-program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
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
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.

