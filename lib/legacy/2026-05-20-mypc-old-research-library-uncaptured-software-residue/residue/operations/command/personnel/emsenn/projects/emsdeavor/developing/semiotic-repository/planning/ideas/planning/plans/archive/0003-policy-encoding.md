---
title: "Encode policies as machine-readable constraints"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
status: draft
priority: high
depends-on: []
goal: "005"
---

## Summary

Policies currently exist as prose markdown files. They should also
encode their constraints as machine-readable frontmatter fields, so
that a script can determine which policies apply in a given directory
and check for contradictions.

## Motivation

When an agent works in `mathematics/`, policies 001 through 007
apply. Some of these have concrete, checkable implications:
- Policy 004 (constructive reasoning): `constructive_only: true`
- Policy 003 (ground in discipline practice): `requires_citation: true`
- Policy 006 (research produces texts): `research_output: text`

A script should be able to:
1. Given a directory path, collect all applicable policies (from
   the directory itself and all parent directories)
2. Output a terse summary of active policies
3. Detect contradictions between policies at different levels
4. Lower-level policies that explicitly contradict parent policies
   take precedence (specificity wins)

This is analogous to "policy as code" in infrastructure (OPA/Rego,
AWS SCPs, RBAC). The question is what the right vocabulary and
format are for a knowledge repository rather than a cloud environment.

## Open questions

1. **What is the right encoding format?** Research confirms (see
   `technology/texts/policy-as-code-for-knowledge-repositories.md`):
   "policy" is the standard umbrella term. Individual machine-readable
   statements are "rules" or "constraints." Policies are both the prose
   commitments and their machine-readable encodings — these are layers
   of the same thing.

2. **What fields should policies carry?** Candidates:
   - `applies_to: [list of content types or directories]`
   - Key-value policy rules like `constructive_only: true`
   - `overrides: [parent policy number]` for explicit contradiction
   - Research suggests typed rules: boolean, enum, string values.

3. **Where does the policy schema live?** In the policy spec? As
   frontmatter fields on existing policy files? Research suggests
   per-directory YAML files (following `.editorconfig` pattern) or
   structured frontmatter on existing policy files.

4. **How does this relate to AGENTS.md?** emsenn's insight: CLAUDE.md
   and AGENTS.md should be collections of the most important policies
   applicable in a directory, plus the terms needed to understand those
   policies. The agent instruction files are the *rendered output* of
   the policy system, not hand-written documents.

5. **Inheritance boundary**: ESLint deprecated cascading directory
   configs because unintended ancestor inheritance caused confusion.
   The lesson: support inheritance but provide a clear root boundary
   (`root: true`), and consider requiring explicit `inherit: true`
   rather than inheriting silently.

## Steps

1. Research policy-as-code patterns for applicability (DONE — see
   `technology/texts/policy-as-code-for-knowledge-repositories.md`)
2. Define the policy vocabulary (field names, value types)
3. Add machine-readable constraint fields to existing policy frontmatter
4. Write `resolve-policies.py` that, given a path, collects and
   resolves applicable policies
5. Write a SKILL.md for policy resolution
6. Consider: should AGENTS.md be generated from resolved policies?

## Done when

- [ ] Policy vocabulary defined (decision record)
- [ ] Existing policies carry machine-readable constraint fields
- [ ] `resolve-policies.py` runs and outputs resolved policies for a path
- [ ] Contradiction detection works

## Dependencies

- Existing policies (001-008)
- Directory organization spec (for inheritance model)
- Policy-as-code research (DONE)

## Log

**2026-03-07** — Created. Prompted by emsenn's observation that
policies should encode as machine-readable constraints, and that
CLAUDE.md/AGENTS.md should be collections of applicable policies
rather than hand-written documents.

**2026-03-07** — Research completed. "Policy" confirmed as correct
umbrella term. Key finding: ESLint's cautionary tale about cascading
directory configs — support inheritance but make it explicit and
provide root boundaries. Survey written as
`technology/texts/policy-as-code-for-knowledge-repositories.md`.
