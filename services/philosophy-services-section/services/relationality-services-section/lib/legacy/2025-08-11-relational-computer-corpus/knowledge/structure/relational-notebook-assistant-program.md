---

name: relational-notebook-assistant-program
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program assists with note-taking and research by treating notes, links,
and queries as recognitions.

## Behaviour

- Represent notes, citations, queries, and summaries as recognitions with
  provenance.
- Link to domains and projects; keep trace for recommendations and retrieval.
- Measure recall, coverage, and usefulness of notes.

## Intended operators

- Capture and organise notes; annotate and link recognitions.
- Retrieve and summarise relevant notes for a task with traceable steps.
- Suggest gaps or next readings based on coverage measurements.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

