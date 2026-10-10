---
name: 2026-10-10-note-on-minnesota-adult-use-home-cultivation
title: "Minnesota adult-use home cultivation: what a household may grow, hold, give and buy"
description: "The Minnesota law a lawful eight-plant indoor home grow is governed by, read from the statutes as published by the Revisor on 2026-10-10: plant and flowering limits, the enclosed-locked-space and primary-residence conditions, possession and gifting limits, penalties, and the lawful sources of seeds and immature plants. The legal knowledge behind minnesota.indoor.cannabis.grow.assist.561.group and the indoor-grow controller's compliance governor."
date-created: 2026-10-10
date-modified: 2026-10-10
research-as-of: 2026-10-10
type: notes
status: research-with-open-questions
authors: [lenticule-science-senior]
keywords: [minnesota, cannabis, home-cultivation, possession, gifting, office-of-cannabis-management, chapter-342]
utterances:
  - "ni:///sha-256;iOEf1dsqSmKb_UpuMDTvvhHBO52eH5FtabD-CdpaJJM"
  - "ni:///sha-256;SLpSoW24KtQJDgl1_JbrBR4XqYRi54wsMI0atQR9_CI"
  - "leader message 2026-10-10T01:08Z, quoted in the grow-assist brief of 2026-10-09-leader-words-pass-order.md"
references:
  mn_342_09:
    authors: [Minnesota Office of the Revisor of Statutes]
    title: "Minn. Stat. § 342.09, Personal adult use of cannabis (2025 Minnesota Statutes; subd. 1 last amended 2024, subd. 2 last amended 2025; a 2026 amendment to subd. 3 noted on the page)"
    url: https://www.revisor.mn.gov/statutes/cite/342.09
    accessed: 2026-10-10
  mn_152_0265:
    authors: [Minnesota Office of the Revisor of Statutes]
    title: "Minn. Stat. § 152.0265, Cannabis cultivation crimes (2025 Minnesota Statutes)"
    url: https://www.revisor.mn.gov/statutes/cite/152.0265
    accessed: 2026-10-10
  mn_9810:
    authors: [Minnesota Office of Cannabis Management]
    title: "Minn. R. ch. 9810 (adult-use cannabis rules; definitions of immature plant and seedling)"
    url: https://www.revisor.mn.gov/rules/9810/full
    accessed: 2026-10-10
  mda_seed:
    authors: [Minnesota Department of Agriculture]
    title: "Cannabis seed program"
    url: https://www.mda.state.mn.us/cannabis-seed
    accessed: 2026-10-10
---

# Minnesota adult-use home cultivation

## The law a home grow is governed by

Minnesota legalized adult-use cannabis in 2023 (Laws 2023, chapter 63, creating Minn. Stat. chapter 342). An individual 21 years of age or older may grow cannabis at home without a cultivation license. As published by the Revisor on 2026-10-10 (2025 Minnesota Statutes), Minn. Stat. § 342.09 states:

- **Plants (subd. 2).** Up to eight cannabis plants, with no more than four being mature, flowering plants, may be grown at a single residence without a license.
- **Where (subd. 2).** Cultivation takes place at the primary residence of an individual 21 years of age or older, in an enclosed, locked space that is not open to public view. The limit is per residence, not per adult: two adults in one home share eight plants.
- **Caregivers (subd. 2).** A registered designated caregiver may cultivate up to eight additional plants for not more than one patient household; of the 16 or fewer plants in the caregiver's residence, no more than eight may be mature, flowering plants.
- **Possession (subd. 1).** An adult may possess two pounds (907 g) or less of adult-use cannabis flower in their private residence, and possess or transport two ounces (56.7 g) or less in a public place.
- **Gifting (subd. 1).** An adult may give, for no remuneration, to an individual at least 21 years of age, two ounces or less of flower or eight grams or less of concentrate. Giving to anyone under 21, and giving as a sample or promotional gift in commerce, is not permitted. Sale of home-grown cannabis requires a license; a household grow may not sell.
- **Use (subd. 1).** Use is permitted in a private residence including its curtilage or yard, and on private property not generally accessible to the public unless the owner prohibits it.
- **Penalty for excess plants (subd. 6(e)).** The Office of Cannabis Management may assess a civil penalty of up to $500 for each plant grown in excess of the limit without a license.

Criminal cultivation thresholds are in Minn. Stat. § 152.0265: cultivating more than 16 but not more than 23 plants is cultivation in the second degree (up to 364 days and $3,000); more than 23 plants is cultivation in the first degree (up to five years and $10,000).

## Lawful sources of genetics and flower

A licensed retailer, or a business with a retail endorsement, may sell immature plants and seedlings to buyers 21 and older, sourced from a licensed business and labeled. The Office of Cannabis Management's rules (Minn. R. ch. 9810) define an immature cannabis plant to include clones, cuttings, seedlings and mother plants, and a seedling as a germinated seed with no flowers and no more than eight inches tall. The Minnesota Department of Agriculture separates cannabis seed from hemp seed: seed that produces cannabis plants may not be labeled or sold as hemp seed. Tribal nations operate dispensaries under their own sovereignty (for example Waabigwan Mashkiki of the White Earth Nation and NativeCare of the Red Lake Nation). The Group's list of observed sources and platform terms, as of 2026-10-07, is the botany record `2026-10-10-minnesota-cannabis-sourcing.json`.

Federal law still classifies marijuana as a controlled substance; Minnesota's permissions do not change federal law, and a grow crosses no state line. The federal rescheduling and farm-bill hemp changes discussed for late 2026 are the subject of the requirement `farm-bill-and-cannabis-change-prediction-market-survey`.

## What this means for the grow's machinery

The law is a governor over every plan of the grow, held as data so that the same controller serves another jurisdiction by another record:

- a start (seed, clone, cutting) is refused when it would make more than eight living plants;
- a flip to flowering is refused when it would make more than four mature, flowering plants;
- cultivation actuation (lights, irrigation, dosing) waits on a recorded attestation that the plants are in an enclosed, locked space not open to public view, at the primary residence;
- a harvest is refused, and a start or flip is delayed, when projected flower at the residence would exceed 907 g;
- a gift is refused above 56.7 g of flower or 8 g of concentrate, to anyone under 21, or for remuneration.

Each refusal carries the statute and subdivision that sets it. This was implemented in `minnesota-governor.mjs` of computer-services-section#49 (limits 8, 4, 907 g; statutes subd. 1 and subd. 2), and is carried as requirements on the indoor-grow controller.

## Open questions

- Whether a city or county may restrict home cultivation beyond § 342.09 (for example by lease, zoning or nuisance rules); Minn. Stat. § 342.13 (local control) was not read in this pass.
- Whether the 2026 amendment to § 342.09 subd. 3 bears on home cultivation; the subdivision text was not read in this pass.
- How "mature, flowering" is defined for counting: the house counts a plant as flowering from its photoperiod flip, which is conservative; the statutory or rule definition was not located.
- The current cannabis gross-receipts tax rate on retail purchases; #49's finder states 15 % plus 6.875 % state sales tax plus local tax, unverified here.
- Whether a renter's lease can lawfully prohibit home cultivation in Minnesota.
