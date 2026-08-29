---

name: dynamic-residuation
act: DynamicResiduation
slug: dynamic-residuation
top: FlowIndexImplication
bottom: ContextGeometry
summary: Restrict dynamic residuation to the context geometry by letting `FlowIndexImplication` witness `ContextGeometry`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Dynamic residuation states that flowing a context and then testing implication
is equivalent to testing implication against a closed context.  We express this
by composing [FlowIndexImplication](flow-index-implication.md) with
[ContextGeometry](context-geometry.md):
`(FlowIndexImplication ContextGeometry)` earns
***DynamicResiduation***.

The act records that the law “`c ≤ a ⇒_F b` iff `F(c ∧ a) ≤ b`” continues to
hold when both sides are restricted to the context flow and nucleus.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
