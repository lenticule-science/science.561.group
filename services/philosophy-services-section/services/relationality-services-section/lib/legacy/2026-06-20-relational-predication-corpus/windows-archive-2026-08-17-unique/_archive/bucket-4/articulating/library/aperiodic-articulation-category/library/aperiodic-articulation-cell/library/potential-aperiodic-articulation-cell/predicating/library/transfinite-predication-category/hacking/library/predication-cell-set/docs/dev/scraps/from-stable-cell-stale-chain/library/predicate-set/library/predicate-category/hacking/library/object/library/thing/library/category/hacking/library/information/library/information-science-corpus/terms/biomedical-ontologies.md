---
title: Biomedical Ontologies
description: "Biomedical ontologies are formal classification systems that organize biological and medical knowledge into machine-processable structures. They are among the most successful applications of the Semantic Web's core technologies — and they succeed precisely because their domain warrants the rigidity those technologies impose."
date-created: 2026-03-05
introduces: concept
aliases:
- biomedical ontologies
- biomedical informatics ontologies
tags:
- ontology
- information-architecture
- biomedicine
references:
  - id: ashburner2000
    type: article-journal
    title: Gene Ontology: Tool for the Unification of Biology
    volume: 25
    issue: 1
    author:
      - literal: Michael Ashburner
      - literal: Catherine A. Ball
      - literal: Judith A. Blake
      - literal: David Botstein
      - literal: Heather Butler
      - literal: J. Michael Cherry
      - literal: Allan P. Davis
      - literal: Kara Dolinski
      - literal: Selina S. Dwight
      - literal: Janan T. Eppig
      - literal: Midori A. Harris
      - literal: David P. Hill
      - literal: Laurie Issel-Tarver
      - literal: Andrew Kasarskis
      - literal: Suzanna Lewis
      - literal: John C. Matese
      - literal: Joel E. Richardson
      - literal: Martin Ringwald
      - literal: Gerald M. Rubin
      - literal: Gavin Sherlock
    container-title: Nature Genetics
    page: 25-29
    issued:
      - year: 2000
  - id: smith2007
    type: article-journal
    title: The OBO Foundry: Coordinated Evolution of Ontologies to Support Biomedical Data Integration
    volume: 25
    issue: 11
    author:
      - literal: Barry Smith
      - literal: Michael Ashburner
      - literal: Cornelius Rosse
      - literal: Jonathan Bard
      - literal: William Bug
      - literal: Werner Ceusters
      - literal: Louis J. Goldberg
      - literal: Karen Eilbeck
      - literal: Amelia Ireland
      - literal: Christopher J. Mungall
      - literal: The OBI Consortium
      - literal: Neocles Leontis
      - literal: Philippe Rocca-Serra
      - literal: Alan Ruttenberg
      - literal: Susanna-Assunta Sansone
      - literal: Richard H. Scheuermann
      - literal: Nigam Shah
      - literal: Patricia L. Whetzel
      - literal: Suzanna Lewis
    container-title: Nature Biotechnology
    page: 1251-1255
    issued:
      - year: 2007
  - id: gruber1993
    type: article-journal
    title: A Translation Approach to Portable Ontology Specifications
    volume: 5
    issue: 2
    author:
      - literal: Thomas R. Gruber
    container-title: Knowledge Acquisition
    page: 199-220
    issued:
      - year: 1993
  - id: bowkerstar1999
    type: document
    title: Sorting Things Out: Classification and Its Consequences
    author:
      - literal: Geoffrey C. Bowker
      - literal: Susan Leigh Star
    container-title: MIT Press
    issued:
      - year: 1999
  - id: rector2003
    type: document
    title: Modularisation of Domain Ontologies Implemented in Description Logics and Related Formalisms Including OWL
    author:
      - literal: Alan L. Rector
    container-title: Proceedings of the 2nd International Conference on Knowledge Capture
    page: 121-128
    issued:
      - year: 2003
---

Biomedical ontologies are formal classification systems that organize biological and medical knowledge into machine-processable structures. They are among the most successful applications of the Semantic Web's core technologies — and they succeed precisely because their domain warrants the rigidity those technologies impose.

The Gene Ontology (GO), launched in 1998 and described by Ashburner et al. in 2000, is the paradigmatic case [@ashburner2000]. GO provides a controlled vocabulary for describing gene products across species: their molecular functions, the biological processes they participate in, and the cellular components where they are active. When a researcher in Tokyo annotates a mouse gene with a GO term and a researcher in Toronto queries for human genes with the same annotation, the term means the same thing in both contexts. That semantic stability enables cross-species comparison, large-scale data integration, and automated inference at a scale that informal vocabularies cannot support.

SNOMED CT (Systematized Nomenclature of Medicine — Clinical Terms) performs a similar function for clinical medicine. It provides a structured vocabulary for recording clinical data — diagnoses, procedures, findings, substances — so that records from different institutions can be aggregated and queried. ICD (International Classification of Diseases) classifies causes of death and disease for epidemiological tracking. Each system makes different trade-offs between expressiveness and tractability, but all share a commitment to crisp typing: a term either applies or it does not, and the classification hierarchy determines what inferences follow.

The OBO Foundry (Open Biomedical Ontologies), described by Barry Smith et al. in 2007, coordinates the development of biomedical ontologies to reduce redundancy and promote interoperability [@smith2007]. Its principles include modular design, clear scope boundaries, and consistent use of upper-level ontological categories. The result is a family of ontologies that can be composed: GO for gene function, ChEBI for chemical entities, DOID for diseases, each maintaining its own domain while linking to the others through shared structural conventions.

These systems work. They enable researchers to find, compare, and integrate data across institutional and disciplinary boundaries. The question is why they work when so many other applications of formal ontology — the Semantic Web's vision of a global knowledge graph, FOAF's attempt to formalize social relationships — did not achieve comparable adoption.

The answer has to do with domain fit. Thomas Gruber defined an ontology as "an explicit specification of a conceptualization" [@gruber1993]. The biomedical domain rewards explicit specification because the cost of ambiguity is measurable: a drug interaction inference based on ambiguous classification can harm patients. The pressure for disambiguation is not theoretical; it comes from clinical practice, regulatory requirements, and the scale of the data being integrated. In Ashby's terms, the domain's [requisite variety](../theories/cybernetics/terms/requisite-variety.md) is high enough to justify the investment in formal structure, and the consequences of insufficient structure are severe enough to motivate adoption.

This is the condition under which rigidity is appropriate. A biomedical ontology should have stiff joints — crisp types, monotonic reasoning, stable identifiers — because the alternative is clinical ambiguity. The problem that Geoffrey Bowker and Susan Leigh Star identified is not that classification systems exist but that they present contingent choices as inevitable infrastructure [@bowkerstar1999]. In biomedicine, the choices are less contingent than in most domains. A gene either encodes a protein with a particular molecular function or it does not. The classification tracks something real, even if the boundaries are debatable at the edges.

But the success of biomedical ontologies does not validate the generalization of their approach to all knowledge. The Gene Ontology works because molecular biology has a structure that tolerates formal classification. Social relationships, cultural meaning, and situated knowledge do not have this structure. Extending the GO model to these domains produces systems that are technically functional and semantically misleading — systems whose [Qi](../../medicine/theories/traditional-chinese-medicine/terms/qi.md) circulates (data flows, queries return results) but whose engagement with the phenomena has become detached from the phenomena themselves.

Biomedical ontologies are, in this sense, the evidence that stiff joints have legitimate uses. The diagnostic question is not whether formal ontologies work but where they work — which domains have the structure to support rigid classification and which domains are deformed by it.