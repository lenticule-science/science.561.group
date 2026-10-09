---
aliases:
  - IL-1β
  - IL-1beta
description: The inflammasome-processed member of the interleukin-1 family, synthesized as an inactive precursor and requiring caspase-1 cleavage before release, making its activity gated by a second signal rather than by transcription alone.
identity: interleukin-1-beta
name: Interleukin-1 beta
date-created: 2026-09-02
provenance:
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
references:
  dinarello2009:
    authors:
      - Charles A. Dinarello
    title: Immunological and Inflammatory Functions of the Interleukin-1 Family
    year: 2009
    publication: Annual Review of Immunology
    doi: 10.1146/annurev.immunol.021908.132612
    note: PMID 19302047; resolved against CrossRef and PubMed 2026-09-02
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
Interleukin-1 beta is a member of the interleukin-1 family synthesized as an inactive precursor whose release requires inflammasome assembly and caspase-1 cleavage, after which it acts on the type I interleukin-1 receptor to induce fever, hyperalgesia, and further inflammatory transcription [dinarello2009]. Transcription of the precursor is NF-κB-dependent [hayden2008; dinarello2009], the **produced-by** relation asserted here (**established**).

Its activity is gated at two steps rather than one — transcription of the precursor and then proteolytic activation — which distinguishes it from cytokines released as soon as they are transcribed and means precursor abundance does not predict activity. **Established**: the two-signal requirement is the organizing fact of the interleukin-1 literature.

The **impairs** relation to oxidative phosphorylation is sourced in Zell and colleagues, whose cardiomyocyte experiments used interleukin-1 alpha alongside tumour necrosis factor alpha and found inhibition of both pyruvate dehydrogenase activity and mitochondrial function [zell1997]. **Single in-vitro study, and with the family member alpha rather than beta**: the extension to interleukin-1 beta is inference from shared receptor signalling, not a result reported in that work.

Measuring this cytokine in serum therefore underestimates the local inflammatory state, because the biologically decisive step happens in tissue and the mature protein is short-lived in circulation.
