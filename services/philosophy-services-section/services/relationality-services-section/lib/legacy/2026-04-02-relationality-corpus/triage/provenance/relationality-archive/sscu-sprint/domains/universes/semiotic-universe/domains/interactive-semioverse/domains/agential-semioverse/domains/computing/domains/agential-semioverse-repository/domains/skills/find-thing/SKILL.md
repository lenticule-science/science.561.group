---
name: find-thing
description: Find a thing in the vault by title, alias, or filename
---

Find thing: $ARGUMENTS

## Instructions

1. **Search by title and aliases first.** Grep for the query in `title:` and
   `aliases:` frontmatter fields across `content/`. These are authoritative —
   a thing's title or alias is its canonical name.

   ```bash
   grep -rl "^title:.*{query}" content/ --include="*.md"
   grep -rl "^  - .*{query}" content/ --include="*.md"
   ```

2. **Fall back to filename** if no frontmatter match. Search for files whose
   name contains the query (kebab-case).

3. **Present results** with the file path and its `title:` field. If multiple
   matches, list all and let emsenn choose.

4. **If nothing found**, say so. Do not guess or create.
