---
identity: electric-field
name: "Electric Field"
description: "The force per unit charge at each point in space, measured in volts per metre; in stimulation, the quantity that actually acts on neurons."
aliases:
  - "E-field"
  - "field strength"
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

An electric field is the force a unit of charge would feel at each point in space. Its strength is measured in volts per metre (V/m), the gradient of [voltage](voltage.md) across distance [@halliday2013]. Within a conductor carrying current, the field is proportional to the [current density](current-density.md) divided by the tissue's conductivity.

For brain stimulation the field is the quantity that matters, not the current set on the device. A neuron lying in a field has its [membrane](../../../../../../../biological-science-services-section/services/neuroscience-services-section/content/text/glossary/terms/membrane-potential.md) made slightly more positive on one side and more negative on the other. In a weak field that shift is well below what fires a neuron, but it can change how easily it fires.

Measurements set the scale. Recordings in rats and in human surgical patients found that most current applied to the scalp is shunted by skin and skull. At the currents used in conventional transcranial stimulation, the fields reaching the brain were small: fractions of a volt per metre. The authors estimated that roughly 1 V/m or more is needed to affect neurons reliably [@voroslakos2018]. How weak fields can still act through [resonance with ongoing rhythms](../../../../../../../biological-science-services-section/services/neuroscience-services-section/content/text/glossary/terms/neural-entrainment.md) is where the science of [transcranial electrical stimulation](../../../../../../../biological-science-services-section/services/medical-science-services-section/services/medical-technology-services-section/services/electrotherapy-devices-services-section/content/text/glossary/terms/transcranial-electrical-stimulation.md) turns.
