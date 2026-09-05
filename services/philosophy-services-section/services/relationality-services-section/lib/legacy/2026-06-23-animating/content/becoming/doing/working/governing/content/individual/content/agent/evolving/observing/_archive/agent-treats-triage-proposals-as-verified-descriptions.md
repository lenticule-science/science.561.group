---
title: "Agent reads proposals in triage files and treats them as verified descriptions of the thing being discussed"
severity: data-hygiene
date-created: 2026-04-05
source: "captain call-out 2026-04-05 session 246e6d58"
triggered-by: session-246e6d58-default-first-officer
affects: [first-officer, all-agents-reading-triage]
---

## Problem

A triage note may contain BOTH (a) descriptions of an existing thing, AND (b) the note-author's own proposal for how to extend/adapt/combine existing things.
The agent reading the note treats (b) as if it were (a), extrapolates the proposal into code or schema, and cites the triage file as authority.

## Specific instance (2026-04-05)

The triage note `thing-kind-and-engine-as-tab.md` contained: - (a) A correct description of TAB's `thing` model and base-chain dispatch (drawn from actually reading TAB) - (b) A PROPOSAL to graft SHACL shape generation onto the pattern when porting to FARS

The first officer (this session) read the note, did not distinguish (a) from (b), and produced `operations/engineering/fars/kinds/*.md` files with `invariants:` lists — which is the SHACL proposal's shape, NOT what TAB does.
TAB does not validate via shape files, does not use W3C shape languages, and has nothing to do with SHACL.

## Root cause

Triage notes are written by the captain and others as mixtures of observation + proposal.
They do not always flag which lines are which.
The agent, optimizing for quick synthesis, treats the whole note as unified description.
The agent does not then verify by reading the thing being described (in this case, TAB's source at `operations/engineering/toys/tab/engine/`).

## Detection

Any time an agent cites a triage file as authority for a CLAIM about an existing system, without also citing the source files of that system, it may be propagating a proposal as if it were verified.

## Correction applied this session

1. Deleted `operations/engineering/fars/kinds/` (the SHACL-pattern files)
2. Added a `correction-2026-04-05` field to the triage note's frontmatter flagging which sections are proposal vs. description
3. Read TAB source directly and produced `operations/command/endeavor/records/analyses/tab-vs-qtops-source-read.md` with line-number citations into the actual TAB source files

## Desired behavior going forward

1. When a triage note describes a system (X), read X's source before citing the triage note as authority.
2. When writing code or records that claim "X does Y," the citation should be to X's source, not to a triage note about X.
3. Triage notes that conflate description and proposal should be corrected with a frontmatter flag when discovered.
4. Future triage notes should separate "what I observed in X" from "what I propose we do with X" structurally (e.g., `observation:` vs. `proposal:` sections with clear headers).
