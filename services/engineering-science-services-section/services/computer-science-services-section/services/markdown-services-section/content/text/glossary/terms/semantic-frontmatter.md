---
name: "ASR Semantic Frontmatter"
aliases:
  - "ASR Semantic Frontmatter"
  - "semantic frontmatter"
date-created: 2026-03-03
authors:
  - emsenn
keywords:
  - StructuredData
  - SemanticWeb
description: "Specification for typed relation fields, hierarchical tags, and RDF generation in ASR frontmatter."
---

This document specifies how an Agential Semioverse Repository extends [Semiotic Markdown](../semiotic-markdown/index.md) frontmatter with typed semantic relations, hierarchical tags, and a build-time process for generating machine-readable linked data.

## Motivation

The [Semiotic Markdown](../semiotic-markdown/index.md) specification defines the base frontmatter schema: `title`, `date-created`, `aliases`, `authors`, `tags`, `description`. These fields identify a file and classify it. But they do not describe the file's *semantic relations* to other files — what it defines, what it cites, what it depends on, what it teaches.

Body-level wikilinks create connections, but they are untyped: a link from page A to page B says "A references B" without saying *how*. A term definition page that wikilinks to another term might be defining it, citing it, contrasting it, or depending on it as a prerequisite. These distinctions are invisible to machines and to the vault's own infrastructure.

Typed relation fields in frontmatter make these distinctions explicit. They serve three purposes:

1. **Build-time generation**: typed relations in frontmatter can be compiled into RDF/Turtle at build time, producing a machine-readable knowledge graph alongside the HTML site.
2. **Navigation and discovery**: typed relations enable richer backlinks ("pages that cite this," "pages that define terms used here," "lessons that teach this concept").
3. **External interoperability**: typed relations map to established vocabularies (Schema.org, Dublin Core, SKOS), connecting the vault's concepts to the broader semantic web.

## Design principles

### Source stays in frontmatter

Typed relations are authored in frontmatter YAML, not in separate files. The frontmatter is the single source of truth. Machine-readable formats (RDF/Turtle, JSON-LD) are derived artifacts generated at build time and MUST NOT be hand-edited.

### Tags signal shared territory

Tags identify the conceptual communities a page belongs to. A tag like `affect` says "this page shares conceptual territory with other work tagged `affect`." Tags are chosen to overlap with terms used by external bodies — academic fields, open-source communities, activist networks — so that the vault's content is findable by people who already use those terms.

Tags are NOT redundant with directory position. A file at `sociology/terms/feeling-rules.md` does not need a `sociology` tag (the directory already carries that). Tags carry *cross-cutting* classification: a sociology term might be tagged `affect` and `labor` to signal connections that the directory hierarchy does not encode.

### Tags are flat and CamelCase

Tags are flat labels — no `/` separators, no nesting. A tag like `Anarchism` stands on its own; it does not need to be scoped as `Sociology/Politics/Anarchism` because the directory already encodes structural position.

Tags use CamelCase formatting: capitalize every word, including articles and prepositions. This follows the W3C WCAG and Mastodon/Fediverse convention for [hashtag](../../../../../tagging-services-section/content/text/glossary/terms/hashtag.md) accessibility — screen readers parse CamelCase by detecting capitalization transitions, so `#PoliticalTheory` reads as two words while `#politicaltheory` reads as one unintelligible string.

```yaml
tags:
  - Anarchism
  - PoliticalTheory
  - Sociology
```

### Tag count and ordering

Pages SHOULD have 3-5 tags. No page should have more than 10. Tags are ordered from most specific to least specific — the first tag is the page's primary conceptual community, and subsequent tags broaden the context.

### The `type` field

Content type is NOT a tag. It is a separate frontmatter field derived from directory position:

```yaml
type: term
```

Valid values: `term`, `topic`, `index`, `lesson`, `person`, `concept`, `school`, `text`, `babble`, `letter`, `skill`, `question`. The `type` field maps to Schema.org `@type`:

| `type` value | Schema.org `@type` |
|---|---|
| `term`, `concept` | `DefinedTerm` |
| `lesson` | `LearningResource` |
| `person` | `Person` |
| `question` | `Question` |
| `text`, `letter`, `babble` | `Article` |
| `index` | `CollectionPage` |
| default | `Article` |

### Relation fields are optional

No typed relation field is required. Adding them incrementally — starting with the most-linked pages and working outward — is the intended workflow. Pages without typed relations continue to work exactly as before.

## Typed relation fields

### `defines`

A list of terms or concepts that this page defines. The page is the authoritative source for these terms within the vault.

```yaml
defines:
  - "feeling rules"
  - "emotion work"
```

Maps to: `skos:definition`, `schema:definedTerm`

### `cites`

A list of references this page draws on. These are intellectual debts — works or people whose ideas the page engages substantively, not passing mentions.

```yaml
cites:
  - "Arlie Russell Hochschild"
  - "The Managed Heart"
```

Maps to: `schema:citation`, `dcterms:references`

### `teaches`

A list of concepts or skills the page is designed to help the reader understand. Used primarily in `curricula/` pages.

```yaml
teaches:
  - "lattices"
  - "meet and join"
  - "bounded lattice"
```

Maps to: `schema:teaches`, `schema:educationalAlignment`

### `requires`

A list of concepts or pages that the reader should understand before this page. Equivalent to the existing `dependencies` field used in curricula.

```yaml
requires:
  - "partial orders"
  - "Hasse diagrams"
```

Maps to: `schema:coursePrerequisites`, `dcterms:requires`

### `part-of`

A list of larger structures this page belongs to. Used when directory hierarchy alone does not capture the relationship.

```yaml
part-of:
  - "cybernetic postliberalism"
  - "californication genealogy"
```

Maps to: `schema:isPartOf`, `dcterms:isPartOf`

### `extends`

A list of concepts this page builds upon or generalizes. Distinct from `requires` (which is about reader prerequisites) — `extends` is about conceptual [genealogy](../../../philosophy/disciplines/critical-theory/schools/foucault/terms/genealogy.md).

```yaml
extends:
  - "neurotic academic"
  - "neurotic influencer"
```

Maps to: `skos:broader` (inverse), `schema:isBasedOn`

### `questions`

A list of questions this page raises, investigates, or is motivated by. These are inquiry-shaping questions — not rhetorical or self-check. They signal that the page participates in an ongoing investigation. See [Questions as First-Class Objects](../../../../../../content/text/documents/articles/notes/questions-as-first-class-objects.md) for the formal rationale.

```yaml
questions:
  - "What is the relationship between formalization and understanding?"
  - "When does closure fail to be idempotent?"
```

Maps to: `schema:about`

### `addresses`

A list of questions this page contributes toward answering. The inverse of `questions` (which declares questions raised). A page that `addresses` a question provides evidence, argument, or formal development relevant to it.

```yaml
addresses:
  - "Is there engagement between the Black radical tradition and Russian semiotics?"
```

Maps to: `schema:about`

## Tag vocabulary

Tags SHOULD be drawn from a [controlled vocabulary](../../../../../tagging-services-section/content/text/glossary/terms/controlled-vocabulary.md). The vocabulary is maintained as tag index pages under `content/tags/`. Tags function like academic journal [keywords](../../../../../tagging-services-section/content/text/glossary/terms/keyword.md): they signal which conceptual communities a page participates in, enabling cross-cutting discovery across a corpus where directory structure encodes structural classification.

### Tag conventions

- **CamelCase**: `Anarchism`, `PoliticalTheory`, `SettlerColonialism`
- **Flat**: no `/` separators, no hierarchy
- **3-5 per page** (max 10)
- **Most-specific first**: `Anarchism`, `PoliticalTheory`, `Sociology`
- **Cross-cutting only**: never duplicate directory position
- **From the vocabulary**: prefer existing tags over inventing new ones

### Tag pages

Each tag SHOULD have a corresponding page at `content/tags/<TagName>.md` (CamelCase filename matching the tag) that:

1. Defines the tag's scope in one or two sentences
2. Lists related tags (both within the vault and external equivalents)
3. Links to key pages using the tag
4. Notes which external communities use this or similar terminology

The tag vocabulary follows a hybrid model inspired by [tag wrangling](../../../../../tagging-services-section/content/text/glossary/terms/tag-wrangling.md): authors can apply any tag, but the controlled vocabulary maintained under `content/tags/` represents the canonical set. Periodic reconciliation brings actual usage in line with the vocabulary.

## RDF generation

### Build-time process

At build time, the site generator SHOULD compile frontmatter relations into RDF/Turtle files. The process:

1. For each published page, read its frontmatter.
2. If typed relation fields are present, generate triples.
3. Write a per-page `.ttl` file alongside the HTML output.
4. Optionally generate a combined graph file (`/knowledge-graph.ttl`) containing all triples.

### Namespace prefixes

```turtle
@prefix emsenn: <https://emsenn.net/> .
@prefix schema: <https://schema.org/> .
@prefix skos: <http://www.w3.org/2004/02/skos/core#> .
@prefix dcterms: <http://purl.org/dc/terms/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
```

### Example output

Given the frontmatter:

```yaml
title: "Feeling rules"
defines:
  - "feeling rules"
  - "emotion work"
cites:
  - "Arlie Russell Hochschild"
tags:
  - affect
  - labor
```

The generated Turtle would be:

```turtle
emsenn:sociology/terms/feeling-rules
  a skos:Concept, schema:DefinedTerm ;
  schema:name "Feeling rules" ;
  skos:definition "feeling rules" ;
  skos:definition "emotion work" ;
  dcterms:references emsenn:general/people/arlie-russell-hochschild ;
  schema:keywords "affect", "labor" .
```

### Implementation status

RDF generation is not yet implemented. The specification describes the target architecture. Implementation requires a Quartz emitter plugin that:

1. Reads `QuartzPluginData` during the emit phase
2. Extracts typed relation fields from frontmatter
3. Resolves relation targets to page slugs where possible
4. Generates Turtle syntax
5. Writes `.ttl` files to the output directory

The JSON-LD generation already implemented in `quartz/components/Head.tsx` (see [ASR Web Discoverability](../../../../../../content/text/documents/articles/notes/web-discoverability.md)) handles Schema.org types derived from directory position. The RDF generation described here is complementary: it handles typed relations between pages, which JSON-LD per-page metadata does not capture.

## Migration plan

Adopting semantic frontmatter is incremental:

1. **Phase 1** (done): Add `defines` to all `terms/` pages.
2. **Phase 2** (done): Add `teaches` and `requires` to all `curricula/` pages. Migrate `dependencies` → `requires`.
3. **Phase 3** (done): Add `cites` to pages with bibliography references.
4. **Phase 4** (done): Tag cleanup — normalize case, remove duplicates.
5. **Phase 5** (done): Write tag pages under `content/tags/` for the controlled vocabulary.
6. **Phase 6** (in progress): Tag architecture overhaul — migrate `type/` tags to `type:` field, convert tags to CamelCase, enforce flat/cross-cutting-only conventions.
7. **Phase 7** (planned): Implement the RDF emitter plugin for build-time generation.

Each phase is independently useful. The vault functions without any of them, and each addition makes the vault's semantic structure more explicit and more machine-readable.

These typed relation fields are the vocabulary from which the
[predicate graph](../../../../../../content/text/documents/articles/notes/predicate-graph.md) is built. Each field defined
here generates triplets in the graph; each triplet carries a predicate
from this vocabulary.

1. **Predicate graph construction**: typed relations in frontmatter are
   extracted as triplets by the
   [predicate graph](../../../../../../content/text/documents/articles/notes/predicate-graph.md) tool, forming the computable
   semantic substrate of the repository.
2. **Navigation and discovery**: typed relations enable richer backlinks
   ("pages that cite this," "pages that define terms used here,"
   "lessons that teach this concept").
3. **External interoperability**: typed relations map to established
   vocabularies (Schema.org, Dublin Core, SKOS), connecting the vault's
   concepts to the broader semantic web.
4. **Build-time generation**: typed relations can be compiled into
   RDF/Turtle at build time.

The type and relation vocabularies defined here are general — they apply across any discipline. Specific knowledge domains may extend both with types and relations that carry domain-specific validity requirements. When a page uses a domain-specific relation, the shapes governing that relation validate it regardless of what other relations the page uses. See [Domain-Specific Content](../../../../../../content/text/documents/articles/notes/domain-specific-content.md) for how this works.

Current domain-specific extensions:
- [Mathematical ASR](../../../../../../content/text/mathematics/specifications/mathematical-agential-semioverse-repository/index.md) — adds types `theorem`, `proof`, `axiom`, `definition`, `conjecture`, `lemma`, `corollary`, `proposition` and relations `proven-by`, `proves`, `notation`
- [Philosophical ASR](../../../../../../content/text/philosophy/specifications/philosophical-agential-semioverse-repository/index.md) — adds types `claim`, `argument`, `objection`, `position`, `tradition` and relations `argued-by`, `supports`, `targets`, `contested-by`
- [Sociological ASR](../../../../../../content/text/sociology/specifications/sociological-agential-semioverse-repository/index.md) — adds relations `school`, `integrates`, `produces`, `sustains`, `contests`, `uses-concepts`, `emerges-under`
- [Ludic ASR](../../../../../../content/text/games/specifications/ludic-agential-semioverse-repository/index.md) — adds type `specification` and relations `uses-mechanic`, `classifies`, `boundary-with`, `models`
- [Educational ASR](../../../../../../content/text/education/specifications/educational-agential-semioverse-repository/index.md) — adds types `curriculum`, `skill`, `transmission-mode` and relations `practiced-through`, `scaffolds`, `builds-on`

The `cites` relation is distinct from inline `[@citekey]` citations in the document body. Inline citations are point-of-evidence markers for specific claims; `cites` declares a document-level intellectual dependency. See the [citation specification](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/interactive-semioverse-services-section/services/agential-semioverse-services-section/content/text/documents/articles/notes/citations.md) for the full citation model.

The [predicate graph](../../../../../../content/text/documents/articles/notes/predicate-graph.md) tool reports actual
predicate usage across the repository. As of 2026-03-06:

| Predicate | Occurrences | Specified here | Notes |
|---|---|---|---|
| `type` | 2722 | Yes (Section: The `type` field) | Most-used predicate; routes axiom evaluation |
| `tagged` | 1803 | Yes (via `tags` field) | Cross-cutting classification |
| `defines` | 1719 | Yes | Core relation for terms and concepts |
| `teaches` | 509 | Yes | Primarily in curricula |
| `authors` | 505 | Yes (base schema) | Provenance tracking |
| `cites` | 446 | Yes | Intellectual dependencies |
| `requires` | 206 | Yes | Prerequisite relations; 206 produce graph edges |
| `mirrors` | 61 | No | Emerged in practice; not yet specified |
| `references` | 49 | No | Emerged in practice; not yet specified |
| `questions` | 29 | Yes | Inquiry-shaping questions |
| `notation` | 11 | Domain-specific (math) | Mathematical notation |
| `source` | 11 | No | Emerged in practice |
| `part-of` | 5 | Yes | Structural containment |

Predicates with fewer than 5 occurrences: `extends` (specified),
`addresses` (specified), `publish_to`, `vocabulary`, `todo`, `school`
(domain-specific), `proven-by` (domain-specific), `argued-by`
(domain-specific), `supports` (domain-specific).

The `mirrors` and `references` predicates emerged in practice without
being specified. `mirrors` appears to mark parallel content across
disciplines; `references` marks non-intellectual citations. Both need
specification if they are to participate in axiom evaluation.
