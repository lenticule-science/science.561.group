---
identity: electroencephalography
name: "Electroencephalography"
description: "Recording the brain's electrical activity through electrodes on the scalp; millisecond timing but coarse location, the main window onto neural oscillations."
aliases:
  - "EEG"
  - "electroencephalogram"
references:
  berger1929:
    authors:
      - "Hans Berger"
    title: "Über das Elektrenkephalogramm des Menschen"
    year: 1929
    publication: "Archiv für Psychiatrie und Nervenkrankheiten"
    volume: "87"
    pages: "527-570"
  buzsaki2006:
    authors:
      - "György Buzsáki"
    title: "Rhythms of the Brain"
    year: 2006
    publisher: "Oxford University Press"
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Electroencephalography (EEG) records voltage fluctuations on the scalp that arise from the summed synaptic currents of large populations of cortical neurons firing in step [@berger1929]. Its timing is precise to the millisecond, but it locates activity only coarsely: the skull smears the signal, and deep structures contribute little.

EEG is the standard way to measure [neural oscillations](neural-oscillation.md) and so to test claims that a practice or device changes brain state, for instance that it increases [alpha](alpha-rhythm.md). It is also used clinically for epilepsy, sleep staging and anaesthesia depth [@buzsaki2006]. One practical difficulty for stimulation research is that recording EEG while current flows through the scalp is hard, because the stimulation artifact swamps the brain's own signal. Many studies can therefore only compare EEG before and after stimulation.
