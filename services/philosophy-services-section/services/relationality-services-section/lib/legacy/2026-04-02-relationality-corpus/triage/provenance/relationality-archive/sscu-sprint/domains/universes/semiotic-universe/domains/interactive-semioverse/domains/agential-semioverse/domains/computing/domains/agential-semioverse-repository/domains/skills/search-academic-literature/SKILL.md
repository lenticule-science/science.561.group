---
name: search-academic-literature
description: Search academic literature via Semantic Scholar and arXiv APIs
---

Search Academic Literature: $ARGUMENTS

## Instructions

Run the search script:

```bash
python content/technology/specifications/agential-semioverse-repository/skills/search-academic-literature/search-academic-literature.py $ARGUMENTS
```

### Examples

Search for papers on a topic:

```bash
python .../search-academic-literature.py "formal semiotics Peirce"
```

Filter by year range:

```bash
python .../search-academic-literature.py "Heyting algebra closure" --year 2020-2026
```

Search only arXiv:

```bash
python .../search-academic-literature.py "semiosis category theory" --arxiv-only
```

Show abstracts:

```bash
python .../search-academic-literature.py "Peirce habit interpretant" --abstracts
```

Generate BibTeX and append to bibliography:

```bash
python .../search-academic-literature.py "Zalamea Peirce continuum" --bibtex --append
```

### Options

- `--year RANGE` — filter by year (e.g., `2020-2026`, `2024`)
- `--limit N` — max results per source (default: 10)
- `--arxiv-only` — search only arXiv
- `--scholar-only` — search only Semantic Scholar
- `--bibtex` — output BibTeX entries
- `--append` — append BibTeX to `bibliography.bib`
- `--abstracts` — show full abstracts
- `--venue FILTER` — filter by venue substring

### APIs Used

- **Semantic Scholar Academic Graph API** — free, no auth needed for basic
  queries (rate limit: 100 requests / 5 minutes). Returns papers with
  citation counts, venues, DOIs.
- **arXiv API** — free, no auth. Returns preprints with abstracts and
  category tags.

Results are deduplicated by title and sorted by citation count.
