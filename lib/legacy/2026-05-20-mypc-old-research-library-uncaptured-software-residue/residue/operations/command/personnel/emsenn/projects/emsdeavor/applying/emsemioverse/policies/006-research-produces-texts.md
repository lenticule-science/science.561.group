---
title: "Policy 006: Research produces texts"
date-created: 2026-03-07T00:00:00
type: policy
number: 6
keywords:
  - Policies
  - Research
  - Methodology
description: "When outside knowledge enters the vault, it arrives as a citable text with its own provenance — not as a summary in a conversation."
---

When outside knowledge enters the vault, it arrives as a citable text
with its own provenance — not as a summary in a conversation.

## What this means

Research agents tasked with surveying external literature, investigating
a practice, or answering a question should produce their output as a
text file placed in the appropriate discipline directory. The text
should have:

- A title describing its subject, not the task that prompted it
- A `date-created` field
- An `authors` field (typically `claude` for agent-produced research)
- A `cites` field listing the works engaged
- A `type: text` designation
- A Sources section with URLs for web-accessible references

The text is written about its subject, not about the conversation that
prompted it. A survey of digital notetaking practices belongs in
`information/texts/` or `technology/texts/`, titled for its content, not
filed as "research notes from session X." The text should be
intelligible to a reader who has no knowledge of the session that
produced it.

This serves policy 005 (accrete, don't replace): the text accretes
into the vault as a permanent, addressable, composable artifact. Future
sessions can cite it, build on it, or supersede it. Conversation
summaries cannot be cited and do not accrete.

It also serves policy 003 (ground in discipline practice): a text
with proper citations and provenance is grounded. A conversation summary
is hearsay.

## Operational implications

- When a research task is delegated to a subagent, the subagent's
  deliverable is a text file (or files), not a report back to the
  parent conversation.
- The text is placed in the discipline directory appropriate to its
  subject, following the directory organization spec.
- If the research introduces new terms or concepts, those should also
  be created as separate term/concept files (per policy 002).
- The parent conversation receives a summary of what was produced and
  where it was placed — not the research content itself.
- Slop-quality research (incomplete, unverified, or speculative) goes
  in `slop/` with a path mirroring the target discipline. It can be
  promoted to a published text through the evaluate-slop workflow.
- The research cadence from policy 003 applies: external research →
  encode as concepts/terms → compose into texts → develop curricula →
  implement as skills.
