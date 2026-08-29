---
title: "Specification treatment for git-commit"
date-created: 2026-03-08T00:00:00
authors:
  - claude
status: draft
priority: medium
depends-on: [50]
goal: "006"
---

## Summary

Give "git commit" the full specification treatment: concept page
(exists), general specification, semiotic convention, semiotic
conformance specification, and operational skills. This produces a
complete chain from the discipline concept through to the semiotic
practice, following the pattern established for "specification."

## Motivation

The commit-repository skill already exists and agents use it every
session. But it operates from vibes — there is no specification that
says what a commit in this repository MUST look like. The git-commit
term page defines what a commit IS (in computing), but there is no
bridge from that definition to the repository's actual commit
conventions.

Without a specification chain:
- The commit-repository skill has no normative reference
- Commit message format, scope, and co-authorship conventions are
  undocumented
- There is no general specification for "what makes a good commit"
  that other projects could reuse
- The semiotic layer (how commits work in semiotic universes
  specifically) is conflated with general git practice

### Discipline grounding

Per the assembly principle (plan 0050), the general specification
should draw from established computing practice:
- Conventional Commits specification
- Linux kernel commit guidelines
- Git project's own commit conventions
- The existing git-commit term page and commit-messages curriculum

The semiotic layer then assembles what's relevant to semiotic
universes: provenance requirements, changelog integration, agent
co-authorship, body-preservation invariants.

## Steps

### Phase 1: Verify discipline coverage

1. Review the existing git-commit term at
   `technology/disciplines/computing/software/git/terms/git-commit.md`
   — confirm it covers the concept adequately for the general spec
   to reference.
2. Review the commit-messages curriculum at
   `technology/disciplines/computing/software/git/curricula/commit-messages.md`
   — assess whether it has content that should feed the general spec.
3. Research established commit conventions (Conventional Commits,
   kernel guidelines) and create a text summarizing the discipline
   landscape if no adequate coverage exists.

### Phase 2: General specification

4. Create `technology/specifications/git-commit-specification/index.md`
   using the make-specification skill. This specifies what a
   well-formed git commit is IN GENERAL — not semiotic-specific.
   Normative requirements should cover:
   - Commit message structure (subject, body, trailers)
   - Atomicity (one logical change per commit)
   - Referential integrity (what a commit references)
   - Authorship attribution
5. Create the scaffold format file alongside the index.

### Phase 3: Semiotic convention

6. Create `technology/specifications/semiotic-git-commit/index.md`
   using the make-semiotic-specification skill. This defines how
   commits work in semiotic universes specifically:
   - Provenance requirements (how commits serve the audit trail)
   - Changelog integration (how commits feed semiotic-changelog)
   - Agent co-authorship conventions (Co-Authored-By trailers)
   - Body-preservation relationship (commits must not alter
     existing content semantics)
   - Relationship to semiotic-versioning (when commits trigger
     version changes)

### Phase 4: Semiotic conformance

7. Create `technology/specifications/semiotic-git-commit-specification/index.md`
   using make-semiotic-specification. Conformance requirements for
   implementations that claim to follow the semiotic-git-commit
   convention.

### Phase 5: Operational integration

8. Update the existing commit-repository skill to reference the
   new specification chain as its normative source.
9. Verify the specification chain is consistent: each layer
   references the layer below it.

## Done when

- [ ] git-commit term page reviewed and adequate
- [ ] git-commit-specification created (general conformance)
- [ ] semiotic-git-commit created (semiotic convention)
- [ ] semiotic-git-commit-specification created (semiotic conformance)
- [ ] commit-repository skill references the specification chain
- [ ] Conceptual dependency map updated with new nodes
- [ ] Plan 0033 log updated

## Dependencies

- Plan 0050 (specification treatment pattern — provides the method)
- specification-specification and make-specification skill (complete)
- semiotic-specification-specification and make-semiotic-specification
  skill (complete)
- git-commit term (exists)

## Log

**2026-03-08** — Created. Scoped to the full specification treatment
for git-commit following the pattern established for "specification."
The git-commit term already exists; the commit-repository skill
already exists but lacks a normative reference. Discipline grounding
should draw from Conventional Commits, kernel guidelines, and
existing curriculum content.
