---
title: "Composition"
aliases:
  - "composition"
  - "compose"
date-created: 2025-12-26
type: term
component-of: category
requires: [morphism, object]
acts-on: morphism
produces: morphism
governed-by: [associativity, identity-morphism]
---

Composition is the operation that combines two consecutive [morphisms](./morphism.md) into one. If f goes from A to B and g goes from B to C, their composite g ∘ f goes from A to C. You do f first, then g. The notation reads right to left: g ∘ f means "g after f."

Composition must follow two rules. First, associativity: if you have three morphisms in a row, it does not matter which pair you compose first. h ∘ (g ∘ f) = (h ∘ g) ∘ f. Second, the unit law: every [object](./object.md) has an [identity morphism](./identity-morphism.md) that does nothing when composed with other morphisms. f ∘ id = f, and id ∘ g = g.

These two rules, together with a collection of objects and morphisms, are the entire definition of a [category](./category.md). There is nothing else. A category is objects, morphisms, and a composition operation that is associative and has identities.

What composition looks like depends on the category. In the category of sets, composition is function composition: (g ∘ f)(x) = g(f(x)). In a group viewed as a one-object category, composition is the group operation. In a [partial order](../../posets/terms/partial-order.md), composition is transitivity: if a ≤ b and b ≤ c, then a ≤ c.

Composition is what turns a collection of arrows into a structure. Without it, morphisms would just be pairs of objects with no way to chain them together. With it, you can follow paths through a category, and the path you take gives the same result no matter how you break it into steps.
