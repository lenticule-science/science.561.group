---
type: theorem
status: sketch
depends-on: [office-as-double-settlement, predication-fiber-algebra, settling-quiescence, four-bilattice]
---

# Equivalence of office formalisms

The work-vocabulary's [formal-structure-of-office](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-office.md) presents an office as a quadruple $(P, A, D_O, I^+)$ with the *two nuclear closures* $\sigma_t, \Delta_t$ on a Heyting algebra fiber $H_t$, and incumbency stability characterized by

$$H^*_t \;=\; \mathrm{Fix}(\sigma_t) \,\cap\, \mathrm{Fix}(\Delta_t).$$

The predicated-work [office-as-double-settlement](../objects/office-as-double-settlement.md) object presents the same structure on the bilattice substrate, with two separate predicates $\mathrm{rec}(O)$ and $\mathrm{ind}(O)$ (recognition and induction) and incumbency characterized by joint affirming settlement of their respective cells on a candidate $\iota$.

These are not parallel formalisms; they are two presentations of one structure.
The translation:

| Office text (Heyting + nuclear closures) | Predicated-work (bilattice + closure rules) |
|---|---|
| Heyting algebra $H_t$ at history $t$ | Fiber-positive-coordinate $A_p^+$ at settling stage $\tau$ |
| Element $a \in H_t$ — incumbency proposition | Pair of cells $(\mathrm{rec}(O)(\iota),\, \mathrm{ind}(O)(\iota))$ on candidate $\iota$ |
| Recognition closure $\sigma_t : H_t \to H_t$ | Closure rule on the $\mathrm{rec}(O)$ predicate fiber |
| Induction closure $\Delta_t : H_t \to H_t$ | Closure rule on the $\mathrm{ind}(O)$ predicate fiber |
| $\mathrm{Fix}(\sigma_t)$ — recognition-stable elements | Cells with $v_{\tau^*}(\mathrm{rec}(O)(\iota)) = \mathbf{t}$ at $\sigma_t$-quiescence |
| $\mathrm{Fix}(\Delta_t)$ — induction-stable elements | Cells with $v_{\tau^*}(\mathrm{ind}(O)(\iota)) = \mathbf{t}$ at $\Delta_t$-quiescence |
| $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ — *dignitas* | Joint $\mathbf{t}$ at both cells at joint quiescence |
| Restriction map $\rho_{t\to s} : H_t \to H_s$ | Settling-morphism between operations settlings restricted to office cells |

## Sketch

**Direction 1 (Heyting → bilattice).** Given an office-text quadruple $(P, A, D_O, I^+)$ with Heyting algebra fiber $H_t$ and nuclear closures $\sigma_t$, $\Delta_t$, construct the predicated-work realization:

- The office entity $O \in E_{\mathrm{op}}$ carries cells encoding $P$ and $A$ (per [office-as-double-settlement](../objects/office-as-double-settlement.md)).
- For each action $a \in A$, the deontic-profile assignment $D_O(a) \in \{\texttt{power}, \texttt{duty}, \texttt{privilege}, \texttt{immunity}\}$ produces a [jural-relation](../objects/jural-relation.md) entity $R_a$ with $\langle R_a, \texttt{kind}, D_O(a)\rangle = \mathbf{t}$.
- The two nuclear closures $\sigma_t, \Delta_t$ become two closure rules in $\mathcal{S}_{\mathrm{op}}$, each with consequent on a different predicate fiber.
  The recognition rule's consequent is $\langle \iota, \mathrm{rec}(O), O\rangle$; the induction rule's consequent is $\langle \iota, \mathrm{ind}(O), O\rangle$.
- An $a \in H_t$ at $\sigma_t$-fixed-point corresponds to a candidate $\iota$ whose $\mathrm{rec}(O)$ cell has reached $\mathbf{t}$ under the recognition closure rule's iteration.
  Similarly for $\Delta_t$ and induction.

**Direction 2 (bilattice → Heyting).** Given the bilattice-substrate office object with two predicates and their closure rules, recover the Heyting-algebra structure as the fiber-positive-coordinate $A^+_p$ at $p$ being either $\mathrm{rec}(O)$ or $\mathrm{ind}(O)$:

- $A^+_{\mathrm{rec}(O)} = \mathbf{2}^{E_{\mathrm{op}} \times E_{\mathrm{op}}}$ — the Heyting algebra of subsets of cell-pairs in the recognition fiber's positive coordinate.
- The recognition closure rule, restricted to its fiber, gives a closure operator on $A^+_{\mathrm{rec}(O)}$.
  By the [closure 2-monad's](../../../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) construction, this is a Heyting-algebra closure operator (preserving $\wedge$, $\vee$, $\Rightarrow$).
- Similarly for induction.
  The two closure operators on $A^+_{\mathrm{rec}(O)} \times A^+_{\mathrm{ind}(O)}$ encode the office's two-axis structure on a product Heyting algebra.
  The product is the relevant Heyting algebra in the office-text formalism. $\square$

## What the translation preserves

- **Doubly stable incumbency.** $H^*_t$ in the office text corresponds exactly to $\{\iota : v_{\tau^*}(\mathrm{rec}(O)(\iota)) = \mathbf{t}$ and $v_{\tau^*}(\mathrm{ind}(O)(\iota)) = \mathbf{t}\}$ at joint $\sigma_t$-and-$\Delta_t$-quiescence.
- **Persistence.** The office text's "dignity does not die" — the structural commitment $P$ persists across all $t$ — corresponds to the office entity $O$'s structural cells persisting in the operations settling regardless of which candidate is currently in dignitas.
- **Shadow classes.** The four shadow classes from the [delegation text](../../../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/texts/formal-structure-of-delegation.md) Proposition 2 ($H^*_s$, SatShadow, TrShadow, FreeShadow) correspond to the four joint states on $(\mathrm{rec}(O)(\iota), \mathrm{ind}(O)(\iota))$:
  - $(\mathbf{t}, \mathbf{t})$ — full ($H^*_s$)
  - $(\mathbf{t}, \bot)$ — recognized but not yet forward-stable (SatShadow)
  - $(\bot, \mathbf{t})$ — operational but not yet recognized (TrShadow)
  - $(\bot, \bot)$ — neither (FreeShadow)
- **Restriction maps as settling-morphisms.** A restriction $\rho_{t \to s}$ in the office-text presheaf corresponds to a settling-morphism in the bilattice setting that respects both predicate fibers separately.

## Consequence — formalisms unified for the predicated-work program

The predicated-work program does not need to choose between the two formalisms or treat them as competing alternatives.
The bilattice-substrate realization is the *substrate-native* presentation; the Heyting-algebra-presheaf is the *fiber-restricted* presentation.
Theorems in either formalism translate to the other under the table above.
The bilattice version inherits the math program's regime classification, cohomology, and moduli theory; the Heyting version inherits the office text's nuclear-doctrine analysis and Roman legal correspondence.

The same translation applies to [delegation](../morphisms/delegation.md): the formal-structure-of-delegation text's restriction maps in the Heyting presheaf correspond to settling-morphisms in the bilattice setting that act compatibly on the relevant power-jural-relation cells.
The four invariants (derivativity, accountability non-transfer, boundedness, revocability) translate substrate-side as cell-pattern conditions on the derived-from chain.
