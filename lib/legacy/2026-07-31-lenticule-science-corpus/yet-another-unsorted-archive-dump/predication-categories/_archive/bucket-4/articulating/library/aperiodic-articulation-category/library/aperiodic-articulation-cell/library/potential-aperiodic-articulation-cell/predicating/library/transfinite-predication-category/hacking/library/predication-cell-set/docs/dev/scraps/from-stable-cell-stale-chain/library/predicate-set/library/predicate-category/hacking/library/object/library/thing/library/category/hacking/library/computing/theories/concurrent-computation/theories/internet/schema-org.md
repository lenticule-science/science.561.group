---

title: "Schema.org"
aliases:
  - "Schema.org"
  - "schema.org"
date-created: 2026-03-03T00:00:00
introduces: concept
keywords:
  - structured-data
  - semantic-web
---

Schema.org is a collaborative vocabulary for [structured data](./structured-data.md) on the web, maintained jointly by Google, Microsoft, Yahoo, and Yandex since 2011. It provides a shared set of types (like `Article`, `Person`, `DefinedTerm`) and properties (like `author`, `datePublished`, `description`) that web pages use to describe their content in machine-readable form.

## How it works

Schema.org defines a type hierarchy. `Thing` is the root. Below it sit types like `CreativeWork` (which includes `Article`, `Book`, `LearningResource`), `Person`, `Organization`, and `Place`. Each type has properties that describe instances of that type.

The vocabulary is designed to be broad enough for general use while specific enough to be useful. A `DefinedTerm` has a `name`, a `description`, and an `inDefinedTermSet`. An `Article` has a `headline`, `author`, `datePublished`, and `articleBody`.

## Encoding

Schema.org types are used with one of three encoding formats:

- [JSON-LD](./json-ld.md) (recommended)
- Microdata
- RDFa

The vocabulary is the same regardless of encoding. Schema.org defines *what* to say; the format defines *how* to say it.

## Relevance

Schema.org is the de facto standard for communicating page semantics to search engines and AI systems. When a page declares itself a `DefinedTerm`, search engines can surface it in response to definitional queries. When a page declares itself a `LearningResource`, educational search tools can index it appropriately.

See also: [structured data](./structured-data.md), [JSON-LD](./json-ld.md).
