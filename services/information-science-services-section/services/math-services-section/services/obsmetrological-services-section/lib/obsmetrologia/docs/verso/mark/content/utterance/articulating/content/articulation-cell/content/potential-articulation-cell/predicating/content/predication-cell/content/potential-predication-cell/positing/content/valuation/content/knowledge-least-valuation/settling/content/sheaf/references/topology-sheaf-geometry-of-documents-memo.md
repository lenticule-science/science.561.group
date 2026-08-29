# Research memo: topology, sheaves, and geometry of textual/documentary structure

## 0. Thesis

A document is not naturally “a manifold” or “a vector space.” But documents and corpora **can** be modeled rigorously as spaces once one specifies:

1. a **base object**: linearly ordered spans, a section/paragraph poset, a citation graph, a discourse graph, a hyperlink network, a simplicial complex, or an embedding point cloud;
2. a **category of data** attached to that base: sets, vector spaces, logical theories, probability distributions, embeddings, annotations, claims, entity records;
3. **incidence, restriction, aggregation, or gluing maps** between local pieces;
4. **invariants or operators**: connected components, homology, sheaf cohomology, graph/sheaf Laplacians, persistence diagrams, spectral decompositions, curvature-like graph quantities.

The strongest non-metaphorical formalisms are: finite posets/Alexandrov spaces for document hierarchy; graphs and hypergraphs for citation, hyperlink, discourse, and entity relations; simplicial/cell complexes for multiway relations and stratified document structure; sheaves/cosheaves for local-to-global consistency; and metric or embedding spaces for corpus geometry and TDA. Classical graph, hypergraph, algebraic-topological, and sheaf-theoretic definitions are standard in Diestel, Bretto, Hatcher, and Bredon; applied finite sheaf/cosheaf versions are developed by Curry, Ghrist, Hansen, Robinson, and others. ([daiwz.net](https://daiwz.net/course/disc_math/2023/Diestel_Graph_Theory.pdf?utm_source=chatgpt.com))

---

## 1. Formal definitions

### 1.1 Graph

A **graph** is a pair \(G=(V,E)\), where \(V\) is a set of vertices and \(E\) is a set of edges. For an undirected simple graph, \(E\subseteq \{\{u,v\}:u,v\in V,\ u\neq v\}\). For a directed graph, \(E\subseteq V\times V\). A weighted graph also has a weight function \(w:E\to \mathbb R_{\ge 0}\).

For documents, vertices may be sentences, paragraphs, claims, named entities, documents, articles, authors, citations, webpages, or wiki pages. Edges may represent adjacency, reference, support, contradiction, hyperlinking, citation, semantic similarity, or discourse relation.

This is not a metaphor when the relation is explicitly defined. A citation graph, hyperlink graph, sentence-similarity graph, or discourse-dependency graph is literally a graph. PageRank, HITS, TextRank, LexRank, and spectral clustering all exploit this graph structure rather than an informal “network” analogy. ([snap.stanford.edu](https://snap.stanford.edu/class/cs224w-readings/Brin98Anatomy.pdf?utm_source=chatgpt.com))

### 1.2 Hypergraph

A **hypergraph** is a pair \(H=(V,\mathcal E)\), where \(V\) is a vertex set and \(\mathcal E\subseteq \mathcal P(V)\setminus\{\varnothing\}\) is a family of nonempty subsets of \(V\), called hyperedges. Unlike graph edges, a hyperedge may connect any finite number of vertices. Bretto treats hypergraphs as systems of finite sets, which is exactly the right abstraction for many documentary relations. ([math.ucdavis.edu](https://www.math.ucdavis.edu/~saito/data/tensor/bretto_hypergraph-theory.pdf?utm_source=chatgpt.com))

For documents, hyperedges naturally represent:

- one paragraph invoking several claims;
- one citation supporting several sentences;
- one entity appearing across many documents;
- one topic shared by many articles;
- one bibliography item connecting cited paper, citing paper, claim, author, date, and venue.

A hypergraph is often more honest than a graph when the relation is genuinely multiway and not decomposable into pairwise links.

### 1.3 Simplicial complex

An **abstract simplicial complex** \(K\) on a vertex set \(V\) is a collection of finite nonempty subsets of \(V\) such that if \(\sigma\in K\) and \(\tau\subseteq \sigma\), \(\tau\neq\varnothing\), then \(\tau\in K\). Elements \(\sigma\in K\) are simplices; a simplex with \(p+1\) vertices is a \(p\)-simplex.

A graph \(G\) gives a simplicial complex by taking its **clique complex**: every complete subgraph on \(p+1\) vertices becomes a \(p\)-simplex. A corpus may also generate a complex by declaring a set of documents to span a simplex when they share an entity, keyword, citation, topic, or fall below a distance threshold in embedding space.

Simplicial complexes are useful for documents when multiway overlap matters. A triangle in a citation or topic complex is not merely three pairwise edges; it records a three-way relation. Homology of such complexes can detect connected components, loops, and higher-dimensional holes in the incidence structure. Standard algebraic topology gives the chain complexes, boundary maps, homology groups, and functoriality used here. ([pi.math.cornell.edu](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf?utm_source=chatgpt.com))

### 1.4 Cell complex and stratified space

A **cell complex** is built by gluing cells of different dimensions along their boundaries. For finite documentary structures, a regular cell complex or finite incidence poset is usually enough: cells may represent tokens, spans, paragraphs, figures, sections, tables, footnotes, citations, and cross-reference interfaces.

A **stratified space** is a space decomposed into pieces, or strata, usually of different dimensions or types, satisfying frontier conditions. Documents are rarely manifolds, but they are often stratified: title, abstract, body sections, notes, quotations, diagrams, citations, marginalia, page regions, and metadata are different strata with different local rules.

This is especially apt for real documentary artifacts: a PDF page, an annotated manuscript, a web article, or a wiki page has textual strata, layout strata, link strata, metadata strata, and reference strata. Constructible sheaf theory was designed for data that is locally constant on strata but changes across strata. Treumann’s exit-path formulation and Curry/Patel’s entrance-path formulation justify replacing a stratified space by a finite categorical/combinatorial model when the sheaf is constructible. ([arxiv.org](https://arxiv.org/abs/0708.0659?utm_source=chatgpt.com))

### 1.5 Sheaf

Let \(X\) be a topological space and \(\mathcal C\) a category, often sets, vector spaces, groups, modules, or logical theories. A **sheaf** \(\mathcal F\) on \(X\) assigns:

- to every open set \(U\subseteq X\), an object \(\mathcal F(U)\), called the sections over \(U\);
- to every inclusion \(V\subseteq U\), a restriction map  
  \[
  \rho^U_V:\mathcal F(U)\to \mathcal F(V),
  \]
  satisfying identity and composition laws;
- a locality and gluing axiom: compatible local sections over an open cover glue uniquely to a section over the union.

For documents, \(X\) may be a document hierarchy, discourse graph, citation complex, or corpus topology. \(\mathcal F(U)\) may be possible interpretations, claims, entity assignments, annotations, embeddings, local theories, summaries, or evidence records over region \(U\).

The sheaf axiom is directly relevant to document interpretation: local readings of paragraphs, figures, citations, and claims are globally coherent exactly when they agree on overlaps or interfaces. Bredon gives the classical sheaf-cohomological background; Curry, Robinson, Ghrist, and Hansen develop finite and applied versions usable on graphs and cell complexes. ([link.springer.com](https://link.springer.com/book/10.1007/978-1-4612-0647-7?utm_source=chatgpt.com))

### 1.6 Cosheaf

A **cosheaf** is the covariant dual of a sheaf. Informally, instead of restricting global data down to local pieces, a cosheaf pushes or aggregates local data upward. Formally, a precosheaf assigns objects \(\mathcal G(U)\) to opens \(U\) and extension maps \(\mathcal G(U)\to \mathcal G(V)\) for \(U\subseteq V\), satisfying a dual gluing condition, often expressed by colimits.

For documents, sheaves model compatibility of interpretations; cosheaves model accumulation of evidence, annotations, references, or summaries from local pieces to larger wholes. Curry’s work is especially relevant because it treats cellular sheaves and cosheaves as finite linear-algebraic devices over cell complexes and connects constructible cosheaves with entrance-path categories. ([arxiv.org](https://arxiv.org/abs/1303.3255?utm_source=chatgpt.com))

### 1.7 Cellular sheaf

Let \(X\) be a finite cell complex or a graph. A **cellular sheaf** \(\mathcal F\) assigns a vector space \(\mathcal F(\sigma)\), called a stalk, to each cell \(\sigma\), and a linear restriction map along each incidence relation. On a graph, this usually means:

- each vertex \(v\) has a vector space \(\mathcal F(v)\);
- each edge \(e\) has a vector space \(\mathcal F(e)\);
- for each incident pair \(v\le e\), there is a map  
  \[
  \rho_{v,e}:\mathcal F(v)\to \mathcal F(e).
  \]

A 0-cochain is a choice \(x_v\in \mathcal F(v)\) for every vertex. It is a **global section** when, for every edge \(e=uv\),

\[
\rho_{u,e}(x_u)=\rho_{v,e}(x_v).
\]

For documents, \(x_v\) may be the interpretation of a paragraph, article, webpage, or claim; the edge stalk \(\mathcal F(e)\) may be the shared interface: cited proposition, common entity, discourse relation, translation schema, or metadata constraint. Cellular sheaves are valuable because they turn “local consistency” into finite linear algebra. Hansen and Ghrist explicitly extend spectral graph theory to cellular sheaves via sheaf Laplacians. ([arxiv.org](https://arxiv.org/abs/1808.01513?utm_source=chatgpt.com))

### 1.8 Laplacian

For a weighted undirected graph with adjacency matrix \(W=(w_{ij})\) and degree matrix \(D\), the **graph Laplacian** is

\[
L=D-W.
\]

Its quadratic form is

\[
x^\top Lx=\sum_{i<j} w_{ij}(x_i-x_j)^2.
\]

Thus \(L\) measures roughness or disagreement of a scalar signal over adjacent vertices. The multiplicity of the zero eigenvalue equals the number of connected components, and low eigenvectors are used in spectral clustering and graph partitioning. Chung and von Luxburg are standard references for spectral graph theory and spectral clustering. ([fanchung.ucsd.edu](https://fanchung.ucsd.edu/research/cbms.pdf?utm_source=chatgpt.com))

For a cellular sheaf, the coboundary operator \(\delta^k\) maps \(k\)-cochains to \((k+1)\)-cochains, and the **sheaf Hodge Laplacian** is

\[
\Delta^k_{\mathcal F}
=
(\delta^k)^*\delta^k+\delta^{k-1}(\delta^{k-1})^*.
\]

For \(k=0\), \(\ker \Delta^0_{\mathcal F}\) is the space of harmonic 0-cochains, which corresponds to globally consistent assignments under standard finite-dimensional inner-product assumptions. This is why sheaf Laplacians are directly relevant to consistency of annotations, claims, citation interfaces, or local interpretations. ([arxiv.org](https://arxiv.org/abs/1808.01513?utm_source=chatgpt.com))

### 1.9 Persistent homology

A **filtered simplicial complex** is a nested family

\[
K_0\subseteq K_1\subseteq K_2\subseteq \cdots .
\]

Applying homology gives maps

\[
H_k(K_i)\to H_k(K_j), \qquad i\le j.
\]

**Persistent homology** studies which homology classes are born at one scale and die at another. The output is often a barcode or persistence diagram. For corpora, the filtration may come from a similarity threshold on document embeddings, a citation-weight threshold, a time-evolving archive, or a topic-overlap scale.

Carlsson frames TDA as a way of extracting qualitative shape from high-dimensional data; Edelsbrunner–Letscher–Zomorodian and Zomorodian–Carlsson provide foundational algorithms and algebraic structure; Chazal, de Silva, and Oudot provide stability results for geometric complexes. ([ams.org](https://www.ams.org/bull/2009-46-02/S0273-0979-09-01249-X/?utm_source=chatgpt.com))

### 1.10 Metric and embedding space

A **metric space** is a pair \((X,d)\), where \(d:X\times X\to\mathbb R_{\ge 0}\) satisfies non-negativity, identity of indiscernibles, symmetry, and the triangle inequality. An **embedding** of documents is a map

\[
f:\mathrm{Docs}\to M
\]

into a metric or geometric space \(M\), such as \(\mathbb R^n\), a unit sphere, a hyperbolic ball, or a learned representation space.

Vector embeddings are legitimate geometric objects only after the metric is specified. Cosine similarity is not itself a metric on all vectors, though angular distance on normalized vectors is. Euclidean, spherical, hyperbolic, and graph-geodesic geometries make different assumptions. Word2vec, GloVe, BERT, and SBERT provide influential embedding constructions, but their geometry is learned and task-dependent, not an automatic topology of meaning. ([arxiv.org](https://arxiv.org/abs/1301.3781?utm_source=chatgpt.com))

---

## 2. What counts as a “space” for documents?

### 2.1 Linear document space

The weakest model treats a text as a finite ordered set of positions:

\[
T=\{1,\dots,n\}.
\]

Open sets can be intervals or unions of intervals. This supports segmentation, local windows, lexical cohesion, and reading order. TextTiling and C99 are early examples of using adjacency, lexical similarity, and segment boundaries to find topical substructure in linear text. ([aclanthology.org](https://aclanthology.org/J97-1003.pdf?utm_source=chatgpt.com))

This model is useful for segmentation but topologically poor: a single linearly ordered article usually has trivial homology. The interesting structure comes from attaching data, adding hierarchy, or adding cross-links.

### 2.2 Hierarchical document poset

A document has nested units:

\[
\text{token} < \text{sentence} < \text{paragraph} < \text{subsection} < \text{section} < \text{article}.
\]

This forms a finite partially ordered set. A finite poset can be given an Alexandrov topology, where opens are upward-closed or downward-closed sets, depending on convention. This turns document hierarchy into a genuine finite topological space.

This is often the cleanest topology for a single article because sections, paragraphs, footnotes, and citations are naturally ordered by containment and dependency rather than by smooth coordinates.

### 2.3 Discourse graph

A discourse model treats elementary discourse units, clauses, sentences, or claims as vertices. Edges carry relations such as elaboration, contrast, cause, evidence, concession, background, attribution, or coreference.

Rhetorical Structure Theory gives hierarchical discourse analyses; PDTB gives lexically grounded discourse relations over a large Wall Street Journal corpus; AMR represents sentence meaning using graph structures; newer discourse graphbanks make the graph character more explicit. ([semanticsarchive.net](https://semanticsarchive.net/Archive/GMyNDBjO/RST%20towards%20a%20functional%20theory%20of%20text%20organization.pdf?utm_source=chatgpt.com))

A discourse graph is a space in the combinatorial sense: paths, components, cuts, cycles, centrality, Laplacians, and sheaves can all be defined on it.

### 2.4 Citation and hyperlink network

A citation or hyperlink system is naturally a directed graph. Vertices are documents or pages; directed edges are citations or hyperlinks. Garfield, Kessler, and de Solla Price are foundational for citation indexing, bibliographic coupling, and networks of scientific papers. ([garfield.library.upenn.edu](https://garfield.library.upenn.edu/papers/science1955.pdf?utm_source=chatgpt.com))

The Web is literally modeled as a directed graph of pages and links. Brin and Page’s PageRank and Kleinberg’s HITS are spectral/eigenvector methods on hyperlink structure; Broder et al. studied the macroscopic directed graph structure of the Web using hundreds of millions of pages and over a billion links. ([snap.stanford.edu](https://snap.stanford.edu/class/cs224w-readings/Brin98Anatomy.pdf?utm_source=chatgpt.com))

A wiki or archive is therefore not metaphorically spatial: it has paths, neighborhoods, components, link flows, centrality, bottlenecks, and often temporal growth. Wikipedia hyperlink networks have been studied as complex networks with articles as nodes and hyperlinks as directed edges. ([arxiv.org](https://arxiv.org/abs/physics/0602149?utm_source=chatgpt.com))

### 2.5 Corpus as simplicial or hypergraph space

A corpus can be modeled as a hypergraph:

- vertices: documents, authors, terms, claims, entities, venues;
- hyperedges: “these documents share this entity,” “these papers cite this source,” “these paragraphs instantiate this topic.”

From this hypergraph one may build a simplicial complex. For example, if a set of articles share a named entity, one can insert a simplex connecting them. If a set of papers are co-cited, one can insert a simplex. If documents are within \(\varepsilon\) of each other in an embedding metric, one can build a Vietoris–Rips complex.

This is useful when higher-order relations matter. Pairwise graphs lose information when a relation is intrinsically many-to-many.

### 2.6 Corpus as metric point cloud

A semantic embedding corpus is a finite point cloud

\[
\{f(d_i)\}_{i=1}^N\subseteq M.
\]

Here \(M\) may be Euclidean, spherical, or hyperbolic. The topology comes from the metric and from neighborhoods or filtrations induced by that metric.

This is the place where “semantic embeddings are vector spaces” belongs, but it is only one layer. Embeddings give a metric or pseudo-metric object; topology arises only after constructing neighborhoods, graphs, covers, complexes, or sheaves over that point cloud.

---

## 3. Core results that matter for document modeling

### 3.1 Local-to-global gluing

The sheaf axiom says that compatible local sections glue uniquely. In document terms: paragraph-level, section-level, figure-level, and citation-level interpretations compose into a global interpretation only when their overlaps agree.

This is not a vague analogy. If paragraph \(p\) and citation \(c\) both restrict to a shared claim-interface \(e\), compatibility means:

\[
\rho_{p,e}(x_p)=\rho_{c,e}(x_c).
\]

A global section is a complete assignment satisfying all such equations. Failure to have a global section is a precise obstruction to consistency.

### 3.2 Sheaf cohomology and sheaf Laplacians

For cellular sheaves on finite complexes, sheaf cohomology can be computed by finite cochain complexes. Hansen and Ghrist’s spectral theory lifts graph Laplacians to cellular sheaf Hodge Laplacians and relates spectra to sheaf cohomology and cell structure. ([arxiv.org](https://arxiv.org/abs/1808.01513?utm_source=chatgpt.com))

For documents, this matters because:

- \(H^0\) measures globally consistent assignments;
- higher cohomology can detect cyclic inconsistency or obstruction;
- sheaf Laplacian energy measures disagreement between local assignments;
- harmonic extension can fill missing annotations or interpretations from boundary data.

### 3.3 Constructible sheaves on stratified spaces

Constructible sheaves are locally constant on strata and change only across stratification boundaries. This fits documents: within a paragraph or section, vocabulary and interpretive frame may be active; across sections, figures, footnotes, or citations, transition maps are needed.

Treumann’s exit-path framework and Curry/Patel’s entrance-path classification show that constructible sheaves/cosheaves on suitable stratified spaces can be represented by functors out of finite path categories. That is exactly why finite document incidence categories are legitimate models rather than ad hoc diagrams. ([arxiv.org](https://arxiv.org/abs/0708.0659?utm_source=chatgpt.com))

### 3.4 Robinson consistency radius

Robinson’s sheaf-theoretic framework for assignments to sheaves of pseudometric spaces is especially relevant for documents because real texts are noisy. An assignment chooses local sections without requiring compatibility. The **consistency radius** measures how far the assignment is from being compatible; thresholding it produces a **consistency filtration**. ([compositionality.episciences.org](https://compositionality.episciences.org/13508?utm_source=chatgpt.com))

This is a strong model for contradiction, terminological drift, contested citations, inconsistent annotations, or local claims that cannot be globally reconciled.

### 3.5 Persistent homology and stability

Persistent homology converts a filtered document, citation, topic, or embedding complex into barcodes or persistence diagrams. Its value is multi-scale robustness: instead of selecting one similarity threshold, one studies features across thresholds. Foundational work by Edelsbrunner–Letscher–Zomorodian and Zomorodian–Carlsson gives the algorithmic and algebraic basis; stability results by Chazal, de Silva, and Oudot explain when persistence diagrams are robust under perturbation. ([link.springer.com](https://link.springer.com/article/10.1007/s00454-002-2885-2?utm_source=chatgpt.com))

For corpora, persistent \(H_0\) tracks topic clusters merging across similarity scales; persistent \(H_1\) may indicate loops of related but non-central documents, competing thematic bridges, or holes in coverage. Interpretation must be tied to the actual construction.

### 3.6 Spectral graph theory

Graph Laplacians support ranking, segmentation, clustering, salience, diffusion, smoothing, and community detection. TextRank and LexRank use graph-based ranking for keyword or sentence extraction; PageRank and HITS do the same for web pages. ([web.eecs.umich.edu](https://web.eecs.umich.edu/~mihalcea/papers/mihalcea.emnlp04.pdf?utm_source=chatgpt.com))

In document modeling, the graph Laplacian is useful when the graph relation is meaningful: sentence similarity, citation, hyperlink, co-occurrence, discourse support, or embedding-neighborhood adjacency.

### 3.7 Hodge theory on graphs and complexes

Combinatorial Hodge theory generalizes Laplacian methods from vertex signals to edge flows and higher-dimensional signals. Jiang, Lim, Yao, and Ye use Hodge theory for ranking from pairwise comparisons; Schaub and collaborators generalize random walks and signal processing to simplicial complexes using Hodge Laplacians. ([link.springer.com](https://link.springer.com/article/10.1007/s10107-010-0419-x?utm_source=chatgpt.com))

For documents, Hodge methods are relevant when the data are flows or comparisons: citation preference flows, argumentative support/attack flows, annotation disagreements, hyperlink navigation flows, or claim-dependency cycles.

### 3.8 Geometric deep learning and sheaf neural networks

Geometric deep learning studies learning architectures adapted to non-Euclidean domains such as graphs, manifolds, and complexes. Graph neural networks apply naturally to document graphs, citation graphs, text graphs, and knowledge graphs. ([arxiv.org](https://arxiv.org/abs/2104.13478?utm_source=chatgpt.com))

TextGCN constructs a corpus graph with document nodes, word nodes, word co-occurrence edges, and document-word edges, then applies graph convolution for text classification. ([ojs.aaai.org](https://ojs.aaai.org/index.php/AAAI/article/view/4725?utm_source=chatgpt.com))

Sheaf neural networks go further: they replace the assumption that neighboring nodes share the same feature space with stalks and restriction maps. Hansen–Gebhart and Bodnar et al. use sheaf Laplacians or sheaf diffusion to generalize graph neural networks, especially for heterophilous, asymmetric, or typed relations. ([arxiv.org](https://arxiv.org/abs/2012.06333?utm_source=chatgpt.com))

This is relevant to documents because citations, discourse relations, quotations, translations, and entity mentions often relate unlike things, not homogeneous nodes.

---

## 4. Worked examples

## Example A: one article as a stratified document space

Consider a scholarly article \(A\) with title, abstract, five sections, paragraphs, theorem statements, figures, footnotes, and bibliography.

Define a finite incidence category or poset \(P_A\):

\[
\text{token} \le \text{sentence} \le \text{paragraph} \le \text{section} \le \text{article}.
\]

Add extra cells or relation objects for:

- figure captions;
- footnotes;
- citations;
- equation references;
- theorem-proof dependencies;
- cross-references such as “see Section 3”;
- discourse relations such as “however,” “therefore,” “by contrast.”

This is not usually a manifold. It has branching, nesting, typed strata, cross-links, and singular interfaces. It is better treated as a finite stratified space, incidence poset, or cell complex.

Now define a cellular sheaf \(\mathcal F\) on \(P_A\):

- \(\mathcal F(p)\): vector space or structured set of claims in paragraph \(p\);
- \(\mathcal F(s)\): section-level thematic or argumentative state;
- \(\mathcal F(c)\): citation-interface space for a cited claim;
- \(\mathcal F(f)\): figure-caption data space;
- restriction maps: paragraph-to-section summary maps, paragraph-to-citation projection maps, figure-to-caption maps, theorem-to-proof maps.

A global section is a choice of local interpretations compatible with all restrictions. If the abstract says “we prove X,” Section 4 proves only \(X'\), and the conclusion claims \(X''\), then the residuals under the restriction maps measure mismatch. If no exact global section exists, the article is locally interpretable but globally inconsistent.

This is exactly the type of finite local-to-global problem cellular sheaves were designed to encode. Curry’s cellular sheaves/cosheaves and Hansen–Ghrist’s sheaf Laplacians supply the algebraic machinery; Robinson’s consistency radius supplies a metric relaxation when exact agreement is too strict. ([www2.math.upenn.edu](https://www2.math.upenn.edu/grad/dissertations/CurryThesis.pdf?utm_source=chatgpt.com))

---

## Example B: one corpus as graph, hypergraph, and simplicial complex

Let \(C=\{d_1,\dots,d_N\}\) be a corpus of articles.

A **document-term graph** has vertices

\[
V=D\sqcup W,
\]

where \(D\) is the set of documents and \(W\) is the set of words or entities. Add weighted edges \(d_i-w_j\) using tf-idf, PMI, or frequency. Add word-word edges from co-occurrence. This is essentially the kind of construction used by TextGCN. ([ojs.aaai.org](https://ojs.aaai.org/index.php/AAAI/article/view/4725?utm_source=chatgpt.com))

A **topic hypergraph** has document vertices and a hyperedge for every topic or entity:

\[
e_t=\{d_i : d_i\text{ substantially discusses topic }t\}.
\]

From this hypergraph, build a simplicial complex by inserting a simplex for each hyperedge and all of its faces. Then:

- \(H_0\) detects disconnected topic regions;
- \(H_1\) detects loops of overlapping topics without a central common document;
- higher homology may detect higher-order coverage holes.

A loop in such a complex does not automatically mean a “semantic paradox.” It means that, under the chosen relation, the corpus has a cycle of overlaps not filled by a higher-order common overlap. Interpretation depends on the hyperedge definition.

---

## Example C: citation or hyperlink system as network and sheaf

Let \(G=(V,E)\) be a directed citation graph. Vertices are papers; an edge \(P\to Q\) means \(P\) cites \(Q\). This graph supports standard network analysis: in-degree, out-degree, bibliographic coupling, co-citation, PageRank-like prestige, and temporal growth. Citation indexing and bibliographic coupling were formalized in the mid-twentieth century by Garfield, Kessler, and de Solla Price. ([garfield.library.upenn.edu](https://garfield.library.upenn.edu/papers/science1955.pdf?utm_source=chatgpt.com))

Now make it a sheaf. Assign:

- \(\mathcal F(P)\): the local conceptual vocabulary or claim space of paper \(P\);
- \(\mathcal F(Q)\): the local conceptual vocabulary or claim space of paper \(Q\);
- \(\mathcal F(e)\): the interface claim supposedly transmitted by citation \(e:P\to Q\);
- \(\rho_{P,e}\): how \(P\) formulates the cited claim;
- \(\rho_{Q,e}\): how \(Q\) actually states the cited claim.

Compatibility requires:

\[
\rho_{P,e}(x_P)=\rho_{Q,e}(x_Q).
\]

If \(P\) cites \(Q\) for a theorem \(T\), but \(Q\) proves \(T\) only under stronger hypotheses, then the edge residual is nonzero. Around a citation cycle, nontrivial holonomy may represent terminology drift: each local translation seems acceptable, but the composite around the loop does not return to the original meaning.

This is a rigorous model of citation-mediated gluing. It does not say citations are topological by nature; it says once citation interfaces and restriction maps are specified, sheaf cohomology and sheaf Laplacians become meaningful.

---

## Example D: semantic embedding corpus as metric/geometric object

Let each document \(d_i\) be mapped to an embedding vector \(x_i=f(d_i)\in\mathbb R^n\), perhaps using SBERT or another sentence/document embedding model. Define angular distance on normalized vectors:

\[
d(x_i,x_j)=\arccos\langle x_i,x_j\rangle.
\]

Construct a Vietoris–Rips filtration:

\[
K_\varepsilon
=
\{\sigma\subseteq C : d(x_i,x_j)\le \varepsilon
\text{ for all }x_i,x_j\in\sigma\}.
\]

Persistent homology of \(K_\varepsilon\) tracks how clusters and loops appear across semantic similarity scales.

This can be useful, but it is not automatically profound. Michel et al. investigated topology-based document representations inspired by persistent homology and reported that they did not outperform simple tf-idf on their tested document classification settings. That negative result matters: the geometry of embeddings may not contain the desired task signal, or the chosen topological summaries may be too coarse. ([arxiv.org](https://arxiv.org/abs/1705.10900?utm_source=chatgpt.com))

There are more promising cases when the object of study is truly geometric, such as comparing shapes of word-embedding point clouds across languages or studying persistent structures in word-sense data. But even there, the topology is topology of the embedding construction, not direct topology of “meaning itself.” ([arxiv.org](https://arxiv.org/abs/2404.00500?utm_source=chatgpt.com))

---

## 5. Local-to-global problems in documents

### 5.1 How local claims compose into article meaning

An article’s meaning is not the sum of independent sentences. It is constrained by:

- section order;
- paragraph transitions;
- definitions introduced earlier;
- citations;
- figures;
- examples;
- theorem-proof dependencies;
- discourse relations;
- genre expectations.

A sheaf model expresses this by assigning local state spaces to units and compatibility maps to overlaps. The global interpretation is a section satisfying all compatibility equations.

For instance, suppose paragraph \(p_1\) defines “sovereignty,” paragraph \(p_2\) uses the term in a legal sense, paragraph \(p_3\) uses it in a political-theological sense, and the conclusion treats them as identical. A sheaf can model whether these local meanings restrict to a common interface or whether the article is gluing incompatible semantic objects.

### 5.2 How sections constrain global interpretation

Sections are not merely containers. They impose boundary conditions. An abstract promises a global frame; an introduction sets terminology; a methods section constrains evidence; a conclusion reinterprets results.

In a cellular sheaf:

- section stalks contain section-level interpretations;
- paragraph stalks contain local claims;
- restriction maps force paragraph claims to project into section themes;
- the article stalk contains the global thesis.

A paragraph can be locally coherent but globally incompatible if it does not restrict correctly to the section or article-level state.

### 5.3 How citations create gluing data

A citation is not only an edge in a graph. It is a proposed gluing map between the citing document and the cited document.

A rigorous citation sheaf must specify:

1. the claim or object being cited;
2. the local formulation in the citing paper;
3. the local formulation in the cited paper;
4. a translation or comparison map;
5. a compatibility criterion.

Bad citation, misquotation, context collapse, and terminological drift appear as failures of these maps to commute.

### 5.4 How contradiction appears topologically

Contradiction or inconsistency can appear in several precise ways:

1. **No global section**: local interpretations exist but cannot be glued.
2. **Large edge residuals**: local assignments disagree on overlaps.
3. **Nonzero coboundary**: \(\delta x\neq 0\), meaning the assignment is not compatible.
4. **Nontrivial higher cohomology**: cyclic obstruction remains after local corrections.
5. **Large consistency radius**: Robinson’s metric relaxation says the assignment is far from consistent.
6. **Hodge harmonic residue**: an edge-flow disagreement has a harmonic component not expressible as local potential differences.

The important point is that contradiction is not “a hole” unless a specific complex, sheaf, and obstruction theory have been defined.

---

## 6. Analysis tools

| Tool | Input | Output | Documentary use | Main danger |
|---|---|---:|---|---|
| Connected components | Graph or complex | Components | Isolated topics, disconnected archive regions | Components depend on threshold |
| Homology | Simplicial/cell complex | \(H_k\) groups | Coverage holes, loops of overlap, higher-order structure | Easy to overinterpret |
| Persistent homology | Filtered complex | Barcodes, diagrams | Multi-scale topic/citation/embedding shape | Metric may be arbitrary |
| Graph Laplacian | Weighted graph | Eigenvectors/eigenvalues | Clustering, salience, diffusion, ranking | Graph construction dominates result |
| Sheaf Laplacian | Cellular sheaf | Harmonic sections, residuals | Local-to-global consistency, annotation repair | Requires meaningful stalks/maps |
| Hodge Laplacian | Simplicial complex | Gradient/curl/harmonic decomposition | Argument/citation flows, cyclic disagreement | Needs oriented higher-order data |
| Spectral decomposition | Graph/Laplacian/operator | Modes | Topic axes, communities, bottlenecks | Eigenvectors are not always interpretable |
| Curvature | Graph/cell metric | Forman/Ollivier curvature | Bridges, bottlenecks, network fragility | Not curvature of prose itself |
| Clustering | Graph or metric space | Clusters | Topic families, discourse segments | Often validates existing preprocessing |
| Geometric deep learning | Graph/complex/sheaf | Learned representations | Text graphs, citation graphs, knowledge graphs | Can hide weak modeling choices |

Graph curvature is legitimate when defined on a graph or cell complex. Ollivier curvature uses Wasserstein contraction of Markov chains on metric spaces; Forman curvature gives a combinatorial curvature for cell complexes. But applying either to documents requires a specified graph, metric, and validation task. Otherwise “curvature of a text” is decorative language. ([arxiv.org](https://arxiv.org/abs/math/0701886?utm_source=chatgpt.com))

---

## 7. Knowledge graphs as geometric/topological objects

A knowledge graph is a directed, labeled, multi-relational graph. Vertices represent entities or concepts; edges represent typed relations. It can be treated as:

- a directed labeled graph;
- a category-like path structure;
- a hypergraph if relations are genuinely \(n\)-ary;
- a simplicial complex if multi-entity relations are closed under faces;
- a metric embedding space if entities and relations are embedded;
- a sheaf base if local data must be glued across relation interfaces.

TransE embeds multi-relational data by representing relations as translations in vector space. Poincaré embeddings use hyperbolic geometry to represent hierarchical symbolic data, exploiting the fact that hyperbolic space naturally accommodates tree-like growth. ([proceedings.neurips.cc](https://proceedings.neurips.cc/paper/5071-translating-embeddings-for-modeling-multi-relational-data.pdf?utm_source=chatgpt.com))

For documentary modeling, knowledge graphs are useful when a corpus has stable entities, relations, ontologies, or citations. But the graph is not automatically a semantic space. The topology comes from the graph, from paths and neighborhoods, or from a chosen embedding geometry.

---

## 8. Topology of hypertext, archives, wikis, and web corpora

Hypertext is one of the most literal cases of documentary topology. A web-like corpus has:

- pages as vertices;
- links as directed edges;
- anchor text as edge labels;
- categories as hyperedges;
- templates as gluing constraints;
- edit histories as temporal filtrations;
- redirects and disambiguation pages as quotient-like operations.

The Web graph and Wikipedia link graph have been studied as complex networks with measurable degree distributions, components, reciprocity, clustering, path lengths, and growth patterns. ([snap.stanford.edu](https://snap.stanford.edu/class/cs224w-readings/broder00bowtie.pdf?utm_source=chatgpt.com))

A wiki can also be modeled sheaf-theoretically. Each page has local claims and entity descriptions. Links propose identifications or relations. Categories aggregate pages. Templates impose typed structure. Contradictions between pages become failures of gluing over shared entity or claim interfaces.

This is stronger than ordinary graph analysis because it distinguishes “there is a link” from “the linked pages agree on the object being linked.”

---

## 9. Spatial models of discourse, narrative, topic flow, and argument

Spatial models of discourse become rigorous when the “space” is specified:

1. **Narrative as path**: events are vertices; temporal or causal succession gives directed edges.
2. **Argument as directed hypergraph**: premises jointly support conclusions.
3. **Discourse as graph**: EDUs connected by rhetorical relations.
4. **Topic flow as trajectory**: paragraphs map into a topic simplex or embedding space.
5. **Semantic drift as connection/transport**: meanings are transported across sections or citations by transition maps.
6. **Contradiction as obstruction**: local transports around a cycle fail to compose to identity.

Discourse sheaves are especially relevant here. Hansen and Ghrist model opinion dynamics on discourse sheaves using generalized graph Laplacians and diffusion dynamics, allowing agents or nodes to express different aspects of opinion across different communication channels. ([epubs.siam.org](https://epubs.siam.org/doi/10.1137/20M1341088?utm_source=chatgpt.com))

For documents, the analogous move is to let paragraphs, sections, or articles expose different projections of their local semantic state depending on the relation: citation, summary, contrast, definition, evidence, or critique.

---

## 10. Which topology is actually useful, and which is metaphor?

### Actually useful

**Graphs** are useful for citations, hyperlinks, discourse dependencies, sentence similarity, co-occurrence, entity relations, and document neighborhoods. The mathematical object is explicit, and graph algorithms have clear inputs and outputs.

**Hypergraphs and simplicial complexes** are useful when relations are multiway: shared citations, shared entities, coauthorship, topics, tags, bibliographic coupling, and overlapping corpora. Homology and persistence can reveal higher-order coverage structure that pairwise graphs obscure.

**Finite posets and stratified spaces** are useful for individual documents because document structure is hierarchical, typed, and non-manifold-like. Sections, paragraphs, citations, footnotes, captions, and references form incidence structures.

**Sheaves and cosheaves** are useful when the central problem is local-to-global: annotation consistency, citation correctness, entity resolution, section-level coherence, translation across vocabularies, conflicting claims, and aggregation of evidence.

**Sheaf Laplacians and Hodge Laplacians** are useful when inconsistency, flow, or compatibility should be measured quantitatively. They are especially appropriate for typed, asymmetric, or heterogeneous document networks.

**Metric embeddings and TDA** are useful when the metric is validated and the question is multi-scale: topic clustering across thresholds, shape of embedding clouds, archive coverage, language comparison, or robustness of semantic neighborhoods.

**Geometric deep learning** is useful when the document object is already graph-like or complex-like: citation networks, text graphs, knowledge graphs, hyperlink systems, discourse graphs, or typed heterogeneous corpora.

### Mostly metaphor unless formalized

Calling a document **a manifold** is usually metaphorical. A manifold requires local Euclidean charts and compatible transition maps. A document has hierarchy, branching, references, quotations, footnotes, figures, and singular interfaces. “Stratified space” or “cell complex” is usually more honest.

Calling semantic embeddings **the topology of meaning** is too strong. Embeddings provide a point cloud under a chosen metric. Their topology is topology of the representation, not meaning itself.

Calling a missing topic **a homological hole** is metaphorical unless one has built a complex where that hole is an actual nontrivial homology class.

Calling prose **curved** is metaphorical unless curvature is defined on a specific graph, metric space, cell complex, or transport system.

Calling context **a sheaf** is metaphorical unless one specifies the base space, stalks, restriction maps, and compatibility condition.

### Practical rule

A topological or geometric model of documents is legitimate only when it answers the following:

1. What is the base space?
2. What are the points, cells, opens, edges, or simplices?
3. What data live locally?
4. What maps compare or glue local data?
5. What invariant, operator, or algorithm is being computed?
6. What would count as validation or falsification?

Without these choices, topology is only a metaphor. With them, documents become genuine combinatorial, sheaf-theoretic, spectral, or metric objects.
