---

title: "What Is Modal Logic?"
description: "An introduction to modal logic for readers who understand 'true' and 'false' but haven't seen 'necessarily true' or 'possibly true.'"
date-created: 2026-03-30
requires: []
teaches:
  - modal-logic
  - kripke-semantics
type: explanation

depends-on: []
introduces:
  - modal-logic
  - kripke-semantics
---

Classical logic has two values: true and false. A statement is one or the other. Modal logic adds two qualifiers: **necessarily** and **possibly**.

"It is raining" is either true or false. "It is necessarily raining" is a stronger claim — it rains in every relevant situation, not just the current one. "It is possibly raining" is weaker — it rains in at least one relevant situation.

These are the modal operators:

- $\Box p$ (**necessarily** $p$): $p$ holds in every accessible situation.
- $\Diamond p$ (**possibly** $p$): $p$ holds in some accessible situation.

"Accessible situation" is deliberately vague. What counts as accessible depends on what you are modeling. If you are modeling time, accessible means "in the future." If knowledge, accessible means "consistent with what is known." If obligation, accessible means "in a world where the rules are followed." The same formal structure — $\Box$ and $\Diamond$ over accessible situations — models all of these.

Kripke (1963) gave this a precise semantics. A **Kripke model** is a set of "worlds" (situations), a relation saying which worlds are accessible from which, and a valuation saying what is true at each world. $\Box p$ holds at world $w$ if $p$ holds at every world accessible from $w$.

Different conditions on the accessibility relation give different logics. If every world can access itself (reflexivity), you get the logic T: what is necessarily true is true. If accessibility is also transitive, you get S4: what is necessarily true is necessarily necessarily true. If accessibility is an equivalence relation, you get S5: what is possibly true is necessarily possibly true.

Modal logic is decidable in many cases: there is an algorithm that can determine whether a formula is valid, and it always terminates. This matters because it means reasoning with necessity and possibility can be mechanized.

The four-valued bilattice extends this further. Instead of just true/false at each world, each proposition can be unattested, affirmed, denied, or contested. The modal operators on this bilattice split into pairs of classical operators — one acting on the affirmation component, one on the denial component (Rivieccio, Jung, & Jansana 2017). The resulting four-valued modal logic is still decidable.
