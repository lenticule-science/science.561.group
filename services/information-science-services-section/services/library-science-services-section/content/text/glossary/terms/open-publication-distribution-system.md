---
description: "OPDS: an Atom-and-HTTP syndication format letting a client application discover and acquire publications from a catalog, per the OPDS 1.2 specification (2018)."
identity: open-publication-distribution-system
name: Open Publication Distribution System
provenance:
  date-created: 2026-09-08
references:
  opds2018:
    authors:
      - OPDS Community
    title: OPDS Catalog 1.2
    publisher: opds-community
    year: 2018
    url: https://specs.opds.io/opds-1.2.html
relations:
  requires:
    - bibliographic-metadata
---
The Open Publication Distribution System (OPDS) Catalog format is a syndication format for electronic publications based on Atom and HTTP (OPDS Community, OPDS Catalog 1.2, 2018). An OPDS catalog is a set of Atom feeds — Navigation Feeds for browsable hierarchies of a collection and Acquisition Feeds for listing available publications — through which publications can be discovered, using optional search or browsing, and acquired, using direct downloads, lending, or vending.

OPDS is distinguished from a library's plain web catalog page by being a syndication format a client application, not only a human with a browser, can consume: an e-reader app can add a library's OPDS address once and thereafter browse, search, and download from that catalog the same way it would from any other OPDS-speaking library, without the library exposing a bespoke API. OPDS 1.x, the version this term names, is itself built on Atom and Dublin Core; a later, separately versioned OPDS 2.0 is built on the Readium Web Publication Manifest, JSON-LD, and schema.org instead.

Because OPDS is a syndication format rather than a delivery guarantee, exposing an OPDS feed answers only how a publication is discovered and requested, not whether the requester is authorized to receive it: a library can gate its OPDS feed's actual content behind a login or a membership tier while still exposing the feed's discovery structure, or it can leave both discovery and acquisition fully open.
