---
aliases:
  - GR
  - NR3C1
description: The ligand-activated nuclear receptor through which cortisol acts, working both by binding glucocorticoid-response elements to induce transcription and by protein-protein repression of NF-κB and AP-1 — two mechanisms that can fail separately.
identity: glucocorticoid-receptor
name: Glucocorticoid receptor
date-created: 2026-09-02
provenance:
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
references:
  oakley2013:
    authors:
      - Robert H. Oakley
      - John A. Cidlowski
    title: "The biology of the glucocorticoid receptor: New signaling mechanisms in health and disease"
    year: 2013
    publication: Journal of Allergy and Clinical Immunology
    doi: 10.1016/j.jaci.2013.09.007
    note: PMID 24084075; resolved against CrossRef and PubMed 2026-09-02
  kadmiel2013:
    authors:
      - Mahita Kadmiel
      - John A. Cidlowski
    title: Glucocorticoid receptor signaling in health and disease
    year: 2013
    publication: Trends in Pharmacological Sciences
    doi: 10.1016/j.tips.2013.07.003
    note: PMID 23953592; resolved against CrossRef and PubMed 2026-09-02
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
  cohen2012:
    authors:
      - Sheldon Cohen
      - Denise Janicki-Deverts
      - William J. Doyle
      - Gregory E. Miller
      - Ellen Frank
      - Bruce S. Rabin
      - Ronald B. Turner
    title: Chronic stress, glucocorticoid receptor resistance, inflammation, and disease risk
    year: 2012
    publication: Proceedings of the National Academy of Sciences
    doi: 10.1073/pnas.1118355109
    note: PMID 22474371; resolved against CrossRef and PubMed 2026-09-02
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
  instance-of: receptor
  requires: cortisol
  transrepresses: nuclear-factor-kappa-b
  contrasts-with: glucocorticoid-resistance
---
The glucocorticoid receptor is a ligand-activated nuclear receptor that, on binding cortisol, translocates to the nucleus and both induces transcription at glucocorticoid-response elements and represses inflammatory transcription by protein-protein interaction with other factors [oakley2013; kadmiel2013]. The **requires** relation to cortisol names that ligand dependence.

Its two modes are separable: transactivation through DNA binding and transrepression through tethering to NF-κB and AP-1 use different receptor surfaces, so a signalling defect can remove the anti-inflammatory brake while leaving metabolic gene induction intact. De Bosscher, Vanden Berghe and Haegeman's review sets out the repression mechanisms in detail [debosscher2003], which is the **transrepresses** relation asserted here (**established as a molecular mechanism**).

Human evidence that this brake fails under chronic stress while hormone output stays normal comes from two well-characterized cohorts: Miller and colleagues' monocyte transcriptome study of chronic caregivers, and Cohen and colleagues' viral-challenge study relating receptor insensitivity to inflammatory response and cold susceptibility [miller2008; cohen2012]. **Well-supported in these cohorts, and the receptor-level failure remains distinct from reduced hormone production** — the distinction this house's glucocorticoid-resistance term carries, and the reason the **contrasts-with** relation is asserted.

A circulating cortisol level therefore says nothing about whether the brake works, and distinguishing insufficient hormone from insufficient receptor response requires a functional assay rather than a concentration.
