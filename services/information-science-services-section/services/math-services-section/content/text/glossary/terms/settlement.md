---
name: "Settlement"
description: "What settling reaches: the least fixed point of the modal closure over a posited valuation, where further closure changes nothing. A settlement can sit at any of the four readings the evidence supports; on the four readings it is reached by step three."
aliases: [settled valuation, settled reading]
date-created: 2026-04-28
date-modified: 2026-09-27
---

A **settlement** is what [settling](settling.md) reaches: the least fixed
point of the modal closure $\Diamond \circ \Box$ over a posited valuation,
the valuation that further closure no longer changes
([`Language/Settling.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Settling.lean),
`settle_fixed`, `settle_least`). Settling is the operation; a settlement is
its result, one per posited valuation.

## Where a settlement sits

Every value of a settlement is one of the four readings of the
[bilattice](bilattice.md): absurd, potential, active or stable in the
knowledge order. A settlement does not have to reach stable. It sits at
whatever reading the evidence supports, and a claim no evidence has reached
settles at absurd. Settling is not truth evaluation: a settled potential
reading says the claim was told for and nothing more closed over it, not that
the claim is true.

## How it is reached

Closure only raises values in the knowledge order, never lowers them, so a
valuation's orbit climbs toward its settlement monotonically. On the four
readings no ascending chain has four distinct elements, so every settlement
is reached by step three (`strict_finite`, `settled_fixed`): settling's
[regime](regime.md) is strict-finite, and an evaluator that has not settled
by then has a bug, not a slow input.

When evidence keeps arriving, each increment is joined in and the valuation
is closed again. The driven orbit stays monotone and fixes where the
increments stop (`drive_at_settle_fixed`), so a settlement under driven
settling is the settlement of all the evidence received. Evidence is
joined, never withdrawn (`measure_cons_le`).

## Other readings of the word

Linguistics reads a speech community's settled acceptance of a form as a
settlement of this kind, with the community's closure in place of the modal
closure: see [settlement in obsmetrological linguistics](../../../../../communication-science-services-section/services/linguistics-services-section/services/obsmetrological-linguistics-services-section/content/text/glossary/terms/settlement.md).
In operations, a settlement is a territory that runs its own law, ledgers and
contracts: see [settlement (operations)](../../../../../../../../../561-group-services-section/content/text/glossary/terms/settlement.md).

## See also

- [Settling](settling.md): the stage that produces a settlement
- [Bilattice](bilattice.md): the four readings a settled value takes
- [Determination](determination.md)
- [Regime](regime.md)
