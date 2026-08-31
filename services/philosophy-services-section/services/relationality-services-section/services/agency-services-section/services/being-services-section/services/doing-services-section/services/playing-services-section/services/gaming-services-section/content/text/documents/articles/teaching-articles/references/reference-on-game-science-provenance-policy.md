---
title: Provenance Policy
description: "The games corpus's policy for superseded and imported content: git history is the record going forward, recovered-research/ is reserved for genuinely recovered external material, and the four conventions already present in the corpus are documented here as historical artifacts, not live practice."
date-created: 2026-08-18
date-updated: 2026-08-18
type: specification
authors:
  - claude-fable-5
tags: []
---

# Provenance Policy

Scope: this document governs provenance and superseded-content practice for everything under `gaming-services-section/` (the games corpus; seated as `game-science-services-section/` until the 2026-08-30 reseat under playing) — glossary terms, articles, lessons, and any content type added later.

## The problem

Four different conventions have been used, at different times, to mark a piece of content as superseded, imported, or historical:

1. `recovered-research/` sibling directories holding older or externally-sourced files.
2. `<name>--archive-YYYY-MM-DD.md` sibling files holding a dated snapshot of a live document.
3. `<name>--preexisting-glossary-N.md` sibling files holding a numbered pre-agent version of a glossary term.
4. Inline "Imported source" append blocks — the original imported text pasted below the rewritten live text in the same file, under an `## Imported source: <path>` heading.

None of these records who changed what and when as well as git already does. Continuing to add sibling files or append blocks means every future rewrite doubles the file it touches, and a reader can no longer tell which of several same-named files is authoritative without opening all of them.

## Policy

1. **Git history is the primary provenance record, going forward.** For any live document edited after this policy takes effect, the record of what it looked like before the edit is the commit history of the repository, not a sibling file or an appended block. `git log -p <path>` and `git blame <path>` are how a reader recovers a prior version.

2. **`recovered-research/` is reserved for genuinely recovered external material.** A file belongs there only when it originates outside this repository's own authorship — text pulled from an external archive, a prior standalone document, or someone else's writing that a live document was built from. It is not a place to park an old draft of a document this corpus wrote itself; that history lives in git.

3. **No new sibling-snapshot files.** Do not create `--archive-YYYY-MM-DD.md` or `--preexisting-*` siblings of any kind. If a version needs preserving before an edit, commit it first.

4. **No new inline append blocks.** Do not append an "Imported source" section, or any equivalent, to a live document. If a document is genuinely built from external source material, put that material in `recovered-research/` and link to it; do not paste it into the bottom of the live file.

5. **Pre-policy variants are retired.** Files in the last three conventions below were historical artifacts of a period before this policy; this document originally left them in place pending a separate decision. That decision was made 2026-08-30, in the owner-ordered normalization of the playing/gaming corpus: the `--archive-*` and `--preexisting-*` siblings and the inline append blocks were merged into their live files where they carried anything the live file lacked, and deleted. Their content remains recoverable through git history, per rule 1. `recovered-research/` directories, being genuinely external material, stay.

## The four conventions, mapped

| Convention | What it means | Era |
|---|---|---|
| `recovered-research/` sibling directories | Externally-sourced or pre-corpus material kept alongside the live content it informed. The one convention this policy keeps using going forward. | Ongoing since early corpus-building; continues under this policy. |
| Inline "Imported source" append blocks | The full original text of an external or prior source, pasted below the rewritten live text under a `## Imported source: <path>` heading, so the rewrite and its raw input sit in one file. | Earliest convention, from the initial import/build pass (documents and terms with `date-created` around March 2026). |
| `--preexisting-glossary-N.md` siblings | A numbered snapshot of a glossary term as it existed before a later rewrite of the live term, split into its own file instead of appended inline. | A cleanup pass that pulled inline imports out into sibling files (entered the repository mid-August 2026, holding March 2026 content). |
| `--archive-YYYY-MM-DD.md` siblings | A dated snapshot of a live document taken immediately before a specific edit on that date. | Most recent pre-policy convention, used for term edits made 2026-08-17. |

## Reading old content

The last three rows above describe conventions retired 2026-08-30; the table stays so a reader of git history can tell what those files were. Should a straggler surface, treat the plain, un-suffixed file at the same location as the live, authoritative copy, and retire the straggler the same way: fold in anything the live file lacks, delete, commit.

## Section-local documents

Some subsections of this corpus wrote their own local provenance notes before this document existed, including notes that direct retroactive cleanup of the conventions above. Where a local document conflicts with this one, this document governs going forward: no further sibling files or append blocks anywhere in the games corpus, regardless of what a section-local note previously proposed. Retroactive migration, if it happens, is a separate decision, not an automatic consequence of this policy.
