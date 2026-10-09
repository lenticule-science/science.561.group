---
title: Vocabulary mismatch research memo
description: "To: Archive stewards and search-system designers From: Professor of Information Science Date: June 14, 2026 Subject: Vocabulary mismatch, controlled vocabularies, query expansion, and hybrid retrieval for outsider access to expert…"
---
## Research Memo: Vocabulary Mismatch and Findability in Jargon-Heavy Expert Archives

**To:** Archive stewards and search-system designers  
**From:** Professor of Information Science  
**Date:** June 14, 2026  
**Subject:** Vocabulary mismatch, controlled vocabularies, query expansion, and hybrid retrieval for outsider access to expert terminology

### Executive finding

A small, jargon-heavy expert archive should **not** choose between “traditional” controlled vocabulary and “modern” embedding search. It should maintain a **curated SKOS/ISO 25964-aligned concept scheme** as the archive’s semantic spine, expose outsider-facing synonyms and scope notes, and run **hybrid retrieval**: BM25 or another lexical engine for exact rare-term matching, plus dense retrieval for paraphrase and semantic discovery. This is especially important when the archive contains many neologisms, because dense models often help with paraphrase but can underperform on rare entities, salient phrases, almost-unseen terms, and out-of-domain language. ([arxiv.org](https://arxiv.org/abs/2112.05662?utm_source=chatgpt.com))

### 1. The classic vocabulary problem

Furnas, Landauer, Gomez, and Dumais’s 1987 paper, **“The Vocabulary Problem in Human-System Communication,”** remains the canonical empirical statement of the problem. They found that spontaneous word choice varies sharply across users: in their studied domains, the probability that two people independently favored the same term was under 0.20. Their proposed remedy was “unlimited aliasing,” meaning systems should expect many legitimate names for the same object or action rather than assume one “correct” vocabulary. ([dl.acm.org](https://dl.acm.org/doi/10.1145/32206.32212?utm_source=chatgpt.com))

For an expert archive, this implies that the archive’s internal language is not wrong, but it is **insufficiently hospitable** as a search interface. Outsiders may search with ordinary-language approximations, older terminology, institutional terms, adjacent-field terms, translations, examples, or symptomatic descriptions. The archive’s findability depends on systematically linking those words to the archive’s own concepts.

### 2. Controlled vocabularies, thesauri, and SKOS

Controlled vocabularies address vocabulary mismatch by establishing preferred terms, non-preferred terms, broader/narrower/related concepts, and scope notes. In LIS practice, Lancaster and Soergel are foundational treatments of vocabulary control and thesaurus construction; ANSI/NISO Z39.19 codifies guidelines for monolingual controlled vocabularies including synonym rings, taxonomies, and thesauri. ([archive.org](https://archive.org/details/vocabularycontro0000lanc_s3l0?utm_source=chatgpt.com))

The relevant international standard is **ISO 25964**, *Thesauri and interoperability with other vocabularies*. ISO 25964-1 covers the development and maintenance of thesauri for information retrieval, including monolingual and multilingual thesauri and data exchange; ISO 25964-2 covers interoperability and mappings between thesauri and other structured vocabularies. ([iso.org](https://www.iso.org/standard/53657.html))

**SKOS** provides the web-publication layer. The W3C SKOS Reference defines SKOS as a common RDF data model for sharing and linking knowledge organization systems, including thesauri, classification schemes, taxonomies, and subject heading systems. SKOS supports preferred, alternative, and hidden labels; broader, narrower, and related relationships; and mapping properties such as `skos:exactMatch`, `skos:closeMatch`, `skos:broadMatch`, `skos:narrowMatch`, and `skos:relatedMatch`. ([w3.org](https://www.w3.org/TR/skos-reference/?utm_source=chatgpt.com))

The key design principle for a jargon-heavy archive is **concept-first, label-many**: preserve the expert term as the preferred label when that is epistemically important, but attach outsider labels, historical labels, spelling variants, acronyms, translations, and common misconceptions as alternative or hidden labels.

### 3. Query expansion

Query expansion is the retrieval-side counterpart to vocabulary control. Classical relevance feedback begins with Rocchio’s vector-space method, in which the query is shifted toward terms in relevant documents and away from non-relevant documents. Later methods include pseudo-relevance feedback, local context analysis, and relevance models such as Lavrenko and Croft’s language-model approach. ([nlp.stanford.edu](https://nlp.stanford.edu/IR-book/html/htmledition/relevance-feedback-and-query-expansion-1.html?utm_source=chatgpt.com))

Query expansion is powerful but risky. Expansion can improve recall when the user’s language and the corpus’s language differ, but it can also cause **query drift** if expansion terms are too broad, too metaphorical, or drawn from false positives. Voorhees’s WordNet experiments are a cautionary example: general lexical-semantic expansion did not reliably improve retrieval when original queries were already relatively complete. ([link.springer.com](https://link.springer.com/chapter/10.1007/978-1-4471-2099-5_7?utm_source=chatgpt.com))

For this archive, expansion should therefore be **controlled, inspectable, and provenance-aware**. Prefer expansion terms from the archive’s own SKOS thesaurus, curated crosswalks, and query logs over unsupervised global synonym sources. Neural document expansion, such as doc2query-style predicted queries, can be useful, but it should be reviewed or filtered because generated outsider phrases can introduce interpretive noise. ([arxiv.org](https://arxiv.org/abs/1904.08375?utm_source=chatgpt.com))

### 4. BM25, dense retrieval, and high neologism density

BM25 remains a strong lexical baseline because it rewards exact matching, term rarity, term frequency saturation, and document-length normalization. Its lineage runs through Robertson and Sparck Jones’s probabilistic relevance weighting and Robertson and Walker’s 2-Poisson/BM25 work. ([asistdl.onlinelibrary.wiley.com](https://asistdl.onlinelibrary.wiley.com/doi/abs/10.1002/asi.4630270302?utm_source=chatgpt.com))

Dense retrieval, represented by dual-encoder systems such as DPR, maps queries and documents into learned vector spaces and can recover documents even when the query and document do not share words. Karpukhin et al. showed dense passage retrieval outperforming a strong BM25 baseline on several open-domain QA benchmarks. ([aclanthology.org](https://aclanthology.org/2020.emnlp-main.550/?utm_source=chatgpt.com))

However, the conditions of a small expert archive are not the same as large benchmark QA. High neologism density creates a domain-shift and rare-term problem: new or locally coined terms may be underrepresented in pretraining data, absent from supervised retrieval training, or semantically overloaded. BEIR found BM25 to be a robust zero-shot baseline across heterogeneous retrieval tasks, while dense models often struggled with out-of-domain generalization. Other studies specifically report that neural IR models can fail to generalize term importance for out-of-domain or almost-unseen terms, and that dense retrievers may lag BM25 on salient phrases and rare entities. ([arxiv.org](https://arxiv.org/abs/2104.08663?utm_source=chatgpt.com))

The inference for a neologism-rich archive is clear: **dense-only search is unsafe**. Use dense retrieval for semantic bridging, but keep lexical retrieval as a first-class signal. Hybrid retrieval, reciprocal-rank fusion, or learning-to-rank over BM25, dense scores, thesaurus matches, field boosts, and citation/collection metadata is the appropriate architecture.

### 5. Recommended findability strategy

The archive should implement four layers.

**First, build a lightweight thesaurus.** Model each major expert concept as a SKOS concept with a URI, preferred label, alternative labels, hidden labels, definitions, scope notes, provenance notes, and broader/narrower/related links. Use ISO 25964 principles for concept scope, equivalence, hierarchy, and associative relationships; use SKOS for web publication and machine-readable interchange. ([niso.org](https://www.niso.org/schemas/iso25964))

**Second, create outsider-access labels without erasing expert language.** Every neologism should have an “outsider entry path”: ordinary-language paraphrases, near-synonyms, historical terms, adjacent disciplinary terms, acronyms, spelling variants, and common search phrases. Where a match is imperfect, use `skos:closeMatch` or `skos:relatedMatch` rather than `skos:exactMatch` to avoid falsely collapsing distinct concepts. ([w3.org](https://www.w3.org/TR/skos-reference/))

**Third, run hybrid retrieval.** BM25 should index titles, abstracts, full text, tags, notes, names, and SKOS labels with field boosts. Dense retrieval should index abstracts, summaries, and curated concept descriptions, not only raw jargon-heavy text. Results should be fused rather than letting dense retrieval replace lexical retrieval. For rare coined terms, BM25 may be the only reliable route; for outsider paraphrase, dense retrieval and thesaurus expansion may supply recall. ([arxiv.org](https://arxiv.org/abs/2104.08663?utm_source=chatgpt.com))

**Fourth, evaluate with outsider queries.** Do not evaluate only with expert-authored queries. Build a small test set from actual outsiders, students, adjacent-field researchers, and failed-search logs. For each information need, record the outsider wording, the expert term, relevant documents, and acceptable near misses. Track recall@k, nDCG@k, zero-result rate, reformulation rate, and “found by which channel”: BM25, SKOS expansion, dense retrieval, or hybrid fusion.

### 6. Practical policy for neologisms

Every new expert term should trigger a vocabulary-management workflow:

1. Assign a persistent concept URI.  
2. Record the preferred expert label.  
3. Add definition, scope note, and examples.  
4. Add outsider-facing aliases and hidden labels.  
5. Map to external vocabularies only where conceptually justified.  
6. Add the concept to search expansion rules.  
7. Add one or more outsider test queries to the evaluation set.

This turns neologism production from a findability liability into a maintained semantic asset.

### Conclusion

The literature does not support abandoning controlled vocabulary because embeddings exist, nor does it support relying only on a thesaurus while ignoring neural retrieval. Furnas et al. show that vocabulary mismatch is structural, not accidental. ISO 25964 and SKOS provide mature infrastructure for representing concept systems and mappings. Query expansion provides a retrieval mechanism, but it must be controlled to avoid drift. BM25 remains essential when rare terms, exact phrases, names, and neologisms matter; dense retrieval is valuable for semantic approximation and outsider paraphrase. The best design for a small, expert, jargon-heavy archive is therefore **curated vocabulary plus hybrid retrieval plus continuous outsider-query evaluation**.
