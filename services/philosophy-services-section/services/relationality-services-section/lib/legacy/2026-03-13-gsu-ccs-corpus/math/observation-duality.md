---
id: observation-duality
name: ObservationDuality
description: "the fixed observation subsheaf (H∨)* separates H* and is co-separated by H*; proved by Birkhoff duality fiberwise and dual Beck-Chevalley (§beck-chevalley-tower) for global assembly."
---

### Theorem — Observation Duality {#observation-duality}

#### The Observation Sheaf {#def-observation-sheaf}

Let $\Omega \in R$ be the subobject classifier. Define the **observation sheaf** as the internal hom:
$$
H^\vee \;:=\; [H, \Omega] \;\in\; R.
$$
Sections over $t$ are $H^\vee(t) = \mathrm{Hom}_R(H \times y(t), \Omega) \cong \mathrm{Sub}_R(H
\times y(t))$ — the observable predicates on $H$ at history $t$. The nuclei $\sigma, \Delta$ on $H$
induce **dual nuclei** on $H^\vee$ by precomposition:
$$
\sigma^\vee(\phi) := \phi \circ (\sigma \times \mathrm{id}_{y(t)}),
\qquad
\Delta^\vee(\phi) := \phi \circ (\Delta \times \mathrm{id}_{y(t)}).
$$
The pair $(\sigma^\vee, \Delta^\vee)$ makes $H^\vee$ an object of $\mathbf{HA_{nucl}}$ internal to
$R$. Define the **fixed observation subsheaf**:
$$
(H^\vee)^\ast \;:=\; \mathrm{Fix}(\sigma^\vee) \cap \mathrm{Fix}(\Delta^\vee) \;\hookrightarrow\; H^\vee.
$$

#### Theorem — Observation Duality {#thm-obs-duality}

There is a natural bimorphism (internal pairing in $R$):
$$
\langle -, - \rangle \;:\; H^\ast \times (H^\vee)^\ast \;\longrightarrow\; \Omega,
$$
given fiberwise by evaluation: $\langle a, \phi \rangle_t = \phi_t(a)$ for $a \in H_t^\ast$ and
$\phi \in (H^\vee)^\ast_t$. This pairing satisfies:

1. **Separation.** If $\langle a, \phi \rangle = \langle b, \phi \rangle$ for all $\phi \in
   (H^\vee)^\ast$, then $a = b$ in $H^\ast$.

2. **Co-separation.** If $\langle a, \phi \rangle = \langle a, \psi \rangle$ for all $a \in H^\ast$,
   then $\phi = \psi$ in $(H^\vee)^\ast$.

3. **Stability.** For any morphism $f : t \to t'$ in $T$:
   $\langle H(f)(a'), \phi \rangle_t = \langle a', H^\vee(f)(\phi) \rangle_{t'}$.

**Proof.**

**(3) Stability** is naturality of the internal hom: the reindexing square for $f : t \to t'$
commutes by the universal property of $[H, \Omega]$.

**(1) Separation and (2) Co-separation.** The argument has two parts: fiberwise separation and
global assembly.

*Fiberwise.* Each $H_t^\ast$ is a finite Heyting algebra (§fiber-doctrine). By Birkhoff duality
for finite distributive lattices, the principal downsets $\delta_a := \{a' \mid a' \leq a\}$
separate all pairs $a \neq b$ in $H_t^\ast$: $\delta_a(a) = \top$ and $\delta_a(b) = \bot$. Each
$\delta_a \in \mathrm{Sub}_R(H \times y(t)) = H^\vee(t)$, and since $a \in \mathrm{Fix}(\sigma_t)
\cap \mathrm{Fix}(\Delta_t)$ the downset $\delta_a$ is stable under both nuclei:
$\delta_a \in (H^\vee)^\ast_t$.

*Global assembly.* It remains to show that the family $\{\delta_a\}_{t \in T}$ assembles into
sections of the sheaf $(H^\vee)^\ast$ — i.e., that the fiberwise separating morphisms are
compatible with restriction in $H^\vee$.

Compatibility is the condition that restriction in $H^\vee$ commutes with $\sigma^\vee$ and
$\Delta^\vee$. Since $\sigma^\vee(\phi) = \phi \circ (\sigma \times \mathrm{id})$ and
$\Delta^\vee(\phi) = \phi \circ (\Delta \times \mathrm{id})$, the dual
Beck–Chevalley condition for $\Delta^\vee$ at a morphism $f : t \to t'$ unfolds to:
$$
H^\vee(f) \circ \Delta^\vee_{t'} \;=\; \Delta^\vee_t \circ H^\vee(f),
$$
which by precomposition is equivalent to $H(f) \circ \Delta_t = \Delta_{t'} \circ H(f)$ —
the original $\Delta$-BC equation. This is exactly the condition proved in §beck-chevalley-tower:
$\Delta$-BC holds everywhere in the colimit $R = \mathbf{Sh}(T,J)$ (Theorem §thm-delta-bc-colimit).
The $\sigma$-BC condition holds at every finite depth level (§level-stability), hence trivially in
the colimit, giving dual $\sigma^\vee$-BC for free.

With both dual BC conditions holding, the fiberwise sections $\{\delta_a\}_t$ satisfy the gluing
condition for the sheaf $(H^\vee)^\ast$. By the locality axiom (§locality), they glue to a global
section. Therefore $(H^\vee)^\ast$ has enough global sections to separate any $a \neq b$ in
$H^\ast_t$, establishing (1). Co-separation (2) follows by symmetry: Birkhoff duality applies
equally to $(H^\vee)^\ast_t$, and the same assembly argument applies to the separating
morphisms in $H^\ast$. $\square$

**Interpretation.** A proposition in $H^\ast$ is fully determined by the set of observations it
satisfies; an observation in $(H^\vee)^\ast$ is fully determined by the set of fixed propositions it
accepts. At the level of fixed configurations, what is constructible is exactly what is observable.

> **Remark — Ambidexterity.** In any relational quantale, the doubly-fixed subquantale $Q^\ast$
> satisfies $\bigvee_{Q^\ast} S = \sigma\Delta(\bigvee_Q S)$ for any $S \subseteq Q^\ast$: joins in
> $Q^\ast$ are computed by lifting to $Q$ and applying both nuclei. This is ambidexterity at the
> quantale level. The duality theorem above is its sheaf-level manifestation: on fixed propositions,
> construction (tensoring and nuclear closure from below) and observation (testing against
> $\Omega$-predicates from above) agree.
