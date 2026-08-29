# Mathematical Analysis, Probability, and Information Theory of Content

## 1. Thesis

A document is not merely a bag of words, an embedding vector, or an LLM token stream. It can be treated simultaneously as:

\[
d \in \Sigma^*,\qquad d \sim P,\qquad d \mapsto \phi(d)\in \mathcal X,\qquad d \mapsto L(d),
\]

where \(\Sigma^*\) is a string space, \(P\) is a probability law over documents, \(\phi\) is a representation map, and \(L(d)\) is a code length, likelihood, loss, or value functional. The mathematics of content therefore spans Shannon information, algorithmic information, statistical language modeling, latent-variable modeling, spectral geometry, graph random walks, optimal transport, and Bayesian decision theory.

The central distinction is this: **content analysis studies measurable structure in documents**, while **LLM token prediction is only one modern family of conditional probability models over strings**.

---

## 2. Formal setup

Let \(\Sigma\) be a finite or countable alphabet: characters, bytes, subword tokens, words, citations, rhetorical acts, or semantic labels. Let

\[
\Sigma^*=\bigcup_{n\ge 0}\Sigma^n
\]

be the set of finite strings. A token sequence is

\[
X_{1:n}=(X_1,\ldots,X_n)\in \Sigma^n.
\]

A document is a structured object

\[
D=(X_{1:N},M,R,A),
\]

where \(N\) is length, \(M\) metadata, \(R\) rhetorical or discourse structure, and \(A\) an author/source/context variable. A corpus is

\[
\mathcal C=(D_1,\ldots,D_m)
\]

or a random sample \(D_1,\ldots,D_m \stackrel{iid}{\sim} P_\Theta\) from a document-generating process.

For finite documents, one may use the measurable space \((\Sigma^*,2^{\Sigma^*})\). For infinite streams, use \(\Sigma^{\mathbb N}\) with the cylinder \(\sigma\)-algebra. A probability distribution over documents is then a measure

\[
P:\mathcal F\to [0,1],\qquad P(\Sigma^*)=1.
\]

Important prose-associated random variables include:

\[
N=\text{length},\quad X_i=\text{token},\quad Z_i=\text{topic/state},\quad Y=\text{label or relevance},\quad S=\text{source credibility},\quad G=\text{citation/link graph}.
\]

---

## 3. Key mathematical quantities

### Shannon quantities

For a discrete document model \(P\):

\[
H(X)=-\sum_x P(x)\log P(x).
\]

For two document distributions \(P,Q\):

\[
H(P,Q)=-\sum_x P(x)\log Q(x),
\]

\[
D_{\mathrm{KL}}(P\|Q)=\sum_x P(x)\log \frac{P(x)}{Q(x)}.
\]

Mutual information between document features \(X\) and target variable \(Y\):

\[
I(X;Y)=\sum_{x,y}P(x,y)\log \frac{P(x,y)}{P(x)P(y)}.
\]

Perplexity of a language model \(Q\) on \(x_{1:n}\):

\[
\operatorname{PPL}_Q(x_{1:n})
=\exp\left(-\frac1n\sum_{i=1}^n \log Q(x_i\mid x_{<i})\right).
\]

Compression length:

\[
L_Q(x_{1:n})=-\log Q(x_{1:n}).
\]

Thus likelihood, compression, and surprise are the same object under different interpretations.

---

### Algorithmic quantities

Kolmogorov complexity:

\[
K_U(x)=\min\{|p|:U(p)=x\}.
\]

Algorithmic mutual information:

\[
I_K(x:y)=K(x)+K(y)-K(x,y)+O(\log K).
\]

A highly repetitive article has low \(K(x)\) relative to length. A random-looking but meaningless string has high \(K(x)\). Thus algorithmic complexity separates **compressibility** from **semantic value** only when paired with structure functions, sufficient statistics, or task relevance.

---

### Topic and embedding quantities

A topic model represents a document by

\[
\theta_d\in \Delta^{K-1},
\]

where \(\theta_{dk}\) is the document’s mixture weight on topic \(k\). A topic is a word distribution

\[
\beta_k\in \Delta^{|\Sigma|-1}.
\]

Embedding models represent documents as

\[
v_d=\phi(d)\in \mathbb R^r,
\]

with distances such as cosine distance,

\[
1-\frac{\langle v_d,v_e\rangle}{\|v_d\|\|v_e\|},
\]

or Wasserstein distance between empirical word-embedding measures.

---

### Transport distance

Represent documents as probability measures over semantic space:

\[
\mu_d=\sum_i a_i\delta_{u_i},\qquad
\mu_e=\sum_j b_j\delta_{v_j}.
\]

Given cost \(c(u_i,v_j)\), optimal transport distance is

\[
W_c(\mu_d,\mu_e)
=
\min_{\gamma\in \Pi(a,b)}
\sum_{i,j}\gamma_{ij}c(u_i,v_j),
\]

where \(\Pi(a,b)\) is the set of couplings with row marginals \(a\) and column marginals \(b\).

This is useful when two documents use different vocabularies but nearby semantic mass.

---

### Graph centrality

Let \(G=(V,E)\) be a document, citation, hyperlink, or reference graph. Let \(P\) be a row-stochastic transition matrix. PageRank solves

\[
\pi^\top=\alpha \pi^\top P+(1-\alpha)u^\top,
\]

where \(u\) is a teleportation distribution. Under the usual positivity/irreducibility conditions, \(\pi\) is the unique stationary distribution of the random-surfer chain.

---

## 4. Major theorems and results

### Theorem 1: Source coding theorem

For an ergodic discrete source with entropy rate \(H\), no uniquely decodable lossless code can achieve average code length below \(H\) bits per symbol in the limit, and codes exist with asymptotic average length arbitrarily close to \(H\).

Interpretation for content: the entropy rate of prose bounds its lossless compressibility. Redundant prose has lower entropy rate; formulaic prose is more compressible; genuinely varied prose has higher entropy rate. `[S1][S2]`

---

### Theorem 2: Asymptotic equipartition property

For iid \(X_1,\ldots,X_n\sim P\),

\[
-\frac1n\log P(X_1,\ldots,X_n)\to H(X)
\]

in probability, and typical sequences have probability approximately \(2^{-nH}\).

Interpretation: long documents sampled from a stable source concentrate around a typical code length. A document with unusually high negative log-likelihood is surprising relative to the model, not necessarily valuable. `[S2]`

---

### Theorem 3: KL divergence and cross-entropy decomposition

\[
H(P,Q)=H(P)+D_{\mathrm{KL}}(P\|Q).
\]

Thus minimizing cross-entropy is equivalent to minimizing KL divergence from the empirical or true distribution, up to the irreducible entropy of the data. This applies to \(n\)-gram models, topic models, neural language models, and retrieval language models. `[S2]`

---

### Theorem 4: Invariance theorem for Kolmogorov complexity

For two universal machines \(U,V\),

\[
|K_U(x)-K_V(x)|\le c_{UV}.
\]

The absolute complexity of short documents depends on the coding convention, but asymptotically and comparatively the dependence is bounded by a constant. `[S3][S4]`

---

### Theorem 5: Maximum entropy principle

Given constraints

\[
\mathbb E_P[f_j(X)]=c_j,
\]

the least committal distribution maximizes

\[
H(P)
\]

subject to those constraints. Under linear constraints, solutions typically have exponential-family form

\[
P(x)=\frac1Z\exp\left(\sum_j\lambda_j f_j(x)\right).
\]

For content, this gives a principled baseline: preserve known facts about a corpus while refusing to add unsupported structure. `[S5]`

---

### Theorem 6: Eckart–Young–Mirsky spectral approximation

If \(A=U\Sigma V^\top\), then the best rank-\(k\) approximation in Frobenius norm is

\[
A_k=\sum_{i=1}^k\sigma_i u_i v_i^\top,
\]

with error

\[
\|A-A_k\|_F^2=\sum_{i>k}\sigma_i^2.
\]

For term-document matrices, this justifies latent semantic analysis as optimal low-rank approximation of a weighted lexical incidence matrix. `[S9][S10]`

---

### Theorem 7: PageRank stationary distribution

With teleportation parameter \(0<\alpha<1\), the PageRank transition matrix is positive and stochastic, hence has a unique stationary distribution. Power iteration converges to it.

For citation graphs, this gives a circulation-weighted visibility measure, not truth, quality, or epistemic reliability. `[S11]`

---

### Theorem 8: Topic-model recovery under separability

For topic models satisfying an anchor-word or separability assumption, topic matrices can be recovered by polynomial-time algorithms with provable guarantees from sufficiently many samples. This is not a universal guarantee for all prose, but it is a rigorous result connecting document mixtures, nonnegative matrix factorization, and identifiable topics. `[S12]`

---

### Theorem 9: Rate-distortion and summarization

Given distortion \(d(x,\hat x)\), the rate-distortion function is

\[
R(D)=\min_{P_{\hat X|X}:\mathbb E d(X,\hat X)\le D} I(X;\hat X).
\]

A summary is a lossy code. Its mathematical quality depends on the distortion measure: lexical overlap, semantic distance, factual entailment loss, rhetorical-role preservation, or task utility. `[S2][S15]`

---

## 5. Main modeling families

### 5.1 Markov and \(n\)-gram language models

A Markov language model assumes

\[
P(x_{1:n})=\prod_{i=1}^n P(x_i\mid x_{i-k:i-1}).
\]

This is mathematically clean but discourse-poor. Smoothing methods compensate for sparse counts:

\[
\widehat P(w\mid h)
=
\lambda_h P_{\mathrm{ML}}(w\mid h)
+
(1-\lambda_h)\widehat P(w\mid h'),
\]

where \(h'\) is a shorter history.

These models quantify local predictability, collocation, formulaicity, and redundancy. `[S13]`

---

### 5.2 Hidden Markov models and discourse states

An HMM introduces latent states \(Z_i\):

\[
P(x_{1:n},z_{1:n})
=
P(z_1)\prod_{i=2}^nP(z_i\mid z_{i-1})
\prod_{i=1}^nP(x_i\mid z_i).
\]

For prose, \(Z_i\) may represent genre, rhetorical move, stance, register, section type, or latent topic. The forward-backward algorithm computes posterior state probabilities, and Baum-Welch/EM monotonically improves likelihood under the model. `[S14]`

---

### 5.3 Probabilistic grammars

A probabilistic context-free grammar assigns probabilities to rules

\[
A\to \alpha,
\qquad
\sum_\alpha P(A\to\alpha)=1.
\]

A sentence probability is the sum over derivations:

\[
P(x)=\sum_{t:\mathrm{yield}(t)=x}P(t).
\]

This gives a formal generative account of syntax, ambiguity, and hierarchical structure beyond finite-state token prediction. `[S14]`

---

### 5.4 Bayesian models of discourse

A Bayesian discourse model treats claims, source reliability, topic, and audience as latent variables:

\[
P(H,S,Z,A\mid D)
\propto
P(D\mid H,S,Z,A)P(H)P(S)P(Z)P(A).
\]

This framework distinguishes textual probability from epistemic probability. A sentence can be likely under a style model but weak evidence for a claim; another can be stylistically rare but evidentially strong.

---

### 5.5 Topic models

LDA generates a document by:

\[
\theta_d\sim \operatorname{Dirichlet}(\alpha),
\]

\[
z_{di}\sim \operatorname{Categorical}(\theta_d),
\]

\[
w_{di}\sim \operatorname{Categorical}(\beta_{z_{di}}).
\]

The document is not “about” one topic; it is a mixture. Topic distributions give a statistical basis for comparing articles, tracking thematic drift, and distinguishing novelty from mere vocabulary change. `[S12]`

---

### 5.6 Distributional semantics

Distributional semantics begins from co-occurrence statistics. Let \(C_{wc}\) be word-context counts. Pointwise mutual information is

\[
\operatorname{PMI}(w,c)=\log\frac{P(w,c)}{P(w)P(c)}.
\]

Many embedding objectives can be interpreted as factorizing transformed co-occurrence matrices. Thus semantic vector spaces are not magic representations; they are compressed spectral/statistical summaries of contextual probability structure. `[S16]`

---

### 5.7 Information retrieval

The vector space model maps documents and queries into weighted term vectors and compares them by cosine similarity. BM25 scores a document \(d\) for query \(q\) approximately by

\[
\operatorname{BM25}(q,d)
=
\sum_{t\in q}
\operatorname{idf}(t)
\frac{f(t,d)(k_1+1)}
{f(t,d)+k_1(1-b+b|d|/\operatorname{avgdl})}.
\]

IR mathematics is about matching information need to documents, not modeling all language generation. `[S7][S8]`

---

### 5.8 Transformers, narrowly

A transformer language model defines

\[
P(x_{1:n})=\prod_i P_\theta(x_i\mid x_{<i}),
\]

but the mathematical interest is not merely “predict the next token.” Rigorous transformer theory studies expressivity, universality, circuit structure, positional encodings, and formal-language limitations. Transformers belong in this memo only where such claims are mathematically stated and proved. `[S17]`

---

## 6. Worked examples

### Example A: KL divergence between two articles

Suppose article \(A\) has topic distribution

\[
p=(0.50,0.30,0.20)
\]

over \((\text{climate},\text{policy},\text{finance})\), while article \(B\) has

\[
q=(0.20,0.50,0.30).
\]

Then

\[
D_{\mathrm{KL}}(p\|q)
=
0.5\log_2\frac{0.5}{0.2}
+
0.3\log_2\frac{0.3}{0.5}
+
0.2\log_2\frac{0.2}{0.3}
\approx 0.323\text{ bits}.
\]

This means \(B\)’s topic model is inefficient by about \(0.323\) bits per topic draw when used to encode \(A\). KL is directional: \(D_{\mathrm{KL}}(q\|p)\approx 0.280\) bits.

---

### Example B: A document as a generated sample

An LDA-style document model:

1. Draw \(\theta_d=(0.6,0.3,0.1)\).
2. For each token, draw topic \(z_i\sim \theta_d\).
3. Draw word \(w_i\sim \beta_{z_i}\).

If a document’s posterior \(\widehat\theta_d\) is \((0.55,0.35,0.10)\), it is mostly topic 1 but contains a significant secondary topic. A single-label classification would erase mixture structure.

---

### Example C: Redundancy and compression

Let a 1,000-token document have empirical cross-entropy \(4.5\) bits/token under a strong model. Its idealized code length is

\[
L\approx 4500\text{ bits}.
\]

If a revised version has the same factual payload but compresses to \(3.2\) bits/token over 700 tokens, it may be more formulaic or less lexically diverse. Compression alone does not imply better prose; it measures predictability.

A useful redundancy index is

\[
\rho(d)=1-\frac{L(d)}{|d|\log|\Sigma|}.
\]

High \(\rho\) indicates compressibility relative to a uniform-token baseline.

---

### Example D: Citations as a random walk

Let articles be nodes and citations be directed edges. A random reader follows a citation with probability \(\alpha\) and jumps to a random article with probability \(1-\alpha\). The stationary distribution \(\pi\) ranks documents by long-run visitation probability.

This measures circulation centrality. It does not measure truth. Retractions, review articles, canonical errors, and polemical targets can all be central.

---

### Example E: Optimal transport between documents

Represent document \(A\) as mass on embedded terms:

\[
\mu_A=0.5\delta_{\text{river}}+0.5\delta_{\text{flood}},
\]

and document \(B\) as

\[
\mu_B=0.5\delta_{\text{stream}}+0.5\delta_{\text{inundation}}.
\]

Bag-of-words overlap may be zero, but Wasserstein distance may be small if river/stream and flood/inundation are close in embedding space. Transport captures semantic substitutability better than exact lexical matching.

---

## 7. Toward a mathematical theory of content value

Let content value be a multi-objective functional:

\[
V(d;a,t)
=
\lambda_1 N(d)
-\lambda_2 R(d)
+\lambda_3 I(d;Y_t)
+\lambda_4 S(d)
+\lambda_5 C(d)
+\lambda_6 G(d)
-\lambda_7 E(d),
\]

where \(a\) is audience and \(t\) is task.

Possible components:

### Novelty

\[
\operatorname{Novelty}(d\mid\mathcal C)
=
-\log P_{\mathcal C}(d)
\]

or, more carefully,

\[
D_{\mathrm{KL}}(P_d\|P_{\mathcal C}).
\]

Novelty is distance from prior corpus expectations.

### Redundancy

\[
\operatorname{Redundancy}(d)
=
1-\frac{K(d)}{|d|\log|\Sigma|}
\]

or an empirical compression analogue.

### Surprise

\[
\operatorname{Surprise}_Q(d)=-\log Q(d).
\]

Surprise is model-relative. A bad model produces fake surprise.

### Informativeness

\[
\operatorname{Info}(d;Y)=I(\phi(D);Y),
\]

the mutual information between document representation and a task-relevant variable.

### Salience

A claim \(c\) is salient if it changes beliefs or decisions:

\[
\operatorname{Salience}(c)
=
\mathbb E_{a}\left[
U(a\mid \text{posterior after }c)
-
U(a\mid \text{prior})
\right].
\]

### Credibility signals

Credibility is not likelihood under prose style. It is posterior reliability:

\[
P(H\mid d,s,e)
\propto
P(d,e\mid H,s)P(H)P(s),
\]

where \(H\) is a claim, \(s\) a source, and \(e\) external evidence.

### Compressibility

Compression measures regularity. Extremely compressible content may be boilerplate; incompressible content may be noise. Valuable content often lies between: structured enough to be compressible, surprising enough to add information.

### Circulation potential

On a social or citation graph,

\[
\operatorname{Circ}(d)=\mathbb E[\text{cascade size}\mid d,G]
\]

or a centrality-weighted diffusion probability. Circulation is not epistemic value.

---

## 8. Distinctions

### Mathematical analysis of text

Defines measurable objects, probability laws, distances, codes, graph processes, and inference procedures over documents.

### Statistical NLP

Builds estimators and predictors for linguistic tasks: tagging, parsing, classification, translation, retrieval, summarization, and generation.

### Information retrieval

Ranks documents relative to information needs. Its core quantities are relevance, term weighting, vector similarity, probabilistic ranking, link centrality, and user utility.

### LLM token prediction

Models

\[
P_\theta(x_i\mid x_{<i})
\]

at scale. This is a powerful conditional density model, not the whole mathematics of content. It does not by itself define truth, salience, novelty, credibility, or editorial value.

### Epistemic or editorial value

Concerns whether content is true, useful, responsible, relevant, situated, original, and consequential. These require decision theory, social epistemology, causal evidence, provenance, institutional trust, and audience-specific utility.

---

## 9. Research program

A serious mathematical theory of content should combine:

1. Shannon information for uncertainty, coding, redundancy, and rate limits.
2. Algorithmic information for individual-document complexity and structure.
3. Bayesian inference for claims, source reliability, discourse, and uncertainty.
4. Topic models and latent-variable models for thematic mixture.
5. Spectral and tensor methods for low-rank semantic structure.
6. Optimal transport for semantic movement between documents and corpora.
7. Graph random walks for citation, hyperlink, and circulation dynamics.
8. IR models for relevance and information need.
9. Rate-distortion and information bottleneck methods for summarization.
10. Decision theory for content value.

The key methodological warning is:

\[
\text{high probability} \ne \text{truth},\qquad
\text{high surprise} \ne \text{value},\qquad
\text{high centrality} \ne \text{credibility},\qquad
\text{low compressibility} \ne \text{meaning}.
\]

Content is mathematical, but no single scalar captures it.

## Source key

`[S1]` Shannon, “A Mathematical Theory of Communication,” introduced the formal communication model, entropy, redundancy, and coding limits. ([people.math.harvard.edu](https://people.math.harvard.edu/~ctm/home/text/others/shannon/entropy/entropy.pdf?utm_source=chatgpt.com))

`[S2]` Cover & Thomas is the canonical modern reference for entropy, KL divergence, mutual information, AEP, source coding, and rate-distortion theory. ([math.ubbcluj.ro](https://math.ubbcluj.ro/~tradu/TI/coverch3.pdf?utm_source=chatgpt.com))

`[S3]` Kolmogorov’s “Three Approaches…” is a foundational source for algorithmic information. ([knowen-production.s3.amazonaws.com](https://knowen-production.s3.amazonaws.com/uploads/attachment/file/3520/Three%2Bapproaches%2Bto%2Bthe%2Bquantitative%2Bdefinition%2Bof%2Binformation.pdf?utm_source=chatgpt.com))

`[S4]` Solomonoff, Chaitin, and Li–Vitányi/Grünwald–Vitányi cover algorithmic probability, program-length complexity, and the relation between Shannon and Kolmogorov information. ([raysolomonoff.com](https://raysolomonoff.com/publications/1964pt1.pdf?utm_source=chatgpt.com))

`[S5]` Jaynes connects information theory and statistical mechanics via maximum entropy inference. ([link.aps.org](https://link.aps.org/doi/10.1103/PhysRev.106.620?utm_source=chatgpt.com))

`[S7]` Salton, Wong, and Yang formalized the vector-space model for automatic indexing. ([dl.acm.org](https://dl.acm.org/doi/10.1145/361219.361220?utm_source=chatgpt.com))

`[S8]` Robertson and Sparck Jones developed probabilistic relevance weighting; Robertson’s BM25 review summarizes the probabilistic relevance framework. ([researchgate.net](https://www.researchgate.net/publication/301222420_Relevance_weighting_of_search_terms?utm_source=chatgpt.com))

`[S9]` Deerwester et al. introduced latent semantic indexing using singular-value decomposition of term-document matrices. ([wordvec.colorado.edu](https://wordvec.colorado.edu/papers/Deerwester_1990.pdf?utm_source=chatgpt.com))

`[S10]` The Eckart–Young–Mirsky theorem states that truncated SVD gives the optimal rank-\(k\) approximation under standard matrix norms. ([rich-d-wilkinson.github.io](https://rich-d-wilkinson.github.io/MATH3030/3.5-lowrank.html?utm_source=chatgpt.com))

`[S11]` Brin and Page’s Google paper used hyperlink structure and PageRank; later mathematical expositions describe PageRank as a stationary distribution of a random walk with teleportation. ([snap.stanford.edu](https://snap.stanford.edu/class/cs224w-readings/Brin98Anatomy.pdf?utm_source=chatgpt.com))

`[S12]` Blei, Ng, and Jordan introduced LDA; Arora et al. give provable topic-model recovery under separability/anchor-word assumptions. ([jmlr.org](https://www.jmlr.org/papers/volume3/blei03a/blei03a.pdf?utm_source=chatgpt.com))

`[S13]` Rosenfeld surveys statistical language modeling; Bengio et al. formalize neural probabilistic language modeling as learning joint probabilities of word sequences. ([cs.cmu.edu](https://www.cs.cmu.edu/~roni/papers/survey-slm-IEEE-PROC-0004.pdf?utm_source=chatgpt.com))

`[S14]` Rabiner reviews HMM theory and algorithms; Chomsky’s finite-state language analysis and probabilistic grammar work frame grammar as formal generation over strings. ([cs.ubc.ca](https://www.cs.ubc.ca/~murphyk/Bayes/rabiner.pdf?utm_source=chatgpt.com))

`[S15]` Rissanen/Grünwald give MDL; Tishby, Pereira, and Bialek formulate the information bottleneck as compression preserving relevant information. ([direct.mit.edu](https://direct.mit.edu/books/monograph/3813/The-Minimum-Description-Length-Principle?utm_source=chatgpt.com))

`[S16]` Harris is foundational for distributional structure; Levy and Goldberg show skip-gram negative sampling as implicit matrix factorization; GloVe is explicitly based on global co-occurrence statistics. ([its.caltech.edu](https://www.its.caltech.edu/~matilde/ZelligHarrisDistributionalStructure1954.pdf?utm_source=chatgpt.com))

`[S17]` Transformer theory sources with formal mathematical claims include universal approximation, Turing-completeness results, and formal-language/circuit-complexity analyses of attention. ([openreview.net](https://openreview.net/forum?id=ByxRM0Ntvr&utm_source=chatgpt.com))

`[S18]` Optimal transport foundations and document applications: Peyré–Cuturi for computational OT and Kusner et al. for Word Mover’s Distance between documents. ([arxiv.org](https://arxiv.org/abs/1803.00567?utm_source=chatgpt.com))
