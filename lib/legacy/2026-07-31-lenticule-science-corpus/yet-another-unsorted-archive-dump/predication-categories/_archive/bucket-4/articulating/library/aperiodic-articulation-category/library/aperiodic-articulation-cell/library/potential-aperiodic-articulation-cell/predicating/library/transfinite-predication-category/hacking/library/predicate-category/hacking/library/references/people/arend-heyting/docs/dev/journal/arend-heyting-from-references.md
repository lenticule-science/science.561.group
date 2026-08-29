---
name: Arend Heyting
description: "Dutch mathematician and logician (1898-1980). Student of Brouwer; formalized intuitionistic logic and intuitionistic arithmetic; gave the algebraic structures (Heyting algebras) that bear his name."
date-created: 2026-04-28
---

Arend Heyting (1898-1980) was a Dutch mathematician and logician, a student of L.E.J. Brouwer at the University of Amsterdam, who formalized intuitionistic logic and intuitionistic arithmetic — the formal systems corresponding to Brouwer's intuitionistic foundations of mathematics. Where Brouwer regarded formalization with suspicion (as a betrayal of the intuitionistic spirit), Heyting argued that careful formalization could communicate intuitionistic mathematics to non-intuitionists without conceding its philosophical commitments.

## Core ideas

- **Intuitionistic logic.** A logic in which the law of excluded middle ($\varphi \lor \neg\varphi$) and double-negation elimination do not hold unrestrictedly. A proof of $\varphi \lor \psi$ requires a proof of $\varphi$ or a proof of $\psi$; a proof of $\exists x.\varphi(x)$ requires the construction of a specific witness.
- **Heyting arithmetic.** The intuitionistic counterpart of Peano arithmetic. Provably weaker than classical PA on disjunctive and existential statements; equivalent in many practical settings.
- **Heyting algebras.** The algebraic structures interpreting intuitionistic propositional logic — bounded distributive lattices in which every pair of elements has a relative pseudo-complement (implication). Heyting algebras stand to intuitionistic logic as Boolean algebras stand to classical logic.
- **The BHK interpretation** (with Brouwer and Kolmogorov). The intuitionistic meaning of logical connectives explained in terms of what counts as a proof: a proof of $\varphi \to \psi$ is a construction transforming proofs of $\varphi$ into proofs of $\psi$; a proof of $\varphi \land \psi$ is a pair (proof of $\varphi$, proof of $\psi$); a proof of $\neg\varphi$ is a construction from a proof of $\varphi$ to absurdity.

## Key works

- *Die formalen Regeln der intuitionistischen Logik* (1930) — the foundational paper formalizing intuitionistic logic
- *Mathematische Grundlagenforschung: Intuitionismus, Beweistheorie* (1934)
- *Intuitionism: An Introduction* (1956) — the standard introduction in English

## Where his work figures in this library

Heyting figures in [heyting-algebra](../theories/humanities/theories/math/theories/logic/terms/heyting-algebra.md), [heyting-implication](../theories/humanities/theories/math/theories/logic/terms/heyting-implication.md), the broader [intuitionistic-logic](../theories/humanities/theories/math/theories/logic/_index.md) work, and the [order](../theories/humanities/theories/math/theories/order/_index.md) subdomain's treatment of Heyting algebras as ordered structures.
