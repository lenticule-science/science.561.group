---
title: "Study of Identification Safety in Foraging"
description: "A literature study of the poisonous-lookalike problem finds five canonical dangerous confusion pairs documented in clinical or extension literature at uneven evidentiary strength (peer-reviewed case series for hemlock, Amanita, and death camas; extension-only sourcing for pokeweed and moonseed), and finds that single-photo CV plant- and mushroom-identification apps fail specifically and severely on toxic species (a 2023 Clinical Toxicology poison-center study put the best-performing app at 74% correct against a botanist's ground truth on 25 real exposure cases, and a 2022 Australian mushroom-app study — reachable here only through three consistent secondary citations, not the primary paper — reported the best of three apps at 44% correct on toxic species and two documented false-negatives on death cap), a gap between demonstrated accuracy and the confidence with which these tools present results that the literature repeatedly names as the core safety failure, independent of raw model accuracy."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-study-of-identification-safety
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["poisonous-lookalike", "identification-safety", "amanita", "poison-hemlock", "death-camas", "pokeweed", "moonseed", "mushroom-poisoning", "computer-vision-identification", "plant-identification-apps", "mycology"]
tags: ["draft", "study"]
---

# Study of Identification Safety in Foraging

This is a study of the poisonous-lookalike problem in foraging, read
for two purposes: to establish, for the canonical dangerous
species-confusion pairs, what the clinical and epidemiological
literature actually documents about mechanism and outcome (not just
that "confusion happens"); and to establish what the literature says
about whether computer-vision identification apps make the problem
better or worse. Method: two sources, read for mechanism and traced
to their originating claim rather than restated as a topic summary.
`report-1.md` §2 (a foraging-science literature study, 2026-08-22)
supplies the clinical-toxicology material on named dangerous pairs.
`report-4.md` (a species-ID/biodiversity-data-stack technical
landscape compiled for a foraging-app project, also 2026-08-22)
supplies the CV-identification safety material in its §1. Both source
reports explicitly flag claims they could not verify against a
primary source, and this note preserves those flags rather than
upgrading them into settled fact — a claim marked **[UNVERIFIED]** or
**[SECONDARY-SOURCED]** below carries that same status here, and §3
gives a per-claim verdict for every load-bearing figure in this note.
This section's `poisonous-lookalike` term already defines the general
concept; this note supplies the literature behind specific pairs and
behind the CV-app failure record.

## 1. Canonical dangerous confusion pairs

**Poison hemlock vs. wild carrot and other umbellifers.**
*Conium maculatum* is repeatedly documented in clinical literature as
confusable with carrot, parsnip, and celery, sharing both family
resemblance (Apiaceae) and a carrot-like taproot. "Conium maculatum
intoxication: Literature review and case report on hemlock poisoning"
([PubMed 30594904](https://pubmed.ncbi.nlm.nih.gov/30594904/)) and
"Acute Intoxication With Poison Hemlock (Conium maculatum)," *Cureus*
([PMC12005235](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12005235/))
document the mechanism: the alkaloid coniine is a neurotoxin that
depolarizes neurons, and severe symptoms — neurotoxicosis, tremor,
vomiting, muscle and respiratory paralysis, rhabdomyolysis, acute renal
failure — can begin within 15 minutes of ingestion; a documented case
in the literature review is a 6-year-old child hospitalized with
hypersalivation, tremor, and ataxia after ingestion. Extension-service
identification guidance corroborates the botanical confusability
without adding clinical evidence of its own
([University of Illinois Extension, 2024](https://extension.illinois.edu/blogs/good-growing/2024-05-31-identifying-danger-toxic-plants-look-carrots);
[USDA-ARS poisonous-plant research profile](https://www.ars.usda.gov/pacific-west-area/logan-ut/poisonous-plant-research/docs/poison-hemlock-conium-maculatum/)).

**Amanita spp. vs. edible mushrooms.**
This is the pair with the deepest peer-reviewed epidemiological base.
Diaz, J.H. (2005), "Syndromic diagnosis and management of confirmed
mushroom poisonings," *Critical Care Medicine* 33(2):427-436
([PubMed 15699849](https://pubmed.ncbi.nlm.nih.gov/15699849/)),
reviews 1959–2002 data describing 28,018 mushroom poisonings since
1951 and classifies poisoning syndromes including four newer ones
(accelerated nephrotoxicity, rhabdomyolysis, erythromelalgia, delayed
neurotoxicity) — establishing that "mushroom poisoning" is not one
clinical picture but several, with different toxins acting on
different timescales. A companion 2005 paper extends this to global
epidemiology and prevention
([PubMed 15699848](https://pubmed.ncbi.nlm.nih.gov/15699848/)). CDC
MMWR case-cluster reports document specific outbreaks over three
decades: "Amanita phalloides Mushroom Poisoning — Northern California,
January 1997"; "Amanita phalloides Mushroom Poisonings — Northern
California, December 2016"
([PMC5657817](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5657817/));
and the most recent documented outbreak, "Amanita Species Mushroom
Poisonings — Northern California, November 2025–March 2026," *MMWR*
vol. 75
([cdc.gov](https://www.cdc.gov/mmwr/volumes/75/wr/mm7520a2.htm)) — 39
cases, 3 liver transplants, 4 deaths, 82% recovering without
transplant, later tallied by the California Poison Control System at
47 cases / 4 deaths / 4 transplants through May 2026 across
Humboldt-to-San Luis Obispo counties
([CDPH update](https://www.cdph.ca.gov/Programs/OPA/Pages/CAHAN/Outbreak-of-Severe-Illness-and-Deaths-Linked-to-Ingestion-of-Poisonous-Wild-Mushrooms-%E2%80%93-May-2026-Update.aspx)).
A geographic mechanism sits behind the outbreak pattern: *Amanita
phalloides* is non-native to North America, believed introduced via
contaminated nursery soil, and is now established on the US west
coast, mid-Atlantic, and northeast — meaning the death-cap hazard in
North American foraging is a relatively recent, still-spreading
range-expansion problem, not a static baseline risk. The report notes
(via an UpToDate clinical summary, not independently traced further
here) that amatoxin mushrooms cause roughly 50 deaths/year in Europe
and Asia but only 1–2/year in the US on average, a gap attributed to
foraging prevalence rather than differential toxicity. National-scale
morbidity data comes from CDC MMWR, "Health Care Utilization and
Outcomes Associated with Accidental Poisonous Mushroom Ingestions —
United States, 2016–2018," *MMWR* 70(10) (2021)
([cdc.gov](https://www.cdc.gov/mmwr/volumes/70/wr/mm7010a1.htm);
[PubMed 33705365](https://pubmed.ncbi.nlm.nih.gov/33705365/)): roughly
1,328 ED visits and 100 hospitalizations nationally in 2016 for
accidental poisonous-mushroom ingestion; of 556 care-seeking patients
2016–2018, 8.6% (48) had a serious adverse outcome (arrhythmia, kidney
failure, liver failure, seizures); roughly 7,500 poisonous-mushroom
ingestions are reported annually to US poison-control centers; severe
poisonings from foraged mushrooms rose over 1999–2016.

**Death camas vs. wild onion.**
"Acute death Camas (Toxicoscordion venenosum) plant poisoning in seven
family members following foraging for wild onions"
([PubMed 39472268](https://pubmed.ncbi.nlm.nih.gov/39472268/)) is a
case series of seven family members (5 children, 2 adults) poisoned
after misidentifying *Toxicoscordion venenosum* bulbs as *Allium
canadense* (wild onion). The mechanism is specific and clinically
important: onset at 30–60 minutes with nausea, vomiting, and abdominal
pain, progressing to bradycardia and hypotension driven by the
alkaloid zygacine, which causes alpha-blockade, sodium-channel
activation, and vagal stimulation; zygacine is heat-stable and is not
destroyed by cooking, so the usual forager's fallback of "cook
anything uncertain" does not neutralize this toxin. The
literature-reported identification differentiator is olfactory and
morphological, not just visual-pattern matching: wild onion has a
distinct onion odor and flat leaves, while death camas lacks onion
smell, tastes bitter, and has a V-shaped leaf cross-section — a
differentiator that a single still photograph cannot reliably capture,
which is directly relevant to §2 below.

**Pokeweed (*Phytolacca americana*) — extension-sourced, not
peer-reviewed case series.** Toxic principle: saponins and alkaloids.
Only very young spring shoots (pre-red/purple coloration, under 6
inches, before branching) are traditionally regarded as edible after
preparation; poisoning most often results from harvesting mature
stalks/leaves or root fragments (the most toxic part) mistaken for
parsnip or horseradish root. This is documented in state agricultural
extension and poison-center clinical guidance
([WV Dept. of Agriculture poisonous-plants guide](https://agriculture.wv.gov/wp-content/uploads/Poisonous-Plants-Book.pdf);
[Vanderbilt/Tennessee Poison Center clinical Q&A](https://www.vumc.org/poison-control/toxicology-question-week/june-10-2002-what-toxicity-pokeweed)),
not in an identified peer-reviewed clinical case series — a real gap,
carried forward from the underlying report rather than papered over.

**Moonseed (*Menispermum canadense*) vs. wild grape — extension-sourced,
weakest evidentiary base in this set.** Moonseed fruit closely
resembles wild grape (*Vitis* spp.) but contains isoquinoline
alkaloids (notably dauricine) throughout the plant, reportedly causing
seizures, abdominal cramps, nausea, and cardiac arrhythmia, potentially
fatal especially in children. The identification differentiators
reported — a single crescent-shaped seed versus grape's round seeds,
smooth versus toothed leaf margins, no tendrils versus grape's forked
tendrils — come from horticultural/extension sources
([Missouri Dept. of Conservation](https://mdc.mo.gov/discover-nature/field-guide/common-moonseed);
[Birds & Blooms](https://www.birdsandblooms.com/gardening/gardening-basics/moonseed-vs-wild-grape/)),
not from peer-reviewed clinical literature. No peer-reviewed clinical
case report on moonseed poisoning was located in the underlying
report's search; every toxicological and identification claim in this
paragraph should be read as resting on secondary, non-clinical sources
until a primary case report is located.

**Aggregate poisoning surveillance.** The American Association of
Poison Control Centers (AAPCC) National Poison Data System (NPDS)
Annual Reports, published in *Clinical Toxicology*, are the standard
US surveillance instrument for plant and mushroom exposure counts (the
38th Annual Report for 2020: [PubMed 34890263](https://pubmed.ncbi.nlm.nih.gov/34890263/);
the 31st for 2013: [PMC4782684](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4782684/)).
All roughly 55 US poison centers upload case data to NPDS
automatically. The underlying report could not extract exact
current-year plant/mushroom exposure subtotals from full-text tables —
the annual reports are paywalled behind *Clinical Toxicology* — so no
single current aggregate figure is asserted here.

## 2. Computer-vision identification apps: the documented failure record on toxic species

The clinical-toxicology literature on app performance is the most
directly safety-relevant material in this study, because it tests apps
against real referred poisoning cases rather than curated demo photos.

**Long, Townesmith, Overmiller et al., *Clinical Toxicology* 2023,
"Plant identification applications do not reliably identify toxic and
edible plants in the American Midwest"**
([PubMed 37535032](https://pubmed.ncbi.nlm.nih.gov/37535032/);
cross-confirmed via [Tandfonline abstract](https://www.tandfonline.com/doi/full/10.1080/15563650.2023.2237282))
is the strongest single piece of evidence in this note: 25 real
plant-exposure cases referred to a US poison center were tested
against Google Lens, PictureThis, PlantSnap, LeafSnap, Plant
Identifier, and Pl@ntNet, with a botanist's identification as ground
truth. Results: PictureThis 74%, Plant Identifier and Pl@ntNet 72%,
PlantSnap lowest at 38%. The paper's own conclusion, not a
paraphrase added here, is that current apps are not reliable enough
for poison-control centers to use for exposure guidance, and cannot be
used to safely identify edible plants. A related, earlier study in the
same research line, "Swipe Right: a Comparison of Accuracy of Plant
Identification Apps for Toxic Plants"
([PubMed abstract 32794048](https://pubmed.ncbi.nlm.nih.gov/32794048/)),
was located only as an abstract in the underlying report, not read in
full, and is cited here as a listing only. A Queensland Poisons
Information Centre study (2024,
[Tandfonline](https://www.tandfonline.com/doi/full/10.1080/24734306.2024.2377523))
tests real suspected-poisoning referrals and is consistent with the
Midwest study's conclusion but was likewise accessed only as an
abstract in the underlying report.

**The 2022 Australian mushroom-app study — reachable here only through
secondary citation.** A comparative study of three mushroom-ID apps
(Picture Mushroom, Mushroom Identificator, iNaturalist) is cited in
the underlying report's own words as **[partially unverified against
primary text, but consistently reported across 3 independent secondary
sources]**: the primary paper (indexed at
[PubMed 36794335](https://pubmed.ncbi.nlm.nih.gov/36794335/)) was
blocked by a cookie wall, so the figures below come from three
secondary citations (Public Citizen, mushroom-appreciation.com, and a
third source) rather than from the paper itself, and that flag is
preserved here rather than resolved. As reported secondhand: Picture
Mushroom was the best performer at 49% overall correct, 44% correct on
toxic species specifically, and reportedly misidentified *Amanita
phalloides* (death cap) twice as something else; Mushroom Identificator
and iNaturalist scored roughly 35% overall correct, with 30% and 40%
correct on toxic species respectively; lookalikes of deadly genera
(*Amanita*, *Galerina*) were misidentified more than 30% of the time
across the tested apps. This figure set should not be quoted as a
peer-reviewed finding without independent verification against the
primary paper — see §3.

**Structural failure mode, not just an accuracy number.** Multiple
independent sources in the underlying report converge on the same
non-numeric finding: the core safety problem is that these apps
present identifications with unwarranted confidence and no calibrated
uncertainty, rather than raw model accuracy per se
([mushroom-appreciation.com](https://www.mushroom-appreciation.com/the-hidden-dangers-of-relying-on-mushroom-identification-apps.html)).
A 2024–2025 Public Citizen report on AI mushroom/plant-ID tools,
including GPT-based chatbots, found generative "Mushroom Guide"/"GPT
Mycology" bots producing outright false taxonomic claims (for example,
incorrect statements about *Galerina* gill attachment and ring
presence — errors that could cause fatal confusion with edible deer
mushrooms) and false general rules such as "bright colors = toxic,"
which is not reliably true; the report recommends mandatory
AI-content disclosure, upfront error-rate disclosure, and business
liability for AI-misinformation harms
([citizen.org](https://www.citizen.org/article/mushroom-risk-ai-app-misinformation/)).
For comparison, single well-scoped consumer classifiers do better in
narrower domains: Cornell Lab of Ornithology's Merlin app, trained on
750,000 crowdsourced recordings for sound ID, is cited at roughly 90%
accuracy, though a peer-reviewed field study —
"Humans outperform Merlin Sound ID in field-based point-count surveys"
([Ornithological Applications/Oxford Academic](https://academic.oup.com/condor/article/127/4/1/8222742))
— found trained human observers still beat the app on real transect
surveys, an important caution against treating any single-tool CV
system, however well-resourced, as a full substitute for expertise.
Birds are also acoustically and visually far more standardized and
photogenic than fungi, so Merlin's relative success is not necessarily
transferable to the mushroom-ID problem.

**A documented real-world incident cluster attributed partly to app
misidentification** — a 2015 Oregon family hospitalization, a 2022
Ohio *Amanita* poisoning, and a cluster reported by mushroomtracker.ca
of 47 poisoning cases since November 2025, including 4 deaths and 4
liver transplants, with AI misidentification cited as a contributing
factor in some cases — is explicitly flagged in the underlying report
as **[UNVERIFIED]**: this cluster figure comes from a single blog
source (mushroomtracker.ca) and was not cross-verified against a
public-health or news source in the underlying report
([mushroomtracker.ca](https://www.mushroomtracker.ca/blog/ai-mushroom-identification-safe-2026.html)).
Note that the CDC/CDPH-documented Northern California outbreak in §1
above (47 cases / 4 deaths / 4 transplants through May 2026) shares an
identical case/death/transplant count with this blog-sourced cluster
claim; the underlying reports do not establish whether these are the
same event reported through two channels or two distinct clusters, and
this note does not resolve that ambiguity — it is flagged here as an
open question rather than silently merged.

## 3. Per-claim verdicts

Following the S-form convention of marking each load-bearing claim's
verification status rather than asserting a uniform confidence level:

- **Poison hemlock mechanism and case (coniine neurotoxicity, 15-minute
  onset, pediatric case)** — SECONDARY-SOURCED. Drawn from a published
  literature review and case report indexed on PubMed/PMC; this note
  did not independently re-fetch and check the primary case report
  against the claims made about it.
- **Amanita/amatoxin epidemiology (Diaz 2005 syndrome classification;
  CDC MMWR outbreak case counts 1997, 2016, 2025–2026; NPDS national
  morbidity figures 2016–2018)** — SECONDARY-SOURCED. All figures trace
  to named peer-reviewed papers or CDC MMWR reports with working
  links; this note relays the underlying report's reading of those
  sources rather than an independent re-fetch of each one.
- **Death camas case series (7 family members, zygacine mechanism,
  heat-stability)** — SECONDARY-SOURCED. Traces to a specific,
  identifiable PubMed-indexed case series; not independently re-fetched
  here.
- **Pokeweed and moonseed identification/toxicity claims** —
  UNVERIFIED at the clinical-case-report level for both, explicitly and
  repeatedly, in the underlying report; sourced only to state
  extension and horticultural material. Treat any specific toxicity
  threshold or symptom timeline for these two species as provisional
  pending a peer-reviewed case report.
- **Long et al. 2023 Clinical Toxicology poison-center app study (74%
  best-app accuracy, 38% worst, 25 real cases)** — SECONDARY-SOURCED
  with high confidence: the underlying report cross-confirmed the
  PubMed abstract against an independent Tandfonline abstract of the
  same paper, though neither report fetched the full paper text.
  CONFIRMED-adjacent but not CONFIRMED against full primary text.
- **"Swipe Right" study and Queensland Poisons Information Centre
  study** — UNVERIFIED beyond abstract level; listed, not verified, in
  the underlying report.
- **2022 Australian mushroom-app study figures (49%/44%/35%/30%/40%,
  two Amanita phalloides false negatives)** — explicitly
  SECONDARY-SOURCED per the underlying report's own flag, consistent
  across three independent secondary citations but never confirmed
  against the primary paper (PubMed 36794335, blocked by cookie wall).
  This is the single most safety-relevant figure set in this note and
  also its weakest-verified one; it should not be presented in any
  external-facing document as a confirmed peer-reviewed finding without
  first obtaining the primary paper.
- **Public Citizen AI-chatbot mycology-error report** —
  SECONDARY-SOURCED to a named advocacy-organization report with a
  working citation; not a peer-reviewed source, and not independently
  re-verified here.
- **Merlin ~90% sound-ID accuracy and the human-outperforms-Merlin
  field study** — the field-study finding is SECONDARY-SOURCED to a
  named peer-reviewed paper (Ornithological Applications/Oxford
  Academic); the ~90% accuracy figure itself was not traced to a
  Cornell-primary publication in either underlying report and should be
  treated as UNVERIFIED at the primary-source level.
- **Mushroomtracker.ca 47-poisoning/4-death/4-transplant AI-attributed
  cluster** — UNVERIFIED, explicitly flagged as such in the underlying
  report (single blog source, not cross-checked against a health
  department or news outlet). Its apparent overlap with the
  CDC/CDPH-documented Northern California outbreak (§1, §2) is noted
  but not resolved here.
- **"Apps present results with unwarranted confidence, no calibrated
  uncertainty" as the core structural failure mode** — this is a
  cross-source pattern claim (repeated across Public Citizen, a
  mushroom-safety blog, and the poison-center clinical-toxicology
  papers' own conclusions) rather than a single measured statistic; it
  is treated here as well-supported by convergent sourcing but is not
  itself a number that can be marked CONFIRMED or UNVERIFIED in the
  same sense as the figures above.

## Sources

- https://pubmed.ncbi.nlm.nih.gov/30594904/
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12005235/
- https://extension.illinois.edu/blogs/good-growing/2024-05-31-identifying-danger-toxic-plants-look-carrots
- https://www.ars.usda.gov/pacific-west-area/logan-ut/poisonous-plant-research/docs/poison-hemlock-conium-maculatum/
- https://pubmed.ncbi.nlm.nih.gov/15699849/
- https://pubmed.ncbi.nlm.nih.gov/15699848/
- https://www.cdc.gov/mmwr/volumes/75/wr/mm7520a2.htm
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5657817/
- https://www.cdph.ca.gov/Programs/OPA/Pages/CAHAN/Outbreak-of-Severe-Illness-and-Deaths-Linked-to-Ingestion-of-Poisonous-Wild-Mushrooms-%E2%80%93-May-2026-Update.aspx
- https://www.cdc.gov/mmwr/volumes/70/wr/mm7010a1.htm
- https://pubmed.ncbi.nlm.nih.gov/33705365/
- https://pubmed.ncbi.nlm.nih.gov/39472268/
- https://agriculture.wv.gov/wp-content/uploads/Poisonous-Plants-Book.pdf
- https://www.vumc.org/poison-control/toxicology-question-week/june-10-2002-what-toxicity-pokeweed
- https://mdc.mo.gov/discover-nature/field-guide/common-moonseed
- https://www.birdsandblooms.com/gardening/gardening-basics/moonseed-vs-wild-grape/
- https://pubmed.ncbi.nlm.nih.gov/34890263/
- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4782684/
- https://pubmed.ncbi.nlm.nih.gov/37535032/
- https://www.tandfonline.com/doi/full/10.1080/15563650.2023.2237282
- https://pubmed.ncbi.nlm.nih.gov/32794048/
- https://www.tandfonline.com/doi/full/10.1080/24734306.2024.2377523
- https://pubmed.ncbi.nlm.nih.gov/36794335/
- https://www.mushroom-appreciation.com/the-hidden-dangers-of-relying-on-mushroom-identification-apps.html
- https://www.citizen.org/article/mushroom-risk-ai-app-misinformation/
- https://www.mushroomtracker.ca/blog/ai-mushroom-identification-safe-2026.html
- https://academic.oup.com/condor/article/127/4/1/8222742
- https://news.cornell.edu/stories/2022/04/merlin-bird-id-app-identifies-more-450-bird-species-sound
