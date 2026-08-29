---

title: "Upper Ontologies and Knowledge Organization"
date-created: 2026-03-31T00:00:00
locates: school
keywords:
  - knowledge-organization
  - ontology
  - information-science
description: "Upper ontologies divide reality by mode of being rather than topic, and none lists academic departments as top-level categories — what this means for knowledge libraries."
references:
  - id: ref1
    type: document
    title: Arp, Smith & Spear, 2015
  - id: ref2
    type: document
    title: Masolo et al., 2003
  - id: ref3
    type: document
    title: Niles & Pease, 2001
  - id: ref4
    type: document
    title: Lenat & Guha, 1990
---

Every major upper ontology divides reality by **mode of being** --- how things exist --- rather than by topic, discipline, or domain. No upper ontology lists "physics," "biology," and "sociology" as top-level categories. This is a finding, not an accident, and it has consequences for how knowledge libraries should be organized.

## Four upper ontologies

**BFO** (Basic Formal Ontology) divides everything into two categories: **continuants** (entities that persist through time and maintain their identity --- objects, qualities, roles) and **occurrents** (entities that unfold in time --- processes, events, temporal regions). BFO became ISO/IEC 21838-2 in 2020. It is deliberately minimal: 36 classes, no domain content, designed as a top-level framework that domain ontologies extend. Its philosophical lineage runs through Aristotelian substance ontology.

**DOLCE** (Descriptive Ontology for Linguistic and Cognitive Engineering) has four top-level categories: **endurants** (things that are wholly present at each moment), **perdurants** (things that extend through time), **qualities** (individual property instances), and **abstracts** (sets, regions, other non-spatiotemporal entities). DOLCE explicitly adopts a cognitive bias --- it aims to capture the ontological categories implicit in natural language and human cognition rather than carving nature at its joints. It is part of the WonderWeb project (Masolo et al., 2003).

**SUMO** (Suggested Upper Merged Ontology) divides into **physical** and **abstract**, with processes as a major subclass of physical. SUMO is larger than BFO or DOLCE (roughly 1,000 terms at the upper level, 20,000+ with its mid-level and domain ontologies merged in). It was constructed by merging several earlier ontologies (Niles & Pease, 2001) and is mapped to the WordNet lexical database. Its design is pragmatic rather than philosophically committed.

**Cyc** uses **microtheories** --- modular, context-specific knowledge bases that can contain locally inconsistent assertions. Cyc's upper ontology divides into things, intangible things, and relationships, but the real organizational principle is contextual: what is true depends on which microtheory you are in. This is the only upper ontology that builds context-dependence into its architecture from the ground up (Lenat & Guha, 1990).

## Structural patterns

Several patterns recur across these ontologies:

- **Thing/process is fundamental.** Every upper ontology makes a primary distinction between entities that persist (things, continuants, endurants) and entities that unfold (processes, occurrents, perdurants). This distinction predates formal ontology --- it appears in Aristotle's categories and in ordinary language.

- **Two to six top-level categories.** BFO has 2, DOLCE has 4, SUMO has roughly 6 at the highest level. Upper ontologies are sparse at the top. The complexity lives in the middle and lower levels.

- **Mode of being, not topic.** The top-level split is never by subject matter. "Biology" does not appear alongside "physics" because organisms and particles are both continuants; metabolism and nuclear decay are both occurrents. Disciplines cross-cut ontological categories.

- **Qualities and abstracts are separate.** DOLCE and SUMO both distinguish qualities (redness, mass, temperature) and abstract entities (numbers, sets, propositions) from things and processes. Qualities inhere in things; abstracts exist independently of any particular thing.

## What this means for knowledge libraries

Library classification systems --- Dewey, LCC, UDC --- use academic departments and professional domains as top-level categories. Upper ontologies do not. This is not because ontologists are ignorant of disciplinary structure. It is because disciplines are not ontological categories. "Biology" is a social institution, an [epistemic culture](../../../../../../humanities/theories/sociology/theories/critical-theory/terms/epistemic-culture.md), a [domain](../terms/domain-analysis.md) in Hjorland's sense. It is not a kind of being.

A knowledge library faces a choice. It can organize by domain (following library tradition) or by ontological category (following upper ontologies). The [integrative levels](../terms/integrative-levels.md) approach offers a middle path: arrange domains in the order of the ontological levels they study (physics before chemistry before biology before sociology), preserving domain structure while grounding the sequence in ontology rather than institutional convention.

The upper ontology finding also explains why [faceted classification](../terms/faceted-classification.md) works. Ranganathan's PMEST facets map loosely onto ontological categories: Personality and Matter correspond to continuants and their qualities; Energy corresponds to occurrents; Space and Time correspond to regions. Faceted classification succeeds because it analyzes subjects along ontological dimensions rather than enumerating disciplinary topics.

The practical lesson: a knowledge library should not treat its top-level divisions as natural kinds. They are organizational choices. Upper ontologies show that reality's own structure is organized by mode of being --- persistence, change, quality, abstraction --- and that disciplinary boundaries are human constructions layered on top of that structure.

## Key texts

- Arp, R., Smith, B. & Spear, A., *Building Ontologies with Basic Formal Ontology* (2015)
- Masolo, C. et al., "WonderWeb Deliverable D18: Ontology Library" (2003)
- Niles, I. & Pease, A., "Towards a Standard Upper Ontology" (2001)
- Lenat, D. & Guha, R.V., *Building Large Knowledge-Based Systems* (1990)
- Sowa, J., *Knowledge Representation* (2000)

## Related

- [Domain analysis](../terms/domain-analysis.md) --- domains as discourse communities, not natural kinds
- [Integrative levels](../terms/integrative-levels.md) --- ordering domains by ontological complexity
- [Faceted classification](../terms/faceted-classification.md) --- decomposing subjects along ontological dimensions
- [Epistemic culture](../../../../../../humanities/theories/sociology/theories/critical-theory/terms/epistemic-culture.md) --- disciplines as machineries of knowing, not ontological categories
