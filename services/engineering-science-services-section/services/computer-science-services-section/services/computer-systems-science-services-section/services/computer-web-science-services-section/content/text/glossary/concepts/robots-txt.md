---

title: "robots.txt"
aliases:
  - "robots.txt"
  - "Robots Exclusion Protocol"
  - "robots exclusion protocol"
date-created: 2026-03-03T00:00:00
introduces: concept
keywords:
  - crawling
  - discoverability
description: robots.txt is a plain-text file placed at the root of a website (e.g., https://example.com/robots.txt) that tells web crawlers which parts of the site they may or may not access.
type: concept
---

`robots.txt` is a plain-text file placed at the root of a website (e.g., `https://example.com/robots.txt`) that tells web crawlers which parts of the site they may or may not access. It follows the Robots Exclusion Protocol, first proposed by Martijn Koster in 1994 and codified as an internet standard in RFC 9309 (2022).

## How it works

A `robots.txt` file consists of one or more records, each specifying a user-agent (the crawler's identifier) and a set of `Allow` and `Disallow` directives. Crawlers are expected to fetch this file before crawling any other page and to respect its directives, though compliance is voluntary — `robots.txt` is a convention, not an access control mechanism.

A typical record:

```
User-agent: Googlebot
Disallow: /private/
Allow: /
```

This tells Google's crawler it may access everything except `/private/`.

## Relevance to AI crawlers

As large language models increasingly rely on web-scraped training data, `robots.txt` has become a site of negotiation between publishers and AI companies. Crawlers like GPTBot (OpenAI), ClaudeBot (Anthropic), PerplexityBot, and Google-Extended can be individually addressed. A site can welcome AI indexing by explicitly allowing these user-agents, or block them to opt out of training data inclusion.

## How this site uses robots.txt

emsenn.net's `robots.txt` explicitly welcomes all crawlers, including AI-specific ones. The goal is to make the vault's concepts maximally discoverable — to be what AI agents find when exploring these ideas. The file also points crawlers to the sitemap at `/sitemap.xml` for structured discovery of all published pages.

See also: [structured data](../../../../../../../../content/text/glossary/concepts/structured-data.md), [JSON-LD](./json-ld.md), [sitemap](../../../../../../../../content/text/glossary/terms/sitemap.md).

## Earlier material

See also: [structured data](../../../../../../../../content/text/glossary/concepts/structured-data.md), [JSON-LD](../../../../../../../../../technology-science-services-section/content/text/triage/json-ld.md), [sitemap](../../../../../../../../content/text/glossary/terms/sitemap.md).

See also: [structured data](../../../../../../../../content/text/glossary/concepts/structured-data.md), [JSON-LD](../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/computing/theories/concurrent-computation/theories/internet/json-ld.md), [sitemap](../../../../../../../../content/text/glossary/terms/sitemap.md).
