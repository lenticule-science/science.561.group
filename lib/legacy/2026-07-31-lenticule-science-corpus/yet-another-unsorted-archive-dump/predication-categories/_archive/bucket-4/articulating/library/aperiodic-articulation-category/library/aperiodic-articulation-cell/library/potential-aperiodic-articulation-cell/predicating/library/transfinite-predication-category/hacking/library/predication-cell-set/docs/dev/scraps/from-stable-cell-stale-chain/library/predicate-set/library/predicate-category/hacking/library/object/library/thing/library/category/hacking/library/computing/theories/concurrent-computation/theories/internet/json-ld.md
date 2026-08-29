---

title: "JSON-LD"
aliases:
  - "JSON-LD"
  - "json-ld"
  - "JSON for Linking Data"
date-created: 2026-03-03T00:00:00
introduces: concept
keywords:
  - structured-data
  - semantic-web
  - discoverability
---

JSON-LD (JavaScript Object Notation for Linked Data) is a method of encoding [structured data](./structured-data.md) using JSON syntax. It allows web pages to embed machine-readable descriptions of their content — what kind of thing a page describes, who created it, when it was published — alongside the human-readable HTML.

## How it works

A JSON-LD block is placed inside a `<script type="application/ld+json">` tag in the page's `<head>` or `<body>`. It contains a JSON object with a `@context` (typically `https://schema.org`) and a `@type` declaring what kind of thing is being described.

Example for a research article:

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "What makes a Web platform robust?",
  "author": { "@type": "Person", "name": "emsenn" },
  "datePublished": "2025-12-13"
}
```

Search engines and AI systems parse this block to understand the page without needing to interpret the prose. A page about a defined term can declare itself a `DefinedTerm`; a curriculum page can declare itself a `LearningResource`; a page about a person can use the `Person` type.

## Why it matters

Without structured data, a crawler sees only text. It can infer meaning from context, but inference is noisy. JSON-LD removes the ambiguity: the page states what it is. This is the difference between a search engine guessing "this page seems to define something" and knowing "this page defines the term '[closure operator](../../../mathematics/concepts/closure-operator/index.md)' in the domain of mathematics."

For a research site operating at the boundary of established fields — where concepts are new and naming conventions are unfamiliar — structured data bridges the gap between what the site says and what machines understand.

## Relationship to Schema.org

[Schema.org](./schema-org.md) provides the vocabulary that JSON-LD uses. Schema.org defines types (`Article`, `DefinedTerm`, `Person`, `LearningResource`, `WebSite`, `BreadcrumbList`) and properties (`headline`, `author`, `datePublished`, `description`). JSON-LD is the encoding format; Schema.org is the dictionary.

## How this site uses JSON-LD

emsenn.net emits per-page JSON-LD in the `<head>` element, generated at build time by the Quartz static site generator. The type is selected based on the page's path within the vault:

| Path pattern | Schema.org type | Rationale |
|---|---|---|
| `*/terms/*`, `*/concepts/*` | `DefinedTerm` | These pages define specific terms or concepts |
| `*/people/*` | `Person` | Biographical entries |
| `*/curricula/*` | `LearningResource` | Lesson and curriculum pages |
| Everything else | `Article` | Default: a piece of writing |
| Site root | `WebSite` | Identifies the site itself |

Multi-level pages also emit a `BreadcrumbList` so search engines and AI systems understand the hierarchical structure (e.g., Mathematics → Objects → Posets → Curricula → [Heyting](../../../../../../../references/people/arend-heyting.md) Algebras).

See also: [robots.txt](./robots-txt.md), [structured data](./structured-data.md), [Schema.org](./schema-org.md).
