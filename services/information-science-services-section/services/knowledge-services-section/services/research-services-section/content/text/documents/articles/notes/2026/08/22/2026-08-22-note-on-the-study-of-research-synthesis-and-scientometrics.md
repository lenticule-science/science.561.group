---
title: "Study of Research Synthesis and Scientometrics"
description: "A literature study of research-synthesis and scientometrics methodology finds a well-documented peer-reviewed core -- Glass (1976) coining meta-analysis, the Cochrane Collaboration (est. 1993) and its Handbook, the PRISMA statement (Moher et al. 2009) and its PRISMA 2020 update (Page et al. 2021), the GRADE framework (Guyatt et al. 2008), Garfield's (1955) citation-indexing paper and de Solla Price's founding scientometrics texts, Hirsch's (2005) h-index, and the assessment-reform literature of DORA (2012), the Leiden Manifesto (Hicks et al. 2015), and Edwards & Roy's (2017) explicit Goodhart's-law critique, alongside the FAIR principles (Wilkinson et al. 2016) and open infrastructure (ORCID, Crossref, OpenAlex, Semantic Scholar) -- but carries forward specific gaps: no exact day-level date for DORA's 2012/2013 release, thin peer-reviewed anchoring for 'living systematic review' currency claims beyond Elliott et al. (2014), and de Solla Price's founder status resting on secondary characterization rather than one canonical founding citation."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-research-synthesis-and-scientometrics
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["systematic-review", "meta-analysis", "scientometrics", "prisma", "cochrane", "grade", "h-index", "impact-factor", "dora", "leiden-manifesto", "goodharts-law", "fair-data-principles", "orcid", "openalex", "living-systematic-review"]
tags: ["draft", "study"]
---

# Study of Research Synthesis and Scientometrics

This is a study of research synthesis (systematic review and meta-analysis methodology) and scientometrics (the quantitative study of science and its measurement), read for one purpose: to establish, per sub-literature, which claims trace to peer-reviewed sources versus practitioner/industry/trade canon, so that later terms and notes in this section can cite the right kind of source for the right kind of claim.
Method: web-verified citations.
Every load-bearing claim below carries a markdown-linked source (DOI, publisher, or stable URL), and anything this study could not verify to the primary-source level is marked **[UNVERIFIED]** inline rather than laundered into fact.

## 1. Meta-analysis and the coining of the term

Gene V. Glass coined "meta-analysis" in Glass, G.V. (1976), "Primary, Secondary, and Meta-Analysis of Research," *Educational Researcher* 5(10):3-8 ([DOI 10.3102/0013189X005010003](https://journals.sagepub.com/doi/10.3102/0013189X005010003)), defining it as "the analysis of analyses" -- the statistical analysis of a large collection of individual studies' results, for purposes of integrating findings, as distinct from a "primary" analysis (of raw data) or a "secondary" analysis (reanalysis of an existing dataset).
This is the founding citation for meta-analysis as a named, peer-reviewed statistical method, and later work in this sub-literature (Cochrane, PRISMA, GRADE, below) builds on it as established terminology rather than re-deriving it.

## 2. The Cochrane Collaboration and its Handbook

The Cochrane Collaboration was founded in 1993 under the leadership of Iain Chalmers ([Wikipedia: Cochrane (organisation)](https://en.wikipedia.org/wiki/Cochrane_(organisation))), institutionalizing systematic review production for healthcare evidence at scale.
Its methodological reference work, the *Cochrane Handbook for Systematic Reviews of Interventions*, is currently at version 6.5 (2024), senior-edited by Julian Higgins and James Thomas with associate editors Jacqueline Chandler, Miranda Cumpston, Tianjing Li, Matthew Page, and Vivian Welch ([cochrane.org: current Handbook](https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current)), and organized into 26 chapters covering study selection, data collection, bias assessment, meta-analysis, equity, and non-randomized/individual-participant-data methods.
The Handbook is the operational methodology text that PRISMA (below) formalizes into a reporting standard, and that GRADE (below) formalizes into an evidence-certainty standard; the three are complementary, not competing, standards.

## 3. PRISMA and PRISMA 2020

Moher, D., Liberati, A., Tetzlaff, J., Altman, D.G., and The PRISMA Group (2009), "Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement," *PLoS Medicine* 6(7):e1000097 ([DOI 10.1371/journal.pmed.1000097](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1000097)), established a reporting checklist and flow diagram for systematic reviews and meta-analyses, addressing inconsistent and incomplete reporting that had made prior reviews hard to appraise or replicate.
It was formally superseded, not merely updated, by Page, M.J., McKenzie, J.E., Bossuyt, P.M., Boutron, I., Hoffmann, T.C., Mulrow, C.D., et al. (2021), "The PRISMA 2020 statement: an updated guideline for reporting systematic reviews," *BMJ* 372:n71 ([DOI 10.1136/bmj.n71](https://pmc.ncbi.nlm.nih.gov/articles/PMC8005924/)), a 27-author revision expanding the checklist to reflect methodological advances (e.g., risk-of-bias tools, certainty-of-evidence assessment, and reporting of automation/search methods) since 2009.
Any citation of "the PRISMA statement" without specifying 2009 or 2020 should be read as ambiguous; this section's terms cite the version actually used.

## 4. GRADE and evidence hierarchies

Guyatt, G.H., Oxman, A.D., Vist, G.E., Kunz, R., Falck-Ytter, Y., Alonso-Coello, P., Schunemann, H.J., and the GRADE Working Group (2008), "GRADE: an emerging consensus on rating quality of evidence and strength of recommendations," *BMJ* 336(7650):924-926 ([DOI 10.1136/bmj.39489.470347.AD](https://www.bmj.com/lookup/doi/10.1136/bmj.39489.470347.AD)), established the GRADE framework: a structured method for rating certainty of evidence (high/moderate/low/very low) and strength of recommendation, developed specifically to move past a simple ranking of study designs (RCTs above observational studies, categorically) toward a domain-by-domain appraisal that can upgrade observational evidence or downgrade RCT evidence depending on risk of bias, inconsistency, indirectness, imprecision, and publication bias.

GRADE's departure from a rigid design-based hierarchy is itself a response to documented critiques of naive evidence hierarchies.
The most widely cited such critique is a deliberately satirical one: Smith, G.C.S. and Pell, J.P. (2003), "Parachute use to prevent death and major trauma related to gravitational challenge: systematic review of randomised controlled trials," *BMJ* 327(7429):1459-1461 ([PMC300808](https://pmc.ncbi.nlm.nih.gov/articles/PMC300808/)), which found zero RCTs of parachute use and used the absurdity of demanding one to argue that rigid insistence on RCT-only evidence, for interventions whose effect is dramatic and mechanistically obvious, is itself a methodological error -- while explicitly not arguing that observational evidence is generally as trustworthy as RCT evidence (citing hormone-replacement-therapy research as a case where observational data misled).
This is the standard citation for "evidence hierarchies are not absolute categories" in the methodology literature, and it is the direct intellectual context GRADE's domain-based approach was built to formalize.

## 5. Scientometrics: founding citation-indexing work

Eugene Garfield's Garfield, E. (1955), "Citation Indexes for Science: A New Dimension in Documentation through Association of Ideas," *Science* 122(3159):108-111 ([DOI 10.1126/science.122.3159.108](https://www.science.org/doi/10.1126/science.122.3159.108); citation confirmed via [Wikipedia: Eugene Garfield](https://en.wikipedia.org/wiki/Eugene_Garfield)), proposed indexing scientific literature by citation relationships rather than subject classification alone -- the founding proposal behind the Science Citation Index.
Garfield founded the Institute for Scientific Information (ISI) in 1960, whose Science Citation Index made possible the calculation of the journal impact factor (see Section 6).

Derek de Solla Price is widely characterized as scientometrics' other founding figure, on the strength of *Little Science, Big Science* (Columbia University Press, 1963) and "Networks of Scientific Papers," *Science* (1965) -- the latter an early empirical demonstration that citation networks follow power-law/scale-free distributions -- and "A general theory of bibliometric and other cumulative advantage processes," *Journal of the American Society for Information Science* (1976), which formalized preferential-attachment ("Matthew effect") dynamics in citation accumulation ([summary via web search](https://en.wikipedia.org/wiki/Derek_J._de_Solla_Price)).
**[UNVERIFIED]**: this study located a strong secondary characterization of de Solla Price as scientometrics' founder (he received the ASIS Research Award posthumously in 1984, and the field's own journal is named *Scientometrics*), but did not verify a single canonical peer-reviewed source making the "founder" claim explicitly, as opposed to it being field consensus attributed across multiple retrospectives; his primary works themselves are confirmed above.

## 6. Bibliometric indicators: the h-index and impact factor misuse

Hirsch, J.E. (2005), "An index to quantify an individual's scientific research output," *PNAS* 102(46):16569-16572 ([DOI 10.1073/pnas.0507655102](https://www.pnas.org/doi/10.1073/pnas.0507655102); citation confirmed via [Wikipedia: h-index](https://en.wikipedia.org/wiki/H-index)), introduced the h-index: a researcher has index *h* if *h* of their papers have each been cited at least *h* times.
It was proposed as a single number balancing productivity and citation impact, correcting for the distortions of raw citation counts or paper counts alone.

The journal impact factor -- calculated from Garfield's Science Citation Index infrastructure -- has a well-documented misuse literature distinct from the h-index's.
Seglen (1997) argued the metric should not be used to evaluate individual researchers or articles, since citation counts vary widely within a single journal; Rossner, M., Van Epps, H., and Hill, E. (2007), "Show me the data," *Journal of Cell Biology* 179(6):1091-1092 ([DOI 10.1083/jcb.200711140](https://rupress.org/jcb/article/179/6/1091/54138/Show-me-the-data)), documented that impact factors, being means of non-normally distributed (skewed) citation data, are statistically inappropriate as reported (arguing the median would be more appropriate); and Wilhite and Fong (2012) documented "coercive citation" -- editors pressuring authors to add citations to the editors' own journal -- affecting roughly one in five researchers surveyed (summarized via [Wikipedia: Impact factor](https://en.wikipedia.org/wiki/Impact_factor)).
**Correction (verification pass, 2026-08-22):** an earlier draft of this note attributed the widely repeated *Acta Crystallographica Section A* anecdote (impact factor jumping from 2.051 in 2008 to 49.926 in 2009, after George Sheldrick's "A short history of SHELX" received 6,600+ citations) to Rossner et al. (2007) itself.
This is chronologically impossible -- the event postdates that paper's publication by two years -- and the anecdote in fact originates from later reporting, e.g. Grant, B., "New impact factors yield surprises," *The Scientist*, 21 June 2010 (cited via [Wikipedia: Impact factor](https://en.wikipedia.org/wiki/Impact_factor)).
Rossner et al. (2007) should be cited only for the mean-of-skewed-data critique, not for the Acta Crystallographica example.
This misuse literature is the direct precedent for the research-assessment-reform movement in Section 7.

## 7. Research-assessment reform: DORA, the Leiden Manifesto, and Goodhart's law

The San Francisco Declaration on Research Assessment (DORA) was developed in December 2012 during the Annual Meeting of the American Society for Cell Biology in San Francisco ([sfdora.org](https://sfdora.org/)); its central recommendation is to stop using journal-based metrics such as the impact factor as a surrogate measure of an individual article's or researcher's quality, citing skewed citation distributions, cross-field incomparability, and manipulability.
**[UNVERIFIED]**: this study confirmed the December 2012 drafting date from DORA's own site but did not independently verify the exact day of DORA's public release/opening for signature, commonly given elsewhere as 2013.

Hicks, D., Wouters, P., Waltman, L., de Rijcke, S., and Rafols, I. (2015), "Bibliometrics: The Leiden Manifesto for Research Metrics," *Nature* 520:429-431 (DOI 10.1038/520429a; publication confirmed via [leidenmanifesto.org](https://www.leidenmanifesto.org/) and [Nature](https://www.nature.com/articles/520429a)), proposed ten principles for responsible use of quantitative indicators in research evaluation -- among them that quantitative evaluation should support qualitative expert assessment rather than replace it, and that metrics should be verified and openly available for scrutiny.

Edwards, M.A. and Roy, S. (2017), "Academic Research in the 21st Century: Maintaining Scientific Integrity in a Climate of Perverse Incentives and Hypercompetition," *Environmental Engineering Science* 34(1):51-61 ([DOI 10.1089/ees.2016.0223](https://pmc.ncbi.nlm.nih.gov/articles/PMC5206685/)), makes the Goodhart's-law argument explicit, quoting the formulation "when a measure becomes a target, it ceases to be a good measure" (attributed in the paper to Elton, 2004) and applying it directly to research evaluation: publication-count metrics reward quantity over quality and produce "an avalanche of substandard, incremental papers"; citation metrics incentivize padded reference lists and editor-coerced self-citation; grant-funding incentives reward overselling positive results and downplaying negative ones; and institutional rankings get gamed through data manipulation.
The paper reports a survey finding that 71% of respondents feared colleagues could "game" or "cheat" their way to better evaluations, and warns of a possible tipping point toward normalized research misconduct absent reform.
This is the section's clearest documented case of Goodhart's-law dynamics operating specifically in research evaluation, complementing DORA and the Leiden Manifesto's more prescriptive reform proposals.

## 8. FAIR data principles and open scientometric infrastructure

Wilkinson, M.D., Dumontier, M., Aalbersberg, I.J., Appleton, G., Axton, M., Baak, A., et al. (2016), "The FAIR Guiding Principles for Scientific Data Management and Stewardship," *Scientific Data* 3:160018 ([DOI 10.1038/sdata.2016.18](https://pmc.ncbi.nlm.nih.gov/articles/PMC4792175/)), defined FAIR (Findable, Accessible, Interoperable, Reusable) as machine-actionable principles for data: findable via persistent identifiers and rich metadata; accessible via standardized retrieval protocols even when the underlying data is access-restricted; interoperable via shared vocabularies; and reusable via clear licensing and provenance.
FAIR is explicitly about data infrastructure and is a distinct concern from the research-evaluation-metrics literature in Section 7, though both respond to the same underlying problem of making research claims independently checkable.

The infrastructure that operationalizes FAIR-style identification for people and works: ORCID launched its registry on 16 October 2012 under founding executive director Laurel Haak, providing researchers a persistent identifier that survives name changes and transliteration inconsistencies ([Wikipedia: ORCID](https://en.wikipedia.org/wiki/ORCID)).
Crossref was established in 1999 and launched in early 2000 as a publisher cooperative operating as a DOI Registration Agency, assigning persistent identifiers to scholarly works and linking citations across publishers -- as of this study it resolves roughly 1.1 billion DOIs and serves roughly 1 billion metadata queries monthly ([Wikipedia: Crossref](https://en.wikipedia.org/wiki/Crossref)).
At the institutional-data-source tier, OpenAlex launched in January 2022, operated by the non-profit OurResearch as a free, open successor to Microsoft Academic Graph (which stopped updating 31 December 2021) ([Wikipedia: OpenAlex](https://en.wikipedia.org/wiki/OpenAlex)), and Semantic Scholar, operated by the Allen Institute for AI (Ai2, founded 2014), launched in 2015 and now indexes 200+ million papers with AI-assisted search and discovery tools ([semanticscholar.org/about](https://www.semanticscholar.org/about)).
These four systems together form the open, non-proprietary alternative to the Web of Science/Scopus infrastructure that Garfield built commercially in Section 5.

## 9. Living systematic reviews

Elliott, J.H., Turner, T., Clavisi, O., Thomas, J., Higgins, J.P.T., Mavergames, C., and Gruen, R.L. (2014), "Living Systematic Reviews: An Emerging Opportunity to Narrow the Evidence-Practice Gap," *PLoS Medicine* 11(2):e1001603 ([DOI 10.1371/journal.pmed.1001603](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1001603)), proposed continually updated systematic reviews -- incorporating new evidence as it is published, rather than being fixed at publication and left to age -- as a response to the growing rate of new primary research outpacing traditional periodic-update review cycles.
This is the founding proposal for "living systematic review" as a named method; Cochrane has since adopted living-review methods into its own Handbook guidance (Section 2), but **[UNVERIFIED]**: this study did not separately verify a Cochrane-specific peer-reviewed methods citation beyond Elliott et al.'s founding paper, so later terms should cite Elliott et al. (2014) as the origin and treat any Cochrane-specific living-review methodology citation as a gap pending verification.

## What research-services-section could adopt from this literature

Reading this literature as a set of practices, not just a set of citations, several are directly adoptable by this section's own study notes and glossary terms, in rough order of how cheaply they could be adopted:

- **PRISMA-style provenance, scaled down.** This section's study notes already distinguish peer-reviewed from practitioner-canon sources per sub-literature (as this note and its foraging/media-science siblings do); PRISMA's contribution would be to make the *search process itself* traceable -- which databases were searched, with what terms, on what date -- so a later note can tell whether a gap reflects "not found because not searched" versus "not found despite a documented search."
- **A lightweight GRADE-style certainty marker.** Rather than a binary peer-reviewed/practitioner split, claims could carry a one-word certainty tag (e.g., established / contested / single-source) alongside the existing **[UNVERIFIED]** marker, giving later readers a GRADE-like signal without adopting GRADE's full clinical machinery.
- **Leiden-Manifesto-style humility about its own citation counts.** If this library ever starts counting citations across its own notes and terms (e.g., "most-linked term"), the Leiden Manifesto's principle that quantitative indicators should support, not replace, qualitative judgment is directly applicable -- and Edwards & Roy's Goodhart's-law argument is a direct warning against letting any such internal metric become a target that shapes what gets written.
- **A living-note practice for fast-moving sections.** Elliott et al.'s living-systematic-review model -- explicit re-review triggers rather than one-and-done publication -- is a plausible model for this section's own notes on fast-moving topics (this note's companion on scientometrics tooling, e.g. OpenAlex, is a candidate, given how young and fast-changing that infrastructure still is).
- **FAIR-style identifiers for internal claims**, at minimum stable, linkable term and note filenames (already this library's practice) so that a future reviewer can cite a specific claim the way a DOI cites a specific paper -- this section already does this by convention; the gap is only that it is not yet stated as a documented principle the way FAIR states it for external data.

## Gaps carried forward

- De Solla Price's status as a/the founder of scientometrics is well-supported by secondary characterization (ASIS Research Award, the field's eponymous journal) but this study did not verify one peer-reviewed primary source making the "founder" claim explicitly, as opposed to it being retrospective field consensus; his own primary works (1963, 1965, 1976) are independently confirmed above.
- DORA's exact public-release date (commonly given elsewhere as May 2013) was not independently confirmed beyond its December 2012 drafting date at the ASCB meeting; later notes should treat "2012" as the drafting date and "2013" as the wider release date pending confirmation.
- Living systematic review methodology's Cochrane-specific citation (as distinct from Elliott et al.'s 2014 founding paper) was not located; the Cochrane Handbook (Section 2) is known to address living reviews but this study did not pull a specific chapter/DOI for that guidance.
- Evidence-hierarchy critique in Section 4 is anchored by one frequently cited paper (Smith & Pell 2003); a fuller literature review would also cover Concato/Horwitz-style methodological critiques of hierarchy schemes and Djulbegovic & Guyatt's writing on evidence-based medicine's own evolution, neither of which this study independently verified.
- The FAIR principles (Section 8) are stated here as they apply to data; this study did not separately verify whether Wilkinson et al. (2016) or a follow-up paper extends FAIR explicitly to software or metrics, a distinction later terms should not blur.

## Sources

- https://journals.sagepub.com/doi/10.3102/0013189X005010003
- https://en.wikipedia.org/wiki/Cochrane_(organisation)
- https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current
- https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1000097
- https://pmc.ncbi.nlm.nih.gov/articles/PMC8005924/
- https://www.bmj.com/lookup/doi/10.1136/bmj.39489.470347.AD
- https://pmc.ncbi.nlm.nih.gov/articles/PMC300808/
- https://www.science.org/doi/10.1126/science.122.3159.108
- https://en.wikipedia.org/wiki/Eugene_Garfield
- https://en.wikipedia.org/wiki/Derek_J._de_Solla_Price
- https://www.pnas.org/doi/10.1073/pnas.0507655102
- https://en.wikipedia.org/wiki/H-index
- https://en.wikipedia.org/wiki/Impact_factor
- https://rupress.org/jcb/article/179/6/1091/54138/Show-me-the-data
- https://sfdora.org/
- https://www.leidenmanifesto.org/
- https://www.nature.com/articles/520429a
- https://pmc.ncbi.nlm.nih.gov/articles/PMC5206685/
- https://pmc.ncbi.nlm.nih.gov/articles/PMC4792175/
- https://en.wikipedia.org/wiki/ORCID
- https://en.wikipedia.org/wiki/Crossref
- https://en.wikipedia.org/wiki/OpenAlex
- https://www.semanticscholar.org/about
- https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1001603

## Verification note

Verified 2026-08-22 by an independent, adversarial pass (separate from the drafting pass): 21 load-bearing citations/facts checked across this note and its sibling glossary terms (`systematic-review.md`, `meta-analysis.md`, `scientometrics.md`, `fair-data-principles.md`, `h-index.md`), each re-derived from a primary source, publisher page, or targeted fetch of the secondary source actually cited (not taken on the drafting pass's word).
Checked: Glass (1976); Moher et al. (2009) PRISMA; Page et al. (2021) PRISMA 2020; Guyatt et al. (2008) GRADE; Smith & Pell (2003) parachute paper; Garfield (1955); de Solla Price's 1963/1965/1976 works; Hirsch (2005) h-index; Seglen (1997); Rossner et al. (2007); Wilhite & Fong (2012); DORA's December 2012 drafting date; Hicks et al. (2015) Leiden Manifesto; Edwards & Roy (2017); Wilkinson et al. (2016) FAIR; ORCID's launch date/founding director; Crossref's founding/scale figures; OpenAlex's launch/successor claim; Semantic Scholar's launch/operator; Elliott et al. (2014) living systematic review; and the Cochrane Collaboration's 1993 founding under Iain Chalmers.

1 correction made: Section 6 had attributed the widely repeated *Acta Crystallographica Section A* impact-factor anecdote (2.051 to 49.926 after a single paper's 6,600+ citations) to Rossner et al. (2007) itself.
This is chronologically impossible -- the anecdote concerns a 2008-2009 event, two years after that paper's publication -- and the correct source is later reporting (Grant, *The Scientist*, 2010).
The section now attributes the mean-of-skewed-data critique to Rossner et al. (2007) alone, with the misattribution and correct source noted inline.
A second, non-citation fix was also made: `systematic-review.md` linked "GRADE framework" to `./scientometrics.md`, a file that does not discuss GRADE at all; the link now points to this note's actual GRADE section (Section 4).

1 additional inline **[UNVERIFIED]** marker was added (Section 9, Cochrane-specific living-review methodology citation) where the text already disclosed the gap in prose but had not applied the file's own literal marker convention.

All other checked citations -- author names, years, titles, venues, volume/issue/pages, and DOIs/URLs -- matched their sources, and each verified work does say what this note claims it says (spot-checked directly for Smith & Pell 2003 and Elliott et al. 2014, whose stated conclusions were fetched and compared against the note's paraphrase).
The two pre-existing **[UNVERIFIED]** markers this study inherited from the drafting pass (de Solla Price's "founder" attribution and DORA's exact public-release date) were reviewed and confirmed as correctly flagged -- this pass did not find a source resolving either of them, so they remain marked rather than being upgraded to fact or downgraded to deletion.
The Cochrane-specific living-review gap (Section 9) was already disclosed in prose but lacked the literal marker until this pass added it, bringing the total to three inline **[UNVERIFIED]** markers in this note.

- Citations checked: 21
- Corrections made: 2
- Marked unverified (new, this pass): 1
- Pre-existing unverified markers reviewed and left standing: 2
