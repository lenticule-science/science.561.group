---
name: 2026-05-04-validate-takes-only-directories
description: fars validate refuses single-file arguments
type: friction-log
class: validator
date: 2026-05-04
status: open
see-also: [2026-05-04-validate-cross-theory-slug-resolution]
title: 2026-05-04-validate-takes-only-directories
date-created: 2026-05-04
---

# fars validate refuses single-file arguments

While iterating on swarm.md to fix a path error, I tried `fars validate <path-to-single-file>` to focus on one file's diagnostics without grepping through the whole theory's output.
Got:

```
fars validate: not a directory: <path>
```

Tried: validating the parent directory and grepping for the filename of interest.
Worked, but the grep had to be re-tuned each iteration to filter for newly-affected lines.

Had to: re-validate the whole `concepts/` directory each time, scrolling/grepping for relevant errors, instead of running validate on just the file I edited.

Violates: the substrate's [interfacer-discipline](../../../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md) commitment that operations compose at any granularity — a validator that cannot scope to a single file is a coarse-grained operator that doesn't compose with the natural unit of editing (a file).

Gap: `fars validate` should accept either a file or a directory and report diagnostics for the named entity.
A small change in the verb's argparse, presumably.
