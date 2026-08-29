---
title: "Wang Tiles Through Sheaf Laplacians: Local Matching, Aperiodicity, and Spectral Constraint Geometry"
author:
  - "OpenAI GPT-5.5 Pro"
date: "2026-07-02"
lang: en-US
abstract: |
  This paper uses Wang tiles as a concrete laboratory for understanding what a sheaf Laplacian is and why it is useful. Wang tiles are square tiles with colored edges; valid tilings are global configurations assembled from local color-matching rules. A cellular sheaf is a mathematical device for attaching local data to the cells of a space together with restriction maps that say when neighboring local data agree. The sheaf Laplacian is the quadratic operator that measures the failure of those local agreements. After introducing Wang tilings, symbolic dynamics, cellular sheaves, cohomology, and sheaf Laplacians, the paper builds several sheaf models of Wang constraints, explains what their kernels and spectra mean, and situates this viewpoint in the histories of the domino problem, aperiodic tilings, computational sheaf theory, and recent sheaf-Laplacian machine learning. It closes with current frontiers: minimal aperiodic Wang shifts, arithmetic and toral models, quantum and probabilistic Wang tilings, integer and spectral relaxations, persistent and lattice-valued sheaf Laplacians, and open problems at the interface of undecidability and spectral local-to-global geometry.
keywords:
  - Wang tiles
  - domino problem
  - aperiodic tilings
  - cellular sheaves
  - sheaf Laplacian
  - symbolic dynamics
  - spectral sheaf theory
  - constraint satisfaction
  - topological data analysis
  - graph neural networks
link-citations: true
references:
  - id: wang1961
    type: article-journal
    title: "Proving Theorems by Pattern Recognition — II"
    author:
      - family: Wang
        given: Hao
    issued:
      date-parts:
        - [1961, 1]
    container-title: "The Bell System Technical Journal"
    volume: 40
    issue: 1
    page: "1-41"
    DOI: "10.1002/j.1538-7305.1961.tb03975.x"
  - id: wang1965
    type: article-magazine
    title: "Games, Logic and Computers"
    author:
      - family: Wang
        given: Hao
    issued:
      date-parts:
        - [1965, 11]
    container-title: "Scientific American"
    page: "98-106"
  - id: berger1966
    type: book
    title: "The Undecidability of the Domino Problem"
    author:
      - family: Berger
        given: Robert
    issued:
      date-parts:
        - [1966]
    publisher: "American Mathematical Society"
    collection-title: "Memoirs of the American Mathematical Society"
    number: 66
    page: "1-72"
    DOI: "10.1090/memo/0066"
  - id: robinson1971
    type: article-journal
    title: "Undecidability and Nonperiodicity for Tilings of the Plane"
    author:
      - family: Robinson
        given: Raphael M.
    issued:
      date-parts:
        - [1971]
    container-title: "Inventiones Mathematicae"
    volume: 12
    page: "177-209"
    DOI: "10.1007/BF01418780"
  - id: grunbaumShephard1987
    type: book
    title: "Tilings and Patterns"
    author:
      - family: Grünbaum
        given: Branko
      - family: Shephard
        given: G. C.
    issued:
      date-parts:
        - [1987]
    publisher: "W. H. Freeman"
    publisher-place: "New York"
  - id: kari1996
    type: article-journal
    title: "A Small Aperiodic Set of Wang Tiles"
    author:
      - family: Kari
        given: Jarkko
    issued:
      date-parts:
        - [1996]
    container-title: "Discrete Mathematics"
    volume: 160
    issue: "1-3"
    page: "259-264"
    DOI: "10.1016/0012-365X(95)00120-L"
  - id: culik1996
    type: article-journal
    title: "An Aperiodic Set of 13 Wang Tiles"
    author:
      - family: Culik
        given: Karel
        suffix: II
    issued:
      date-parts:
        - [1996]
    container-title: "Discrete Mathematics"
    volume: 160
    issue: "1-3"
    page: "245-251"
    DOI: "10.1016/S0012-365X(96)00118-5"
  - id: jeandelRao2021
    type: article-journal
    title: "An Aperiodic Set of 11 Wang Tiles"
    author:
      - family: Jeandel
        given: Emmanuel
      - family: Rao
        given: Michaël
    issued:
      date-parts:
        - [2021]
    container-title: "Advances in Combinatorics"
    page: "Paper No. 1, 37 pp."
    DOI: "10.19086/aic.18614"
  - id: hochmanMeyerovitch2010
    type: article-journal
    title: "A Characterization of the Entropies of Multidimensional Shifts of Finite Type"
    author:
      - family: Hochman
        given: Michael
      - family: Meyerovitch
        given: Tom
    issued:
      date-parts:
        - [2010]
    container-title: "Annals of Mathematics"
    volume: 171
    issue: 3
    page: "2011-2038"
    DOI: "10.4007/annals.2010.171.2011"
  - id: labbe2021substitutive
    type: article-journal
    title: "Substitutive Structure of Jeandel–Rao Aperiodic Tilings"
    author:
      - family: Labbé
        given: Sébastien
    issued:
      date-parts:
        - [2021]
    container-title: "Discrete & Computational Geometry"
    volume: 65
    issue: 3
    page: "800-855"
    DOI: "10.1007/s00454-019-00153-3"
  - id: labbe2021markov
    type: article-journal
    title: "Markov Partitions for Toral Z2-Rotations Featuring Jeandel–Rao Wang Shift and Model Sets"
    author:
      - family: Labbé
        given: Sébastien
    issued:
      date-parts:
        - [2021]
    container-title: "Annales Henri Lebesgue"
    volume: 4
    page: "283-324"
    DOI: "10.5802/ahl.73"
  - id: labbeMannMcLoudMann2023
    type: article-journal
    title: "Nonexpansive Directions in the Jeandel–Rao Wang Shift"
    author:
      - family: Labbé
        given: Sébastien
      - family: Mann
        given: Casey
      - family: McLoud-Mann
        given: Jennifer
    issued:
      date-parts:
        - [2023]
    container-title: "Discrete and Continuous Dynamical Systems"
    volume: 43
    issue: 9
    page: "3213-3250"
    DOI: "10.3934/dcds.2023046"
  - id: labbe2023metallic1
    type: manuscript
    title: "Metallic Mean Wang Tiles I: Self-Similarity, Aperiodicity and Minimality"
    author:
      - family: Labbé
        given: Sébastien
    issued:
      date-parts:
        - [2023]
    archive: "arXiv"
    archive_location: "2312.03652"
    URL: "https://arxiv.org/abs/2312.03652"
  - id: labbe2024metallic2
    type: manuscript
    title: "Metallic Mean Wang Tiles II: The Dynamics of an Aperiodic Computer Chip"
    author:
      - family: Labbé
        given: Sébastien
    issued:
      date-parts:
        - [2024]
    archive: "arXiv"
    archive_location: "2403.03197"
    URL: "https://arxiv.org/abs/2403.03197"
  - id: kariLabbeMostert2026
    type: manuscript
    title: "An Aperiodic Set of Wang Tiles for Every Quadratic Irrational"
    author:
      - family: Kari
        given: Jarkko
      - family: Labbé
        given: Sébastien
      - family: Mostert
        given: Pieter
    issued:
      date-parts:
        - [2026]
    archive: "arXiv"
    archive_location: "2606.24693"
    URL: "https://arxiv.org/abs/2606.24693"
  - id: caretteMoutot2023
    type: manuscript
    title: "Aperiodicity in Quantum Wang Tilings"
    author:
      - family: Carette
        given: Titouan
      - family: Moutot
        given: Etienne
    issued:
      date-parts:
        - [2023]
    archive: "arXiv"
    archive_location: "2302.04503"
    URL: "https://arxiv.org/abs/2302.04503"
  - id: tyburecZeman2023
    type: article-journal
    title: "Bounded Wang Tilings with Integer Programming and Graph-Based Heuristics"
    author:
      - family: Tyburec
        given: Marek
      - family: Zeman
        given: Jan
    issued:
      date-parts:
        - [2023]
    container-title: "Scientific Reports"
    volume: 13
    page: "4865"
    DOI: "10.1038/s41598-023-31786-3"
  - id: cohen2003
    type: article-journal
    title: "Wang Tiles for Image and Texture Generation"
    author:
      - family: Cohen
        given: Michael F.
      - family: Shade
        given: Jonathan
      - family: Hiller
        given: Stefan
      - family: Deussen
        given: Oliver
    issued:
      date-parts:
        - [2003]
    container-title: "ACM Transactions on Graphics"
    volume: 22
    issue: 3
    page: "287-294"
    DOI: "10.1145/882262.882265"
  - id: winfree1998
    type: article-journal
    title: "Design and Self-Assembly of Two-Dimensional DNA Crystals"
    author:
      - family: Winfree
        given: Erik
      - family: Liu
        given: Furong
      - family: Wenzler
        given: Lisa A.
      - family: Seeman
        given: Nadrian C.
    issued:
      date-parts:
        - [1998]
    container-title: "Nature"
    volume: 394
    issue: 6693
    page: "539-544"
    DOI: "10.1038/28998"
  - id: mao2000
    type: article-journal
    title: "Logical Computation Using Algorithmic Self-Assembly of DNA Triple-Crossover Molecules"
    author:
      - family: Mao
        given: Chengde
      - family: LaBean
        given: Thomas H.
      - family: Reif
        given: John H.
      - family: Seeman
        given: Nadrian C.
    issued:
      date-parts:
        - [2000]
    container-title: "Nature"
    volume: 407
    issue: 6803
    page: "493-496"
    DOI: "10.1038/35035038"
  - id: godement1958
    type: book
    title: "Topologie algébrique et théorie des faisceaux"
    author:
      - family: Godement
        given: Roger
    issued:
      date-parts:
        - [1958]
    publisher: "Hermann"
    publisher-place: "Paris"
  - id: bredon1997
    type: book
    title: "Sheaf Theory"
    edition: 2
    author:
      - family: Bredon
        given: Glen E.
    issued:
      date-parts:
        - [1997]
    publisher: "Springer"
    publisher-place: "New York"
    collection-title: "Graduate Texts in Mathematics"
    number: 170
    DOI: "10.1007/978-1-4612-0647-7"
  - id: kashiwaraSchapira1990
    type: book
    title: "Sheaves on Manifolds"
    author:
      - family: Kashiwara
        given: Masaki
      - family: Schapira
        given: Pierre
    issued:
      date-parts:
        - [1990]
    publisher: "Springer"
    publisher-place: "Berlin"
    collection-title: "Grundlehren der mathematischen Wissenschaften"
    number: 292
    DOI: "10.1007/978-3-662-02661-8"
  - id: curry2014
    type: thesis
    title: "Sheaves, Cosheaves and Applications"
    author:
      - family: Curry
        given: Justin Michael
    issued:
      date-parts:
        - [2014]
    genre: "PhD thesis"
    publisher: "University of Pennsylvania"
    archive: "arXiv"
    archive_location: "1303.3255"
    URL: "https://arxiv.org/abs/1303.3255"
  - id: curryGhristNanda2016
    type: article-journal
    title: "Discrete Morse Theory for Computing Cellular Sheaf Cohomology"
    author:
      - family: Curry
        given: Justin
      - family: Ghrist
        given: Robert
      - family: Nanda
        given: Vidit
    issued:
      date-parts:
        - [2016]
    container-title: "Foundations of Computational Mathematics"
    volume: 16
    issue: 4
    page: "875-897"
    DOI: "10.1007/s10208-015-9266-8"
  - id: hansenGhrist2019
    type: article-journal
    title: "Toward a Spectral Theory of Cellular Sheaves"
    author:
      - family: Hansen
        given: Jakob
      - family: Ghrist
        given: Robert
    issued:
      date-parts:
        - [2019]
    container-title: "Journal of Applied and Computational Topology"
    volume: 3
    issue: 4
    page: "315-358"
    DOI: "10.1007/s41468-019-00038-7"
  - id: hansen2020
    type: thesis
    title: "Laplacians of Cellular Sheaves: Theory and Applications"
    author:
      - family: Hansen
        given: Jakob
    issued:
      date-parts:
        - [2020]
    genre: "PhD thesis"
    publisher: "University of Pennsylvania"
  - id: ghristRiess2020
    type: manuscript
    title: "Cellular Sheaves of Lattices and the Tarski Laplacian"
    author:
      - family: Ghrist
        given: Robert
      - family: Riess
        given: Hans
    issued:
      date-parts:
        - [2020]
    archive: "arXiv"
    archive_location: "2007.04099"
    URL: "https://arxiv.org/abs/2007.04099"
  - id: hansenGebhart2020
    type: manuscript
    title: "Sheaf Neural Networks"
    author:
      - family: Hansen
        given: Jakob
      - family: Gebhart
        given: Thomas
    issued:
      date-parts:
        - [2020]
    archive: "arXiv"
    archive_location: "2012.06333"
    URL: "https://arxiv.org/abs/2012.06333"
  - id: bodnar2022
    type: paper-conference
    title: "Neural Sheaf Diffusion: A Topological Perspective on Heterophily and Oversmoothing in GNNs"
    author:
      - family: Bodnar
        given: Cristian
      - family: Di Giovanni
        given: Francesco
      - family: Chamberlain
        given: Benjamin Paul
      - family: Liò
        given: Pietro
      - family: Bronstein
        given: Michael M.
    issued:
      date-parts:
        - [2022]
    container-title: "Advances in Neural Information Processing Systems"
    volume: 35
    archive: "arXiv"
    archive_location: "2202.04579"
    URL: "https://arxiv.org/abs/2202.04579"
  - id: barbero2022
    type: paper-conference
    title: "Sheaf Neural Networks with Connection Laplacians"
    author:
      - family: Barbero
        given: Federico
      - family: Bodnar
        given: Cristian
      - family: Sáez de Ocáriz Borde
        given: Haitz
      - family: Bronstein
        given: Michael
      - family: Veličković
        given: Petar
      - family: Liò
        given: Pietro
    issued:
      date-parts:
        - [2022]
    container-title: "Proceedings of Topological, Algebraic, and Geometric Learning Workshops 2022"
    collection-title: "Proceedings of Machine Learning Research"
    volume: 196
    page: "28-36"
    publisher: "PMLR"
    URL: "https://proceedings.mlr.press/v196/barbero22a.html"
  - id: wei2025
    type: article-journal
    title: "Persistent Sheaf Laplacians"
    author:
      - family: Wei
        given: Xiaoqi
    issued:
      date-parts:
        - [2025]
    container-title: "Foundations of Data Science"
    DOI: "10.3934/fods.2024033"
  - id: choi2026
    type: article-journal
    title: "Sheaf Graph Neural Networks via PAC-Bayes Spectral Optimization"
    author:
      - family: Choi
        given: Yoonhyuk
      - family: Choi
        given: Jiho
      - family: Ko
        given: Taewook
      - family: Kim
        given: JongWook
    issued:
      date-parts:
        - [2026]
    container-title: "Proceedings of the AAAI Conference on Artificial Intelligence"
    volume: 40
    issue: 25
    page: "20570-20578"
    DOI: "10.1609/aaai.v40i25.39193"
  - id: ribeiro2026
    type: manuscript
    title: "Gaussian Sheaf Neural Networks"
    author:
      - family: Ribeiro
        given: André
      - family: Tenório
        given: Ana Luiza
      - family: da Silva
        given: Tiago
      - family: Mesquita
        given: Diego
    issued:
      date-parts:
        - [2026]
    archive: "arXiv"
    archive_location: "2605.21435"
    URL: "https://arxiv.org/abs/2605.21435"
type: research-article

---

# Wang Tiles Through Sheaf Laplacians

## 1. Thesis and orientation

Wang tiles are among the simplest mathematical objects that force one to confront the difference between *local consistency* and *global existence*. A Wang tile is a unit square whose four edges carry colors. A finite tile set is placed on the integer grid, without rotations or reflections, and a tiling is valid when adjacent edges have equal colors. The rules are brutally local: each horizontal or vertical adjacency checks only two edge colors. Yet the global questions generated by those rules are among the central examples of undecidability in twentieth-century mathematics: given a finite tile set, is there a valid tiling of the whole plane? If there is one, must there be a periodic one? Hao Wang asked these questions in the context of theorem proving and machine computation [@wang1961; @wang1965]. Robert Berger answered them by proving the domino problem undecidable and, in the process, producing aperiodic Wang tile sets [@berger1966].

A sheaf Laplacian is also about the passage from local data to global consistency. A sheaf assigns data spaces to pieces of a space and maps that compare data on incident pieces. A global section is a choice of local data everywhere that satisfies every compatibility map. The sheaf Laplacian is the linear operator whose quadratic form is the total inconsistency energy. For a graph-valued sheaf, it generalizes the graph Laplacian: the ordinary graph Laplacian penalizes neighboring scalar values for being different, while a sheaf Laplacian penalizes neighboring values after they are translated into a common comparison space [@hansenGhrist2019].

The central idea of this paper is that Wang tilings are a natural, almost pedagogically perfect, example of sheaf-theoretic thinking. On a finite patch of the square grid, attach the set of tiles to each cell and the set of edge colors to each adjacency. The restriction maps send a tile to the color exposed on the relevant side. A global section of this set-valued sheaf is exactly a valid Wang tiling. Linearize the sets into vector spaces, and the resulting sheaf Laplacian has an energy

\[
E(x)=\sum_{\text{horizontal }u\sim v}\|P_E x_u-P_Wx_v\|^2
+\sum_{\text{vertical }u\sim v}\|P_Nx_u-P_Sx_v\|^2,
\]

where \(P_E,P_W,P_N,P_S\) read the east, west, north, and south colors of a tile-choice vector. True tilings are integer, one-hot, zero-energy states. The sheaf Laplacian is therefore not a magic device that defeats undecidability; it is a spectral relaxation, diagnostic, and organizing language for the local-to-global structure of Wang constraints.

The paper proceeds in layers. First it defines Wang tiles and the domino problem. Second it gives a self-contained explanation of cellular sheaves and sheaf Laplacians. Third it constructs sheaves from Wang tile rules and explains what kernels, spectra, harmonic projections, and cohomology mean in this setting. Fourth it gives a genealogy of Wang tiles, aperiodic tiling, sheaf theory, and spectral sheaf theory. Finally it surveys current frontiers, with emphasis on where a sheaf-Laplacian perspective might contribute rather than merely rephrase known facts.

## 2. Wang tiles: local constraints with global consequences

### 2.1 Basic definitions

Fix finite sets of horizontal and vertical colors. A Wang tile may be written as

\[
t=(N(t),E(t),S(t),W(t)),
\]

where \(N,E,S,W\) record the colors on the north, east, south, and west sides. A finite tile set \(T\) is a finite subset of such quadruples. A configuration is a function

\[
\tau:\mathbb Z^2\to T.
\]

It is a valid Wang tiling if, for every \((i,j)\in\mathbb Z^2\),

\[
E(\tau(i,j))=W(\tau(i+1,j)), \qquad
N(\tau(i,j))=S(\tau(i,j+1)).
\]

The no-rotation convention is important. A tile is not a shape up to Euclidean motion; it is a labeled state with a fixed orientation. The geometry of the square grid is thus subordinate to the combinatorics of colored boundary interfaces.

The *domino problem* asks whether, given \(T\), there exists at least one valid tiling \(\mathbb Z^2\to T\). A tiling is periodic if there is a nonzero vector \(p\in\mathbb Z^2\) such that \(\tau(z+p)=\tau(z)\) for every \(z\). Equivalently, a periodic tiling descends to a tiling of a finite torus \(\mathbb Z_m\times\mathbb Z_n\) after possibly choosing two independent periods. A finite tile set is aperiodic if it tiles the plane but admits no periodic tiling.

The definitions are elementary; the consequences are not. Wang showed that a decision procedure for the domino problem would follow from the hypothesis that every tileable finite set has a periodic tiling [@wang1961]. Berger disproved that periodicity hypothesis by proving undecidability and constructing a tile set that can tile only nonperiodically [@berger1966]. The domino problem became a canonical bridge between logic, computation, symbolic dynamics, and geometry.

### 2.2 Wang shifts and finite type constraints

A Wang tile set defines a two-dimensional shift of finite type. Give \(T^{\mathbb Z^2}\) the product topology, and let \(\mathbb Z^2\) act by translations. The valid tilings form a closed, shift-invariant subset

\[
\Omega_T=\{\tau\in T^{\mathbb Z^2}:\text{ all matching equations hold}\}.
\]

Because the forbidden patterns are exactly the adjacent mismatches, \(\Omega_T\) is a subshift of finite type (SFT). In one dimension, SFTs are governed by finite directed graphs: nonemptiness is decidable, and the existence of a bi-infinite path is equivalent to the existence of a cycle. In two dimensions, the analogous finite-type local description no longer yields decidability. Rows can be treated as states of a large transducer, but the relevant state space grows without a uniform finite bound for the infinite plane.

This symbolic-dynamical viewpoint is essential for modern work. It separates three levels of question:

1. **Local admissibility:** Which finite patterns can appear without violating edge rules?
2. **Global existence:** Is \(\Omega_T\) nonempty?
3. **Dynamical structure:** If nonempty, what are the periodic points, entropy, invariant measures, minimal subsystems, nonexpansive directions, and factor maps?

The frontier has moved from merely finding small aperiodic sets to describing the internal dynamics of particular Wang shifts. The Jeandel–Rao tile set, minimal in number of tiles and colors, is now studied not just as a witness to a theorem but as a structured dynamical system [@jeandelRao2021; @labbe2021substitutive; @labbeMannMcLoudMann2023].

### 2.3 Compactness and the finite-board shadow

For a finite rectangular patch \(\Lambda\subset\mathbb Z^2\), a finite Wang tiling problem is an ordinary finite constraint satisfaction problem. One can introduce binary variables \(x_{v,t}\in\{0,1\}\) for \(v\in\Lambda\), \(t\in T\), require \(\sum_t x_{v,t}=1\), and impose edge-color compatibility between neighboring cells. Modern integer programming formulations and graph heuristics use exactly this finite-board viewpoint [@tyburecZeman2023].

The infinite problem is the inverse limit of its finite shadows. By compactness, \(\Omega_T\neq\emptyset\) if and only if every finite patch can be tiled, with appropriate interpretation of boundaries. Consequently, non-tileability has finite obstructions, but tileability need not have a periodic finite certificate. Aperiodicity is precisely the phenomenon that all finite windows are compatible with some global tiling, while every finite torus quotient fails to capture a periodic global solution.

This is the first place where sheaves enter naturally. Finite patches are finite cell complexes or finite graphs. Local tile/color compatibility is exactly the kind of data a cellular sheaf records. The infinite plane is then approached as a limit of finite sheaf problems.

## 3. What a sheaf Laplacian is

### 3.1 The sheaf idea in ordinary language

A sheaf is a formalism for local data that can be restricted, compared, and glued. In classical topology, one might assign to each open set \(U\) the ring of continuous real-valued functions on \(U\). A function on a large open set restricts to functions on smaller open sets; conversely, functions defined on pieces glue to a function on the union when they agree on overlaps. This local-to-global principle is the heart of sheaf theory [@godement1958; @bredon1997; @kashiwaraSchapira1990].

For computation, one usually replaces arbitrary open sets by a finite cell complex: vertices, edges, faces, and higher-dimensional cells. A *cellular sheaf* assigns a data object to each cell and maps between data objects of incident cells. In applied topology, the data objects are often finite-dimensional vector spaces, and the maps are linear [@curry2014; @curryGhristNanda2016].

For a graph \(G=(V,E)\), a cellular sheaf \(\mathcal F\) of real vector spaces consists of

- a vector space \(\mathcal F(v)\) for each vertex \(v\),
- a vector space \(\mathcal F(e)\) for each edge \(e\), and
- for each incident pair \(v\le e\), a linear map
  \[
  \rho_{v\to e}:\mathcal F(v)\to\mathcal F(e).
  \]

The map \(\rho_{v\to e}\) says how data at vertex \(v\) is seen from, or reported to, the comparison space on edge \(e\). A vertex assignment \(x=(x_v)_{v\in V}\) is a global section if for every edge \(e=uv\),

\[
\rho_{u\to e}x_u=\rho_{v\to e}x_v.
\]

The ordinary graph Laplacian is recovered when every vertex and edge stalk is \(\mathbb R\), and every restriction map is the identity. Then global sections are locally constant functions, and on a connected graph they are constant functions.

### 3.2 Cochains, coboundary, and cohomology

For a finite cell complex \(X\), a cellular sheaf \(\mathcal F\) assigns a vector space \(\mathcal F(\sigma)\) to every cell \(\sigma\). The \(k\)-cochains are direct sums over \(k\)-cells:

\[
C^k(X;\mathcal F)=\bigoplus_{\dim \sigma=k}\mathcal F(\sigma).
\]

After choosing orientations, the coboundary

\[
\delta_k:C^k(X;\mathcal F)\to C^{k+1}(X;\mathcal F)
\]

is built by summing restriction maps with incidence signs. Schematically,

\[
(\delta_k c)_\tau=
\sum_{\sigma\prec\tau}[\tau:\sigma]\,\rho_{\sigma\to\tau}(c_\sigma),
\]

where \(\sigma\prec\tau\) means that \(\sigma\) is a codimension-one face of \(\tau\), and \([\tau:\sigma]\in\{\pm1\}\) is the incidence sign.

The condition \(\delta_{k+1}\delta_k=0\) lets one define sheaf cohomology:

\[
H^k(X;\mathcal F)=\ker \delta_k/\operatorname{im}\delta_{k-1}.
\]

In degree zero,

\[
H^0(X;\mathcal F)=\ker \delta_0,
\]

which is the vector space of global sections. Higher cohomology measures obstructions and residual degrees of freedom that cannot be represented as globally consistent lower-dimensional data.

For Wang tiles on a finite board, \(H^0\) is the natural home of relaxed compatible tile/color assignments. Higher cohomology becomes meaningful when one introduces edge observations, periodic boundary conditions, defects, or multi-scale patch data. It can record cyclic inconsistencies, fault-line degrees of freedom, and constraints that cannot be solved by local reassignments.

### 3.3 The sheaf Laplacian

Equip each stalk \(\mathcal F(\sigma)\) with an inner product. Then every coboundary \(\delta_k\) has an adjoint \(\delta_k^*\). The \(k\)-th sheaf Laplacian is

\[
L_k=\delta_k^*\delta_k+\delta_{k-1}\delta_{k-1}^*.
\]

The degree-zero sheaf Laplacian is especially important:

\[
L_0=\delta_0^*\delta_0.
\]

Its quadratic form is

\[
\langle x,L_0x\rangle=\|\delta_0x\|^2.
\]

Thus \(L_0\) measures the total squared failure of a vertex assignment to be a global section. On a graph, if an edge \(e=uv\) is oriented from \(u\) to \(v\), then

\[
(\delta x)_e=\rho_{v\to e}x_v-\rho_{u\to e}x_u,
\]

and therefore

\[
\langle x,L_0x\rangle
=\sum_{e=uv}\|\rho_{u\to e}x_u-\rho_{v\to e}x_v\|^2.
\]

This formula is the most important one for intuition. A sheaf Laplacian is a sum of local disagreement penalties. Its kernel is the space of perfect agreements; its small eigenvalues represent flexible, low-energy modes; its large eigenvalues represent stiff modes that produce high local inconsistency.

Hansen and Ghrist framed this as a spectral theory of cellular sheaves: an extension of spectral graph theory in which the graph Laplacian is only the simplest, identity-restriction case [@hansenGhrist2019]. In applications, sheaf Laplacians support denoising, harmonic extension, diffusion, effective resistance, sparsification, approximation, and learning on relational data. In sheaf neural networks, the sheaf Laplacian becomes the diffusion operator for graph data whose relationships are not well modeled by scalar averaging [@hansenGebhart2020; @bodnar2022; @barbero2022].

## 4. Sheaf models of Wang tile constraints

### 4.1 A set-valued sheaf whose global sections are exactly tilings

Let \(\Lambda\subset\mathbb Z^2\) be a finite rectangular board. Build an adjacency graph \(G_\Lambda\): vertices are board cells, horizontal edges connect horizontally adjacent cells, and vertical edges connect vertically adjacent cells.

Define a sheaf-like constraint object as follows:

- At every vertex \(v\), the stalk is the finite set \(T\) of tiles.
- At every horizontal edge \(e=uv\), the edge stalk is the set \(C_h\) of horizontal interface colors.
- At every vertical edge \(e=uv\), the edge stalk is the set \(C_v\) of vertical interface colors.
- If \(e=uv\) is horizontal with \(u\) to the left of \(v\), the maps are
  \[
  \rho_{u\to e}(t)=E(t),\qquad \rho_{v\to e}(t)=W(t).
  \]
- If \(e=uv\) is vertical with \(u\) below \(v\), the maps are
  \[
  \rho_{u\to e}(t)=N(t),\qquad \rho_{v\to e}(t)=S(t).
  \]

A global section is a tile assignment \(\tau:V(G_\Lambda)\to T\) such that the two reports to every edge agree. This is exactly a valid Wang tiling of the finite board.

This construction is conceptually clean, but its stalks are finite sets, not vector spaces. Classical sheaf Laplacians require additive structure and inner products. There are three standard responses.

First, one can keep the exact set-valued sheaf and study global sections directly. This is the faithful discrete constraint model.

Second, one can linearize the sets by taking free vector spaces. This gives a vector-space sheaf and hence a genuine sheaf Laplacian, but it is a relaxation: the kernel contains real linear combinations, not only one-hot tile choices.

Third, one can move to order- or lattice-valued sheaves and use nonlinear analogues such as the Tarski Laplacian, whose fixed points recover global consistency in certain lattice-valued settings [@ghristRiess2020]. This direction is especially natural for Wang tiles because colors, tiles, admissible sets, and partial information all form finite ordered structures.

### 4.2 Linearizing the Wang sheaf

Let \(\mathbb R^T\) be the vector space with basis \(\{e_t:t\in T\}\), and let \(\mathbb R^{C_h}\), \(\mathbb R^{C_v}\) be color-vector spaces. Define linear maps by their action on tile basis vectors:

\[
P_E e_t=e_{E(t)},\quad P_W e_t=e_{W(t)},\quad
P_N e_t=e_{N(t)},\quad P_S e_t=e_{S(t)}.
\]

For a finite board \(\Lambda\), a relaxed tile field is a vector

\[
x=(x_v)_{v\in\Lambda}\in \bigoplus_{v\in\Lambda}\mathbb R^T.
\]

For a horizontal edge from \(v\) to \(v+\hat x\), the disagreement is

\[
P_E x_v-P_W x_{v+\hat x}.
\]

For a vertical edge from \(v\) to \(v+\hat y\), it is

\[
P_N x_v-P_S x_{v+\hat y}.
\]

The Wang sheaf energy is

\[
E_T(x)=
\sum_{v,v+\hat x\in\Lambda}\|P_E x_v-P_W x_{v+\hat x}\|^2+
\sum_{v,v+\hat y\in\Lambda}\|P_N x_v-P_S x_{v+\hat y}\|^2.
\]

There is a block-sparse symmetric positive semidefinite matrix \(L_{T,\Lambda}\) such that

\[
E_T(x)=x^T L_{T,\Lambda}x.
\]

This is the degree-zero sheaf Laplacian of the linearized Wang sheaf. Its off-diagonal blocks encode which tile colors are compared across each adjacency, and its diagonal blocks encode the accumulated comparison maps incident to each site.

A true finite tiling is a vector \(x\) with each \(x_v\) a standard basis vector and \(E_T(x)=0\). The Laplacian equation \(L_{T,\Lambda}x=0\) is necessary but not sufficient for a true tiling, because it permits fractional or signed linear combinations. A more exact finite formulation is

\[
\begin{aligned}
&x_v\in\{0,1\}^{T},\qquad \sum_{t\in T}x_{v,t}=1,\qquad v\in\Lambda,\\
&E_T(x)=0.
\end{aligned}
\]

Equivalently, the sheaf Laplacian supplies the quadratic consistency term, while the Wang problem supplies integrality and simplex constraints.

This distinction is not a defect. It is the same distinction that makes spectral graph theory useful for hard discrete graph problems. The graph Laplacian does not solve every graph coloring or cut problem exactly; it gives relaxations, certificates, smoothness energies, and geometry. The Wang sheaf Laplacian plays the analogous role for edge-matching constraints.

### 4.3 A face-to-edge sheaf on the square cellulation

The adjacency-graph construction treats each board cell as a graph vertex. A more geometric construction uses the square cellulation itself. Attach tile data to square faces and color data to edges. A square face reports its four edge colors to its boundary edges. A global section chooses a tile for every square and a color for every grid edge so that each tile's reported boundary colors agree with the shared edge colors.

Depending on the convention for cellular sheaves, this construction may be described as a sheaf, a cosheaf, or a sheaf on the opposite face poset. The mathematics is unchanged: the incidence pattern is face-to-edge, and the compatibility equations are exactly the Wang matching rules. This version has two advantages.

First, it represents shared edge colors explicitly. If one has noisy observations of colors on grid edges, the sheaf can reconcile tile choices and edge-color observations simultaneously.

Second, it generalizes to tilings on other cell complexes, surfaces, and quotient spaces. On a torus, a global section is a periodic Wang tiling with the chosen period lattice. On a cylinder or annulus, cohomological information can distinguish boundary-compatible local patterns from globally extendable ones.

### 4.4 Periodic tilings as torus sheaf sections

A \((m,n)\)-periodic Wang tiling is a tiling of the finite torus

\[
\mathbb Z_m\times\mathbb Z_n.
\]

Construct the same Wang sheaf on this toroidal graph or cellulation. Exact set-valued global sections are exactly \((m,n)\)-periodic tilings. Linearized harmonic sections are relaxed periodic tilings.

This gives a compact sheaf-theoretic restatement of Wang's original periodicity conjecture:

> If the inverse limit of finite-plane Wang sheaf sections over all finite patches is nonempty, then some finite torus Wang sheaf has an exact global section.

Berger's theorem says this statement is false [@berger1966]. Aperiodic tile sets are precisely finite local sheaves whose infinite-plane section space is nonempty but whose finite-torus exact section spaces are all empty.

The spectral version is subtler. For a fixed torus size, \(\ker L_{T,m,n}\) records relaxed periodic compatibility. A positive spectral gap above the kernel measures stiffness of the relaxed constraint system on that torus. But no uniform finite spectral computation over all tori can decide the infinite domino problem in full generality, because that would contradict undecidability. The sheaf Laplacian changes the geometry of the problem; it does not erase the recursion-theoretic boundary.

### 4.5 Defects, frustration, and least-squares repair

Real applications often involve partial, noisy, or impossible constraints. Suppose we observe a tentative tile-vector field \(y\) on a finite board and want the nearest relaxed consistent field. The harmonic projection solves

\[
\min_{x\in\ker L_{T,\Lambda}}\|x-y\|^2.
\]

If boundary conditions or measurements force inconsistency, one instead solves

\[
\min_x \|x-y\|^2+\lambda x^TL_{T,\Lambda}x.
\]

This is a Tikhonov-regularized sheaf problem: it balances fidelity to observations against local matching. The residual \(\delta x\) is a defect field on adjacencies. Large residuals localize mismatches; low-energy extended residuals suggest fault lines.

For aperiodic tilings, this viewpoint is potentially useful because many aperiodic systems exhibit hierarchical or quasiperiodic organization. Defects are not random local failures; they often propagate along structured directions. In the Jeandel–Rao Wang shift, for example, nonexpansive directions and Conway-worm-like structures are part of the dynamical description [@labbeMannMcLoudMann2023]. A sheaf Laplacian on finite approximants can turn such qualitative structure into spectra, harmonic modes, and localized residual analysis.

## 5. What the spectrum means for Wang constraints

### 5.1 Kernel: relaxed global sections

The nullspace of \(L_{T,\Lambda}\) is \(\ker\delta\), the vector space of relaxed global sections. If \(x\in\ker L_{T,\Lambda}\), then every neighboring pair reports the same interface color in the linearized color spaces. When \(x_v\) is a probability vector over tiles, the equation says that adjacent marginal distributions induce the same distribution on their shared edge color. This is weaker than saying that a sampled tile assignment will match almost surely, but it is stronger than ignoring local compatibility entirely.

This suggests a hierarchy of relaxations:

1. **Exact set-valued section:** each site is a tile, all colors match.
2. **Integral vector section:** each site is a one-hot basis vector in \(\ker L\).
3. **Probabilistic section:** each site is a probability vector, and adjacent color marginals agree.
4. **Linear section:** each site is an arbitrary real vector in \(\ker L\).

The gap between levels is mathematically important. A tile set can have many relaxed sections on a finite board even when exact sections are scarce. Conversely, a large relaxed kernel may reveal symmetries or redundancies in colors that exact combinatorics later breaks.

### 5.2 Small eigenvalues: soft modes and near-tilings

The smallest nonzero eigenvalues of \(L_{T,\Lambda}\) measure the least expensive ways to violate consistency. In an ordinary graph Laplacian, small eigenvalues correspond to slowly varying functions and bottlenecks. In a Wang sheaf Laplacian, they correspond to slowly varying tile mixtures whose edge-color reports almost agree.

Several interpretations are possible.

- A low-energy eigenvector may represent a large-scale ambiguity between families of patches.
- It may reveal a boundary mode: a pattern that can be changed near the edge with little interior cost.
- On periodic domains, it may reveal a quasiperiodic or fault-line direction.
- For random or designed tile sets, it may indicate robustness: a large spectral gap means local mismatch penalties quickly force global coherence in the relaxed model.

These interpretations must be checked against the exact discrete problem. Spectral modes are not tilings; they are tangent-like directions in a linearized constraint geometry. Their value is diagnostic and algorithmic.

### 5.3 Higher cohomology: residuals not explained by tile potentials

In degree one, cochains live on adjacencies or edges. A one-cochain can be interpreted as a field of interface discrepancies, edge observations, or transition data. The quotient

\[
H^1=\ker\delta_1/\operatorname{im}\delta_0
\]

identifies closed residuals modulo those produced by changing vertex tile fields. On a simply connected finite rectangle with a simple graph sheaf, \(H^1\) may be trivial or uninformative. On a torus, annulus, punctured domain, or multi-layer patch complex, \(H^1\) becomes more interesting. It can record global cycles of incompatibility that cannot be removed by local tile changes.

This is one reason the square-cellulation model is richer than the adjacency graph alone. If face, edge, and vertex data all appear, then cohomology can distinguish tile-face choices, edge-color choices, and corner or cycle defects. For Wang tiles, which constrain only edge adjacencies, adding such structure may look artificial at first. But in applications such as texture synthesis, molecular self-assembly, or materials microstructure, one often has additional geometry: boundary curves, overlap constraints, corner labels, defects, and measured fields. Sheaves give a language in which all these data types can coexist.

### 5.4 Spectra in the thermodynamic limit

For a sequence of boards \(\Lambda_k\nearrow\mathbb Z^2\), one may ask whether the empirical spectral distributions of \(L_{T,\Lambda_k}\) converge, and whether the limit detects dynamical features of \(\Omega_T\): entropy, unique ergodicity, minimality, substitutive structure, or nonexpansive directions. This is largely an open program rather than a settled theory.

The analogy is with spectral theory on periodic and aperiodic operators. Periodic structures yield band spectra; quasiperiodic structures yield more delicate spectral phenomena; random structures yield integrated density of states. A Wang sheaf Laplacian supplies a family of block operators determined by local matching rules. For aperiodic tile sets, especially those now known to have toral or substitution models, it is natural to ask whether sheaf spectra see the same arithmetic and dynamical invariants that symbolic dynamics sees by other means.

## 6. Genealogy of Wang tiles and aperiodicity

### 6.1 Wang's theorem-proving origin

Wang introduced the tiles that now bear his name while studying mechanical theorem proving and pattern recognition [@wang1961]. The point was not recreational tiling. It was the reduction of logical and computational questions to local symbolic constraints. The grid became a medium for computation: rows can encode configurations, adjacent rows can encode transitions, and local tile rules can enforce legal evolution.

This computational origin explains why Wang tiles still feel modern. They are finite local constraint systems, like cellular automata, constraint satisfaction problems, subshifts of finite type, and local Hamiltonians. They are geometry made from syntax.

### 6.2 Berger and the undecidability of the domino problem

Berger's proof that the domino problem is undecidable is the foundational event [@berger1966]. The proof showed that no algorithm can decide, for every finite Wang tile set, whether it tiles the plane. It also destroyed Wang's periodicity conjecture. If every tileable set had a periodic tiling, one could enumerate finite tori until finding a periodic certificate, while finite obstructions witness non-tileability by compactness. That would make the domino problem decidable. Since it is undecidable, some tileable sets must tile only aperiodically.

The original construction was large, but size was not the conceptual point. The conceptual point was that local matching rules can simulate unbounded computation. The plane is not merely a surface; it is an infinite spacetime diagram.

### 6.3 Robinson and hierarchical aperiodicity

Robinson simplified the undecidability and nonperiodicity story and introduced hierarchical tilings that are easier to visualize and reason about [@robinson1971]. A common method for proving aperiodicity is to force structures at larger and larger scales. If every valid tiling contains a hierarchy of supertiles, and the hierarchy has no translation symmetry compatible with all scales, then no tiling can be periodic.

This hierarchical paradigm connects Wang tiles to substitution tilings, Penrose tilings, quasicrystals, and aperiodic order [@grunbaumShephard1987]. It also resonates with sheaf theory: local data are forced to glue into increasingly rigid global patterns, and obstructions to periodicity arise from the way local compatibilities propagate across scales.

### 6.4 The small-tile race: Kari, Culik, Jeandel–Rao

After Berger, a long line of work sought smaller aperiodic Wang tile sets. Kari produced a 14-tile aperiodic set using transducer and number-theoretic ideas [@kari1996]. Culik produced a 13-tile set [@culik1996]. The milestone result is Jeandel and Rao's 11-tile, 4-color set, together with a proof that no aperiodic Wang tile set exists with at most 10 tiles or with at most 3 colors [@jeandelRao2021].

This result changed the character of the subject. The minimal cardinality question was settled, but the structure of the minimal set became a new object of study. Labbé showed substitutive structure in Jeandel–Rao tilings, including a minimal subshift whose tilings decompose into a finite set of larger patches [@labbe2021substitutive]. Later work identified nonexpansive directions as topological invariants and connected these directions to irrational rotations [@labbeMannMcLoudMann2023].

### 6.5 Symbolic dynamics, entropy, and computability

Wang shifts are two-dimensional SFTs, and the theory of multidimensional SFTs is deeply shaped by computability. Hochman and Meyerovitch proved a striking characterization: the entropies of multidimensional SFTs are exactly the nonnegative right recursively enumerable real numbers [@hochmanMeyerovitch2010]. This places entropy itself in the same computational universe as the domino problem.

From a sheaf-Laplacian perspective, this is a warning and an opportunity. It warns that no finite-dimensional spectral invariant can classify all Wang shifts in a decidable way. But it also suggests that spectral approximants may encode computable shadows of noncomputable global structure, much as finite patch counts approximate entropy from above.

### 6.6 Wang tiles outside pure tiling theory

Wang tiles became useful because they compress local compatibility into reusable modules. In computer graphics, they support nonperiodic texture generation: one precomputes tile interiors whose boundaries match, then assembles large nonrepeating textures efficiently [@cohen2003]. In molecular self-assembly, DNA sticky ends can play the role of colored edges; DNA tiles can assemble into algorithmic patterns, connecting Wang's formal tiles to physical computation [@winfree1998; @mao2000].

In both cases, exact infinite-plane tileability is not the only problem. One wants finite, robust, controllable assemblies under noise, boundary conditions, and design objectives. This is precisely where sheaf Laplacians are attractive: they quantify inconsistency, support least-squares repair, and integrate heterogeneous constraints.

## 7. Genealogy of sheaf Laplacians

### 7.1 From sheaves to cellular sheaves

Sheaves arose in algebraic topology and geometry as a way to organize local data and cohomological obstructions. Classical sheaf theory was developed through the work of Leray, Cartan, Godement, Grothendieck, and many others; it became a standard language for algebraic geometry, complex geometry, and topology [@godement1958; @bredon1997; @kashiwaraSchapira1990].

The applied and computational turn required finiteness. Cellular sheaves replace arbitrary open covers by cell complexes and replace infinite-dimensional function spaces by finite-dimensional vector spaces or other combinatorial data. Curry's thesis developed cellular sheaves and cosheaves for applications in data analysis, sensor networks, and persistence [@curry2014]. Curry, Ghrist, and Nanda developed discrete Morse methods for computing cellular sheaf cohomology efficiently [@curryGhristNanda2016].

### 7.2 From graph Laplacians to sheaf Laplacians

The graph Laplacian is one of the most useful operators in modern applied mathematics. It measures disagreement across edges, drives diffusion, defines smoothness, supports spectral clustering, and encodes connectivity. But it assumes that neighboring data live in the same space and should be compared by subtraction.

Many systems violate that assumption. A sensor network may have sensors with different coordinate frames. A social network may transmit transformed or filtered opinions. A graph learning problem may require edge-dependent feature alignment. A Wang tiling compares not tile identities but edge colors; the east side of one tile is compared with the west side of another.

The sheaf Laplacian generalizes the graph Laplacian by inserting restriction maps before subtraction. Hansen and Ghrist formulated a spectral theory of cellular sheaves, proving analogues and extensions of graph-spectral ideas such as interlacing, sparsification, effective resistance, and approximation [@hansenGhrist2019]. Hansen's dissertation developed the theory and applications further [@hansen2020].

### 7.3 Sheaf diffusion and graph learning

Sheaf neural networks use the sheaf Laplacian as a diffusion operator on graphs with structured relational data. Hansen and Gebhart introduced sheaf neural networks as a generalization of graph convolution based on sheaf Laplacians [@hansenGebhart2020]. Bodnar and collaborators showed how neural sheaf diffusion addresses heterophily and oversmoothing, two failures of ordinary graph neural networks [@bodnar2022]. Barbero and collaborators introduced connection-Laplacian sheaves built from geometric alignment of tangent spaces [@barbero2022].

The relevance to Wang tiles is not that one should immediately train a neural network to solve the domino problem. The relevance is conceptual: sheaf Laplacians provide a general mechanism for learning, estimating, or designing the comparison maps that define local compatibility. Wang tiles supply one of the cleanest exact examples of edge-dependent local comparison.

### 7.4 Beyond vector spaces: lattice and persistent sheaf Laplacians

Vector-space sheaves are powerful but not always faithful to discrete constraints. Wang tiles are finite-state objects. Linearization introduces superpositions that exact tiling theory does not contain. Lattice-valued sheaves and the Tarski Laplacian offer one path toward a more intrinsically order-theoretic Hodge theory, with fixed points corresponding to global sections in degree zero [@ghristRiess2020].

Another frontier is persistence. Persistent sheaf Laplacians extend persistent topological Laplacians to cellular sheaves, allowing spectra to fuse geometric and non-geometric information across scales [@wei2025]. This is relevant to Wang tilings whenever tile patterns are sampled at multiple resolutions, or when one studies finite patches growing toward an infinite aperiodic limit.

## 8. Current frontiers around Wang tiles

### 8.1 Minimal aperiodic Wang shifts after Jeandel–Rao

The Jeandel–Rao set settled the minimal cardinality problem, but it opened a structural program. What is the full dynamical anatomy of the Jeandel–Rao Wang shift? Which subsystems are minimal? How do substitutions, markers, fault lines, and nonexpansive directions interact? Labbé's substitutive analysis and subsequent work on nonexpansive directions show that the minimal 11-tile set has rich internal order [@labbe2021substitutive; @labbeMannMcLoudMann2023].

A sheaf-Laplacian program here would study finite approximants of the Jeandel–Rao sheaf and ask whether low-energy modes detect the known nonexpansive directions, substitutions, or model-set factors. The goal would not be to reprove minimality but to produce computable spectral signatures of the dynamical structure.

### 8.2 Arithmetic tilings: metallic means and quadratic irrationals

Recent work has expanded the arithmetic side of Wang tilings. Metallic mean Wang tiles form families whose dynamics involve quadratic irrational inflation factors and toral rotations [@labbe2023metallic1; @labbe2024metallic2]. Kari, Labbé, and Mostert have proposed a broad construction of aperiodic Wang tile sets associated with quadratic irrationals, using stripe densities and a geometric criterion involving quadrilaterals and parabolas [@kariLabbeMostert2026].

This is a natural meeting point for sheaf Laplacians and aperiodic order. Stripe densities are global averages constrained by local tile equations. A sheaf Laplacian on finite patches already measures local equation failure; one can augment it with cochains representing stripe counts, fluxes, or height functions. The resulting harmonic and low-energy modes may connect local matching spectra to irrational rotation factors.

### 8.3 Quantum, probabilistic, and tensor Wang tilings

Classical Wang tiles are deterministic finite states. Probabilistic and quantum generalizations replace exact tile choices by distributions, amplitudes, or tensors. Carette and Moutot introduced quantum Wang tilings in which interference can suppress periodic patterns and produce aperiodicity phenomena not visible in the underlying classical tile set [@caretteMoutot2023].

Sheaf Laplacians are already linear-algebraic, so they are well suited to such generalizations. A quantum Wang sheaf would attach Hilbert spaces to cells and comparison maps to adjacencies; its Laplacian would be a Hamiltonian-like frustration operator. This connects the domino problem to the language of local Hamiltonians, tensor networks, and quantum many-body constraints.

### 8.4 Optimization on bounded boards

Most practical Wang tiling problems are finite. They ask for a patch satisfying design criteria, boundary conditions, packing rules, or near-validity objectives. Integer programming formulations handle exact finite constraints, maximum coverage, and variants with additional tile/color constraints [@tyburecZeman2023].

The sheaf-Laplacian contribution is to separate the quadratic local-consistency geometry from integrality. One can use spectra to precondition integer programs, detect decomposable components, identify likely defect regions, or design continuous relaxations that feed rounding algorithms. The ordinary graph coloring literature has long benefited from spectral relaxations; Wang tilings deserve analogous spectral tooling.

### 8.5 Materials, textures, and molecular self-assembly

In graphics, Wang tiles are tools for nonperiodic synthesis [@cohen2003]. In DNA self-assembly, they are physical computational primitives [@winfree1998; @mao2000]. In materials engineering, finite Wang tilings can encode microstructures and stochastic reconstructions. These applied settings introduce noise, manufacturing errors, finite boundaries, and multi-objective design.

A sheaf model can combine tile matching with measured fields: colors, boundary geometry, material phase, stress, curvature, orientation, or DNA binding strengths. A sheaf Laplacian then gives an energy landscape for compatibility. In exact mathematics, a mismatch is forbidden; in engineering, mismatch has cost. Sheaf Laplacians are designed for that intermediate regime.

## 9. Current frontiers around sheaf Laplacians

### 9.1 Learning the sheaf, not only the signal

Early graph Laplacian methods assume the graph and edge comparisons are given. Sheaf neural networks often learn restriction maps from data, making the sheaf itself part of the model [@bodnar2022]. Connection-Laplacian approaches estimate orthogonal maps from geometric structure [@barbero2022]. Recent work continues to regularize, constrain, and interpret learned sheaf Laplacians, including Bayesian, PAC-Bayes, polynomial, and geometric variants [@choi2026; @ribeiro2026].

For Wang tiles, this suggests inverse problems. Given examples of valid or nearly valid patches, can one infer edge colors or tile rules? Given observed materials, can one learn a Wang-like local grammar? The sheaf-Laplacian formulation makes these questions differentiable after relaxation.

### 9.2 Nonlinear and order-valued Laplacians

The vector-space sheaf Laplacian is not the final word. Many compatibility systems are discrete, logical, ordered, or lattice-valued. Wang tiles are a prime example. Tarski-style Laplacians for lattice-valued sheaves suggest a way to retain more of the exact finite-state structure while preserving an operator-theoretic local-to-global principle [@ghristRiess2020].

An important open direction is to build practical nonlinear sheaf Laplacians for finite constraint systems that interpolate between exact global-section search and smooth spectral relaxation. Such operators could support message passing, monotone iteration, and certificate extraction.

### 9.3 Persistent sheaf spectra

Persistent sheaf Laplacians allow one to track sheaf spectra across a filtration [@wei2025]. For Wang tilings, filtrations arise from expanding windows, increasing periodic torus sizes, adding constraint layers, or coarse-to-fine substitutions. A persistent spectrum might distinguish tile sets whose finite patches look similar at small scales but diverge in long-range organization.

This is particularly appealing for aperiodic tilings. Aperiodicity is invisible in any single bounded patch considered in isolation: every patch that occurs in a periodic tiling can be locally legal. What matters is how patch constraints persist and transform across scale. Persistent sheaf spectra could provide a quantitative language for this scale dependence.

### 9.4 Sheaf Laplacians and undecidability

A mature theory must respect the hard boundary imposed by Berger's theorem. There can be no algorithm that takes an arbitrary Wang tile set and decides, by finite spectral computations alone, whether it tiles the plane. But undecidability does not make spectral theory irrelevant. It clarifies what spectral theory can and cannot promise.

Reasonable goals include:

- finite-board diagnostics and optimization;
- spectral invariants for specific families of tile sets;
- approximation schemes for entropy or defect density;
- certificates for nonexistence on finite domains;
- heuristic discovery of aperiodic structure;
- quantitative comparison of known aperiodic shifts;
- operator limits for substitutions, toral factors, and model sets.

The goal is not to defeat undecidability. The goal is to understand the geometry of local consistency in the cases where mathematics, computation, or applications provide additional structure.

## 10. Worked construction: the Wang sheaf Laplacian on a finite board

This section gives the construction in enough detail to implement it.

Let \(\Lambda=\{1,\dots,m\}\times\{1,
\dots,n\}\). Let \(|T|=q\). Let \(C_x\) be the set of colors used on east/west edges, and \(C_y\) the set of colors used on north/south edges. Define four matrices

\[
P_E,P_W\in\{0,1\}^{|C_x|\times q},\qquad
P_N,P_S\in\{0,1\}^{|C_y|\times q}
\]

by

\[
(P_E)_{c,t}=1\iff E(t)=c,
\]

and similarly for \(P_W,P_N,P_S\).

Index the global vector \(x\in\mathbb R^{qmn}\) by site and tile. For every horizontal adjacency \(e=(v,v+\hat x)\), create a row block

\[
B_e x=P_E x_v-P_Wx_{v+\hat x}\in\mathbb R^{|C_x|}.
\]

For every vertical adjacency \(e=(v,v+\hat y)\), create

\[
B_e x=P_N x_v-P_Sx_{v+\hat y}\in\mathbb R^{|C_y|}.
\]

Stack all \(B_e\) into a matrix \(B\). Then

\[
L_{T,\Lambda}=B^TB.
\]

The exact finite tiling problem is

\[
\text{find }x\in\{0,1\}^{qmn}
\quad\text{such that}\quad
\sum_{t=1}^q x_{v,t}=1\text{ for all }v,
\quad Bx=0.
\]

The relaxed harmonic problem is

\[
\text{find }x\in\mathbb R^{qmn}\text{ such that }L_{T,\Lambda}x=0.
\]

The probabilistic relaxation adds

\[
x_{v,t}\ge 0,
\qquad \sum_t x_{v,t}=1.
\]

This probabilistic relaxation says neighboring sites agree on the distribution of their shared edge color. It is often much easier than exact tiling, but it may admit solutions even when no exact tiling exists.

Boundary conditions are added by extra comparison edges to fixed color stalks. Periodic boundary conditions are added by including wrap-around adjacencies. Defect penalties with unequal importance are obtained by weighting edge blocks: \(L=B^TWB\) with \(W\succeq0\). This allows anisotropic costs, noisy colors, or physical binding strengths.

## 11. How this perspective reframes classical questions

### 11.1 The domino problem

Classically:

> Given \(T\), is \(\Omega_T\neq\emptyset\)?

Sheaf-theoretically:

> Does the inverse system of exact finite Wang sheaves over larger and larger patches have a global section in the inverse limit?

Spectrally:

> What can be inferred from the sequence of finite sheaf Laplacians \(L_{T,\Lambda_k}\), together with integrality constraints, as \(\Lambda_k\nearrow\mathbb Z^2\)?

The last question is not decidable in general, but it is rich for families with substitution, transducer, or toral structure.

### 11.2 Aperiodicity

Classically:

> \(T\) is aperiodic if \(\Omega_T\neq\emptyset\) and no element of \(\Omega_T\) is periodic.

Sheaf-theoretically:

> The infinite-plane exact Wang sheaf has sections, but no exact Wang sheaf on any finite torus has a section.

Spectrally:

> The finite-torus exact kernels are empty after integrality, but relaxed torus kernels and low-energy modes may still reveal the obstruction pattern: hierarchy, irrational slope, transducer drift, or toral rotation.

### 11.3 Entropy

Classically, entropy measures the exponential growth rate of admissible finite patches. For multidimensional SFTs, possible entropy values have a computability-theoretic characterization [@hochmanMeyerovitch2010].

Sheaf-theoretically, admissible patches are exact local sections. A speculative but natural program is to compare patch-count entropy with spectral quantities: dimension of relaxed kernels, determinant-like invariants of Laplacians, and asymptotic distributions of small eigenvalues. The relation cannot be exact in full generality, but for structured families it may be revealing.

### 11.4 Defect tolerance

Classically, a Wang tiling is valid or invalid. In applications, one often asks how invalid it is. The sheaf Laplacian supplies a canonical answer once comparison spaces and norms are chosen. The energy \(x^TLx\) is total mismatch. Weighted variants encode physical costs or design priorities.

This suggests a continuum from pure logic to applied optimization:

\[
\text{exact tiling}\quad\longrightarrow\quad
\text{minimum-defect tiling}\quad\longrightarrow\quad
\text{relaxed harmonic field}\quad\longrightarrow\quad
\text{learned compatibility model}.
\]

## 12. Open problems and research directions

### 12.1 Spectral signatures of known aperiodic sets

Compute and compare the finite-board and finite-torus sheaf spectra of Berger-type, Robinson-type, Kari–Culik, Jeandel–Rao, Ammann, and metallic-mean Wang tile sets. Which spectral features distinguish hierarchical, transducer, substitution, and toral mechanisms of aperiodicity? Do nonexpansive directions appear as anisotropic low-energy bands?

### 12.2 Exact-versus-relaxed gap

For a finite board \(\Lambda\), define the relaxation gap between the existence of probabilistic harmonic sections and exact one-hot sections. Can this gap be bounded for special classes of tile sets? Can it predict finite-board hardness? Can additional local moment constraints tighten the sheaf relaxation without returning immediately to full integer programming?

### 12.3 Sheaf cohomology of patch complexes

Instead of assigning data only to sites and adjacencies, build a complex whose cells are admissible patches ordered by inclusion. The resulting sheaf or cosheaf may encode extension obstructions directly. How does its cohomology relate to recognizability, substitution, fault lines, and minimal components of Wang shifts?

### 12.4 Persistent spectra across scale

For a nested sequence of windows or substitution supertiles, compute persistent sheaf Laplacian spectra. Do aperiodic systems show persistent low-energy features absent from periodic systems? Can persistent spectra distinguish different minimal subsystems of the same Wang shift?

### 12.5 Lattice-valued Wang Laplacians

Develop a finite-set or lattice-valued Laplacian whose fixed points are exact Wang tilings or exact partial-information closures. The Tarski Laplacian suggests one route [@ghristRiess2020]. A Wang-specific version could support monotone propagation of possible tile sets, arc consistency, and global-section approximation in one operator-theoretic package.

### 12.6 Inverse Wang problems

Given samples of patches, infer a tile set and colors that explain them. This is grammar induction for local two-dimensional constraints. A differentiable sheaf-Laplian relaxation could learn color maps, tile embeddings, or compatibility spaces before discretization. Applications include texture synthesis, materials discovery, and coarse-grained modeling of self-assembly.

### 12.7 Quantum and operator-algebraic Wang sheaves

Quantum Wang tilings suggest Hilbert-space-valued constraints with interference [@caretteMoutot2023]. Sheaf Laplacians can be interpreted as frustration Hamiltonians. What is the relationship between quantum aperiodicity, local Hamiltonian complexity, and sheaf cohomology? Can sheaf-theoretic harmonic spaces classify zero-energy quantum tiling states?

## 13. Conclusion

Wang tiles and sheaf Laplacians are both technologies for thinking about local-to-global structure. Wang tiles show that finite local rules can encode unbounded computation, force aperiodicity, and generate rich symbolic dynamics. Sheaf Laplacians show how local compatibility maps become operators, energies, kernels, spectra, and cohomological obstructions.

The sheaf Laplacian does not solve the domino problem. It should not be oversold as a spectral escape from undecidability. Its value is different: it gives a precise linear-algebraic geometry for Wang constraints on finite domains, a bridge to optimization and data analysis, and a language for comparing exact discrete tilings with relaxed, noisy, probabilistic, or learned compatibility systems.

At the current frontier, Wang tilings are no longer only examples in logic textbooks. Minimal aperiodic sets, toral factors, metallic means, quadratic irrational constructions, quantum generalizations, and finite optimization problems are active subjects. Sheaf Laplacians are likewise moving from pure topology into learning, persistence, nonlinear order-valued systems, and applied networks. Their intersection is fertile because it respects both sides: the exact combinatorial hardness of Wang tiles and the spectral local-to-global insight of sheaf theory.

The guiding slogan is simple:

> A Wang tiling is a global section of a local color-matching sheaf; a sheaf Laplacian is the operator that measures how far a proposed tiling is from being one.

That slogan is not the end of the theory. It is the beginning of a research program.
