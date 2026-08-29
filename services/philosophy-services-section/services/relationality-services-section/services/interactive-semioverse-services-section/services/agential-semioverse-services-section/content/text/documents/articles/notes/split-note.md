---
name: split-note
id: split-note
description: Split a file that covers multiple concepts into separate files, one per concept, updating all references
type: operational
runtime: inference
triggers:
  - "split"
  - "separate into"
  - "break apart"
inputs:
  source: string
  targets: list[string]?
outputs:
  paths: list[string]
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - write-new-note
  - cross-link-document
defines:
  - "note splitting"
part-of: technology/specifications/semiotic-markdown
scopes: []
---
Split: $ARGUMENTS

## Purpose

Take a single file that covers multiple concepts and produce separate
files, one per concept, each following vault conventions. Update all
references across the vault so nothing breaks.

## Instructions

1. **Read the source file.** Identify the distinct concepts it covers.
   Each concept should become its own file.

2. **Determine destinations.** Each new file goes in the directory
   appropriate for its content type. If the source is a term file,
   the new files are term files in the same `terms/` directory. If
   the source mixes types (a term and a concept), place each in its
   proper subdirectory.

3. **For each concept, create a new file** following vault conventions:
   - Proper YAML frontmatter (`title`, `date-created`, `type`, `tags`,
     at least one semantic relation field)
   - Content that is self-standing — a reader should not need the
     original combined file to understand it
   - Markdown links (not wikilinks) to any related concepts
   - If the new file references the other concept(s) being split out,
     link to the new file path

4. **Find all references to the source file** across the vault:

   ```bash
   grep -rl "source-filename" content/ --include="*.md"
   ```

   Update each reference to point to the appropriate new file. If a
   reference was to the combined concept, decide which new file is
   the better target.

5. **Handle the source file.** Options:
   - If the source file is now empty of unique content, delete it
   - If the source file had content beyond the split concepts (e.g.,
     a comparison or introduction), keep it as a linking document
     that points to the new files
   - Ask emsenn if unsure

6. **Verify.** Run `/check-note-style` on each new file. Run
   `/audit-vault-references` to confirm no broken links.

## Rules

- Each new file must be self-standing. Do not leave stub files that
  say "see X for details."
- Preserve all frontmatter from the source: tags, semantic relations,
  dates. Distribute them appropriately to the new files.
- If the source file defined terms used elsewhere in the vault, make
  sure those terms are still defined in exactly one place.
- Do not create circular references between the split files unless
  the concepts genuinely reference each other.
