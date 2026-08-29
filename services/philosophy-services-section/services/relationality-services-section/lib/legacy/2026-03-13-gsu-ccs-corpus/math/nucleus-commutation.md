---
id: nucleus-commutation
name: NucleusCommutation
description: "Nucleus Commutation — the axiom that σ_t and Δ_t commute."
defines: NucleusCommutation
---

### Definition — Nucleus Commutation {#nucleus-commutation}

Two nuclei $j, k : A \to A$ on a Heyting algebra $A$ **commute** if
$$
j \circ k \;=\; k \circ j,
$$
that is, $j(k(a)) = k(j(a))$ for all $a \in A$.

#### What Nucleus Commutation Enables {#nucleus-commutation-enables}

When two nuclei commute, their composite is again a nucleus. The joint fixed-point set
satisfies
$$
\mathrm{Fix}(j \circ k) \;=\; \mathrm{Fix}(j) \cap \mathrm{Fix}(k),
$$
and this intersection is a sub-Heyting-algebra. Without commutativity, the intersection
$\mathrm{Fix}(j) \cap \mathrm{Fix}(k)$ is merely a set — the reflection functor and
algebraic closure properties need not hold. Commutativity is the hinge condition that
makes a pair of nuclei into a nuclear square ([CommutativeNuclearSquare](commutative-nuclear-square.md)).

The full theorem — composite is a nucleus, joint fixed-point algebra is the image,
universal property — is in §nuclear-quartet-theorem.

#### The Fiber Instance {#commutativity-fiber}

In the Relational Universe, **the saturation and transfer nuclei commute** on each
fiber $H_t$: for all $a \in H_t$,
$$
\sigma_t(\Delta_t(a)) \;=\; \Delta_t(\sigma_t(a)).
$$
This is imposed as an explicit condition on the presheaf $H : T^{\mathrm{op}} \to
\mathbf{HA}$, beyond functoriality and fiberwise Heyting structure. It is part of the
fiber doctrine (§fiber-doctrine).

**Why commutativity is necessary for the composite to be a nucleus.** Without
commutativity, $\sigma_t \circ \Delta_t$ satisfies extensivity ($a \leq \Delta_t(a) \leq
\sigma_t(\Delta_t(a))$) and meet-preservation ($\sigma_t(\Delta_t(a \wedge b)) =
\sigma_t(\Delta_t(a) \wedge \Delta_t(b)) = \sigma_t(\Delta_t(a)) \wedge
\sigma_t(\Delta_t(b))$) — both follow from the individual nucleus axioms. But
idempotence fails in general: $(\sigma_t \circ \Delta_t)^2(a) =
\sigma_t(\Delta_t(\sigma_t(\Delta_t(a))))$, and collapsing this to $\sigma_t(\Delta_t(a))$
requires $\Delta_t(\sigma_t(\Delta_t(a))) = \Delta_t(a)$, i.e.,
$\Delta_t \circ \sigma_t \circ \Delta_t = \Delta_t$, which holds exactly when
$\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$. Commutativity is not a strengthening
of something already true; it is precisely the condition that makes the composition
idempotent and hence a nucleus.

**Motivation.** For any $s \perp t$ and $t_0 < t$, the Diamond Lemma for history monoids
gives a commuting square in $T$ whose $H$-image shows that restriction maps from
extensions and restriction maps to sub-histories commute. This makes nucleus commutativity
natural but does not derive it; the commutativity condition is the fiber-level instance
of the nuclear-square coherence that the hyperverse tower requires at every level
([CommutativeNuclearSquare](commutative-nuclear-square.md)).

#### Syntactic Justification and Future Derivation {#nucleus-commutation-justification}

The axiom is not arbitrary. In the FiberNuclearLanguage syntactic model, $\mathsf{Saturate} \circ \mathsf{Transfer}
= \mathsf{Transfer} \circ \mathsf{Saturate}$ holds as a **provable theorem** of the reduction
system — not an assumption — via a critical-pair joinability argument ([fiber-nuclear-language-commutativity](fiber-nuclear-language-commutativity.md)).
The canonical syntactic model therefore satisfies the axiom from first principles, which
justifies imposing it on abstract fiber algebras.

Why the axiom cannot currently be *derived* in the abstract setting, and the route by
which it eventually could be (via syntactic model completeness without circularity), are
documented in [fiber-nuclear-language-commutativity](fiber-nuclear-language-commutativity.md).
