---
description: Validate plan status fields, priority, required frontmatter, and log sections across all plan files
id: validate-plan-status
name: validate-plan-status
version: [0, 1]
type: operational
runtime: script
triggers:
  - "validate plans"
  - "check plan status"
  - "plan validation"
inputs: {}
outputs:
  errors: number
  warnings: number
region:
  reads: ["content/technology/specifications/agential-semioverse-repository/plans/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
follows-policies: [1]
---

Validate all plan files for correct status, priority, required fields,
and log sections.

## Usage

```bash
python3 content/technology/specifications/agential-semioverse-repository/plans/skills/validate-plan-status/validate-plan-status.py
python3 content/technology/specifications/agential-semioverse-repository/plans/skills/validate-plan-status/validate-plan-status.py --verbose
```

Exits with code 1 if any errors are found. Warnings are only shown
with `--verbose`.

## What it checks

- Status is one of: draft, proposed, accepted, active, completed,
  abandoned, deferred, rejected
- Priority is one of: critical, high, medium, low
- Required frontmatter fields exist: title, date-created, status
- Completed plans have a `## Log` section
- Active plans have a `depends-on` field

## Progressive automation note

This is a stage 4 (procedural) skill — fully deterministic, no
inference required. It was created by extracting the validation
rules from the plans specification at `plans/index.md` and encoding
them as a Python script.
