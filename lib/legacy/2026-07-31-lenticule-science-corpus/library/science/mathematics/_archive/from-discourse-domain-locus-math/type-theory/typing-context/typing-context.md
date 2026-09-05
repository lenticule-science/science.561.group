---
type: concept
class: deductive-environment
status: current
depends-on: [variable]
---

# Typing context

*A typing context* $\Gamma$ is a finite, ordered list of [variable](variable.md)-type pairs

$$
\Gamma = x_1 : A_1, \; x_2 : A_2, \; \ldots, \; x_n : A_n
$$

with each $x_i$ distinct. The context records the assumptions in force when producing a [typing-judgment](typing-judgment.md) $\Gamma \vdash t : A$. A judgment with empty context, $\vdash t : A$, asserts that $t$ has type $A$ unconditionally — the *closed* terms of type $A$ are the [inhabitants](inhabitation.md) of $A$ in the empty context.

In [dependent-type-theory](../objects/dependent-type-theory.md), the order matters in a stronger sense: each $A_i$ may depend on the variables $x_1, \ldots, x_{i-1}$ introduced earlier. A context is then a *telescope* — a sequence of types each living in the context of its predecessors.

## Position

Three structural rules describe how contexts may be manipulated: *weakening* (an unused variable may be added), *exchange* (the order of independent variables may be permuted), and *contraction* (two assumptions of the same type may be merged). Substructural type theories — linear, affine, ordered — are exactly those that drop one or more of these rules; the logic-side counterparts live at [logic/concepts/substructural-logic](../../logic/concepts/substructural-logic.md). Reference: [Pierce 2002](references/pierce2002.md) §9.1, [Sørensen & Urzyczyn 2006](references/sorensen-urzyczyn2006.md) §3.4.
