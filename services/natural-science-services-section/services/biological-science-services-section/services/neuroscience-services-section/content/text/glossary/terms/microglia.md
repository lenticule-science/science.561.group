---
aliases:
  - microglial cell
description: The brain's resident macrophage population, derived from yolk-sac progenitors rather than bone marrow, continuously surveying the parenchyma with motile processes and releasing inflammatory cytokines when activated.
identity: microglia
name: Microglia
date-created: 2026-09-02
provenance:
  sources:
    - lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/content/text/documents/articles/notes/2026/09/02/2026-09-02-note-on-the-biochemical-manifold-coordinate-system.md
references:
  prinz2019:
    authors:
      - Marco Prinz
      - Steffen Jung
      - Josef Priller
    title: "Microglia Biology: One Century of Evolving Concepts"
    year: 2019
    publication: Cell
    doi: 10.1016/j.cell.2019.08.053
    note: PMID 31585077; resolved against CrossRef and PubMed 2026-09-02
  nimmerjahn2005:
    authors:
      - Axel Nimmerjahn
      - Frank Kirchhoff
      - Fritjof Helmchen
    title: Resting Microglial Cells Are Highly Dynamic Surveillants of Brain Parenchyma in Vivo
    year: 2005
    publication: Science
    doi: 10.1126/science.1110647
    note: PMID 15831717; resolved against CrossRef and PubMed 2026-09-02
  nakatomi2014:
    authors:
      - Yasuhito Nakatomi
      - Kei Mizuno
      - Akira Ishii
      - Yasuhiro Wada
      - Masaaki Tanaka
      - Shusaku Tazawa
      - Kayo Onoe
      - Sanae Fukuda
      - Joji Kawabe
      - Karin Takahashi
      - Yosky Kataoka
      - Susumu Shiomi
      - Kouzi Yamaguti
      - Masaaki Inaba
      - Hirohiko Kuratsune
      - Yasuyoshi Watanabe
    title: "Neuroinflammation in Patients with Chronic Fatigue Syndrome/Myalgic Encephalomyelitis: An 11C-(R)-PK11195 PET Study"
    year: 2014
    publication: Journal of Nuclear Medicine
    doi: 10.2967/jnumed.113.131045
    note: PMID 24665088; resolved against CrossRef and PubMed 2026-09-02
relations:
  delivers:
    - interleukin-1-beta
    - tumor-necrosis-factor-alpha
    - interleukin-6
  instance-of: cell
  distinguished-from: microglial-priming
---
Microglia are the resident macrophages of the central nervous system, seeded from yolk-sac progenitors during development and maintained locally rather than replenished from bone marrow, and they are the brain's principal innate immune effector [prinz2019]. Nimmerjahn, Kirchhoff and Helmchen's in-vivo imaging established that the resting state is not quiescent: processes extend and retract continuously, surveying the whole parenchyma over hours [nimmerjahn2005]. **Established.**

They differ from infiltrating monocytes by origin and by self-renewal within the brain, which is why a brain inflammatory response can proceed with no recruitment from the circulation at all [prinz2019]. **Established.**

The **delivers** relation to interleukin-1 beta, tumour necrosis factor alpha, and interleukin-6 names the cytokines these cells release on activation [prinz2019] (**established**). The **distinguished-from** relation to microglial priming marks that a primed cell is not an activated one: priming is a sensitized state in which an ordinary later stimulus produces an exaggerated response.

Because their activation state is inferred rather than measured directly in living people, imaging claims about neuroinflammation rest on ligand binding whose specificity is contested, and should be reported as inference from a proxy. The load-bearing study in the infection-associated chronic illness literature is Nakatomi and colleagues' translocator-protein PET study of nine patients against ten controls [nakatomi2014] — **a single small study, not independently replicated, using a method whose biological specificity is disputed in the wider neuroimaging literature.**
