---
name: orphaned files in a directory
description: The subset of files within a directory whose paths and stems do not appear in any other file in the repository.
---

Orphaned files in a directory is the set `{f ∈ D : refs(f) ∩ corpus(repo \ {f}) = ∅}` where `D` is the directory, `refs(f)` is the set of strings the corpus would cite to refer to `f` (its repository-relative path, its basename, its stem), and `corpus(repo \ {f})` is the union of every other file's text.
A file is orphaned iff none of its reference strings appear anywhere else.

The form is observational: the set is what `grep` over the corpus yields when each candidate is checked.
It is a snapshot — adding a reference to an orphan removes it from the set; deleting the last citation of a non-orphan adds it.
