---
type: question
status: open
explores: [military-command-chain-as-modal-composition, rotational-authority, office-as-double-settlement]
---

# How does $H^0_t$-invariant accountability transfer under rotational incumbency of the principal?

The [military-command-chain-as-modal-composition theorem](../theorems/military-command-chain-as-modal-composition.md) proves (part d) that the captain's accountability for $X$ is an $H^0_t$ invariant: the cells $\langle r_1, \texttt{accountable-for}, X\rangle = \mathbf{t}$ persist through every delegation link, regardless of which rank executed $X$.
The proof is established under the assumption of *permanent incumbency at $r_1$*: the captain's accountability cells are stable because the captain's incumbency cells are stable.

The [rotational-authority](../objects/rotational-authority.md) object describes incumbency that *cycles* through eligible population members at rotation boundaries.
The current incumbent's incumbency cells retire at $\tau + \pi$; new incumbency cells settle for the next agent.

**Open: what happens to the $H^0_t$-invariant accountability cells when the principal ($r_1$) rotates?** Specifically: does $\langle r_1, \texttt{accountable-for}, X\rangle = \mathbf{t}$ follow $r_1$ as a name (the office, persistent across rotations), or follow the incumbent (retiring with the prior incumbent's incumbency)?

## Why this matters

The military-command theorem's accountability claim is read as "the captain answers for the ship."
Under rotational incumbency, a literal reading produces awkward consequences:

- If accountability follows the *office* (the captaincy as such), then the rotation is unproblematic — accountability is to the office, the office persists across rotations, the new incumbent inherits accountability.
- If accountability follows the *incumbent* (the specific agent who exercised the powers over their term), then accountability cells retire with each incumbency.
  Past actions are no one's responsibility post-rotation; this seems normatively odd.

The theorem's "captain accountable" reading suggests the first interpretation, but the proof's substrate construction (the $H^0_t$-invariant is on the principal's accountability cells; the principal is named at $r_1$) is ambiguous about whether $r_1$ is an office-slug or an incumbent-cell.

## What's at stake substrate-algebraically

Per [office-as-double-settlement](../objects/office-as-double-settlement.md), the office's *structural data* (normative-structure, action-domain, deontic-profile) is substrate content that persists by settling-monotonicity.
Incumbency cells are separate — they settle on a candidate via the recognition + induction predicates and retire at term-end.

The accountability cell $\langle r_1, \texttt{accountable-for}, X\rangle$ could be attached to either:

1. **The office's structural data** — accountability is a property of the office, persists across rotations, the new incumbent's installation includes asserting "now you bear the office's accountabilities."
2. **The incumbent's incumbency record** — accountability is a property of the specific incumbent, retires at term-end, the past incumbent retains historical-record cells but no current accountability.

The military-command theorem does not pin down which.
For non-rotational governance, the distinction is invisible (incumbency is permanent so the cells don't retire).
Rotational incumbency makes the distinction structural.

## Ramifications

If the resolution is (1) — accountability follows the office — then rotational principals are admissible without further structural work.
The $H^0_t$-invariant is on office cells, not incumbent cells; rotation doesn't affect the invariant.

If the resolution is (2) — accountability follows the incumbent — then rotation of the principal is structurally *not admissible* without an explicit accountability-transfer mechanism.
This could be:

- A succession witness that the new incumbent asserts accountability for past acts (extending the $H^0_t$-invariant by an additional cell-set).
- A formal claim by the polity that prior incumbents retain *historical-accountability* cells distinguishable from *current-accountability* cells, with the rotation transferring current accountability while preserving historical.

The choice has cohomological consequences: under (1), the chain's $H^0_t$ class is rotation- invariant; under (2), each rotation produces a new class.

## What would settle this question

A refinement of the military-command theorem that:

1. Distinguishes office-bound accountability cells from incumbent-bound accountability cells.
2. Specifies which kind the theorem's $H^0_t$-invariant claim addresses.
3. Provides the rotation-compatible variant (if the original is incumbent-bound) or confirms that rotation is automatically compatible (if office-bound).

This is upstream-theory work for the predicated-governance program; it surfaces from the [PyFARS-side rotation question](../../../../../../../../../tools/platform/pyfars/theory/questions/rotational-authority-for-pyfars-offices.md) because PyFARS as a polity substrate may adopt rotational governance for its offices, and the existing theorem doesn't disambiguate.

## Origin

Surfaced while authoring [`pyfars-office-rotation`](../../../../../../../../../tools/platform/pyfars/theory/objects/pyfars-office-rotation.md) in the PyFARS self-theory.
Filed here as the upstream theory gap that PyFARS encountered.
