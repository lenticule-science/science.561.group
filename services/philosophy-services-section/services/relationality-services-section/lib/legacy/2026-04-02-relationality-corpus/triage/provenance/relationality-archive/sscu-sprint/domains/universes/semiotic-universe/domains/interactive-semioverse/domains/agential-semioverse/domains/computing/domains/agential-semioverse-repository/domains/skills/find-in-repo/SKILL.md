---
name: find-in-repo
description: Search the published repo for existing content — answers "does this already exist?" by searching titles, filenames, frontmatter, and body text
---

Search the published repo for: $ARGUMENTS

## Instructions

Run the search script:

```bash
python3 find-in-repo.py "search terms"
```

### Options

- `--discipline mathematics` — limit to a discipline
- `--type specification` — limit to a content type
- `--field tags --value Semiotics` — search a specific frontmatter field
- `--limit 10` — limit results (default 20)

### When to use

Use this BEFORE creating new content, to check whether it already
exists. Use this when mining triage, to check whether a triage file
has been superseded by published content.

This script searches titles, aliases, filenames, and body text
across all published content (excludes triage/, slop/, private/).
Results are ranked: title matches first, then aliases, filenames,
body text.
