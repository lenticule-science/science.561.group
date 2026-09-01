---
title: "Mathematical Frontier of Black Holes"
subtitle: "Horizon geometry, causal structure, entropy, and information"
author:
  - "OpenAI ChatGPT research memo for emsenn"
date: "2026-06-27"
abstract: >
  A graduate-to-research-level survey of black-hole mathematics as the regime in which matter description gives way to Lorentzian causal geometry, horizon structure, thermodynamics, quantum information, and nonlinear spacetime dynamics. The memo separates proved classical and PDE results from numerical evidence, observational constraints, semiclassical frameworks, holographic conjectures, and open quantum-gravity problems.
keywords:
  - black holes
  - Lorentzian geometry
  - horizons
  - causal structure
  - singularity theorems
  - Kerr stability
  - cosmic censorship
  - numerical relativity
  - black-hole thermodynamics
  - holography
  - quantum information
  - Page curve
  - gravitational collapse
nocite: |
  @*
references:
  - id: penrose1965
    type: article-journal
    author:
      - family: Penrose
        given: Roger
    issued:
      date-parts:
        - [1965]
    title: "Gravitational Collapse and Space-Time Singularities"
    container-title: "Physical Review Letters"
    volume: "14"
    issue: "3"
    page: "57-59"
    DOI: "10.1103/PhysRevLett.14.57"
    URL: "https://doi.org/10.1103/PhysRevLett.14.57"

  - id: hawking_ellis1973
    type: book
    author:
      - family: Hawking
        given: Stephen W.
      - family: Ellis
        given: George F. R.
    issued:
      date-parts:
        - [1973]
    title: "The Large Scale Structure of Space-Time"
    publisher: "Cambridge University Press"
    URL: "https://www.cambridge.org/core/books/large-scale-structure-of-spacetime/573100C3129CB069B2488A40D562E2A9"

  - id: landsman2022
    type: article
    author:
      - family: Landsman
        given: Klaas
    issued:
      date-parts:
        - [2022]
    title: "Penrose's 1965 singularity theorem: From geodesic incompleteness to cosmic censorship"
    URL: "https://arxiv.org/abs/2205.01680"
    note: "arXiv:2205.01680"

  - id: wald1997
    type: article
    author:
      - family: Wald
        given: Robert M.
    issued:
      date-parts:
        - [1997]
    title: "Gravitational Collapse and Cosmic Censorship"
    URL: "https://arxiv.org/abs/gr-qc/9710068"
    note: "arXiv:gr-qc/9710068"

  - id: chrusciel_costa_heusler2012
    type: article-journal
    author:
      - family: Chruściel
        given: Piotr T.
      - family: Costa
        given: João Lopes
      - family: Heusler
        given: Markus
    issued:
      date-parts:
        - [2012]
    title: "Stationary Black Holes: Uniqueness and Beyond"
    container-title: "Living Reviews in Relativity"
    volume: "15"
    issue: "7"
    DOI: "10.12942/lrr-2012-7"
    URL: "https://link.springer.com/article/10.12942/lrr-2012-7"
    note: "arXiv:1205.6112"

  - id: emparan_reall2008
    type: article-journal
    author:
      - family: Emparan
        given: Roberto
      - family: Reall
        given: Harvey S.
    issued:
      date-parts:
        - [2008]
    title: "Black Holes in Higher Dimensions"
    container-title: "Living Reviews in Relativity"
    volume: "11"
    issue: "6"
    DOI: "10.12942/lrr-2008-6"
    URL: "https://arxiv.org/abs/0801.3471"
    note: "arXiv:0801.3471"

  - id: amsel2010
    type: article-journal
    author:
      - family: Amsel
        given: Aaron J.
      - family: Horowitz
        given: Gary T.
      - family: Marolf
        given: Donald
      - family: Roberts
        given: Matthew M.
    issued:
      date-parts:
        - [2010]
    title: "Uniqueness of Extremal Kerr and Kerr-Newman Black Holes"
    container-title: "Physical Review D"
    volume: "81"
    page: "024033"
    DOI: "10.1103/PhysRevD.81.024033"
    URL: "https://doi.org/10.1103/PhysRevD.81.024033"

  - id: hintz2017
    type: article
    author:
      - family: Hintz
        given: Peter
    issued:
      date-parts:
        - [2017]
    title: "Uniqueness of Kerr-Newman-de Sitter black holes with small angular momenta"
    URL: "https://arxiv.org/abs/1702.05239"
    note: "arXiv:1702.05239"

  - id: christodoulou2009
    type: book
    author:
      - family: Christodoulou
        given: Demetrios
    issued:
      date-parts:
        - [2009]
    title: "The Formation of Black Holes in General Relativity"
    publisher: "European Mathematical Society"
    DOI: "10.4171/068"
    URL: "https://www.research-collection.ethz.ch/items/9d4b547f-a47b-45e0-8a95-72c74408bf7a"

  - id: dafermos_etal2021_schwarzschild
    type: article
    author:
      - family: Dafermos
        given: Mihalis
      - family: Holzegel
        given: Gustav
      - family: Rodnianski
        given: Igor
      - family: Taylor
        given: Martin
    issued:
      date-parts:
        - [2021]
    title: "The non-linear stability of the Schwarzschild family of black holes"
    URL: "https://arxiv.org/abs/2104.08222"
    note: "arXiv:2104.08222"

  - id: dafermos_etal2016_linear_schwarzschild
    type: article
    author:
      - family: Dafermos
        given: Mihalis
      - family: Holzegel
        given: Gustav
      - family: Rodnianski
        given: Igor
    issued:
      date-parts:
        - [2016]
    title: "The linear stability of the Schwarzschild solution to gravitational perturbations"
    URL: "https://arxiv.org/abs/1601.06467"
    note: "arXiv:1601.06467"

  - id: klainerman_szeftel2021
    type: article
    author:
      - family: Klainerman
        given: Sergiu
      - family: Szeftel
        given: Jérémie
    issued:
      date-parts:
        - [2021]
    title: "Kerr stability for small angular momentum"
    URL: "https://arxiv.org/abs/2104.11857"
    note: "arXiv:2104.11857"

  - id: giorgi_klainerman_szeftel2022
    type: article
    author:
      - family: Giorgi
        given: Elena
      - family: Klainerman
        given: Sergiu
      - family: Szeftel
        given: Jérémie
    issued:
      date-parts:
        - [2022]
    title: "Wave equations estimates and the nonlinear stability of slowly rotating Kerr black holes"
    URL: "https://arxiv.org/abs/2205.14808"
    note: "arXiv:2205.14808"

  - id: whiting1989
    type: article-journal
    author:
      - family: Whiting
        given: Bernard F.
    issued:
      date-parts:
        - [1989]
    title: "Mode stability of the Kerr black hole"
    container-title: "Journal of Mathematical Physics"
    volume: "30"
    issue: "6"
    page: "1301-1305"
    DOI: "10.1063/1.528308"
    URL: "https://pubs.aip.org/aip/jmp/article/30/6/1301/228680/Mode-stability-of-the-Kerr-black-hole"

  - id: van_de_moortel2025
    type: article-journal
    author:
      - family: Van de Moortel
        given: Maxime
    issued:
      date-parts:
        - [2025]
    title: "The Strong Cosmic Censorship conjecture"
    container-title: "Comptes Rendus. Mécanique"
    URL: "https://comptes-rendus.academie-sciences.fr/mecanique/articles/10.5802/crmeca.271/"

  - id: dafermos_luk2017
    type: article
    author:
      - family: Dafermos
        given: Mihalis
      - family: Luk
        given: Jonathan
    issued:
      date-parts:
        - [2017]
    title: "The interior of dynamical vacuum black holes I: The C^0-stability of the Kerr Cauchy horizon"
    URL: "https://arxiv.org/abs/1710.01722"
    note: "arXiv:1710.01722"

  - id: gundlach_hilditch_martin_garcia2025
    type: article
    author:
      - family: Gundlach
        given: Carsten
      - family: Hilditch
        given: David
      - family: Martín-García
        given: José M.
    issued:
      date-parts:
        - [2025]
    title: "Critical Phenomena in Gravitational Collapse"
    URL: "https://arxiv.org/abs/2507.07636"
    note: "arXiv:2507.07636; major update to Living Reviews material"

  - id: bekenstein1973
    type: article-journal
    author:
      - family: Bekenstein
        given: Jacob D.
    issued:
      date-parts:
        - [1973]
    title: "Black Holes and Entropy"
    container-title: "Physical Review D"
    volume: "7"
    issue: "8"
    page: "2333-2346"
    DOI: "10.1103/PhysRevD.7.2333"
    URL: "https://doi.org/10.1103/PhysRevD.7.2333"

  - id: wald2001
    type: article-journal
    author:
      - family: Wald
        given: Robert M.
    issued:
      date-parts:
        - [2001]
    title: "The Thermodynamics of Black Holes"
    container-title: "Living Reviews in Relativity"
    volume: "4"
    issue: "6"
    DOI: "10.12942/lrr-2001-6"
    URL: "https://pmc.ncbi.nlm.nih.gov/articles/PMC5253844/"

  - id: wald1993
    type: article-journal
    author:
      - family: Wald
        given: Robert M.
    issued:
      date-parts:
        - [1993]
    title: "Black hole entropy is the Noether charge"
    container-title: "Physical Review D"
    volume: "48"
    page: "R3427-R3431"
    DOI: "10.1103/PhysRevD.48.R3427"
    URL: "https://doi.org/10.1103/PhysRevD.48.R3427"

  - id: iyer_wald1994
    type: article-journal
    author:
      - family: Iyer
        given: Vivek
      - family: Wald
        given: Robert M.
    issued:
      date-parts:
        - [1994]
    title: "Some properties of Noether charge and a proposal for dynamical black hole entropy"
    container-title: "Physical Review D"
    volume: "50"
    page: "846-864"
    DOI: "10.1103/PhysRevD.50.846"
    URL: "https://doi.org/10.1103/PhysRevD.50.846"

  - id: harlow_wu2019
    type: article
    author:
      - family: Harlow
        given: Daniel
      - family: Wu
        given: Jie-Qiang
    issued:
      date-parts:
        - [2019]
    title: "Covariant phase space with boundaries"
    URL: "https://arxiv.org/abs/1906.08616"
    note: "arXiv:1906.08616"

  - id: friedman_schleich_witt1993
    type: article-journal
    author:
      - family: Friedman
        given: John L.
      - family: Schleich
        given: Kristin
      - family: Witt
        given: Donald M.
    issued:
      date-parts:
        - [1993]
    title: "Topological Censorship"
    container-title: "Physical Review Letters"
    volume: "71"
    page: "1486-1489"
    DOI: "10.1103/PhysRevLett.71.1486"
    URL: "https://arxiv.org/abs/gr-qc/9305017"
    note: "arXiv:gr-qc/9305017"

  - id: galloway_schoen2005
    type: article-journal
    author:
      - family: Galloway
        given: Gregory J.
      - family: Schoen
        given: Richard
    issued:
      date-parts:
        - [2005]
    title: "A generalization of Hawking's black hole topology theorem to higher dimensions"
    container-title: "Communications in Mathematical Physics"
    volume: "266"
    page: "571-576"
    DOI: "10.1007/s00220-006-0019-z"
    URL: "https://arxiv.org/abs/gr-qc/0509107"
    note: "arXiv:gr-qc/0509107"

  - id: dain2014
    type: article-journal
    author:
      - family: Dain
        given: Sergio
    issued:
      date-parts:
        - [2014]
    title: "Geometric inequalities for black holes"
    container-title: "General Relativity and Gravitation"
    volume: "46"
    page: "1715"
    DOI: "10.1007/s10714-014-1715-1"
    URL: "https://arxiv.org/abs/1401.8166"
    note: "arXiv:1401.8166"

  - id: bray2003
    type: article
    author:
      - family: Bray
        given: Hubert L.
    issued:
      date-parts:
        - [2003]
    title: "Black holes and the Penrose inequality in general relativity"
    URL: "https://arxiv.org/abs/math/0304261"
    note: "arXiv:math/0304261"

  - id: almheiri_etal2020
    type: article-journal
    author:
      - family: Almheiri
        given: Ahmed
      - family: Hartman
        given: Thomas
      - family: Maldacena
        given: Juan
      - family: Shaghoulian
        given: Edgar
      - family: Tajdini
        given: Amirhossein
    issued:
      date-parts:
        - [2021]
    title: "The entropy of Hawking radiation"
    container-title: "Reviews of Modern Physics"
    volume: "93"
    page: "035002"
    DOI: "10.1103/RevModPhys.93.035002"
    URL: "https://arxiv.org/abs/2006.06872"
    note: "arXiv:2006.06872"

  - id: penington_etal2019_replica
    type: article-journal
    author:
      - family: Penington
        given: Geoff
      - family: Shenker
        given: Stephen H.
      - family: Stanford
        given: Douglas
      - family: Yang
        given: Zhenbin
    issued:
      date-parts:
        - [2022]
    title: "Replica wormholes and the black hole interior"
    container-title: "Journal of High Energy Physics"
    volume: "2022"
    issue: "3"
    page: "205"
    DOI: "10.1007/JHEP03(2022)205"
    URL: "https://arxiv.org/abs/1911.11977"
    note: "arXiv:1911.11977"

  - id: almheiri_engelhardt_marolf_maxfield2019
    type: article
    author:
      - family: Almheiri
        given: Ahmed
      - family: Engelhardt
        given: Netta
      - family: Marolf
        given: Donald
      - family: Maxfield
        given: Henry
    issued:
      date-parts:
        - [2019]
    title: "The entropy of bulk quantum fields and the entanglement wedge of an evaporating black hole"
    URL: "https://arxiv.org/abs/1905.08762"
    note: "arXiv:1905.08762"

  - id: almheiri_etal2019_replica_entropy
    type: article-journal
    author:
      - family: Almheiri
        given: Ahmed
      - family: Mahajan
        given: Raghu
      - family: Maldacena
        given: Juan
      - family: Zhao
        given: Ying
    issued:
      date-parts:
        - [2020]
    title: "The Page curve of Hawking radiation from semiclassical geometry"
    container-title: "Journal of High Energy Physics"
    volume: "2020"
    issue: "3"
    page: "149"
    DOI: "10.1007/JHEP03(2020)149"
    URL: "https://arxiv.org/abs/1908.10996"
    note: "arXiv:1908.10996"

  - id: almheiri_dong_harlow2014
    type: article-journal
    author:
      - family: Almheiri
        given: Ahmed
      - family: Dong
        given: Xi
      - family: Harlow
        given: Daniel
    issued:
      date-parts:
        - [2015]
    title: "Bulk Locality and Quantum Error Correction in AdS/CFT"
    container-title: "Journal of High Energy Physics"
    volume: "2015"
    issue: "4"
    page: "163"
    DOI: "10.1007/JHEP04(2015)163"
    URL: "https://arxiv.org/abs/1411.7041"
    note: "arXiv:1411.7041"

  - id: pastawski_etal2015
    type: article-journal
    author:
      - family: Pastawski
        given: Fernando
      - family: Yoshida
        given: Beni
      - family: Harlow
        given: Daniel
      - family: Preskill
        given: John
    issued:
      date-parts:
        - [2015]
    title: "Holographic quantum error-correcting codes: Toy models for the bulk/boundary correspondence"
    container-title: "Journal of High Energy Physics"
    volume: "2015"
    issue: "6"
    page: "149"
    DOI: "10.1007/JHEP06(2015)149"
    URL: "https://arxiv.org/abs/1503.06237"
    note: "arXiv:1503.06237"

  - id: raju2020
    type: article-journal
    author:
      - family: Raju
        given: Suvrat
    issued:
      date-parts:
        - [2022]
    title: "Lessons from the information paradox"
    container-title: "Physics Reports"
    volume: "943"
    page: "1-80"
    DOI: "10.1016/j.physrep.2021.10.001"
    URL: "https://arxiv.org/abs/2012.05770"
    note: "arXiv:2012.05770"

  - id: geng_etal2021
    type: article-journal
    author:
      - family: Geng
        given: Hao
      - family: Karch
        given: Andreas
      - family: Uhlemann
        given: Christoph F.
    issued:
      date-parts:
        - [2022]
    title: "Inconsistency of islands in theories with long-range gravity"
    container-title: "Journal of High Energy Physics"
    volume: "2022"
    issue: "1"
    page: "182"
    DOI: "10.1007/JHEP01(2022)182"
    URL: "https://link.springer.com/article/10.1007/JHEP01(2022)182"

  - id: loffler_etal2012
    type: article-journal
    author:
      - family: Löffler
        given: Frank
      - family: Faber
        given: Joshua
      - family: Bentivegna
        given: Eloisa
      - family: Bode
        given: Tanja
      - family: Diener
        given: Peter
      - family: Haas
        given: Roland
      - family: Hinder
        given: Ian
      - family: Mundim
        given: Bruno C.
      - family: Ott
        given: Christian D.
      - family: Schnetter
        given: Erik
      - family: Allen
        given: Gabrielle
      - family: Campanelli
        given: Manuela
      - family: Laguna
        given: Pablo
    issued:
      date-parts:
        - [2012]
    title: "The Einstein Toolkit: A community computational infrastructure for relativistic astrophysics"
    container-title: "Classical and Quantum Gravity"
    volume: "29"
    issue: "11"
    page: "115001"
    DOI: "10.1088/0264-9381/29/11/115001"
    URL: "https://einsteintoolkit.org/about.html"

  - id: einstein_toolkit2025
    type: webpage
    author:
      - literal: "Einstein Toolkit Consortium"
    issued:
      date-parts:
        - [2025]
    title: "Einstein Toolkit 2025_05 Release Announcement"
    URL: "https://www.einsteintoolkit.org/about/releases/ET_2025_05_announcement.html"

  - id: reisswig_etal2009
    type: article
    author:
      - family: Reisswig
        given: Christian
      - family: Bishop
        given: Nigel T.
      - family: Pollney
        given: Denis
      - family: Szilágyi
        given: Béla
    issued:
      date-parts:
        - [2009]
    title: "Characteristic extraction in numerical relativity: binary black hole merger waveforms at null infinity"
    URL: "https://arxiv.org/abs/0912.1285"
    note: "arXiv:0912.1285"

  - id: cauchy_characteristic_matching2024
    type: article
    issued:
      date-parts:
        - [2024]
    title: "Binary black hole evolutions with Cauchy-characteristic matching"
    URL: "https://arxiv.org/html/2412.06906v2"
    note: "arXiv:2412.06906"

  - id: blackman_etal2017
    type: article
    author:
      - family: Blackman
        given: Jonathan
      - family: Field
        given: Scott E.
      - family: Scheel
        given: Mark A.
      - family: Galley
        given: Chad R.
      - family: Hemberger
        given: Daniel A.
      - family: Schmidt
        given: Patricia
      - family: Smith
        given: Rory
    issued:
      date-parts:
        - [2017]
    title: "A surrogate model of gravitational waveforms from numerical relativity simulations of precessing binary black hole mergers"
    URL: "https://arxiv.org/abs/1705.07089"
    note: "arXiv:1705.07089"

  - id: sxs_catalog2025
    type: webpage
    author:
      - literal: "Simulating eXtreme Spacetimes Collaboration"
    issued:
      date-parts:
        - [2025]
    title: "SXS Gravitational Waveform Catalog Update"
    URL: "https://duetosymmetry.com/pubs/SXS-catalog-update/"

  - id: lvk2026_gwtc5
    type: article
    author:
      - literal: "LIGO Scientific Collaboration, Virgo Collaboration, and KAGRA Collaboration"
    issued:
      date-parts:
        - [2026]
    title: "GWTC-5.0: Observations from the Second Part of the Fourth LIGO-Virgo-KAGRA Observing Run and Updates to the Gravitational-Wave Transient Catalog"
    URL: "https://arxiv.org/abs/2605.27225"
    note: "arXiv:2605.27225"

  - id: ligo2026_gwtc5_o4b
    type: webpage
    author:
      - literal: "LIGO Scientific Collaboration"
    issued:
      date-parts:
        - [2026, 5, 26]
    title: "O4B Catalog"
    URL: "https://ligo.org/detections/o4b-catalog/"

  - id: lvk2025_gw250114_spectroscopy
    type: article-journal
    author:
      - literal: "LIGO Scientific Collaboration, Virgo Collaboration, and KAGRA Collaboration"
    issued:
      date-parts:
        - [2026]
    title: "Black Hole Spectroscopy and Tests of General Relativity with GW250114"
    container-title: "Physical Review Letters"
    URL: "https://arxiv.org/abs/2509.08099"
    DOI: "10.1103/6c61-fm1n"
    note: "arXiv:2509.08099"

  - id: lvk2025_gw250114_area
    type: article-journal
    author:
      - literal: "LIGO Scientific Collaboration, Virgo Collaboration, and KAGRA Collaboration"
    issued:
      date-parts:
        - [2025]
    title: "GW250114: Testing Hawking's Area Law and the Kerr Nature of Black Holes"
    container-title: "Physical Review Letters"
    volume: "135"
    issue: "11"
    page: "111403"
    DOI: "10.1103/kw5g-d732"
    URL: "https://link.aps.org/doi/10.1103/kw5g-d732"

  - id: eht2019_m87_i
    type: article-journal
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2019]
    title: "First M87 Event Horizon Telescope Results. I. The Projection of the Supermassive Black Hole"
    container-title: "Astrophysical Journal Letters"
    volume: "875"
    page: "L1"
    DOI: "10.3847/2041-8213/ab0ec7"
    URL: "https://arxiv.org/abs/1906.11238"
    note: "arXiv:1906.11238"

  - id: eht2019_m87_iv
    type: article-journal
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2019]
    title: "First M87 Event Horizon Telescope Results. IV. Imaging the Central Supermassive Black Hole"
    container-title: "Astrophysical Journal Letters"
    volume: "875"
    page: "L4"
    DOI: "10.3847/2041-8213/ab0e85"
    URL: "https://arxiv.org/abs/1906.11241"
    note: "arXiv:1906.11241"

  - id: eht2023_sgra_i
    type: article-journal
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2023]
    title: "First Sagittarius A* Event Horizon Telescope Results. I. The Projection of the Supermassive Black Hole in the Center of the Milky Way"
    URL: "https://arxiv.org/abs/2311.08680"
    note: "arXiv:2311.08680"

  - id: eht2023_sgra_iii
    type: article-journal
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2023]
    title: "First Sagittarius A* Event Horizon Telescope Results. III. Imaging of the Galactic Center Supermassive Black Hole"
    URL: "https://arxiv.org/abs/2311.09479"
    note: "arXiv:2311.09479"

  - id: eht2023_sgra_iv
    type: article-journal
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2023]
    title: "First Sagittarius A* Event Horizon Telescope Results. IV. Variability, Morphology, and Black Hole Mass"
    URL: "https://arxiv.org/abs/2311.08697"
    note: "arXiv:2311.08697"

  - id: eht2021_m87_polarization
    type: webpage
    author:
      - literal: "Event Horizon Telescope Collaboration"
    issued:
      date-parts:
        - [2021]
    title: "Astronomers Image Magnetic Fields at the Edge of M87's Black Hole"
    URL: "https://eventhorizontelescope.org/blog/astronomers-image-magnetic-fields-edge-m87s-black-hole"
---

# Mathematical frontier of black holes: research memo

*As of 27 June 2026.*

## Source note

I treat **black-hole mathematics** as the regime in which the local ontology of matter—equation of state, pressure, density, quasiparticles—has been transformed into **causal geometry, horizon structure, asymptotic charges, entropy, and information flow**.
The most reliable parts of the field are classical Lorentzian geometry, PDE stability theory, numerical relativity validated by observations, and controlled semiclassical or holographic models.
The least settled parts are full quantum gravity, microscopic entropy for astrophysical black holes, singularity resolution, and the general Page curve for evaporating asymptotically flat black holes.

The source spine is: Penrose-style trapped-surface singularity theory [@penrose1965], global causal geometry [@hawking_ellis1973], modern uniqueness theory [@chrusciel_costa_heusler2012], collapse/stability PDE programs [@christodoulou2009; @dafermos_etal2021_schwarzschild; @klainerman_szeftel2021], topological and geometric inequalities [@friedman_schleich_witt1993; @galloway_schoen2005; @dain2014; @bray2003], numerical relativity and waveform catalogs [@loffler_etal2012; @sxs_catalog2025; @lvk2026_gwtc5], EHT observations [@eht2019_m87_i; @eht2023_sgra_i], and the Page-curve/island literature [@almheiri_etal2020; @penington_etal2019_replica].

---

## 1. Core mathematical object

A classical black hole is not first a material body.
In asymptotically flat general relativity, it is a **global causal region** of a Lorentzian spacetime from which no future-directed causal signal reaches future null infinity.
A spacetime is usually a smooth, connected, time-oriented Lorentzian manifold

\[ (\mathcal M,g),\qquad \mathrm{sign}(g)=(-,+,+,+), \]

satisfying the Einstein equation

\[ G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi T_{\mu\nu}. \]

For an asymptotically flat spacetime with future null infinity \(\mathscr I^+\), the black-hole region is

\[ \mathcal B=\mathcal M\setminus J^-(\mathscr I^+), \]

and the future event horizon is

\[ \mathcal H^+=\partial J^-(\mathscr I^+). \]

This is a nonlocal definition: one cannot determine the event horizon from a small open neighborhood alone.
It is a boundary in causal history, not a material surface.
This causal-geometric view is standard in mathematical relativity [@hawking_ellis1973; @wald1997].

Core definitions:

| Term | Mathematical meaning |
|---|---|
| **Lorentzian spacetime** | A time-oriented Lorentzian manifold \((\mathcal M,g)\), usually solving Einstein's equations, with causal cones determined by \(g(v,v)\le 0\). |
| **Event horizon** | Boundary of the causal past of future null infinity: \(\mathcal H^+=\partial J^-(\mathscr I^+)\). Global and teleological. |
| **Apparent horizon** | A marginally outer trapped surface, often the outer boundary of trapped surfaces on a chosen spacelike slice; quasi-local and foliation-dependent. |
| **Trapped surface** | A compact spacelike codimension-2 surface whose future-directed ingoing and outgoing null expansions satisfy \(\theta_-<0\), \(\theta_+<0\). |
| **MOTS** | Marginally outer trapped surface: \(\theta_+=0\), usually \(\theta_-<0\). |
| **Singularity** | In rigorous GR, not a point in the manifold but failure of causal geodesic completeness; curvature blow-up is stronger and must be proved separately. |
| **Geodesic incompleteness** | Some timelike or null geodesic cannot be extended to arbitrary affine parameter. |
| **Asymptotic flatness** | At large spatial/null distances, the metric approaches Minkowski geometry sufficiently fast to define \(\mathscr I^\pm\), ADM charges, and radiation fluxes. |
| **ADM mass** | Hamiltonian/asymptotic energy of an asymptotically flat initial-data set, e.g. for \(g_{ij}=\delta_{ij}+h_{ij}\), \(m_{\rm ADM}=\frac{1}{16\pi}\lim_{r\to\infty}\int_{S_r}(\partial_j h_{ij}-\partial_i h_{jj})n^i\,dS\). |
| **Angular momentum** | Asymptotic rotational charge, defined using asymptotic symmetries or Komar-type integrals when appropriate. |
| **Charge** | Electromagnetic Gauss-law charge at infinity in Einstein-Maxwell theory. |
| **Causal boundary** | A completion of spacetime by ideal endpoints of causal curves, including null infinity, timelike infinity, horizon endpoints, and singular endings; Penrose conformal boundaries are the most used in black-hole theory. |

Why this is not simply “matter at high density”: neutron matter and quark matter are still described by material degrees of freedom—fermions, gauge fields, equations of state, pressure support, superfluidity, color superconductivity.
A black hole is defined after that matter description has failed to prevent collapse and the exterior mathematical object becomes a region of causal exclusion.
The outside-observable data are reorganized into asymptotic charges \((M,J,Q)\), horizon area \(A\), surface gravity \(\kappa\), radiation flux, and scattering/perturbation data.

This distinguishes black holes from:

- **Neutron stars**: compact matter solutions with a surface, equation of state, and pressure support.
- **Quark stars**: hypothetical compact stars supported by quark matter; still material bodies.
- **Plasma**: kinetic or fluid/gauge-field matter with local degrees of freedom.
- **Singularities**: geodesic incompleteness or curvature blow-up; a singularity may occur without an event horizon in naked-singularity scenarios.
- **Generic compact objects**: can be very dense without possessing a horizon.
- **Generic gravitational fields**: may curve light cones but need not contain a causally excluded region.

The decisive mathematical transition is from **local material constitution** to **global causal structure**.

---

## 2. The mathematical ontology of black holes

A useful frontier framing is to treat black holes as **boundary-matter** or **causal-geometry matter**.
This does not mean they are a new ordinary phase of matter.
It means the mathematical organization of the object is transferred from local microstructure to boundary observables:

\[ \text{density / pressure / equation of state} \quad\longrightarrow\quad \text{horizon / area / causal boundary / entropy / information}. \]

The event horizon is not a membrane made of stuff, but it functions mathematically as a one-way causal boundary.
Apparent, isolated, trapping, and dynamical horizons refine this by giving quasi-local surfaces that can be located and evolved without knowing the entire future of the spacetime.
The isolated/dynamical horizon framework was developed to distinguish equilibrium black holes from evolving horizons in mergers, accretion, and radiation [@wald2001; @iyer_wald1994].

Thus black holes are not ordinary thermodynamic phases in the way plasma, neutron matter, or quark matter are.
There is no local black-hole order parameter in the exterior region, and the event horizon is not locally detectable.
Still, black holes function as an endpoint of dense-matter collapse because, once trapped surfaces form, causal structure can force future incompleteness under energy and causality assumptions [@penrose1965].
Christodoulou's black-hole formation program is a rigorous version of this: the problem is not merely to display exact black-hole metrics, but to prove that trapped regions arise dynamically from regular initial data [@christodoulou2009].

---

## 3. Foundational models and exact solutions

The canonical exact solutions are not “the real universe”; they are symmetry-reduced models around which the modern theory is organized.
They provide testbeds for causal structure, scattering, stability, thermodynamics, uniqueness, and quantum-field calculations.
Stationary black-hole solutions and uniqueness assumptions are surveyed in [@chrusciel_costa_heusler2012], while higher-dimensional examples are surveyed in [@emparan_reall2008].

| Model | Metric / structure | Captures | Fails / limitations |
|---|---|---|---|
| **Schwarzschild** | \(ds^2=-(1-2M/r)dt^2+(1-2M/r)^{-1}dr^2+r^2d\Omega^2\). Horizon \(r=2M\). | Static, spherically symmetric, vacuum exterior; simplest event horizon and black-hole thermodynamics. | No rotation, charge, accretion, radiation, realistic formation, or generic perturbations. |
| **Reissner-Nordström** | \(f(r)=1-2M/r+Q^2/r^2\), \(ds^2=-fdt^2+f^{-1}dr^2+r^2d\Omega^2\). Horizons \(r_\pm=M\pm\sqrt{M^2-Q^2}\). | Einstein-Maxwell charge, inner Cauchy horizon, extremality. | Astrophysical black holes are expected to neutralize; inner horizon unstable. |
| **Kerr** | \(\Sigma=r^2+a^2\cos^2\theta\), \(\Delta=r^2-2Mr+a^2\), with Boyer-Lindquist metric. Horizons \(r_\pm=M\pm\sqrt{M^2-a^2}\). | Rotating vacuum black holes, ergoregion, frame dragging, separability, quasinormal modes, astrophysical exterior model. | Stationary and vacuum; does not include formation, accretion disks, plasma, quantum effects, or generic nonstationarity. |
| **Kerr-Newman** | Kerr with \(\Delta=r^2-2Mr+a^2+Q^2\). | Stationary Einstein-Maxwell family with mass, spin, charge. | Charge likely negligible astrophysically; uniqueness assumptions are restrictive. |
| **Schwarzschild-de Sitter / Kerr-de Sitter** | Positive \(\Lambda\), black-hole plus cosmological horizons. | Cosmological horizons, exponential decay, SCC in de Sitter settings. | Not asymptotically flat; global charges differ. |
| **AdS black holes** | Negative \(\Lambda\), timelike conformal boundary. | Holography, thermal states in AdS/CFT, confinement/deconfinement analogies. | Boundary conditions crucial; AdS has reflecting boundary and different stability behavior. |
| **Higher-dimensional black holes** | Myers-Perry, black rings, black strings/branes. | Shows four-dimensional uniqueness/topology are exceptional; central to string theory. | Higher-dimensional physics may not describe astrophysical black holes; stability/topology richer and less classified. |
| **Numerical collapse/merger spacetimes** | Computed solutions of Einstein or Einstein-matter systems. | Dynamical formation, binary mergers, ringdown, gravitational radiation. | Requires discretization, gauge choices, boundary conditions, extraction methods, and validation. |

Kerr is central because classical uniqueness theorems suggest that stationary, asymptotically flat, four-dimensional, vacuum/electrovac black holes under strong assumptions are Kerr or Kerr-Newman.
But these assumptions—stationarity, analyticity or high smoothness, connected nondegenerate horizons, no exotic matter, appropriate asymptotics—are exactly where many frontier questions live [@chrusciel_costa_heusler2012; @hintz2017].

---

## 4. Lorentzian geometry and causal structure

Black holes are defined through causal structure.
The metric determines cones:

\[ g(v,v)<0 \text{ timelike},\quad g(v,v)=0 \text{ null},\quad g(v,v)>0 \text{ spacelike}. \]

A causal curve is future-directed timelike or null.
The causal future/past \(J^\pm(S)\) of a set \(S\) organizes reachability.

Key objects:

- **Global hyperbolicity**: existence of Cauchy surfaces; deterministic evolution from initial data.
- **Cauchy surface**: a hypersurface intersecting every inextendible causal curve exactly once.
- **Penrose diagram**: conformal compactification retaining null directions while placing infinity at finite coordinate distance.
- **Null infinity \(\mathscr I^\pm\)**: ideal endpoints of outgoing/incoming radiation in asymptotically flat spacetime.
- **Event horizon**: boundary of causal accessibility to \(\mathscr I^+\).
- **Apparent/dynamical horizons**: quasi-local surfaces tied to null expansions and foliation.
- **Trapped surfaces**: local signatures of irreversible collapse.
- **Cosmic censorship**: conjectural principles asserting that singularities formed from generic regular data are hidden from distant observers, and that maximal developments are generically inextendible in appropriate regularity classes.

This is why black holes are not locally defined by material composition.
A small neighborhood just outside a large black-hole horizon can have small curvature.
The black-hole property is instead the global fact that future causal curves from inside cannot reach \(\mathscr I^+\) [@hawking_ellis1973].

A frontier issue is the relation between global event horizons and quasi-local horizons.
Event horizons have clean causal meaning but require the full future spacetime.
Dynamical, trapping, and isolated horizons are mathematically and computationally usable during mergers and accretion, and they connect area growth quantitatively to physical fluxes [@wald2001; @iyer_wald1994].

---

## 5. Singularity theorems and gravitational collapse

The Penrose singularity theorem shows that, under appropriate causality and energy assumptions, a noncompact Cauchy surface plus a trapped surface imply future null geodesic incompleteness [@penrose1965].
The geometric engine is the Raychaudhuri equation.
For a null congruence with tangent \(k^a\),

\[ \frac{d\theta}{d\lambda} = -\frac12\theta^2-\sigma_{ab}\sigma^{ab} +\omega_{ab}\omega^{ab} -R_{ab}k^ak^b. \]

For hypersurface-orthogonal null congruences, \(\omega=0\).
With the null energy condition and Einstein's equation, \(R_{ab}k^ak^b\ge0\), so negative expansion focuses to conjugate points.
This focusing mechanism turns trapped surfaces into incomplete null geodesics.

The crucial caution is that singularity theorems prove **incompleteness**, not necessarily curvature blow-up, not necessarily a point singularity, and not by themselves weak cosmic censorship [@landsman2022].

Gravitational collapse adds dynamics.
Oppenheimer-Snyder collapse gives a symmetric dust model.
Christodoulou's work proves trapped-surface formation from regular data in vacuum GR, turning “black-hole formation” into a nonlinear hyperbolic PDE theorem rather than just an exact-solution story [@christodoulou2009].

Critical collapse is another frontier.
Choptuik-type phenomena show threshold behavior between dispersion and black-hole formation:

\[ M_{\rm BH}\sim C(p-p_*)^\gamma, \]

where \(p\) parametrizes initial data, \(p_*\) is the critical threshold, and \(\gamma\) is universal within a matter model.
Recent review literature emphasizes universality, power-law scaling, echoing, codimension-one attractors, non-spherical vacuum collapse, and connections to PDE blow-up and naked singularities [@gundlach_hilditch_martin_garcia2025].

The central unresolved issue is censorship.
Weak cosmic censorship says, roughly, that singularities formed from generic regular asymptotically flat data are hidden behind event horizons.
Strong cosmic censorship says, roughly, that maximal globally hyperbolic developments are generically inextendible in a suitable regularity class [@wald1997; @van_de_moortel2025].

---

## 6. Black-hole uniqueness, rigidity, and no-hair

The classical “no-hair” picture says that stationary, asymptotically flat, four-dimensional electrovac black holes are characterized by mass \(M\), angular momentum \(J\), and charge \(Q\).
More precisely, under strong assumptions, the only such connected stationary black-hole exteriors are Kerr-Newman.
The modern uniqueness literature is careful because each assumption matters [@chrusciel_costa_heusler2012].

Major ingredients:

- **Stationarity**: existence of a timelike Killing field near infinity.
- **Rigidity**: stationary rotating black holes under suitable hypotheses possess an axial symmetry.
- **Analyticity / smoothness assumptions**: older proofs often need analyticity; modern work reduces this in special regimes.
- **Electrovac equations**: no extra matter hair.
- **Asymptotic flatness**: excludes AdS boundary phenomena and cosmological horizons.
- **Connected nondegenerate horizon**: rules out multi-black-hole or extremal complications.

Known loopholes and extensions:

- **Matter hair**: scalar, Yang-Mills, Proca, Skyrme, or other fields can support non-Kerr stationary solutions under modified assumptions.
- **AdS black holes**: reflecting boundary conditions and holographic phases allow richer structure.
- **Higher dimensions**: black rings and Myers-Perry solutions break four-dimensional uniqueness intuition [@emparan_reall2008].
- **Extremal horizons**: degenerate horizons require separate analysis; extremal uniqueness is more delicate [@amsel2010].
- **Nonstationarity**: real mergers are not stationary; uniqueness is a final-state conjecture, not a dynamical theorem.

Modern uniqueness has also expanded into de Sitter and finite-regularity settings.
Hintz proved uniqueness for Kerr-Newman-de Sitter with small angular momenta under smooth rather than analytic assumptions, illustrating the current merger of uniqueness and PDE dynamics [@hintz2017].

---

## 7. Stability and nonlinear dynamics

The black-hole stability problem asks whether a black-hole solution persists under small perturbations of its initial data and settles to another member of the same family.
It is one of the deepest PDE problems in general relativity because it combines gauge, hyperbolicity, trapping, null infinity, horizon redshift, nonlinear wave interactions, and gravitational radiation.

Hierarchy of stability notions:

| Level | Meaning |
|---|---|
| **Mode stability** | No exponentially growing separated modes. Whiting's theorem established mode stability for Kerr for massless fields [@whiting1989]. |
| **Linear stability** | All solutions of the linearized equations decay or remain controlled modulo gauge/linearized Kerr parameters [@dafermos_etal2016_linear_schwarzschild]. |
| **Boundedness/decay** | Energy and pointwise decay estimates for wave/Teukolsky equations. |
| **Nonlinear stability** | Full Einstein evolution from nearby initial data exists globally in the exterior and converges asymptotically to a nearby black hole. |
| **Full subextremal Kerr stability** | Nonlinear stability for all \(|a|<M\); still not completely settled as a full theorem. |

Major rigorous progress:

- **Schwarzschild nonlinear stability**: Dafermos, Holzegel, Rodnianski, and Taylor proved nonlinear stability of the Schwarzschild exterior under general vacuum perturbations close to Schwarzschild [@dafermos_etal2021_schwarzschild].
- **Slowly rotating Kerr nonlinear stability**: Klainerman-Szeftel and Giorgi-Klainerman-Szeftel proved nonlinear stability for sufficiently small angular momentum ratio \(|a|/M\ll1\) [@klainerman_szeftel2021; @giorgi_klainerman_szeftel2022].
- **Interior/Cauchy horizon dynamics**: Dafermos-Luk show the subtlety of Kerr interiors: certain Cauchy horizons may be \(C^0\)-stable even as stronger regularity breaks down [@dafermos_luk2017].

What makes Kerr hard:

- Kerr is only axisymmetric, not spherically symmetric.
- The trapped set of null geodesics is normally hyperbolic but complicated.
- Superradiance interacts with energy estimates.
- Gauge must be controlled nonlinearly.
- The final black hole has shifted parameters \(M,a\), so one must modulate the solution.
- Near-extremal Kerr introduces additional degeneracies.

AdS changes the problem.
The AdS boundary reflects radiation, preventing the clean dispersive decay available in asymptotically flat spacetimes.
Thus “Kerr stability” is boundary-condition sensitive.

Quasinormal modes are the spectral fingerprints of perturbed black holes.
They are central to ringdown, waveform modeling, and black-hole spectroscopy, but mathematically they are resonances of non-self-adjoint operators, not ordinary normal modes.
This makes spectral stability subtle and makes the inverse problem from observed ringdown to geometry nontrivial [@lvk2025_gw250114_spectroscopy].

---

## 8. Black-hole thermodynamics

Classical black-hole mechanics mirrors thermodynamics:

| Thermodynamic law | Black-hole law |
|---|---|
| Zeroth law | Surface gravity \(\kappa\) is constant on a stationary Killing horizon under suitable assumptions. |
| First law | \(\delta M=\frac{\kappa}{8\pi}\delta A+\Omega_H\delta J+\Phi_H\delta Q\). |
| Second law | Horizon area \(A\) is nondecreasing classically under energy and causality assumptions. |
| Third law | Extremality \(\kappa=0\) cannot be reached by finite physical processes under appropriate assumptions. |

Surface gravity is defined on a Killing horizon by

\[ \chi^\nu\nabla_\nu\chi^\mu=\kappa\chi^\mu, \]

where \(\chi\) is the horizon-generating Killing field.
Hawking's area theorem is classical: assuming the null energy condition and cosmic-censorship-type regularity, the event-horizon area cannot decrease [@wald2001].

Bekenstein and Hawking turn this analogy into thermodynamics:

\[ S_{\rm BH}=\frac{k_B c^3 A}{4G\hbar},\qquad T_H=\frac{\hbar\kappa}{2\pi k_B c}. \]

In units \(G=c=\hbar=k_B=1\), \(S=A/4\), \(T=\kappa/2\pi\).
Bekenstein's entropy argument and Wald's review remain foundational [@bekenstein1973; @wald2001].

The refined semiclassical object is generalized entropy:

\[ S_{\rm gen}=\frac{A}{4G\hbar}+S_{\rm out}+\text{counterterms}. \]

The generalized second law asserts \(S_{\rm gen}\) is nondecreasing.
The law is well supported in many semiclassical settings but not a single universal theorem covering full quantum gravity and arbitrary dynamical collapse.

Wald's Noether-charge formalism generalizes entropy beyond Einstein gravity, giving

\[ S_{\rm Wald}=-2\pi\int_{\mathcal H} \frac{\partial L}{\partial R_{abcd}}\epsilon_{ab}\epsilon_{cd}\,\sqrt h\,d^{D-2}x, \]

for diffeomorphism-invariant Lagrangians under appropriate stationarity assumptions [@wald1993; @iyer_wald1994; @harlow_wu2019].

Status distinctions:

- **Classical**: area theorem, laws of mechanics, surface gravity, stationary first law.
- **Semiclassical**: Hawking radiation, generalized entropy, GSL in controlled settings.
- **Quantum-gravity frontier**: microscopic entropy for realistic black holes, unitary evaporation, backreaction, singularity resolution.

---

## 9. Quantum information, holography, and entropy

Black holes have become central to quantum information geometry because they force three structures into one problem:

\[ \text{causal horizon} + \text{entropy} + \text{unitary quantum evolution}. \]

The information paradox arises because Hawking's semiclassical calculation suggests nearly thermal radiation from an evaporating black hole, apparently evolving a pure state into a mixed state.
The Page curve expectation is that the fine-grained entropy of Hawking radiation rises until the Page time and then falls to zero if evaporation is unitary.
The modern Page-curve/island development is reviewed in [@almheiri_etal2020].

The quantum extremal surface/island formula is

\[ S(R)= \min_{\mathcal I}\operatorname*{ext}_{\mathcal I} \left[ \frac{\mathrm{Area}(\partial\mathcal I)}{4G\hbar} + S_{\rm bulk}(R\cup\mathcal I) \right]. \]

Here \(R\) is the radiation region and \(\mathcal I\) is an “island” region in the gravitational spacetime.
Replica wormholes provide a gravitational path-integral mechanism for the Page transition in controlled models [@penington_etal2019_replica; @almheiri_engelhardt_marolf_maxfield2019; @almheiri_etal2019_replica_entropy].

Holography contributes the Ryu-Takayanagi/HRT/QES idea: entropy of boundary regions is computed by extremal bulk areas plus bulk entropy.
Quantum error correction supplies a mathematical model for how bulk information can be redundantly encoded in boundary degrees of freedom [@almheiri_dong_harlow2014; @pastawski_etal2015].

Important caution: Page-curve/island results are robust in certain semiclassical, JT-gravity, braneworld, and AdS/CFT-inspired models.
They are not yet a complete rigorous solution of the information problem for astrophysical asymptotically flat black holes.
Long-range gravity, gravitational Gauss laws, factorization, and the status of the black-hole interior remain debated [@raju2020; @geng_etal2021].

Major structures in this frontier:

| Structure | Role |
|---|---|
| **Entanglement entropy** | Measures fine-grained radiation entropy and boundary/bulk entanglement. |
| **QES / islands** | Compute Page curves in controlled gravitational path integrals. |
| **Replica wormholes** | Saddles connecting replicas in entropy computations. |
| **AdS/CFT** | Nonperturbative definition of some quantum-gravity systems. |
| **Tensor networks** | Discrete models of holographic encoding and geometry from entanglement. |
| **Quantum error correction** | Explains subregion duality and redundancy of bulk reconstruction. |
| **Modular flow** | Encodes algebraic dynamics of entanglement wedges and possible information extraction. |
| **Complexity** | Candidate dual to interior volume/action growth; less settled than entropy. |

---

## 10. Topology and modern mathematical structure

Topology enters black-hole mathematics non-metaphorically.
It constrains possible horizon cross-sections, causal accessibility, and global spacetime structure.

**Topological censorship** says that in asymptotically flat globally hyperbolic spacetimes satisfying appropriate energy conditions, causal curves from infinity to infinity cannot probe nontrivial topology; roughly, topology is hidden behind horizons.
Friedman, Schleich, and Witt's theorem is the canonical statement [@friedman_schleich_witt1993].

**Horizon topology** in four-dimensional asymptotically flat stationary black holes is strongly constrained: cross-sections are \(S^2\) under appropriate energy and regularity assumptions.
In higher dimensions, Galloway-Schoen showed horizon cross-sections must be of positive Yamabe type, allowing richer topologies such as the \(S^1\times S^2\) black ring in five dimensions [@galloway_schoen2005; @emparan_reall2008].

**Geometric inequalities** connect mass, area, angular momentum, and charge.
The Riemannian Penrose inequality,

\[ m_{\rm ADM}\ge \sqrt{\frac{A}{16\pi}}, \]

is proved in time-symmetric settings, with Huisken-Ilmanen and Bray's work central to the proof history.
The full spacetime Penrose inequality remains a major frontier [@bray2003; @dain2014].

**Positive mass theorem** underlies much of this geometry: under suitable energy conditions, ADM mass is nonnegative, with equality only for Minkowski space.
The black-hole inequality program can be seen as asking how much mass is required to enclose a horizon of given area, spin, and charge.

**Quasi-local mass** is hard because gravitational energy is not locally gauge-invariant.
Brown-York, Hawking, Liu-Yau, Wang-Yau, and related masses try to assign energy to finite regions.
Geometric-inequality work gives bounds involving quasi-local mass, angular momentum, charge, and area [@dain2014].

**Covariant phase space** treats solutions of the field equations as an infinite-dimensional symplectic manifold.
The Iyer-Wald-Zoupas framework relates diffeomorphism invariance, Noether charges, horizon entropy, fluxes, and boundary charges [@iyer_wald1994; @harlow_wu2019].
This is mathematically central to black-hole mechanics, asymptotic symmetries, and modern discussions of soft hair and gravitational memory.

---

## 11. Numerical and computational frontier

Numerical relativity solves Einstein's equations for regimes where exact solutions and perturbation theory fail: binary inspiral, merger, collapse, neutron-star/black-hole interactions, and strong-field waveform generation.
The Einstein Toolkit is a community platform for relativistic astrophysics, including Cactus/Carpet infrastructure, BSSN evolution, adaptive mesh refinement, and matter modules [@loffler_etal2012; @einstein_toolkit2025].

Major methods:

| Method | Mathematical/computational role |
|---|---|
| **3+1 formulations** | Write Einstein evolution as PDE on spacelike slices; BSSN, generalized harmonic, Z4/CCZ4. |
| **Puncture methods** | Evolve black holes without explicitly excising singular interiors. |
| **Excision** | Remove interior regions causally disconnected from exterior. |
| **Spectral methods** | High-accuracy smooth-domain evolution, especially in SpEC/SXS simulations. |
| **Finite difference / finite volume** | Robust grid methods, especially for matter and shocks. |
| **Adaptive mesh refinement** | Resolve small horizons and wave zones simultaneously. |
| **Horizon finders** | Locate apparent horizons/MOTS during simulations. |
| **Cauchy-characteristic extraction** | Compute radiation at null infinity instead of finite-radius extrapolation. |
| **Cauchy-characteristic matching** | Couple Cauchy interior to characteristic exterior to reduce artificial boundary errors. |
| **Surrogate waveform models** | Compress expensive numerical relativity into fast models for inference. |
| **Machine learning** | Accelerates parameter inference, surrogate construction, denoising, and reduced-order modeling. |

Computational work is not merely engineering approximation.
It discovers mathematical structures: critical collapse universality, nonlinear stability/instability regimes, ringdown mode content, horizon area flux laws, recoil/kick phenomena, tail decay, and waveform manifold geometry.

Current computational frontiers include:

- **Large waveform catalogs**: SXS's 2025 catalog update supports more accurate waveform modeling across spin/precession parameter space [@sxs_catalog2025].
- **Public code ecosystems**: Einstein Toolkit and related catalogs support reproducibility and cross-code validation [@einstein_toolkit2025].
- **Null-infinity extraction**: Cauchy-characteristic extraction removes finite-radius extrapolation ambiguities and gauge artifacts in waveform extraction [@reisswig_etal2009].
- **Cauchy-characteristic matching**: recent successful binary-black-hole evolutions using matching reduce boundary-condition systematics and resolve late-time power-law tails, though convergence and hyperbolicity issues remain active [@cauchy_characteristic_matching2024].
- **Surrogates and eccentric/precessing models**: waveform surrogate modeling turns high-cost numerical simulations into parameter-estimation tools [@blackman_etal2017].

Computational holography is a different frontier: numerical evaluation of quantum extremal surfaces, tensor-network geometries, JT gravity, SYK-like models, and gravitational path integrals.
Its mathematical value lies in testing conjectural entropy/geometry relations in controlled settings, not in simulating astrophysical black holes directly.

---

## 12. Observational interface

Observations do not “see the event horizon” directly.
They constrain mathematical models by measuring gravitational waves, projections, accretion dynamics, orbital motion, polarization, and ringdown spectra.
The interface is model-mediated: one compares data to Kerr, non-Kerr metrics, plasma/radiative-transfer models, and numerical-relativity waveforms.

**Gravitational waves.** LVK's GWTC-5.0, released in 2026, adds O4b candidates from 10 April 2024 to 28 January 2025.
The arXiv catalog reports 150 compact-binary candidates with \(p_{\rm astro}\ge0.5\) after vetoes and a cumulative GWTC count of 390 such candidates [@lvk2026_gwtc5].
Official LVK communication describes the O4B catalog as the fifth transient catalog and gives the public catalog context [@ligo2026_gwtc5_o4b].

**Ringdown and Kerr spectroscopy.** GW250114_082203 is especially important because its high signal-to-noise post-merger signal allows stronger tests of the Kerr quasinormal-mode pattern, including evidence requiring more than one QNM [@lvk2025_gw250114_spectroscopy].
Its area-law test is also framed as an observational test of Hawking's area theorem and the Kerr nature of the remnant [@lvk2025_gw250114_area].
Current claims remain precision-limited; they are strong empirical constraints, not mathematical proofs of Kerr uniqueness.

**Event Horizon Telescope.** M87* imaging measured a bright ring with angular scale \(42\pm3\,\mu\mathrm{as}\), consistent with a Kerr black hole of mass about \(6.5\times10^9M_\odot\) under GRMHD modeling [@eht2019_m87_i; @eht2019_m87_iv].
Sgr A* imaging found a ring of about \(50\,\mu\mathrm{as}\), consistent with the expected projection scale of the Galactic Center's \(\sim4\times10^6M_\odot\) compact object [@eht2023_sgra_i; @eht2023_sgra_iii; @eht2023_sgra_iv].

**Polarization and plasma geometry.** EHT polarization of M87* constrains near-horizon magnetic-field geometry and jet/accretion models, showing that “black-hole observations” are actually tests of Kerr geometry plus plasma radiative transfer [@eht2021_m87_polarization].

**Model constraints.** Current observations strongly support the Kerr-family description in accessible regimes, but they do not mathematically prove event horizons or rule out every exotic compact object.
Horizon-scale images, ringdowns, and inspiral-merger-ringdown waveforms constrain deviations, compactness, multipole structure, dissipation, echoes, and QNM spectra.

---

## 13. Current frontier, 2020-2026

| Frontier direction | Status | Reliability / influence |
|---|---|---|
| **Nonlinear stability of Schwarzschild** | Proved for exterior vacuum perturbations in a major rigorous PDE program. | Very high reliability and influence [@dafermos_etal2021_schwarzschild]. |
| **Slowly rotating Kerr nonlinear stability** | Major theorem for \(|a|/M\ll1\), published in long rigorous works. | Very high influence; full subextremal case remains open [@klainerman_szeftel2021; @giorgi_klainerman_szeftel2022]. |
| **Full subextremal Kerr analysis** | Linear/decay/quasilinear progress; full nonlinear theorem for all \(|a|<M\) still frontier. | Reliable where proved; frontier still incomplete. |
| **Strong cosmic censorship** | Shift from yes/no to regularity-sensitive inextendibility. Cauchy horizons may be \(C^0\)-extendible but curvature or Lipschitz blow-up may hold generically. | High mathematical importance; active and subtle [@dafermos_luk2017; @van_de_moortel2025]. |
| **Critical collapse** | Updated review literature integrates PDE blow-up, non-spherical collapse, naked singularity thresholds. | Numerically and analytically influential; many rigorous gaps [@gundlach_hilditch_martin_garcia2025]. |
| **Spacetime Penrose inequality** | Time-symmetric case proved; full spacetime case active with conditional and preprint claims. | Foundational but not settled in full generality [@bray2003; @dain2014]. |
| **Quasi-local horizons** | Dynamical/trapping horizon machinery increasingly important in numerical and mathematical relativity. | Mature framework, still developing [@wald2001; @iyer_wald1994]. |
| **Page curve / islands / replica wormholes** | Controlled semiclassical and holographic models compute unitary Page curves. | Very influential; general physical interpretation debated [@almheiri_etal2020; @penington_etal2019_replica; @raju2020]. |
| **Holographic QEC and emergent geometry** | Strong formal structure in AdS/CFT; tensor networks and modular flow clarify encoding. | Established inside holographic models; conjectural as universal quantum gravity [@almheiri_dong_harlow2014; @pastawski_etal2015]. |
| **Numerical relativity catalogs and surrogates** | Large catalogs, CCE/CCM, eccentric/precessing surrogates support LVK inference. | High practical influence; mathematical error control remains active [@sxs_catalog2025; @reisswig_etal2009; @blackman_etal2017]. |
| **Black-hole spectroscopy** | GW250114 and future detectors begin resolving multiple QNMs. | Rapidly advancing; inverse problem and environmental effects remain hard [@lvk2025_gw250114_spectroscopy]. |
| **EHT projection/polarization tests** | M87* and Sgr A* images constrain horizon-scale Kerr/plasma models. | Strong observational evidence, model-dependent interpretation [@eht2019_m87_i; @eht2023_sgra_i]. |

Major research clusters include mathematical-relativity PDE groups around Princeton/Oxford/Cambridge/Münster/Columbia-style programs; numerical-relativity collaborations such as SXS, Einstein Toolkit, MAYA/RIT, and LVK waveform groups; observational collaborations LVK and EHT; and quantum-information/holography groups around AdS/CFT, quantum error correction, islands, and modular theory.

---

## 14. Open problems

| Open problem | Why it is hard | What kind of advance may resolve it |
|---|---|---|
| **Full nonlinear stability of Kerr for all \(|a|<M\)** | Combines trapping, superradiance, gauge, modulation, horizon redshift, null infinity, and near-extremal degeneracy. | Uniform decay and nonlinear control across the full subextremal parameter range. |
| **Final-state conjecture** | Even if collapse forms a black hole, proving convergence to Kerr from generic data requires global control of exterior dynamics. | A synthesis of collapse, censorship, and Kerr stability. |
| **Weak cosmic censorship** | Must define “generic” initial data and exclude naked singularities in fully nonlinear GR. | Robust trapped-surface formation plus global exterior completeness/black-hole formation theorems. |
| **Strong cosmic censorship** | Cauchy horizons may be extendible in low regularity but singular in stronger classes. | Correct regularity threshold plus generic blow-up/inextendibility proofs. |
| **Black-hole uniqueness beyond classical assumptions** | Extra fields, AdS boundaries, high dimensions, extremality, and lower regularity produce non-Kerr solutions. | Classification theorems under physically motivated matter/boundary conditions. |
| **Singularity resolution** | Classical GR predicts incompleteness but not a quantum replacement. | Nonperturbative quantum gravity with controlled semiclassical limit. |
| **Information paradox** | Requires reconciling unitary quantum mechanics, semiclassical locality, horizon smoothness, and gravity's constraints. | A mathematically precise evaporation model or nonperturbative quantum-gravity construction. |
| **Microstate counting for realistic black holes** | String theory counts special supersymmetric/extremal cases much better than astrophysical Kerr. | Robust accounting for non-supersymmetric, asymptotically flat, rotating black holes. |
| **Semiclassical backreaction** | Hawking radiation changes geometry; \(\langle T_{\mu\nu}\rangle\) is hard in dynamical spacetimes. | Well-posed semiclassical Einstein equations with controlled renormalization and horizon dynamics. |
| **Rigorous holography** | AdS/CFT is powerful but lacks a fully rigorous mathematical construction in physical dimensions. | Constructive quantum field theory / operator algebraic formulation of holographic duals. |
| **Spacetime Penrose inequality** | Non-time-symmetric initial data include extrinsic curvature and gravitational radiation. | New monotonicity or flow methods handling full constraint data. |
| **Critical collapse thresholds** | Threshold solutions are often naked/self-similar and require nonlinear PDE blow-up analysis. | Rigorous dynamical-systems treatment of Einstein-matter threshold solutions. |
| **Black-hole spectroscopy inverse problem** | QNM spectra are non-self-adjoint and environmentally perturbed; data are noisy and finite. | Stable inverse spectral theory plus next-generation detectors. |
| **Quantum extremal surfaces in realistic gravity** | Islands work in controlled models; asymptotically flat evaporation and factorization are subtle. | Algebraic/gravitational path-integral framework clarifying Hilbert-space factorization. |

---

## 15. Cross-regime comparison

### Transition: plasma → neutron matter → quark matter → black hole

The mathematical transition is:

\[ \text{kinetic/gauge-field matter} \to \text{degenerate nuclear matter} \to \text{nonabelian quark matter} \to \text{causal-boundary geometry}. \]

In plasma, the primary constraints are electromagnetic collective fields and kinetic distributions.
In neutron matter, Pauli exclusion, nuclear forces, beta equilibrium, and gravity dominate.
In quark matter, the ontology shifts to QCD color charge, confinement/deconfinement, chiral symmetry, and color superconductivity.
In black holes, the exterior matter description is compressed into spacetime charges, horizon area, radiation, and causal boundary data.

| Regime | Degrees of freedom | Dominant constraint | Geometry | Field structure | Thermodynamics | Topology | Information | Equations | Computation | Open problem |
|---|---|---|---|---|---|---|---|---|---|
| **Crystal** | Lattice sites, phonons, defects | Translational symmetry / broken symmetry | Euclidean/discrete lattice geometry | Elastic fields, Bloch waves | Low-entropy ordered solid | Defects, dislocations, band topology | Order encoded in periodicity | Schrödinger, elasticity, group theory | DFT, phonons, lattice models | Defects, topology, nonequilibrium growth |
| **Glass** | Disordered local structures | Frustration, kinetic arrest | Amorphous metric/energy landscape | Many metastable configurations | Configurational entropy, aging | Complex landscape topology | Memory in metastable states | Stochastic dynamics, spin glasses | Molecular dynamics, landscape sampling | Glass transition |
| **Fluid** | Continuum density/velocity | Conservation laws | Smooth spatial continuum | Velocity, vorticity | Local equilibrium, transport | Vortex topology | Mixing/transport information | Navier-Stokes/Euler | CFD, turbulence simulation | Turbulence, blow-up |
| **Plasma** | Charged particles, fields | Collective EM interaction | Phase space + spacetime | Maxwell/Vlasov/MHD fields | High-temperature ionized matter | Magnetic topology, reconnection | Distribution functions | Vlasov-Maxwell, MHD | Particle-in-cell, MHD | Turbulence/reconnection |
| **Neutron matter** | Neutrons, protons, leptons, superfluid pairs | Pauli exclusion, nuclear force, beta equilibrium, gravity | Curved stellar spacetime | Nuclear EFT, superfluid fields | Degenerate Fermi thermodynamics | Nuclear pasta, vortices | EOS encodes microphysics | TOV, nuclear EFT, GR hydro | EOS inference, merger simulations | Dense nuclear EOS |
| **Quark matter** | Quarks, gluons, color condensates | Nonabelian gauge symmetry, confinement/deconfinement | Often curved background in stars; QCD phase space | SU(3) gauge fields, chiral/color order | QCD phase diagram, color superconductivity | Topological sectors, vortices | Color/flavor entanglement | QCD, lattice QCD, effective models | Lattice, perturbative QCD, NJL/PNJL | Sign problem, dense QCD |
| **Black hole** | Exterior charges, perturbations, horizon DOF, radiation | Causal exclusion, Einstein constraint equations, entropy bounds | Lorentzian causal geometry | Metric field primary; matter hidden or radiative | Area entropy, Hawking temperature, generalized entropy | Horizon topology, topological censorship | Page curve, QES, holography | Einstein, semiclassical Einstein, QFT on curved spacetime | Numerical relativity, waveform models, QES numerics | Kerr stability, censorship, quantum gravity |

Black holes are thus not “denser quark matter.” They are the mathematical point at which the outside description no longer resolves the collapsed material as a phase.
The exterior theory sees a causal boundary, asymptotic charges, perturbative spectra, entropy, and radiation.

---

## 16. Annotated bibliography

### Foundational causal geometry and singularities

**Penrose, R. “Gravitational Collapse and Space-Time Singularities.” Physical Review Letters 14, 57-59, 1965.
DOI: 10.1103/PhysRevLett.
14.57.** The foundational trapped-surface singularity theorem: under global and energy assumptions, gravitational collapse implies null geodesic incompleteness.
It begins the rigorous black-hole era [@penrose1965].

**Hawking, S.W. and Ellis, G.F.R. *The Large Scale Structure of Space-Time*.
Cambridge University Press, 1973.** The classic reference for Lorentzian geometry, causal structure, conformal infinity, singularity theorems, and exact solutions.
Still the baseline language of mathematical GR [@hawking_ellis1973].

**Landsman, K. “Penrose's 1965 singularity theorem: From geodesic incompleteness to cosmic censorship.” arXiv:2205.01680, 2022.** Clarifies what Penrose's theorem actually proves and how later black-hole/cosmic-censorship interpretations go beyond the theorem [@landsman2022].

**Wald, R.M. “Gravitational Collapse and Cosmic Censorship.” arXiv:gr-qc/9710068, 1997.** A classic conceptual and technical review of weak cosmic censorship and collapse.
Useful for separating theorem, conjecture, and physical expectation [@wald1997].

### Exact solutions, uniqueness, and classification

**Chruściel, P.T., Costa, J.L., and Heusler, M. “Stationary Black Holes: Uniqueness and Beyond.” Living Reviews in Relativity, 2012.** The standard modern review of stationary uniqueness, no-hair theorems, and their assumptions.
Essential for knowing what “Kerr is unique” really means [@chrusciel_costa_heusler2012].

**Emparan, R. and Reall, H.S. “Black Holes in Higher Dimensions.” Living Reviews in Relativity, 2008.** Shows that higher-dimensional black holes break four-dimensional uniqueness/topology intuition through Myers-Perry black holes, rings, strings, and branes [@emparan_reall2008].

**Amsel, A.J. et al. “Uniqueness of extremal Kerr and Kerr-Newman black holes.” Physical Review D, 2010.** Important extremal uniqueness result under stationary, rotating, asymptotically flat, analytic hypotheses with a single degenerate horizon [@amsel2010].

**Hintz, P. “Uniqueness of Kerr-Newman-de Sitter black holes with small angular momenta.” arXiv:1702.05239, 2017.** A modern uniqueness theorem in de Sitter settings using finite regularity rather than analyticity, illustrating the merger of stability and classification techniques [@hintz2017].

### Black-hole formation, stability, and PDE frontier

**Christodoulou, D. *The Formation of Black Holes in General Relativity*.
EMS Monographs, 2009.** A landmark proof program showing trapped-surface formation from regular initial data, making black-hole formation a nonlinear PDE theorem [@christodoulou2009].

**Dafermos, M., Holzegel, G., Rodnianski, I., and Taylor, M. “The non-linear stability of the Schwarzschild family of black holes.” arXiv:2104.08222, 2021.** Major rigorous theorem proving exterior nonlinear stability of Schwarzschild under vacuum perturbations [@dafermos_etal2021_schwarzschild].

**Klainerman, S. and Szeftel, J. “Kerr stability for small angular momentum.” arXiv:2104.11857, 2021.** Central theorem in the slowly rotating Kerr stability program.
It is one of the most important recent achievements in mathematical GR [@klainerman_szeftel2021].

**Giorgi, E., Klainerman, S., and Szeftel, J. “Wave equations estimates and the nonlinear stability of slowly rotating Kerr black holes.” arXiv:2205.14808, 2022.** Completes crucial wave-estimate machinery for slowly rotating Kerr stability [@giorgi_klainerman_szeftel2022].

**Whiting, B.F. “Mode stability of the Kerr black hole.” Journal of Mathematical Physics, 1989.** Foundational mode-stability theorem ruling out exponentially growing separated modes for massless fields on Kerr [@whiting1989].

**Van de Moortel, M. “The Strong Cosmic Censorship conjecture.” 2025.** A modern map of SCC, especially the shift toward regularity-sensitive formulations and Cauchy-horizon analysis [@van_de_moortel2025].

**Dafermos, M. and Luk, J. “The interior of dynamical vacuum black holes I: The \(C^0\)-stability of the Kerr Cauchy horizon.” arXiv:1710.01722, 2017.** Shows why strong cosmic censorship is subtler than simple inextendibility: Cauchy horizons can persist continuously even when curvature blows up [@dafermos_luk2017].

**Gundlach, C., Hilditch, D., and Martín-García, J.M. “Critical Phenomena in Gravitational Collapse.” arXiv:2507.07636, 2025.** Current review of threshold collapse, universality, echoing, self-similar attractors, and naked-singularity issues [@gundlach_hilditch_martin_garcia2025].

### Thermodynamics, entropy, and covariant phase space

**Bekenstein, J.D. “Black Holes and Entropy.” Physical Review D 7, 2333, 1973.** Introduces black-hole entropy and the information-theoretic thermodynamic interpretation [@bekenstein1973].

**Wald, R.M. “The Thermodynamics of Black Holes.” Living Reviews in Relativity, 2001.** Classic review of black-hole mechanics, Hawking radiation, GSL, and entropy interpretation [@wald2001].

**Wald, R.M. “Black hole entropy is the Noether charge.” Physical Review D, 1993.** Establishes the Noether-charge approach to entropy in diffeomorphism-invariant theories [@wald1993].

**Iyer, V. and Wald, R.M. “Some properties of Noether charge and a proposal for dynamical black hole entropy.” Physical Review D, 1994.** Foundational for first-law derivations and generalized entropy formulas beyond stationary Einstein gravity [@iyer_wald1994].

**Harlow, D. and Wu, J.-Q. “Covariant phase space with boundaries.” arXiv:1906.08616, 2019.** Modern treatment of boundary terms, charges, and symplectic structure in gravitational theories [@harlow_wu2019].

### Topology and geometric inequalities

**Friedman, J.L., Schleich, K., and Witt, D.M. “Topological Censorship.” Physical Review Letters, 1993.** Shows that under energy and causality hypotheses, asymptotic observers cannot probe nontrivial spacetime topology [@friedman_schleich_witt1993].

**Galloway, G.J. and Schoen, R. “A generalization of Hawking's black hole topology theorem to higher dimensions.” Communications in Mathematical Physics, 2005.** Proves positive Yamabe type restrictions on higher-dimensional horizon topology [@galloway_schoen2005].

**Dain, S. “Geometric inequalities for black holes.” General Relativity and Gravitation, 2014.** Surveys inequalities among mass, angular momentum, charge, and area, linking them to stability and cosmic censorship [@dain2014].

**Bray, H. “Black holes and the Penrose inequality in general relativity.” arXiv:math/0304261.** Key reference for the Riemannian Penrose inequality and its relation to positive mass [@bray2003].

### Quantum information and holography

**Almheiri, A., Hartman, T., Maldacena, J., Shaghoulian, E., and Tajdini, A. “The entropy of Hawking radiation.” Reviews of Modern Physics 93, 035002, 2021.** The central review of Page curves, islands, generalized entropy, and replica wormholes [@almheiri_etal2020].

**Penington, G., Shenker, S.H., Stanford, D., and Yang, Z. “Replica wormholes and the black hole interior.” JHEP 03, 205, 2022.** Canonical replica-wormhole computation explaining the Page transition in gravitational path integrals [@penington_etal2019_replica].

**Almheiri, A., Dong, X., and Harlow, D. “Bulk Locality and Quantum Error Correction in AdS/CFT.” JHEP, 2015.** Foundational for the view that holographic bulk reconstruction is a quantum error-correcting code [@almheiri_dong_harlow2014].

**Pastawski, F., Yoshida, B., Harlow, D., and Preskill, J. “Holographic quantum error-correcting codes: Toy models for the bulk/boundary correspondence.” JHEP, 2015.** Introduces tensor-network toy models of holographic error correction [@pastawski_etal2015].

**Raju, S. “Lessons from the information paradox.” Physics Reports, 2022.** Important critical perspective emphasizing gravitational constraints, boundary observables, and limitations of naive factorization in massless gravity [@raju2020].

**Geng, H. et al. “Inconsistency of islands in theories with long-range gravity.” JHEP, 2022.** Part of the active debate over how islands should be interpreted in asymptotically flat or long-range-gravity systems [@geng_etal2021].

### Numerical relativity and computation

**Löffler, F. et al. “The Einstein Toolkit: A community computational infrastructure for relativistic astrophysics.” Classical and Quantum Gravity, 2012.** Foundational public infrastructure for numerical relativity, including Cactus/Carpet, BSSN, AMR, and hydrodynamics [@loffler_etal2012].

**SXS Collaboration. “SXS gravitational waveform catalog” updates, 2025.** High-accuracy spectral numerical-relativity waveform catalog central to gravitational-wave modeling [@sxs_catalog2025].

**Reisswig, C. et al. “Characteristic extraction in numerical relativity: binary black hole merger waveforms at null infinity.” arXiv:0912.1285.** Shows how waveforms can be computed at null infinity, reducing finite-radius and gauge systematics [@reisswig_etal2009].

**Recent Cauchy-characteristic matching work, 2024-2025.** Demonstrates successful binary-black-hole evolutions with matching, reducing artificial boundary effects and clarifying late-time tails [@cauchy_characteristic_matching2024].

**Blackman, J. et al. “A surrogate model of gravitational waveforms from numerical relativity simulations of precessing binary black hole mergers.” arXiv:1705.07089, 2017.** Canonical numerical-relativity surrogate model enabling fast parameter inference from expensive simulations [@blackman_etal2017].

### Observational constraints

**LVK Collaboration. “GWTC-5.0: Observations from the Second Part of the Fourth LIGO-Virgo-KAGRA Observing Run and Updates to the Gravitational-Wave Transient Catalog.” arXiv:2605.27225, 2026.** Current gravitational-wave catalog frontier, with O4b candidates and hundreds of compact-binary detections constraining black-hole population and waveform models [@lvk2026_gwtc5].

**LVK Collaboration. “Black Hole Spectroscopy and Tests of General Relativity with GW250114.” arXiv:2509.08099 / Physical Review Letters, 2026.** High-SNR event enabling strong ringdown/Kerr tests and evidence for multiple quasinormal components [@lvk2025_gw250114_spectroscopy].

**LVK Collaboration. “GW250114: Testing Hawking's Area Law and the Kerr Nature of Black Holes.” Physical Review Letters, 2025.** A landmark observational test of the area theorem and Kerr-ringdown structure using a high-SNR binary-black-hole signal [@lvk2025_gw250114_area].

**Event Horizon Telescope Collaboration. “First M87 Event Horizon Telescope Results.” 2019.** First horizon-scale image of a supermassive black-hole candidate; ring diameter and morphology consistent with Kerr plus GRMHD models [@eht2019_m87_i; @eht2019_m87_iv].

**Event Horizon Telescope Collaboration. “First Sagittarius A* Event Horizon Telescope Results.” 2022/2023 arXiv series.** Horizon-scale imaging of the Galactic Center compact object, connecting stellar-orbit mass estimates to projection-scale emission [@eht2023_sgra_i; @eht2023_sgra_iii; @eht2023_sgra_iv].

**EHT polarization results for M87*.** Constrain magnetic-field structure and accretion/jet models near horizons, showing the observational interface is geometry plus plasma [@eht2021_m87_polarization].

---

## Closing synthesis

Black-hole mathematics is not the mathematics of a material compressed until it becomes “very dense.” It is the mathematics of the point at which the external description of matter is absorbed into **causal geometry**.
The central objects become:

\[ (\mathcal M,g),\quad \mathscr I^+,\quad \mathcal H^+,\quad A,\quad \kappa,\quad M,J,Q,\quad S_{\rm gen},\quad \text{radiation algebra}. \]

In classical GR, the frontier is PDE and global Lorentzian geometry: formation, stability, uniqueness, censorship, and singularity.
In numerical relativity, the frontier is controlled computation of nonlinear spacetime dynamics and waveform manifolds.
In observation, the frontier is inverse geometry from waves and images.
In quantum information, the frontier is whether horizon entropy, islands, holography, and error correction amount to a complete microscopic account of spacetime.

The strongest current mathematical picture is therefore:

\[ \textbf{black hole} = \textbf{causal boundary} + \textbf{asymptotic charges} + \textbf{horizon dynamics} + \textbf{entropy/information structure} + \textbf{nonlinear spacetime evolution}. \]

That is the sense in which black holes are the mathematical endpoint beyond dense matter: not a new local substance, but matter's collapse into horizon-governed causal geometry.
