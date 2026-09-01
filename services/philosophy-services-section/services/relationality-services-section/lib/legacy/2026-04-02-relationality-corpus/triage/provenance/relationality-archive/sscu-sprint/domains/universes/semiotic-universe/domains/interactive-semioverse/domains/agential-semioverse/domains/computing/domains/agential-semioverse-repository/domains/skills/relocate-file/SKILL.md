---
name: relocate-file
description: Move a file to a new location and update all internal markdown links and wikilinks that reference it
---

Relocate file: $ARGUMENTS

## Instructions

Run the relocation script:

```bash
python content/technology/specifications/agential-semioverse-repository/skills/relocate-file/relocate-file.py <source> <destination>
```

Use `--dry-run` to preview changes without writing. Use `--vault-root` to
override the default vault root (`content/`).

The script performs three operations in order:

1. **Move the file** from `<source>` to `<destination>`, creating parent
   directories as needed.
2. **Rewrite relative markdown links** — scans every `.md` file in the vault
   for `[text](…)` links whose resolved target matches the old path, and
   rewrites each link to point at the new location using the correct relative
   path.
3. **Rewrite wikilinks** — if the file's stem changed, updates `[OldStem](OldStem)`
   references to `[NewStem](NewStem)` throughout the vault.

After the script finishes:

1. Review the summary output (files modified, links updated).
2. Run `/audit-vault-references` to confirm no new broken links were introduced.
3. If the moved file is an `index.md`, check whether parent or child directories
   need their own index files updated.

$ARGUMENTS
