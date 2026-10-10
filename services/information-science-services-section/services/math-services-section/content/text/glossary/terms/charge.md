---
name: Charge
description: "The four-point value a reading takes at positing: an ordered pair of evidence slots, for and against, each absent or present, giving bottom, positive, negative and top. Measured from evidence, never seeded. Obsmetrologia's one charge; every other implementation of it is a copy to remove."
aliases: [charges, bilattice charge, charged]
leader-utterances:
  - "ni:///sha-256;5hNWAjD4defTBMbkVWUZRWqsKdtkr6yp0oDcrx0frHU"
  - "ni:///sha-256;8HiRDncJsi5b-A5WYWJv-ZsOgHaz3iBzqQrfCKPP1Vo"
  - "ni:///sha-256;358jLEjB3-7VOMvC91UKpIgzsruEf-AgwqNhM-oKgaA"
  - "ni:///sha-256;WK_xvj7f2db-snIePTmeNVVK_qfs7Vpj0WySnTz9sKc"
---
A **charge** is the value a [bilattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/charge/charge.md) assigns at [positing](positing.md). It is an ordered pair `[for, against]` of evidence slots, each either absent or present. Absence is slot structure, not a third primitive, so there are exactly four charges:

- **bottom**: no evidence either way;
- **positive**: evidence for;
- **negative**: evidence against;
- **top**: evidence both ways, held and not exploded.

These are the four values of Belnap–Dunn FOUR. A charge is *measured* from the evidence it is read off, never seeded. `Obsmetrologia.Charged` carries the value together with its witness pairs, and a charge without its evidence is an incomplete carrier. Value enters at positing. An articulation cell is not a value: its two slots are the subject and object positions of a predication (2026-09-27 release note, divergence 1).

[Negation](negation.md) on charges exchanges the two evidence sides. It is derived, not assumed: measuring the contradictory cell is negation of measuring the cell (`measure_contradictory_negate`, no axioms).

**There is one charge.** Obsmetrologia's Lean is the reference definition. Metrologic realizes it once in software, and every other implementation of charge in the house, in any package, is a parallel copy to delete. Its consumers are changed to use the one charge, even where they expected different behavior (Leader, 2026-09-10). When implementations disagree, the theory decides, not a vote among implementations (Leader, 2026-09-10). SignCell does not carry a charge algebra of its own (Leader, 2026-09-25).

## Related

- [Positing](positing.md)
- [Negation](negation.md)
- [Obsmetrologia](obsmetrologia.md)
