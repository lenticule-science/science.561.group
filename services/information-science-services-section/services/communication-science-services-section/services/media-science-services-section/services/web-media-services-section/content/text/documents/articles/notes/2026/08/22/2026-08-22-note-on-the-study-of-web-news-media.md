---
title: "Study of Web News Media"
description: "A literature study of web news media across eight sub-literatures finds a consistent peer-reviewed/institutional-report/trade-press split — Boczkowski's Digitizing the News, Nielsen & Ganter's 'Dealing with Digital Intermediaries' and The Power of Platforms, Christin's Metrics at Work, Petre's All the News That's Fit to Click, Tandoc's 'Journalism is Twerking?', Myllylahti's newspaper-paywall study, and Vosoughi, Roy & Aral's Science paper on true-and-false-news diffusion anchor the peer-reviewed core; the Tow Center's Post-Industrial Journalism report, the Reuters Institute's Digital News Report, Northwestern Medill's State of Local News reports, and Bengani's Tow Center 'pink slime' investigations anchor an institutional-report tier; and Demand Media's content-farm history, Google's AMP launch and 2021 reversal, and NewsGuard's self-reported AI-content-farm count anchor a trade-press/vendor tier not to be cited as if it carried peer-reviewed weight — and it carries forward specific unresolved gaps (no independent audit of NewsGuard's count, no primary-source confirmation of some DNR figures beyond secondary summaries, and an open question over whether Juul & Ugander's 2021 cascade-size finding confirms or complicates Vosoughi et al.'s structural claims) rather than resolving them."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-web-news-media
authors:
  - claude-sonnet-5
status: draft-for-review
keywords: ["web-news-media", "digital-journalism", "platform-publisher-relations", "newsroom-analytics", "web-syndication", "rss", "atom", "schema-org", "paywall", "pink-slime-journalism", "news-desert", "misinformation"]
tags: ["draft", "study"]
---


This is a study of web news media as a subject of formal research, read for one purpose: to establish which claims about web-native news production, distribution, and economics trace to peer-reviewed literature versus institutional (think-tank/research-center) reports versus trade press, so that later production work in this section cites the right kind of source for the right kind of claim.
Method: web-verified citations, checked directly against publisher, journal, or primary-source pages rather than taken on secondary report; every markdown link below points to a page fetched or search-confirmed during this study, and every claim this study could not verify to a primary-source level is marked **[UNVERIFIED]** inline rather than laundered into fact.
This section's only existing note — the 2026-07-29 Gemini Notebook Studio report, "Strategic Governance Framework: Aligning Metric Architecture with Content Integrity" — is a provider-generated speculative synthesis about metric design and platform governance; its own frontmatter states it "carries no execution, governance, publication, or truth authority."
Section 3 below relates that report's abstract framing of "fast manipulation signals" versus "slow quality signals" to the actual empirical newsroom-analytics literature it would need to rest on, without treating the report itself as a citable source for any empirical claim.

## 1. Digitization of newsrooms

**Peer-reviewed core.** Pablo J. Boczkowski, *Digitizing the News: Innovation in Online Newspapers* (MIT Press, 2004, 244 pp., ISBN 0-262-02559-0), is the foundational academic monograph in this sub-literature ([MIT Press](https://direct.mit.edu/books/monograph/2408/Digitizing-the-NewsInnovation-in-Online-Newspapers); [Business History Review review, Cambridge Core](https://www.cambridge.org/core/journals/business-history-review/article/abs/digitizing-the-news-innovation-in-online-newspapers-by-pablo-j-boczkowski-cambridge-mit-press-2004-xi-243-pp-illustrations-bibliography-index-cloth-30-isbn-0262025590/F265515E5819ABD59A36A53B42A1D0E8)).
Based on case studies of three US newspapers' adoption of internet technology, it argues against technological determinism: incumbent newsrooms adapted existing practice into digital production rather than being revolutionized by it.
The book won the 2005 International Communication Association Outstanding Book Award and was co-winner of the National Communication Association's 2005 Book of the Year (Critical and Cultural Studies Division).

**Institutional tier.** C.W. Anderson, Emily Bell & Clay Shirky, *Post-Industrial Journalism: Adapting to the Present* (Tow Center for Digital Journalism, Columbia Journalism School, released November 27, 2012) is a research-center report, not a peer-reviewed publication ([Tow Center](https://towcenter.columbia.edu/news/post-industrial-journalism-adapting-present); [CJR](https://www.cjr.org/behind_the_news/post_industrial_journalism_ada.php)).
It argues that journalism as a profession lost the relative coherence it held through most of the twentieth century, with authority redistributed away from legacy organizations toward individual journalists and startups, and calls for a change in journalists' "self-conception," not just tactics.
Boczkowski documents an earlier, adaptive phase of digitization; Anderson/Bell/Shirky document a later, more disruptive phase in which the organizational container itself comes apart.
The two should be cited for different historical moments, not treated as a single continuous claim.

## 2. Platform-publisher relations

**Peer-reviewed core.** Rasmus Kleis Nielsen & Sarah Anne Ganter, "Dealing with Digital Intermediaries: A Case Study of the Relations between Publishers and Platforms," *New Media & Society* 20(4), 1600–1617 (2018), DOI: [10.1177/1461444817701318](https://journals.sagepub.com/doi/10.1177/1461444817701318), is based on interviews with editors, senior management, and product developers at a large European news organization.
It finds relations with Facebook and Google structured by tension between short-term operational opportunity and long-term strategic fear of dependency.
Nielsen & Ganter extended this into a book, *The Power of Platforms: Shaping Media and Society* (Oxford University Press, 2022, 261 pp., Oxford Studies in Digital Politics series) ([OUP](https://global.oup.com/academic/product/the-power-of-platforms-9780190908867); [Reuters Institute](https://reutersinstitute.politics.ox.ac.uk/news/power-platforms)), tracing publisher-platform relations across the US, France, Germany, and the UK from research beginning in 2010, drawing on original interviews.
As an authored academic-press monograph in this same research program it is treated here alongside the 2018 article as peer-reviewed-tier work, distinct from the institutional-report tier below.

**Institutional tier.** The Reuters Institute's *Digital News Report* (DNR), an annual research-institute publication (Oxford), documents the referral-traffic collapse this platform-relations literature predicted.
Per the 2024 edition, referrals to news sites from Facebook fell 48% year-on-year and from X (formerly Twitter) fell 27% — this figure is confirmed directly in the DNR executive summary itself ([Reuters Institute, 2024 executive summary](https://reutersinstitute.politics.ox.ac.uk/digital-news-report/2024/dnr-executive-summary)).
An earlier draft of this note additionally claimed Facebook referrals fell "from roughly 2.3 billion in December 2022 to as low as roughly 1.2 billion in November 2023"; that specific pair of figures does not appear in the DNR executive summary and does not appear in the [Press Gazette piece](https://pressgazette.co.uk/media-audience-and-business-data/media_metrics/facebooks-referral-traffic-for-publishers-down-50-in-12-months/) cited alongside it either — that article instead reports an aggregate Facebook-referral decline, across 792 tracked sites, from 1.3 billion in March 2018 to 561 million by May 2024, plus a separate single-publisher figure (mirror.co.uk, 2.3 million page views in December 2022 falling to 286,000) that appears to be the actual source of the "2.3" figure, misread as billions rather than millions and for a different metric (page views, one publisher) than the aggregate referral-traffic claim it was attached to; that sentence has been removed and the specific volume figures are marked **[UNVERIFIED]** and should not be reused.
The DNR attributes this to Facebook and X deliberately deprioritizing news and out-links in favor of proprietary/video formats, corroborated by the Reuters Institute's own reporting that "social media turns away from the news" ([Reuters Institute](https://reutersinstitute.politics.ox.ac.uk/news/social-media-turns-away-news-publishers-meet-audiences-other-channels)).
The DNR is a large annual survey-based research-institute publication, methodologically serious but not a peer-reviewed journal output, and its year-to-year figures should be cited to the specific edition, as done here (2024), not to "the Reuters Institute" generally.

## 3. Metrics and analytics in newsrooms

**Peer-reviewed core.** Angèle Christin, *Metrics at Work: Journalism and the Contested Meaning of Algorithms* (Princeton University Press, 2020) ([Princeton UP](https://press.princeton.edu/books/ebook/9780691200002/metrics-at-work-pdf-1); [LSE Review of Books](https://blogs.lse.ac.uk/lsereviewofbooks/2021/09/20/book-review-metrics-at-work-journalism-and-the-contested-meaning-of-algorithms-by-angele-christin/)), draws on four years of fieldwork and 100+ interviews in US and French web newsrooms.
Its central finding complicates any single "metrics drive clickbait" narrative: American journalists in her sample routinely disregarded traffic numbers, deferring instead to peer judgment of quality, while French journalists fixated on traffic as a sign of public resonance — the same computational technology producing divergent organizational effects across national newsroom cultures.
Caitlin Petre, *All the News That's Fit to Click: How Metrics Are Transforming the Work of Journalists* (Princeton University Press, 2021) ([Princeton UP](https://press.princeton.edu/books/hardcover/9780691177649/all-the-news-thats-fit-to-click); [American Journal of Sociology review](https://www.journals.uchicago.edu/doi/abs/10.1086/720773)), studied the New York Times, Gawker, and the analytics vendor Chartbeat directly, and documents real-time analytics dashboards deliberately designed with game-like feedback (immersive displays, instant scores, rankings) to win journalists' trust — while showing that journalists also turn metrics back into leverage for professional autonomy rather than being purely subject to them.
Edson C. Tandoc Jr., "Journalism is Twerking? How Web Analytics Is Changing the Process of Gatekeeping," *New Media & Society* 16(4), 559–575 (2014), DOI: [10.1177/1461444814530541](https://journals.sagepub.com/doi/10.1177/1461444814530541), based on 150 hours of newsroom observation and 30 interviews across three online newsrooms, names a specific mechanism — "de-selection," where analytics drive what gets pulled or downplayed rather than only what gets produced — as a new gatekeeping practice distinct from classical gatekeeping theory.

**Relation to this section's existing note.** The 2026-07-29 Gemini Notebook report's distinction between "fast manipulation signals" (clicks, scroll-stops, outrage replies) and "slow quality signals" (trust, learning, accuracy) is a speculative, non-empirical framing with no citations of its own; it is not, on its own, evidence of anything happening in real newsrooms.
Christin, Petre, and Tandoc are the actual field-tested literature that such a framework would need to engage before informing any governance work in this section: Christin in particular shows that the report's implied universal "recommender game equilibrium" does not hold uniformly even across two comparable Western newsrooms (American versus French), which is the kind of empirical qualification any future work building on the July report should carry forward rather than skip.

## 4. Syndication and structured-news standards

This sub-literature is primary-source and standards-body documentation rather than academic literature, and it is load-bearing for this library's own production plans, so dates and version numbers matter more here than usual.

**RSS lineage.** Dan Libby and Ramanathan V. Guha at Netscape released RDF Site Summary 0.9 — the first RSS version — in March 1999 ([RSS history, RSS Advisory Board](https://www.rssboard.org/rss-history); [Simple Wikipedia](https://simple.wikipedia.org/wiki/Really_Simple_Syndication)).
In July 1999 Libby released RSS 0.91, dropping RDF and folding in elements from Dave Winer's competing "ScriptingNews" syndication format, renaming it "Rich Site Summary."
After 2001 the format bifurcated and reconverged: the RSS-DEV Working Group and Winer developed it in parallel until Winer released RSS 2.0 on August 19, 2002 (per the RSS Advisory Board's own version history, corrected here from an earlier draft's "September 2002"); RSS 2.0.1 was published under the "Really Simple Syndication" name by the Berkman [Klein] Center for Internet & Society at Harvard Law School on July 15, 2003, with Winer as author.
Atom, IETF RFC 4287 (December 2005, authored by M. Nottingham and R. Sayre) ([RFC Editor](https://www.rfc-editor.org/info/rfc4287/); [IETF text](https://www.ietf.org/rfc/rfc4287.txt)), was developed specifically to fix RSS's accumulated interoperability problems with a more precisely specified XML syndication format.

**News-industry XML/JSON standards.** IPTC NewsML-G2 is the news industry's XML standard for exchanging text, image, video, and audio news plus structured event/sports metadata, in continuous development since IPTC began reworking the original NewsML format in 2004 (current specification versions maintained at [iptc.org/standards/newsml-g2](https://iptc.org/standards/newsml-g2/)).
IPTC ninjs ("news in JSON") is the corresponding lightweight JSON format, approved and released in October 2013, maintained today in parallel 1.x/2.x/3.x branches ([iptc.org/standards/ninjs](https://iptc.org/standards/ninjs/); [GitHub](https://github.com/iptc/newsinjson)).

**Vendor/search-engine structured data.** schema.org's `NewsArticle` type's essential properties are headline, image, datePublished, author, and publisher; Google's own developer documentation states there is no structured-data requirement to be eligible for Google News features such as Top Stories, but recommends `Article`/ `NewsArticle` markup, prefers JSON-LD over microdata/RDFa, and requires images at least 1200×675px (versus a 696×400px minimum for ordinary articles) for eligibility in richer News surfaces ([Google Search Central](https://developers.google.com/search/docs/appearance/structured-data/article); [schema.org/NewsArticle](https://schema.org/NewsArticle)).

**Google AMP.** The Accelerated Mobile Pages Project was announced by Google on October 7, 2015, alongside 30+ initial publisher/technology partners from Google's Digital News Initiative, and began appearing in search results on February 24, 2016 ([Wikipedia](https://en.wikipedia.org/wiki/Accelerated_Mobile_Pages); [TechCrunch](https://techcrunch.com/?p=1249933)).
In June 2021, Google's Page Experience update removed AMP as a requirement for mobile Top Stories eligibility, opening that surface to any sufficiently fast page and making Core Web Vitals a ranking factor in its place; the rollout ran June through August 2021 ([Search Engine Land](https://searchengineland.com/amp-wont-be-required-for-googles-top-stories-section-335276); [Google Search Central Blog](https://developers.google.com/search/blog/2021/04/more-details-page-experience)).
By the mid-2020s most major publishers had migrated off AMP entirely.

## 5. Economics

**Peer-reviewed core.** Merja Myllylahti, "Newspaper Paywalls—the Hype and the Reality: A Study of How Paid News Content Impacts on Media Corporation Revenues," *Digital Journalism* 2(2) (2014) ([Taylor & Francis](https://www.tandfonline.com/doi/abs/10.1080/21670811.2013.813214)), compares paywall models across the US, UK, Slovakia, Slovenia, Poland, Australia, New Zealand, and Finland, and finds paywalls contributed roughly 10% of the studied media corporations' publishing/circulation revenues, with the metered model (typically ~10 free articles before paywall) the most common structure among Western newspapers, and premium/local-affiliation content reserved for subscribers while wire/syndicated/breaking-news content stayed open.

**Institutional tier.** The Reuters Institute's Digital News Report tracks subscription uptake yearly: per its 2023 edition, roughly 83% of respondents across 20 countries paid nothing for news, with at least a third of existing subscribers in that period cancelling or renegotiating price; per the 2024 edition, only about 17% were willing to pay anything and 57% were unwilling to pay at all, a pattern commentators have read as a plateau rather than continued growth in willingness to pay ([INMA summary of DNR data](https://www.inma.org/blogs/reader-revenue/post.cfm/new-data-how-many-consumers-are-willing-to-pay-for-online-news); [Reuters Institute, 2024](https://reutersinstitute.politics.ox.ac.uk/digital-news-report/2024/how-much-do-people-pay-online-news-what-might-encourage-others-pay)).
These specific percentage figures are cited here to secondary summaries of DNR data rather than to the DNR's own full data tables, which were not directly pulled during this study; see Gaps below.

**Trade press.** Programmatic advertising, long a significant revenue line for publishers, has been reported by trade outlets as declining sharply amid cookie deprecation and AI-driven "zero-click" search: one trade report cites display CPMs down 33% year-over-year and video CPMs down 39% ([AdMonsters](https://www.admonsters.com/from-ads-to-transactions-why-programmatic-display-is-ending-and-how-publishers-can-evolve/)), and Bloomberg is reported to have dropped programmatic advertising entirely in favor of direct sales.
These figures come from industry trade coverage (Digiday, AdMonsters, IAB-commissioned studies), not from peer-reviewed research or an audited institutional report, and the specific percentages should be treated as **[UNVERIFIED]** at the level of independent replication even though they are consistently reported across multiple trade sources.

## 6. Low-quality supply side

**Trade press: content farms.** Demand Media, operator of eHow, was the largest content farm of its era; its owned-and-operated sites were the 17th-largest US web property by traffic in November 2010, with 105 million unique visitors and 679 million pages viewed that month, per the Variety retrospective actually cited here ([Variety](https://variety.com/2013/biz/news/epic-fail-the-rise-and-fall-of-demand-media-1200914646/)) — an earlier draft of this note misdated this "top 20" ranking to 2009, which the cited article does not support.
A commonly repeated daily-output figure for Demand Media's content production ranges across sources from roughly 4,000 to roughly 7,000 articles and videos per day; this study could not confirm either specific number against the Variety article, which does not state a per-day production figure at all, so the daily-output claim is marked **[UNVERIFIED]**.
Google's February 2011 "Panda" algorithm update, aimed specifically at low-quality high-volume content, is widely reported to have substantially cut Demand Media's search traffic and stock price within weeks to months of launch, but this study could not confirm a precise traffic-decline percentage, stock-decline percentage, or timeframe directly in either of the two trade sources cited here ([Search Engine Land](https://searchengineland.com/google-forecloses-on-content-farms-with-farmer-algorithm-update-66071); [SEJ history of Panda](https://www.searchenginejournal.com/google-algorithm-history/panda-update/)); an earlier draft's specific "40% within weeks / 38% over two weeks" figures are removed and marked **[UNVERIFIED]** pending a source that states them directly.
This entire episode is documented only in business/trade journalism, with no identified peer-reviewed or institutional-report treatment.

**Institutional tier: "pink slime" partisan local networks.** Priyanjana Bengani, at the time the Tow Center's computational journalism fellow, published "Hundreds of 'Pink Slime' Local News Outlets Are Distributing Algorithmic Stories and Conservative Talking Points" (Tow Center for Digital Journalism / *Columbia Journalism Review*, December 2019) ([CJR/Tow Center](https://www.cjr.org/tow_center_reports/hundreds-of-pink-slime-local-news-outlets-are-distributing-algorithmic-stories-conservative-talking-points.php)), identifying at least 450 such sites spanning 21 networks operated by five corporate entities (189 of the sites tied to a single operation, Metric Media, across ten states).
Bengani's team sampled the 189 Metric Media sites' RSS feeds over a two-week period beginning November 26, 2019, and found over 15,000 unique stories had been published in that two-week window (over 50,000 when counted per-site rather than per-unique-story) — a two-week total, not, as an earlier draft of this note stated, a "per week" rate across "four related networks."
A 2020 follow-up, "As Election Looms, a Network of Mysterious 'Pink Slime' Local News Outlets Nearly Triples in Size" ([CJR/Tow Center](https://www.cjr.org/analysis/as-election-looms-a-network-of-mysterious-pink-slime-local-news-outlets-nearly-triples-in-size.php)), documents growth to roughly 1,200 sites.
Both are Tow Center (Columbia Journalism School) research-center investigations distributed through CJR, i.e. institutional-tier work, not independent peer-reviewed publication, though methodologically closer to research than ordinary trade reporting.

**Trade/industry-tracking tier: AI-generated news sites.** NewsGuard, a for-profit news-rating company, operates an "AI Tracking Center" that as of its most recent update at the time of this study (dated June 23, 2026 on the page itself) states it has identified 3,749 "AI Content Farm" sites across 16 languages, up from an initial count of 49 sites when NewsGuard began tracking in May 2023 ([NewsGuard AI Tracking Center](https://www.newsguardtech.com/special-reports/ai-tracking-center/)).
NewsGuard's own page describes a four-part internal analyst methodology (substantial AI-generated content; minimal human oversight; a generic/legitimate-sounding presentation; no clear AI disclosure) with no independent third-party audit of the count described on the page.
The trajectory (49 to several thousand sites in three years) is real and directly sourced to NewsGuard's own primary page, but the absolute count itself rests on NewsGuard's proprietary, unaudited methodology; it should be cited as "per NewsGuard's tracking center," not as an independently verified figure, and any precise count quoted from it beyond this study's fetch date should be treated as **[UNVERIFIED]** until re-checked against the live page.

## 7. Local news decline

**Institutional tier.** Penelope Muse Abernathy's "news deserts" research began at UNC's Hussman School (Center for Innovation and Sustainability in Local Media), producing a series of "Expanding News Desert" reports; it has since continued at Northwestern's Medill School as the *State of Local News* project.
The term "news desert" originally meant simply "a town without a newspaper"; Abernathy's own later definition broadened it to "a place where there is limited access to the type of critical news and information ... needed to make informed decisions about the quality of ... life" ([UNC](https://www.unc.edu/discover/well-said-news-deserts/); [CJR Q&A with Abernathy](https://www.cjr.org/business_of_news/the-context-for-the-crisis-a-qa-with-penny-abernathy.php)).
Her book-length treatments — *The Expanding News Desert* and *News Deserts and Ghost Newspapers* (UNC Press) — sit between this institutional-report tier and academic-press monograph, but the underlying county-count data itself comes from the Center's/Medill's ongoing survey project, not from independent peer review.

Northwestern's Medill *State of Local News 2024* report counted 208 "news desert" counties (counties with no locally based news source at all), up from 204 in 2023, plus 1,563 counties with only one remaining news source, together covering nearly 55 million people with limited or no access to local news ([Northwestern](https://news.northwestern.edu/stories/2024/10/medill-report-shows-local-news-deserts-expanding?fj=1)).
The *State of Local News 2025* report put the news-desert count at 213 counties, noted over 60 counties had lost local news entirely since 2005, and identified a "Watch List" of 250 additional counties judged to have a 40% likelihood of losing local news within a decade, with 136 local outlets having disappeared in the preceding year alone ([Northwestern Local News Initiative, 2025](https://localnewsinitiative.northwestern.edu/projects/state-of-local-news/2025/); [Nieman Lab coverage](https://www.niemanlab.org/2025/10/in-medills-latest-state-of-local-news-report-a-festering-20-year-old-problem-looms-larger-than-ever/)).
These are the two specific, dated editions this section's later work should cite — not "Abernathy" or "Medill" generically — since the county counts change year to year.

## 8. Misinformation circulation on the web

**Peer-reviewed core, with an important scope caveat.** Soroush Vosoughi, Deb Roy & Sinan Aral, "The Spread of True and False News Online," *Science* 359(6380), 1146–1151 (2018), DOI: [10.1126/science.aap9559](https://www.science.org/doi/10.1126/science.aap9559), analyzed the diffusion of roughly 126,000 rumor cascades, tweeted by about 3 million people over 4.5 million times, on Twitter from 2006 to 2017, classifying stories as true or false via six independent fact-checking organizations that agreed with each other 95–98% of the time.
Its central finding: falsehood diffused significantly farther, faster, deeper, and more broadly than truth across every category studied, most pronounced for false political news, and — the paper is explicit about this — the effect was attributable to human sharing behavior rather than to bots, since removing bot accounts from the analysis did not change the pattern.

This finding is Twitter-specific (one platform, one language-dominant dataset, a period ending in 2017, before major platform-algorithm and content-moderation changes later in the decade) and should not be generalized across platforms or to the post-2018 web without further support **[UNVERIFIED beyond Twitter/this period]**.
A widely recirculated 2021 claim that the study had been "debunked" is itself mistaken and should not be repeated: the study actually invoked was Jonas L. Juul & Johan Ugander, "Comparing Information Diffusion Mechanisms by Matching on Cascade Size," *PNAS* 118(46) (2021), DOI: [10.1073/pnas.2100786118](https://www.pnas.org/doi/10.1073/pnas.2100786118).
Juul & Ugander found that once false- and true-news cascades are matched on size, the previously reported *structural* differences in how those cascades spread (their shape, measured by properties like depth and breadth) mostly disappear — but this complicates, rather than overturns, Vosoughi et al.: the underlying size difference itself (false news reliably producing larger cascades that reach more people faster) is not challenged by Juul & Ugander's result, only the structural interpretation of *why*.
Later coverage describing this as a full "confirmation" of the original paper overstates the case in the other direction; the accurate summary is that the reach/speed differential stands while the structural mechanism claim is now contested.

## Gaps carried forward

- No independent, third-party audit of NewsGuard's AI Content Farm count (3,749 sites as of the June 23, 2026 page fetch) was located; the methodology and the count are both NewsGuard's own, and any reuse of a specific count from that page after this study's fetch date should be re-verified against the live page rather than cited from this note.
- The Reuters Institute Digital News Report percentage figures cited in §5 and §2 (48%/27% referral decline; 83%/17%/57% payment willingness) were pulled from secondary summaries (Press Gazette, INMA, Nieman Lab) rather than directly from the DNR's own full-edition data tables/PDF, which were not fetched in full during this study.
- The programmatic-advertising decline figures in §5 (33%/39% CPM declines) come from a single trade-press source (AdMonsters) and are not corroborated here against a second independent trade or institutional source; treat as directionally correct but numerically **[UNVERIFIED]**.
- Whether Abernathy's UNC Press book-length works (*The Expanding News Desert*, *News Deserts and Ghost Newspapers*) underwent the same peer-review process as a typical academic-press monograph, versus being closer to an institutional report published through a university press imprint, was not resolved in this study; they are provisionally placed between the two tiers in §7 rather than fully in either.
- No academic literature search was run on IPTC NewsML-G2/ninjs adoption rates among working newsrooms specifically; §4's coverage is standards-documentation only, not an empirical adoption study.
- This study did not verify whether Nielsen & Ganter's 2022 book *The Power of Platforms* underwent the same formal peer-review process as their 2018 *New Media & Society* article; it is treated in §2 as peer-reviewed-tier on the strength of its academic-press publication and its place in the same research program, not on a confirmed manuscript-review record.

## Sources

- https://direct.mit.edu/books/monograph/2408/Digitizing-the-NewsInnovation-in-Online-Newspapers
- https://www.cambridge.org/core/journals/business-history-review/article/abs/digitizing-the-news-innovation-in-online-newspapers-by-pablo-j-boczkowski-cambridge-mit-press-2004-xi-243-pp-illustrations-bibliography-index-cloth-30-isbn-0262025590/F265515E5819ABD59A36A53B42A1D0E8
- https://towcenter.columbia.edu/news/post-industrial-journalism-adapting-present
- https://www.cjr.org/behind_the_news/post_industrial_journalism_ada.php
- https://journals.sagepub.com/doi/10.1177/1461444817701318
- https://global.oup.com/academic/product/the-power-of-platforms-9780190908867
- https://reutersinstitute.politics.ox.ac.uk/news/power-platforms
- https://reutersinstitute.politics.ox.ac.uk/digital-news-report/2024/dnr-executive-summary
- https://pressgazette.co.uk/media-audience-and-business-data/media_metrics/facebooks-referral-traffic-for-publishers-down-50-in-12-months/
- https://reutersinstitute.politics.ox.ac.uk/news/social-media-turns-away-news-publishers-meet-audiences-other-channels
- https://press.princeton.edu/books/ebook/9780691200002/metrics-at-work-pdf-1
- https://blogs.lse.ac.uk/lsereviewofbooks/2021/09/20/book-review-metrics-at-work-journalism-and-the-contested-meaning-of-algorithms-by-angele-christin/
- https://press.princeton.edu/books/hardcover/9780691177649/all-the-news-thats-fit-to-click
- https://www.journals.uchicago.edu/doi/abs/10.1086/720773
- https://journals.sagepub.com/doi/10.1177/1461444814530541
- https://www.rssboard.org/rss-history
- https://simple.wikipedia.org/wiki/Really_Simple_Syndication
- https://www.rfc-editor.org/info/rfc4287/
- https://www.ietf.org/rfc/rfc4287.txt
- https://iptc.org/standards/newsml-g2/
- https://iptc.org/standards/ninjs/
- https://github.com/iptc/newsinjson
- https://developers.google.com/search/docs/appearance/structured-data/article
- https://schema.org/NewsArticle
- https://en.wikipedia.org/wiki/Accelerated_Mobile_Pages
- https://techcrunch.com/?p=1249933
- https://searchengineland.com/amp-wont-be-required-for-googles-top-stories-section-335276
- https://developers.google.com/search/blog/2021/04/more-details-page-experience
- https://www.tandfonline.com/doi/abs/10.1080/21670811.2013.813214
- https://www.inma.org/blogs/reader-revenue/post.cfm/new-data-how-many-consumers-are-willing-to-pay-for-online-news
- https://reutersinstitute.politics.ox.ac.uk/digital-news-report/2024/how-much-do-people-pay-online-news-what-might-encourage-others-pay
- https://www.admonsters.com/from-ads-to-transactions-why-programmatic-display-is-ending-and-how-publishers-can-evolve/
- https://variety.com/2013/biz/news/epic-fail-the-rise-and-fall-of-demand-media-1200914646/
- https://searchengineland.com/google-forecloses-on-content-farms-with-farmer-algorithm-update-66071
- https://www.searchenginejournal.com/google-algorithm-history/panda-update/
- https://www.cjr.org/tow_center_reports/hundreds-of-pink-slime-local-news-outlets-are-distributing-algorithmic-stories-conservative-talking-points.php
- https://www.cjr.org/analysis/as-election-looms-a-network-of-mysterious-pink-slime-local-news-outlets-nearly-triples-in-size.php
- https://www.newsguardtech.com/special-reports/ai-tracking-center/
- https://www.unc.edu/discover/well-said-news-deserts/
- https://www.cjr.org/business_of_news/the-context-for-the-crisis-a-qa-with-penny-abernathy.php
- https://news.northwestern.edu/stories/2024/10/medill-report-shows-local-news-deserts-expanding?fj=1
- https://localnewsinitiative.northwestern.edu/projects/state-of-local-news/2025/
- https://www.niemanlab.org/2025/10/in-medills-latest-state-of-local-news-report-a-festering-20-year-old-problem-looms-larger-than-ever/
- https://www.science.org/doi/10.1126/science.aap9559
- https://www.pnas.org/doi/10.1073/pnas.2100786118

## Verification note

This note was passed against an adversarial citation-verification review on 2026-08-22, checked directly against Crossref (for all DOIs), primary/publisher pages, and cited trade/institutional sources rather than taken on the note's own earlier word.
18 of this note's most load-bearing citations were checked; 3 were corrected in place and 3 additional claims were newly marked **[UNVERIFIED]**.
Corrected: the RSS 2.0 release date (was misstated as September 2002; the RSS Advisory Board's own history gives August 19, 2002); the Bengani/Tow Center "pink slime" story-volume and network-count figures in §6 (the 15,000-story figure is a two-week total, not a weekly rate, and the network count is 21 networks/five corporate entities, not "four related networks"); and the Demand Media "top 20 web property" date in §6 (the Variety source dates this to November 2010, not 2009).
Newly marked unverified: the specific "2.3 billion → 1.2 billion" Facebook-referral-volume figure in §2 (not found in either source it was attributed to, and likely a units/metric confusion with an unrelated single-publisher figure); Demand Media's daily article/video output figure in §6 (sources disagree, 4,000 vs. 7,000/day, and the cited Variety piece states neither); and the specific Panda-update traffic/stock-decline percentages and timeframe for Demand Media in §6 (not confirmed in either source cited for that claim).
All DOI-bearing peer-reviewed citations checked (Nielsen & Ganter 2018, Tandoc 2014, Myllylahti 2014, Vosoughi/Roy/Aral 2018, Juul & Ugander 2021) matched Crossref metadata and source-text claims exactly and required no correction; the Reuters Institute DNR 48%/27% referral-decline figures, the 83%/17%/57% payment-willingness figures, the Northwestern Medill 2024/2025 county counts, the NewsGuard AI Tracking Center count, and the Boczkowski and Nielsen & Ganter book bibliographic details were likewise independently confirmed and left unchanged.
