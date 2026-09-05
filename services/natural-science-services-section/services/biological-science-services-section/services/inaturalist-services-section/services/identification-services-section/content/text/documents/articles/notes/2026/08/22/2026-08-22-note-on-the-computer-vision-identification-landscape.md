---
title: "The Computer-Vision Identification Landscape"
description: "A survey of species-identification apps finds published accuracy figures ranging from Flora Incognita's self-reported 98.8% down to 30-49% correct on toxic mushroom species in independent poison-center studies, with most headline numbers resting on vendor claims or paywalled primary sources this note could not verify directly, and finds a consistent cross-app pattern in which the apps with the best safety reputations (Merlin, Shroomify, Wild Edibles) are precisely the ones that de-emphasize single-photo computer-vision matching in favor of expert-curated content, structured trait checklists, or audio classification, while the underlying taxonomic-backbone layer (POWO, GBIF, iNaturalist's open data) carries a documented observation-effort bias and a gap this note also could not close: no global fungal taxonomy authority comparable to POWO was surveyed."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-computer-vision-identification-landscape
authors:
  - claude-sonnet-5
status: draft-for-owner-review
keywords: ["computer-vision", "species-identification", "inaturalist-cv-model", "seek", "plantnet", "picturethis", "flora-incognita", "merlin", "picture-mushroom", "gbif", "powo", "taxonomic-backbone", "observation-effort-bias", "toxic-lookalikes"]
tags: ["draft", "note", "identification", "competitive-landscape"]
---


This note is a survey of the computer-vision (CV) species-identification
field as of August 2026 — what the leading apps' models are built on,
what accuracy figures are actually published (and by whom), and what
data infrastructure sits underneath the identification layer — compiled
from a single research pass (`report-4.md`, 2026-08-22). Method:
iNaturalist's and other vendors' own technical blog posts and repos,
independent peer-reviewed accuracy studies, and secondary press/review
coverage, read for the mechanism (what the model is trained on, what
it does and does not cover) rather than the marketing claim.
**Verification honesty statement**: several of this note's most citable
numbers — a genus/species accuracy study, a mushroom-app comparison
study, and a vendor's self-reported accuracy figure — could not be
confirmed against their primary text (paywalls, 403s, or cookie walls
blocked direct access in the underlying research pass) and are marked
**[UNVERIFIED]** below rather than stated as settled fact; where a
figure is a vendor's own claim about its own product, that is marked
separately as a self-report rather than an independent finding.

## iNaturalist's own CV model, and Seek's separate one

iNaturalist's production classifier is trained on over 60,000 taxa and
roughly 30 million training photos, using transfer learning rather
than full retraining from scratch, which lets the team retrain more
frequently than a from-scratch approach would allow; the July 2021
training run reportedly ran on a single NVIDIA RTX 8000 GPU.
([iNaturalist blog](https://www.inaturalist.org/blog/105731-new-computer-vision-model-v2-19-with-over-2-000-new-species),
[forum](https://forum.inaturalist.org/t/computer-vision-update-july-2021/24728))
The full production model is kept closed — iNaturalist states this is
"due to intellectual property considerations and photos where users
have chosen to retain all rights" — though the organization does
publish smaller ~500-taxa on-device demo models and a public
geospatial "geomodel" implementation.
([model-files repo](https://github.com/inaturalist/model-files),
[inatVisionAPI](https://github.com/inaturalist/inatVisionAPI))

The geomodel is a distinct component from the photo classifier: a
spatial implicit neural representation trained jointly across species
from iNaturalist's own observation data (a minimum of roughly 100
observations per taxon), rendered onto an H3-level-4 hexagonal grid.
Its newest iteration dropped explicit environmental covariates
(elevation, rainfall) in favor of learning purely from the collective
geospatial pattern of past observations, which is documented to
produce false absences for highly seasonal species and to be limited
for data-scarce taxa — a direct downstream consequence of the
observation-effort bias discussed below.
([Introducing the Geomodel](https://www.inaturalist.org/blog/84677-introducing-the-inaturalist-geomodel),
[CV/Geomodel caveats](https://inaturalist.ala.org.au/posts/115290-cv-and-geomodel-predictions-visibility-identifiability-seasonality-apples-oranges))

Seek, iNaturalist's offline no-account companion app, does not reuse
the server-side model at all — that model is described as "far too
large" for on-device inference — and instead runs a separate,
deliberately shrunk model built for real-time, in-viewfinder
prediction, extended to fall back to a higher taxonomic rank (genus or
family) when species-level confidence is low rather than forcing a
single overconfident species guess.
([Seek v2.0 CV post](https://www.inaturalist.org/blog/23075-real-time-computer-vision-predictions-in-seek-by-inaturalist-version-2-0))

## Published accuracy figures, and how much weight each deserves

**Pl@ntNet** covers over 35,000 species from roughly 12 million
validated training images, with a documented bias toward common,
frequently-photographed species and weaker performance on rare taxa.
An independent evaluation (Hart et al. 2023, *People and Nature*)
reported family/genus-level accuracy above 85% at high confidence but
species-level accuracy around 70%, with single-plant, uncluttered
photos performing much better than cluttered or multi-subject ones.
This paper's full text was paywalled in the underlying research pass —
the figures above come from a search snippet, not a checked read of
the primary text. **[UNVERIFIED against primary source]**
([Pl@ntNet docs](https://docs.plantnet.org/en/tutorials/identify-a-plant/),
[Hart et al. 2023](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1002/pan3.10460))

**PictureThis** (Glority, Chengdu) is a commercial app running
$39.99/year or $9.99/month after a free trial that auto-converts to a
paid subscription, criticized in app-store reviews and consumer
write-ups for aggressive paywalling and a hard-to-cancel renewal flow.
A cited 2022 study reported 97.27% genus-level and 83.86% species-level
accuracy on leaf photos, dropping sharply to 65.45%/51.82% on bark
images — accuracy here is strongly dependent on the type of photo
supplied, not a single number. In a real-world poison-center study
(below), PictureThis was the best-performing consumer app tested, at
74% correct — still leaving one in four wrong on cases serious enough
to reach a poison center.
([identifythis.app review](https://identifythis.app/picture-this-app-review),
[gardening.alibaba.com summary](https://gardening.alibaba.com/tips/picturethis-wins-for-plant-id-accuracy-but-only-if-you-know-this))

**Flora Incognita**, built by TU Ilmenau and the Max Planck Institute
for Biogeochemistry with German federal funding, is free, ad-free,
offline-capable, and covers roughly 16,000 taxa. Its own 2024 blog
post reports 98.8% identification accuracy in what it calls a
"scientific study" — this figure is published by Flora Incognita
itself, not by an independent journal found in the underlying
research, and should be read as a **self-reported vendor claim**, not
an independently confirmed result, notwithstanding the institutional
backing of its authors. ([floraincognita.com](https://floraincognita.com/),
[floraincognita.com/blog](https://floraincognita.com/blog/2024/10/24/study-on-identification-accuracy-flora-incognita-reaches-98-8/))

**Merlin** (Cornell Lab of Ornithology / eBird) is free, ad-free,
nonprofit-backed, with over 10 million downloads and coverage of
10,000+ species; it is widely described in review press as the "gold
standard" among free bird-ID apps. Its Sound ID feature is trained on
750,000 crowdsourced recordings, with an officially cited accuracy
around 90% — though background noise and call variation degrade this
in real field conditions. A commonly repeated photo-ID accuracy figure
(92% for common backyard species, 78% for less-common species) comes
from a secondary comparison site rather than a Cornell Lab primary
publication, and could not be traced to a Cornell-sourced figure
directly. **[UNVERIFIED — not sourced to Cornell directly]** Separately,
a peer-reviewed field study reports that trained human observers
outperform Merlin Sound ID in field-based point-count surveys — a
useful caution against treating even the field's best-regarded CV/audio
tool as a full substitute for expertise.
([Cornell Chronicle](https://news.cornell.edu/stories/2022/04/merlin-bird-id-app-identifies-more-450-bird-species-sound),
[Ornithological Applications](https://academic.oup.com/condor/article/127/4/1/8222742))
Merlin's success is best read as a case study in what a small,
well-resourced nonprofit team can build when scoped tightly to one
taxon group backed by a large, curated reference dataset (eBird) —
birds are also acoustically and visually more standardized and
photogenic as a group than fungi are, which limits how directly this
model transfers.

## Independent multi-app studies, and mushroom apps specifically

The most load-bearing accuracy evidence for safety-relevant use comes
from clinically-oriented, multi-app comparison studies rather than any
single vendor's claim:

- **Hart et al. 2023** (cited above) additionally reported an overall
  genus-level accuracy across PictureThis, Pl@ntNet, PlantSnap and
  others of 76% (95% CI 73-79%), ranging from 96% (PictureThis) down to
  53% (PlantSnap). **[UNVERIFIED against primary source — paywalled]**
- **Long, Townesmith, Overmiller et al., *Clinical Toxicology* 2023**,
  "Plant identification applications do not reliably identify toxic
  and edible plants in the American Midwest," tested Google Lens,
  PictureThis, PlantSnap, LeafSnap, Plant Identifier, and Pl@ntNet
  against 25 real plant-exposure cases referred to a US poison center,
  using a botanist's identification as ground truth. Results:
  PictureThis 74%, Plant Identifier and Pl@ntNet 72%, PlantSnap lowest
  at 38%. The paper's conclusion is direct: current apps are not
  reliable enough for poison-control centers to use for exposure
  guidance, and cannot be used to safely identify edible plants.
  ([PubMed](https://pubmed.ncbi.nlm.nih.gov/37535032/),
  [Tandfonline abstract](https://www.tandfonline.com/doi/full/10.1080/15563650.2023.2237282))
- A related Queensland Poisons Information Centre study (2024) using
  real suspected-poisoning cases reached a consistent conclusion — that
  consumer identification apps underperform for clinical/safety
  decisions; only the abstract was available in the underlying
  research. ([tandfonline.com](https://www.tandfonline.com/doi/full/10.1080/24734306.2024.2377523))

Mushroom identification is the field's most safety-critical failure
literature. A 2022 Australian comparative study tested Picture
Mushroom, Mushroom Identificator, and iNaturalist; its primary text
was blocked by a cookie wall in the underlying research, so the
figures below come from three independent secondary citations that
agree with each other, which raises confidence somewhat but does not
substitute for a primary-text check. **[partially unverified against
primary text, consistent across three secondary sources]** Picture
Mushroom was the best performer at 49% overall correct and 44% correct
on toxic species specifically, and reportedly misidentified *Amanita
phalloides* (death cap) twice as something else. Mushroom Identificator
and iNaturalist both scored around 35% overall, at 30% and 40%
correct on toxic species respectively. Look-alikes of deadly genera
(*Amanita*, *Galerina*) were misidentified more than 30% of the time
across the tested apps.
([PubMed 36794335](https://pubmed.ncbi.nlm.nih.gov/36794335/))

A separate 2024-2025 Public Citizen report examined generative-AI
mushroom/plant identification tools specifically (as opposed to
purpose-built CV classifiers) and found GPT-powered "Mushroom Guide" /
"GPT Mycology" bots generating outright false taxonomic claims — for
example, incorrect statements about *Galerina* gill attachment and
ring presence, an error that could lead to fatal confusion with edible
deer mushrooms — plus false general heuristics such as "bright colors
mean toxic," which is not a reliable rule. The report recommends
mandatory AI-content disclosure, upfront error-rate disclosure, and
business liability for AI-generated misinformation harms.
([citizen.org](https://www.citizen.org/article/mushroom-risk-ai-app-misinformation/))
A cluster of 47 mushroom-poisoning cases since November 2025, including
4 deaths and 4 liver transplants, with AI misidentification cited as a
contributing factor in some cases, is sourced to a single blog
(mushroomtracker.ca) and was not cross-verified against a public-health
or news source in the underlying research. **[UNVERIFIED — single
source, not corroborated]** ([mushroomtracker.ca](https://www.mushroomtracker.ca/blog/ai-mushroom-identification-safe-2026.html))

Across this literature, one structural critique recurs independent of
any single app's raw accuracy number: identification apps present
results with unwarranted confidence and no calibrated uncertainty,
which several sources treat as the core safety failure mode rather
than model accuracy per se.
([mushroom-appreciation.com](https://www.mushroom-appreciation.com/the-hidden-dangers-of-relying-on-mushroom-identification-apps.html))

## The pattern: safety reputation tracks CV de-emphasis, not CV sophistication

Read across the field, best-in-class CV apps land around 70-85%
species-level accuracy under favorable conditions (a single, clear,
well-framed photo of a common species), and that figure collapses
toward 30-50% on toxic or dangerous lookalikes and on clinically
referred real-world cases — precisely the domain where a
misidentification is lethal rather than merely annoying. The apps with
the strongest safety reputations in this survey are, without
exception, the ones that avoid or de-emphasize single-photo CV
matching as the primary identification mechanism: Merlin leans on
audio classification plus a large curated reference dataset (eBird)
rather than photo matching alone; Shroomify (a commercial,
USA-focused mushroom app) uses trait-based dichotomous-style
identification — color, spore print, habitat, smell — explicitly
forcing the user to examine physical evidence rather than one-tap
photo matching, and is positioned by its own makers as a teaching
tool; Wild Edibles (WinterRoot LLC / "Wildman" Steve Brill) uses no
image recognition at all, only expert-authored reference content with
explicit lookalike and caution sections. By contrast, the apps with
the worst published safety track record on toxic species — Picture
Mushroom, PlantSnap, and generic photo-match tools generally — are
precisely the pure single-photo-CV apps. This pattern held across
every independent, safety-relevant study found in the underlying
research pass, though it should be read as a documented correlation
across the surveyed apps, not a controlled causal test of CV-versus-not.

## The data infrastructure layer

**GBIF** (Global Biodiversity Information Facility) aggregates over 3
billion occurrence records (as of 2025) from roughly 2,300 publishing
institutions, standardized on Darwin Core; iNaturalist contributes
weekly Research-Grade exports under CC-BY, CC-BY-NC, or CC0 licensing,
each with a citable DOI.
([gbif.org](https://www.gbif.org/what-is-gbif),
[gbif.org/terms](https://www.gbif.org/terms))
The bias in this occurrence data is well-documented and structural,
not incidental: citizen-science and social-media-derived records
cluster heavily around human-accessible areas — roads, cities, trails —
which studies show artificially inflates apparent species richness in
heavily-sampled regions and underestimates biodiversity in data-poor
ones. Purpose-built bias-correction tools exist specifically because
of this (for example the `gbif.range` R package and GBIF's own
sampling-effort datasets). The practical consequence for any
range-prediction feature built on GBIF or iNaturalist occurrence data
is that it inherits an urban/trail-access bias: it will under-detect
species in remote or under-visited habitat and over-detect near
cities, independent of the underlying species' actual distribution.
([GBIF: Sampling biases shape our view of the natural world](https://www.gbif.org/data-use/6hL40kh9ikDXftobIM85KP/sampling-biases-shape-our-view-of-the-natural-world),
[Wiley ddi.70205](https://onlinelibrary.wiley.com/doi/10.1111/ddi.70205),
[Conservation journal spatial-bias paper](https://doi.org/10.3390/conservation6020040))

iNaturalist also publishes an open dataset — iNaturalist Licensed
Observation Images, on the AWS Open Data Registry
(`s3://inaturalist-open-data`, launched April 2021) — providing
bulk-downloadable CC-licensed and CC0 images plus metadata, updated
near-real-time for photos and monthly for metadata. This is a
different photo domain from `static.inaturalist.org`, which is not
openly licensed, a distinction documented on iNaturalist's own forum
as a recurring point of confusion; only Research Grade, open-licensed
observations flow through to GBIF at all.
([registry.opendata.aws](https://registry.opendata.aws/inaturalist-open-data/),
[inaturalist-open-data GitHub](https://github.com/inaturalist/inaturalist-open-data),
[forum thread](https://forum.inaturalist.org/t/questions-re-use-of-inaturalist-data-in-research-gbif-exports-licenses-of-observations/21400))
Critically, iNaturalist's Terms of Service explicitly prohibit using
its data to train AI, machine-learning, or large-language models for
commercial purposes — a licensing constraint that forecloses simply
scraping iNaturalist's corpus to bootstrap a commercial classifier
without a separate agreement.
([API recommended practices](https://www.inaturalist.org/pages/api+recommended+practices),
[forum on commercial-use terms](https://forum.inaturalist.org/t/is-this-use-of-inaturalist-content-a-breach-of-the-commercial-purpose-terms/9841))

## Taxonomic backbones, and the fungal gap

iNaturalist's own taxonomy follows the Catalogue of Life down to
Phylum, then defers to domain-specific authorities: WoRMS for most
non-arthropod, non-chordate animal phyla; the Reptile Database and
Catalog of Fishes for chordates; and Plants of the World Online (POWO)
for vascular plants — implemented through a "Taxon Frameworks" system
with designated Taxon Curators empowered to lock or edit taxon names
and to document deliberate deviations from the external reference.
([Taxon Frameworks](https://www.inaturalist.org/pages/taxon_frameworks),
[Update on Taxon Frameworks](https://www.inaturalist.org/blog/85698-update-on-taxon-frameworks))
POWO itself (Royal Botanic Gardens, Kew) held roughly 1.44 million
plant names as of March 2026 per Wikipedia, built on the World
Checklist of Vascular Plants (WCVP) — the same backbone that also
feeds GBIF's own checklist dataset, the Catalogue of Life, and World
Flora Online, meaning these nominally separate authorities are
converging rather than fully independent. Even so, four separate
"authoritative" global vascular-plant checklists exist (the Leipzig
Catalogue, WCVP, World Flora Online, and WorldPlants) and do not fully
agree with each other — a real reconciliation cost for any application
trying to be taxonomically rigorous about plants.
([POWO about](https://powo.science.kew.org/about),
[Wikipedia: POWO](https://en.wikipedia.org/wiki/Plants_of_the_World_Online),
[New Phytologist "big four" comparison](https://nph.onlinelibrary.wiley.com/doi/full/10.1111/nph.18961))

No comparably clean global taxonomy authority for fungi was surveyed
in the underlying research pass. This is a stated gap, not a finding —
the research explicitly did not investigate MycoBank, Index Fungorum,
or Species Fungorum, any of which would need direct investigation
before this note could describe a fungal-taxonomy backbone with the
same confidence as the POWO description above. This gap is preserved
here rather than papered over, since it directly affects how much
taxonomic rigor is achievable for mushroom identification specifically —
exactly the domain where the accuracy studies above show the CV field
performing worst.

## Sources

- https://www.inaturalist.org/blog/105731-new-computer-vision-model-v2-19-with-over-2-000-new-species
- https://forum.inaturalist.org/t/computer-vision-update-july-2021/24728
- https://github.com/inaturalist/model-files
- https://github.com/inaturalist/inatVisionAPI
- https://www.inaturalist.org/blog/84677-introducing-the-inaturalist-geomodel
- https://inaturalist.ala.org.au/posts/115290-cv-and-geomodel-predictions-visibility-identifiability-seasonality-apples-oranges
- https://www.inaturalist.org/blog/23075-real-time-computer-vision-predictions-in-seek-by-inaturalist-version-2-0
- https://docs.plantnet.org/en/tutorials/identify-a-plant/
- https://besjournals.onlinelibrary.wiley.com/doi/full/10.1002/pan3.10460
- https://identifythis.app/picture-this-app-review
- https://gardening.alibaba.com/tips/picturethis-wins-for-plant-id-accuracy-but-only-if-you-know-this
- https://floraincognita.com/
- https://floraincognita.com/blog/2024/10/24/study-on-identification-accuracy-flora-incognita-reaches-98-8/
- https://news.cornell.edu/stories/2022/04/merlin-bird-id-app-identifies-more-450-bird-species-sound
- https://academic.oup.com/condor/article/127/4/1/8222742
- https://pubmed.ncbi.nlm.nih.gov/37535032/
- https://www.tandfonline.com/doi/full/10.1080/15563650.2023.2237282
- https://www.tandfonline.com/doi/full/10.1080/24734306.2024.2377523
- https://pubmed.ncbi.nlm.nih.gov/36794335/
- https://www.citizen.org/article/mushroom-risk-ai-app-misinformation/
- https://www.mushroomtracker.ca/blog/ai-mushroom-identification-safe-2026.html
- https://www.mushroom-appreciation.com/the-hidden-dangers-of-relying-on-mushroom-identification-apps.html
- https://www.gbif.org/what-is-gbif
- https://www.gbif.org/terms
- https://www.gbif.org/data-use/6hL40kh9ikDXftobIM85KP/sampling-biases-shape-our-view-of-the-natural-world
- https://onlinelibrary.wiley.com/doi/10.1111/ddi.70205
- https://doi.org/10.3390/conservation6020040
- https://registry.opendata.aws/inaturalist-open-data/
- https://github.com/inaturalist/inaturalist-open-data
- https://forum.inaturalist.org/t/questions-re-use-of-inaturalist-data-in-research-gbif-exports-licenses-of-observations/21400
- https://www.inaturalist.org/pages/api+recommended+practices
- https://forum.inaturalist.org/t/is-this-use-of-inaturalist-content-a-breach-of-the-commercial-purpose-terms/9841
- https://www.inaturalist.org/pages/taxon_frameworks
- https://www.inaturalist.org/blog/85698-update-on-taxon-frameworks
- https://powo.science.kew.org/about
- https://en.wikipedia.org/wiki/Plants_of_the_World_Online
- https://nph.onlinelibrary.wiley.com/doi/full/10.1111/nph.18961

## Gaps

- No global fungal taxonomy authority (MycoBank, Index Fungorum,
  Species Fungorum) was surveyed — a real infrastructure gap for any
  application needing authoritative mushroom taxonomy comparable to
  POWO for plants.
- Primary full text of Hart et al. 2023 (*People and Nature*) and the
  2022 Australian mushroom-app comparison study (PubMed 36794335) was
  inaccessible (paywall/cookie wall); their figures are relayed only
  via secondary summaries.
- The 47-poisonings/4-deaths mushroom cluster since November 2025 is
  sourced to a single blog and was not cross-verified against a
  health department or news outlet.
- Merlin's photo-ID accuracy figures (92% common / 78% less-common
  species) come from a secondary comparison site, not a Cornell Lab
  primary publication.
- Neither iNaturalist's nor Merlin's exact current model architecture
  (e.g. CNN family vs. ViT) was identified in the underlying research —
  only training data scale and strategy were documented.
- PlantSnap's current ownership/status, Google Lens's plant/fungus
  accuracy specifically, and the BirdNET ecosystem were not
  investigated in the underlying research pass.
