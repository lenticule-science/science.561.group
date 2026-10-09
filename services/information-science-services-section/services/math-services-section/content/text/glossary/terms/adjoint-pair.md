---

description: "A pair of functors F ⊣ G between categories, connected by a natural bijection Hom(F(a), b) ≅ Hom(a, G(b))."
aliases: [ adjoint pair, adjoint functors, adjunction, Adjoint pair ]
specialization: functor
left-adjoint: [free, generative, extending, existential]
right-adjoint: [forgetful, constraining, restricting, universal]
law: "Hom(F(a), b) ≅ Hom(a, G(b))"
order-theoretic-form: galois-connection
residuated-lattice-form: "a · b ≤ c iff b ≤ a → c"
lambek-form: "a · b ≤ c iff b ≤ a\\c iff a ≤ c/b"
lawvere-form: "∃ ⊣ ∀"
linear-logic-form: "⊗ ⊣ ⊸"
bilattice-form: "⊙ ⊣ ⇒"
instances: [free-forgetful, quantifiers, residuation, tensor-hom, extent-intent]
slogan: "adjoints arise everywhere (Mac Lane)"
date-created: 2026-03-30

---

An adjoint pair (or adjunction) is a pair of [functors](./functor.md) $F: C \to D$ and $G: D \to C$ between [categories](./category.md) $C$ and $D$, connected by a [natural](./natural-transformation.md) bijection:

$$\mathrm{Hom}_D(F(a), b) \cong \mathrm{Hom}_C(a, G(b))$$

for all objects $a$ in $C$ and $b$ in $D$. $F$ is the **left adjoint** and $G$ is the **right adjoint**, written $F \dashv G$.

The left adjoint is "free" — it generates structure. The right adjoint is "forgetful" — it constrains or tests. The adjunction says: a [morphism](./morphism.md) out of the free construction $F(a)$ corresponds exactly to a morphism into the forgetful image $G(b)$.

Lawvere (1969) showed that existential and universal quantification are adjoint to substitution in a hyperdoctrine: $\exists \dashv \forall$. Existential quantification (left adjoint) extends a predicate to a larger context. Universal quantification (right adjoint) restricts to where the predicate holds everywhere.

In a [residuated lattice](./residuated-lattice.md), the product $\cdot$ and implication $\to$ form an adjunction: $a \cdot b \leq c$ iff $b \leq a \to c$. The product is the left adjoint operation (combining, extending). The implication is the right adjoint (testing, restricting).

In [linear logic](./linear-logic.md), tensor $\otimes$ and linear implication $\multimap$ form the fundamental adjunction $\otimes \dashv \multimap$.

Adjunctions are pervasive: Galois connections, free-forgetful pairs, tensor-hom adjunctions, and direct-inverse image pairs are all instances. Mac Lane's slogan: "Adjoints arise everywhere."
