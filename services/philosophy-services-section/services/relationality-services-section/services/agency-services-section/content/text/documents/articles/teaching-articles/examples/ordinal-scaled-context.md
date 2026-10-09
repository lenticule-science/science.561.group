---
type: example
status: instance
depends-on: [scale, scale-measure, formal-context]
see-also: [zoological-context]
title: An ordinal-scaled measurement context
description: A worked example illustrating conceptual scaling (per scale) on a many-valued context with an ordinal attribute.
---

# An ordinal-scaled measurement context

A worked example illustrating conceptual scaling (per [scale](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/teaching/explanations/scale.md)) on a many-valued context with an ordinal attribute.

## The many-valued context

Object set $G = \{p_1, p_2, p_3, p_4\}$ (four patients); attribute $a = \text{blood-pressure-stage}$ valued in $W = \{\text{normal}, \text{elevated}, \text{stage-1}, \text{stage-2}\}$, ordered $\text{normal} < \text{elevated} < \text{stage-1} < \text{stage-2}$:

| | blood-pressure-stage |
|---|---|
| $p_1$ | normal |
| $p_2$ | elevated |
| $p_3$ | stage-1 |
| $p_4$ | stage-2 |

## The ordinal scale

Apply the **ordinal scale** $\mathbb{S}_a$: $N_a = W$, $w \, J_a \, n \iff w \ge n$. The scale attributes become $\{\text{at-least-normal}, \text{at-least-elevated}, \text{at-least-stage-1}, \text{at-least-stage-2}\}$.

## The derived binary context

Apply scale-measure (per [scale-measure](../../../../glossary/terms/scale-measure.md)). The derived binary context $\mathbb{K}_{\mathbb{S}}$:

| | ≥ normal | ≥ elevated | ≥ stage-1 | ≥ stage-2 |
|---|---|---|---|---|
| $p_1$ | × | | | |
| $p_2$ | × | × | | |
| $p_3$ | × | × | × | |
| $p_4$ | × | × | × | × |

## The concept lattice

The derived binary context has five concepts:

1. $(\{p_1, p_2, p_3, p_4\}, \{≥ \text{normal}\})$ (top)
2. $(\{p_2, p_3, p_4\}, \{≥ \text{normal}, ≥ \text{elevated}\})$
3. $(\{p_3, p_4\}, \{≥ \text{normal}, ≥ \text{elevated}, ≥ \text{stage-1}\})$
4. $(\{p_4\}, \{≥ \text{normal}, ≥ \text{elevated}, ≥ \text{stage-1}, ≥ \text{stage-2}\})$
5. $(\emptyset, M)$ (bottom)

This is a five-element chain — the ordinal-scaled lattice of an ordinal attribute is always a chain whose length is the number of distinct values plus one.

## What the example exhibits

- **Scale choice matters.** A *nominal* scale of the same data (treating each value as its own attribute, no ordering) would produce a different lattice — an antichain of four object-concepts plus top and bottom — losing the ordinal structure entirely.
- **Conceptual scaling is methodological.** The decision to scale ordinally or nominally is the analyst's commitment, not derivable from the raw data. The lineage records both as legitimate FCA preprocessings (Ganter & Wille 1999, §1.4) and trusts the analyst to choose appropriately.
- **Substrate reading.** The scale attributes correspond to a refined predicate vocabulary on the substrate (per [scale-measure](../../../../glossary/terms/scale-measure.md)): four binary predicates `at-least-X` related by [specialize](../../../../glossary/terms/specialize.md) morphisms. The resulting concept lattice is the substrate's settlement under the refined vocabulary.
