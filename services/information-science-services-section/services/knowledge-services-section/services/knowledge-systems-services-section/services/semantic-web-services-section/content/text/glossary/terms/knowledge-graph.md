---
name: Knowledge Graph
description: The industrial-scale successor to the linked-data vision, popularized by Google's trade-tier 2012 "things, not strings" announcement and given peer-reviewed academic grounding via Schema.org (Guha, Brickley & Macbeth 2016), Wikidata (Vrandečić & Krötzsch 2014), and Hogan et al.'s 2021 ACM Computing Surveys synthesis, whose surviving mass-deployment form is JSON-LD structured data against schema.org vocabulary rather than the federated RDF/SPARQL web the original semantic-web vision proposed.
date-created: 2026-08-22
aliases:
  - knowledge graph
  - Google Knowledge Graph
  - enterprise knowledge graph
instance-of: data-model
---

A knowledge graph is a large graph-structured dataset of entities (people, places, organizations, concepts — "things") and the typed relations between them, used to support search, question-answering, and reasoning applications.
The term entered mass usage through a trade-tier, not peer-reviewed, source: Amit Singhal, "Introducing the Knowledge Graph: things, not strings," Official Google Blog, 16 May 2012, announcing Google's product built on an acquired entity database (Freebase) plus additional sources.
The "things, not strings" framing — search understanding concepts rather than matching text — recurs throughout the later academic literature even though its origin is a corporate announcement, not a paper.

## Academic grounding

Three peer-reviewed or peer-reviewed-adjacent sources give the term its academic footing.
**Schema.org**, the vocabulary most knowledge graphs on the open web are built from, launched 2 June 2011 as a joint initiative of Google, Microsoft (Bing), and Yahoo (Yandex joined that November); its builders' own account — R.V. Guha, Dan Brickley & Steve Macbeth, "Schema.org: Evolution of Structured Data on the Web," *Communications of the ACM* 59(2) (2016) — explains why it, not [RDF](./resource-description-framework.md)/[OWL](./web-ontology-language.md) directly, became the surviving mass vocabulary: it reused syntaxes (RDFa, Microdata, and increasingly [JSON-LD](./json-ld.md)) that search engines already had reason to parse.
**Wikidata**, the community-editable structured-data knowledge base underlying much of Wikipedia's infobox data, is described in Denny Vrandečić & Markus Krötzsch, "Wikidata: A Free Collaborative Knowledgebase," *Communications of the ACM* 57(10):78-85 (2014).
The synthesis of the whole turn is Aidan Hogan et al., "Knowledge Graphs," *ACM Computing Surveys* 54(4), article 71 (2021), which contrasts graph data models and knowledge-graph query/validation languages including [SPARQL](./sparql.md) and SHACL.

## Relation to linked data and adoption reality

Knowledge graphs, as industrially deployed, largely abandoned [linked-data](./linked-data.md)'s original commitment to a federated web of dereferenceable, cross-linked open datasets in favor of centralized, often proprietary graph stores.
The measurable mass-deployment reality is JSON-LD-serialized schema.org markup: Web Data Commons found structured data (schema.org, RDFa, Microdata combined) in 50.0% of a 3.4-billion-page December 2020 Common Crawl extraction, up from 12.3% of a 3-billion-page August 2012 extraction.
Enterprise (internal, proprietary) knowledge graphs are widely discussed in industry literature as a second major deployment context, but this library's own literature review could not locate a verifiable adoption-rate figure for them specifically.
**[UNVERIFIED: no peer-reviewed or primary-source enterprise-knowledge-graph adoption figure located.]** See the fuller adoption discussion at [the semantic-web study note](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-the-semantic-web.md#6-adoption-reality).

## Knowledge graphs and large language models

The most recent literature layer treats knowledge graphs as a grounding mechanism for large language models.
Pan, Luo, Wang, Chen, Wang & Wu, "Unifying Large Language Models and Knowledge Graphs: A Roadmap," *IEEE Transactions on Knowledge and Data Engineering* 36(7):3580-3599 (2024) **[corrected by this note: issue 7, not 8]**, proposes LLM-augmented knowledge graphs, knowledge-graph-augmented LLMs (including retrieval-augmented generation grounded in a graph), and jointly reasoning systems.
This sub-literature is recent and thin; treat any claim beyond Pan et al. itself as provisional.

## Sources

- Singhal, A. (2012).
  "Introducing the Knowledge Graph: things, not strings."
  Official Google Blog. https://www.blog.google/products/search/introducing-knowledge-graph-things-not/
- Guha, R.V., Brickley, D., & Macbeth, S. (2016).
  "Schema.org: Evolution of Structured Data on the Web."
  *Communications of the ACM*, 59(2). https://dl.acm.org/doi/10.1145/2844544
- Vrandečić, D., & Krötzsch, M. (2014).
  "Wikidata: A Free Collaborative Knowledgebase."
  *Communications of the ACM*, 57(10), 78-85. https://dl.acm.org/doi/10.1145/2629489
- Hogan, A. et al. (2021).
  "Knowledge Graphs."
  *ACM Computing Surveys*, 54(4), article 71. https://doi.org/10.1145/3447772
- Web Data Commons extraction reports (2012, 2020). http://webdatacommons.org/structureddata/2012-08/stats/stats.html ; http://webdatacommons.org/structureddata/2020-12/stats/stats.html
- Pan, S. et al. (2024).
  "Unifying Large Language Models and Knowledge Graphs: A Roadmap."
  *IEEE TKDE*, 36(7), 3580-3599. https://doi.org/10.1109/TKDE.2024.3352100
