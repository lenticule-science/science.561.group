---
id: proposition
name: Proposition
description: "Object: Proposition"
defines: Proposition
---

### Definition — Proposition {#proposition}

A **proposition** is an element of the fiber Heyting algebra $H_t$ at a history $t$:
$$
a \in H_t.
$$

Propositions are the fundamental objects of the fiber algebra. They are what the
nuclei $\sigma_t$ and $\Delta_t$ act on; they are combined by $\wedge_t$, $\vee_t$,
$\Rightarrow_t$, $\bot_t$, $\top_t$; they are transported between fibers by restriction
maps $H(f) : H_{t'} \to H_t$.

Every structure in $R$ — nuclei, restriction maps, the fixed fiber,
the stability locale, the topos $R$ — ultimately exists to describe how propositions
behave and what makes them stable.

#### The Named Kinds of Proposition {#proposition-kinds}

Four named kinds arise from the nuclear structure at $t$:

- A **saturation-stable proposition** is one fixed by $\sigma_t$: the past has
  nothing more to add.
- A **transfer-stable proposition** is one fixed by $\Delta_t$: every one-step
  extension already contains it.
- A **doubly-stable proposition** belongs to $H_t^\ast = \mathrm{Fix}(\sigma_t)
  \cap \mathrm{Fix}(\Delta_t)$: both the past and the future have stabilized around it.
- An **unstable proposition** is one moved strictly upward by $\sigma_t$ or $\Delta_t$
  (or both): it has not yet reached its saturation or transfer value.

#### Propositions as the Semantic Domain {#proposition-semantic}

In FiberNuclearLanguage ([fiber-nuclear-language](fiber-nuclear-language.md)), the type $\mathsf{Prop}$ is interpreted in $H_t$:
a closed term $\vdash_t M : \mathsf{Prop}$ denotes a specific element of $H_t$.
The $\mathsf{Saturate}$ and $\mathsf{Transfer}$ term formers apply $\sigma_t$ and $\Delta_t$
to propositions; the Heyting connectives combine them.

Propositions indexed over all histories assemble into the propositional presheaf
$H : T^{\mathrm{op}} \to \mathbf{HA}$ (§fiber-doctrine). The sheafification of $H$
in the Grothendieck topos $R = \mathbf{Sh}(T,J)$ is the internal truth-value object
$\Omega_R$ (§relational-universe).
