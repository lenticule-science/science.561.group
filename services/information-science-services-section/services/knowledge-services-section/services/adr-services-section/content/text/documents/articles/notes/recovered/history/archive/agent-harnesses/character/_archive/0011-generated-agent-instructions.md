---

name: 0011-generated-agent-instructions
date-created: 2026-03-07T00:00:00
authors:
  - claude
priority: medium
depends-on: [0003-policy-encoding, 0001-per-directory-agent-instructions]
milestone: ""
specialization: research
---

## Summary

CLAUDE.md and AGENTS.md files should be generated from resolved policies rather than hand-written.
A script resolves applicable policies for a directory, collects essential terms, and renders an agent instruction file.

## Motivation

Decision 0003 established that agent instructions should derive from policies.
Plan 0001 creates per-directory AGENTS.md files.
Plan 0003 encodes policies as machine-readable constraints.
This plan connects the three: once policies are encoded and directories have instruction files, the instruction files should be generated artifacts, not hand-maintained documents that drift from the policies they represent.

## Steps

1. After plans 0001 and 0003 are complete, write a `generate-agents-md.py` script that:
   - Takes a directory path
   - Resolves applicable policies (using plan 0003's resolver)
   - Collects essential terms from the directory
   - Renders an AGENTS.md file
2. Generate AGENTS.md for all discipline directories.
3. Add a CI/pre-commit check that AGENTS.md files are up to date.

## Done when

- [ ] Script generates AGENTS.md from resolved policies
- [ ] Generated files match or improve on hand-written versions
- [ ] Staleness check exists

## Dependencies

- Plan 0001 (per-directory agent instructions — provides the template and initial files)
- Plan 0003 (policy encoding — provides the resolver)

## Log

**2026-03-07** — Created.
From decision 0003 and plan 0003 open question #4.
