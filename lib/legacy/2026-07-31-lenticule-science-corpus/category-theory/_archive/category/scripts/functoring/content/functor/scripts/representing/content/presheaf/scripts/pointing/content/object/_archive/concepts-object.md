---

introduces: categorical-component
description: "One of the two kinds of data in a category — the things that morphisms go between."
defines: object
aliases: [objects]
component-of: category
characterized-by: morphism
identity-criterion: isomorphism
determined-by: yoneda-lemma
date-created: 2025-12-26
date-modified: 2026-03-29
---

An object is one of the two kinds of data in a [category](../objects/category.md) — the things that [morphisms](../morphisms/morphism.md) go between.

What counts as an object depends on the category. In Set, objects are [sets](../../../../sets/objects/set.md). In Top, objects are topological spaces. In a group G viewed as a one-object category, there is exactly one object (the group itself), and morphisms are the group elements. In a [partial order](../../../../order/objects/partial-order.md) viewed as a thin category, each element of the poset is an object.

Objects in a category are not studied in isolation — they are studied through their morphisms. Two objects that are [isomorphic](../morphisms/isomorphism.md) (connected by an invertible morphism) are interchangeable for all categorical purposes. The categorical perspective holds that an object is characterized by its relationships to other objects, not by any internal constitution.

This principle is made precise by the Yoneda lemma: an object A is completely determined (up to [isomorphism](../morphisms/isomorphism.md)) by the [functor](../morphisms/functor.md) Hom(−, A) that records all morphisms into A. Two objects are isomorphic if and only if they have the same morphisms into them from every other object. An object has no hidden internal state that the morphisms fail to capture — if two objects look the same from the outside, they are the same.
