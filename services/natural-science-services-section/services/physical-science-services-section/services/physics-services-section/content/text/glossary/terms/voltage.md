---
identity: voltage
name: "Voltage"
description: "The difference in electric potential between two points, measured in volts: the work per unit charge available to push current through what lies between them."
aliases:
  - "electric potential difference"
  - "potential difference"
  - "electromotive force"
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
provenance:
  date-created: "2026-09-24"
  authors:
    - claude-opus-5-5
---

Voltage is the difference in electric potential between two points, measured in volts (V): the energy, per unit of charge, that moving a charge from one point to the other releases or requires [@halliday2013]. It is the "push" behind [current](electric-current.md).

Ohm's law ties the two together through the resistance of the path: *V = I × R*, voltage equals current times resistance. For alternating signals and tissue, resistance generalizes to [impedance](electrical-impedance.md). A worked example makes this concrete. Sending 1 mA through a path of 10 kΩ, a plausible order of magnitude for skin and electrodes, takes 10 V. Halve the impedance, by wetting the electrodes for example, and 5 V suffices.

The same concept applies inside the body. Every living cell holds a voltage across its membrane, the [membrane potential](../../../../../../../biological-science-services-section/services/neuroscience-services-section/content/text/glossary/terms/membrane-potential.md), and a neuron fires when that voltage is pushed past a threshold.
