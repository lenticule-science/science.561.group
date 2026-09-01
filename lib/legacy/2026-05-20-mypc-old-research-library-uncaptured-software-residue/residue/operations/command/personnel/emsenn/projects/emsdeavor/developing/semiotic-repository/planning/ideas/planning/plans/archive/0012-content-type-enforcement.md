---
title: "Content type enforcement"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: medium
depends-on: [3]
goal: "005"
milestone: ""
---

## Summary

Validate that files in typed directories (terms/, concepts/, topics/,
etc.) have correct `type:` frontmatter and follow the conventions for
their content type. A script checks and reports violations.

## Motivation

Content types (term, concept, topic, discipline, school, text) are
defined in the directory-organization spec but not enforced. A file
in `terms/` might lack `type: term` frontmatter, or a text might be
filed in `concepts/`. As the repository grows, structural drift
accumulates unless checked.

## Steps

1. Write `validate-content-types.py` that scans directories and
   checks frontmatter `type:` against directory conventions.
2. Report: files with wrong or missing type, files in wrong
   directories.
3. Add as a pre-commit or CI check.

## Done when

- [ ] Validator runs and reports violations
- [ ] Existing content passes or violations are documented
- [ ] Automated check exists

## Dependencies

- Plan 0003 (policy encoding — uses the same constraint vocabulary)

## Log

**2026-03-07** — Created. Identified during session mining as a
gap in the ASR spec enforcement.
