---
id: doctrine
name: Doctrine
description: "A doctrine over a base category C is a contravariant functor D : C^op → L; derived from the observation that propositions at all histories assemble into exactly such a functor"
defines: Doctrine
---

### Definition — Doctrine {#doctrine}

Propositions (§proposition) are defined at individual histories: $a \in H_t$ for a
specific $t \in \mathrm{Ob}(T)$. When propositions are indexed over all histories and
equipped with the restriction maps $H(f) : H_{t'} \to H_t$ for each prefix extension
$t \leq t'$, they assemble into a contravariant functor

$$
H : T^{\mathrm{op}} \longrightarrow \mathbf{HA}.
$$

This functor assigns to each history its Heyting algebra of propositions, and to each
morphism a logic-preserving substitution. The nuclear structure makes it a functor into
$\mathbf{HA_{nucl}}$ rather than plain $\mathbf{HA}$ (§fiber-doctrine, §reindexing).

**Definition.** A **doctrine** over a category $C$ with values in a category $\mathbf{L}$
is a contravariant functor $D : C^{\mathrm{op}} \to \mathbf{L}$. The category $C$ is the
**base** of the doctrine; $\mathbf{L}$ is the **logical category**. A doctrine is a
**Heyting doctrine** when $\mathbf{L} = \mathbf{HA}$, and a **nuclear doctrine** when
$\mathbf{L} = \mathbf{HA_{nucl}}$ (§nuclear-heyting-algebra).

The fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is the canonical nuclear
doctrine of the relational universe: the one from which the entire construction proceeds.

#### Doctrines and Hyperdoctrines {#doctrine-vs-hyperdoctrine}

A doctrine assigns propositions to objects but carries no quantifiers. A
**hyperdoctrine** (§hyperdoctrine) is a Heyting doctrine where additionally every
substitution map has both a left adjoint (existential) and a right adjoint (universal)
satisfying Beck-Chevalley. The fiber doctrine is a doctrine but not a hyperdoctrine; the
canonical hyperdoctrine of the relational universe is $\mathrm{Sub}_R : R^{\mathrm{op}}
\to \mathbf{HA}$, which arises after the topos $R$ is constructed (§hyperdoctrine).

#### The Connection to Closure Hyperdoctrines {#doctrine-closure}

Castelnovo et al. (2021) define a **closure hyperdoctrine** as a Heyting hyperdoctrine
(with quantifiers) additionally equipped with a fiberwise closure operator satisfying
naturality. The fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ is a
**double-closure doctrine** (§double-closure-doctrine): a Heyting doctrine with two
natural commuting nuclei, proved from §saturation-nucleus, §transfer-nucleus,
§reindexing, and §nucleus-commutation. This is the propositional generalization of
Castelnovo's single-closure case (two nuclei instead of one, no quantifier adjoints).
The quantifiers enter only at the topos level via §hyperdoctrine.
