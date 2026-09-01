---
title: "Foundations of Information Architecture"
aliases:
  - "Foundations of Information Architecture"
id: ia-lesson-1
authors:
  - claude-opus-4-6
date-created: 2026-03-01T00:00:00
type: lesson
keywords:
  - InformationArchitecture
teaches:
  - "Foundations of Information Architecture"
cites:
  - "Information Architects"
  - "Information Architecture for the World Wide Web"
  - "Prolegomena to Library Classification"
  - "Sorting Things Out: Classification and Its Consequences"
  - "The Image of the City"
---

## What information architecture is

Information architecture is the practice of deciding how information is organized, labeled, and connected so that people can find and use it. It operates at the level of structure rather than content — an information architect does not write the articles, but decides what categories they belong to, how they relate to each other, what the navigation looks like, and what labels the sections carry.

Wurman, who coined the term in the 1970s, defined information architecture as "the science of the organization of information" [@wurman_InformationArchitects_1997]. Morville and Rosenfeld, in their widely used textbook *Information Architecture for the World Wide Web* (1998, now in its 4th edition as *Information Architecture: For the Web and Beyond*) [@morville_InformationArchitectureWorldWideWeb_2006], expanded the definition to encompass four components:

1. **Organization systems**: how information is categorized and structured (hierarchies, facets, sequences).
2. **Labeling systems**: how categories and links are named — what words are used to represent concepts.
3. **Navigation systems**: how users move through the information (menus, breadcrumbs, links, search).
4. **Search systems**: how users query the information and what results they receive.

These four systems interact. A labeling system that uses unfamiliar jargon breaks navigation even if the underlying organization is sound. A hierarchy that is too deep forces excessive clicking even if every label is clear.

## IA is not neutral

Every organization scheme embeds assumptions about how the world divides up [@bowker_SortingThingsOut_1999]. A library that files Lakota philosophy under "mythology" and German philosophy under "philosophy" is making a claim about whose thought counts as rigorous. A website that organizes health information by medical specialty assumes users know which specialist to consult. A knowledge base that uses English-language categories for multilingual content privileges one language's conceptual structure.

This is a core insight shared with [decolonial pedagogy](../../../../education/disciplines/pedagogy/curricula/decolonial-pedagogy.md): the structures through which knowledge is organized carry [epistemological](../../../../philosophy/terms/epistemology.md) commitments, and those commitments have consequences for who can access and use the knowledge. The categories feel natural to whoever designed them; they may feel arbitrary or exclusionary to others.

Responsible information architecture makes its organizational choices visible and explains them. It acknowledges that other valid arrangements exist. Where possible, it supports multiple paths to the same content — recognizing that different users bring different conceptual frameworks.

## Core concepts

### Hierarchies

A hierarchy organizes content into a tree: broad categories at the top, narrower subcategories below. Hierarchies are familiar (file systems, library classification, organizational charts) and scannable. Their limitation is that any item must be placed in one category, even when it belongs to several.

Strategies for managing this:
- **Cross-references**: place the item in one category and link to it from others.
- **Polyhierarchy**: allow an item to appear in multiple branches of the tree. This increases findability at the cost of structural clarity.
- **[Faceted classification](../terms/faceted-classification.md)**: see below.

### [Faceted classification](../terms/faceted-classification.md)

[Faceted classification](../terms/faceted-classification.md) assigns multiple independent attributes (facets) to each item rather than placing it in a single category. A recipe might be classified by cuisine, dietary restriction, preparation time, and main ingredient — each facet is independent, and users can combine them.

[Ranganathan](../../../../general/people/sr-ranganathan.md) developed [faceted classification](../terms/faceted-classification.md) in the 1930s (the Colon Classification), arguing that rigid hierarchies could not accommodate the cross-cutting nature of real knowledge [@ranganathan_ProlegomenaLibraryClassification_1967]. His work influenced both library science and modern web design.

### [Controlled vocabularies](../terms/controlled-vocabulary.md)

A [controlled vocabulary](../terms/controlled-vocabulary.md) is a curated list of terms used for labeling. It prevents the problem of synonymy (the same concept called by different names in different places) and polysemy (the same word meaning different things in different contexts).

Controlled vocabularies range from simple term lists to full thesauri (with broader/narrower/related term relationships) to formal ontologies (with defined classes, properties, and axioms).

### [Wayfinding](../terms/wayfinding.md) and orientation

[Wayfinding](../terms/wayfinding.md) is the user's ability to determine where they are in the information space, where they can go, and how to get back. Good IA provides orientation cues:

- **Breadcrumbs**: show the path from the top of the hierarchy to the current location.
- **Consistent navigation**: the same navigation appears in the same place on every page.
- **Contextual links**: links within content that indicate related items.
- **Clear labeling**: category names that tell the user what they contain.

[Lynch](../../../../general/people/kevin-lynch.md)'s *The Image of the City* [@lynch_ImageCity_1960] — a study of how people navigate physical environments — introduced concepts (paths, edges, districts, nodes, landmarks) that translate directly to information environments. People need recognizable landmarks and coherent paths in information spaces just as they do in cities.

## IA for the web

The web introduced new IA challenges: hypertext allows non-hierarchical linking; search engines provide direct access to any page (bypassing navigation); users arrive from unpredictable entry points; and content changes continuously.

Key principles for web IA:

- **Every page is a landing page.** Users may arrive at any page from a search engine. Each page must orient the user — who made this, what is it about, where does it fit in the larger site.
- **Multiple paths to content.** Provide navigation, search, and contextual links. Different users will prefer different paths depending on what they already know.
- **Progressive disclosure.** Show the most important information first; let users drill down for detail. Do not front-load complexity.
- **Consistent patterns.** If term entries always have the same structure (definition, examples, related terms), users learn the pattern and can scan efficiently.
