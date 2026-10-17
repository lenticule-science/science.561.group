---
description: Capturing a dated, byte-exact, replayable record of a specific HTTP request and the response it produced, stored in a standardized container format, distinct from mirroring a site's current serving behavior.
identity: web-archiving
name: Web Archiving
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  iso2017:
    authors:
      - International Organization for Standardization
    title: ISO 28500:2017 Information and documentation — WARC file format
    publication: ISO
    year: 2017
    url: https://www.iso.org/standard/68004.html
---
Web archiving in the WARC sense captures a dated, byte-exact, replayable record of a specific HTTP request and the response it produced, bundled together with crawl metadata in a standardized container format: [ISO 28500:2017](https://www.iso.org/standard/68004.html), "Information and documentation — WARC file format," developed by the International Internet Preservation Consortium (revising the original ISO 28500:2009).

This is distinct from mirroring: a mirror reproduces a site's current serving behavior — running a copy of the same application against a copy of the same data — and can go stale silently as the origin changes, giving no evidence of what was served on any specific past date, while a WARC capture's replay does not depend on the original server still existing, since it is a recording of one already-completed transaction rather than a live re-execution of the origin's serving logic.

Because ISO 28500 standardizes the container rather than any one implementation, a WARC file captured by one archiving operator is replayable by any tool implementing the standard, which is the basis the Internet Archive's Wayback Machine and Perma.cc both build their independent, cross-operator replay on: a corpus captured to WARC by one operator can be re-served by a different operator without cooperation from, or even the continued existence of, the site that was originally captured.
