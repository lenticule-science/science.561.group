---
title: "Vent Light and Vent Photobiology"
description: "The measured photon budget of hydrothermal vents (ALISS spectra, the unexplained visible excess, the up-conversion controversy and its rebuttal) and the biology tuned to the faint glow - GSB1 with its hedges kept, the vent shrimp's dorsal eye, the vent crab's eye-shift, and the vent-origin-of-photosynthesis hypothesis - fenced from, but feeding, the dark-compass hypothesis's energy ladder."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-vent-light-and-vent-photobiology
authors:
  - claude-sonnet-5
  - claude-fable-5
keywords:
  - ecology
  - hydrothermal-vents
  - photobiology
  - green-sulfur-bacteria
  - rimicaris
  - photon-budget
  - photosynthesis
  - deep-sea
---


## 0. Scope note

This note is background for, and deliberately fenced off from, the [dark-compass hypothesis](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-dark-compass-hypothesis.md): everything here concerns photons and pigments, which that hypothesis explicitly does *not* run on.
Its service to that thread is one clean negative result (§2): the photon energy ladder at vents tops out well short of what magnetite photoemission needs, which is exactly why the [vent electricity note](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-vent-electricity.md) supplies the dark-compass hypothesis's electron source instead.
This note absorbs both the session's `vent-light` and `vent-photosynthesis` research sweeps and the photon-budget portion of `vent-photochemistry`; the [vent magnetization note](../../../../../../../../../../../earth-science-services-section/services/mineralogy-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-vent-magnetization-and-host-rock.md) covers the third energy channel this session mapped.
Its own content — vents glow, and things see the glow — stands on its own.

## 1. The measured glow

The ALISS instrument (Ambient Light Imaging and Spectral System — White, Chave, Reynolds & Van Dover, WHOI/Duke/Princeton) is a low-light digital camera with nine lenses, each covered by an individual bandpass filter of 50 or 100 nm nominal bandwidth, imaging an identical scene simultaneously across nine bands spanning 400–1000 nm.
It was deployed from submersibles at East Pacific Rise 9°N (the "Hole to Hell" site) and Juan de Fuca Ridge (White et al. 2002, *J. Geophys. Res.* 107(B1), doi:10.1029/2000JB000015), then extended to Mid-Atlantic Ridge sites Logatchev, Snake Pit, and Lucky Strike (White et al. 2002, *Geophys. Res. Lett.* 29, doi:10.1029/2002GL014977) — both citations and the deployment history confirmed against WHOI/AGU sources.

The bulk of the signal is thermal.
Black-smoker fluid at ~332–370 °C fits a blackbody at ~340 °C (± 10 °C) with emissivity ~0.3 (± 0.1) — versus ~0.9 for flange pools — confirmed against independent summaries of the primary paper, though the exact "332–370 °C measured range" phrase could not be pinned to precise primary text (paywalled) and is carried as plausible-and-consistent rather than independently nailed down.
By Wien's displacement law a 620–670 K (347–397 °C) blackbody peaks at roughly 4.3–4.7 µm, mid-infrared — standard physics, not a vent-specific result, and it is why thermal emission peaks in the infrared with only a tail into the visible.
Measured flux rises from ~10⁶ photons·cm⁻²·s⁻¹·sr⁻¹ at 700 nm (1.77 eV) to ~10⁸ at 750±50 nm at the orifice of a 370 °C smoker, to ~10¹⁰ at 1000 nm — confirmed via direct fetch of Beatty et al. 2005, *PNAS* 102:9306–9310, which quotes the 750 nm and 400–500 nm figures from White et al. verbatim; the 700 nm and 1000 nm figures are confirmed via search summary of the primary paper itself, not independently re-derived — falling to ~10⁴ at 400–500 nm.
None of this — thermal tail, chemiluminescent-type excess (below), or the disputed up-conversion mechanism (below) — reaches into the ultraviolet; all measured or proposed emission is confined to visible and near-infrared wavelengths (plausible: a synthesis claim rather than a single sourced statement, but every source found supports it and none found a UV component).

On top of the thermal tail sits the genuinely unexplained part: a temporally variable visible excess at 400–600 nm above thermal prediction, present at every site surveyed, attributed in candidate to chemiluminescence (sulfide oxidizing as vent fluid mixes with oxygenated seawater), crystalloluminescence (mineral crystallization at the hot-brine/cold-seawater interface), triboluminescence (crystal fracture), and vapor-bubble luminescence — mechanism unattributed to this day (confirmed, near-verbatim: White et al. attribute the excess to mechanisms "associated with turbulence, mixing and precipitation, such as vapor bubble luminescence, chemiluminescence, crystalloluminescence and triboluminescence," and state a mechanism "has yet to be determined unequivocally").
The excess's *magnitude* discrepancy across sources was resolved by a same-day primary-verification round that obtained and read both ALISS papers in full from the WHOI repository: the JGR abstract's own words are "orders of magnitude greater than predicted for a thermal source (i.e., on the order of 10⁴ rather than 10²–10³ photons cm⁻² s⁻¹ sr⁻¹)" — so the primary's "orders of magnitude" means one to two orders against the thermal prediction, which reconciles rather than contradicts Mullineaux & Duffy's more conservative gloss; the GRL Mid-Atlantic paper independently repeats both the emissivity-0.3 fit (Lucky Strike, 318 °C orifice fit to 300 °C) and the ~10⁴ short-wavelength figure in a different ocean basin.
One nuance the primary read adds: the estate's headline figures are per-vent fits, not universal constants — Table 1 spreads the 700–800 nm orifice flux from 1.6×10⁷ (L Vent) to 4.9×10⁸ (Dudley) photons·cm⁻²·s⁻¹·sr⁻¹, and the blackbody fits vary by vent (P Vent and Sully 340 °C/0.3; L Vent 295 °C/0.3; the Lobo and Dudley flanges 332 °C at emissivity 0.9; Beehive 265 °C/0.9) — read in full, both papers.

## 2. The one service to the spin thread

No measured or proposed vent emission reaches the ultraviolet: the brightest photons at a vent top out near 3 eV (400 nm), against the **~5.3–5.9 eV** needed to eject photoelectrons from magnetite — DFT work-function values of 5.78 eV (bulk-truncated B-termination) and 5.32 eV (modified B-termination) both fall within this range and agree with a measured 5.20 ± 0.15 eV, and ARUPS photoemission features at −5.0 and −6.5 eV binding energy independently corroborate the scale (Zalecki et al. 2006, confirmed).
"Citation corrected": the specific DFT figures are sometimes attributed to Pentcheva et al.'s Jahn-Teller paper (arXiv cond-mat/0501402), but a direct fetch of that text did not surface these work-function values — they appear instead in a separate, later Fe₃O₄(001)/(100) surface study combining STM, spin-polarized photoemission, and DFT, so treat the arXiv attribution as uncertain even though the physics (verdict: "plausible") holds.

That is a ≥2–4 eV shortfall between the brightest vent photons and magnetite's photoemission threshold.
Any photon-driven version of the published CISS symmetry-breaking route is therefore physically closed at vents — which is exactly why the [dark-compass hypothesis](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-dark-compass-hypothesis.md) runs on the vent's electron current instead.
This note's photons feed pigments, not spin chemistry — the rest of this note develops that pigment side, which is real and worth carrying in full even though it plays no role in the spin argument.

## 3. The photosynthesizer, hedges kept

GSB1 (Beatty et al. 2005, *PNAS* 102(26):9306–9310, "An obligately photosynthetic bacterial anaerobe from a deep-sea hydrothermal vent") is an obligately photosynthetic green sulfur bacterium, related to *Chlorobium*/*Prosthecochloris*, cultured from the plume of the TY black smoker (East Pacific Rise, 9°49.63′N, 104°17.37′W, 2,391 m) — coordinates, depth, site name, and species identity all confirmed by direct fetch of the paper's full text (PMC1166624).
Vent interior fluid runs ≈300 °C against ≈2 °C ambient water ("citation corrected": an earlier draft carried a "300–350 °C" range; the paper's actual language gives a single ≈300 °C figure, not a range).

Its only plausible in-situ light source is the vent's glow, and green sulfur bacteria are the right lineage for the job: chlorosome antennae built for extreme low light, kin to the Black Sea *Chlorobium phaeobacteroides* (strain BS-1/MN1) living on sunlight at 80 m depth — where it divides roughly every 2.8 years (Overmann et al. 1992, *Limnol. Oceanogr.* 37:150).
Within 1–2 cm of 332 °C flange pools, total photon flux over 600–1000 nm (~10¹¹ photons·cm⁻²·s⁻¹·sr⁻¹) was estimated to be of the same order of magnitude as solar photon availability for that Black Sea organism — read in full, quoted near-verbatim from the primary text.

The hedges belong in every retelling, and they are the paper's own: GSB1 was isolated from plume water 50 cm above the vent orifice, never directly observed photosynthesizing in situ, and required a lab growth irradiance of 100 µmol photons·m⁻²·s⁻¹ (initial enrichment at ~10 µmol) — roughly 100× more light than the estimated in-situ supply.
The authors' own words, quoted directly from the primary text: GSB1 "may be thought of as eking out an existence by infrequent harvesting of rare geothermal photons."
For scale against oxygenic photosynthesis specifically: the minimum photon flux to support it, per arctic-algae studies, runs ~2.4×10¹² photons·cm⁻²·s⁻¹ — read in full, quoted directly from Mullineaux & Duffy 2025 — against which the measured non-thermal vent visible excess (~10⁴ photons·cm⁻²·s⁻¹·sr⁻¹ at 400–600 nm) is "over 20 million times too weak."
GSB1 is an existence proof that vent-adapted photosynthetic machinery reaches the vents, and a proof-of-principle that faint non-solar photon fields are biologically actionable — not a demonstrated in-place geothermal ecosystem, and nowhere close to sufficient for oxygenic photosynthesis.

## 4. The up-conversion controversy, in full

A live 2025 dispute in *National Science Review* rehearses the estate's dark-compass question almost exactly, but for oxygenic photosynthesis rather than spin selectivity, and it is worth carrying with its full numbers rather than a gloss.

Li et al. (June 2025, 12(6):nwaf219) proposed that nonlinear second-harmonic generation in sulfide minerals — especially chalcopyrite — up-converts geothermal infrared (roughly 800–1500 nm) into visible light (420–725 nm, chalcopyrite peaking ~471 nm), with a claimed flux of ~6.6×10⁶ photons·cm⁻²·s⁻¹·sr⁻¹ (400–550 nm) against a blackbody baseline of ~10³ at 400 °C — three orders of magnitude above blackbody.
Up-conversion efficiency was reported at ~10⁻⁸ unpressurized, rising ~66-fold to ~10⁻⁷ under diamond-anvil-cell pressure.
The cyanobacterium *Synechococcus* sp. PCC 7002 exposed to 1064 nm infrared on chalcopyrite (producing 532 nm second-harmonic output) showed fluorescence at 656/685 nm, offered as consistent with up-converted light being absorbed by phycobilisomes and transferred to photosystem II; a metagenomic survey of 142 datasets found complete photosynthetic gene sets in 10 of 27 high-temperature (>350 °C) chalcopyrite-rich vent samples — all figures read in full via direct fetch of the primary text (PMC12202869), all confirmed.

Mullineaux & Duffy's rebuttal (2025, *National Science Review* 12(9):nwaf291 — read in full via direct fetch, PMC12395954) calculates that under realistic (non-diamond-anvil-cell) vent radiance (~10¹¹–10¹² photons·cm⁻²·s⁻¹·sr⁻¹ over 600–1000 nm), the claimed up-conversion efficiency of ~10⁻²⁹ yields only about **1 photon per cm² every 30 years**; even applying the claimed pressure enhancement (~10⁷), the resulting flux (~10⁻⁹ photons·cm⁻²·s⁻¹) is roughly "2 billion trillion times" (~2×10²¹-fold) below the minimum flux known to support oxygenic photosynthesis — every figure confirmed verbatim against the primary text.
Li et al. published a reply defending the mechanism (nwaf292, published online 21 July 2025) — "citation corrected": an earlier draft had labeled nwaf292 as the *source* of the original proposal, when nwaf292 is in fact Li et al.'s reply to the rebuttal, published *after* Mullineaux & Duffy's nwaf291; the original proposal is nwaf219 (§ above).
The dispute over whether mineral up-conversion is real and biologically relevant at vents is unresolved as of August 2025 — the estate cites it as open, not either side as settled.
Even if Li et al.'s mechanism holds at its own claimed (unpressurized, non-realistic) figures, it still falls roughly 2× short of magnetite's photoemission threshold from §2 — the up-conversion dispute, however it resolves, does not reopen the photon-driven CISS question.

## 5. The eyes that watch the glow

*Rimicaris exoculata* — the "eyeless" vent shrimp, swarming on Mid-Atlantic chimneys — carries a dorsal organ (Van Dover, Szuts, Chamberlain & Cann 1989, *Nature* 337:458–460) with no imaging optics: ~7,000 rhabdomeral units forming a photosensitive layer with entrance aperture >26 mm² and rhabdom volume density >70% (confirmed; the morphology detail is more precisely attributed to O'Neill, Jinks, Herzog, Battelle, Kass, Renninger & Chamberlain, a genuine follow-up study, rather than to "Pelli & Chamberlain" as an earlier draft had it — that 1989 companion *Nature* paper concerns blackbody-radiation visibility, not rhabdom morphology).
It is rhodopsin-based, an instrument built purely for sensitivity, hypothesized to detect vent glow for navigation and thermal avoidance.

The story is genuinely complicated now: opsin work in the sibling species *R. hybisae* shows blue-green tuning (six opsins, 457–517 nm) rather than tuning toward the red/infrared tail where thermal glow is strongest — which, note, is the band of the *unexplained* §1 excess rather than the blackbody tail, an alignment the literature has not resolved and this note does not overclaim.

The vent crab *Bythograea thermydron* adds an ontogenetic version (Jinks et al. 2002, *Nature* 420:68–70): imaging, blue-tuned larval eyes (λmax ≈ 447 nm) shift through a postlarval stage (≈479 nm) to non-imaging, red-shifted adult photoreceptors (≈489 nm) as it descends from sunlit water into the dark.
For the estate's bestiary it is enough that the real referent of [SHRIMP](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/sponge-holonomy-repair-inference-model-player.md)'s world includes animals carrying purpose-built instruments for reading the [VENT](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/vacuous-entanglement-normalizing-topos.md)'s faint light — witness organs for a glow at the edge of detectability.

## 6. The minority hypothesis worth keeping

Nisbet, Cann & Van Dover ("Origins of photosynthesis," 1995, *Nature* 373:479–480) propose that photosynthesis itself originated at vents, elaborated by Martin, Bryant & Beatty (2018, *FEMS Microbiol. Rev.* 42:205–231 — GSB1's own discoverer among the authors, read in full via direct fetch): continuous, UV-free geothermal light as the training ground for early photochemistry, argued to solve photo-oxidative-damage and reductant-availability problems the surface-sunlight-origin model does not.
The paper's own framing, quoted directly: vent light is "free of UV photons," and the authors explicitly position the proposal as a departure from the field's default assumption that photosynthesis's origin means "harnessing sunlight at the Earth's surface."
Not consensus; taken seriously by serious people; recorded as such.
If it holds, the estate's two-ecologies split gains a genealogy — phototrophy not as the sun's separate invention but as a vent skill that later walked upstairs into the light.

## Sources and records

This note draws on the `vent-light`, `vent-photosynthesis`, and (for §2's photon-energy-ladder material) `vent-photochemistry` research sweeps, and their matched verification verdicts, in [workflow-2-vent-dark-compass-research.json](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/workflow-2-vent-dark-compass-research.json), indexed in the [session's records README](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/README.md).
Three citation corrections surfaced in verification are carried above rather than smoothed over: GSB1's vent-interior temperature (a range narrowed to the paper's actual single figure), the Rimicaris morphology attribution, and the nwaf292/nwaf219 mislabeling in the up-conversion dispute's citation chain.
