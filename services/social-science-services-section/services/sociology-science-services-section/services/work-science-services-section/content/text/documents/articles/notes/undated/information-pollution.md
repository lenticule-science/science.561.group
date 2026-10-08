---
title: Content Farms as Information Pollution
description: Research memo framing mass low-quality content as a negative externality on readers, search engines, journalists, advertisers, archives, and AI systems. Argues the central harm is epistemic crowding rather than mere falsehood, and that content farms convert shared discovery infrastructure into private arbitrage infrastructure, with web pollution becoming model pollution through training-data contamination.
keywords: ["information-pollution", "content-farm", "epistemic-crowding", "negative-externality", "training-data-contamination", "common-crawl", "public-web"]
---

**Research memo — June 11, 2026**

## Abstract

Mass low-quality content degrades the public information environment not simply because it contains “bad headlines,” but because it functions as **information pollution**: a large-scale negative externality imposed on readers, search engines, journalists, advertisers, archives, and AI systems. Content farms, MFA sites, SEO spam networks, junk-news publishers, synthetic “AI slop,” affiliate pages, republishing networks, and disinformation-for-profit operations exploit the same infrastructure: search ranking, programmatic advertising, recommendation systems, cheap labor, content management systems, analytics dashboards, and now generative AI. Google’s own spam policies now explicitly include scaled content abuse, expired-domain abuse, scraping abuse, site-reputation abuse, and attempts to manipulate generative AI responses in Search. ([developers.google.com](https://developers.google.com/search/docs/essentials/spam-policies))

The central harm is not just falsehood. It is **epistemic crowding**: low-value, duplicated, synthetic, or strategically optimized pages occupy the slots, links, citations, ad impressions, archive captures, and training tokens through which public knowledge is discovered and remembered. This makes primary sources, local reporting, minority-language knowledge, community expertise, tested recipes, product evidence, public records, and archival truth harder to find.

---

## Core thesis

**Content farms are pollution of the open web because they convert shared discovery infrastructure into private arbitrage infrastructure.** They take advantage of search engines, recommendation systems, ad exchanges, affiliate programs, and AI training pipelines while pushing verification, filtering, provenance, and trust costs onto everyone else.

The analogy to pollution is useful because the damage is cumulative. A single low-quality page may be harmless. Millions of pages, copied across domains, optimized for search, monetized through ads, republished through syndication, scraped into datasets, retrieved by AI answer engines, and preserved in archives become a structural contaminant. Common Crawl says its dataset exceeds 10 PiB, monthly crawls commonly include more than 2 billion pages, and filtered Common Crawl data has been used in many LLM training pipelines; this means web pollution can become model pollution. ([commoncrawl.org](https://commoncrawl.org/about))

---

## Terminology: related but distinct systems

| Term | Primary meaning | Typical unit | Main incentive | Main damage |
|---|---:|---:|---:|---|
| **Clickbait** | Rhetorical or packaging tactic that withholds, exaggerates, or teases information | Headline, thumbnail, teaser | Increase clicks, dwell, shares | Attention capture, reader fatigue, misleading expectations |
| **Content farm** | Production organization optimized for high-volume low-cost publishing | Site, network, CMS operation | Search traffic, ad revenue, affiliate revenue | SERP clutter, duplication, source displacement |
| **Content mill** | Labor arrangement for cheap, fast writing/editing/translation | Task platform, freelance queue | Low unit cost, flexible labor supply | Precarious work, deskilling, low editorial care |
| **MFA site** | “Made for Advertising” property built around ad arbitrage | Domain, ad stack, traffic-buying loop | Buy cheap traffic, sell higher-value ad impressions | Ad waste, bad UX, ad-density pollution |
| **SEO spam** | Search-engine manipulation | Page, domain, link network | Ranking capture | Primary-source displacement, search degradation |
| **Junk news** | News-like publishing with low reliability, weak sourcing, partisan or sensational framing | Outlet, article network | Attention, ideology, ads, influence | Civic confusion, trust erosion |
| **AI slop** | Mass synthetic low-quality content, often templated, repetitive, or weakly supervised | Article, image, video, answer | Scale with minimal labor | Training contamination, provenance opacity, synthetic clutter |
| **Disinformation-for-profit** | Politically consequential attention arbitrage | Network, campaign, outlet | Revenue, influence, sometimes both | False beliefs, agenda laundering, polarization |
| **Platform gaming** | General adaptation to ranking/payment systems | Any content object | Exploit metrics | Incentive drift across the whole ecosystem |

The distinctions matter. A clickbait headline can appear on a legitimate article. A content mill can employ precarious writers doing real work under exploitative conditions. An MFA site can receive real human traffic and still be harmful because the business model is built around ad yield rather than information value. Industry descriptions of MFA sites emphasize ad clutter, poor user experience, generic or repetitive content, paid traffic sourcing, rapid ad refresh, and arbitrage rather than necessarily invalid traffic. ([iabtechlab.com](https://iabtechlab.com/using-openrtb-signals-to-identify-made-for-advertising/))

---

## The production system

Content-farm pollution is best understood as a pipeline.

| Stage | Practices | Infrastructure |
|---|---|---|
| **Demand sensing** | Keyword research, trend scraping, competitor monitoring, Google Trends, social listening | SEO tools, analytics dashboards, search APIs |
| **Production** | Freelance writing, rewriting, AI generation, translation, spinning, scraping, templating | CMSs, LLMs, content mills, image generators |
| **Packaging** | Curiosity-gap headlines, FAQ blocks, listicles, schema markup, “best X” pages | SEO plugins, headline testing, structured data |
| **Distribution** | Search, paid social, expired domains, site-reputation abuse, recommendation widgets, syndication | Google Search, social platforms, ad exchanges |
| **Monetization** | Programmatic ads, affiliate links, lead generation, sponsored posts, data capture | Ad networks, exchanges, affiliate platforms |
| **Feedback** | Ranking, RPM, CTR, dwell-time, ad viewability, conversion tracking | A/B tests, analytics, ad-verification tools |
| **Recirculation** | Scraping, republishing, archive capture, LLM training, answer-engine retrieval | Common Crawl, web archives, RAG systems, AI search |

Google’s 2024 spam updates targeted three nodes in this pipeline: scaled content abuse, expired-domain abuse, and site-reputation abuse. Google said the March 2024 core update reduced low-quality and unoriginal content in search results by about 45%, and its policies now treat scaled content abuse as many pages generated primarily to manipulate search rankings, including pages produced with generative AI, scraping, stitching, or little original value. ([blog.google](https://blog.google/products-and-platforms/products/search/google-search-update-march-2024/))

---

## Why “pollution” is the right frame

“Low quality” is often treated as a content-property problem: Is the article true? Is the headline misleading? Is it AI-written? But pollution is relational. It concerns what a page does to the surrounding information ecology.

### Pollution damages:

| Damaged object | Mechanism |
|---|---|
| **Attention** | Users must sift through duplicated, padded, misleading, or templated pages. |
| **Search** | Optimized pages crowd out primary sources, small sites, public documents, and original reporting. |
| **Journalism** | Scrapers and affiliate farms capture traffic and ad revenue while legitimate outlets bear reporting costs. |
| **Labor** | Writers, editors, translators, and creators face downward pressure from piecework, AI substitution, and volume metrics. |
| **Archives** | Web archives preserve polluted states of the web, including resurrected domains and synthetic republishing networks. |
| **AI systems** | Training and retrieval pipelines ingest synthetic, duplicated, or adversarially optimized text. |
| **Public trust** | Readers learn that search results, local-looking news sites, reviews, and citations may be synthetic or strategic. |

The economic point is that polluters privatize gains and socialize costs. An MFA operator may earn from ad impressions; a user pays with time, advertisers pay for low-value placements, search engines pay with anti-spam infrastructure, journalists lose traffic, archives store noise, and AI systems inherit contaminated corpora.

---

## Search-result degradation

Search degradation is not merely a complaint that “Google got worse.” It is a structural conflict between search engines and actors who produce pages specifically to satisfy ranking systems rather than users. A longitudinal study of product-review queries found that major search engines struggled with highly optimized affiliate content and that affiliate-link use was inversely related to content complexity; the authors also warned that the boundary between benign content, spam, and content farms is blurry and likely to worsen with generative AI. ([dl.acm.org](https://dl.acm.org/doi/10.1007/978-3-031-56063-7_4?utm_source=chatgpt.com))

### How content farms affect search

| Search harm | Example |
|---|---|
| **SERP crowding** | “Best air purifier 2026” returns affiliate pages with recycled specs rather than lab tests. |
| **Primary-source displacement** | Government, manufacturer, academic, or local-agency pages rank below SEO intermediaries. |
| **Freshness theater** | Old articles are retitled “2026 update” without new reporting. |
| **Snippet capture** | FAQ blocks answer simple queries while hiding weak sourcing. |
| **Domain authority laundering** | Expired or high-reputation domains host unrelated affiliate or coupon content. |
| **Synthetic long-tail flooding** | AI pages target every obscure query combination, including low-resource languages and local places. |
| **Citation contamination** | Search results surface fake or weak sources that later appear in articles, papers, or AI answers. |

Google’s own policy examples now include expired domains repurposed for casino, affiliate, or medical content; third-party “site reputation abuse” such as coupon or payday-loan content hosted on otherwise reputable sites; and scraping or automated transformation without meaningful added value. ([developers.google.com](https://developers.google.com/search/docs/essentials/spam-policies))

---

## MFA sites and ad-arbitrage infrastructure

MFA sites are not just “bad websites.” They are ad-tech artifacts. They exist because programmatic advertising can reward impressions even when the surrounding experience is low value.

Industry sources describe MFA pages as properties designed to win programmatic scale and profit from ad arbitrage: paid traffic is bought cheaply, pages are loaded with ads, and revenue is earned from impressions, refreshes, or clicks. These sites may not always count as classic fraud because the impressions can come from real humans; the problem is that the economic system rewards low-quality attention capture. ([iabtechlab.com](https://iabtechlab.com/using-openrtb-signals-to-identify-made-for-advertising/))

ANA/WFA benchmarking found MFA spend fell from 15% of programmatic spend in 2023 to 6.2% in 2024 among participating advertisers, suggesting that measurement, blocklists, and supply-path discipline can reduce—but not eliminate—the problem. ([wfanet.org](https://wfanet.org/knowledge/item/2025/01/21/ana-s-2024-programmatic-benchmark-study-progress-but-challenges-remain))

### MFA as pollution

| MFA feature | Pollution effect |
|---|---|
| High ad density | Makes pages slow, unreadable, and extractive |
| Rapid ad refresh | Monetizes mere presence rather than attention or value |
| Paid traffic loops | Converts arbitrage into apparent audience demand |
| Generic content | Fills pages with just enough text to host ads |
| Weak provenance | Users cannot easily tell who made the content or why |
| Brand-safety opacity | Advertisers unintentionally fund low-quality or misinformation sites |

Ad-tech research also shows that misinformation and low-quality publishers can exploit opacity in advertising supply chains, including by pooling inventory with unrelated sites to evade brand-safety controls. ([arxiv.org](https://arxiv.org/abs/2210.06654))

---

## Journalism and local-news dilution

Content-farm pollution harms journalism in two directions: it competes with original reporting for search and ad revenue, and it imitates journalistic form while avoiding journalistic costs.

The local-news case is especially severe. NewsGuard reported in 2024 that “pink slime” local-looking sites in the U.S. outnumbered daily newspapers in its count, and Medill’s 2025 State of Local News work reported widening news deserts and many counties with only one local source. ([newsguardtech.com](https://www.newsguardtech.com/press/sad-milestone-fake-local-news-sites-now-outnumber-real-local-newspaper-sites-in-u-s/))

Academic work on the NELA-PS dataset describes pink-slime outlets as low-quality, often partisan sources that frame themselves as authentic local news and exploit local information voids; the dataset contains millions of articles from more than a thousand sources. ([arxiv.org](https://arxiv.org/abs/2403.13657))

### Journalism harms

| Harm | Mechanism |
|---|---|
| **Traffic diversion** | Search-optimized summaries outrank original reporting. |
| **Ad revenue leakage** | Programmatic ads fund republishers, scrapers, or MFA sites. |
| **Local identity mimicry** | Fake local outlets borrow town names and newspaper aesthetics. |
| **Beat dilution** | Crime, schools, weather, obituaries, and elections are templated at scale. |
| **Source laundering** | Partisan or synthetic content appears as neutral community information. |
| **Labor degradation** | Writers are paid by volume, replaced by AI, or asked to supervise synthetic output. |

This does not mean all workers in these systems are villains. Many are precarious freelancers, translators, editors, moderators, or creators responding to bad incentives. The exploitative structure lies in the payment model: speed, quantity, and search capture are rewarded more reliably than verification, originality, or public value.

---

## AI slop and synthetic-content farms

Generative AI reduces the cost of producing plausible text, images, summaries, reviews, recipes, biographies, local stories, product guides, and fake citations. NewsGuard’s AI tracking center reported 3,006 AI-generated or AI-assisted news and information sites across 16 languages as of March 17, 2026, many of which publish large volumes of articles with little human oversight. ([newsguardtech.com](https://www.newsguardtech.com/special-reports/ai-tracking-center))

Earlier NewsGuard reporting found brands unintentionally advertising on AI-generated news sites through programmatic systems, including sites producing extraordinary article volumes. ([newsguardtech.com](https://www.newsguardtech.com/misinformation-monitor/june-2023)) Reuters Institute analysis similarly describes AI-generated websites masquerading as news for political agendas, SEO, or ad revenue, including defunct or dormant news brands repurposed with synthetic content. ([reutersinstitute.politics.ox.ac.uk](https://reutersinstitute.politics.ox.ac.uk/news/ai-generated-slop-quietly-conquering-internet-it-threat-journalism-or-problem-will-fix-itself))

Academic work suggests the detection problem is real. Puccetti and colleagues found that fine-tuning open models on news articles was sufficient to generate news-like texts that native speakers struggled to distinguish from human-written articles, while practical detection at web scale remains difficult. ([arxiv.org](https://arxiv.org/abs/2406.12128))

### Dead internet theory: myth and symptom

The “dead internet theory” is usually overstated as a literal claim that most of the web is bots. But it functions as a symptom of a real perception: users increasingly encounter pages, comments, reviews, images, and answers whose origin is unclear. A 2026 study of websites from 2022–2025 estimated that by mid-2025 roughly 35% of newly published websites were classified as AI-generated or AI-assisted, while also finding no statistically significant evidence of reduced factual accuracy in that sample. This is important: the problem is not simply that AI text is always false; it is that provenance, diversity, and trust become harder to assess. ([arxiv.org](https://arxiv.org/abs/2604.26965))

---

## AI training-data pollution and model collapse

The web is not only read by people. It is also crawled into datasets, filtered into corpora, embedded into vector databases, retrieved by answer engines, and used to train or fine-tune models.

Nature’s 2024 model-collapse paper argues that indiscriminate training on model-generated content can cause irreversible defects in learned distributions, especially the loss of low-probability tails. The authors frame model-generated data as a pollutant for future training sets when it is not identified and controlled. ([nature.com](https://www.nature.com/articles/s41586-024-07566-y))

The most vulnerable knowledge is not the average fact. It is the tail: rare dialects, local traditions, small communities, expert edge cases, historical anomalies, Indigenous knowledge underrepresented in mainstream corpora, minority-language material, and noncommercial public records. Model collapse is therefore also a cultural and archival risk: synthetic averages can crowd out the very forms of knowledge that are already sparsely represented.

### AI-system harms

| AI pipeline | Pollution mode |
|---|---|
| **Pretraining** | Synthetic pages and duplicated content distort frequency distributions. |
| **Fine-tuning** | Low-quality instruction data normalizes shallow answers. |
| **RAG retrieval** | Search-optimized pages enter context windows instead of primary sources. |
| **Answer engines** | Summaries cite weak sources or omit provenance. |
| **Citation generation** | Models fabricate, misattribute, or over-rely on polluted references. |
| **Feedback loops** | AI answers are republished, crawled, and reused as future training data. |

Recent research on “retrieval collapse” argues that AI-generated web content can dominate retrieval pools and reduce source diversity; in one experiment, 67% contamination in the pool produced more than 80% contamination in exposure, while answer accuracy could appear stable despite reliance on synthetic sources. ([arxiv.org](https://arxiv.org/abs/2602.16136))

---

## Answer-engine pollution

Search pollution is evolving into answer-engine pollution. Traditional SEO tries to rank pages. Generative Engine Optimization, adversarial SEO for LLMs, and AI-answer manipulation try to shape what answer engines quote, retrieve, summarize, or recommend.

Google’s spam policies now explicitly mention attempts to manipulate generative AI responses in Search. ([developers.google.com](https://developers.google.com/search/docs/essentials/spam-policies)) Research on generative-engine optimization finds that source visibility in AI-generated answers can be influenced by content modifications, while adversarial SEO research shows that LLM-integrated search and browsing systems can be manipulated by crafted website content. ([arxiv.org](https://arxiv.org/abs/2311.09735?utm_source=chatgpt.com))

This changes the target of pollution. The goal is no longer only “rank my page.” It becomes “make the machine say my claim,” “make the answer cite my page,” or “make my synthetic source appear canonical.”

---

## Worked examples

### 1. Product-review spam

A user searches “best stroller for city apartments” or “best air purifier for allergies 2026.” The result page is crowded with affiliate articles that repeat manufacturer specs, lightly paraphrase reviews, and use tables optimized for rich snippets. The actual best sources—Consumer Reports-style testing, repair forums, safety recalls, manuals, independent labs, or long-term user communities—may be harder to find. This is search pollution because commercial pages capture visibility while externalizing verification costs to users.

### 2. Recipe spam

A user wants a reliable recipe for a traditional dish. Search returns pages padded with autobiographical filler, SEO FAQs, affiliate cookware links, AI-generated substitutions, and copied techniques. The harm is not merely annoyance. Food knowledge becomes detached from tested practice, cultural context, seasonal variation, and named cooks. Synthetic recipe pages can also generate unsafe or nonsensical instructions when no one has actually cooked the dish.

### 3. Local-news mimicry

A town loses its newspaper. A new site appears with the town’s name, local weather, school-board blurbs, police items, and election stories. Some content is scraped, some templated, some partisan, some AI-written. Readers see a newspaper-like aesthetic but not a newsroom-like accountability structure. Pink-slime research and monitoring show how fake-local outlets exploit local information voids and mimic neutral local news. ([newsguardtech.com](https://www.newsguardtech.com/press/sad-milestone-fake-local-news-sites-now-outnumber-real-local-newspaper-sites-in-u-s/))

### 4. Expired-domain resurrection

An old school, charity, local newspaper, or community site expires. A new operator buys the domain and uses its inherited reputation to host gambling, coupon, medical, affiliate, or AI content. Google explicitly names expired-domain abuse as a spam practice when old domains are repurposed to manipulate rankings. ([developers.google.com](https://developers.google.com/search/docs/essentials/spam-policies)) The damage is archival as well as search-related: old links now point to misleading new material, and the public memory of a domain is overwritten.

### 5. Answer-engine contamination

A user asks an AI assistant for “the safest supplement for X,” “history of this local tribe,” or “what happened in this town election.” The answer engine retrieves high-ranking synthetic or SEO-optimized pages, summarizes them, and returns a confident answer. The system may appear fluent and useful, but its source diversity has collapsed. Retrieval-collapse research suggests this can happen even when apparent answer accuracy does not immediately reveal the contamination. ([arxiv.org](https://arxiv.org/abs/2602.16136))

---

## What information becomes harder to find?

Content-farm pollution most harms information that is valuable but weakly monetized.

| Vulnerable information | Why vulnerable |
|---|---|
| **Primary documents** | Often plain, unoptimized, PDF-based, or hard to parse. |
| **Local public records** | Low traffic, inconsistent formatting, little SEO investment. |
| **Original reporting** | Expensive to produce, easy to summarize or scrape. |
| **Minority-language knowledge** | Less moderation, fewer canonical institutions, sparse corpora. |
| **Indigenous and community knowledge** | Often relational, contextual, oral, locally governed, or noncommercial. |
| **Technical edge cases** | Forums and manuals are displaced by generic AI/SEO pages. |
| **Historical material** | Old domains decay, are repurposed, or are drowned by synthetic retrospectives. |
| **Tested recipes and craft knowledge** | Easily copied but hard to verify without practice. |
| **Product evidence** | Affiliate incentives favor conversion over testing. |
| **Corrections and context** | Updates, retractions, and uncertainty rank less well than simplified summaries. |

The central pattern: knowledge that lacks a monetization engine is vulnerable to knowledge that has one.

---

## Effects on public trust

Content-farm pollution produces a specific kind of distrust: not simply “I believe nothing,” but “I cannot tell what kind of thing I am looking at.” Is this a review or an affiliate page? A local newspaper or a political network? A source or a scraper? A human article or AI filler? A citation or a hallucination? A revived domain or the original institution?

That uncertainty weakens public knowledge even when individual articles are not false. Trust depends on legible provenance, stable institutions, accountable authorship, correction practices, and recognizable genre boundaries. Content-farm systems blur all of these.

---

## Risks and cautions

1. **Do not equate AI content with bad content.** AI can support accessibility, translation, summarization, transcription, and small-newsroom workflows. The issue is low-oversight scale, opacity, duplication, and optimization against public-interest discovery.

2. **Do not romanticize pre-AI web publishing.** Human-written content farms, affiliate spam, scraper sites, and junk news existed before generative AI.

3. **Do not blame only workers.** Many people producing content-mill material are precarious writers or editors responding to low wages, weak labor protections, and platform-driven metrics.

4. **Detection can harm the vulnerable.** AI detectors and spam classifiers can mislabel nonstandard prose, second-language writing, minority dialects, or small publishers.

5. **Anti-spam governance can centralize power.** When search engines, ad exchanges, or AI platforms decide what counts as “quality,” they may protect users but also increase dependence on private gatekeepers.

6. **Filtering can erase the archive.** Low-quality content should be labeled and contextualized, not simply vanished. Pollution research requires preservation as well as mitigation.

---

## How canonical sources can defend themselves

Canonical sources cannot solve the whole problem, but they can reduce displacement and improve machine-readable trust.

| Defense | Practice |
|---|---|
| **Provenance clarity** | Stable author pages, organization pages, editorial policies, correction logs, publication dates, update histories |
| **Canonicalization** | `rel=canonical`, persistent URLs, DOIs, permalinks, structured metadata |
| **Machine-readable source status** | Schema.org markup, citations, dataset links, public APIs, RSS feeds |
| **Direct distribution** | Newsletters, library partnerships, institutional repositories, community archives |
| **Anti-scraping strategy** | Rate limits, licensing, monitoring, but with care not to block legitimate archiving |
| **Answer-ready public pages** | Concise “source of record” explainers for common queries, without clickbait |
| **Copy monitoring** | Track plagiarism, domain impersonation, and unauthorized syndication |
| **Ad-tech pressure** | Encourage advertisers to exclude MFA, junk-news, and scraper inventory |
| **Community governance** | Especially for Indigenous, local, and minority-language knowledge: define what should be public, private, contextual, or non-extractive |

Provenance standards such as C2PA and Content Credentials aim to provide origin and edit-history metadata for digital content, but security analyses and platform tests suggest provenance infrastructure is not yet sufficient by itself, especially for high-stakes trust decisions. ([c2pa.org](https://c2pa.org/))

---

## How archives can label or filter low-quality synthetic content

Archives should not simply delete polluted material. They should preserve it while making its status researchable.

### Recommended archival signals

| Signal | Use |
|---|---|
| First-seen date | Distinguish original publication from later republication |
| Domain age and ownership changes | Detect resurrection and reputation laundering |
| Duplicate clusters | Identify copied, syndicated, spun, or templated pages |
| Ad density and affiliate ratio | Flag monetization-driven pages |
| Byline stability | Detect fake authors, mass bylines, or missing accountability |
| Source graph | Show whether a page cites primary sources or other farms |
| AI/provenance metadata | Record declared or cryptographic provenance where available |
| Content similarity over time | Detect rewritten archives or sudden topical shifts |
| Language and locality mismatch | Flag fake-local or translated spam patterns |
| Crawl context | Preserve surrounding domain, ads, scripts, and metadata |

The goal is a layered archive: preserve the polluted web, but let researchers filter by provenance, duplication, monetization, source diversity, and synthetic-content likelihood.

---

## Open research questions

1. **Measurement:** What percentage of web pages are synthetic, duplicated, templated, or ad-arbitrage-driven by sector and language?

2. **Search displacement:** Which kinds of primary sources are most often outranked by SEO intermediaries?

3. **Local vulnerability:** How do pink-slime, AI-local, and news-desert dynamics interact in counties with little original reporting?

4. **Labor:** How are writers, editors, translators, and moderators being reorganized into AI-supervision and content-QA roles?

5. **Ad-tech accountability:** Which exchanges, SSPs, DSPs, and verification vendors are most effective at excluding MFA and junk inventory?

6. **Model training:** How much synthetic or duplicated content enters major training corpora after filtering?

7. **Retrieval systems:** Can answer engines report source diversity, first-publication status, and provenance uncertainty?

8. **Archive governance:** How can archives label polluted content without creating opaque blacklists or harming small publishers?

9. **Cultural knowledge:** Which communities need stronger defenses against extraction, synthetic imitation, or decontextualized republication?

10. **Policy:** Should ad exchanges, search engines, or AI developers bear legal duties for provenance, labeling, or pollution mitigation?

---

## Annotated bibliography

**Google Search spam policies and 2024 update.** Essential primary source for current definitions of scaled content abuse, scraping abuse, expired-domain abuse, site-reputation abuse, and manipulation of generative AI responses in Search. ([developers.google.com](https://developers.google.com/search/docs/essentials/spam-policies))

**IAB Tech Lab, Index Exchange, ANA/WFA on MFA sites.** Useful for understanding MFA as ad-tech infrastructure rather than merely poor editorial quality; these sources describe ad clutter, arbitrage, generic content, paid traffic, and advertiser mitigation. ([iabtechlab.com](https://iabtechlab.com/using-openrtb-signals-to-identify-made-for-advertising/))

**Vekaria, Nithyanand, and Shafiq, “The Inventory is Dark and Full of Misinformation.”** Academic ad-tech study showing how opaque programmatic supply chains allow low-quality and misinformation publishers to monetize and evade brand-safety mechanisms. ([arxiv.org](https://arxiv.org/abs/2210.06654))

**Bevendorff et al., “Is Google Getting Worse?”** Longitudinal search-engine study showing persistent problems with highly optimized affiliate content, especially in product-review queries. ([dl.acm.org](https://dl.acm.org/doi/10.1007/978-3-031-56063-7_4?utm_source=chatgpt.com))

**NewsGuard AI Tracking Center and related monitoring.** Current monitoring source for AI-generated news and information sites, including the March 2026 count of 3,006 identified sites across 16 languages. ([newsguardtech.com](https://www.newsguardtech.com/special-reports/ai-tracking-center))

**Reuters Institute on AI-generated news sites.** Good synthesis of AI news farms as both political-influence infrastructure and financially motivated SEO/ad-revenue infrastructure, including domain resurrection and labor replacement. ([reutersinstitute.politics.ox.ac.uk](https://reutersinstitute.politics.ox.ac.uk/news/ai-generated-slop-quietly-conquering-internet-it-threat-journalism-or-problem-will-fix-itself))

**Puccetti et al., “AI “News” Content Farms Are Easy to Make and Hard to Detect.”** Demonstrates how easily news-like synthetic text can be produced and how difficult reliable detection can be in practice. ([arxiv.org](https://arxiv.org/abs/2406.12128))

**Shumailov et al., “AI models collapse when trained on recursively generated data.”** Foundational model-collapse paper for understanding synthetic-data feedback loops and the risk of losing low-probability distributional tails. ([nature.com](https://www.nature.com/articles/s41586-024-07566-y))

**“Retrieval Collapses When AI Pollutes the Web.”** Important for answer-engine pollution: argues that AI-generated web content can dominate retrieval exposure and reduce source diversity even when apparent answer accuracy remains deceptively stable. ([arxiv.org](https://arxiv.org/abs/2602.16136))

**Dolezal, Alam, Graham, and Bohacek, “The Impact of AI-Generated Text on the Internet.”** Useful counterweight to panic narratives: estimates large growth in AI-generated or AI-assisted websites while finding no simple collapse in factual accuracy. ([arxiv.org](https://arxiv.org/abs/2604.26965))

**Common Crawl documentation and Mozilla-linked findings.** Crucial for connecting web pollution to AI training corpora because Common Crawl-scale data is central to many LLM pipelines. ([commoncrawl.org](https://commoncrawl.org/about))

**NewsGuard and NELA-PS work on pink slime.** Key sources for local-news dilution, fake-local publishing, and the exploitation of news deserts. ([newsguardtech.com](https://www.newsguardtech.com/press/sad-milestone-fake-local-news-sites-now-outnumber-real-local-newspaper-sites-in-u-s/))

**C2PA / Content Credentials and critiques.** Useful for provenance defenses, while reminding researchers that provenance standards require platform adoption and security hardening before they can be relied on in high-stakes settings. ([c2pa.org](https://c2pa.org/))

---

## Bottom line

Content farms degrade the public information environment by turning the web’s discovery, advertising, archival, and training systems into arbitrage surfaces. They do not merely produce bad articles; they alter what can be found, what gets funded, what gets remembered, what gets cited, and what machines learn. The deepest harm is not that every polluted page is false. It is that the public loses reliable ways to distinguish source from scraper, locality from imitation, expertise from optimization, archive from resurrection, and knowledge from monetized residue.
