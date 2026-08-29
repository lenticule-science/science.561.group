---
title: Web Syndication
description: The practice and family of feed/interchange formats — RSS (from Netscape's 1999 RDF Site Summary through Dave Winer's RSS 2.0), Atom (IETF RFC 4287, 2005), and the news-industry IPTC NewsML-G2/ninjs standards — by which a publisher exposes structured, machine-readable article metadata for aggregators, readers, and search engines to consume, later joined by search-engine-specific structured-data vocabularies such as schema.org's NewsArticle.
date-created: 2026-08-22
aliases:
  - web syndication
  - RSS
  - Atom feed
  - NewsML-G2
  - ninjs
  - news syndication format
defines:
  - web syndication
  - RSS
  - Atom
  - NewsML-G2
  - ninjs
instance-of: content-distribution-standard
---

Web syndication is the practice of publishing structured, machine-readable metadata about articles — headline, body, author, timestamp, and related fields — in a standard format so that other systems (feed readers, aggregators, search engines) can consume it without scraping rendered HTML.
The oldest and still most widely recognized family is RSS, which began as Netscape's RDF Site Summary 0.9 in March 1999 (Dan Libby and Ramanathan V. Guha), was reworked into RSS 0.91 later that year folding in elements of Dave Winer's rival "ScriptingNews" format, and reached its lasting form as Dave Winer's RSS 2.0 (August 19, 2002, per the RSS Advisory Board's version history), published as RSS 2.0.1 by Harvard Law School's Berkman [Klein] Center for Internet & Society in July 2003 (see the [RSS Advisory Board's history](https://www.rssboard.org/rss-history)).
Atom, IETF [RFC 4287](https://www.rfc-editor.org/info/rfc4287/) (December 2005), was developed specifically to fix interoperability problems that had accumulated in RSS's looser specification.

Alongside the general-purpose web-feed formats, the news industry maintains its own interchange standards through the IPTC: NewsML-G2, an XML format for exchanging text, image, video, and audio news plus event and sports metadata, in continuous development since 2004; and ninjs, a lighter JSON equivalent approved in 2013 and still maintained in parallel version branches (see [iptc.org/standards/newsml-g2](https://iptc.org/standards/newsml-g2/) and [iptc.org/standards/ninjs](https://iptc.org/standards/ninjs/)).
More recently, search engines have layered their own structured-data expectations on top of syndication: schema.org's `NewsArticle` type and Google's own developer guidance specify essential properties (headline, image, datePublished, author, publisher) and image-size minimums for eligibility in richer Google News surfaces, without technically requiring any of it for basic News inclusion (see [Google Search Central](https://developers.google.com/search/docs/appearance/structured-data/article)).
Google's AMP framework (announced October 2015, its Top-Stories requirement dropped in the June 2021 Page Experience update) was a related but distinct effort — a page-performance format rather than a syndication format — that briefly became a de facto requirement for some News surfaces before being reversed.

For the fuller literature behind these dates and the load-bearing distinction between standards documentation and empirical adoption research, see the [study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-web-news-media.md), §4.

## Sources

- RSS history. https://www.rssboard.org/rss-history
- Atom Syndication Format, RFC 4287. https://www.rfc-editor.org/info/rfc4287/
- IPTC NewsML-G2. https://iptc.org/standards/newsml-g2/
- IPTC ninjs. https://iptc.org/standards/ninjs/
- Google Search Central, Article structured data. https://developers.google.com/search/docs/appearance/structured-data/article
- Accelerated Mobile Pages. https://en.wikipedia.org/wiki/Accelerated_Mobile_Pages
