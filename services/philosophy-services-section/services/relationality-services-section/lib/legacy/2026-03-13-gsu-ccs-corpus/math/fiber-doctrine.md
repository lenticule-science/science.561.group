---
id: fiber-doctrine
name: FiberDoctrine
description: "The Fiber Doctrine — the functor H : T^op → HA_nucl assigning nuclear Heyting algebras to histories, the propositional Heyting doctrine of the relational universe"
---

### Definition — The Fiber Doctrine {#fiber-doctrine}

The **fiber doctrine** of a relational universe is the functor
$$
H : T^{\mathrm{op}} \longrightarrow \mathbf{HA_{nucl}},
$$
assigning to each history $t \in \mathrm{Ob}(T)$ a **fiber nuclear square**
$(H_t,\; \sigma_t,\; \Delta_t)$ ([CommutativeNuclearSquare](commutative-nuclear-square.md)) — an object of $\mathbf{HA_{nucl}}$ (§nuclear-heyting-algebra) —
and to each morphism $f : t \to t'$ in $T$ a restriction map $H(f) : H_{t'} \to H_t$
preserving all Heyting operations and commuting with both nuclei.

The fiber nuclear square at $t$ consists of:

- the proposition fiber $H_t$ (§fiber) — a finite Heyting algebra, the algebra of propositions at $t$;
- a saturation nucleus $\sigma_t : H_t \to H_t$ (§saturation-nucleus), canonically induced
  by the restriction profile to sub-histories;
- a transfer nucleus $\Delta_t : H_t \to H_t$ (§transfer-nucleus), canonically induced by
  the extension images from one-step super-histories;
- satisfying the **commutativity condition** $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$
  (§nucleus-commutation).

The fiber doctrine is a **Heyting doctrine** (propositional hyperdoctrine in the sense of
Lawvere): a contravariant functor from a base category $T$ into a category of Heyting
algebras, assigning to each object its algebra of propositions and to each morphism a
structure-preserving substitution. The target $\mathbf{HA_{nucl}}$ — rather than plain
$\mathbf{HA}$ — reflects that $\sigma_t$ and $\Delta_t$ are canonically induced by the
presheaf structure of $T$ itself; no additional data beyond $H : T^{\mathrm{op}} \to \mathbf{HA}$
is required. The commutativity condition is the fiberwise analog of two compatible
Lawvere–Tierney topologies. See §doctrine for the general pattern; see §reindexing for
the explicit consequences for restriction maps.

#### Fixed Fibers {#fiber-doctrine-fixed}

The **fixed fiber** $H_t^* := \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ at each
$t$ is defined and analyzed in §fixed-fiber. The joint projection
$\pi_t := \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is the canonical reflection
of $H_t$ onto $H_t^*$; see §saturation-transfer-dyad-commutativity. The family
$(H_t^*)_{t \in \mathrm{Ob}(T)}$ assembles into the invariant locale $\mathsf{Phase}$
(§invariant-locale).

#### Remark — The Fiber as a Relational Quantale {#remark-fiber-quantale}

A **relational quantale** is a tuple $(Q, \leq, \otimes, {\to}, {\leftarrow}, \sigma, \Delta)$
where $(Q, \leq)$ is a complete lattice; $\otimes$ is an associative binary operation
distributing over all joins from both sides (making $(Q,\leq,\otimes)$ a quantale in
the sense of Mulvey 1986); $a \to b := \bigvee\{c \mid a \otimes c \leq b\}$ and
$b \leftarrow a := \bigvee\{c \mid c \otimes a \leq b\}$ are the two-sided residuals;
and $\sigma, \Delta : Q \to Q$ are commuting nuclei satisfying multiplicativity
conditions $\sigma(a \otimes b) = \sigma a \otimes \sigma b$ and
$\Delta(a \otimes b) = \Delta a \otimes \Delta b$. The **doubly-fixed subquantale**
$Q^* := \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta)$ is itself a complete lattice
inheriting the tensor and residuals.

Each fiber $(H_t, \sigma_t, \Delta_t)$ is a finite relational quantale: the complete
lattice is $H_t$, the tensor is the meet $\wedge_t$ (which distributes over joins since
$H_t$ is a finite distributive lattice), the two residuals coincide with the Heyting
implication $\Rightarrow_t$ (commutativity collapses the asymmetry), and $\sigma_t,
\Delta_t$ are the commuting nuclei derived from the presheaf datum. The doubly-fixed
subquantale is exactly $H_t^*$.

The full non-commutative relational quantale structure — with genuinely distinct left
and right residuals — appears at the level of the history category $T$ under concatenation
$\star$, and its sheafification is the Day convolution $\circledast$ on $R$
(§history-convolution).
