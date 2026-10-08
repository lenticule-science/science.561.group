---
identity: alternating-current
name: "Alternating Current"
description: "Current that reverses direction periodically, described by its frequency, amplitude and waveform (sine, square, pulsed, biphasic)."
aliases:
  - "AC"
  - "biphasic current"
  - "waveform"
  - "pulsed current"
relations:
  subtype-of: "electric-current"
references:
  halliday2013:
    authors:
      - "David Halliday"
      - "Robert Resnick"
      - "Jearl Walker"
    title: "Fundamentals of Physics"
    year: 2013
    publisher: "Wiley"
    edition: "10"
  grimnes2015:
    authors:
      - "Sverre Grimnes"
      - "Ørjan G. Martinsen"
    title: "Bioimpedance and Bioelectricity Basics"
    year: 2015
    publisher: "Academic Press"
    edition: "3"
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Alternating current (AC) is [current](electric-current.md) that reverses direction periodically [@halliday2013]. Three properties describe it:
- **Frequency:** how many cycles it completes per second, in hertz (Hz).
- **Amplitude:** its peak strength.
- **Waveform:** the shape of each cycle, such as a smooth sine, a square wave, or brief rectangular pulses separated by rest.

In stimulation, a *biphasic* waveform has each pulse followed by one of opposite polarity, so the net charge delivered over a cycle is zero. That matters for safety. Net charge flowing through one electrode drives electrochemical reactions at the skin that can irritate or burn, and balancing the charge prevents that [@grimnes2015]. Pulse width, typically tens to hundreds of microseconds, and the frequency together set how much charge each pulse carries.

Frequency also changes how current moves through tissue. Because cell membranes behave as capacitors, [impedance](electrical-impedance.md) falls as frequency rises. Frequency also determines what current can do to neurons: a slow alternating field can nudge the timing of [brain rhythms](../../../../../../../biological-science-services-section/services/neuroscience-services-section/content/text/glossary/terms/neural-oscillation.md) at the same frequency, which is the idea behind [tACS](../../../../../../../biological-science-services-section/services/medical-science-services-section/services/medical-technology-services-section/services/electrotherapy-devices-services-section/content/text/glossary/terms/transcranial-alternating-current-stimulation.md).
