---

name: citations
date-created: 2026-03-05
date-updated: 2026-03-07T00:00:00
introduces: specification
keywords:
  - semiotic-markdown
  - citation
  - bibliography
description: "How semiotic markdown handles bibliographic citations: inline references, structured frontmatter, and on-demand bibliography generation."
---

How semiotic markdown handles bibliographic citations. This
specification defines the data model — what citations look like in
the format and how they relate to the bibliography — without assuming
any particular rendering toolchain.

## Inline citations

Semiotic markdown uses pandoc-citeproc syntax for inline citations:

- **Single citation**: `[@citekey]`
- **Multiple citations**: `[@key1; @key2]`

Place the citation after the claim it supports, before the period:

```markdown
Relations are ontologically prior to entities [@emsenn2025].
```

Inline citations are point-of-evidence markers. They say: this specific claim is supported by this specific source. Each `[@citekey]` must resolve to an entry in the bibliography file.

## Bibliography file

The bibliography lives at `bibliography.bib` in the content root. It
uses BibTeX format — a plain-text standard with broad tool support
across typesetting, static site generation, and citation processing
ecosystems.

`bibliography.bib` SHOULD be a **generated artifact**, compiled from
`references:` fields across the vault (see section "On-demand
bibliography generation" below). Until generation is implemented, it
is hand-maintained. Whether generated or hand-maintained, it serves
as the consolidated bibliography for the entire vault.

### Citekey conventions

Citekeys MUST follow `authorYear` format for hand-authored entries:

```bibtex
@book{foucault1975,
  author = {Michel Foucault},
  title = {Discipline and Punish},
  year = {1975},
  publisher = {Gallimard}
}
```

When multiple works share the same author-year combination, append a
lowercase letter: `foucault1975a`, `foucault1975b`.

Longer generated keys (e.g., `emsenn_MolochsBargain_2025`) are valid.
Both formats coexist. Prefer the shorter `authorYear` form when
authoring new entries manually.

For emsenn's own works, use `emsenn` plus year (e.g., `emsenn2025`).

### Before citing

Check whether the work already has a bibliography entry before adding
a new one. Duplicate entries with different citekeys cause ambiguity.

## The `references` frontmatter field

Documents that cite sources SHOULD include a `references:` field in their frontmatter that maps each citekey used in the body to its full bibliographic data. This makes the document self-standing — a reader does not need access to `bibliography.bib` to know what is being cited.

```yaml
references:
  suchman1987:
    authors: ["Lucy A. Suchman"]
    title: "Plans and Situated Actions: The Problem of Human-Machine Communication"
    publication: "Cambridge University Press"
    year: 1987
  shirky2003:
    authors: ["Clay Shirky"]
    title: "The Semantic Web, Syllogism, and Worldview"
    year: 2003
    url: "https://shirky.com/writings/semantic_syllogism.html"
```

Each entry is keyed by its citekey (matching the `[@citekey]` used in the body) and contains:

| Field | Required | Description |
|---|---|---|
| `authors` | yes | List of author names |
| `title` | yes | Title of the work |
| `year` | yes | Publication year |
| `publication` | no | Journal, publisher, or venue |
| `volume` | no | Volume number |
| `issue` | no | Issue number |
| `pages` | no | Page range |
| `url` | no | URL if applicable |

The `references` field is the **source of truth** for bibliographic
data. Each file's `references:` entries are independently meaningful
and self-standing. The consolidated `bibliography.bib` SHOULD be
generated from these per-file entries (see "On-demand bibliography
generation" below).

### Adding a reference entry

When citing a new source in a document:

1. Add the `[@citekey]` inline citation at the point of evidence.
2. Add the citekey and its bibliographic data to the document's
   `references:` field.
3. If `bibliography.bib` is still hand-maintained, also add a
   corresponding BibTeX entry.

When bibliography generation is automated, step 3 becomes unnecessary
— the build process compiles all `references:` entries into the
consolidated bibliography.

## The `cites` frontmatter relation

The `cites:` field serves a different purpose from both inline
`[@citekey]` citations and the `references:` field.

| | Inline `[@citekey]` | `references:` | `cites:` |
|---|---|---|---|
| **Purpose** | Evidence for a claim | Bibliographic data | Intellectual dependency |
| **Scope** | A specific sentence | The document's sources | The document as a whole |
| **Content** | A citekey | Author, title, year, etc. | Free-text or citekey |

A page might cite Foucault inline three times for specific claims
(`[@foucault1975]`), list the full bibliographic data in
`references:`, and also list "Discipline and Punish" in `cites:` to
declare it as a major intellectual dependency.

### Resolvable cites

The `cites:` field currently accepts free-text strings (author names,
work titles). This is adequate for declaring intellectual dependency
but makes the relation machine-opaque: a tool cannot reliably link
the free-text string "Arlie Russell Hochschild" to a specific
bibliography entry.

To support bibliography generation, `cites:` entries SHOULD use one
of two resolvable formats:

1. **Citekey format**: the entry matches a citekey in `references:`
   or `bibliography.bib`. Example: `"foucault1975"`.
2. **Structured format**: `"Author. Title. Year."` — a parseable
   citation string. Example:
   `"Foucault, Michel. Discipline and Punish. 1975."`.

Free-text entries (e.g., `"Arlie Russell Hochschild"`) remain valid
but are not resolvable for bibliography generation. Migration from
free-text to resolvable format is incremental and tracked by plan
0002.

The `cites` relation is defined in the
[semantic frontmatter specification](../agential-semioverse-repository/semantic-frontmatter.md).
It maps to `schema:citation` and `dcterms:references`.

## On-demand bibliography generation

The goal is for `bibliography.bib` to be a generated artifact, built
from the `references:` fields distributed across the vault's files.
This inverts the current relationship: instead of files pointing to a
centralized bibliography, the bibliography is assembled from per-file
citation data.

### Generation process

A build-time script SHOULD:

1. Scan all `.md` files for `references:` frontmatter fields.
2. For each citekey found, extract the structured bibliographic data.
3. Merge entries across files: if multiple files declare
   `references:` for the same citekey, their data MUST be consistent.
   Conflicts are errors.
4. Generate `bibliography.bib` in BibTeX format from the merged
   entries.

### Mapping references to BibTeX

The `references:` schema maps to BibTeX fields:

| `references:` field | BibTeX field |
|---|---|
| `authors` | `author` (joined with ` and `) |
| `title` | `title` |
| `year` | `year` |
| `publication` | `publisher` or `journal` (by entry type) |
| `volume` | `volume` |
| `issue` | `number` |
| `pages` | `pages` |
| `url` | `url` |

### Entry type inference

The `references:` schema does not currently declare entry type
(book, article, inproceedings, etc.). A `type` field MAY be added:

```yaml
references:
  foucault1975:
    type: book
    authors: ["Michel Foucault"]
    title: "Discipline and Punish"
    year: 1975
    publication: "Gallimard"
```

Valid types follow BibTeX conventions: `book`, `article`,
`inproceedings`, `incollection`, `phdthesis`, `misc`, `online`.
When `type` is omitted, the generator SHOULD infer `misc`.

### Audit capabilities

The generation script SHOULD also report:

- **Orphaned citekeys**: `[@citekey]` inline references that do not
  match any `references:` entry in the same file.
- **Unreferenced entries**: `references:` entries that are never
  cited inline with `[@citekey]` (these are not errors — a file may
  declare references for intellectual context without inline citation).
- **Inconsistent duplicates**: the same citekey with different
  bibliographic data in different files.
- **Unresolvable cites**: `cites:` entries that cannot be matched to
  any citekey in `references:` or `bibliography.bib`.

## Reference pages

A bibliographic entry may optionally have a corresponding content page in `content/general/references/`. Such a page carries `citekey:` in its frontmatter, making the reference a first-class object in the semiotic network — linkable, taggable, and relatable like any other page.

Reference pages are not required. Most citations resolve against `bibliography.bib` alone. Reference pages are useful when a work is cited frequently enough or is important enough to warrant its own entry in the vault's knowledge graph.

## Unsourced claims

When a claim matters but has no source yet, mark it with plaintext:

```markdown
The first known use of this technique predates the published record [citation needed].
```

`[citation needed]` is a human-readable flag, not processed syntax. It signals that the claim requires a source and should not be left unmarked.

## Citation expectations by content type

The [style guide](../../../../../humanities/domains/writing/texts/style-guide.md) specifies what each content type requires. In summary:

| Content type | Citation expectation |
|---|---|
| Term definitions | Cite who introduced the term and where |
| Concept notes | Cite the sources that inform the concept |
| Essays and papers | Follow the citation conventions of the discipline engaged |
| Lessons | Cite the sources the lesson draws on |
| Discipline pages | Cite foundational texts that define the field |
| School pages | Cite founding and defining works |
| Encyclopedia entries | Every factual claim needs a source |
