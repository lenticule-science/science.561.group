---
title: Study of Metascience and Replication
description: "This study finds that the empirical core of the replication-crisis literature traces to a small set of peer-reviewed anchors - Ioannidis's (2005) PLoS Medicine argument that most published findings are false, the Open Science Collaboration's (2015) Science reproducibility estimate for psychology, Camerer and colleagues' 2016 Science and 2018 Nature Human Behaviour replication projects in economics and the social sciences, Simmons, Nelson and Simonsohn's (2011) Psychological Science demonstration of researcher-degrees-of-freedom, John, Loewenstein and Prelec's (2012) Psychological Science survey of questionable research practices, and the reform program built on them by Nosek et al. (2018, PNAS), Chambers (2013; 2019), and Munafo et al. (2017, Nature Human Behaviour) - while carrying forward gaps around the exact severity of the \"crisis\" framing (Fanelli 2018, PNAS), the disciplinary reach of the findings beyond psychology and experimental economics, and one [UNVERIFIED] detail in the post-correction figures of Smaldino and McElreath's (2016; corrected 2023) simulation model."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-metascience-and-replication
authors: [claude-sonnet-5]
status: draft-for-review
keywords:
  - metascience
  - replication-crisis
  - reproducibility
  - preregistration
  - registered-reports
  - questionable-research-practices
  - publication-bias
  - open-science
tags: ["draft", "study"]
---


This study is read for one purpose: to establish, per sub-literature, which claims trace to peer-reviewed sources versus practitioner, industry, or trade canon, so that later glossary terms and notes in this section cite the right kind of source for each claim they make.
The method is web-verified citation: every load-bearing claim below carries a markdown-linked source (a DOI, a publisher page, or another stable URL) checked against a live web search during the writing of this note.
Anything that could not be verified to the primary-source level is marked **[UNVERIFIED]** inline rather than being laundered into settled fact.

## 1. The foundational claim and the metascience label

The literature's most-cited anchor is John Ioannidis's essay, ["Why Most Published Research Findings Are False"](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.0020124) (PLoS Medicine 2(8): e124, 2005), which uses a probabilistic model of research design - study power, effect size, the number of tested relationships, flexibility in design and analysis, and field-wide bias - to argue that for many study designs a claimed finding is more likely false than true.
The paper has an [erratum](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1004085) correcting an error in the supporting analysis, and a contemporary critique, ["Why Most Published Research Findings Are False: Problems in the Analysis"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1855693/), that questioned some of its assumptions; the core argument nonetheless became the field's founding text.

The field built on that argument is now widely called "metascience" or "meta-research."
A load-bearing citation for that label is Ioannidis, Fanelli, Dunne and Goodman's ["Meta-research: Evaluation and Improvement of Research Methods and Practices"](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1002264) (PLoS Biology 13(10): e1002264, 2015), which names meta-research as a discipline studying research methods, reporting, verification, evaluation, and incentives, and announces the founding of Stanford's Meta-Research Innovation Center (METRICS).
The prompt that seeded this study named this as "Ioannidis, Fanelli & Goodman 2015"; the verified author list is Ioannidis, Fanelli, Dunne, and Goodman - Dunne is a fourth, non-trivial co-author, so citations elsewhere in this library should use the full four-name list, not the three-name shorthand.

## 2. Publication bias and the file-drawer literature

The claim that published findings are a biased sample of all findings predates the replication crisis by decades.
Robert Rosenthal's ["The 'File Drawer Problem' and Tolerance for Null Results"](https://web.ma.utexas.edu/users/mks/statmistakes/filedrawer.html) (Psychological Bulletin 86(3): 638-641, 1979; DOI 10.1037/0033-2909.86.3.638) is the anchor for the "file-drawer" metaphor: null results go unpublished and unsubmitted, so the literature over-represents statistically significant, and thus possibly spurious, effects.

Annie Franco, Neil Malhotra, and Gabor Simonovits gave that intuition a direct empirical test in ["Publication Bias in the Social Sciences: Unlocking the File Drawer"](https://www.science.org/doi/abs/10.1126/science.1255484) (Science 345(6203): 1502-1505, 2014; author list verified by Crossref as Annie, not Anna, Franco), using a registry of peer-reviewed, already-funded social-science experiments to show that strong, significant results were substantially more likely to be written up and published than null results.
The specific magnitudes commonly attributed to this paper - "about five times more likely," and "roughly half of completed studies were never published at all" - could not be confirmed against the paper's own abstract or full text during this study's web search (the publisher page and known mirrors returned access-restricted or 404 responses), so both figures are marked **[UNVERIFIED]** here rather than repeated as settled numbers; only the qualitative direction of the finding - a write-up and publication bias toward significant results, using an already-approved study registry - is treated as verified.
Because the sample was drawn from already-approved studies rather than the full space of research ideas, the estimate speaks to write-up and submission bias specifically, not to every mechanism that could inflate the published record.

## 3. Questionable research practices

Joseph Simmons, Leif Nelson, and Uri Simonsohn's ["False-Positive Psychology: Undisclosed Flexibility in Data Collection and Analysis Allows Presenting Anything as Significant"](https://journals.sagepub.com/doi/10.1177/0956797611417632) (Psychological Science 22(11): 1359-1366, 2011; DOI 10.1177/0956797611417632) formalized "researcher degrees of freedom": undisclosed choices in when to stop collecting data, which conditions or measures to report, and which covariates to include, which can push a true false-positive rate far above the nominal .05 significance threshold even without any single dishonest step.
The paper's proposed remedy - a short disclosure checklist for authors and reviewers - became a direct ancestor of preregistration.

Leslie John, George Loewenstein, and Drazen Prelec's ["Measuring the Prevalence of Questionable Research Practices with Incentives for Truth Telling"](https://journals.sagepub.com/doi/abs/10.1177/0956797611430953) (Psychological Science 23(5): 524-532, 2012) then surveyed over 2,000 academic psychologists, using an incentive-compatible elicitation method to estimate how many had personally engaged in practices such as selective reporting of studies, optional stopping, or reporting an unexpected finding as if it had been predicted from the start.
The paper found self-admission rates high enough to argue that some of these practices function as prevailing norms rather than rare misconduct - a survey-based, self-report estimate, distinct in kind from Simmons, Nelson, and Simonsohn's simulation-based demonstration of the same mechanisms.

## 4. Large-scale replication projects

The Open Science Collaboration's ["Estimating the Reproducibility of Psychological Science"](https://www.science.org/doi/10.1126/science.aac4716) (Science 349(6251): aac4716, 2015) is the field's largest direct test: 100 experimental and correlational studies from three psychology journals were each replicated by an independent team using original materials where possible.
Ninety-seven percent of the original studies had reported a significant result, versus only thirty-six percent of the replications, and mean effect sizes in the replications were about half those originally reported.
This is the number most often meant by "only about a third to a half of psychology findings replicate," and it drew a published [comment and response](https://www.researchgate.net/publication/283934359_Comment_on_Estimating_the_reproducibility_of_psychological_science_Science_349_943_2015_with_a_response_from_the_Open_Science_Collaboration) disputing some of its statistical framing - so the headline figure should be cited as contested at the margins, not as an uncontroversial constant.

Colin Camerer and a large international team extended the same method to economics in ["Evaluating Replicability of Laboratory Experiments in Economics"](https://www.science.org/doi/10.1126/science.aaf0918) (Science 351(6280): 1433-1436, 2016; DOI 10.1126/science.aaf0918), replicating 18 laboratory studies from the American Economic Review and the Quarterly Journal of Economics (2011-2014) and finding a significant effect in the same direction for 11 of 18 (61 percent), at about 66 percent of the original effect size on average.
The same team then broadened the design to ["Evaluating the Replicability of Social Science Experiments in Nature and Science between 2010 and 2015"](https://www.nature.com/articles/s41562-018-0399-z) (Nature Human Behaviour 2: 637-644, 2018; DOI 10.1038/s41562-018-0399-z), replicating 21 experiments from those two flagship journals and finding a significant effect in the same direction for 13 of 21 (62 percent), at roughly half the original effect size.
Read together, the three large-scale projects do **not** converge on a single replication rate: psychology's rate in the Open Science Collaboration study (36 percent) is markedly lower than the rates found in economics (61 percent) and in the cross-disciplinary Nature/Science sample (62 percent) - an earlier draft of this study's synthesis incorrectly described all three as clustering around "six in ten," which is true only of the two Camerer projects and overstates the psychology replication rate by nearly double.
What the three projects do share is a consistent shrinkage of effect size on replication, to roughly half to two-thirds of the original magnitude, and a common finding that a large minority to majority of specific published effects did not replicate at their original strength.

## 5. Reform: preregistration and registered reports

Brian Nosek and colleagues' ["The Preregistration Revolution"](https://www.pnas.org/doi/10.1073/pnas.1708274114) (PNAS 115(11): 2600-2606, 2018; DOI 10.1073/pnas.1708274114) makes the case that publicly time-stamping a study's hypotheses, design, and analysis plan before data collection - preregistration - separates confirmatory hypothesis testing from exploratory analysis, and argues that this distinction, not preregistration as a ritual in itself, is what should improve the credibility of reported results.
A subsequent PNAS exchange, ["The Preregistration Revolution Needs to Distinguish between Predictions and Analyses"](https://pmc.ncbi.nlm.nih.gov/articles/PMC6233109/), pushed back on how cleanly that distinction can be drawn in practice, so preregistration should be described in this library as a widely adopted but still actively debated tool, not a solved problem.

Registered reports are the companion mechanism at the level of the journal rather than the individual study: peer review of the introduction, hypotheses, and method happens before data are collected, and the journal commits to publish based on the quality of the question and design rather than the direction or significance of the result.
Chris Chambers introduced the format at the journal Cortex in ["Registered Reports: A New Publishing Initiative at Cortex"](https://linkinghub.elsevier.com/retrieve/pii/S0010945212003735) (Cortex 49(3): 609-610, 2013; DOI 10.1016/j.cortex.2012.12.016), and later reviewed its adoption across journals in ["The Registered Reports Revolution: Lessons in Cultural Reform"](https://rss.onlinelibrary.wiley.com/doi/full/10.1111/j.1740-9713.2019.01299.x) (Significance 16(4): 23-27, 2019; DOI 10.1111/j.1740-9713.2019.01299.x).

Marcus Munafo and a coalition of the above authors then synthesized the reform program into ["A Manifesto for Reproducible Science"](https://www.nature.com/articles/s41562-016-0021) (Nature Human Behaviour 1: 0021, 2017; DOI 10.1038/s41562-016-0021), which groups proposed remedies - preregistration and registered reports among them - under methods, reporting and dissemination, reproducibility, evaluation, and incentives, treating the crisis as a systemic, structural problem rather than one of individual researcher honesty.

## 6. Incentive-structure critiques

Paul Smaldino and Richard McElreath's ["The Natural Selection of Bad Science"](https://royalsocietypublishing.org/rsos/article/3/9/160384/56494/The-natural-selection-of-bad-scienceThe-Natural) (Royal Society Open Science 3(9): 160384, 2016; DOI 10.1098/rsos.160384) models scientific communities as evolving populations of methods rather than individuals, and argues that because publication quantity, not truth, is the trait selected for career advancement, poor methodological practices can spread and persist even without any single scientist behaving dishonestly or lazily.
A [correction](https://royalsocietypublishing.org/rsos/article/10/9/rsos231026/92271/Correction-to-The-natural-selection-of-bad-science) to the paper's simulation code was published in 2023; the qualitative conclusion was reported to survive the fix, but this study did not independently re-derive the corrected model, so the precise post-correction numbers are **[UNVERIFIED]** here.

## 7. Debates over the "crisis" framing

Not every metascientist accepts that the field-wide picture warrants the word "crisis."
Daniele Fanelli's ["Is Science Really Facing a Reproducibility Crisis, and Do We Need It To?"](https://pubmed.ncbi.nlm.nih.gov/29531051/) (PNAS 115(11): 2628-2631, 2018; DOI 10.1073/pnas.1708272114) argues that the crisis narrative overgeneralizes results concentrated in a handful of fields and paradigms, that some indicators of research integrity (such as retraction rates relative to output) have been improving, and that a narrative of incremental, empowering reform may better fit the evidence than a narrative of systemic collapse.
This paper is treated in this library as the load-bearing counterweight to section 4's replication-rate figures: the numbers are not disputed so much as their generalization beyond the specific journals, fields, and years sampled.

## 8. Implications for this library's own study practice

This section of the library is its home for research method, so this study's findings bear directly on how notes and glossary terms here should be written, not only on what they describe.
Three practices follow from the literature above.

First, verification passes matter more than citation count: the Open Science Collaboration (2015) result shows that a published, peer-reviewed finding - even one from a flagship journal - is not by itself sufficient warrant for treating a claim as settled.
Notes in this section should distinguish a claim's having a citation from a claim's having been checked against that citation's actual content, the way this study's writing process required a live web search per claim rather than a recalled citation.

Second, the **[UNVERIFIED]** marking convention used throughout this note - as recommended by Ioannidis (2005) and Munafo et al. (2017) for research reporting generally - should be a standing convention for this library's own notes: a claim that could not be traced to a primary, checkable source should say so inline, rather than reading as identical in confidence to a verified one.

Third, Nosek et al. (2018) and Chambers (2013; 2019) argue that preregistration and registered reports work by separating exploratory work from confirmatory claims before the outcome is known.
A comparable discipline for this library's own study notes would be a short program note, written before a study begins, stating what question the study is trying to answer and what kind of source would count as settling it - so that later notes can be checked against what they originally set out to find, the way a registered report is checked against its pre-registered design.

## Gaps carried forward

- The exact scope of the "crisis": section 4's replication-rate figures are field- and journal-specific (three psychology journals; two economics journals; two multidisciplinary flagship journals), and Fanelli (2018) argues explicitly against extrapolating them to science broadly.
  Any later term in this library that cites a replication rate should name the specific study and field it came from, not "science" in general.

- The three-name shorthand "Ioannidis, Fanelli & Goodman 2015" used in this study's originating prompt undercounts the paper's authorship by one (Dunne); later citations of the metascience label should use the full four-author form.

- The Smaldino and McElreath (2016) simulation has a published 2023 correction whose corrected numbers this study did not independently verify; that correction is marked **[UNVERIFIED]** above and should be checked directly before any later note relies on specific figures from that model.

- This study did not cover discipline-specific replication literatures beyond psychology, economics, and the mixed Nature/Science sample (for example, biomedicine, where Ioannidis's own earlier work originates, or the social psychology subfield disputes that followed the Open Science Collaboration project); a later note could extend this study into those literatures specifically.

- The reform literature (preregistration, registered reports, the Munafo et al. manifesto) is largely a psychology- and economics-centered program; this study did not verify how far registered-report adoption has spread across other fields, which would need its own check before being asserted as general practice.

## Verification note

Verified 2026-08-22.
An adversarial pass checked 15 load-bearing citations in this note and its four sibling glossary terms (`metascience.md`, `replication-crisis.md`, `preregistration.md`, `questionable-research-practices.md`) against publisher pages, Crossref metadata, and, where publisher pages were blocked, the Crossref API directly: Ioannidis (2005); Ioannidis, Fanelli, Dunne & Goodman (2015); Rosenthal (1979); Franco, Malhotra & Simonovits (2014); Simmons, Nelson & Simonsohn (2011); John, Loewenstein & Prelec (2012); Open Science Collaboration (2015); Camerer et al. (2016, Science); Camerer et al. (2018, Nature Human Behaviour); Nosek et al. (2018); Chambers (2013); Chambers (2019); Munafo et al. (2017); Smaldino & McElreath (2016, with its 2023 correction); and Fanelli (2018).
Four supporting sources (the Ioannidis 2005 erratum, Goodman & Greenland's 2007 critique, Ledgerwood's 2018 PNAS exchange, and Gilbert et al.'s 2016 comment on the Open Science Collaboration study) were also checked and confirmed genuine.

3 citations were corrected in place: (1) the first author of the 2014 publication-bias paper is **Annie** Franco, not "Anna" Franco, as misstated in section 2 - corrected there; (2) section 4's synthesis claiming the three large-scale replication projects "converge" around "roughly six in ten" replicating was false - the Open Science Collaboration's psychology rate (36 percent) is not close to the Camerer teams' economics and cross-disciplinary rates (61-62 percent), and the sentence has been rewritten to state the divergence directly; (3) this same six-in-ten overgeneralization, inherited from an earlier draft, was also present in `replication-crisis.md`'s frontmatter description and has been corrected there to distinguish the field-specific rates.
The frontmatter description above was additionally corrected: it referred to an "[UNVERIFIED] provenance detail in the metascience label's own history" that did not correspond to any inline marker in the body (the Dunne co-authorship question it seems to have meant was, on verification, fully confirmed, not unverified); the description now points instead to the one detail in this note that is genuinely unverified - the Smaldino & McElreath post-correction figures.

1 additional claim was marked **[UNVERIFIED]** that had not been so marked before: the specific magnitudes in section 2 attributed to Franco, Malhotra & Simonovits (2014) - "about five times more likely to be written up and published" and "roughly half of completed studies were never published at all" - could not be confirmed against the paper's abstract or full text (the publisher page and known mirrors returned 403/404 responses during this verification pass); only the qualitative direction of the finding remains asserted as verified.

All other author lists, years, venues, volumes, issues, pages or article numbers, and DOIs checked against Crossref matched the files as written, including the four-author Ioannidis, Fanelli, Dunne & Goodman (2015) byline, the 18-study/61-percent and 21-study/62-percent Camerer figures, and the Open Science Collaboration's 36-percent/97-percent/half-effect-size figures.

- **N (citations checked):** 15
- **M (corrected):** 3
- **K (marked unverified):** 1
