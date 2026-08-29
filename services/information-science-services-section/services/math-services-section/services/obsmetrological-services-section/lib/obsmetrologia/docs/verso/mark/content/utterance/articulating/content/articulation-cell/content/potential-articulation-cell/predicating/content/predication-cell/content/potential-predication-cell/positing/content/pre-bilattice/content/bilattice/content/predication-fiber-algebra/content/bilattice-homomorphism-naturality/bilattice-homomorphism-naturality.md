---
type: concept
class: condition
depends-on: [bilattice-homomorphism, predication-fiber-algebra, entity-set]
---

# Bilattice homomorphism naturality

A [bilattice homomorphism](../morphisms/bilattice-homomorphism.md) $\phi : A_q \to A_p$ between [predication fiber algebras](../objects/predication-fiber-algebra.md) is **natural** if for every permutation $\sigma$ of the [entity set](../objects/entity-set.md) $E$, the induced relabelings $\sigma^* : A_q \to A_q$ and $\sigma^* : A_p \to A_p$ satisfy

$$\sigma^* \circ \phi = \phi \circ \sigma^*.$$

Naturality forbids $\phi$ from treating particular entities specially; only the *structure* of the argument's fiber enters the image.
Equivalently, $\phi$ is $\mathrm{Sym}(E)$-equivariant.
