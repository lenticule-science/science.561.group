---
title: "Note on browsing the corpus by relations, not paths"
description: "The Leader's theory of how the Group's knowledge corpus is meant to be read: deep nesting by proof path is necessary and incoherence is the defect; the corpus is browsed by typed relations, not by file paths; wikilinks resolve; notes point to terms; research papers carry references and not links; glossary entries are typed (objects are terms, theorems and concepts are concepts); and renamed concepts stay findable under their old names."
date-created: 2026-10-10
type: note
name: 2026-10-10-note-on-browsing-the-corpus-by-relations
authors:
  - emsenn
  - claude
status: active
keywords: ["wikilink", "typed-edge", "knowledge-graph", "glossary-entry-type", "proof-path", "yoneda", "chl", "l-space", "citation"]
provenance:
  office: Lenticule Science Senior
  request: debt-2026-10-09-leader-words-held-in-corpus
  pass: obsmetrologia-math
  leader-utterances:
    - "ni:///sha-256;-2a4cZpRa-z-engnIvTy0pHo1A5p5ct2xSgdYaCUaCQ"
    - "ni:///sha-256;oNdoHcyJVhsZk-L0W9ujAeM5dipW38cafQeZ6pCWPhE"
    - "ni:///sha-256;Cfoda0p2scRSRKEikQC75wvKEMApUjhBjErEJazj6UU"
    - "ni:///sha-256;F0QpJQC4J53g-S8hziCYqiMPb6AC3kXE9HO90NQrf2A"
    - "ni:///sha-256;WK_xvj7f2db-snIePTmeNVVK_qfs7Vpj0WySnTz9sKc"
    - "ni:///sha-256;6LyW55mf8UaCSE_M2lCyP4mck0V1BNGhFmAMyYXu9GY"
    - "ni:///sha-256;qu7zuLOR-eycO-uNR0f2IdnU1GxEYbBsEIbVyqQSqUk"
    - "ni:///sha-256;_LIcBhRW_B0oyUMILrszUcK12_dmYLUu6D4pfZypims"
---

## What the Leader holds

**Depth is not the problem.** The deeply nested directories are necessary. CHL proof pathing explains why, and directionality by Yoneda embedding fixes which way a path runs (2026-09-21, 2026-09-22). The defect is that agents organized material within that method incoherently, so that nothing sits where the rules put it. The rule is to put a thing under the directory that is the thing it is. How to organize files under directories is itself one of the Group's research projects (2026-09-22). Once the knowledge is visible enough to query, a confusion can be clarified once and stay clear (2026-09-21).

**The real problem is that the corpus is browsed by file paths and not by relations** (2026-09-24). About 28,000 notes, AI-written, is not too many for a knowledge base. What is missing is typed-edge graph tooling over them, which is absurd given how much of the Group's research is on exactly that (2026-09-24).

**The content rules are meant to make content readable:**

- Content uses `[[wikilinks]]`, and they resolve. Today nothing resolves them (2026-09-24).
- **Notes point to terms.** A note links the glossary terms it uses (2026-09-24).
- **Research papers do not carry links.** They carry references and citations (2026-09-24).
- `[[semiotic cell]]` in any note reaches the one correct term. All references to a term can be found, and a concept that was renamed can still be followed under its old names: semiotic cells were once "closure cells", and their tools under that name stay findable (2026-09-25).

**Glossary entries are typed.** Objects are terms, theorems are concepts, and concepts are concepts. Most of the other kinds agents flattened into one are types of glossary entry and should be restored as such (2026-09-24).

**Theory is wider than Obsmetrologia.** The house holds substantial research on knowledge, intelligence and research methods. Agents learn those topics through L-Space, the knowledge hub of Lenticule Science, and do not treat Obsmetrologia as the only theory (2026-09-24).

**The corpus has been damaged by incremental revision.** Agents revising definitions note by note left about a thousand notes that each define one facet of a concept poorly (2026-09-25). The Leader's own work in such sessions is cleaning up notes and terms. When several versions of one concept exist, such as negation, the session studies the version the house actually proved and makes that the term (2026-09-26).

**The house's things are found at their homes.** The Lean is at the obsmetrological services section, and the house's tools exist. A session that cannot find them shows that the corpus is not navigable, and that is the defect to fix (2026-10-08).

## What the house already holds

- [The corpus knowledge graph program](../../09/30/2026-09-30-the-corpus-knowledge-graph-program.md) aims at one admitted, linked, cited, dereferenceable and searchable knowledge graph.
- The engineering content-validation note requires every wikilink and Markdown link to resolve.
- The 2026-05-21 SpotComp note states the apex rule: every directory is the characteristic morphism of its subtree, "uniquely determined by Yoneda and CHL".

## External knowledge

Typed links over notes are an old idea. Ted Nelson's Xanadu and the 1980s hypertext systems (NoteCards, Intermedia) had typed links. The Semantic Web's RDF and SKOS put the edge type first. SKOS separates `broader`/`narrower`/`related` among concepts from the labels a concept carries, which is the mechanism by which a renamed concept keeps its old labels as `skos:hiddenLabel` or `altLabel`. Scholarly practice already follows the "papers cite, notes link" split: a paper's references are a bibliography resolved by identifier (DOI, citation key), not inline hyperlinks.

## Open

- The edge vocabulary: which typed relations a note-to-term link carries (uses, defines, refutes, extends), and where the house records it.
- How a glossary entry's type (term, concept, theorem, object) maps onto the 521 math terms, which today mix definition, concept, morphism, page, relation, axiom and term.

The requirement this note grounds is [`corpus-browsed-by-typed-relations.json`](../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-knowledge-systems-services-section/content/requirements/corpus-browsed-by-typed-relations.json).
