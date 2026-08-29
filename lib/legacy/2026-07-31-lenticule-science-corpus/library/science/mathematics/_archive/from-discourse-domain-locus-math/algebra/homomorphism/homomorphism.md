---

description: "A function between algebraic structures that preserves the operations — the structure-respecting maps of algebra."
defines: homomorphism
aliases: [homomorphisms]
is-a: function
preserves: operation
bijective-case: isomorphism
self-case: endomorphism
kernel-gives: quotient
categorical-role: morphism
date-created: 2025-12-31
date-modified: 2026-03-29
---

A homomorphism is a [function](../../../morphisms/function.md) between algebraic structures that preserves the operations. If $(A, \ast)$ and $(B, \cdot)$ are [magmas](../objects/magma.md), a homomorphism $f : A \to B$ satisfies $f(a \ast b) = f(a) \cdot f(b)$ for all $a, b \in A$. The operation in the source becomes the operation in the target. The structure is carried across.

For richer structures, the homomorphism must preserve all the operations and distinguished elements. A [monoid](../objects/monoid.md) homomorphism preserves the binary operation and the identity element. A [group](../objects/group.md) homomorphism preserves the operation, identity, and inverses. A ring homomorphism preserves addition, multiplication, and both identity elements. A [lattice](../../order/objects/lattice.md) homomorphism preserves [meet](../../order/morphisms/meet.md) and [join](../../order/morphisms/join.md). Each algebraic structure defines what "preserving the structure" means, and the homomorphism is the function that does it.

A homomorphism that is also a bijection is an [isomorphism](../../categories/theories/ordinary-categories/morphisms/isomorphism.md) — it establishes that two structures are algebraically identical. A homomorphism from a structure to itself is an endomorphism. A bijective endomorphism is an automorphism. The kernel of a homomorphism — the [set](../../sets/objects/set.md) of [elements](../../sets/concepts/element.md) mapped to the identity — encodes what information the homomorphism discards. The first isomorphism theorem says the image is isomorphic to the quotient of the source by the kernel. This is one of the most important structural results in algebra: every homomorphism factors as a surjection onto the image followed by an injection into the target.

Homomorphisms are the morphisms of algebraic categories. The category Grp has groups as objects and group homomorphisms as morphisms. The category Ring has rings as objects and ring homomorphisms as morphisms. A [functor](../../categories/theories/ordinary-categories/morphisms/functor.md) between categories is a higher-level homomorphism — it preserves [composition](../../categories/theories/ordinary-categories/morphisms/composition.md) and identity morphisms, just as a homomorphism preserves the binary operation and identity element. The pattern repeats: at every level, the structure-preserving maps are what matter.
