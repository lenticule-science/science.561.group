---
name: evaluate-slop
description: Evaluate a file or directory in slop/ to determine whether content has been superseded by published material, and propose promotion, revision, or cleanup
---

Evaluate slop content: $ARGUMENTS

## Instructions

### 1. Read the content

If `$ARGUMENTS` is a directory, list its files and read each one.
If it is a file, read it.

For each file, record:
- Filename and path
- Whether it has frontmatter (and what fields)
- Rough word count
- Date created (from frontmatter or git history)
- Author (from frontmatter, or infer from `authors:` field; if absent,
  check git blame)

### 2. Check for supersession

This is the primary evaluation. For each slop file, determine whether
the published vault already covers the same ground.

**Search for overlapping published content:**

```bash
# Extract key terms from the slop file and search for them in published content
grep -r "[key term 1]" content/ --include="*.md" -l | grep -v slop/ | grep -v triage/ | grep -v private/
grep -r "[key term 2]" content/ --include="*.md" -l | grep -v slop/ | grep -v triage/ | grep -v private/
```

For each match, read the published file and compare:

| Comparison | Superseded? |
|---|---|
| Published file covers the same concept with equal or greater depth | Yes |
| Published file covers part of the concept; slop has additional material | Partial — extract the unique material |
| Published file exists but is a stub; slop has real content | No — slop should be promoted or merged |
| No published file covers this ground | No — slop may be promotable |

**Check the slop file's own history.** Slop content is often generated
in bulk batches. Look for date patterns in the directory name (e.g.,
`relationality-slop-2026-03-02/`) or frontmatter dates. Older slop is
more likely to be superseded.

### 3. Assess quality

For non-superseded content, evaluate:

- **Substance**: Does it contain original ideas, formal specifications,
  or useful drafts? Or is it boilerplate, placeholder text, or incoherent
  output?
- **Accuracy**: Does it use vocabulary correctly per the vault's
  specifications? Check against the ASR specs and mathematical
  definitions. AI-generated content often invents plausible-sounding
  but incorrect formalisms.
- **Maturity**: Is it close to publishable, or does it need significant
  revision?
- **Placement**: If promoted, where in the vault does it belong?
- **Dependencies**: Does it reference or depend on other slop files?
  Would promoting it require promoting those too?

### 4. Assign dispositions

For each file, assign one of these dispositions:

| Disposition | When to use |
|---|---|
| **Promote** | Content is substantive, accurate, and ready (or nearly ready) for its target location |
| **Merge** | Content has value but a published page already covers the topic; the slop material should be merged into the existing page |
| **Revise then promote** | Good ideas but needs rewriting, restructuring, or deduplication |
| **Extract** | Some parts are valuable; extract those and discard the rest |
| **Superseded** | Published content already covers this ground with equal or greater quality; safe to delete |
| **Archive** | Not useful now but might be later; leave in slop/ |
| **Delete** | No value, incoherent, or incorrect; remove |

For each file, state:
- The disposition
- The target path (for promote/merge/revise/extract)
- What work is needed (for merge/revise/extract)
- The superseding file(s) (for superseded)
- Why (for archive/delete)

### 5. Summarize

Present a summary table:

```
## Slop Evaluation: {path}

| File | Disposition | Target/Reason |
|---|---|---|
| file-a.md | Superseded | Already at content/philosophy/terms/X.md |
| file-b.md | Promote | → content/sociology/concepts/Y.md |
| file-c.md | Delete | Incoherent placeholder |

Superseded: N files (safe to clean up)
Actionable: M files (promote/merge/revise/extract)
Hold: K files (archive)
```

### 6. Wait for confirmation

Present the proposal to emsenn. Do not move, edit, or delete any files
without explicit confirmation.

### 7. Execute approved actions

After confirmation:

- **Promote**: use `git mv`, ensure the target directory has an `index.md`
  (create via `/make-content-folder` if needed), update frontmatter to
  meet published standards (add missing required fields, fix tags, apply
  PTGAE style).
- **Merge**: read the target published file, integrate the slop material
  into it, then `git rm` the slop file. Add `claude` to `authors:` and
  set `date-updated:`.
- **Revise then promote**: edit in place in slop/, then move after review.
- **Extract**: create the new file(s) in the target location(s) with
  proper frontmatter, leave the slop original for later cleanup.
- **Superseded/Delete**: `git rm` the file.
- **Archive**: no action; leave in place.

### 8. Batch operations

When evaluating a directory with many files (common for AI-generated
batches like `relationality-slop-*`), group files by disposition and
present the groups rather than listing every file individually. State
the count per disposition and list representative examples. Offer to
show the full list on request.

For large superseded batches, confirm once for the batch rather than
per-file.
