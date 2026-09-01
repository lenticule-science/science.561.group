## Research memo: editorial and structural models for a rigorous public knowledge base

**To:** Project sponsors  
**From:** Professor of knowledge organisation  
**Date:** 14 June 2026  
**Subject:** Designing a public knowledge base between an encyclopedia and a scholarly reference work

### Executive recommendation

Build the knowledge base as a **layered, versioned, citable entry system**. Use **Wikipedia** for minimum public-knowledge discipline: verifiability, due weight, source transparency, neutral prose, public correction, and consistent article structure. Use the **Stanford Encyclopedia of Philosophy** for scholarly authority: commissioned expert authorship, subject-editor review, archival versions, author responsibility for revision, and bibliographic depth. Use **Diátaxis** for information architecture: every piece of content should declare whether it teaches, solves, describes, or explains, rather than mixing those purposes in one undifferentiated article. Wikipedia’s own policy says encyclopedic content should be verifiable, neutral, and non-original; SEP’s author guidance explicitly aims at scholarly entries accessible to professionals, students, and wider readers; Diátaxis identifies four documentation needs—tutorials, how-to guides, reference, and explanation—and argues that documentation should be organised around those needs. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AVerifiability))

The synthesis should not be “one article with sections for everyone.” It should be **one entry tree with multiple reading modes**:

```text id="aqiiyv"
Topic entry
├─ 0. Orientation: definition, scope, summary, map of controversies
├─ 1. Explanation: accessible account, why it matters, conceptual background
├─ 2. Reference: definitions, claims, formal statements, data, taxonomies
├─ 3. Research dossier: literature survey, schools, arguments, evidence tables
├─ 4. Guided routes: tutorials, reading paths, worked examples, “how to use this”
├─ 5. Bibliography and source audit: primary, secondary, review, disputed sources
├─ 6. Related entries: semantic neighbours, prerequisites, applications
└─ 7. Version and review record: authors, reviewers, dates, change log, archive link
```

### 1. Wikipedia model: public verifiability, neutral synthesis, and community maintenance

Wikipedia’s editorial model is open, collaborative, and policy-bound. Its own “About” page describes Wikipedia as a free online encyclopedia that anyone can edit, with articles containing many links to guide readers to more information; it also states that content must conform to policies including verifiability by published reliable sources and that personal opinions, unreviewed research, libel, and copyright violations are not allowed. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AAbout))

The core epistemic rule is **verifiability** rather than authorial expertise. Wikipedia defines verifiability as the ability of readers to check that facts or claims correspond to reliable sources, and states that content is determined by published information rather than editors’ beliefs, experiences, or unpublished ideas. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AVerifiability)) Its verifiability policy further requires that all article material be attributable to reliable published sources and that sources support material clearly and directly, while Wikipedia’s no-original-research policy forbids new analysis or synthesis that reaches a conclusion not clearly stated by the sources. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AVerifiability))

The second discipline is **neutral point of view**. Wikipedia defines NPOV as representing significant views fairly, proportionately, and without editorial bias, where those views have been published by reliable sources; it also states that neutrality, verifiability, and no original research are core content policies that must be interpreted together. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3ANeutral_point_of_view)) The more operational form of neutrality is not “view from nowhere,” but **weighted representation**: editors should analyse a variety of reliable sources and convey the information fairly and proportionately, describe disputes rather than participate in them, attribute opinions, avoid treating seriously contested claims as simple facts, and avoid false parity for fringe or pseudoscientific views. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3ANeutral_point_of_view))

Wikipedia’s citation model is pragmatic but demanding. Its citing-sources guideline says inline citations are required for material challenged or likely to be challenged and for all quotations; citations enable users to verify that information is supported by reliable sources, improve credibility, show that content is not original research, help readers find additional information, and give attribution. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3ACiting_sources)) It does not impose one universal citation style, but it requires each article to use a consistent style and to provide enough bibliographic information for a reader to identify, find, and initially evaluate the source. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3ACiting_sources))

Structurally, Wikipedia privileges a **lead plus body plus references** pattern. Its Manual of Style says a simple article should have at least a lead section and references, that headings should clarify and organise content, and that summary-style links can connect a short section to a fuller article. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AManual_of_Style/Layout)) Its featured-article criteria make the quality ideal explicit: a top article should be well-written, comprehensive, well-researched, neutral, stable, and supported by inline citations where appropriate. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AFeatured_article_criteria))

**Implication for the proposed knowledge base:** Wikipedia supplies the public epistemic floor: every claim must be source-auditable; controversial claims must be attributed and weighted; articles should not smuggle unpublished synthesis into public voice; and entry pages should lead readers from summary to detail. But Wikipedia alone is insufficient for a scholarly reference work because its authority is procedural and communal rather than authorial and peer-reviewed.

### 2. SEP model: commissioned authority, refereed entries, modular depth, and versioned citation

The Stanford Encyclopedia of Philosophy offers the strongest model for a knowledge base that wants to sit above a general encyclopedia. SEP states that each entry is maintained and kept current by an expert or group of experts, that entries and substantive updates are refereed by the Editorial Board before publication, and that fixed editions are created quarterly and stored in archives for scholarly citation. ([plato.stanford.edu](https://plato.stanford.edu/about.html))

SEP’s editorial information defines a clear authority chain. Editorial decisions are made by the Principal Editor in consultation with senior and associate editors and the Editorial Board; contributions are normally solicited by invitation; qualified prospective contributors must generally have relevant doctoral credentials and refereed publications; and all entries, whether solicited or approved, are refereed by subject editors or approved external referees. ([plato.stanford.edu](https://plato.stanford.edu/info.html)) Authors remain responsible for maintenance: SEP expects timely revision in response to important new research and valid criticism, and entries not revised within an agreed timetable may be retired from the potential encyclopedia and left in the archives until corrected. ([plato.stanford.edu](https://plato.stanford.edu/info.html))

SEP’s author guidelines are especially relevant to the “between encyclopedia and scholarly reference” design problem. SEP says entries should be scholarly and written to high professional standards while remaining of interest to as wide an audience as possible; entries should be idea-driven rather than person-driven; authors should minimise jargon, introduce technical terms in plain language, and make entries self-contained. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html)) SEP also requires entries to be objective, neutral surveys of the literature rather than advocacy, with balance proportional to the literature and without polemical or idiosyncratic treatment. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html))

SEP’s structural solution to depth is **modularity**. Its guidelines encourage longer entries to be modular and, where useful, to place highly technical, detailed, or scholarly material into separate cross-linked supplementary documents while keeping the main entry a comprehensive overview readable by an intelligent undergraduate in roughly one or two sittings. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html)) SEP’s canonical entry sections include introduction, internal links, main sections, bibliography, academic tools, other internet resources, related entries, and optional acknowledgements. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html))

SEP also solves a major problem of dynamic web reference works: citation stability. Its “How to Cite” guidance says active entries are periodically revised, so scholars should cite archived versions, especially when quoting; fixed editions are archived every three months. ([plato.stanford.edu](https://plato.stanford.edu/cite.html))

**Implication for the proposed knowledge base:** SEP supplies the scholarly authority model: named expert responsibility, editor/referee gates, versioned archives, modular supplements, and an expectation that advanced readers can go deeper without forcing novice readers to do so. But SEP alone is not enough for a broad public knowledge base because it is author-centred and comparatively slow; it needs public-facing navigational discipline and more explicit reader-mode separation.

### 3. Diátaxis model: architecture by reader need

Diátaxis is not an editorial policy; it is an information-architecture framework. Its official description says it identifies four distinct needs and four corresponding forms of documentation—tutorials, how-to guides, technical reference, and explanation—and that documentation should be organised around those needs. ([diataxis.fr](https://diataxis.fr/)) Its “compass” reduces classification to two questions: whether content informs action or cognition, and whether it serves acquisition or application of skill. ([diataxis.fr](https://diataxis.fr/compass/))

The four modes are sharply distinguished. A **tutorial** is learning-oriented: a guided practical activity in which the student learns by doing something meaningful toward an achievable goal. ([diataxis.fr](https://diataxis.fr/tutorials/)) A **how-to guide** is goal-oriented: it guides a competent reader through a real-world problem or toward a result. ([diataxis.fr](https://diataxis.fr/how-to-guides/)) **Reference** is information-oriented: it describes the machinery or object as succinctly and orderly as possible, providing truth and certainty for users at work. ([diataxis.fr](https://diataxis.fr/reference/)) **Explanation** is understanding-oriented: it gives discursive treatment, context, background, and reflection, helping readers understand why things matter and how they fit together. ([diataxis.fr](https://diataxis.fr/explanation/))

Diátaxis also warns that poor structure damages content. Its “map” says the framework is effective because it is a two-dimensional structure rather than a list, and that architectural faults infect and undermine content. ([diataxis.fr](https://diataxis.fr/map/)) For complex hierarchies, Diátaxis explicitly allows top-level landing pages for tutorial, how-to, reference, and explanation sections, each containing overviews of its contents. ([diataxis.fr](https://diataxis.fr/complex-hierarchies/))

**Implication for the proposed knowledge base:** Diátaxis supplies the navigation logic. It prevents the common failure mode in scholarly public writing: an entry that begins as an accessible explanation, swerves into literature review, inserts a technical reference table, then ends with practical advice. Those are all legitimate functions, but they should be separated into visible, cross-linked zones.

### 4. Comparative diagnosis

Wikipedia is strongest where public knowledge bases usually fail: transparent sourcing, visible uncertainty, neutral treatment of disagreement, and scalable correction. Its weakness is that public consensus is not the same as peer review, and prohibiting original synthesis limits the ability to produce high-level scholarly integration. SEP is strongest where Wikipedia is weak: expert commissioning, referee review, named accountability, and stable scholarly citation. Its weakness is lower participatory bandwidth and slower adaptation. Diátaxis is strongest where both encyclopedias can become hard to navigate: it classifies content by reader need rather than by the author’s preferred order of exposition.

The proposed knowledge base should therefore combine:

1. **Wikipedia’s epistemic hygiene:** verifiable claims, reliable sources, source hierarchy, due weight, inline citations, public correction.
2. **SEP’s authority layer:** commissioned or approved subject authors, editorial board review, archival versions, periodic revision duties.
3. **Diátaxis’s structural grammar:** separate but connected tutorial, how-to, reference, and explanation functions.

### 5. Recommended entry architecture

Each topic should be a **single canonical entry tree**, not four unrelated pages. The tree should preserve one stable topic identity while separating reading modes.

**0. Orientation layer.** This is the public landing page: definition, scope, why the topic matters, key claims, key controversies, prerequisites, and “where to go next.” It borrows from Wikipedia’s lead-section discipline and SEP’s introduction requirement. It should be readable by a non-specialist but should not be unsourced.

**1. Explanation layer.** This is the accessible conceptual essay. It answers: What is this? Why does it matter? How did the problem arise? What are the major interpretations? It should use plain language, examples, diagrams where useful, and a “controversy map.” It follows Diátaxis explanation, but with Wikipedia/SEP citation discipline.

**2. Reference layer.** This is the austere factual and formal layer. It contains definitions, classifications, formal statements, timelines, tables, taxonomies, named positions, theorem-like claims, standards, datasets, and terminology. It should be consultable rather than narrative. It follows Diátaxis reference and SEP’s technical-definition expectations.

**3. Research dossier.** This is the scholarly layer. It contains the literature survey, state of the field, competing schools, methodological disputes, evidentiary basis, primary-source interpretation, and annotated bibliography. It should be peer-reviewed before publication, and it should distinguish primary literature, secondary literature, reviews, and contested sources. SEP’s bibliography practice, including separation of refereed bibliography from other internet resources, is a strong precedent. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html))

**4. Guided routes.** These are Diátaxis-style tutorials and how-to guides adapted to knowledge work: “How to read this debate,” “How to evaluate evidence on this topic,” “How to use this concept in research,” “A first path through the entry,” or “A formal path for mathematically trained readers.” They should not be the main article; they are learning and application paths through the entry tree.

**5. Source audit.** Each entry should include an explicit source audit: source inclusion criteria, excluded or deprecated sources, treatment of primary sources, review status, and where disagreements among sources occur. This imports Wikipedia’s reliable-source and no-original-research discipline while adapting it for scholarly work: unlike Wikipedia, the research dossier may synthesise, but the synthesis must be attributed to named authors and approved through peer review.

**6. Version and review record.** Every entry should have citable releases, a current active version, archived versions, named responsible editors, review dates, reviewer roles, and a change log. SEP’s quarterly archive model should be imitated in spirit: readers need stable citations even when the public version improves. ([plato.stanford.edu](https://plato.stanford.edu/about.html))

### 6. Editorial governance

Adopt a **two-channel contribution model**.

The **public channel** should allow suggestions, corrections, source proposals, accessibility improvements, and issue reports. This captures Wikipedia’s public-correction advantage without allowing unreviewed edits directly into authoritative text. Community discussion should be visible, and routine corrections can be fast-tracked by editors.

The **scholarly channel** should control publication of interpretive, synthetic, technical, and review-sensitive content. Major entries should have named lead authors or author teams, assigned subject editors, external referees where appropriate, and periodic review obligations. New claims in the explanatory or research layers should be tagged by epistemic status: established consensus, majority view, significant minority view, contested claim, emerging claim, primary-source report, or editorial synthesis.

This avoids the main institutional failure of hybrid public knowledge bases: either they become Wikipedia with a scholarly-looking skin, or they become a closed reference work with a public-facing abstract. The proposed system should be neither. It should be **publicly inspectable but editorially gated**.

### 7. Citation and source policy

Use three citation levels.

**Level 1: Public verification.** Every factual claim that is controversial, technical, numerical, historical, interpretive, or likely to be challenged needs an inline citation. This follows Wikipedia’s inline citation discipline. ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3ACiting_sources))

**Level 2: Scholarly apparatus.** Research dossiers should use discipline-appropriate full citations, DOIs or archival identifiers where available, primary/secondary separation, and annotated bibliographies. SEP’s house-style distinction between bibliography, other internet resources, and archived citation practice is a useful model. ([plato.stanford.edu](https://plato.stanford.edu/guidelines.html))

**Level 3: Source audit metadata.** Sources should be classified by role: primary evidence, secondary interpretation, review literature, canonical reference, data source, legal/technical standard, public communication, or contested source. This gives readers a transparent epistemic map rather than a flat list of footnotes.

### 8. Final design principle

The key synthesis is: **one topic, multiple modes, one citation graph, one version history**.

A reader should be able to enter through a public explanation, jump to a formal definition, inspect the scholarly literature, follow a guided route, and cite a stable version without leaving the entry’s navigable tree. Wikipedia teaches the system how to be publicly accountable; SEP teaches it how to be scholarly and citable; Diátaxis teaches it how not to confuse the reader’s needs.

### Primary sources consulted

Wikipedia, “Wikipedia:About”; “Wikipedia:Verifiability”; “Wikipedia:Neutral point of view”; “Wikipedia:No original research”; “Wikipedia:Reliable sources”; “Wikipedia:Citing sources”; “Wikipedia:Consensus”; “Wikipedia:Manual of Style/Layout”; “Wikipedia:Featured article criteria.” ([en.wikipedia.org](https://en.wikipedia.org/wiki/Wikipedia%3AAbout))

Stanford Encyclopedia of Philosophy, “Editorial Information”; “About the Stanford Encyclopedia of Philosophy”; “Guidelines and Policies for Entry Content”; “How to Cite the SEP.” ([plato.stanford.edu](https://plato.stanford.edu/info.html))

Diátaxis, “Diátaxis”; “Start here: Diátaxis in five minutes”; “Tutorials”; “How-to guides”; “Reference”; “Explanation”; “The map”; “The compass”; “Diátaxis in complex hierarchies.” ([diataxis.fr](https://diataxis.fr/))
