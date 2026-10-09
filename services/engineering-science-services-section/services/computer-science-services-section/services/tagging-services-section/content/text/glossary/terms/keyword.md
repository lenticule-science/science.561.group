---
name: "keyword"
aliases:
  - "keyword"
date-created: 2026-03-04
tags: []
---

A keyword is a term or short phrase assigned to a piece of content to describe its subject matter for the purpose of indexing and discovery. Keywords serve a similar function to tags but carry a connotation of curation and restraint: where tags in a [folksonomy](./folksonomy.md) are applied freely and in unlimited quantity, keywords in academic and publishing contexts are selected deliberately, limited in number (typically three to five, rarely more than ten), and expected to precisely characterize the work's contribution to its field.

In academic publishing, keywords appear in journal article metadata and function as discovery signals for readers, librarians, and database indexers. They bridge the gap between a [controlled vocabulary](./controlled-vocabulary.md) like Medical Subject Headings (MeSH) and the author's own description of their work. Some journals require keywords from a fixed list; others allow author-chosen keywords. The convention is that keywords are ordered from most specific to least specific — the first keyword identifies the article's primary contribution, and subsequent keywords broaden the context. This ordering convention carries information: a reader scanning keywords can quickly determine whether a paper is primarily about their specific interest or merely touches on it.

On the semantic web, Schema.org models keywords through the `keywords` property on `CreativeWork` (and its subtypes including `Article`, `BlogPosting`, and `Book`). The property accepts three value types: plain text strings, URLs pointing to concept definitions, and `DefinedTerm` objects — formal terms with definitions and membership in a `DefinedTermSet`, which is Schema.org's representation of a controlled vocabulary. This three-tier model mirrors the spectrum from free tagging (plain text) through linked concepts (URLs) to formally defined vocabulary terms (`DefinedTerm`), and it allows a single `keywords` field to accommodate the full range of tagging practices observed on the web.
