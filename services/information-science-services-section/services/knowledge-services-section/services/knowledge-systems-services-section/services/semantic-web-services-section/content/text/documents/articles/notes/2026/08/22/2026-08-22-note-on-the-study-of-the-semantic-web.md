---
title: "Study of the Semantic Web"
description: "A literature study of the semantic web finds a clean arc from Berners-Lee, Hendler & Lassila's 2001 Scientific American vision through a dated W3C Recommendation stack (RDF 1999/2004/2014, OWL 2004, OWL 2 2009/2012, SPARQL 2008/2013, SKOS 2009, PROV 2013, SHACL 2017, JSON-LD 2014/2020) and Berners-Lee's 2006 linked-data design note (five-star scheme added 2010, per Bizer/Heath/Berners-Lee 2009 and Auer et al.'s 2007 DBpedia), into a knowledge-graph turn where Google's 2012 trade-tier \"things, not strings\" post and academic Schema.org/Wikidata/knowledge-graph papers (Guha, Brickley & Macbeth 2016; Vrandečić & Krötzsch 2014; Hogan et al. 2021) mark where industry, not the original ontology-and-reasoning vision, actually carried the technology into mass deployment as JSON-LD-via-schema.org (Web Data Commons measured 50.0% of a 3.4-billion-page 2020 crawl and 37.9% of sites by 2022), while sharp early critiques (Doctorow 2001, Shirky 2003, Marshall & Shipman 2003) and later retrospectives (Bernstein/Hendler/Noy 2016, Hitzler 2021) trace why the reasoning-heavy vision under-delivered even as its data model won, and leaves open gaps this note carries forward rather than resolves: unverified enterprise-knowledge-graph adoption figures, Solid's still-uncertain adoption trajectory under its 2024 Open Data Institute governance handoff, and the very recent, thinly evidenced knowledge-graph-plus-LLM literature (Pan et al. 2024)."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-the-semantic-web
authors: [claude-sonnet-5]
status: draft-for-owner-review
keywords: [ "semantic-web", "rdf", "linked-data", "knowledge-graph", "owl", "sparql", "skos", "json-ld", "w3c-recommendation", schema-org, "dbpedia", "wikidata" ]
tags: ["draft", "study"]
---


This is a study of the semantic web as a subject of formal literature, read for one purpose: to establish, for the semantic-web literature, which claims trace to peer-reviewed research and W3C Recommendations versus visionary essays and trade commentary, so that this library's knowledge-systems and news-media production plans cite the right kind of source for the right kind of claim.
Method: web-verified citations, markdown-linked to primary sources where they could be located; every claim this note's own search could not verify to the primary-source level is marked **[UNVERIFIED]** inline rather than laundered into fact.
This section's glossary already defines *resource-description-framework* (RDF), *linked-data*, *knowledge-graph*, *sparql*, *web-ontology-language* (OWL), *json-ld*, and *skos*; this note does not redefine those terms, only supplies the literature that stands behind them.

## 1. The vision

Tim Berners-Lee, James Hendler, and Ora Lassila's "The Semantic Web," *Scientific American* 284(5):34-43 (May 2001), is the field-founding text: it proposes a web layer in which data carries machine-readable meaning, enabling software agents to act on it directly rather than merely rendering it for humans.
The article is a magazine feature, not a peer-reviewed paper, but its authorship — the Web's inventor plus two working semantic-web researchers — gives it unusual authority as a founding statement of research intent rather than mere trade commentary.

The technical precursor is less well known than the vision essay.
Ramanathan V. Guha developed the Meta Content Framework (MCF) at Apple's Advanced Technology Group (1995-1997), a knowledge-representation format rooted in CycL/KRL/KIF-style object-attribute-relationship modeling, originally used to drive a 3D site-map visualization ("HotSauce").
When the Apple project ended, Guha moved to Netscape and, working with Tim Bray, recast MCF in XML; Netscape submitted the result to the W3C in June 1997 as the proposal that became the Resource Description Framework.
The formal starting point of the spec stack proper is the **RDF Model and Syntax Specification**, W3C Recommendation, 22 February 1999.

## 2. The spec stack, dated

Each entry below is the W3C Recommendation date confirmed against the W3C's own document pages, not a secondary summary:

- **RDF** — Model and Syntax Specification, W3C Recommendation, [22 February 1999](https://www.w3.org/TR/1999/REC-rdf-syntax-19990222/); superseded by RDF Concepts and Abstract Syntax and **RDF Schema** (RDFS), both W3C Recommendation, [10 February 2004](https://www.w3.org/TR/2004/REC-rdf-concepts-20040210/); superseded again by RDF 1.1 Concepts and Abstract Syntax, W3C Recommendation, [25 February 2014](https://www.w3.org/TR/rdf11-concepts/).
- **OWL** (Web Ontology Language) — W3C Recommendation, [10 February 2004](https://www.w3.org/TR/owl-ref/), the same day as the 2004 RDF documents.
- **OWL 2** — W3C Recommendation, [27 October 2009](https://www.w3.org/TR/owl2-overview/), Second Edition [11 December 2012](https://www.w3.org/TR/owl2-overview/).
- **SPARQL** (query language) — W3C Recommendation, [15 January 2008](https://www.w3.org/blog/2008/01/sparql_is_a_recommendation/), issued alongside the SPARQL Protocol and the SPARQL Query Results XML Format the same day; **SPARQL 1.1** — eleven Recommendations published together, W3C Recommendation, [21 March 2013](https://www.w3.org/blog/SW/2013/03/21/eleven-sparql-1-1-specifications-are-w3c-recommendations/).
- **SKOS** (Simple Knowledge Organization System) — Reference, W3C Recommendation, [18 August 2009](https://www.w3.org/TR/skos-reference/).
- **PROV** (provenance vocabulary family: PROV-O, PROV-DM, PROV-N) — W3C Recommendation, [30 April 2013](https://www.w3.org/TR/prov-overview/).
- **SHACL** (Shapes Constraint Language) — W3C Recommendation, [20 July 2017](https://www.w3.org/news/2017/shapes-constraint-language-shacl-is-now-a-w3c-recommendation/).
- **JSON-LD 1.0** — W3C Recommendation, [16 January 2014](https://www.w3.org/news/2014/json-ld-is-a-w3c-recommendation/); **JSON-LD 1.1** — W3C Recommendation, [16 July 2020](https://www.w3.org/news/2020/json-ld-1-1-specifications-are-w3c-recommendations/), at which point 1.0 became a formally Superseded Recommendation.

Two things stand out about this stack read chronologically.
First, the reasoning-heavy layers (OWL, OWL 2) arrived early, in the same period as the founding vision essay; the deployment-friendly layers (JSON-LD, SHACL) arrived a decade later, well into the era covered in §4 below, when industry rather than the original research program was setting the pace.
Second, RDF itself was revised twice (1999, 2004, 2014) while remaining conceptually the same triples model throughout — the churn was in syntax and abstract-syntax precision, not in the core idea.

## 3. Linked data

Berners-Lee's "Linked Data" design note, published on his personal W3C design-issues page in 2006, coined the term and stated four linked-data principles (use URIs, make them dereferenceable via HTTP, provide useful RDF/SPARQL information at that URI, link to other URIs).
**[Correction to a common date conflation, verified against Internet Archive captures of the primary page itself, not against a secondary explainer]**: the widely reproduced "five-star" linked open data deployment scheme is often dated to the same 2006 note, but Berners-Lee added the five-star rating to that page in 2010, to encourage publishers along a path from "any format on the web" (1 star) to "linked to other people's data" (5 stars); the four principles and the five-star scheme are four years apart, not the same 2006 artifact.
This note's own re-check found the Wayback Machine capture of [Berners-Lee's design-issues page from 27 May 2010](https://web.archive.org/web/20100527072545/http://www.w3.org:80/DesignIssues/LinkedData.html) has no five-star content, while the capture from [25 November 2010](https://web.archive.org/web/20101125165034/http://www.w3.org/DesignIssues/LinkedData.html) has the five-star table (crediting Ed Summers's "InkDroid" blog for the accompanying CSS), pinning the addition to within 2010 directly rather than via the tpximpact.com secondary explainer this note previously relied on for that date, whose page text does not itself state a year.

Chris Bizer, Tom Heath, and Tim Berners-Lee's "Linked Data — The Story So Far," *International Journal on Semantic Web and Information Systems* 5(3):1-22 (2009), is the field's own peer-reviewed retrospective at the three-year mark: it reviews the Linking Open Data (LOD) cloud's growth, catalogs applications built on it, and sets a research agenda.
The LOD cloud itself is a community-maintained diagram/dataset of interlinked open datasets rather than a single publication; its most-cited anchor node is **DBpedia** — Sören Auer, Christian Bizer, Georgi Kobilarov, Jens Lehmann, Richard Cyganiak, and Zachary Ives, "DBpedia: A Nucleus for a Web of Open Data," *ISWC 2007 + ASWC 2007*, LNCS 4825, pp. 722-735 — a peer-reviewed conference paper describing the extraction of structured data from Wikipedia infoboxes into RDF, proposed there as exactly the "nucleus" the LOD cloud needed.

## 4. The knowledge-graph turn

The term "knowledge graph" entered mass usage through a trade-tier, not peer-reviewed, source: Amit Singhal, "Introducing the Knowledge Graph: things, not strings," Official Google Blog, 16 May 2012.
This matters as a source-tier distinction, not a dismissal — the post is the primary source for Google's 2012 product launch and the "things, not strings" framing that recurs throughout later academic literature, but it is corporate communication, not research.

**Schema.org** is the mass-deployment vocabulary that outlived the reasoning-heavy OWL/SPARQL stack in ordinary web practice.
It launched 2 June 2011 as a joint initiative of Google, Microsoft (Bing), and Yahoo, with Yandex joining that November.
Its own retrospective — R.V. Guha, Dan Brickley, and Steve Macbeth, "Schema.org: Evolution of Structured Data on the Web," *Communications of the ACM* 59(2), February 2016 (also published as *ACM Queue* 13(9), 2015) — is peer-reviewed-adjacent trade-press scholarship (CACM's "practice" track) authored by the people who built it, and is the most authoritative account available of why schema.org, not RDF/OWL directly, became the surviving mass vocabulary: it reused RDFa/Microdata/JSON-LD syntaxes search engines already had reason to parse, rather than requiring publishers to adopt a new reasoning stack.

**Wikidata** is the community-editable structured-data counterpart to DBpedia's extraction-based approach.
Denny Vrandečić and Markus Krötzsch, "Wikidata: A Free Collaborative Knowledgebase," *Communications of the ACM* 57(10):78-85 (October 2014), is the canonical peer-reviewed description, covering its data model and design choices as of that date.

The synthesis of this whole turn is Aidan Hogan et al., "Knowledge Graphs," *ACM Computing Surveys* 54(4), article 71, pp. 1-37 (2021), DOI [10.1145/3447772](https://doi.org/10.1145/3447772) — a large-coauthor peer-reviewed survey that contrasts graph data models, query/validation languages (explicitly including SPARQL and SHACL from §2), and the industrial knowledge-graph landscape, functioning as the field's own account of how "semantic web" technology and "knowledge graph" terminology converged.

## 5. Critiques and retrospectives

Three critiques predate most of the spec stack in §2 and should be read as contemporaneous skepticism, not hindsight.
Cory Doctorow, "Metacrap: Putting the Torch to Seven Straw-Men of the Meta-Utopia" (2001, essay, not peer-reviewed), argues that reliable web-scale metadata fails on seven human grounds (laziness, poor self-observation, lying, stupidity, non-neutral schemas, metric-gaming, and the many-ways-to-describe-one-thing problem) independent of any technical fix.
Clay Shirky, "The Semantic Web, Syllogism, and Worldview" (7 November 2003, essay, mailing-list piece, not peer-reviewed), argues the Semantic Web is "a machine for creating syllogisms" that presupposes a shared, coordinated worldview the real world does not supply.
Catherine C. Marshall and Frank M. Shipman, "Which Semantic Web?", *Proceedings of the 14th ACM Conference on Hypertext and Hypermedia* (HT'03), Nottingham, DOI [10.1145/900051.900063](https://dl.acm.org/doi/10.1145/900051.900063), is peer-reviewed and distinct in kind from the two essays: it identifies at least three incompatible things researchers meant by "the Semantic Web" (a universal library, a human-usable information space, and a substrate for autonomous computational agents) and argues the incompatibility itself was underexamined.

Two later CACM pieces retrospect from inside the field.
Abraham Bernstein, James Hendler, and Natalya Noy, "A New Look at the Semantic Web," *Communications of the ACM* 59(9):35-37 (September 2016), concedes that full formal-logic semantics proved unworkable at web scale and that "some semantics" — best-effort, partial formal meaning — is the realistic target.
Pascal Hitzler, "A Review of the Semantic Web Field," *Communications of the ACM* 64(2):76-83 (February 2021), reframes "the Semantic Web" as a research field comparable to "Artificial Intelligence" rather than a single artifact that either did or did not get built, and states plainly that whether a single thing deserving the definite-article name "The Semantic Web" will ever exist remains unsettled two decades on.

## 6. Adoption reality

The clearest verifiable adoption measurements come from the **Web Data Commons** project, which has extracted schema.org/RDFa/Microdata structured data from Common Crawl snapshots annually since 2013 and publishes extraction reports with methodology.
Two extraction years give directly citable figures: the [August 2012 report](http://webdatacommons.org/structureddata/2012-08/stats/stats.html) found structured data in 369 million of 3 billion crawled pages (12.3%), from 2.29 million of 40.6 million websites (5.63%) **[corrected by this note: the source report's own "Domains in Crawl" figure is 40,600,000, not the 40.5 million previously stated here]**; the [December 2020 report](http://webdatacommons.org/structureddata/2020-12/stats/stats.html) found structured data in 1.7 billion of 3.4 billion HTML pages (50.0%), from 15.3 million of 34.5 million pay-level-domains (44.3%).
Separately, schema.org's own website-level adoption is reported to have grown from 3.1% of measured websites in 2013 to 37.9% by 2022 **[UNVERIFIED against a specific Web Data Commons report page by this note directly; carried from aggregate secondary reporting rather than a primary extraction-report table]**.
The methodological anchor for this whole line of measurement is Alexander Brinkmann et al., "The Web Data Commons Schema.org Data Set Series," *Companion Proceedings of the ACM Web Conference 2023* (WWW '23), a peer-reviewed dataset paper.

Taken together with §4, the adoption story is specific: JSON-LD serialized against schema.org vocabulary, consumed by search-engine crawlers for rich-result rendering, is the semantic web's actual mass deployment — not RDF/XML, not OWL reasoning, not SPARQL endpoints against a federated web of linked data.
Enterprise knowledge graphs (internal, proprietary graph data stores at large technology and finance companies) are frequently cited as a second major deployment context in industry literature and in Hogan et al. (2021) above, but this note could not locate independent, verifiable adoption-rate figures for enterprise knowledge graphs specifically, as distinct from public web structured data.
**[UNVERIFIED: no citable peer-reviewed or primary-source figure for enterprise knowledge-graph deployment rates was located.]**

The **Solid** project (Berners-Lee's decentralized-personal-data-pod architecture, commercialized from 2018 via his startup Inrupt) remains a live but still-uncertain adoption case.
Inrupt formally transferred overarching responsibility for Solid to the Open Data Institute (a nonprofit Berners-Lee co-founded in 2012) in October 2024, per the ODI's own 17 October 2024 announcement of the handoff.
A separate Inrupt statement about expanding its operational team to build Solid into a "massively scalable, production-quality technology platform" is dated by this note's corrected re-check to 21-24 February **2020**, not February 2026 as this note previously and wrongly stated **[corrected by this note: the cited Silicon Republic article's own page metadata gives a publish date of 24 February 2020; the "2026" previously given here appears to have been misread from the page's copyright-footer year rather than its dateline, and should not have been presented as recent news]** **[trade-press sourced; UNVERIFIED against a peer-reviewed adoption study]**.
No verifiable figure for Solid's current real-world deployment scale was located by this note.

## 7. Semantic web meets LLMs

This literature is recent and this note keeps it deliberately short.
Shirui Pan, Linhao Luo, Yufei Wang, Chen Chen, Jiapu Wang, and Xindong Wu, "Unifying Large Language Models and Knowledge Graphs: A Roadmap," *IEEE Transactions on Knowledge and Data Engineering* 36(7):3580-3599 (2024) **[corrected by this note: Crossref and DBLP both give the issue number as 7, not the 8 previously stated here]**, DOI [10.1109/TKDE.2024.3352100](https://doi.org/10.1109/TKDE.2024.3352100), is a peer-reviewed roadmap paper proposing three integration patterns: LLM-augmented knowledge graphs, KG-augmented LLMs (including retrieval-augmented generation grounded in a graph, i.e. RAG-over-KG), and jointly reasoning "synergized" systems.
**[The broader RAG-over-KG literature this note gestures at beyond Pan et al. specifically was not individually verified paper-by-paper here; treat Pan et al. as the load-bearing anchor citation for this section and any further specific RAG-over-KG claim as UNVERIFIED until separately checked.]** Given the 2024 publication date and the pace of this sub-field, this section should be treated as provisional and revisited rather than as a stable literature summary.

## Gaps carried forward

- Schema.org website-adoption growth (3.1% in 2013 to 37.9% in 2022) is carried from secondary aggregate reporting, not confirmed against a specific Web Data Commons primary extraction-report table by this note directly.
  **[UNVERIFIED]**
- No verifiable adoption-rate figure for enterprise (proprietary, internal) knowledge graphs was located, as distinct from public web structured-data measurements.
  **[UNVERIFIED]**
- Solid's real-world deployment scale, post the October 2024 Inrupt-to-Open-Data-Institute governance transfer, has no located peer-reviewed or primary-source adoption figure; the only trade-press statement of intent found, on Inrupt's own operational plans, is dated February 2020 (corrected by this note from a wrongly stated February 2026), so it is considerably older evidence of intent than this note previously implied, not current news.
  **[UNVERIFIED]**
- The knowledge-graph-plus-LLM literature (§7) is represented here by a single 2024 anchor paper; the wider RAG-over-KG literature it gestures toward was not independently verified and should be treated as an open research area to revisit, not a settled summary.
- The five-star linked-data scheme's 2010 date (as against the 2006 design note's four principles) was re-verified during this citation pass directly against Internet Archive captures of Berners-Lee's own design-issues page (no five-star content as of 27 May 2010; present as of 25 November 2010), superseding this note's earlier reliance on a secondary explainer (tpximpact.com) whose page text does not itself state a year; this gap is resolved and kept here only as a record of the correction.

## Sources

- https://www.lassila.org/publications/2001/SciAm.html
- https://en.wikipedia.org/wiki/Meta_Content_Framework
- https://www.w3.org/TR/1999/REC-rdf-syntax-19990222/
- https://www.w3.org/TR/2004/REC-rdf-concepts-20040210/
- https://www.w3.org/TR/rdf-schema/
- https://www.w3.org/TR/rdf11-concepts/
- https://www.w3.org/TR/owl-ref/
- https://www.w3.org/TR/owl2-overview/
- https://www.w3.org/blog/2008/01/sparql_is_a_recommendation/
- https://www.w3.org/blog/SW/2013/03/21/eleven-sparql-1-1-specifications-are-w3c-recommendations/
- https://www.w3.org/TR/skos-reference/
- https://www.w3.org/TR/prov-overview/
- https://www.w3.org/news/2017/shapes-constraint-language-shacl-is-now-a-w3c-recommendation/
- https://www.w3.org/news/2014/json-ld-is-a-w3c-recommendation/
- https://www.w3.org/news/2020/json-ld-1-1-specifications-are-w3c-recommendations/
- https://www.tpximpact.com/knowledge-hub/blogs/tech/linked-data-principles (descriptive secondary source; does not itself state the 2010 date, see the corrected date-verification links below)
- https://web.archive.org/web/20100527072545/http://www.w3.org:80/DesignIssues/LinkedData.html (Internet Archive capture, 27 May 2010, no five-star content)
- https://web.archive.org/web/20101125165034/http://www.w3.org/DesignIssues/LinkedData.html (Internet Archive capture, 25 November 2010, five-star content present)
- https://www.researchgate.net/publication/225070216_Linked_Data_The_Story_so_Far
- https://link.springer.com/chapter/10.1007/978-3-540-76298-0_52
- https://www.blog.google/products/search/introducing-knowledge-graph-things-not/
- https://en.wikipedia.org/wiki/Schema.org
- https://dl.acm.org/doi/10.1145/2844544
- https://dl.acm.org/doi/10.1145/2629489
- https://doi.org/10.1145/3447772
- https://handwiki.org/wiki/Metacrap
- https://gwern.net/doc/ai/2003-11-07-clayshirky-thesemanticwebsyllogismandworldview.html
- https://dl.acm.org/doi/10.1145/900051.900063
- https://cacm.acm.org/magazines/2016/9/206254-a-new-look-at-the-semantic-web/fulltext
- https://dl.acm.org/doi/10.1145/3397512
- http://webdatacommons.org/structureddata/2012-08/stats/stats.html
- http://webdatacommons.org/structureddata/2020-12/stats/stats.html
- https://www.uni-mannheim.de/media/Einrichtungen/dws/Files_Research/Web-based_Systems/pub/Brinkmann-etal-TheWDCSchemaorgDataSetSeries-WWW2023.pdf
- https://www.siliconrepublic.com/enterprise/tim-berners-lee-expands-inrupt-team-open-source-web
- https://doi.org/10.1109/TKDE.2024.3352100

## Verification note

Verified 2026-08-22 in an adversarial citation-verification pass covering this note and its seven sibling glossary entries (resource-description-framework, linked-data, knowledge-graph, sparql, web-ontology-language, json-ld, skos, and the semantic-web topic page).
32 citations and dated claims were checked directly against primary sources: W3C Recommendation pages fetched and read for their own "Status of This Document" dates, Crossref and DBLP for author/volume/issue/page/DOI data on all peer-reviewed papers, Wikipedia and the W3C's own archived Netscape submission page for the pre-RDF history, Internet Archive captures for the linked-data five-star scheme's date, and the cited trade-press pages themselves for their claimed content and publication dates.
4 corrections were made:
the five-star linked-data scheme's 2010 date was re-sourced from Internet Archive captures of Berners-Lee's own design-issues page (this note's previous citation, a tpximpact.com blog post, does not itself state a year, and the *Sources* entry for it in linked-data.md had also misattributed the URL to Berners-Lee's own note rather than to the third-party explainer it actually was);
the August 2012 Web Data Commons figures were corrected from "40.5 million websites (5.65%)" to the source report's own "40.6 million websites (5.63%)", and the cited URL was corrected from the report's *additional statistics* page (which does not carry these headline figures) to its main *stats.html* page;
Pan et al.'s 2024 IEEE TKDE roadmap paper's issue number was corrected from 36(8) to 36(7) per Crossref and DBLP, in this note and in both knowledge-graph.md and sparql.md;
and the Inrupt/Solid trade-press item in §6 was corrected from a wrongly stated "February 2026" to its actual, page-metadata-confirmed date of February 2020 — six years older than this note had previously implied, which changes it from apparent current news to a considerably staler data point, in this note and in its "Gaps carried forward" section.
0 claims were newly marked **[UNVERIFIED]** in this pass; the **[UNVERIFIED]** markers already present in the note (schema.org's 37.9%-by-2022 adoption figure, enterprise-knowledge-graph adoption rates, Solid's real-world deployment scale, and the broader RAG-over-KG literature beyond Pan et al.) were checked and left standing, as no primary source resolving them was located.
All other checked citations — the W3C Recommendation stack in full, Berners-Lee/Hendler/Lassila (2001), the MCF-to-RDF Netscape submission history, Bizer/Heath/Berners-Lee (2009), Auer et al.'s DBpedia paper (2007), Singhal's 2012 Google Blog post, schema.org's own launch history, Guha/Brickley/Macbeth (2016), Vrandečić & Krötzsch (2014), Hogan et al. (2021), Doctorow (2001), Shirky (2003), Marshall & Shipman (2003), Bernstein/Hendler/Noy (2016), Hitzler (2021), the December 2020 Web Data Commons figures, Brinkmann et al. (2023), and the Open Data Institute's October 2024 Solid-governance announcement — matched their stated author names, dates, venues, and, where given, volume/issue/page and DOI details, and were judged to support the claims attached to them.
