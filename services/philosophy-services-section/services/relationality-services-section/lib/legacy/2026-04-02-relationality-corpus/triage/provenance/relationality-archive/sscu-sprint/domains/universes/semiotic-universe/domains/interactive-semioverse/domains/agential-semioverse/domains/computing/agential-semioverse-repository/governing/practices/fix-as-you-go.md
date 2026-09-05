---

name: fix-as-you-go
date-created: 2026-03-09T00:00:00
introduces: practice
keywords:
  - repository-maintenance
  - agential-semioverse
description: "When you encounter a misplaced or malformed file during any work, fix it immediately rather than deferring to a batch sweep."
part-of: mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/practices
---

When working in the repository and you encounter a file that is
clearly in the wrong location, has incorrect frontmatter, or violates
a known standard: fix it now.

Do not add it to a list. Do not defer it to a sweep. Do not note it
and move on. Fix it, then continue the original work.

## Scope

This practice applies to clear violations — cases where the correct
location or fix is unambiguous. It does not apply to uncertain cases,
which should be noted in the relevant plan's log section.

## Why

Batch sweeps accumulate debt. Opportunistic fixes drain the debt
continuously. The cost of an individual fix during work is near
zero. The cost of running a formal sweep is nonzero. Over time,
fixing as you go produces a cleaner repository with less dedicated
cleanup work.

## Limits

- Do not let a fix-as-you-go expand into a full sweep of its own.
  Fix the file you found, not all files of that type.
- Do not fix files that other agents may be actively working on
  (check plan 0057 or active relocation work before moving files
  that are scope of that plan).
- Commit fixes separately from primary work when practical, so
  the commit history is readable.
