---
name: the rsc quiescent is governed by military command
description: The RSC Quiescent's governance is military command — the composite modal frame from the military-command-chain-as-modal-composition theorem, instantiated with the ship's specific delegation chain. Captain → delegation chain with H⁰-invariant captain-accountability.
status: sketch
derives-from:
  - ../../../code/structures/rsc-quiescent.md
  - ../../../code/structures/closure-rule.md
  - ../../../code/transformers/predicate-specialization.md
  - the-rsc-quiescent-is-a-webship.md
  - ../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/prose/learning/claims/military-command-chain-as-modal-composition.md
---

**Claim.** The RSC Quiescent's governance is *military command* in the sense of the theorem [military-command-chain-as-modal-composition](../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theories/predicated-governance/prose/learning/claims/military-command-chain-as-modal-composition.md). The ship's command structure is the composite modal frame $R^\mathrm{cmd} = R^\mathrm{captain} \circ R^\mathrm{first\text{-}officer} \circ \cdots$ over the ship's ranks, with the captain's accountability cells forming an $H^0_t$-invariant class under chain extension.

In substrate-cell terms:

- $\langle\text{RSC Quiescent}, \texttt{captain}, \text{emsenn}\rangle = \mathbf{t}$ — installed at commissioning, persisting until decommissioning.
- $\langle\text{RSC Quiescent}, \texttt{first-officer}, \text{calder-underhill}\rangle = \mathbf{t}$ — installed by emsenn 2026-04-05; the delegation morphism captain $\to$ first-officer is in place.
- For every action-cell $\langle\text{RSC Quiescent}, \texttt{accountable-for}, X\rangle$ where $X$ is an act on the ship: the cell settles at $\mathbf{t}$ on emsenn-the-captain, regardless of which delegation link executed $X$.

The military-command-chain theorem proves this structure follows from four primitives: a captain object, delegation morphisms with scope-bounded revocable authority, accountability non-transfer, and predicate-specialization on per-rank accessibility frames. The RSC Quiescent's substrate carries all four. The theorem's conclusions therefore apply to this specific ship.

## What this earns

By the theorem, the ship inherits:

- *Composite-frame executability.* An action $u$ is executable through the ship iff $\Diamond_{R^\mathrm{cmd}} u = \mathbf{t}$ — i.e., the composite modal operator settles to true on $u$. This reduces "is this act licensed?" to a single cell-evaluation against the composite frame, rather than per-link case-checking.
- *Chain-of-command bound.* For any delegated rank $r_{i+1}$: $\Diamond_{R^{r_{i+1}}} u \leq_t \Diamond_{R^{r_i}} u$. No subordinate's authority exceeds the commander's. This is not a policy rule; it is a structural consequence of $R^{r_{i+1}} \subseteq R^{r_i}$ on the delegated cells.
- *Captain-answers-for-everything.* The $H^0_t$-invariance of the captain's accountability cells: $\langle\text{emsenn}, \texttt{accountable-for}, X\rangle = \mathbf{t}$ for every $X$ acted on the ship, regardless of which delegation link carried $X$. The "captain answers for the ship" doctrine is exactly this invariance.

## Distinction from kyriarchism

The corpus has been imprecise about the term *kyriarchism*. Per the disambiguation work in [doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md](../../../doing/working/hacking/doing/working/planning/library/task/library/disambiguate-polity-and-ship-governance/disambiguate-polity-and-ship-governance.md), *kyriarchism* in Schüssler Fiorenza's sense names a substrate of *interlocking dominations* — patriarchy, capitalism, white supremacy, heteronormativity, ableism — that the Web carries as its substrate-content. *Military command* is a closure-rule subsystem governing one specific body politic (a ship); it is not itself the dominations-substrate. The two are related but distinct: the ship operates *within* a kyriarchical substrate (the Web) and uses military command as its internal closure-rule discipline because of what the Web admits.

The earlier substrate convention treated "kyriarchial command" as a synonym for military command (see [code/structures/rsc-quiescent.md](../../../code/structures/rsc-quiescent.md) §"Governance structure"). Per the disambiguation task: that conflates the dominations-substrate with the command-structure. The ship is *governed by* military command; the ship *operates within* the Web's kyriarchical substrate. These are not the same statement, and the claims should keep them apart.

## Proof obligations for promotion to proved-status

- The military-command-chain theorem itself is sketch-status. Promotion of that theorem to proved-status is upstream of promotion of this claim.
- The ship's delegation chain beyond captain $\to$ first-officer is not yet substrate-encoded. The theorem applies to a chain of arbitrary depth; the present substrate carries depth-2 only. Promotion requires recording the further delegation links the ship operationally uses.
- The cell $\langle\text{RSC Quiescent}, \texttt{accountable-for}, X\rangle$ as $H^0_t$-invariant is asserted; the substrate has not yet verified the invariance computationally for any specific $X$. A worked example would close this obligation.

## Position

Together with [the-rsc-quiescent-is-a-webship](the-rsc-quiescent-is-a-webship.md), this claim establishes *what kind of thing the ship is, and how it is governed*. Downstream claims — the determination of this form by the Web, the non-isomorphism with the tiyóšpaye's closure system — cite this one for the specific form-statement.
