---
identity: membrane-potential
name: "Membrane Potential"
description: "The voltage across a cell membrane, about −70 mV inside a resting neuron, held by ion pumps and channels; its rise past threshold fires an action potential."
aliases:
  - "resting membrane potential"
  - "transmembrane potential"
relations:
  enables: "action-potential"
references:
  hodgkin1952:
    authors:
      - "Alan L. Hodgkin"
      - "Andrew F. Huxley"
    title: "A quantitative description of membrane current and its application to conduction and excitation in nerve"
    year: 1952
    publication: "Journal of Physiology"
    volume: "117"
    issue: "4"
    pages: "500-544"
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

Every living cell holds a [voltage](../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/voltage.md) across its membrane. In a resting neuron the inside sits about 70 millivolts negative to the outside. The sodium–potassium pump keeps potassium concentrated inside and sodium outside, and the resting membrane lets potassium leak out more easily than sodium leaks in [@grimnes2015].

Signals are changes in this voltage. Inputs from other neurons nudge it up (*depolarization*) or down (*hyperpolarization*). If it rises past a threshold, around −55 mV, voltage-gated sodium channels open in a self-reinforcing rush and the cell fires an [action potential](../../../../../medical-science-services-section/services/human-body-services-section/content/text/glossary/terms/action-potential.md). Hodgkin and Huxley described this with equations still used today [@hodgkin1952].

External stimulation works by moving this voltage. A strong pulse, as in TENS or in the electroconvulsive and magnetic stimulation used in psychiatry, depolarizes axons past threshold directly. A weak [field](../../../../../../../physical-science-services-section/services/physics-services-section/content/text/glossary/terms/electric-field.md) shifts the membrane potential by a fraction of a millivolt: never enough to fire a neuron on its own, but enough to change its [excitability](neuronal-excitability.md).
