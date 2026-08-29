---
name: name
description: "A kebab-case identifier addressing a $thing on the filesystem — the basename of a directory or file modulo extension. Names parse against the project's name-grammar (gerund-headed for transformers, bare-noun for structures) per the skill-name specification."
specializing: identifier
parsing-as: name-parse-tree
conforming-to: grammar
references:
  - id: ieee10031-2017
    type: report
    title: IEEE Std 1003.1-2017 — Portable Operating System Interface (POSIX) Base Specifications, Issue 7
    institution: IEEE and The Open Group
    author:
      - literal: IEEE
      - literal: The Open Group
    issued:
      - year: 2017
---

A **name** is a kebab-case identifier — a string of lowercase ASCII letters, digits, and hyphens, beginning and ending with a letter or digit, with no consecutive hyphens. Concretely, a name matches the pattern `^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$` per [@ieee10031-2017]'s portable-filename-character-set restriction (POSIX 3.282) extended to require hyphens as the only separator.

A name addresses a $thing on the filesystem. The basename of a directory is the directory's name; the stem of a regular file (the filename modulo extension) is the file's name. Compound names (`predication-cell`, `checking-a-name-for-grammar`) carry an internal parse tree — [the name-grammar structure](../grammar/grammar.md) records the conformance rules a name must satisfy.

A name is invariant; a $thing keeps the same name regardless of the position it occupies in the recursive directory template. The same name may occur at multiple positions: [the four-bilattice entity record](../variety/library/bilattice/library/four-bilattice/four-bilattice.md) addresses the same $thing whether named in the bilattice library or referenced from another position. The name itself does not carry a path.
