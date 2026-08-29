---
title: "Adjunction"
description: "Let $mathcal{C}$ and $mathcal{D}$ be categories."
aliases:
  - "adjunction"
  - "adjoint pair"
  - "adjoint functors"
date-created: 2025-12-26
tags: []
mathematical-object: category
references:
  ref1:
    title: "Mac Lane, Categories for the Working Mathematician, 2nd ed., Springer, 1998"
defines:
  - "Adjunction"
  - "adjoint pair"
  - "adjoint functors"
type: term
---

Let $\mathcal{C}$ and $\mathcal{D}$ be categories.

**Definition.** An *adjunction* between $\mathcal{C}$ and $\mathcal{D}$ consists of a pair of [functors](./functor.md) $F: \mathcal{C} \to \mathcal{D}$ and $G: \mathcal{D} \to \mathcal{C}$ together with a natural isomorphism

$$\varphi_{c,d}: \mathrm{Hom}_{\mathcal{D}}(F(c), d) \xrightarrow{\;\sim\;} \mathrm{Hom}_{\mathcal{C}}(c, G(d))$$

for all $c \in \mathrm{Ob}(\mathcal{C})$ and $d \in \mathrm{Ob}(\mathcal{D})$, natural in both variables. We call $F$ the *left adjoint* and $G$ the *right adjoint*, and write $F \dashv G$.

Equivalently, an adjunction $F \dashv G$ is determined by natural transformations $\eta: \mathrm{id}_{\mathcal{C}} \Rightarrow G \circ F$ (the *unit*) and $\varepsilon: F \circ G \Rightarrow \mathrm{id}_{\mathcal{D}}$ (the *counit*) satisfying the triangle identities:

$$\varepsilon_{F(c)} \circ F(\eta_c) = \mathrm{id}_{F(c)}, \qquad G(\varepsilon_d) \circ \eta_{G(d)} = \mathrm{id}_{G(d)}.$$

**Proposition.** *The two definitions are equivalent. Given the hom-set adjunction $\varphi$, the unit and counit are $\eta_c = \varphi_{c,F(c)}(\mathrm{id}_{F(c)})$ and $\varepsilon_d = \varphi^{-1}_{G(d),d}(\mathrm{id}_{G(d)})$. Conversely, given $(\eta, \varepsilon)$ satisfying the triangle identities, $\varphi_{c,d}(f) = G(f) \circ \eta_c$ defines the natural isomorphism.*

**Proposition.** *Every adjunction $F \dashv G$ gives rise to a [monad](./model.md) $(T, \eta, \mu)$ on $\mathcal{C}$ where $T = G \circ F$, $\eta$ is the unit of the adjunction, and $\mu = G\varepsilon_F: GFGF \Rightarrow GF$; and dually a comonad $(K, \varepsilon, \delta)$ on $\mathcal{D}$ where $K = F \circ G$.*

*Proof sketch.* Associativity of $\mu$ and the unit laws follow from the triangle identities and naturality of $\eta$ and $\varepsilon$.

**Proposition.** *Left adjoints preserve all colimits; right adjoints preserve all limits.*

*Proof sketch.* For $F \dashv G$ and a diagram $D: I \to \mathcal{D}$ with limit $\lim D$, the chain of natural isomorphisms $\mathrm{Hom}(c, G(\lim D)) \cong \mathrm{Hom}(Fc, \lim D) \cong \lim \mathrm{Hom}(Fc, D(-)) \cong \lim \mathrm{Hom}(c, GD(-)) \cong \mathrm{Hom}(c, \lim GD)$ exhibits $G(\lim D) \cong \lim GD$ by the Yoneda lemma. The colimit case is dual.

**Proposition (Uniqueness).** *If $F \dashv G$ and $F \dashv G'$, then $G \cong G'$ by a canonical natural isomorphism. That is, adjoints are unique up to unique natural isomorphism.*

*Proof sketch.* For each $d$, the functors $\mathrm{Hom}(F(-), d)$ are representable by both $G(d)$ and $G'(d)$, so $G(d) \cong G'(d)$ by Yoneda.

**Examples.**

- *Free-forgetful:* The free group [functor](./functor.md) $F: \mathbf{Set} \to \mathbf{Grp}$ is left adjoint to the forgetful [functor](./functor.md) $U: \mathbf{Grp} \to \mathbf{Set}$. The unit sends a set $S$ to the inclusion $S \hookrightarrow U(F(S))$.
- *Tensor-hom:* For a commutative ring $R$ and an $R$-module $M$, the [functor](./functor.md) $M \otimes_R (-)$ is left adjoint to $\mathrm{Hom}_R(M, -)$.
- *Sheafification:* The sheafification [functor](./functor.md) $a: \mathrm{PSh}(\mathcal{C}) \to \mathrm{Sh}(\mathcal{C})$ is left adjoint to the inclusion [functor](./functor.md) $i: \mathrm{Sh}(\mathcal{C}) \hookrightarrow \mathrm{PSh}(\mathcal{C})$.
- *Residuation:* In a [Heyting algebra](./heyting-algebra.md) $H$ viewed as a thin category, the meet [functor](./functor.md) $a \wedge (-)$ is left adjoint to the [Heyting implication](./heyting-implication.md) $a \to (-)$. That is, $a \wedge b \leq c$ if and only if $b \leq (a \to c)$.
