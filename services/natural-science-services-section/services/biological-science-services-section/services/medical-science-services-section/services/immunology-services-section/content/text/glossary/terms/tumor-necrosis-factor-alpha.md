---
aliases:
  - TNF-α
  - TNF-alpha
  - TNF
description: A cytokine produced chiefly by activated macrophages that both drives inflammatory transcription through NF-κB and directly impairs mitochondrial oxidative capacity, existing in distinct membrane-bound and soluble forms with different receptor preferences.
identity: tumor-necrosis-factor-alpha
name: Tumor necrosis factor alpha
provenance:
  date-created: 2026-09-02
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
references:
  kalliolias2015:
    authors:
      - George D. Kalliolias
      - Lionel B. Ivashkiv
    title: TNF biology, pathogenic mechanisms and emerging therapeutic strategies
    year: 2015
    publication: Nature Reviews Rheumatology
    doi: 10.1038/nrrheum.2015.169
    note: PMID 26656660; resolved against CrossRef and PubMed 2026-09-02
  hayden2008:
    authors:
      - Matthew S. Hayden
      - Sankar Ghosh
    title: Shared Principles in NF-κB Signaling
    year: 2008
    publication: Cell
    doi: 10.1016/j.cell.2008.01.020
    note: PMID 18267068; resolved against CrossRef and PubMed 2026-09-02
  zell1997:
    authors:
      - R. Zell
      - P. Geck
      - K. Werdan
      - P. Boekstegers
    title: "TNF-alpha and IL-1 alpha inhibit both pyruvate dehydrogenase activity and mitochondrial function in cardiomyocytes: evidence for primary impairment of mitochondrial function"
    year: 1997
    publication: Molecular and Cellular Biochemistry
    doi: 10.1023/a:1006896832582
    note: PMID 9450646; resolved against PubMed 2026-09-02
relations:
  produced-by: nuclear-factor-kappa-b
  impairs: oxidative-phosphorylation
  acts-through: receptor
  instance-of: cytokine
---
Tumor necrosis factor alpha is a cytokine produced chiefly by activated macrophages that signals through two receptors to drive inflammatory gene transcription, cell survival, or programmed cell death depending on receptor and context [kalliolias2015]. Its own gene is an NF-κB target and its signalling activates that pathway in turn [hayden2008], which is the **produced-by** relation asserted here (**established**).

Unlike the interleukins it is synthesized as a membrane-bound precursor cleaved to a soluble form, and the two forms preferentially engage different receptors, so the same molecule delivers different signals depending on whether it acts at a cell contact or at a distance [kalliolias2015]. **Established.**

The **impairs** relation to oxidative phosphorylation is sourced in Zell and colleagues' cardiomyocyte work, which found this cytokine together with interleukin-1 alpha inhibiting both pyruvate dehydrogenase activity and mitochondrial function, and argued the mitochondrial impairment was primary rather than secondary to the enzyme block [zell1997]. **Single in-vitro study in cardiomyocytes**: the direction is consistent with a wider literature on cytokine-induced mitochondrial dysfunction, but this specific pairing of enzyme and organelle impairment rests on that work and has not been reproduced in human tissue under this paradigm's conditions.

Because this cytokine impairs mitochondrial respiration directly as well as amplifying inflammatory transcription, an inflammatory episode that is not terminated imposes a metabolic cost that outlasts the signalling itself.
