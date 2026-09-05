---
description: Generate RDF/Turtle from a page's frontmatter and content
id: generate-rdf
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "generate rdf"
  - "create turtle"
  - "convert to ttl"
  - "generate ttl"
  - "build rdf"
inputs:
  path: string
outputs:
  ttl_path: string
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies: []
scopes: []
name: generate-rdf
part-of: technology/specifications/semiotic-markdown
---

Generate RDF for: $ARGUMENTS

## Instructions

Extract structured data from a markdown page and produce RDF/Turtle.

1. Read the page's frontmatter. Map fields to RDF:
   - `title` → `rdfs:label`
   - `type` → `rdf:type` (using the ASR type vocabulary)
   - `tags` → `dcterms:subject`
   - `date-created` → `dcterms:created`
   - `defines` → `rel:defines`
   - `cites` → `dcterms:references`
   - `requires` → `rel:requires`
   - `part-of` → `dcterms:isPartOf`
   - `extends` → `rel:extends`

2. Read the body for relationship claims (derivesFrom, produces,
   dualOf, etc.) and encode them as RDF triples.

3. Write the .ttl file alongside the source .md file (same directory,
   same filename stem).

4. Use the namespace `@prefix rel: <https://emsenn.net/relationality/ontology#>`.

The semantic frontmatter spec at
`content/technology/specifications/agential-semioverse-repository/semantic-frontmatter.md`
defines the full mapping. Read it if you haven't.

## Additional material from the Google Drive library

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
