---
id: vessel-as-container-type
description: "Formal mathematical treatment of the vessel as a presheaf container (T, H) over nuclear Heyting algebras, with container morphisms and Lawvere-Tierney topologies."
type: text
addresses: vessel
date-created: 2026-03-29
---

This text gives the formal mathematical treatment of the [vessel](../../militarism/terms/vessel.md) concept.
The vessel is modeled as an Abbott-Altenkirch-Ghani container instantiated in the nuclear Heyting doctrine.

## Formal definition

A **Vessel** is a pair $\mathcal{V} = (T, H)$:

$$\mathcal{V} = (T : \mathrm{Cat},\; H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}})$$

where: - $T$ is the **shape** — a small category of histories; the vessel's structural skeleton; the index of positions available within the vessel - $H$ is the **position family** — a presheaf assigning to each history $t \in T$ a nuclear Heyting algebra $H_t$, the fiber of positions at $t$; and assigning to each morphism $f : t \to t'$ in $T$ a restriction map $H(f) : H_{t'} \to H_t$ (a Heyting algebra homomorphism preserving the nuclear pair)

A **content** of $\mathcal{V}$ of type $X$ is a family $(x_t)_{t \in T}$ with $x_t \in H_t$ for each $t$, compatible with the restriction maps: $H(f)(x_{t'}) = x_t$ for all $f : t \to t'$.
A content is a **global section** of $H$.

The vessel's **extension** $[\mathcal{V}]X$ is the set of all fillings:

$$[\mathcal{V}]X = [\,T \triangleright H\,]X = \Sigma(t : T).\,(H_t \to X)$$

A filling specifies: which shape $t$ the content is at, and a function from the positions $H_t$ at that shape to the content type $X$.

**Four invariants.** $\mathcal{V}$ is a vessel iff:

1. **Identity separation**: the pair $(T, H)$ determines the vessel's identity; the values at each fiber $H_t$ are positions, not contents.
  The vessel exists at every history in $T$ regardless of whether any content occupies it.

2. **Content-independence**: the position family $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ is intrinsic.
  Any change in what occupies $H_t$ (any change in sections) leaves $(T, H)$ unchanged.

3. **Containment coherence**: the restriction maps $H(f) : H_{t'} \to H_t$ give the vessel's internal coherence.
  A position at $t'$ restricts to a position at $t$ via $H(f)$.
  This is the vessel's **containment geometry**.

4. **Constitutional separability**: the vessel is constitutable by a physical hull without being identical to it.
  The hull $K$ may constitute $\mathcal{V}$ at time $t$: $\mathrm{CON}(K, \mathcal{V}, t)$.
  This constitution is asymmetric.
  The same hull may constitute different vessels (reflagging); different hulls may successively constitute the same vessel (repair).

## Abbott, Altenkirch, Ghani: the container type

The type-theoretic formalization (Ghani, Altenkirch, Abbott, "Categories of Containers," *FoSSaCS 2003*, LNCS 2620, pp.
23–38; extended in Abbott, Altenkirch, Ghani, "Containers: Constructing Strictly Positive Types," *TCS* 342(1):3–27, 2005):

A **container** $(S \triangleright P)$ consists of a shape type $S$ and a position family $P : S \to \mathbf{Type}$.
The extension over type $X$:

$$[S \triangleright P]\,X = \Sigma(s : S).\,(P\,s \to X)$$

A shape $s$, paired with a function filling every position in $P\,s$ with a value of type $X$.
The extension is a functor: given $f : X \to Y$, $(s, g) \mapsto (s, f \circ g)$.

**Representation Theorem 3.4** (Abbott–Altenkirch–Ghani 2005): $[S \triangleright P] : \mathbf{Set} \to \mathbf{Set}$ is strictly positive, and every strictly positive type constructor has a container representation up to isomorphism.
The category of containers is equivalent to the category of strictly positive type constructors.

A **container morphism** $(u, q) : (S \triangleright P) \to (T \triangleright Q)$ consists of a shape transformation $u : S \to T$ and a position remapping $q : \Pi(s : S).\,(Q(u\,s) \to P\,s)$ — contravariant in positions.

In the relational universe, the vessel $(T, H)$ is the container $(T \triangleright H)$: shape type is $T$ (histories), position family is $H$ (nuclear Heyting algebra fibers), extension $[T \triangleright H]\,X = \Sigma(t : T).\,(H_t \to X)$.

## The vessel in the relational universe

| Vessel component | Relational universe |
|---|---|
| $T$ (shape / history category) | The base of the presheaf — ordered structure of histories |
| $H_t$ (fiber at $t$) | Nuclear Heyting algebra at history $t$ — positions available at that moment |
| $H(f) : H_{t'} \to H_t$ (restriction map) | Containment coherence — how positions restrict across histories |
| Global sections of $H$ | Contents of the vessel — families $(x_t)$ compatible with all $H(f)$ |
| $\sigma_t, \Delta_t$ (nuclear pair at $t$) | Generative structure at $t$ — what settles into and transfers out of the fiber |

The vessel persists as the presheaf $(T, H)$ even when all sections change.
The IMO number (for a ship) or repository identity (for a software vessel) names the presheaf — the identity of the $(T, H)$ pair, not of any particular section family.

## Container morphisms, interior parts, and Lawvere-Tierney topologies

Three structural correspondences between the vessel concept and the relational universe framework.
Each is a structural identification, not an analogy.

**Container morphism = relational universe morphism.** A morphism of vessels $(\phi, \alpha) : (T_1, H_1) \to (T_2, H_2)$ consists of a history morphism $\phi : T_1 \to T_2$ and a natural transformation $\alpha : \phi^* H_2 \Rightarrow H_1$ — for each $t_1 \in T_1$, a Heyting algebra homomorphism $\alpha_{t_1} : H_2(\phi(t_1)) \to H_1(t_1)$.

The identification: $u = \phi$ (shape transformation = history morphism) and $q = \alpha$ (contravariant position remapping = natural transformation from the pullback).
A relational universe morphism IS a container morphism over the nuclear Heyting doctrine.
The Representation Theorem applies: the category of relational universe vessels embeds fully into the category of containers.

**Interior part = open sub-vessel in the Lawvere-Tierney topology.** The Casati–Varzi interior part relation $\mathrm{IP}(H', H)$ corresponds to $H'$ being an open sub-object of $H$ in the Lawvere–Tierney topology $j$ on the topos $R = \mathbf{Sh}(T, J)$.

A sub-presheaf $H' \hookrightarrow H$ is $j$-open iff $j(\chi_{H'}) = \chi_{H'}$ — the characteristic morphism classifying $H'$ within $H$ is a fixed point of $j$.
The Casati–Varzi condition: $H'$ has no "boundary sections" — no sections at any $t$ that are in $H'$ but whose nuclear closure reaches sections outside $H'$.

Three Lawvere–Tierney topologies on the vessel:

| Topology | Sub-vessel type | Casati–Varzi type | What it classifies |
|---|---|---|---|
| $j_\sigma$ (from saturation nucleus) | $j_\sigma$-open sub-vessel | Interior part (saturation-bounded) | Sub-vessels closed under backward-history saturation |
| $j_\Delta$ (from transfer nucleus) | $j_\Delta$-open sub-vessel | Interior part (transfer-bounded) | Sub-vessels closed under forward-extension transfer |
| $j_{\sigma \wedge \Delta}$ (from nuclear pair joint) | $j_{\sigma\wedge\Delta}$-open sub-vessel | Double-interior part | Sub-vessels closed under both operators |

A doubly-interior sub-vessel is a $j_{\sigma\wedge\Delta}$-open sub-object, classifying sub-vessels whose sections are all in RelationalHistoryFixedFiber.
The vessel's "hard interior" — the part that persists doubly-stably.

**DOLCE constitution as site geometric morphism (partial).** The constitution relation $\mathrm{CON}(\mathrm{hull}, \mathcal{V}, t)$ is a morphism from the hull's physical geometry to the vessel's presheaf structure.
At time $t$, the hull has a material section $m_t \in M(t)$, and there is a map $\mathrm{CON}_t : M(t) \to \mathbf{HA}_{\mathrm{nucl}}$ sending each physical configuration to the nuclear Heyting algebra of institutional positions it supports.
The DOLCE asymmetry axioms correspond to the unidirectionality of this morphism: the hull determines the vessel's positions, but the vessel's institutional structure does not determine the hull's material.

**Proposition.** A relational universe vessel morphism $(\phi, \alpha)$ is a container morphism with $\phi$ the shape transformation and $\alpha$ the contravariant position remapping.
The interior part relation $\mathrm{IP}(H', H)$ is equivalent to $H'$ being open in $j_\sigma$; double-interior sub-vessels are open in $j_{\sigma \wedge \Delta}$ and correspond to sub-vessels in RelationalHistoryFixedFiber. $\square$

## Open questions

- Whether the vessel's capacity $|[T \triangleright H]\,\mathrm{Person}| \geq k$ gives the vessel-theoretic expression of minimum manning — a formal lower bound on compatible global person-sections.
- Whether $\mathrm{CON}_t : M(t) \to \mathbf{HA}_{\mathrm{nucl}}$ satisfies the Beck–Chevalley conditions with respect to the nuclear pair.
- Whether hull identity corresponds to the history separation axiom at the physical level: two hulls produce the same vessel iff they produce the same fiber algebra assignments.
