---
title: "Extension"
date-created: 2026-03-29
defines:
  - "Extension"
  - "extends"
  - "extend"
restricts: morphism
requires: [object, composition]
dual-of: restriction
contains: kan-extension
preserves: structure
recovered-by: forgetful-functor
type: term
---

An extension is a [morphism](./morphism.md) that builds something bigger out of something smaller by adding new structure. It requires [objects](./object.md) to extend between, and [composition](./composition.md) to chain extensions together.

Extension preserves structure — everything the original had is still there in the extended version. You can always recover the original by forgetting what was added. A [forgetful functor](./functor.md) does exactly this: it strips the added structure and gives you back what you started with.

Extension is [dual](./duality.md) to [restriction](./restriction.md). Extension adds structure; restriction removes scope. They are opposite directions along the same relationship. In many settings they form an adjoint pair — extending and then restricting, or restricting and then extending, satisfies a universal property.

The [Kan extension](./kan-extension.md) is the most general form: it extends a [functor](./functor.md) defined on a small category to a larger one, agreeing with the original wherever both are defined and doing the best possible job on the new objects.
