---
description: "Locates the spec file for concept X by searching spec/ by filename and frontmatter id. Use whenever a skill needs to know whether a spec file exists for X before deciding to write or update it."
skill-closure-kind: procedure
title: find-spec-file
---

# find-spec-file

Given: X — a CamelCase name or kebab-case id.

1. Convert X to kebab-case.
  Call this `target_id`.

2. Search `spec/` for files matching any of:
   - exact filename `spec/[target_id].md`
   - filename containing `target_id` (e.g. `spec/[target_id]-spec.md`)
   - frontmatter `id: [target_id]`

3. If exactly one match: output its path as `spec_file`.
  If multiple matches: output the most specific match (exact filename first, then id match, then partial filename).
  Note the others to the caller.
  If no match: output `spec_file = null`.
