---
title: "Linting Skills Composition"
aliases:
  - "Linting Skills Composition"
  - "linting skills composition"
date-created: 2025-12-25T00:00:00
---


Idea: build a “lint files” meta-skill that detects file types, selects appropriate lint sub-skills, and returns a single envelope of issues. It should:

- Accept file paths or roots, infer type (markdown, python, yaml, json, etc.), and fan out to type-specific linters.
- Aggregate results into one stable, idempotent report (consider using the error-envelope discipline).
- Allow configuration for which linters to run/skip and how to treat warnings vs. errors.
- Produce both human-readable text and machine-readable JSON so downstream agents can act on findings.
- Support dry-run and incremental modes (only re-lint changed files).

Why: keeps linting predictable in the semioverse, avoids bespoke per-file ad-hoc scripts, and gives agents a standard entrypoint for quality checks.
