---
title: "Reference notes"
---


A *reference note* (frontmatter `type: reference`, directory `references/`) is one file per cited external work, with annotation. References are the corpus's bibliographic memory: they let theory notes cite outside literature with a stable internal pointer rather than a brittle URL.

The corpus has both a *centralized* reference system (`library/references/` plus a top-level `references.bib`) and *theory-local* reference systems (each theory's `references/` directory plus the theory's own `references.bib`). Both are first-class. A reference SHOULD live in the most-local theory that needs it; references shared across theories MAY be lifted to the centralized location, but duplication is preferable to absence.

## Required frontmatter

```yaml
---
type: reference
key: <bibtex-key>            # the citation key — must match the .bib entry
authors: [...]               # surnames or full names; the lead-author surname-year format is canonical
year: <YYYY>
title: "<Title>"
---
```

## Recommended frontmatter

- `venue:` — the journal, conference, or publisher. For internal corpus texts, the directory path.
- `eprint:` and `eprinttype:` — for arXiv, biorxiv, or other preprints.
- `doi:` — the canonical DOI when available.
- `url:` — when the work is web-only or the canonical access point is a URL.
- `text-type:` — `survey | original-research | textbook | thesis | preprint | working-note | ...`.
- `traditions:` — the intellectual traditions the work belongs to (used for grouping references by lineage rather than by date or alphabetical).
- `subject:` — the work's primary subject (a slug, often matching a corpus concept).
- `see-also:` — related references in the corpus.

## Body conventions

A reference note's body SHOULD have this shape:

```
# <Author Year — Short Title>

<First paragraph: the work's *thesis* or central content in one or two
sentences. NOT a quote from the abstract — a synthesized statement of what
the work does.>

## Why this is cited                      (recommended)

<One paragraph on what the corpus uses this work for. Which theorems cite it,
which concepts trace their lineage to it, which methods it provides.>

## Notable claims                         (optional, for substantive references)

<Bullet list of specific claims or constructions the corpus draws on, with
section / page references. Useful for references that contribute machinery
the corpus relies on.>

## Status                                 (optional)

<For preprints or working notes: the version cited, the date, any known
errata.>
```

## Source files

A reference SHOULD have its source PDF / text under the theory's `references/sources/` directory when copyright permits. The source's filename SHOULD match the bibtex key. The FARS toolkit's `references/` machinery validates that every citation key in `.bib` resolves to either a reference note or an explicit external-only declaration.

## When to use `reference` vs. alternatives

- Use `reference` for any external work the corpus cites by name.
- Use [theorem](theorem.md) when the content is a *result* the corpus reproves or attributes — the theorem note cites the reference.
- Use [narrative](narrative.md) when the content is a *commentary* on a body of literature — the narrative cites multiple references.
- Use a [people note](#) for a *person* whose biography or role is the subject — a reference is for *works*, not authors.

## Validation rules (informal)

- A reference note MUST declare `type: reference` and `key:`.
- A reference note's `key:` MUST match an entry in the relevant `.bib` file.
- A reference note SHOULD declare at least `authors`, `year`, and `title`.
- A reference note that is cited nowhere in the corpus is a candidate for removal; uncited references accumulate cost without payoff.

## Examples

- Math references: see the BibTeX-keyed entries under [predication-categories/references/](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/references/).
- Centralized references: [library/references/](../../../../../../../../../../../references/).
