---
type: concept
class: condition
depends-on: [closure-operator, predication-fiber-algebra, knowledge-order]
kind: concept
---

# Scott-continuous closure

A [closure operator](../morphisms/closure-operator.md) component $\mathrm{cl}_p : A_p \to A_p$ on a [predication fiber algebra](../objects/predication-fiber-algebra.md) is **Scott-continuous** in the [knowledge order](knowledge-order.md) if for every $\leq_k$-directed subset $S \subseteq A_p$,

$$\mathrm{cl}_p\!\left(\bigvee_k S\right) = \bigvee_k \{\mathrm{cl}_p(x) : x \in S\}.$$

Scott-continuity arises naturally when inference rules have finite antecedents: each rule fires on a $\bigvee_k$-join iff it fires on some finite sub-join.
Fitting's logic-programming closure (1991) and description-logic TBox closures are Scott-continuous; quantifier-induced closures with infinitary antecedents (such as $\forall x \in E$ over infinite $E$) typically are not.
