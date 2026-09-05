---
title: "Scripts cleanup"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: low
depends-on: []
goal: "003"
milestone: ""
---

## Summary

Audit utility scripts in `slop/` and the repository root `scripts/`
directory. Give each script a proper home, document it, or deprecate it.

## Motivation

Scripts accumulate in slop/ and scripts/ without documentation or clear
ownership. Some may be obsolete, some may duplicate skill functionality,
and some may be useful but undiscoverable. Cleaning this up makes the
tooling legible.

## Steps

1. List all scripts in `slop/` and `scripts/`.
2. For each script: determine if it is active, what it does, and
   whether a skill or spec already covers its function.
3. Active, useful scripts: move to the appropriate specification
   directory (e.g., semiotic-markdown/skills/ or
   agential-semioverse-repository/plans/skills/).
4. Obsolete or duplicate scripts: delete with a commit message
   explaining why.
5. Remaining scripts: document with a comment header or README.

## Done when

- [ ] All scripts in slop/ audited
- [ ] All scripts in scripts/ audited
- [ ] Useful scripts have proper homes and documentation
- [ ] Obsolete scripts removed

## Dependencies

None.

## Log

**2026-03-07** — Created from TODO.md unplanned item.
