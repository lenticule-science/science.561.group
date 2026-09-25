---
title: Note on the Living Web Initiative
date-created: 2026-08-26
tags:
- living-web
- web-standards
- whatwg
- wcag
- aria
- indieweb
- activitypub
- conformance
description: "The Living Web is the web understood as a continuously revised system: standards that never freeze, conformance that is a process rather than a state, and sites that participate in protocols rather than merely publish documents."
---


## What the Living Web names

The Living Web is the web understood as a continuously revised system: standards that never freeze, conformance that is a process rather than a state, and sites that participate in protocols rather than merely publish documents. The phrase is a 561 Group coinage. A 2026-08-26 survey confirms the W3C has no initiative by this name; the initiative is therefore the Group's own, and this section is its home.

## The real referents

The initiative pins its claims to current, verifiable standards work:

- **HTML** — the WHATWG HTML Living Standard is the single normative HTML specification; since the 2019 memorandum of understanding the W3C publishes no competing versioned HTML. HTML conformance means validating against the Living Standard as it stands today.
- **Accessibility** — WCAG 2.2 is the current baseline; the corpus's own visual-language floor is WCAG 2.2 AAA contrast. WCAG 3.0 remains a Working Draft with a changed evaluation model (requirements and scoring rather than pass/fail) and no Recommendation expected before roughly 2028; conformance claims name 2.2 explicitly and hedge 3.0 honestly.
- **ARIA** — ARIA in HTML, W3C Recommendation of 2026-04-15, governing how WAI-ARIA applies to HTML elements; the ARIA-last rule (native semantics before ARIA attributes) holds.
- **Structured data** — schema.org expressed as JSON-LD, generated from the same content model as the HTML so the two cannot drift; the soft, local, reversible mode of typing endorsed by the Jiangshi note, not the totalizing RDF/OWL stack.
- **Participation protocols** — IndieWeb building blocks (microformats2, Webmention as W3C Recommendation, Micropub, WebSub), ActivityPub federation, syndication in RSS, Atom, and JSON Feed, well-known URIs (RFC 8615), and the sitemaps.org protocol.
- **CSS** — the Baseline process as the tracking mechanism for what is widely available (container queries, `:has()`, subgrid, cascade layers, nesting, view transitions as of 2026).

## The founding position

Conformance to living standards is a property a build system checks continuously, not a badge earned at launch. A server aligned with this initiative validates its own output — HTML validity, ARIA usage, WCAG checks, structured-data coherence — on every build, and reports the result as data. The observed state of the field motivates the position: the large majority of top homepages fail WCAG, and remediation-overlay vendors have drawn regulatory action; accessible-by-construction output is both the ethical and the differentiating path.

## The engineering realization

VICTOR, the Voxelized Information Catalog Topos Orienting Relations website server (Website Engineering Services Section, `apps/victor`), is the initiative's engineering realization. This section owns the study — tracking the standards as they move, recording positions, and grading the field — while VICTOR owns the build.
