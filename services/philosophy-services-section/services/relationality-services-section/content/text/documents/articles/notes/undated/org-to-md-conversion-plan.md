---
title: Org-to-Markdown Conversion Plan for Triage Content
id: triage-org-to-md-plan
type: doc
status: draft
keywords:
  - triage
  - formatting
created: "2025-02-21"
updated: "2025-12-21"
authors:
  - emsenn
  - contributors
---

## Objectives
- Reduce reliance on Org-mode stubs by converting triage notes into publishable Markdown.
- Preserve IDs, authorship, and dates so downstream tooling can continue to reference the content.
- Normalize navigation and plan sections so the triage tree is easier to scan and link.

## Metadata Mapping
- **ID**: copy `:ID:` into `id`.
- **Title**: copy `#+title` or `#+TITLE` into `title`.
- **Dates**: map `#+date` to `created` (ISO format if possible); add `updated` when editing.
- **Authors**: map `#+author` to an `authors` list when present.
- **TODO keyword**: record as `status` (use `draft` when no better mapping is available).
- **Document type**: default to `type: doc` for indices and notes unless the content implies another type.

## Structural Conventions
- Convert leading `*` Org headings to Markdown `#`, preserving hierarchy.
- Rewrite TODO headlines as plain headings with inline status labels (for example, `SOON —` before the text).
- Translate Org links `[text](../../../../triage/url)` to `[text](../../../../triage/url)` and bare `[Title](../../../../triage/Title)` cross-references to plain text.
- Use short descriptive paragraphs before lists when the Org file implied one with surrounding context.

## Conversion Workflow
1. Select a small batch of Org files in the same thematic area (for example, indices or active projects).
2. Copy metadata into a YAML frontmatter block using the mapping above.
3. Translate headings and lists; keep italicized emphasis where it clarifies intent or naming.
4. Add a one-sentence overview if the Org file assumes background context.
5. Delete or archive the original `.org` file after verifying the Markdown result renders correctly.

## Current Batch
- Converted Koios.News index to Markdown and carried over its section structure.
- Converted Groundhog Autonomous Zone index to Markdown with citation links preserved.
- Converted Turntide Islands index to Markdown with a concise overview and active plans.
- Converted personal stubs for mental health, ethics, and research to Markdown with preserved IDs and created dates.
- Converted Brave Old World and Brave Old World Podcast archive entries to Markdown with their identifiers and timelines intact.
- Converted qtMUD and TAB archive entries to Markdown with their IDs, metadata, and representative code blocks preserved.
- Converted personal "about" and naming essays in `emsenn/txt/tbd/` to Markdown with IDs, authorship, and dates carried over.
- Converted internal-theory notes on RITM and its topological dynamics to Markdown with their IDs, authors, and creation dates preserved.
- Converted Sigmund Vexler's misfiled-custody essay to Markdown with its ID, authorship, and onboarding critique intact.
- Converted the relational poset modality sketch to Markdown with its definitions, constructions, and modal factorization preserved.
- Converted the Foundations of Reflexive Existence paper to Markdown while retaining its modal chain derivation and stabilization results.
- Converted the Yanagi persona prompt to Markdown with preserved ID, authorship, and behavioral sketch.
- Converted the Sigmund Vexler persona and system prompt to Markdown with its identifier, creation date, and filters intact.
- Converted the Hive Auto Ledger roadmap and trading bot sketches to Markdown with IDs, layered token notes, and both bot iterations preserved.
- Converted the Sigmund Sat Stacker stub to Markdown with its identifier and placeholder context for follow-up detail.
- Converted the GnoponEmacs predicate graph experiment to Markdown with its `NODE-RELATIONS` context and Elisp helpers retained.
- Converted the "Accepting the Web as a Platform" outline to Markdown with its metadata and bullet structure intact.
- Converted Es mentoring stubs (overview and brand persona) to Markdown with preserved IDs, created dates, and content plans.
- Converted the reflexive infinity-topos derivation and the stratified directed infinity-homotopy geometry sketch to Markdown with YAML frontmatter and preserved identifiers.
- Converted the stratified directed infinity-topos geometry treatise to Markdown with YAML metadata and cleaned coherence, duality, and dynamics sections.
- Removed legacy Org sources for the relational ∞-topos modality, the reflexive existence proposal, and the foundations of relation after confirming their Markdown counterparts.
- Converted the relational dynamics explainers to Markdown with their identifiers, authorship, dates, and civic framing preserved.
- Converted the climate, ecology, AI, and learning explainers to Markdown with their IDs, created dates, and civic-facing structure retained.
- Converted the RITM function registry to Markdown with taxonomy, adjunction quadruple, nuclei, and modal extractor notes preserved.
- Converted the liberal anarchism conjecture note to Markdown with its ID, creation date, authorship, and claims retained.
- Converted the information stability reward-function paper to Markdown with its signal-manifold preliminaries and emergent-stability proof sketch preserved.
- Converted two artificial-agent stability optimization papers to Markdown with their policy-manifold setup, alignment equilibrium framing, and exploration–stability balance discussion intact.
- Converted personal encyclopedia stubs for my blog, babbles, and Ko-Fi page to Markdown with IDs, dates, and supporting context preserved.
- Converted information-theory papers on stability reward, proxy misalignment, and curvature conservation to Markdown with IDs, metadata, and formal statements retained.

## Next Targets
- Continue with any remaining `content/triage/archive/**` Org files if discovered during cleanup.
- Continue migrating remaining `content/triage/emsenn/txt/tbd/*.org` stubs to stabilize personal essays.
- Continue migrating the remaining `content/triage/internal-theory/*.org` theory sketches—especially any stratified topos materials—so they align with the current Markdown schema.
- Continue migrating remaining triage Org stubs (personal encyclopedia, research notes, and fiction encyc entries) to stabilize the tree.
