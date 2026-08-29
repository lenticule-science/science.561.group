---
name: generate-rdf
description: Generate RDF/Turtle files from markdown frontmatter, mapping typed relation fields to RDF predicates
---

Generate RDF: $ARGUMENTS

## Instructions

Run the generator script:

```bash
python content/technology/specifications/semiotic-markdown/skills/generate-rdf/generate-rdf.py $ARGUMENTS
```

For a single page:

```bash
python content/technology/specifications/semiotic-markdown/skills/generate-rdf/generate-rdf.py sociology/terms/feeling-rules.md
```

For all pages:

```bash
python content/technology/specifications/semiotic-markdown/skills/generate-rdf/generate-rdf.py --all
```

Options:
- `--all` — generate TTL for all publishable pages
- `--dry-run` — show what would be generated without writing
- `--stats` — print statistics only
- `--force` — overwrite existing .ttl files
- `--combined` — also write a combined `knowledge-graph.ttl`

The script reuses the frontmatter parser from `predicate-graph.py` and maps
fields to RDF predicates per
`content/technology/specifications/agential-semioverse-repository/semantic-frontmatter.md`.
Output .ttl files are colocated with source .md files (same directory, same
filename stem).
