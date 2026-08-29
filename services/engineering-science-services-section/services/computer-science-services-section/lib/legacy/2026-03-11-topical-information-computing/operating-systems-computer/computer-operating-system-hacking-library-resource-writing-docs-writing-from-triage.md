---
name: writing
gerund: writing
agent-noun: writer
imperative: write
description: Producing text and committing it to substrate or to an addressed file.
---

A write transformer.
Output is persisted text — a new file, an appended segment, or a substitution within an existing file — and the substrate gains the resulting bytes.
The transformer is unitary at the call boundary: each invocation produces one committed write, with the inputs naming the address and the bytes naming the change.

## Domain and codomain

- **Domain:** a write-spec — a tuple of `(address, content)` where address is a file path (absolute or relative to CWD) and content is a string of bytes (typically UTF-8 markdown).
  Additional fields may scope the write (e.g., heading to place under, timestamp to associate with the content).
- **Codomain:** a witness record naming the resulting file, the bytes added, and whether the write created the file or extended it.

## Morphological forms in naming grammar

- `gerund: writing` heads skills built on this transformer: `writing-a-diary-entry`, `writing-a-term-or-concept`, etc.
- `agent-noun: writer` heads agents that invoke such skills: `writer-of-a-diary-entry`, etc.
- `imperative: write` heads scripts that body such skills: `write-a-diary-entry.mjs`, etc.
