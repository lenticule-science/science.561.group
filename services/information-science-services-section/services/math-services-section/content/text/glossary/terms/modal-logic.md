---

introduces: logic
description: "A family of logics extending classical logic with operators for necessity (□) and possibility (◇), interpreted over relational structures."
aliases: [modal logics]
specialization: classical-logic
operations: [necessity, possibility]
semantics: kripke-semantics
made-of: [possible-world, accessibility-relation, valuation]
variants: [T, S4, S5, K]
four-valued-version: rivieccio-jung-jansana-2017
four-valued-operators-decompose-into: pairs-of-classical-operators
decidable: true
finite-model-property: true
bilattice-valued: bilattice
introduced-by: lewis-1918
kripke-semantics-by: kripke-1963
date-created: 2026-03-30

---

Modal logic extends classical logic with two operators: necessity $\Box$ ("it must be the case that") and possibility $\Diamond$ ("it could be the case that"). These are dual: $\Box p = \neg \Diamond \neg p$.

The standard semantics is Kripke semantics (Kripke 1963): a model consists of a set of worlds $W$, an accessibility relation $R$ on $W$, and a valuation assigning truth values to propositions at each world. $\Box p$ holds at world $w$ iff $p$ holds at every world accessible from $w$. $\Diamond p$ holds at $w$ iff $p$ holds at some accessible world.

Different conditions on $R$ yield different modal logics. Reflexive $R$ gives the logic T. Reflexive and transitive gives S4. Equivalence relation gives S5. These are all well-studied with known axiomatizations and completeness theorems.

On the four-valued [bilattice](./bilattice.md), Rivieccio, Jung, & Jansana (2017) proved that modal operators decompose into pairs of classical operators on the [twist product](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) components:

$$\Box(a^+, a^-) = (\Box_1(a^+),\ \Diamond_2(a^-))$$
$$\Diamond(a^+, a^-) = (\Diamond_1(a^+),\ \Box_2(a^-))$$

The resulting four-valued modal logic has the finite model property and is decidable.

A logic is **decidable** if there exists an algorithm that determines, in finite time, whether any given formula is valid. Decidability means the logic can be mechanized.
