---
name: feedback_no-ad-hoc-frontmatter
description: Never add a frontmatter key to a record without a term file defining it + a script that parses it + documentation. No invented predicates. No ad hoc hacks.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: feedback_no-ad-hoc-frontmatter
---

Before writing any new frontmatter key onto a record, that key must already have: (1) a term file in `library/` or `operations/engineering/fars/docs/terms/` defining what the predicate means; (2) a parsing/validation script that operates on it; (3) documentation in the FARS spec showing how it composes. If any of those are missing, the key does not exist yet — define it first via the proper command/workflow, then use it.

**Why:** Session 246e6d58 (2026-04-05) invented ~10 new frontmatter keys (`grounds-in`, `done`, `not-done`, `superseded-by-source-read`, `corrections-applied`, `failure-modes-defended-against`, `open-questions-resolved-by-research-not-opinion`, `grounds-pm-decomposition-in`, `serves-charter-function`, `serves-via-charter`) onto plan records with zero definitions, zero parsing support, zero integration with existing FARS tooling. Captain verbatim: "Making up new frontmatter without documentation, without scripts for parsing, without term files to define them, this is all just making everything worse." The captain has spent years building a real predication-driven substrate where every predicate is a thing in the graph with its own fiber algebra; inventing keys bypasses that substrate and accumulates cruft that later has to be audited out. It is ad hoc hackery masquerading as structured data.

**How to apply:** When you would reach to add a new frontmatter key: STOP. Check whether an existing predicate does the job. If not, the work is not "add the key" but "define the predicate properly" — write a term file for it, add parsing to `fars-core.js` / graph generators, add it to the FARS docs, THEN use it. If that pipeline is too heavy for what you want to express, you're probably trying to cram into frontmatter what belongs in a different record type, or the thought isn't ready to be structured data yet. Prose notes in triage are preferable to invented predicates in official records. Also: when cleaning up records, the invented-predicate cleanup is part of the cleanup — remove or reduce to existing predicates, do not preserve inventions just because they're already there.

**Related failure modes (from this session):**
- Prose enrichment sections dated `## 2026-04-05 ...` added to plan bodies — dates belong in events/frontmatter, not as body-section organizers
- Reading triage proposals as verified descriptions of existing systems
- Treating captain-decides questions as opinion-calls when research already answers them
- Editing records with Write/Edit directly instead of typed MCP/Node operations
- Jumping to implementation after reading one file instead of deeply studying the referenced source
