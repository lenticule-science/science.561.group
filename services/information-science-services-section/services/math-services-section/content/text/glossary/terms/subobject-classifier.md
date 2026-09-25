---
name: "Subobject Classifier"
description: "Let $mathcal{E}$ be a topos (elementary or Grothendieck) with terminal object $1$."
aliases:
  - "subobject classifier"
  - "truth-value object"
date-created: 2026-03-02
tags: []
mathematical-object: topos
references:
  ref1:
    title: "Mac Lane & Moerdijk, Sheaves in Geometry and Logic, Springer, 1994"
---

Let $\mathcal{E}$ be a topos (elementary or Grothendieck) with terminal object $1$.

**Definition.** A *subobject classifier* in $\mathcal{E}$ is an object $\Omega$ together with a [morphism](./morphism.md) $\mathrm{true}: 1 \to \Omega$ such that for every monomorphism $m: S \hookrightarrow X$, there exists a unique [morphism](./morphism.md) $\chi_m: X \to \Omega$ (the *classifying map* or *characteristic [morphism](./morphism.md)*) making the following square a pullback:

$$\begin{array}{ccc} S & \to & 1 \\ \downarrow\scriptstyle{m} & & \downarrow\scriptstyle{\mathrm{true}} \\ X & \xrightarrow{\chi_m} & \Omega \end{array}$$

Equivalently, $\Omega$ represents the functor $\mathrm{Sub}: \mathcal{E}^{\mathrm{op}} \to \mathbf{Set}$ that sends each object $X$ to its set of subobjects: there is a natural isomorphism $\mathrm{Sub}(X) \cong \mathrm{Hom}_{\mathcal{E}}(X, \Omega)$.

**Proposition.** *In any elementary topos, the subobject classifier $\Omega$ carries the structure of an internal [Heyting algebra](./heyting-algebra.md). The operations $\wedge, \vee, \Rightarrow: \Omega \times \Omega \to \Omega$ and $\neg: \Omega \to \Omega$ are determined by requiring that the classifying maps respect the corresponding operations on subobjects (intersection, union, Heyting implication, complement). In particular, the internal logic of the topos is intuitionistic: the law of excluded middle $p \vee \neg p = \top$ holds for all $p$ iff $\Omega$ is a Boolean algebra.*

*Proof sketch.* Subobjects of any object $X$ form a Heyting algebra under intersection, union, and Heyting implication of subobjects. Since $\mathrm{Sub}(X) \cong \mathrm{Hom}(X, \Omega)$, the Yoneda lemma transfers these operations to morphisms $\Omega \times \Omega \to \Omega$.

**Proposition.** *The subobject classifier is unique up to unique isomorphism (when it exists), being a representing object of the subfunctor $\mathrm{Sub}$.*

**Proposition.** *A [Lawvere-Tierney topology](./lawvere-tierney-topology.md) $j: \Omega \to \Omega$ is a closure operator on $\Omega$ that preserves meets. The image $\Omega_j = \{p \in \Omega : j(p) = p\}$ is the subobject classifier of the subtopos $\mathrm{Sh}_j(\mathcal{E})$.*

**Examples.**

- *$\mathbf{Set}$:* The subobject classifier is $\Omega = \{0, 1\}$ with $\mathrm{true}: \{*\} \to \{0, 1\}$ picking out $1$. The classifying map $\chi_m$ is the usual characteristic function. The internal logic is classical ([Boolean algebra](./boolean-algebra.md)).
- *$\mathrm{Sh}(X)$:* For a topological space $X$, the subobject classifier is the sheaf $\Omega(U) = \{V \subseteq U : V \text{ open}\}$, the sheaf of open subsets. The global elements $\mathrm{Hom}(1, \Omega) \cong \mathcal{O}(X)$ are the open sets of $X$, so truth values are "open truth values" — a proposition can be "true on $U$" for various opens $U$.
- *$\mathbf{Set}^{G}$ (presheaves on a group):* For a group $G$, the subobject classifier in the topos of $G$-sets is $\Omega = \{H \leq G : H \text{ is a subgroup}\}$ with $G$-action by conjugation, and $\mathrm{true}$ picks out $G$ itself.

## Earlier material

**Definition.** A *subobject classifier* in $\mathcal{E}$ is an object $\Omega$ together with a [morphism](morphism.md) $\mathrm{true}: 1 \to \Omega$ such that for every monomorphism $m: S \hookrightarrow X$, there exists a unique [morphism](morphism.md) $\chi_m: X \to \Omega$ (the *classifying map* or *characteristic [morphism](morphism.md)*) making the following square a pullback:

**Proposition.** *In any elementary topos, the subobject classifier $\Omega$ carries the structure of an internal [Heyting algebra](../../../../../../../natural-science-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/library/science/mathematics/_archive/from-discourse-domain-locus-math/teaching/explanations/heyting-algebra/index.md). The operations $\wedge, \vee, \Rightarrow: \Omega \times \Omega \to \Omega$ and $\neg: \Omega \to \Omega$ are determined by requiring that the classifying maps respect the corresponding operations on subobjects (intersection, union, Heyting implication, complement). In particular, the internal logic of the topos is intuitionistic: the [law of excluded middle](../../../../../../../philosophy-services-section/content/text/glossary/terms/law-of-excluded-middle.md) $p \vee \neg p = \top$ holds for all $p$ iff $\Omega$ is a Boolean algebra.*
