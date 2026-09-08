---
description: Structured, machine-readable description of a text's identity and provenance, stated at library-catalog (MARC), general-resource (Dublin Core), and web-page (schema.org) scope.
identity: bibliographic-metadata
name: Bibliographic Metadata
provenance:
  date-created: 2026-09-08
references:
  dcmi2012:
    authors:
      - Dublin Core Metadata Initiative
    title: Dublin Core Metadata Element Set, Version 1.1
    publisher: DCMI
    year: 2012
    url: https://www.dublincore.org/specifications/dublin-core/dces/
  loc1999:
    authors:
      - Library of Congress, Network Development and MARC Standards Office
    title: MARC 21 Format for Bibliographic Data
    publisher: Library of Congress
    year: 1999
    url: https://www.loc.gov/marc/bibliographic/
  schemaorg2011:
    authors:
      - schema.org
    title: Book
    publisher: schema.org
    year: 2011
    url: https://schema.org/Book
    note: Page itself undated as observed 2026-09-08; 2011 is schema.org's project founding year, cited here for lack of a page-level date
---
Bibliographic metadata is structured, machine-readable description of a text's identity and provenance — author, title, subject, date, format — kept separately from, but attached to, the text itself. Three standards state the same job at different scopes: Dublin Core is 'a vocabulary of fifteen properties for use in resource description' (DCMI, Dublin Core Metadata Element Set version 1.1, 2012); MARC states that the format is 'a standard for the representation and communication of bibliographic and related information in machine-readable form' (Library of Congress, MARC 21, 1999); and schema.org's Book type extends its general CreativeWork properties (author, publisher, datePublished) with book-specific ones (isbn, numberOfPages, bookFormat, bookEdition) for description embedded in ordinary web pages.

Bibliographic metadata is distinguished from a text's own body content by carrying no reading obligation: a reader can discover, filter, and cite a work from its metadata alone, without opening the work, and a library's search and tag-browsing surfaces are built almost entirely out of metadata rather than the underlying text. MARC targets a library's own catalog system; Dublin Core targets general resource description across any electronic resource, including the entries an OPDS feed carries; schema.org targets description a general-purpose search engine, not only a library system, can read directly off a web page.

Because these three standards serve different consuming systems rather than competing definitions of the same fifteen or so facts, a digital library commonly holds the same underlying facts about one text in more than one of these shapes at once — for example as Dublin-Core-flavored Atom entries in an OPDS feed and as schema.org markup on the same text's own web page — and a change to one shape does not by itself update the others unless the library derives all of them from one authoritative record.
