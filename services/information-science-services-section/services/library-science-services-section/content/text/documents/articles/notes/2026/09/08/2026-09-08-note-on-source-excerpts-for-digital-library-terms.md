---
title: "Source excerpts for digital-library glossary terms"
description: "First-party excerpts, with URLs and dates, gathered while sourcing the library-science-services-section glossary: the OPDS 1.2 spec, Dublin Core, MARC, schema.org's Book type, print-on-demand and imposition industry documentation, Project Gutenberg's mirroring practice, and the SAA Dictionary's collection-development-policy entry. Held as the disk source these terms' semantic evidence cites."
date-created: 2026-09-08
type: note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/library-science-services-section
name: note-on-source-excerpts-for-digital-library-terms
keywords:
  - digital-library
  - opds
  - dublin-core
  - marc
  - schema-org
  - print-on-demand
  - imposition
  - mirror-site
  - collection-policy
tags:
  - published
status: published
authors:
  - Claude Fable
---

## What this holds

Working excerpts gathered 2026-09-08 for terms in this section's glossary
whose primary source is a standard, a vocabulary page, or a vendor's own
documentation rather than a paper warranting its own bibliography carrier.
Each entry states the claim, the exact quoted source language, the URL,
the source's own stated date where one is shown, and the retrieval date
(2026-09-08 throughout).

## OPDS Catalog 1.2

Source: OPDS Community, *OPDS Catalog 1.2*, https://specs.opds.io/opds-1.2.html
(mirrored at https://github.com/opds-community/specs/blob/master/opds-1.2.md).
Published date shown on the spec: **November 11, 2018**. Retrieved
2026-09-08.

> "The Open Publication Distribution System (OPDS) Catalog format is a
> syndication format for electronic publications based on Atom and HTTP."

Publications under OPDS can be "discovered, using optional search or a
range of optional browsing techniques" and "acquired, using direct
downloads, lending, or vending." OPDS 1.x is built on Atom and Dublin
Core; OPDS 2.0 (a separate, later spec) is built on the Readium Web
Publication Manifest, JSON-LD, and schema.org — OPDS 1.2 is the version
this term cites, per the brief's own direction.

## Dublin Core Metadata Element Set, Version 1.1

Source: Dublin Core Metadata Initiative (DCMI),
https://www.dublincore.org/specifications/dublin-core/dces/. Version 1.1,
**issued June 14, 2012** (the page states this 2012 snapshot is retained
for historical reference; DCMI's current Metadata Terms supersede it for
new work). Retrieved 2026-09-08.

> "The Dublin Core Metadata Element Set is a vocabulary of fifteen
> properties for use in resource description."

Also standardized as IETF RFC 5013 and ISO 15836.

## MARC 21 Format for Bibliographic Data

Source: Library of Congress, Network Development and MARC Standards
Office, https://www.loc.gov/marc/ and
https://www.loc.gov/marc/bibliographic/. MARC 21 itself dates from
**1999** (the harmonization of the US and Canadian MARC formats); the
overview page carries no further revision date as observed 2026-09-08.

> "The MARC formats are standards for the representation and
> communication of bibliographic and related information in
> machine-readable form."

## schema.org — Book

Source: https://schema.org/Book. The page itself carries no revision date
as observed 2026-09-08; schema.org as a project was founded in 2011
(Bing, Google, Yahoo!, later joined by Yandex). `Book` is a subtype of
`CreativeWork` (itself a subtype of `Thing`) and adds book-specific
properties (`isbn`, `numberOfPages`, `bookFormat`, `bookEdition`) to
`CreativeWork`'s general ones (`author`, `publisher`, `datePublished`).

## Print-on-demand — Lulu

Source: Lulu Press, "How does Print-On-Demand work?",
https://help.lulu.com/en/support/solutions/articles/64000255305-how-does-print-on-demand-work-.
Page states "Modified on: Thursday, April 23, 2026." Retrieved 2026-09-08.

> "Print-on-demand is a method for printing books (and an assortment of
> other products!) at the time of purchase."

## Imposition — PrintNinja

Source: PrintNinja, "Imposition and Pagination Printing Guide",
https://printninja.com/printing-resource-center/printing-academy/pre-press-production/imposition-pagination/.
Page states "Published: March 29, 2016" and "Updated: April 28, 2026."
Retrieved 2026-09-08.

> "Imposition is the arrangement of individual pages or cards onto press
> sheets, also known as parent sheets."

When a parent sheet is folded to final size, that group of pages is a
signature; pages are arranged on the sheet so that, once folded and
trimmed, they read in the correct order — the mechanism amusewiki's own
"A4 imposed PDF" and "Letter imposed PDF" outputs implement automatically
from one Muse source (see the `pessotto2016` bibliography carrier).

## Mirror site — Project Gutenberg

Source: Project Gutenberg Literary Archive Foundation (PGLAF, incorporated
2000), "Mirroring How-To", https://www.gutenberg.org/help/mirroring.html.
Page carries no revision date as observed 2026-09-08.

> "We highly recommend that you use rsync to create and refresh your
> mirror... The wget and cURL tools are not suitable, because they need to
> look at all files just to get the ones that were updated recently."

> "While you're welcome to present the public collection using any method
> you choose... we ask you use rsync to create and update your copy from
> us."

PG maintains a public list of its own mirrors
(https://www.gutenberg.org/MIRRORS.ALL) and documents the `rsyncd.conf`
configuration an operator uses to expose their own mirror to others in
turn — a library practice of many independently hosted, independently
operated, full copies kept synchronized by a stated protocol (rsync, here)
against one or more upstream sources.

## Collection development policy — SAA Dictionary

Source: Society of American Archivists, *SAA Dictionary of Archives
Terminology*, entry "collection development policy",
https://dictionary.archivists.org/entry/collection-development-policy.html.
Copyright banner on the dictionary reads "2005-2026"; no per-entry revision
date shown. Retrieved 2026-09-08. The entry attributes its core definition
to Reed-Scott, Jutta, 1984, p. 26, and a supporting line to Berner,
Richard C., 1984, p. 248 (secondary citations within the dictionary entry;
neither primary 1984 source was independently fetched this session).

> "[a collection development policy is] a statement of long- and
> short-range needs, of acquisition priorities, and of collecting
> boundaries" (Reed-Scott 1984, p. 26, as quoted in the SAA Dictionary
> entry)

> "[a collection development policy should] address the breadth and depth
> coverage of the collection's focus, whether it be geographic, subject,
> or periodic" (Berner 1984, p. 248, as quoted in the SAA Dictionary
> entry)

The SAA Dictionary is archival-science vocabulary rather than
library-science vocabulary proper; its definition of collection
development policy is nonetheless the field's standard formulation and is
used identically in library collection-development literature (compare the
American Library Association's own collection-development policy
guidance, which states the same three elements — needs, priorities,
boundaries — without a single quotable definitional sentence as clean as
Reed-Scott's; the ALA pages consulted 2026-09-08
(https://libguides.ala.org/librarypolicy,
https://www.ala.org/tools/atoz/Collection%20Development/collectiondevelopment)
link to selection-policy guidance and interest groups but state no
freestanding definition of their own).
