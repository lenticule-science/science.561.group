---
title: Provenance Policy
description: "Audience: contributors and agents editing weiqi-services-section content. States the one provenance convention this section uses, replacing the ad hoc date-suffixed-sibling and inline-import conventions found in earlier work."
date-created: 2026-08-19
date-updated: 2026-08-19
type: specification
authors:
  - claude-sonnet-5
tags: []
---

# Provenance Policy

Audience: contributors and agents editing weiqi-services-section content.

Learning goal: know where a historical or superseded copy of a document belongs, and how to mark it, without inventing a new convention per artifact.

## The policy

1. **Live documents are singular.** Every content item (lesson, term, topic, specification) has exactly one live copy at its canonical path under `content/`. Live documents never carry a date-suffixed sibling (no `<name>--archive-YYYY-MM-DD.md` next to `<name>.md`) and never carry a `--preexisting-*` sibling. If an older version of a live document is worth keeping, it moves — it does not stay parked next to the live copy.

2. **Imported or superseded copies live under `recovered-research/`.** Each content-type directory that needs one gets its own `recovered-research/` subdirectory, sibling to the live content it holds history for (for example `content/text/documents/articles/recovered-research/` for articles, `content/text/glossary/recovered-research/` for glossary terms). A file lands there when it is: an externally-imported historical draft that predates the live document, or a superseded version retired in place of an edited live document.

3. **Every file under `recovered-research/` carries a `provenance:` frontmatter field.** The field is a short prose string stating what the file is, where the live copy now lives (a relative link), and why it was retired — enough for a future reader to know this is not the current source of truth without opening both files. Example:

   ```yaml
   provenance: "Archived copy of the atari glossary term as it stood before the 2026-08-17 revision; superseded by ../../terms/atari.md, which is a strict superset (adds Related terms and full frontmatter). Retained for corpus history only — do not link to this file from live content."
   ```

4. **Nothing outside `recovered-research/` gets a `provenance:` field.** Live documents are trusted as current by default; provenance bookkeeping is only needed where a reader could otherwise mistake an old copy for the live one.

## Why one policy

The predecessor session that did this corpus's provenance work left four inconsistent conventions in play at once (recovered-research directories, `--archive-DATE` siblings, `--preexisting-glossary` siblings, and inline imported-source blocks) — exactly the "corpus hygiene debt" the platform plan names as a Phase 0 blocker (see [Weiqi Platform Plan](./weiqi-platform-plan.md), "Knowledge architecture and content operations," item 2). A single policy means a contributor never has to guess which convention applies to a given file, and a script never has to special-case four shapes to find the live copy of anything.

## Applying this policy retroactively

As of 2026-08-19, this policy was applied to the term-level `--archive-2026-08-17` siblings left in `content/text/glossary/terms/`: each was compared against its live sibling, confirmed to add no content the live copy lacked, and moved to `content/text/glossary/recovered-research/` under its plain term name with a `provenance:` field added. The pre-existing lesson duplicates in `content/text/documents/articles/recovered-research/` (already correctly located) were likewise given `provenance:` fields for consistency, since they predated this policy and lacked the field.
