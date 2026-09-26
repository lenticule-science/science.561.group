---
name: Regime
description: "The character of a closure, read off its closure ordinal κ: strict-finite, Scott-continuous, transfinite-bounded or aperiodic. Each is the regime of one stage of the language spine (settling, positing, predicating, articulating) and each admits a different kind of proof: exhaustion, settlement by replay, obstruction witness, witnessed execution."
identity: regime
aliases: [regimes, closure regime, closure regimes]
date-created: 2026-09-04
provenance:
  authors:
    - emsenn
    - claude-fable-5-1
---
A **regime** is the character of a closure, read off the height of its [closure ordinal](closure-ordinal.md) κ: the least stage at which iterating the closure produces nothing new. Four regimes partition the ordinal line, mutually exclusive and jointly exhaustive (Obsmetrologia [`Closure/Regime.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Closure/Regime.lean), `four_regime_dichotomy`):

| Regime | κ | Stage | What puts a closure there | Proof it admits |
|---|---|---|---|---|
| strict-finite | κ < ω | settling | a finite base | exhaustion: every state and transition checked |
| Scott-continuous | κ = ω | positing | an infinite base with quantifier-free rules | settlement: monotone closure to the ω fixed point, verified by replaying finite prefixes |
| transfinite-bounded | ω < κ < ω₁ | predicating | rule premises with ∀-blocks, countable cofinality | obstruction witness: a global section exists or provably does not |
| aperiodic | κ ≥ ω₁ | articulating | ∀-blocks with uncountable cofinality | witnessed execution: nothing settles it, so it can only be walked and the walk witnessed |

## Each regime is one stage's

The four regimes are not four kinds of settling. Each is the regime of one stage of the language spine:

- **Settling** is finite. Settling proper runs over a finite reading lattice and stops by step three; Obsmetrologia proves the spine is in this regime (`spine_is_strict`).
- **Positing** is Scott-continuous. Evidence is admitted along directed finite prefixes, and the limit is the union of what the prefixes established.
- **Predicating** is transfinite-bounded. A premise that quantifies over an infinite range can only be discharged once the whole range is in, so its rule fires at a limit stage no finite prefix reaches.
- **Articulating** is aperiodic. Articulated traces carry aperiodic order: substitution recurrences whose cohomology is the direct limit Anderson and Putnam compute for substitution tilings, never stabilizing at a countable stage.

Read along the spine, articulate → predicate → posit → settle, the regime descends.

Obsmetrologia does not yet state this pairing. `Closure/Regime.lean` instead maps each regime to a corner of the four-valued reading (`regimeCornerBij`: strict to absurd, Scott to potential, transfinite-bounded to active, aperiodic to stable); that assignment identifies the four regimes with the four readings inside a stage and is not the pairing given here. The classifier therefore tells which stage's work a closure is doing: a rule system run as settling whose premises carry ∀-blocks is doing predicating work, and one whose rules are step-n recurrences is articulating.

## Engineering consequence

LLM inference articulates, so it is aperiodic: it can be witnessed, not settled. Stated in the LAGOON architecture specification, composition within a regime or onward along the spine is free, while any dependency that runs back (settled software consuming articulated output) must cross a witnessed seam; moving work into a later stage's regime is restriction, never a claim of having tamed the earlier one.

## The word

In the ordinary sense a regime is a persistent pattern of conditions and governing dynamics within which a system behaves in a characteristic way; house names such as SPRING (Settled-Percolation Regime Instantiating Neighborhood Germs) use it in that sense. Such names organize vocabulary; they do not show that an implementation has the named mathematical structure.

## Related

- [Closure ordinal](closure-ordinal.md)
- [Four regimes of natural existence](../../../../../../../natural-science-services-section/content/text/glossary/topics/four-regimes-of-natural-existence.md)
