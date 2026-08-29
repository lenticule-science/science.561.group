---
title: "controlled vocabulary"
aliases:
  - "controlled vocabulary"
date-created: 2026-03-04
tags: []
---

A controlled vocabulary is a fixed, curated set of terms used to classify content within a domain. Unlike a [folksonomy](./folksonomy.md), where users apply whatever labels they choose, a controlled vocabulary specifies in advance which terms are valid, how they relate to each other, and which term is preferred when synonyms exist. The purpose is precision: every classifier uses the same term for the same concept, which makes retrieval reliable.

The oldest and most influential controlled vocabularies come from library science. The Library of Congress Subject Headings (LCSH), published since 1909, provide a standardized set of terms for cataloging library materials. Medical Subject Headings (MeSH), maintained by the National Library of Medicine, organizes biomedical literature. Both systems use a consistent internal structure: preferred terms (the canonical label), non-preferred terms (synonyms that redirect to the canonical form), broader/narrower relationships (hierarchical links between general and specific concepts), and related terms (associative links between concepts that are connected but not hierarchically). This structure allows a searcher to find all content about a concept regardless of which synonym the original author might have used.

Controlled vocabularies trade flexibility for consistency. They require ongoing maintenance — someone must decide when a new term enters the vocabulary, how existing terms are scoped, and how the hierarchy adapts as knowledge evolves. This maintenance cost is why folksonomies emerged as an alternative: letting users tag freely eliminates the bottleneck of vocabulary curation. But the problems of uncontrolled tagging (synonym proliferation, polysemy, granularity drift) have led many systems toward hybrid models — free tagging at the point of entry with controlled vocabulary applied retroactively, as in the [tag wrangling](./tag-wrangling.md) model developed by Archive of Our Own.
