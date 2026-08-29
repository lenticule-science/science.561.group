---
description: Edit an existing markdown file in the vault
id: edit-markdown
name: edit-markdown
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "edit"
  - "update"
  - "add to"
  - "modify"
inputs:
  path: string
  instruction: string
outputs:
  path: string
  changes: string[]
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies: []
scopes: []
part-of: technology/specifications/semiotic-markdown
---
Edit markdown file: $ARGUMENTS

## Instructions

1. **Read the file first.** Never edit a file you have not read in this session.

2. **Read the style guide** at `content/writing/texts/style-guide.md` if the edit
   involves writing prose. Follow PTGAE.

3. **Make the edit.** Preserve existing frontmatter structure. Do not remove
   fields, reorder keys, or change formatting unless that is the explicit task.

4. **Update provenance frontmatter** if the edit is significant (more than fixing
   a typo or whitespace):
   - Add `claude` to the `authors:` list if not already present.
   - Set `date-updated:` to today's date in ISO 8601 format.

5. **Check the result.** Re-read the file after editing to verify the change is
   correct. If the file has tags, verify they follow the tag conventions in
   `CLAUDE.md`. If it has semantic relation fields (`defines`, `requires`,
   `part-of`, etc.), verify they still make sense after the edit.

6. **Report what changed.** State the file path and a brief summary of changes.
