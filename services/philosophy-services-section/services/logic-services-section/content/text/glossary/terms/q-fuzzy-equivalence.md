---
kind: definition
type: equivalence
depends-on: [quantale-enriched-sheaf, quantale-enriched-cosheaf]
name: q-fuzzy equivalence in $\mathbf{Q\text{-}Cat}{\mathrm{cwl}}$
description: The Q-enriched analogue of categorical equivalence, allowing for quantale-graded error.
---

# q-fuzzy equivalence in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$

The Q-enriched analogue of categorical equivalence, allowing for *quantale-graded error*. A pair of Q-functors $F : \mathcal{C} \to \mathcal{D}$ and $G : \mathcal{D} \to \mathcal{C}$ form a **q-fuzzy equivalence** for $q \in \mathsf{Q}$ if the round-trip compositions agree with the identity up to error $q$:

$$\mathrm{hom}_\mathcal{C}\bigl(GF(x), x\bigr) \succeq q \quad\text{and}\quad \mathrm{hom}_\mathcal{C}\bigl(x, GF(x)\bigr) \succeq q$$

for all $x \in \mathrm{ob}(\mathcal{C})$, and similarly with $C$ replaced by $D$ and $GF$ by $FG$.

For $q = 1$ (the unit of the quantale), this reduces to a **strict equivalence** — the round-trips are isomorphic to identity. For $q \prec 1$, the equivalence is *fuzzy* with quantale-graded error: round-trip is identity-like only up to $q$.

## Relation to fuzzy adjunctions

A pair of Q-functors $F \dashv_q G$ in Lopez's sense ([@lopez2024] Definition 2.3.14) is a **q-fuzzy adjunction**:

$$\mathrm{hom}_\mathcal{D}\bigl(F(x), y\bigr) \succeq q \cdot \mathrm{hom}_\mathcal{C}\bigl(x, G(y)\bigr) \quad\text{and dually.}$$

A q-fuzzy adjunction extends to a q-fuzzy equivalence when both unit and counit have $q$-graded inverses — i.e., both round-trip compositions are bounded below by $q$ in the hom-quantale.

For strict adjunctions ($q = 1$), this reduces to: the unit and counit are natural isomorphisms, giving a strict equivalence.

## Composability

Q-fuzzy equivalences compose with multiplicative quantale grade: if $\mathcal{C} \simeq_p \mathcal{D}$ and $\mathcal{D} \simeq_q \mathcal{E}$ then $\mathcal{C} \simeq_{p \cdot q} \mathcal{E}$. The composition's fuzziness is the product of the components'.

For $q = 1$ everywhere, the composition is strict. For $q \prec 1$, fuzziness accumulates multiplicatively.

## Connection to standard categorical equivalence

When $\mathsf{Q}$ is the trivial quantale $\{0, 1\}$ with multiplication = AND (boolean quantale), Q-Cat = Pos and a 1-fuzzy equivalence is just a poset isomorphism (or order equivalence). Fuzzy equivalences with $q < 1$ collapse to "no equivalence" in this case (since $q < 1$ means $q = 0$ in the boolean quantale).

For richer quantales (Lawvere $[0, \infty]$, MV-algebra, frames-as-quantales), q-fuzzy equivalence is a strictly weaker condition than strict equivalence, parametrized by the quantale element $q$.

## Position in the program

The right notion for stating Q-enriched theorems that hold "with quantale-graded error" — useful for results that don't hold strictly but hold approximately. Used in the [fuzzy 2-cell Curry equivalence](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-curry-2-cell-fuzzy.md) and conjecturally in extensions of [@curry2014]'s derived equivalence to Q-enriched cellular sheaves.

The "fuzzy" framing lets the corpus state useful results in the Q-enriched setting where the corresponding strict version fails — a standard pattern in approximate / weighted category theory.
