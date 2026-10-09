---
name: "Biomedical Ontologies"
date-created: 2026-03-05
authors:
  - claude
type: concept
aliases:
  - "biomedical ontologies"
  - "biomedical informatics ontologies"
keywords:
  - Ontology
  - InformationArchitecture
  - Biomedicine
references:
  ashburner2000:
    authors: ["Michael Ashburner", "Catherine A. Ball", "Judith A. Blake", "David Botstein", "Heather Butler", "J. Michael Cherry", "Allan P. Davis", "Kara Dolinski", "Selina S. Dwight", "Janan T. Eppig", "Midori A. Harris", "David P. Hill", "Laurie Issel-Tarver", "Andrew Kasarskis", "Suzanna Lewis", "John C. Matese", "Joel E. Richardson", "Martin Ringwald", "Gerald M. Rubin", "Gavin Sherlock"]
    title: "Gene Ontology: Tool for the Unification of Biology"
    publication: "Nature Genetics"
    year: 2000
    volume: 25
    issue: 1
    pages: "25-29"
  smith2007:
    authors: ["Barry Smith", "Michael Ashburner", "Cornelius Rosse", "Jonathan Bard", "William Bug", "Werner Ceusters", "Louis J. Goldberg", "Karen Eilbeck", "Amelia Ireland", "Christopher J. Mungall", "The OBI Consortium", "Neocles Leontis", "Philippe Rocca-Serra", "Alan Ruttenberg", "Susanna-Assunta Sansone", "Richard H. Scheuermann", "Nigam Shah", "Patricia L. Whetzel", "Suzanna Lewis"]
    title: "The OBO Foundry: Coordinated Evolution of Ontologies to Support Biomedical Data Integration"
    publication: "Nature Biotechnology"
    year: 2007
    volume: 25
    issue: 11
    pages: "1251-1255"
  rector2003:
    authors: ["Alan L. Rector"]
    title: "Modularisation of Domain Ontologies Implemented in Description Logics and Related Formalisms Including OWL"
    publication: "Proceedings of the 2nd International Conference on Knowledge Capture"
    year: 2003
    pages: "121-128"
  gruber1993:
    authors: ["Thomas R. Gruber"]
    title: "A Translation Approach to Portable Ontology Specifications"
    publication: "Knowledge Acquisition"
    year: 1993
    volume: 5
    issue: 2
    pages: "199-220"
  bowkerstar1999:
    authors: ["Geoffrey C. Bowker", "Susan Leigh Star"]
    title: "Sorting Things Out: Classification and Its Consequences"
    publication: "MIT Press"
    year: 1999
introduces: concept
tags:
  - ontology
  - information-architecture
  - biomedicine
description: Biomedical ontologies are formal classification systems that organize biological and medical knowledge into machine-processable structures. They are among the most successful applications of the Semantic Web's core technologies — and they succeed precisely because their domain warrants the rigidity those technologies impose.
---

Biomedical ontologies are formal classification systems that organize biological and medical knowledge into machine-processable structures. They are among the most successful applications of the Semantic Web's core technologies — and they succeed precisely because their domain warrants the rigidity those technologies impose.

The Gene Ontology (GO), launched in 1998 and described by Ashburner et al. in 2000, is the paradigmatic case [@ashburner2000]. GO provides a controlled vocabulary for describing gene products across species: their molecular functions, the biological processes they participate in, and the cellular components where they are active. When a researcher in Tokyo annotates a mouse gene with a GO term and a researcher in Toronto queries for human genes with the same annotation, the term means the same thing in both contexts. That semantic stability enables cross-species comparison, large-scale data integration, and automated inference at a scale that informal vocabularies cannot support.

SNOMED CT (Systematized Nomenclature of Medicine — Clinical Terms) performs a similar function for clinical medicine. It provides a structured vocabulary for recording clinical data — diagnoses, procedures, findings, substances — so that records from different institutions can be aggregated and queried. ICD (International Classification of Diseases) classifies causes of death and disease for epidemiological tracking. Each system makes different trade-offs between expressiveness and tractability, but all share a commitment to crisp typing: a term either applies or it does not, and the classification hierarchy determines what inferences follow.

The OBO Foundry (Open Biomedical Ontologies), described by Barry Smith et al. in 2007, coordinates the development of biomedical ontologies to reduce redundancy and promote interoperability [@smith2007]. Its principles include modular design, clear scope boundaries, and consistent use of upper-level ontological categories. The result is a family of ontologies that can be composed: GO for gene function, ChEBI for chemical entities, DOID for diseases, each maintaining its own domain while linking to the others through shared structural conventions.

These systems work. They enable researchers to find, compare, and integrate data across institutional and disciplinary boundaries. The question is why they work when so many other applications of formal ontology — the Semantic Web's vision of a global knowledge graph, FOAF's attempt to formalize social relationships — did not achieve comparable adoption.

The answer has to do with domain fit. Thomas Gruber defined an ontology as "an explicit specification of a conceptualization" [@gruber1993]. The biomedical domain rewards explicit specification because the cost of ambiguity is measurable: a drug interaction inference based on ambiguous classification can harm patients. The pressure for disambiguation is not theoretical; it comes from clinical practice, regulatory requirements, and the scale of the data being integrated. In Ashby's terms, the domain's [requisite variety](../../../../services/cybernetics-services-section/content/text/glossary/terms/requisite-variety.md) is high enough to justify the investment in formal structure, and the consequences of insufficient structure are severe enough to motivate adoption.

This is the condition under which rigidity is appropriate. A biomedical ontology should have stiff joints — crisp types, monotonic reasoning, stable identifiers — because the alternative is clinical ambiguity. The problem that Geoffrey Bowker and Susan Leigh Star identified is not that classification systems exist but that they present contingent choices as inevitable infrastructure [@bowkerstar1999]. In biomedicine, the choices are less contingent than in most domains. A gene either encodes a protein with a particular molecular function or it does not. The classification tracks something real, even if the boundaries are debatable at the edges.

But the success of biomedical ontologies does not validate the generalization of their approach to all knowledge. The Gene Ontology works because molecular biology has a structure that tolerates formal classification. Social relationships, cultural meaning, and situated knowledge do not have this structure. Extending the GO model to these domains produces systems that are technically functional and semantically misleading — systems whose [Qi](../../../../../natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/services/traditional-chinese-medicine-services-section/content/text/glossary/terms/qi.md) circulates (data flows, queries return results) but whose engagement with the phenomena has become detached from the phenomena themselves.

Biomedical ontologies are, in this sense, the evidence that stiff joints have legitimate uses. The diagnostic question is not whether formal ontologies work but where they work — which domains have the structure to support rigid classification and which domains are deformed by it.

## Related

- [Requisite variety](../../../../services/cybernetics-services-section/content/text/glossary/terms/requisite-variety.md) — the constraint that justifies formal structure in high-stakes domains
- [Autopoiesis](../../../../services/cybernetics-services-section/content/text/glossary/terms/autopoiesis.md) — self-producing organization as a counterpoint to imposed classification
- [Structural coupling](../../../../services/cybernetics-services-section/content/text/glossary/terms/structural-coupling.md) — why schemas developed in one domain resist transplantation
