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
title: name
---

A **name** is a kebab-case identifier — a string of lowercase ASCII letters, digits, and hyphens, beginning and ending with a letter or digit, with no consecutive hyphens. Concretely, a name matches the pattern `^[a-z0-9](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/name/?:[a-z0-9-]*[a-z0-9])?$` per [@ieee10031-2017]'s portable-filename-character-set restriction (POSIX 3.282) extended to require hyphens as the only separator.

A name addresses a $thing on the filesystem. The basename of a directory is the directory's name; the stem of a regular file (the filename modulo extension) is the file's name. Compound names (`predication-cell`, `checking-a-name-for-grammar`) carry an internal parse tree — [the name-grammar structure](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/grammar.md) records the conformance rules a name must satisfy.

A name is invariant; a $thing keeps the same name regardless of the position it occupies in the recursive directory template. The same name may occur at multiple positions: [the four-bilattice entity record](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/variety/library/bilattice/library/four-bilattice/four-bilattice.md) addresses the same $thing whether named in the bilattice library or referenced from another position. The name itself does not carry a path.
