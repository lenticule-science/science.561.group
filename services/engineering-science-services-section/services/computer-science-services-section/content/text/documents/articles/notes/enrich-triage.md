---
description: Enrich triage files — improve frontmatter, remove redundancy, add classification metadata to make future parsing easier
id: enrich-triage
name: enrich-triage
version: [0, 2]
type: operational
runtime: inference
triggers:
  - "enrich triage"
  - "clean up triage"
  - "improve triage metadata"
  - "triage frontmatter"
follows-policies: [1, 2, 5]
inputs:
  path: string?
  batch_size: number?
outputs:
  files_enriched: string[]
  files_merged: string[]
  files_flagged: string[]
region:
  reads: ["content/triage/"]
  writes: ["content/triage/"]
dependencies:
  - fix-frontmatter
  - find-thing
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Enrich triage files: $ARGUMENTS

## Instructions

This skill has two layers: a script for mechanical enrichments and
inference for classification. Progressive automation (policy 001)
means moving work from the inference layer to the script layer
over time.

### 1. Run the mechanical enrichment script

```bash
python3 enrich-triage.py [--batch N] [path_filter]
```

The script handles without inference:
- `title` from first heading or filename
- `date-created` from git history
- Deprecated field renames (date→date-created, author→authors,
  kind→type, id removal)

Use `--dry-run` first to preview changes.

### 2. Rebuild the triage index

```bash
python3 index-triage.py
```

This produces `triage/.triage-index.json` — a queryable index of
all triage files with their frontmatter and enrichment status.

### 3. Inference-based enrichment

For files that still need classification (check the index for
`enrichment: "minimal"` or `"none"`), read each file and add:

- `type` — classify: `text`, `term`, `concept`, `specification`,
  `lesson`, `babble`, `letter`, `question`, `note`
- `tags` — 3-5 CamelCase tags, most-specific first
- `description` — one-sentence summary
- `target-discipline` — where this would go if promoted
- `triage-status` — one of: `raw`, `classified`, `promotable`,
  `superseded`, `redundant`, `fragment`

### 4. Check for superseded content

Use find-in-repo to check whether published versions exist:

```bash
python3 find-in-repo.py "concept name"
```

If a published version exists, mark the triage file `superseded`
and add `superseded-by: path/to/published/version`.

### 5. Remove redundancy

- If two triage files cover the same content, merge them
- Mark duplicates as `redundant`
- Do NOT delete files (policy 005)

### 6. Report

List what was enriched, merged, or flagged with counts.
