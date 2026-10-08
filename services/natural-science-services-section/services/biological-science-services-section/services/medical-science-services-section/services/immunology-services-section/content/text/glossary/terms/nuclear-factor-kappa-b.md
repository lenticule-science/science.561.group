---
aliases:
  - NF-κB
  - NF-kB
  - nuclear factor kappa-light-chain-enhancer of activated B cells
description: The inducible transcription factor family that converts inflammatory, infectious, and stress signals into transcription of pro-inflammatory genes, and the node the ligand-bound glucocorticoid receptor transrepresses to terminate an inflammatory episode.
identity: nuclear-factor-kappa-b
name: Nuclear factor kappa B
date-created: 2026-09-02
provenance:
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/biochemistry-services-section/content/text/documents/articles/notes/2026/08/26/2026-08-26-note-on-the-cytokine-transcriptomic-machinery-of-social-standing.md
references:
  hayden2008:
    authors:
      - Matthew S. Hayden
      - Sankar Ghosh
    title: Shared Principles in NF-κB Signaling
    year: 2008
    publication: Cell
    doi: 10.1016/j.cell.2008.01.020
    note: PMID 18267068; resolved against CrossRef and PubMed 2026-09-02
  liu2017:
    authors:
      - Ting Liu
      - Lingyun Zhang
      - Donghyun Joo
      - Shao-Cong Sun
    title: NF-κB signaling in inflammation
    year: 2017
    publication: Signal Transduction and Targeted Therapy
    doi: 10.1038/sigtrans.2017.23
    note: PMID 29158945; resolved against CrossRef and PubMed 2026-09-02
  debosscher2003:
    authors:
      - Karolien De Bosscher
      - Wim Vanden Berghe
      - Guy Haegeman
    title: "The Interplay between the Glucocorticoid Receptor and Nuclear Factor-κB or Activator Protein-1: Molecular Mechanisms for Gene Repression"
    year: 2003
    publication: Endocrine Reviews
    doi: 10.1210/er.2002-0006
    note: PMID 12920152; resolved against CrossRef and PubMed 2026-09-02
  morgan2010:
    authors:
      - Michael J. Morgan
      - Zheng-gang Liu
    title: Crosstalk of reactive oxygen species and NF-κB signaling
    year: 2010
    publication: Cell Research
    doi: 10.1038/cr.2010.178
    note: PMID 21187859; resolved against CrossRef and PubMed 2026-09-02
  miller2008:
    authors:
      - Gregory E. Miller
      - Edith Chen
      - Jasmen Sze
      - Teresa Marin
      - Jesusa M. G. Arevalo
      - Richard Doll
      - Roy Ma
      - Steve W. Cole
    title: "A Functional Genomic Fingerprint of Chronic Stress in Humans: Blunted Glucocorticoid and Increased NF-κB Signaling"
    year: 2008
    publication: Biological Psychiatry
    doi: 10.1016/j.biopsych.2008.03.017
    note: PMID 18440494; resolved against CrossRef and PubMed 2026-09-02
relations:
  delivers:
    - interleukin-6
    - tumor-necrosis-factor-alpha
    - interleukin-1-beta
  controlled-by: glucocorticoid-receptor
  produced-by: reactive-oxygen-species
---
Nuclear factor kappa B is a family of inducible transcription factors, held inactive in the cytoplasm by IκB proteins until a stimulus triggers IκB degradation, whereupon the released dimers enter the nucleus and drive transcription of pro-inflammatory genes. The canonical pathway is activated by pathogen-associated molecules, by tumour necrosis factor and interleukin-1 signalling, and by cellular stress, and its targets include the genes for interleukin-6, tumour necrosis factor alpha, and interleukin-1 beta themselves — a feed-forward arrangement in which the factor's own products re-activate it [hayden2008; liu2017]. **Established**: the pathway's components, its activation logic, and its principal target genes are textbook molecular immunology.

It is a transcription factor, not a cytokine: it does not itself signal between cells but decides which inflammatory messengers a cell will make, which is why a cell can carry a normal cytokine level while its transcriptional program is already committed. The distinction matters for measurement — a serum panel reads the products, while a leukocyte transcriptome reads the program, and the two can disagree.

Two relations asserted on this carrier are sourced here. The factor **delivers** interleukin-6, tumour necrosis factor alpha, and interleukin-1 beta: these are canonical target genes of the pathway [hayden2008; liu2017] (**established**). It is **controlled by** the glucocorticoid receptor, which represses its transcriptional output by tethering, coactivator competition, and induction of IκBα [debosscher2003] (**established as a molecular mechanism**). It is **produced by** reactive oxygen species in the specific sense that oxidants activate the pathway, a crosstalk reviewed with its contradictions intact — reactive oxygen species both activate and, in some settings, inhibit the pathway depending on species, site, and cell type [morgan2010] (**well-supported, context-dependent**).

Because the glucocorticoid receptor terminates an inflammatory episode largely by repressing this factor's transcriptional output, a failure of that repression and a failure of cortisol production produce the same downstream picture and can only be told apart by functional testing. Miller and colleagues found precisely this dissociation in chronic caregivers: heightened transcription of factor-associated genes alongside diminished glucocorticoid-response-element transcription, with ambulatory cortisol output normal [miller2008] (**single well-characterized cohort, replicated in shape by later work**).
