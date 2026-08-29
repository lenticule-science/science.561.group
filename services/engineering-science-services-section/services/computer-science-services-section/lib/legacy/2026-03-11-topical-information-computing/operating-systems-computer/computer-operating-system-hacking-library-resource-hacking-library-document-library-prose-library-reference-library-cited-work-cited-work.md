---
name: cited-work
description: A structure-form whose instances are bibliographic records of external works — each instance is a tuple of class, authors, year, title, and class-specific fields fully identifying one published or otherwise-citable work.
references:
  chicago2017:
    class: book
    authors: ["University of Chicago Press"]
    year: 2017
    title: "The Chicago Manual of Style"
    edition: "17th"
    publisher: "University of Chicago Press"
    location: "Chicago"
  iso6902010:
    class: report
    authors: ["International Organization for Standardization"]
    year: 2010
    title: "ISO 690:2010 — Information and documentation: Guidelines for bibliographic references and citations to information resources"
    institution: "ISO"
    location: "Geneva"
---

A **cited-work** is a structure-form whose instances are bibliographic records of external works that other markdown-resource-files cite.
The form's predication-shape is the list of characteristic cells an instance must bear to record one work uniquely and completely.

## Predication-shape

Universal characteristic cells — every cited-work instance carries these:

- `(cited-work, has-class, class-value)` where the class-value is one of `book`, `article`, `chapter`, `preprint`, `report`, `thesis`, `online`, `software`.
  The class determines which additional characteristic cells the instance must bear.
- `(cited-work, has-authors, author-list)` where the author-list is non-empty and each author is a string in the form `"Surname, Firstname"` (with initials where conventional, or a single string for corporate authors).
- `(cited-work, has-year, integer)` — the year of publication.
- `(cited-work, has-title, string)` — the full title of the work.

Class-specific characteristic cells — required additionally based on class:

| Class       | Additional required cells                                          |
|-------------|--------------------------------------------------------------------|
| `book`      | (none beyond universal)                                            |
| `article`   | `has-journal`                                                      |
| `chapter`   | `has-in` (title of the containing volume)                          |
| `preprint`  | `has-repository` (e.g. arXiv, SSRN, PhilArchive)                   |
| `report`    | `has-institution`                                                  |
| `thesis`    | `has-institution`, `has-degree` (one of `phd`, `masters`)          |
| `online`    | `has-url`                                                          |
| `software`  | `has-url` or `has-repository`                                      |

Optional characteristic cells — admissible on any class:

`has-doi`, `has-isbn`, `has-url`, `has-publisher`, `has-location`, `has-edition`, `has-series`, `has-volume`, `has-issue`, `has-pages`, `has-editors`, `has-note`.

## Encoding in frontmatter

In a markdown-resource-file's `references:` map, a cited-work instance is encoded as one entry.
The entry's key is the *citekey* — the canonical identifier per the surname-year convention.
The entry's value is a mapping carrying the characteristic cells as field-value pairs:

```yaml
references:
  ginsberg1988:
    class: article
    authors: ["Ginsberg, Matthew L."]
    year: 1988
    title: "Multivalued logics: A uniform approach to inference in artificial intelligence"
    journal: "Computational Intelligence"
    volume: 4
    issue: 3
    pages: "265-316"
```

The map keys are the citekeys; the map values are the cited-work instances; each value's fields encode the instance's characteristic cells.

## Inhabitance and citation

A `references:` entry inhabits cited-work iff its fields supply a witness for every universal and class-specific cell the form requires.
Inhabitance is checked structurally — the form's JSON-schema encoding at `markdown-resource-file.schema.json` validates each entry against the predication-shape declared above.

The `[citing](../transformers/citing.md)` morphism then resolves body `[@citekey]` tokens against the entries of the same file's `references:` map; each resolution is the cell `(file, citing, cited-work-instance)` in the predication graph.

## Bibliographic-data sources

The predication-shape above is the union of the data fields specified by the two standard bibliographic frameworks the form derives from: the author-date variant of [@chicago2017] and the bibliographic-reference standard [@iso6902010].
The class vocabulary is restricted to a subset that the 561 Group's working corpus needs in practice (book, article, chapter, preprint, report, thesis, online, software); extending the class vocabulary is a future amendment.
