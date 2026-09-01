---

introduces: property
description: "The property that doing something twice is the same as doing it once: a · a = a. Meet and join are idempotent; the product on a residuated lattice may or may not be."
aliases: [idempotence, idempotent, idempotency]
applies-to: binary-operation
date-created: 2026-03-30
---

A [binary operation](../objects/binary-operation.md) $\ast$ is idempotent if applying it to an element with itself changes nothing:

$$a \ast a = a$$

[Meet](../../order/morphisms/meet.md) and [join](../../order/morphisms/join.md) on a [lattice](../../order/objects/lattice.md) are always idempotent: $a \wedge a = a$ and $a \vee a = a$. Taking the intersection of a set with itself gives the same set. Taking the union of a set with itself gives the same set.

In a [residuated lattice](../objects/residuated-lattice.md), the product $\cdot$ may or may not be idempotent. When $a \cdot a \leq a$ for all $a$, the lattice satisfies contraction — the [substructural logic](../../logic/concepts/substructural-logic.md) structural rule that says using a hypothesis twice is the same as using it once. [Linear logic](../../logic/concepts/linear-logic.md) drops this: using a resource twice requires two copies.

On the four-valued [bilattice](../objects/bilattice.md), $t$, $f$, and $\top$ are idempotent under $\odot$ (extending by the same state twice gives the same state). $\bot$ is not: $\bot \odot \bot = f$. The no-information state is the only one that changes under self-extension.
