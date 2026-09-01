---
title: "Decision: four-group directory structure with twelve cross-cutting types"
date-created: 2026-03-09T00:00:00
keywords:
  - knowing-semioverse
  - directory-organization
  - KnowingSemioverse
  - DirectoryOrganization
authors:
  - emsenn
  - claude
type: decision
status: accepted
---

## Context

A knowing semioverse needs a vocabulary of cross-cutting directory
types that can appear within any Thing. The repository had accumulated
ad-hoc types (terms/, concepts/, texts/, curricula/, disciplines/,
schools/, topics/) without a principled account of why those types
exist, how they relate, or what types are missing.

Research into knowledge organization systems, intellectual
differentiation frameworks, epistemological structure of knowledge
work, and process ontology was commissioned and produced six research
texts, synthesized at
`information/disciplines/knowledge-systems/texts/research/
directory-organization-for-knowledge-systems.md`.

## Decision

Twelve cross-cutting directory types, grouped into four functional
groups:

**governing** (methods/, practices/, standards/)
— how work is conducted within a Thing. Grounded in the
methods/practices/standards triad from philosophy of science:
methods are generalized inquiry forms, practices are situated
enactments, standards are normative constraints (Bogen on data
production; Douglas on scientific objectivity; Wenger on communities
of practice).

**engaging** (learning/, researching/, applying/)
— how knowledge flows into, out of, and through a Thing. The three
modes of knowledge engagement: intake from external sources, output
in accessible form, and use in concrete situations. The cycle is
iterative: applying reveals gaps → researching fills them → learning
structures what research produces.

**situating** (disciplines/, schools/, lineages/)
— where knowledge is placed in intellectual context, along three
independent axes identified by differentiation research:
- disciplines: institutional/jurisdictional (Abbott)
- schools: epistemic/stylistic (Kuhn, Fleck, Lakatos)
- lineages: derivational/transmissive (Fleck's apprenticeship and
  circulation; Wenger's communities of practice as transmission
  structures)

**defining** (topics/, concepts/, terms/)
— what knowledge consists of, at three levels of specificity grounded
in terminology science (Dahlberg) and library science (Hjorland):
- terms: linguistic handles for specific referents
- concepts: units of knowledge emerging from and generalizing across
  terms; patterns in wider inferential systems
- topics: aboutness-classes gathering many concepts under one region
  of concern

## Why gerund form

All four group names are gerunds (governing, engaging, situating,
defining). This reflects process-ontological commitment: categories
track patterns of becoming rather than sorting finished things
(Whitehead/Rescher/Seibt). Directory names name activities, not
substances. The twelve member types are process-nouns for the same
reason.

## Why these four groups

The four groups represent two orthogonal distinctions:

Activity vs structure: governing and engaging are activity-oriented
(what is DONE); situating and defining are structure-oriented (what
is PRODUCED by activity). But all names are gerunds because even
structural categories are activities of situating and defining.

Internal vs external: governing and defining are inward-facing
(how THIS Thing works, what THIS Thing consists of); engaging and
situating are outward-facing (how knowledge flows relative to the
world, where this Thing sits in broader context).

## Alternatives considered

- **Keep existing ad-hoc types without grouping**: rejected —
  no principled account of what types exist or why, making it
  impossible to know whether a type is missing.
- **Single flat list without groups**: rejected — the grouping
  carries semantic information about what each type does.
- **Subject-based grouping** (following library science shelf
  classification): rejected — we classify by function within a
  Thing, not by the subject the content is about.
- **differentiating** as the name for the third group: considered
  but rejected as not fitting the gerund pattern cleanly. **situating**
  better captures what disciplines, schools, and lineages do: they
  place knowledge in intellectual context.
- **communities/** as the third member of the situating group:
  considered; rejected in favor of **lineages** because lineages
  capture derivational transmission specifically, which is more
  precise than the broader "communities" and better fits the
  emsemioverse's emphasis on intellectual descent (neuroreflexivity
  from relationality; semiotic-markdown from agential semioverse).
