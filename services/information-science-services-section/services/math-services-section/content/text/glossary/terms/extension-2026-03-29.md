---
name: "Extension"
date-created: 2026-03-29
type: term
aliases:
  - "extension"
restricts: morphism
requires: [object, composition]
dual-of: restriction
contains: kan-extension
preserves: structure
recovered-by: forgetful-functor
description: An extension is a morphism that builds something bigger out of something smaller by adding new structure.
---

An extension is a [morphism](morphism.md) that builds something bigger out of something smaller by adding new structure. It requires [objects](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/extending/content/kan-extension/explanations/domains/objects/domains/categories/domains/ordinary-categories/terms/object.md) to extend between, and [composition](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/extending/content/kan-extension/explanations/domains/objects/domains/categories/domains/ordinary-categories/terms/composition.md) to chain extensions together.

Extension preserves structure — everything the original had is still there in the extended version. You can always recover the original by forgetting what was added. A [forgetful functor](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/extending/content/kan-extension/explanations/domains/objects/domains/categories/domains/ordinary-categories/terms/functor.md) does exactly this: it strips the added structure and gives you back what you started with.

Extension is [dual](duality.md) to [restriction](restriction.md). Extension adds structure; restriction removes scope. They are opposite directions along the same relationship. In many settings they form an adjoint pair — extending and then restricting, or restricting and then extending, satisfies a universal property.

The [Kan extension](kan-extension.md) is the most general form: it extends a [functor](../../documents/articles/research/2026/07/31/lenticule-import/_archive/category/scripts/functoring/content/functor/scripts/extending/content/kan-extension/explanations/domains/objects/domains/categories/domains/ordinary-categories/terms/functor.md) defined on a small category to a larger one, agreeing with the original wherever both are defined and doing the best possible job on the new objects.
