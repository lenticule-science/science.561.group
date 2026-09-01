---
title: "Triage processing"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: []
goal: "003"
milestone: "governance-foundation"
---

## Summary

Process the 100+ items in `triage/` systematically. Triage is the
repository's inbox — emsenn's raw notes, ideas, and materials that
have not yet been classified, titled, or routed to their proper
discipline locations.

## Motivation

The triage directory contains ~87 "Untitled" files plus named
directories (AGRODAO, Delta Register, Groundhog Autonomous Zone,
Marmot Manual, etc.) and subdirectories (applications, collapse
dynamics, computer-architecture, engine, library, old-notes,
relations, specifications, texts, theorem, triage-materials). This
is a large body of emsenn's thinking that is invisible to the rest
of the repository.

Until triage is processed, the repository is missing signal. These
files contain ideas, corrections, research directions, and domain
knowledge that should be encoded as terms, concepts, texts, plans,
policies, or questions in the appropriate disciplines.

## Steps

1. Read every file in `triage/` (including subdirectories).
2. For each file, classify it:
   - **Idea** → encode as a concept or text in the right discipline
   - **Research direction** → write a plan or question
   - **Correction/instruction** → encode as a policy or decision
   - **Raw note** → extract meaning, write as a text, discard the
     original
   - **External material** → route to the right discipline, add
     proper frontmatter and citations
   - **Duplicate/obsolete** → mark for deletion (confirm with emsenn)
3. For each classified item, use the appropriate skill (encode-learning,
   create-plan, record-decision) to create the proper content.
4. After processing, move the original triage file to a `triage/processed/`
   directory (do not delete — emsenn may want to review).
5. Report a summary of what was processed and where it went.

## Done when

- [ ] Every file in triage/ has been read and classified
- [ ] Classified items have been encoded as proper content
- [ ] Processed originals moved to triage/processed/
- [ ] Summary report written

## Dependencies

None — triage processing can happen at any time.

## Log

**2026-03-07** — Created. emsenn requested triage processing as a
standing plan. ~100 items in triage/ including 87 untitled files and
several named directories.
