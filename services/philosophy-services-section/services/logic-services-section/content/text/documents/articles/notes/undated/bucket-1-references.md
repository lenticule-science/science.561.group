---
title: references/
description: One markdown note per cited work, with annotation.
---
# references/

One markdown note per cited work, with annotation. The `references.bib` at the repository root is the canonical BibTeX record; the per-reference `.md` files here add what BibTeX cannot carry (status, key content, our use of the source). Source PDFs (where we have them) live in `sources/`.

## Layout

```
references/
├── _index.md                    # this file
├── <cite-key>.md                # one annotation note per cited work
├── ...
└── sources/                     # source PDFs, named to match cite-key
    ├── <cite-key>.pdf
    └── ...
```

## Frontmatter

```yaml
---
type: reference
authors: [Surname, ...]
year: 2018
title: "..."
venue: "..."           # journal, conference, book series, arXiv id, etc.
---
```

## Body shape

1. **Full citation.** Bibliographic info beyond what fits in frontmatter (DOI, arXiv id, ISBN, publisher, page range).
2. **Status.** Whether the source has been read locally, skimmed, accessed via abstract, or referenced via citation network. Whether a PDF lives at `sources/<cite-key>.pdf`.
3. **Annotation.** What this work contributes that we use. One paragraph is usually enough; longer where the relationship to our program is subtle. Notation tables and key formulae go here when extracted.
4. **Where used.** Optional. The authoritative direction is *outward from* references — notes that cite this work mention it in their body or in `depends-on:`. A "where used" section here is a courtesy for human reading and need not be kept exhaustive.

## Filename convention

`<surname><year>.md` for single-author works, `<surname1>-<surname2><year>.md` for two authors, `<surname1>-et-al<year>.md` for three or more. Disambiguate with a letter suffix where needed (`jung2007a.md`, `jung2007b.md`). The cite-key in `references.bib` and the filename here match exactly.

## One annotation per work

When adding a citation, check whether `<cite-key>.md` already exists and merge annotations rather than duplicating. A single canonical reference per work, with annotation accumulating over time, is the goal.
