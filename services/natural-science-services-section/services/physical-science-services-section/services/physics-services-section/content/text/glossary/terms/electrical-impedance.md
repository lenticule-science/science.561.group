---
identity: electrical-impedance
name: "Electrical Impedance"
description: "A material's opposition to alternating current, combining resistance with reactance; in the body it is dominated by the skin and depends on frequency."
aliases:
  - "impedance"
  - "resistance"
  - "bioimpedance"
relations:
  property-of: "electric-current"
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

Impedance is how strongly a material opposes an [alternating current](alternating-current.md), measured in ohms (Ω). It has two parts [@halliday2013]:
- **resistance**, which opposes current regardless of frequency and turns electrical energy into heat;
- **reactance**, which comes from the storage of charge (capacitance) or of magnetic energy (inductance) and depends on frequency.

For direct current, impedance reduces to resistance.

Living tissue behaves like resistors and capacitors combined [@grimnes2015]. Cell membranes are thin insulating layers separating conductive fluids, so they act as capacitors. At low frequencies current flows mostly around cells, through the fluid between them. At higher frequencies it increasingly passes through them. The outer, dead layer of skin, the stratum corneum, gives the highest impedance on the path. That is why electrodes are used with conductive gel or saline, why dry skin needs more [voltage](voltage.md) for the same current, and why current can concentrate at small damp patches and sting.

For a stimulator on the head, the layers matter as much as the numbers. Scalp is a fairly good conductor, skull a poor one, and cerebrospinal fluid an excellent one. Much of the current applied to the scalp therefore flows around the head in the scalp rather than through the skull. Only the remainder produces an [electric field](electric-field.md) in the brain.
