---

introduces: semantic-framework
description: "Possible-world semantics for modal logic: a set of worlds, an accessibility relation, and a valuation. □p holds at w iff p holds at every accessible world."
aliases: [Kripke semantics, Kripke model, Kripke frame, possible-world semantics]
specialization: model-theory
semantics-for: modal-logic
made-of: [possible-world, accessibility-relation, valuation]
accessibility-conditions-yield: [T, S4, S5]
four-valued-extension: rivieccio-jung-jansana-2017
four-valued-values: epistemic-state
introduced-by: kripke-1963
date-created: 2026-03-30
---

Kripke semantics (Kripke 1963) interprets [modal logic](./modal-logic.md) over relational structures called Kripke frames.

A **Kripke frame** is a pair $(W, R)$ where $W$ is a set of worlds and $R \subseteq W \times W$ is an accessibility relation. A **Kripke model** adds a valuation $V$ assigning truth values to propositions at each world.

The modal operators are defined by the accessibility relation:

- $\Box p$ holds at world $w$ iff $p$ holds at every world $R$-accessible from $w$.
- $\Diamond p$ holds at $w$ iff $p$ holds at some $R$-accessible world.

Different conditions on $R$ yield different modal logics: reflexive gives T, reflexive and transitive gives S4, equivalence relation gives S5.

Rivieccio, Jung, & Jansana (2017) extended Kripke semantics to the four-valued [bilattice](../../algebra/objects/bilattice.md): truth at each world is four-valued ($\bot$, $t$, $f$, $\top$), and modal operators decompose into pairs of classical operators on the [twist product](../../algebra/objects/twist-product.md) components. The resulting four-valued modal logic is decidable.
