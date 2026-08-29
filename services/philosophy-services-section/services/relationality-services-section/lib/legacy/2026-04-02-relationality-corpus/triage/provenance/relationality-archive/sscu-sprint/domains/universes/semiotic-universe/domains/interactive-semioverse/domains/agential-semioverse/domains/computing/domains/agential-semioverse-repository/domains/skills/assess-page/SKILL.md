---
name: assess-page
description: Assess a single published page across ASR quality dimensions and produce a diagnostic report without modifying anything
---

Assess: $ARGUMENTS

If no path is given, pick a random published file:

```bash
find content -name "*.md" -not -path "*/private/*" -not -path "*/meta/*" -not -path "*/slop/*" -not -path "*/triage/*" -not -path "*/.obsidian/*" -not -path "*/tags/*" -not -name "index.md" | shuf -n 1
```

## Purpose

Answer two questions about one page:

1. What would make this page better?
2. What would make the emsemioverse better at relating to this page?

Do NOT modify any files. This is read-only.

## Phase 1: Mechanical checks

Read the file and check:

- **Frontmatter**: `title`, `date-created`, `type`, `tags` (3-5), `authors`,
  at least one semantic relation field (`defines`, `requires`, `part-of`,
  `extends`, `questions`, `addresses`)
- **Links**: no wikilinks in body (note them as pending pages), all
  markdown links resolve, no bare URLs
- **Placement**: file is in a subdirectory appropriate for its type,
  parent directory has `index.md`
- **Colocated artifacts**: what `.ttl`, `.lean`, `.py`, `.json` files
  exist alongside it

## Phase 2: Semantic assessment

- **Cross-links**: concepts mentioned but not linked, pages that link
  here but are not linked back
- **Content quality**: is it self-standing? does it follow PTGAE? does
  it match the structure expected for its type?
- **Formal artifacts**: based on content, which artifacts *should* exist?
- **Integration**: how many pages link to/from it? does its directory
  position match its conceptual role? does it reference concepts the
  vault should cover but does not?

## Phase 3: Report

Produce:

1. **Summary** — one paragraph: what this page is and the single most
   impactful improvement.
2. **Findings** — mechanical and semantic, with specifics.
3. **Recommendations** — ordered by impact. For each: what to do, which
   skill would do it, effort estimate (trivial / moderate / substantial).
