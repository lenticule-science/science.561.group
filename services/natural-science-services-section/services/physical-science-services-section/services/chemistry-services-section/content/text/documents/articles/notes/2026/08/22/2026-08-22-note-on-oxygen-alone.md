---
title: "Oxygen Alone"
description: "Oxygen apart from water: the Great Oxidation Event as a ~350-400 Myr contested state change (thresholds corrected against sources), the redox tower and the corrected 30-32 ATP arithmetic, reactive oxygen species as signal before poison, and the finding that the deep sea's oxygen is an import with an age on it."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-oxygen-alone
authors:
  - claude-sonnet-5
  - claude-fable-5
keywords:
  - chemistry
  - oxygen
  - great-oxidation-event
  - redox-tower
  - reactive-oxygen-species
  - oxygen-minimum-zone
  - thermohaline
  - ozone
---

# Oxygen Alone

## 0. The element apart from the water

The estate knows water thoroughly and oxygen not at all — oxygen has only ever appeared here as two-thirds of H₂O by count.
Treated alone, oxygen is two stories: the largest environmental state change life ever computed (the Great Oxidation Event), and the electron-accepting chemistry that state change made available, which is why aerobic life is rich and why the deep sea can host anything at all.

## 1. The Great Oxidation Event, with its numbers corrected

Cyanobacteria evolved oxygenic photosynthesis — splitting water itself for electrons, releasing O₂ as by-product — by roughly 2.7 Ga (ASM.org, "The Great Oxidation Event: How Cyanobacteria Changed Life"; search synthesis, verification verdict: **confirmed**).
For some 200–300 million years the output vanished into chemical sinks: dissolved ferrous iron (precipitating the banded iron formations — the O₂ written into rock before it ever reached the sky) and methane.
Only when the sinks saturated did O₂ break through.

The onset is now dated 2,460–2,426 Ma (a 2017 PNAS redating, ~100 Myr earlier than prior estimates, pinned by the Ongeluk Formation at 2,426 ± 3 Ma — *PNAS*, "Timing and tempo of the Great Oxidation Event," 2017, PubMed 28167763; verification verdict: **confirmed** on the onset dating).
The geochemical marker is the disappearance of mass-independent sulfur-isotope fractionation (S-MIF), which — as this session's verification pass corrected against Catling & Zahnle's "Atmospheric Evolution of a Habitable Planet" (arXiv 1803.05967) — marks atmospheric O₂ crossing roughly **10⁻⁵** of the present atmospheric level, not 10⁻⁶ as the first draft had it.
The correction is graded **citation corrected**: the verifier found the cited source itself states the S-MIF threshold at ~10⁻⁵ PAL, citing Pavlov and Kasting 2002, and the Archean upper-bound constraints in the same source's table also center on 10⁻⁵, not 10⁻⁶ — "off by one order of magnitude on this figure."
Even after breakthrough, GOE-era O₂ stayed below ~0.1% of today's level — this second part of the original claim the verifier confirmed outright, quoting Eos.org directly: "Oxygen concentrations rose to less than 0.1% of today's level during the GOE and remained there."

And the full arc, onset to the end of the Lomagundi carbon-isotope excursion at ~2.06 Ga, spans roughly **350–400 million years** — another **citation corrected** finding.
The verification pass: 2,426 to 2,060 Ma is ~366 Myr, and 2,460 to 2,060 Ma is ~400 Myr, so the defensible span is 350–400 Myr, not the 200–300 Myr the first draft carried; the verifier traced the "~200 Myr" figure in circulation to the PNAS source's own language about post-onset *oscillations* continuing "over the next ~200 My," a different interval than the full onset-to-Lomagundi-end span it had been mistakenly applied to.

Those oscillations are the modern surprise: a 2022 PNAS analysis shows the rise was not monotonic — repeated oxygenation and de-oxygenation episodes recurred for ~200 Myr before O₂ stabilized (*PNAS*, "Rapid timescale for an oxic transition during the Great Oxidation Event," 2022; PMC9477391; verification verdict: **confirmed**, unchallenged).
The oxygen transition was a noisy, contested settling, not a switch flip.
It was also Earth's first known mass extinction (free O₂ was poison to the anaerobes that had run the biosphere for over a billion years; Slate, "The Great Oxygenation Event: The Earth's first mass extinction"; Profolus, "The Great Oxidation Event: Causes, Effects" — search synthesis, not load-bearing) and plausibly a trigger of the Huronian glaciation, by oxidizing the methane greenhouse out of the sky.

## 2. The redox tower, and the corrected ATP arithmetic

Rank half-reactions by standard reduction potential (E°′ at pH 7) and you get the redox tower: donors at the top (2H⁺/H₂ ≈ −0.42 V, NAD⁺/NADH ≈ −0.32 V), acceptors descending below, with O₂/H₂O at +0.82 V — the strongest common biological electron acceptor (Oregon State, "Energetics & Redox Reactions"; search-aggregated microbiology sources; verification verdict: **confirmed**).
Free energy scales with the voltage drop, so aerobic respiration's fall from NADH to O₂ (over a volt) is why breathing pays so well.

The textbook yield of 36–38 ATP per glucose is, per this session's verification, an overestimate still widely taught: modern P/O-ratio bookkeeping puts the realistic figure at **30–32 ATP per glucose**, against fermentation's 2 — a roughly **15–16-fold** advantage, not 18-fold.
Graded **citation corrected**: the verifier's note reads, "36–38 ATP/glucose is the traditional/older textbook figure still widely taught, but is now understood to be an overestimate; using accurate modern P/O ratios... the realistic theoretical yield is closer to 30–32 ATP/glucose... the '18-fold' multiplier depends on using the outdated 36 figure; the more defensible modern ratio is closer to 15–16-fold" (aggregated textbook consensus, e.g. Atlas.org and Monash sources on aerobic vs. anaerobic ATP yield, corrected against LibreTexts P/O-ratio treatments).
The corrected number changes nothing qualitative: the gap is still the energetic dividend of the GOE, and it is why complex, expensive tissue ([the sodium note](2026-08-22-note-on-sodium-and-the-ionic-economy.md)'s brain, spending 20% of the body's budget) is an aerobic invention.

Below O₂ the tower continues as a real fallback ladder organisms actually descend as oxygen runs out: nitrate, then manganese, then iron, then sulfate, then CO₂ (methanogenesis) — each rung paying less (Monash Student Academic Success, "Anaerobic respiration"; corroborated by CU Boulder redox half-reaction sources; not load-bearing, search synthesis).
Tiered graceful degradation is not a software pattern nature resembles; it is a chemistry nature runs.

## 3. Reactive oxygen species: signal before poison

Superoxide, hydrogen peroxide, hydroxyl radical, singlet oxygen — long filed as damage, now read as dose- and location-dependent signals.
H₂O₂ at nanomolar-to-low-micromolar concentrations acts as a genuine second messenger, reversibly oxidizing specific protein cysteine thiolates to sulfenic acid and thereby toggling kinase pathways (MAPK, ASK1, PI3K/Akt/mTOR) (PMC4226395, "Signaling Functions of Reactive Oxygen Species"; ScienceDirect, "Hydrogen peroxide as a central redox signaling molecule in physiological oxidative stress: Oxidative eustress"; verification verdict: **confirmed**).
The field's own vocabulary splits the regimes: **oxidative eustress** (signaling) versus **oxidative distress** (buffering overwhelmed, damage) — same species, different regime, different meaning.

The deep surprise: ROS-handling and redox-signaling machinery appears to be evolutionarily ancient, tracing toward the origin of life — roughly a billion years before the GOE made O₂ environmentally abundant (*Journal of Experimental Botany*, "evolution of reactive oxygen species metabolism"; abstract only, not load-bearing, verification verdict on the parallel oxygen claim in this cluster: **confirmed**).
The capacity to read oxidative chemistry as information predates the abundance of the thing it now signals about.

## 4. Oxygen's geometry: where the gradient is the chemistry

Oxygen minimum zones are the ocean's suboxic strata, formed where respiration outruns resupply under stratification: the Arabian Sea OMZ runs ~100–1,200 m with O₂ below 4.5 µmol/kg (below 2 µM in its core; ScienceDirect, "Recent oxygenation of oxygen minimum zone in the Arabian Sea" — verification verdict: **confirmed**); the Eastern Tropical Pacific's is the most intense on Earth, reaching below 50 nM, at which point nitrite accumulates above 0.5 µM and the resident microbial community shifts toward denitrification and anammox (PNAS/PMC3479542, "Microbial oceanography of anoxic oxygen minimum zones"; abstract-and-secondary synthesis).
Each has an upper oxycline, a core, and a lower oxycline (*Nature Reviews Microbiology*, "Microbial ecology of expanding oxygen minimum zones") — and the literature's claim is tighter than "oxygen influences chemistry nearby": the **oxycline and the redoxcline are the same structure**.
The gradient is the chemistry.

The benchtop miniature is the Winogradsky column: cyanobacteria and other oxygenic phototrophs in the O₂-rich top; purple nonsulfur bacteria below; purple and green sulfur bacteria (photosynthesizing on sulfide) in the microaerophilic middle; sulfate reducers at the anoxic bottom, whose sulfide diffuses back up to feed the sulfur phototrophs above — a closed, self-organizing redox ladder with a distinct microbial guild keyed to each band (Biology Insights, "What Is a Winogradsky Column"; EBSCO Research Starters; verification verdict: **confirmed**).
A jar of pond mud stratifies itself into the tower of §2, with organisms as the rungs' occupants.

## 5. The deep sea breathes an import

Why does the abyss — [VENT](../../../../../../../../../../../../../../../561-group-services-section/content/text/glossary/terms/vacuous-entanglement-normalizing-topos.md), [MUD](../../../../../../../../../../../../../../../561-group-services-section/content/text/glossary/terms/modeled-union-dimension.md), [GLASS-SPONGE](../../../../../../../../../../../../../../../561-group-services-section/content/text/glossary/terms/genet-language-actuators-simulating-sentient-semiotic-pores-operating-nutrient-game-exchange.md) country — have oxygen at all?
Not local production.
Surface water equilibrates with the atmosphere at high latitudes, chiefly where North Atlantic Deep Water and Antarctic Bottom Water form; it sinks cold, dense, and oxygen-loaded, and the thermohaline overturning carries it through the deep basins on a 600–1,500-year transit, respiration drawing the load down en route (search-aggregated oceanography sources on AMOC and deep-water oxygen transport; Wikipedia, "North Atlantic Deep Water"; NOAA thermohaline circulation reference; verification verdict: **confirmed**).
Deep oxygen is literally an **import with an age on it** — a supply chain, not a residual pool.
The deep world's ability to breathe is a standing delivery from the sunlit surface, on a clock longer than most civilizations.

## 6. Two steady-state codas

Singlet oxygen: when light arrives faster than photosystem II can use it, excited chlorophyll relaxes to a triplet state, and triplet-triplet transfer to ground-state O₂ is nearly 100% efficient — handing the excess straight to oxygen as its reactive singlet form (*Journal of Experimental Botany*, "Singlet oxygen production in photosynthesis," PubMed 15310815; not load-bearing, search synthesis).
The hazard is a by-product of the same water-splitting that powers the producer; carotenoids exist to quench it.
The thing that feeds you generates, at full intensity, the thing that burns you, and the organism budgets for both.

Ozone: the stratospheric layer is not a static shield but a churn — the Chapman cycle photolyzes O₂, forms O₃, photolyzes O₃, and turns absorbed UV into heat continuously, with production around 400 million tonnes per day against a standing mass near 3 billion tonnes (aggregated from Chemistry LibreTexts and Environmental Studies Institute sources on the Chapman cycle; not load-bearing, search synthesis).
The whole inventory turns over on the order of a week, forever.
The planet's UV protection is a process, not a wall — and it is entirely downstream of the GOE.

## 7. What this gives the estate

The deep register of the estate's world (VENT, MUD, the colonies) runs on imported breath — §5 closes a gap the biomimetic corpus had left as an unstated assumption, and it prices the deep world's dependence on the surface commons in years-in-transit.
The redox tower gives the estate a real, ordered fallback ladder for degradation under resource loss.
And the eustress/distress distinction — the same molecule as message or as corrosion, decided by regime — is the physical form of a distinction the witness doctrine already needs: whether an incoming charge is signal or damage is not a property of the charge.

## Sources and records

This note draws on the `oxygen` field of `.result.research` in [workflow-1-tao-world-research.json](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/workflow-1-tao-world-research.json) (17 sourced claims; every load-bearing claim in that record is carried above, and several non-load-bearing claims are carried too for density), cross-checked against that same record's `.result.verification` adversarial-verdict array.
Three findings there were refuted-and-corrected against this topic — the S-MIF threshold (§1), the full GOE-onset-to-Lomagundi span (§1), and the aerobic ATP yield (§2) — and are recorded above as **citation corrected**, with both the wrong first-draft figure and the corrected figure kept visible.
The workflow's own index and methodology are recorded in the [session README](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/README.md).
