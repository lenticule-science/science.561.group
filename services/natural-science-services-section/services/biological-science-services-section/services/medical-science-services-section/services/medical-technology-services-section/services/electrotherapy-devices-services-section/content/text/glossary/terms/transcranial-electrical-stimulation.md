---
identity: transcranial-electrical-stimulation
name: "Transcranial Electrical Stimulation"
description: "Weak current (about 0.5–4 mA) applied through scalp or head electrodes to shift brain excitability or rhythms without firing neurons directly; the family that includes tDCS, tACS and cranial electrotherapy."
aliases:
  - "tES"
  - "transcranial current stimulation"
  - "low-intensity transcranial electrical stimulation"
relations:
  subtype-of: "neuromodulation"
  contains:
    - "transcranial-direct-current-stimulation"
    - "transcranial-alternating-current-stimulation"
    - "cranial-electrotherapy-stimulation"
references:
  bikson2016:
    authors:
      - "Marom Bikson"
      - "Pnina Grossman"
      - "Chris Thomas"
      - "Adantchede Louis Zannou"
      - "Jimmy Jiang"
      - "Tatheer Adnan"
      - "Antonios P. Mourdoukoutas"
      - "Greg Kronberg"
      - "Dennis Truong"
      - "Paulo Boggio"
      - "André R. Brunoni"
      - "Leigh Charvet"
      - "Felipe Fregni"
      - "Brita Fritsch"
      - "Bernadette Gillick"
      - "Roy H. Hamilton"
      - "Benjamin M. Hampstead"
      - "Ryan Jankord"
      - "Adam Kirton"
      - "Helena Knotkova"
      - "David Liebetanz"
      - "Anli Liu"
      - "Colleen Loo"
      - "Michael A. Nitsche"
      - "Janine Reis"
      - "Jessica D. Richardson"
      - "Alexander Rotenberg"
      - "Peter E. Turkeltaub"
      - "Adam J. Woods"
    title: "Safety of transcranial direct current stimulation: evidence based update 2016"
    year: 2016
    publication: "Brain Stimulation"
    volume: "9"
    issue: "5"
    pages: "641-661"
  voroslakos2018:
    authors:
      - "Mihály Vöröslakos"
      - "Yuichi Takeuchi"
      - "Kitti Brinyiczki"
      - "Tamás Zombori"
      - "Azahara Oliva"
      - "Antonio Fernández-Ruiz"
      - "Gábor Kozák"
      - "Zsolt Kincses"
      - "Béla Iványi"
      - "György Buzsáki"
      - "Antal Berényi"
    title: "Direct effects of transcranial electric stimulation on brain circuits in rats and humans"
    year: 2018
    publication: "Nature Communications"
    volume: "9"
    pages: "483"
  datta2013:
    authors:
      - "Abhishek Datta"
      - "Jacek P. Dmochowski"
      - "Berkan Guleyupoglu"
      - "Marom Bikson"
      - "Felipe Fregni"
    title: "Cranial electrotherapy stimulation and transcranial pulsed current stimulation: a computer based high-resolution modeling study"
    year: 2013
    publication: "NeuroImage"
    volume: "65"
    pages: "280-287"
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Transcranial electrical stimulation (tES) passes a weak [current](../../../../../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/electric-current.md), usually 0.5–4 mA, between electrodes on the head. Some of that current crosses the skull and sets up a small [electric field](../../../../../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/electric-field.md) in the brain. Such fields are far too weak to fire neurons outright. They shift [membrane potentials](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/membrane-potential.md) by fractions of a millivolt, which can bias [excitability](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/neuronal-excitability.md) or the timing of [oscillations](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/neural-oscillation.md) [@bikson2016].

The family is named by waveform:
- **[tDCS](transcranial-direct-current-stimulation.md):** constant direct current.
- **[tACS](transcranial-alternating-current-stimulation.md):** sinusoidal alternating current at a chosen frequency.
- **Random-noise stimulation (tRNS):** current that fluctuates randomly across a band of frequencies.
- **Pulsed stimulation:** trains of pulses, the waveform most [cranial electrotherapy stimulation](cranial-electrotherapy-stimulation.md) devices use through ear or temple electrodes [@datta2013].

The central scientific question is dose. Measurements show most applied current is shunted through the scalp. At common intensities the brain field is a fraction of a volt per metre, near or below what reliably affects neurons [@voroslakos2018]. Effects may therefore depend on electrode placement, on the brain's own state, and on repeated sessions, which is part of why results vary so much between studies. The methods are generally safe at these intensities [@bikson2016].
