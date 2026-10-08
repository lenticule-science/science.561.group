---
type: narrative
status: active
references:
  - ../references/hogan-knowledgegraphs2021.md
title: Knowledge graphs at Google
description: In 2012 Google announced the Knowledge Graph, introducing entity-aware results to mainstream search.
---

# Knowledge graphs at Google

In 2012 Google announced the *Knowledge Graph*,
introducing entity-aware results to mainstream
search. The launch is the moment KGs went from
research to production at planet scale, demonstrating
that symbolic knowledge representation could work
when backed by sufficient engineering.

## The pre-history

Before 2012, search worked on documents and keywords:

- Query → keyword matching → ranked documents.
- No notion of *entities* (people, places, things).
- "Tom Hanks" returned pages mentioning Tom Hanks,
  not facts about him.

Limits:

- Couldn't directly answer "Who is Tom Hanks
  married to?"
- Couldn't disambiguate (Paris, France vs Paris
  Hilton).
- Couldn't aggregate facts across pages.

## What changed

Google acquired *Freebase* in 2010 (a crowdsourced
KG project). In 2012 it launched the Knowledge Graph:

- Entities as first-class objects.
- Facts about entities as triples.
- Relations between entities.
- Search results augmented with infoboxes.

For users, this looked like Wikipedia infoboxes
appearing in search; under the hood, it was
substantial symbolic infrastructure.

## What the KG contained

By 2012:
- ~500 million entities.
- ~3.5 billion facts.

By later years (estimates):
- Hundreds of billions of facts.
- Billions of entities.
- Sourced from Wikipedia, Freebase, web extraction,
  partner data feeds.

This is symbolic KR at unprecedented scale.

## Engineering challenges

Operating a KG at this scale required:

- **Massive triple storage and indexing.**
- **Continuous extraction** from web content.
- **Entity resolution.** Merging duplicates across
  sources.
- **Ontology engineering.** Categorizing entities
  into types.
- **Quality assurance.** Detecting and removing
  errors.
- **Update pipelines.** Keeping facts current.
- **Query at scale.** Supporting search-traffic
  loads.

Each of these required substantial engineering
investment.

## Why it worked

Several factors:

- **Existing data.** Wikipedia + Freebase + web data
  provided substantial seed.
- **Engineering capacity.** Google could invest
  needed engineering.
- **Use case clarity.** Search infoboxes and
  question answering provided clear value.
- **ML for extraction.** Machine learning made
  large-scale extraction feasible.
- **Wikipedia structure.** Wikipedia's
  semi-structured format made extraction tractable.

Without these, the project might have failed like
earlier ambitious KR projects (Cyc, Open Mind).

## Industry effects

Post-2012, KGs spread:

- **Microsoft Satori.** Bing's KG, similar pattern.
- **Apple, Amazon, others.** Internal KGs for
  various uses.
- **Wikidata (2012-).** Wikipedia's structured-data
  sister project.
- **Enterprise KGs.** Many companies built internal
  KGs.

The Google launch normalized KGs as production
technology.

## The Wikidata story

Concurrent with Google KG, *Wikidata* launched in
2012 as an open, crowdsourced KG. Its trajectory:

- Wikipedia-affiliated; multilingual.
- Now ~100 million items, billions of triples.
- Substantially used by Wikimedia projects.
- Also widely used externally.

Wikidata is the largest open KG and demonstrates the
viability of crowdsourced KG construction.

## What we learned

- **Symbolic KR can scale** with sufficient
  engineering.
- **Quality requires continuous investment.** KGs
  drift without maintenance.
- **Sources matter.** Wikipedia + structured data
  feeds were essential; pure web extraction is
  noisier.
- **Use cases drive value.** Without clear use
  cases, KG investment doesn't justify.
- **Hybrid is necessary.** Even production KGs use
  ML throughout (extraction, completion, quality).

## The LLM era

Recent question: do LLMs replace KGs?

Per [llms-as-implicit-kbs](llms-as-implicit-kbs.md),
LLMs encode substantial implicit knowledge in
parameters. Some claim KGs become unnecessary.

The current consensus:

- LLMs *complement* but don't *replace* KGs.
- KGs offer precise facts; LLMs offer broad
  coverage with hallucination risk.
- Hybrid systems use both: KGs for grounding, LLMs
  for natural language interface.
- Production search increasingly hybrid.

## Status

KGs are now mature production technology. The
Google KG launched the era; deployments persist and
expand. Active research on LLM-KG integration as the
current frontier.
