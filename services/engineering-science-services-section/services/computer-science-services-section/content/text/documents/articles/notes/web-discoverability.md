---
title: "ASR Web Discoverability"
aliases:
  - "ASR Web Discoverability"
  - "web discoverability"
date-created: 2026-03-03T00:00:00
authors:
  - emsenn
keywords:
  - discoverability
  - structured-data
description: This document specifies how an Agential Semioverse Repository published as a website makes itself discoverable to automated agents — search engine crawlers, AI training pipelines, retrieval-augmented generation (RAG) systems, and other…
---

This document specifies how an Agential Semioverse Repository published as a website makes itself discoverable to automated agents — search engine crawlers, AI training pipelines, retrieval-augmented generation (RAG) systems, and other machines that traverse the web looking for knowledge.

## Motivation

An ASR is a structured knowledge repository. Its directory organization, frontmatter schema, and internal linking conventions already carry semantic structure. When published as a website, that structure can be made legible to machines in three complementary ways:

1. **Crawl permissions** — telling machines they are welcome.
2. **Structured data** — telling machines what each page is.
3. **Sitemap** — telling machines what pages exist.

Together, these transform a static site from a collection of pages into a machine-readable knowledge surface.

## 1. Crawl permissions: robots.txt

An ASR SHOULD publish a [robots.txt](../../../../../services/computer-systems-science-services-section/services/computer-web-science-services-section/content/text/glossary/concepts/robots-txt.md) file at the site root that explicitly welcomes crawlers relevant to the repository's goals. For a research site aiming to be discoverable by AI agents, this means naming and allowing AI-specific user-agents:

- `GPTBot` (OpenAI)
- `ClaudeBot` (Anthropic)
- `anthropic-ai` (Anthropic training)
- `Google-Extended` (Google AI)
- `PerplexityBot` (Perplexity)
- `CCBot` (Common Crawl)
- `Applebot-Extended` (Apple Intelligence)

The `robots.txt` file SHOULD also point to the sitemap:

```
Sitemap: https://example.com/sitemap.xml
```

## 2. Structured data: JSON-LD and Schema.org

An ASR SHOULD emit per-page [JSON-LD](../../../glossary/concepts/json-ld.md) in the `<head>` element, using [Schema.org](../../../glossary/concepts/schema-org.md) vocabulary. The Schema.org type is determined by the page's position in the ASR directory structure:

| ASR directory type | Schema.org type | Rationale |
|---|---|---|
| `terms/` | `DefinedTerm` | Glossary entries define specific terms |
| `concepts/` | `DefinedTerm` | Concept notes define specific ideas |
| `texts/` | `Article` | Papers and essays are articles |
| `curricula/` | `LearningResource` | Lessons are educational resources |
| `specifications/` | `Article` | Specifications are technical articles |
| Encyclopedia entries for people | `Person` | Biographical pages |
| Site root | `WebSite` | Identifies the site as a whole |
| Default | `Article` | Fallback for any other page |

Multi-level pages SHOULD also emit a `BreadcrumbList` reflecting the directory path. This tells machines the hierarchical context: a term defined under `mathematics/objects/posets/terms/` sits within mathematics, within the objects of mathematics, within the study of [partially ordered](../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md) sets.

### Mapping ASR frontmatter to Schema.org properties

| ASR frontmatter | Schema.org [property](../../../sociology/terms/property.md) | Notes |
|---|---|---|
| `title` | `headline` / `name` | Display name of the concept |
| `description` | `description` | Summary for indexing |
| `authors` | `author` | Creator(s) of the content |
| `date-created` | `datePublished` | Publication date |
| `date-updated` | `dateModified` | Last edit date |
| `tags` | `keywords` | Topical classification |

## 3. Sitemap

An ASR published as a website SHOULD generate an XML sitemap listing all published pages with their last-modified dates. The sitemap enables crawlers to discover content without following every link, and to prioritize recently updated pages.

## 4. Design principles

### Be explicit about what you are

AI systems are better at indexing content when pages declare their type. A page that says "I am a `DefinedTerm` called '[closure operator](../../../mathematics/concepts/closure-operator/index.md)'" is more useful to a knowledge graph than a page that contains the words "[closure operator](../../../mathematics/concepts/closure-operator/index.md)" somewhere in its text.

### Welcome agents rather than blocking them

The default posture of an ASR is openness. The repository exists to contribute knowledge to the [commons](../../../../../../../../social-science-services-section/content/text/glossary/terms/commons.md). Blocking crawlers contradicts this purpose. If specific content should not be crawled (private notes, drafts), it should be excluded from publication rather than published and then blocked.

### Let structure do the work

The ASR directory organization already encodes semantic structure. The web discoverability layer translates that structure into formats machines understand. No additional markup or annotation should be required from the author — the build process should derive structured data from the directory position and frontmatter that already exist.

## Implementation

emsenn.net implements this specification through:

- `quartz/static/robots.txt` — crawl permissions
- `quartz/components/Head.tsx` — per-page JSON-LD generation
- Quartz's built-in sitemap emitter — XML sitemap at `/sitemap.xml`
