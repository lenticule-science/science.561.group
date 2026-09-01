---

introduces: property
description: "A logic or problem is decidable if an algorithm exists that determines the answer in finite time for every input."
aliases: [decidable, decidable logic, decidability]
applies-to: [logic, problem]
requires: algorithm-that-always-terminates
decidable-logics: [propositional-logic, modal-S5, lambek-calculus, four-valued-modal-logic]
undecidable: first-order-logic
four-valued-decidability: rivieccio-jung-jansana-2017
decided-via: finite-model-property
date-created: 2026-03-30
---

A logic is **decidable** if there exists an algorithm that determines, for any formula in the logic, whether the formula is valid — and the algorithm terminates in finite time on every input.

Decidability means the logic can be mechanized. A decidable logic admits a decision procedure: a program that takes a formula and returns yes or no, always halting.

Classical propositional logic is decidable (truth tables). Classical first-order logic is not (Church-Turing). [Modal logic](./modal-logic.md) S5 is decidable. The [Lambek calculus](./lambek-calculus.md) is decidable (Pentus 1993).

The four-valued [modal logic](./modal-logic.md) over $\mathbf{2} \otimes \mathbf{2}$ has the **finite model property** (every non-valid formula has a finite countermodel) and is therefore decidable (Rivieccio, Jung, & Jansana 2017). This means the modal calculus of predication on bilattice-valued fibers — reasoning about what can be inferred by extending and restricting — is decidable.
