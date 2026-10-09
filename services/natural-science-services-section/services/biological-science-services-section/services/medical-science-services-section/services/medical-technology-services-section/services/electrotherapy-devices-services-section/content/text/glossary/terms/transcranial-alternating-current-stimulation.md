---
identity: transcranial-alternating-current-stimulation
name: "Transcranial Alternating Current Stimulation"
description: "Weak sinusoidal current at a chosen frequency through scalp electrodes, intended to entrain brain oscillations of that frequency."
aliases:
  - "tACS"
relations:
  subtype-of: "transcranial-electrical-stimulation"
  acts-on: "neural-oscillation"
references:
  herrmann2013:
    authors:
      - "Christoph S. Herrmann"
      - "Stefan Rach"
      - "Toralf Neuling"
      - "Daniel Strüber"
    title: "Transcranial alternating current stimulation: a review of the underlying mechanisms and modulation of cognitive processes"
    year: 2013
    publication: "Frontiers in Human Neuroscience"
    volume: "7"
    pages: "279"
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
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Transcranial alternating current stimulation (tACS) delivers a weak sinusoidal [alternating current](../../../../../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/alternating-current.md), typically 1–2 mA peak to peak, at a frequency matched to a brain rhythm: [alpha](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/alpha-rhythm.md) at 10 Hz, gamma at 40 Hz, and so on. The aim is [entrainment](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/neural-entrainment.md). A rhythmic field too weak to fire neurons can still pull the timing of an ongoing [oscillation](../../../../../../../../../neuroscience-services-section/content/text/glossary/terms/neural-oscillation.md) toward the stimulation frequency, and so, in principle, change the functions that oscillation supports [@herrmann2013].

The debate is whether enough field reaches the cortex. Direct recordings suggest scalp tACS at common intensities produces fields near the lower limit of what affects neurons. Some reported effects may instead come from rhythmic stimulation of nerves in the scalp or of the retina, which is sensed as flicker [@voroslakos2018]. Careful studies now control for these routes.
