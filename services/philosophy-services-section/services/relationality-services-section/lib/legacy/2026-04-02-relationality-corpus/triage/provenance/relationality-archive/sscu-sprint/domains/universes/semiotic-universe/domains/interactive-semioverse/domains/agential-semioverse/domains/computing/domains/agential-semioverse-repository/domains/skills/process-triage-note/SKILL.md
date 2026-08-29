---
name: process-triage-note
description: Examine a file in content/triage/, identify its concepts and ideas, determine where they belong in the content hierarchy, and propose a processing plan
---

Process triage note: $ARGUMENTS

## Instructions

### 1. Read and characterize the note

Read the file at `$ARGUMENTS`. Triage notes are often messy: untitled, raw,
no frontmatter, stream-of-consciousness. That is expected.

Determine:
- **Content type**: essay draft, concept notes, research dump, reading notes,
  link collection, personal reflection, legal analysis, code/technical notes,
  or mixed.
- **Has frontmatter**: if yes, note what fields exist. If no, note that it
  needs frontmatter.
- **Length and structure**: rough word count, whether it has sections or is
  unstructured prose.

### 2. Identify concepts and ideas

Extract the distinct concepts, ideas, or topics the note contains. For each,
note:
- A short label (what to call it)
- The discipline it belongs to (e.g., sociology, philosophy, mathematics,
  technology, ecology)
- Whether it is a term definition, a concept exploration, a topical essay,
  a reading note, or something else
- Whether the concept already exists in the vault (search for it):

```bash
grep -r "[concept label]" content/ --include="*.md" -l | grep -v triage/ | grep -v slop/ | head -10
```

### 3. Determine destinations

For each concept or idea, determine its destination path in the content
hierarchy. Run this to see the current structure:

```bash
find content -mindepth 1 -maxdepth 2 -type d ! -path "*/\.*" ! -path "*/private*" | sort | while read d; do title=$(grep "^title:" "$d/index.md" 2>/dev/null | head -1 | sed 's/title: //'); echo "$d${title:+  ($title)}"; done
```

Rules for destination selection:
- Terms go in `{discipline}/terms/` or `{discipline}/{topic}/terms/`
- Concepts go in `{discipline}/concepts/` or `{discipline}/{topic}/concepts/`
- Essays and texts go in `{discipline}/texts/` or `personal/writing/`
- Reading notes go in `{discipline}/texts/` with `type: text`
- If the destination directory does not exist, note that it needs to be
  created (via `/make-content-folder`)

### 4. Handle multi-discipline notes

If the note spans multiple disciplines:

- **Identify the primary discipline.** The note's central argument or
  subject determines the primary home.
- **Identify secondary disciplines.** These become cross-references via
  `tags:` and `cites:` or `extends:` in frontmatter.
- **Decide whether to split.** Split only when the note contains genuinely
  separable ideas that would each stand alone. Do not split a coherent
  argument that draws on multiple fields.
- If splitting: each piece gets its own destination. Note the split points.
- If not splitting: the note goes to its primary discipline; secondary
  disciplines are represented through tags and typed relations.

### 5. Propose a processing plan

Present a structured plan to emsenn. The plan includes:

**For each output file:**
- Source: which part of the triage note (all, lines N-M, section X)
- Destination path: the full path in the content hierarchy
- Filename: kebab-case, descriptive
- Content type: the `type:` frontmatter value
- Title: proposed title
- Tags: proposed tags (from existing vocabulary at `content/tags/`)
- Frontmatter additions: any typed relation fields (`defines:`, `cites:`,
  `requires:`, `extends:`, `part-of:`)
- Work needed: what editing is required (cleanup, restructuring, adding
  context, splitting, frontmatter)
- New directories needed: any directories that must be created first

**For the triage note itself:**
- Whether to delete it after processing, or keep it (e.g., if only
  partially processed)

### 6. Wait for confirmation

Stop and present the plan. Do not move, create, edit, or delete anything
until emsenn confirms. If emsenn modifies the plan, incorporate the changes.

### 7. Execute the approved plan

After confirmation:

1. Create any needed directories with `/make-content-folder`.
2. Create new files at their destinations with proper frontmatter.
3. If the triage note had useful content that needs editing, do the
   editing (cleanup, restructuring) as part of creating the destination
   file. Do not copy raw triage content into published directories.
4. Add `authors:` field to new files: include `emsenn` if the triage
   content is emsenn's writing, and `claude` if the agent did substantial
   editing or restructuring.
5. Set `date-created:` to today's date.
6. Use markdown links (never wikilinks) for any internal references.
7. Apply PTGAE style to any content being published.
8. If the plan calls for deleting the triage note, use `git rm`.
9. Report what was done.
