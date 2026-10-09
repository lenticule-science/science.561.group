---
type: concept
class: process-control
depends-on: [layer]
realizes: []
title: In-situ monitoring
description: Sensing of the AM process during the build, intended to (a) detect defects as they form, (b) generate data for closed-loop process control, or (c) build a per-part digital pedigree usable for qualification.
---

# In-situ monitoring

Sensing of the AM process during the build, intended to (a) detect defects as they form, (b) generate data for closed-loop process control, or (c) build a per-part digital pedigree usable for [qualification](./predication-qualification-and-certification.md).

Surveyed comprehensively for metal AM by [Everton et al. (2016)](./predication-everton-et-al-2016.md). The polymer-AM literature is much sparser; commercial polymer printers ship with at most a webcam and a filament-runout sensor.

## Sensor modalities

| Modality | Process | Detects | Maturity (2026) |
|---|---|---|---|
| Co-axial photodiode pyrometry | LPBF, DED | Melt-pool temperature, cooling rate | Production (most LPBF systems) |
| Off-axis IR thermography | LPBF, FFF | Whole-layer thermal field | Mature in research, niche in production |
| High-speed visible camera | LPBF | Spatter, melt-pool dynamics | Research |
| Acoustic emission | LPBF, DED | Cracking, keyhole pores | Research |
| Layer-by-layer optical tomography | LPBF, MJF | Surface defects, recoater errors | Production (EOS, SLM) |
| Webcam timelapse | FFF | Spaghetti detection, layer shift | Production (Bambu, Prusa) |
| ML spaghetti detection (Obico, etc.) | FFF | Print failure | Production (open source) |

## What gets done with the data

1. **Operator alerts.** Automatic abort on detected catastrophic failure (spaghetti, recoater jam). Mature.
2. **Post-build defect mapping.** Per-layer images stitched into a 3D defect atlas, used to flag suspect parts for CT inspection. Production at GE Aviation, Pratt & Whitney.
3. **Closed-loop control.** Live feedback to laser power / scan speed / bed temperature based on detected anomalies. Demonstrated in lab (Renken et al. 2019, Druzgalski et al. 2020); not yet in production.
4. **Pedigree-based qualification.** Per-part digital record certifying that the process stayed inside its qualified envelope, in lieu of post-build NDE. The ambition; not accepted by any regulator yet. See [qualification-and-certification](./predication-qualification-and-certification.md).

## ML in in-situ monitoring

Deep-learning defect classification on in-situ data is a 2018– research wave (Scime & Beuth 2018, Snow et al. 2021, Kwon et al. 2020). Lab-benchmark accuracy >95%; the open problem is generalization across machines, materials, and part geometries — model trained on machine A on geometry G does not transfer to machine A' on geometry G'. The 2024–2026 research front is on physics-informed and self-supervised models that should generalize better.

**Polymer-AM frontier.** FFF in-situ monitoring is roughly where metal monitoring was in 2014. Open-source projects (Obico, OctoPrint, Crowsnest) have built the sensing infrastructure; the defect-classification literature is just starting (Brion & Pattinson 2022, Petsiuk & Pearce 2022).
