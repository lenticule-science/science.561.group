---

name: fiber-nucleus-commutation-axiom
description: "Axiom: the saturation and transfer fiber nuclei commute — σ_t ∘ Δ_t = Δ_t ∘ σ_t — imposed as a primitive condition of the fiber doctrine on each proposition fiber H_t."
---

### Axiom — Fiber Nucleus Commutation {#fiber-nucleus-commutation-axiom}

**Axiom (Fiber Nucleus Commutation).** For every history $t \in T$ and every
proposition $a \in H_t$,
$$
\sigma_t(\Delta_t(a)) \;=\; \Delta_t(\sigma_t(a)).
$$

This is a primitive condition of the fiber doctrine ([fiber-doctrine](fiber-doctrine.md)):
the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is required to assign, at
each history $t$, a commutative nuclear square
$(H_t, \sigma_t, \Delta_t)$ ([commutative-nuclear-square](commutative-nuclear-square.md)).
Commutativity is not derived from the remaining fiber doctrine conditions; it is imposed.

#### Why It Is an Axiom {#fiber-nucleus-commutation-axiom-why}

The saturation nucleus $\sigma_t$ is a backward operation: it closes a proposition
under all restriction maps to sub-histories (the accumulated past). The transfer
nucleus $\Delta_t$ is a forward operation: it intersects the restriction images from
all one-step extensions (the committed future). These act over diagrams in opposite
directions in $T$, and there is no categorical interchange principle for limits in
opposite directions. The Diamond Lemma for the history monoid $\mathbb{M}(\Sigma, I)$
constrains upward structure only and cannot supply the required witness that the
saturation of a transfer-stable element remains transfer-stable
([nucleus-commutation](nucleus-commutation.md)).

At the level of the topos $R = \mathbf{Sh}(T, J)$, commutativity is a theorem
([fiber-nuclear-language-topology-commutativity](fiber-nuclear-language-topology-commutativity.md)):
the two Lawvere–Tierney topologies corresponding to the language and commutation
structures act on orthogonal aspects of the presheaf data and therefore commute.
The axiom at the fiber level and the theorem at the topos level are not in
conflict — they are the same fact seen from different vantage points.

#### What the Axiom Enables {#fiber-nucleus-commutation-axiom-enables}

Commutativity is the condition that makes $\pi_t := \sigma_t \circ \Delta_t$ a
nucleus ([nucleus-commutation](nucleus-commutation.md)). Without it:

- $\pi_t$ satisfies extensivity and meet-preservation but fails idempotence.
- The intersection $\mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is merely a
  set with no guaranteed Heyting algebra structure.
- The fixed fiber $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
  ([fixed-fiber](fixed-fiber.md)) is not well-defined as a sub-Heyting-algebra.
- The joint projection $\pi_t$ ([joint-projection](joint-projection.md)) has no
  universal property.

The entire settled layer of the relational universe — everything downstream of $H_t^*$
— depends on this axiom holding at every fiber.

#### Syntactic Justification {#fiber-nucleus-commutation-axiom-justification}

The axiom is not arbitrary. In the FiberNuclearLanguage, $\mathsf{Saturate} \circ
\mathsf{Transfer} = \mathsf{Transfer} \circ \mathsf{Saturate}$ holds as a provable
theorem of the reduction system R1–R19$'$: the critical pair is joinable directly
via R7 ([fiber-nuclear-language-commutativity](fiber-nuclear-language-commutativity.md)).
The canonical syntactic model therefore satisfies commutativity from first principles,
which justifies requiring it of all abstract fiber algebras.
