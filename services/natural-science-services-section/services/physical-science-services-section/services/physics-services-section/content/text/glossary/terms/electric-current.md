---
identity: electric-current
name: "Electric Current"
description: "The rate at which electric charge flows past a point, measured in amperes; in metal wires the carriers are electrons, in body tissue they are ions."
aliases:
  - "current"
  - "amperage"
relations:
  requires: "voltage"
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

Electric current is the rate at which electric charge passes a point: one ampere (A) is one coulomb of charge per second [@halliday2013]. Medical stimulators work at milliamperes (mA, thousandths of an ampere) and microamperes (µA, millionths).

What carries the charge depends on the conductor. In a wire it is electrons. In body tissue it is ions, mainly sodium, potassium and chloride dissolved in body water. At an electrode touching the skin, electronic current in the wire has to become ionic current in the tissue through electrochemical reactions at the surface [@grimnes2015].

Current is what a stimulator controls, because current is what reaches tissue. The [voltage](voltage.md) needed to push a given current depends on the [impedance](electrical-impedance.md) in the way. Most stimulators are therefore current-controlled: they raise or lower the voltage to hold the current at the set value. What a neuron actually experiences is the [electric field](electric-field.md) the current sets up, which depends on [how concentrated](current-density.md) the current is where the neuron sits.

Current is either direct, flowing steadily one way, or [alternating](alternating-current.md), reversing direction periodically.
