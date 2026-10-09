---
name: predication-cell
description: An oriented triple (subject, predicate, object).
subject: entity
predicate: predicate
object: entity
member-of: predication-cell-set
articulating: relationlessness
---

A predication cell has three coordinates: a subject (an entity), a predicate (an object of the predicate-category), an object (an entity). The triple is oriented from subject to object through the predicate; $(s, p, o)$ and $(o, p, s)$ are distinct cells.

Cells are encoded in two registers:

- **Implicit.** A YAML frontmatter line `<key>: <value>` on a record at `<path>/<basename>.md`. The record's basename is the subject; the key is the predicate; the value is the object.
- **Explicit.** A JSON object `{"subject": ..., "predicate": ..., "object": ...}`.

A list-valued frontmatter field `<key>: [o_1, …, o_n]` encodes $n$ cells with the same subject and predicate.
