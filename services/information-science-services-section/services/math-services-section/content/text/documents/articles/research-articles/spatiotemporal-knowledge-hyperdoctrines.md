---
title: "spatiotemporal knowledge hyperdoctrines"
type: research-article
description: "Keywords: hyperdoctrine; bilattice; fibered category; Grothendieck fibration; lax-idempotent 2-monad; Kock–Zöberlein doctrine; quantifier adjoint; Beck–Chevalley condition; Frobenius reciprocity; comprehension schema; first-order…"
---

# Spatiotemporal Knowledge Hyperdoctrines

### A 2-Categorical Foundation for First-Order Reasoning

**Author:** emsenn

**Keywords:** hyperdoctrine; bilattice; fibered category; Grothendieck fibration; lax-idempotent 2-monad; Kock–Zöberlein doctrine; quantifier adjoint; Beck–Chevalley condition; Frobenius reciprocity; comprehension schema; first-order bilattice logic; Priestley duality.

**MSC 2020:** 03G30 (categorical logic, topoi); 18C15 (monads, algebras for a monad); 18C20 (eventually algebraic constructions); 18D05 (double categories, 2-categories, bicategories); 03B47 (substructural logics); 03G25 (other algebras related to logic); 18B10 (categories of spans, relations, partial maps).

**arXiv primary:** math.CT. **Secondary:** math.LO, cs.LO.

---

## Abstract

We introduce the **spatiotemporal knowledge hyperdoctrine** as the 2-categorical object that realizes the spatiotemporal knowledge presheaves of the preceding paper *Spatiotemporal Knowledge Presheaves* as bilattice-valued hyperdoctrines. A spatiotemporal knowledge hyperdoctrine is a cloven Grothendieck fibration over a predicate category $\mathcal{C}$ with distributive-bilattice-residuated fibers, carrying two parallel adjoint triples $\exists_f^{k/t} \dashv f^* \dashv \forall_f^{k/t}$ — one for each of the bilattice's two orders, $\leq_k$ (knowledge) and $\leq_t$ (truth) — and a comprehension schema in both designations. Every spatiotemporal knowledge hyperdoctrine supports simultaneously a *classical* two-valued internal first-order logic (via $\leq_t$) and a *paraconsistent* four-valued internal logic (via $\leq_k$), with classical equality $\mathbf{t}/\mathbf{f}$ and paraconsistent equality $\top/\bot$ both derived from Lawvere's diagonal-$\Sigma$ construction rather than postulated as primitives. The temporal axis is upgraded from the linear ordinal of *Spatiotemporal Knowledge Presheaves* to a 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ built on the Gray–Street–Emmenegger 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$; the cascade is a coalgebra in this 2-category. The closure operator is a lax-idempotent 2-monad on the fibrations, distinct from the fibration-KZ of $\mathbb{M} \dashv \mathbb{N}$, with $\mathcal{C}$-closed spatiotemporal knowledge presheaves arising as its pseudo-algebras. A fine-grained four-regime dichotomy — strict ($\kappa < \omega$), $\omega$-Scott ($\kappa = \omega$), transfinite-bounded ($\omega < \kappa < $ bound), aperiodic ($\kappa$ unbounded) — classifies cascade behavior; the finite convergence theorem of *Spatiotemporal Knowledge Presheaves* sits in the strict regime, and the aperiodic regime is the natural home for the cohomology developed in the sequel *Spatiotemporal Knowledge Cohomology*. All structure Priestley-dualizes coherently, establishing the dual object on which that cohomology is built. This paper is a foundational reference for *Spatiotemporal Knowledge Cohomology* and for downstream algebraic work on spatiotemporal knowledge presheaves.

## 1. Introduction

### 1.1 From the knowledge presheaf to the hyperdoctrine

*Spatiotemporal Knowledge Presheaves* (the foundational paper of this series) constructs the spatiotemporal knowledge presheaf as a bilattice-valued object presenting knowledge as $\leq_k$-monotone trajectories through fiber algebras over a predicate category $\mathcal{C}$. *Spatiotemporal Knowledge Presheaves* §12.1 observes that a spatiotemporal knowledge presheaf is "essentially a bilattice-valued hyperdoctrine over $\mathcal{C}$ parametrized additionally by a cascade ordinal," and *Spatiotemporal Knowledge Presheaves* Proposition 12.1 exhibits the hyperdoctrinal adjoint chain $\exists_f \dashv f^* \dashv \forall_f$ for specialization morphisms. *Spatiotemporal Knowledge Presheaves* §12.6 item 4 flags "categorical-logic extensions" — Maruyama-style substructural first-order logic on top of the spatiotemporal-knowledge-presheaf framework — as a downstream construction.

The present work develops the full hyperdoctrinal structure sketched in *Spatiotemporal Knowledge Presheaves*. The output is a 2-categorical object (the spatiotemporal knowledge hyperdoctrine) that recovers the spatiotemporal knowledge presheaf as its 1-truncation, supports its entire content (cascade dynamics, closure operator, Priestley duality), extends the spatiotemporal knowledge presheaf to infinite entity sets via a four-regime classification, and establishes the dual structure on which the cohomology of the sequel, *Spatiotemporal Knowledge Cohomology*, is built.

### 1.2 Four principal contributions

**(A) The spatiotemporal knowledge hyperdoctrine as a three-layer object.** §5 defines spatiotemporal knowledge presheaf fibrations (Layer A, §5.1), spatiotemporal knowledge hyperdoctrines (Layer B, §5.2), and spatiotemporal knowledge presheaves (Layer C, §5.3) as a hierarchy: a fibration, equipped with hyperdoctrinal properties, equipped with a cascade coalgebra. The knowledge-presheaf object of *Spatiotemporal Knowledge Presheaves* is Layer C; the title object here is Layer B. The distinction separates "static spatial structure" from "hyperdoctrinal properties" from "temporal dynamics" cleanly.

**(B) Two parallel adjoint systems.** The spatiotemporal knowledge hyperdoctrine carries *two* adjoint triples — one for the bilattice's knowledge order $\leq_k$ (the convention of *Spatiotemporal Knowledge Presheaves*) and one for the truth order $\leq_t$ (new). This is a structural distinction from classical hyperdoctrines (Lawvere, Seely, Maruyama): one hyperdoctrine, two internal first-order logics. Frobenius reciprocity holds for $\wedge_k$ and $\wedge_t$ (§7.3) but *fails* for the twist-product fusion $\odot$ that Maruyama (2021) would use, owing to $\odot$'s non-integrality on $\mathbf{L}^\bowtie$ (§7.4).

**(C) Derived classical equality and parallel comprehension schemas.** Classical $\mathbf{t}/\mathbf{f}$-valued equality is *derived* from the $\leq_t$-adjoint system via Lawvere's diagonal-$\Sigma$ construction (Definition 8.1.2), rather than postulated as in first-order bilattice literature (BD∆, Kamide–Zohar, Běhounek–Daňková–Dvořák). Paraconsistent $\top/\bot$-valued equality arises in parallel from the $\leq_k$-system. Both comprehension schemas — classical ($\{-\}_\mathbf{t}$) and information ($\{-\}_\top$) — hold (Theorems 8.2.2–8.2.3).

**(D) Four-regime dichotomy and Priestley dualizability.** The finite-Scott-continuous cascade of Theorem 5.4 in *Spatiotemporal Knowledge Presheaves* generalizes to a four-regime hierarchy indexed by the closure ordinal $\kappa$: strict ($\kappa < \omega$), $\omega$-Scott ($\kappa = \omega$), transfinite-bounded ($\omega < \kappa <$ bound), aperiodic ($\kappa$ unbounded). §10 proves this hierarchy (Theorem 10.2.1). The Priestley-dual structure is coherent in every regime (§11 Theorem 11.1.1), establishing the dual object on which the cohomology of *Spatiotemporal Knowledge Cohomology* is built.

### 1.3 Structural novelties worth flagging

**The KZ-lax-idempotent diamond.** The temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ of §4 is built on the Gray–Street–Emmenegger 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$, where $\mathbb{M}$ is the classical colax-idempotent 2-monad (Gray 1966, Street 1974) and $\mathbb{N}$ is its right 2-adjoint, a lax-idempotent 2-comonad (Emmenegger, Mesiti, Rosolini, Streicher 2024). Cloven fibrations are simultaneously pseudo-algebras for $\mathbb{M}$ and pseudo-coalgebras for $\mathbb{N}$. The 2-adjunction's coherence 2-cells form a **diamond** that serves as the temporal-axis 2-structure.

**Two disentangled KZ structures.** The theory here has a fibration-KZ (on $\mathbf{Cat}/\mathcal{C}$, via Gray–Street–Emmenegger) and a closure-KZ (on $\mathbf{PrFib}(\mathcal{C})$, via the closure operator of *Spatiotemporal Knowledge Presheaves* lifted 2-categorically). They are independent and compose cleanly; §9.1 disentangles them explicitly.

**Cascade as coalgebra, aperiodicity as non-stabilization.** The cascade of *Spatiotemporal Knowledge Presheaves* is a monotone sequence; §5.3 expresses it as a coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ for a cascade endofunctor $F_U$. Aperiodicity is defined rigorously (Definition 10.4.1): no countable ordinal is a strict fixed point. Regime D of the dichotomy is precisely where the KZ-lax-idempotent diamond is genuinely 2-dimensional, and where the cohomology of *Spatiotemporal Knowledge Cohomology* has its content.

### 1.4 Approach and relation to prior work

The work here is in the tradition of Lawvere 1969/1970 (hyperdoctrines, equality, comprehension), Seely 1983 (Beck–Chevalley), Jacobs 1999 (fibration formalism), and Maruyama 2021 (substructural hyperdoctrines). Its closest predecessor is Maruyama 2021; the novel content is the dual-adjoint-system structure of the bilattice setting, the fibration-KZ identification with Emmenegger et al. 2024, and the regime-classification-plus-dualization of cascade dynamics.

The spatiotemporal knowledge hyperdoctrine is not a tripos (§13.4): it has bilattice-valued rather than Heyting-valued fibers, genuine 2-categorical fiber structure, and no postulated generic predicate. This is a structural distinction worth flagging early to avoid reader confusion.

### 1.5 Outline

§2 collects the prerequisite categorical material on hyperdoctrines, fibrations, 2-monads, substructural hyperdoctrines, and coalgebras. §3 resolves two loose ends carried forward from *Spatiotemporal Knowledge Presheaves* (generator exhaustiveness; infinite-$E$ cascade). §4 constructs the temporal 2-object. §5 gives the three-layer spatiotemporal knowledge hyperdoctrine definition. §6 establishes Beck–Chevalley. §7 develops quantifier adjoints and Frobenius. §8 treats equality and comprehension. §9 handles closure as a KZ 2-monad. §10 proves the four-regime dichotomy. §11 verifies Priestley dualizability. §12 gives worked examples. §13 situates the work relative to prior literature and outlines downstream developments.



## 2. Preliminaries

This section establishes the 2-categorical vocabulary this paper builds on. *Spatiotemporal Knowledge Presheaves* is assumed as a prerequisite; its results on bilattices, twist-product residuation, Chu spaces, closure operators, and Priestley duality are used throughout. The material below is orthogonal: hyperdoctrines (§2.2), fibered categorical logic (§2.3), 2-monads and Kock–Zöberlein doctrines (§2.4), Maruyama's substructural hyperdoctrines (§2.5), and coalgebraic / temporal structures (§2.6). Experienced readers may skim.

### 2.1 *Spatiotemporal Knowledge Presheaves* in brief

A spatiotemporal knowledge presheaf is a family $(v_\tau)_{\tau < \lambda}$ of valuations, each assigning to a predicate $p$ in a small category $\mathcal{C}$ a fiber-algebra element $v_\tau(p) \in A_p$ with $A_p = \mathbf{L}^{\bowtie E \times E}$ — the pointwise twist-product bilattice over a fixed entity set $E$ and integral commutative residuated lattice $\mathbf{L}$. Cascade monotonicity $\sigma \leq \tau \Rightarrow v_\sigma \leq_k v_\tau$ makes the family a monotone trajectory in the $\leq_k$ (knowledge) order. The fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ sends each predicate to its fiber algebra; its action is given by Theorem 3.6 of *Spatiotemporal Knowledge Presheaves* (which was revised in the course of the present work to include all four generator classes of §6.1 there).

Section 12.1 of *Spatiotemporal Knowledge Presheaves* observes that a spatiotemporal knowledge presheaf is "essentially a bilattice-valued hyperdoctrine over $\mathcal{C}$ parametrized additionally by a cascade ordinal," and its Proposition 12.1 exhibits the hyperdoctrinal adjunction chain $\exists_f \dashv f^* \dashv \forall_f$ for specialization morphisms. Remark 12.2 there sketches adjoints for the remaining three generator classes. The present paper takes this observation as its starting point and develops the full hyperdoctrinal structure: quantifier adjoints uniformly, Beck–Chevalley coherence, Frobenius reciprocity, comprehension, and a 2-categorical temporal structure that accommodates cascades beyond the finite-Scott-continuous regime of Theorem 5.4 of *Spatiotemporal Knowledge Presheaves*.

### 2.2 Hyperdoctrines

A **hyperdoctrine** (Lawvere 1969, *Adjointness in Foundations*) consists of four ingredients: (i) a cartesian closed category $T$ of "types"; (ii) for each $X \in T$, a cartesian closed category $P(X)$ of "attributes of type $X$"; (iii) for each term $f : X \to Y$ in $T$, a substitution functor $f \cdot (-) : P(Y) \to P(X)$; (iv) for each $f$, left and right adjoints $(-)\Sigma_f \dashv f \cdot (-) \dashv (-)\Pi_f$ giving existential and universal quantification.

Seely 1983 adds finite coproducts to fibers (yielding disjunction) and states the **Beck–Chevalley condition**: for every pullback square in $T$, substitution-of-$\Sigma$ equals $\Sigma$-of-substitution up to canonical iso. Seely's central theorem identifies the class of Beck-satisfying hyperdoctrines with first-order intuitionistic theories with equality.

Lawvere 1970 develops equality as the diagonal image $\Delta_X = 1_X\Sigma_{\langle X, X\rangle}$ and shows that **Frobenius reciprocity** — $\exists_f(f^*\alpha \wedge \phi) \cong \alpha \wedge \exists_f \phi$ — is equivalent to substitution preserving implication. The **comprehension schema** is introduced as a right adjoint to an extension functor $(T, B) \to P(B)$ carrying a $T$-morphism to its $\Sigma$-image.

This paper adapts this apparatus to the bilattice-valued setting, with two modifications: (i) fibers are not cartesian closed but distributive-bilattice-residuated (*Spatiotemporal Knowledge Presheaves* §§2.1–2.4); (ii) a *second* adjoint system arises from the bilattice's secondary order $\leq_t$, so every spatiotemporal knowledge hyperdoctrine carries two parallel adjoint triples. Frobenius holds with the knowledge-meet $\wedge_k$ (resp. truth-meet $\wedge_t$) rather than with the twist-product fusion $\odot$, owing to the non-integrality of $\odot$ on $\mathbf{L}^\bowtie$ (*Spatiotemporal Knowledge Presheaves* Remark 4.2). Sections 7 and 8 below give explicit adjoint formulas per generator.

### 2.3 Fibered categorical logic

Jacobs 1999 (*Categorical Logic and Type Theory*) develops hyperdoctrines in the fibration-theoretic framing due originally to Grothendieck and refined by Bénabou (see Streicher 2018 for a comprehensive exposition). A **fibration** $p : \mathcal{E} \to \mathcal{C}$ has fibers $\mathcal{E}_q = p^{-1}(q)$ for each $q \in \mathcal{C}$, with cartesian lifts providing reindexing functors $f^* : \mathcal{E}_p \to \mathcal{E}_q$ along each $\mathcal{C}$-morphism $f : q \to p$. A **cloven fibration** has a functorial choice of cartesian lifts up to canonical iso; a **split fibration** has lifts on the nose.

The fibration framing has two advantages for this paper over Lawvere's indexed-category formulation:

1. Pseudo-/strict-algebra distinctions of 2-monads map cleanly to cloven-/split-fibration distinctions (Emmenegger, Mesiti, Rosolini, Streicher 2024).
2. The 2-categorical structure of $\mathbf{Cat}/\mathcal{C}$ (the slice 2-category of functors over $\mathcal{C}$) provides natural ambient structure for the temporal 2-object this paper constructs in §4.

Jacobs 1999 Chapter 1 gives the fibration apparatus; §3.4 treats fibred equality; §4.2 fibrations for first-order predicate logic; §9.3 quantification over general fibrations. This paper follows Jacobs' framing throughout.

### 2.4 2-monads and Kock–Zöberlein doctrines

A **2-monad** $(\mathbb{T}, \mu, \eta)$ on a 2-category $\mathcal{K}$ consists of a 2-functor $\mathbb{T} : \mathcal{K} \to \mathcal{K}$, a unit 2-natural transformation $\eta : 1 \Rightarrow \mathbb{T}$, and a multiplication 2-natural transformation $\mu : \mathbb{T}^2 \Rightarrow \mathbb{T}$, satisfying the monad laws (strictly or up to coherent 2-iso). See Lack 2010 *A 2-Categories Companion* for foundational 2-category theory.

A 2-monad $\mathbb{T}$ is **lax-idempotent** (or **Kock–Zöberlein**, or **KZ**) when any of several equivalent conditions holds:

**(K1)** *Structure is adjoint to unit* (Kock 1995): there is an adjunction $\mu \dashv \eta\mathbb{T}$ in $[\mathcal{K}, \mathcal{K}]$ with counit $\mu \cdot \eta\mathbb{T} = 1_\mathbb{T}$.

**(K2)** *Algebras are properties* (Kelly–Lack 1997): for every pseudo $\mathbb{T}$-algebra $a : \mathbb{T} A \to A$, the action $a$ is left adjoint to $\eta_A$ with identity counit. Equivalently, $\mathbb{T}$-algebra structure on an object is unique up to unique iso if it exists at all.

**(K3)** *Unique lax morphism structure* (Kelly–Lack 1997): for every 1-cell $f : A \to B$ between strict $\mathbb{T}$-algebras, there is a unique 2-cell making $f$ a lax $\mathbb{T}$-morphism.

Dually, a 2-monad is **colax-idempotent** if $\mu$ is *right* adjoint to $\eta\mathbb{T}$. Classical examples include free cocompletion under a class of colimits (lax-idempotent) and free completion under limits (colax-idempotent). Fibration classifiers on $\mathbf{Cat}$ are colax-idempotent (algebras = Grothendieck fibrations; see §4).

Kelly–Lack 1997 systematizes the lax-idempotent condition into a hierarchy of "property-like" 2-monads. This paper uses Kelly–Lack (K1)/(K2)/(K3) freely for both the fibration-level 2-monads of §4 and the closure 2-monad of §9.

### 2.5 Maruyama 2021 — substructural hyperdoctrines

Maruyama 2021 (*Fibred algebraic semantics for a variety of non-classical first-order logics*) extends the Lawvere hyperdoctrine framework to substructural predicate logics over the Typed Full Lambek Calculus. The base change is that fibers need not be cartesian-closed; they can carry a residuated monoidal structure $\otimes \dashv \multimap$ with the monoidal unit $I$ not necessarily coinciding with the lattice top.

Maruyama's Frobenius reciprocity uses $\otimes$: $\exists_f(f^*\alpha \otimes \phi) \cong \alpha \otimes \exists_f \phi$, generalizing Lawvere's $\wedge$-Frobenius. The Typed Full Lambek setting covers linear, relevant, intuitionistic, and classical first-order logic uniformly.

The present paper is in the same family: fibers are residuated ($\odot \dashv \Rightarrow$ on $\mathbf{L}^\bowtie$; see §4 of *Spatiotemporal Knowledge Presheaves*), and the hyperdoctrinal structure generalizes Maruyama's. One departure: on $\mathbf{L}^\bowtie$ the fusion $\odot$ is non-integral (Remark 4.2 of *Spatiotemporal Knowledge Presheaves*), so Frobenius-for-$\odot$ *fails* for three of the four generator classes here. We instead use the *bilattice knowledge-meet* $\wedge_k$ for Frobenius, recovering the Lawvere-style statement with a bilattice-native conjunction whose absorber aligns with $\bot$. See §7 for details.

### 2.6 Temporal and coalgebraic structures

A **coalgebra** for an endofunctor $F : \mathcal{K} \to \mathcal{K}$ is a morphism $c : X \to F(X)$; dually an algebra is $F(X) \to X$. The slogan: algebras capture structure, coalgebras capture behavior. Rutten 2000 (*Universal coalgebra*) develops the categorical framework; Jacobs 2016 (*Introduction to Coalgebra*) is the textbook reference.

A **final coalgebra** for $F$ is the terminal object of the category of $F$-coalgebras; when it exists, it represents "all possible behaviors." Aczel 1988 (*Non-Well-Founded Sets*) proves the indexed final coalgebra theorem for $\mathcal{P}$ on classes, licensing orbits that do not stabilize at set-size ordinals.

Lawvere's "Continuously Variable Sets" (1975), "Variable Quantities and Variable Structures in Topoi" (1976), and "Categorical Dynamics" (1979) — all at lawverearchives.com — frame dynamical systems as functors $T \to \mathcal{K}$ from a time-base to a state-space category. The cascade $(v_\tau)_{\tau < \lambda}$ of *Spatiotemporal Knowledge Presheaves* is an instance: a functor from the ordinal $\lambda$ to $\prod_p A_p$, satisfying cascade monotonicity.

This paper upgrades the temporal parameter in *Spatiotemporal Knowledge Presheaves* from a linear ordinal to a 2-category (§4), using the coalgebraic framing to express the cascade as an orbit of a cascade endofunctor (§§5, 9). Synthetic guarded domain theory (Birkedal et al.) is a related modern framework for handling infinite behaviors via a "later" modality; this paper cites it as a comparison point in §4 but does not adopt it as a foundation.

## 3. Prerequisites Resolved

Two loose ends from *Spatiotemporal Knowledge Presheaves* bear on the present development and are settled here. Both concern extensions of results of *Spatiotemporal Knowledge Presheaves* that were stated for finite scope; the present infinite-$E$ setting requires the extensions.

### 3.1 Generator exhaustiveness

The original Proposition 6.14 of *Spatiotemporal Knowledge Presheaves* claimed, under a naturality hypothesis ($\mathrm{Sym}(E)$-equivariance), that every natural bilattice homomorphism between fiber algebras factors through compositions of **two** generator classes (specialization, converse). The claim is false as stated: two additional generator classes exist. The antecedent paper has been revised to include all four, with a full classification proof; we record the corrected statement below.

**Proposition 3.1.1 (corrected Proposition 6.14 of *Spatiotemporal Knowledge Presheaves*).** *Let $|E| \geq 3$. Every $\mathrm{Sym}(E)$-equivariant bottom-preserving bilattice homomorphism $\phi : A_q \to A_p$ has the form*
$$\phi(v)(s, o) = \begin{cases} \psi(v(g(s, o))) & (s, o) \in D \\ \bot & (s, o) \notin D \end{cases}$$
*where $g : E \times E \to E \times E$ is one of four $\mathrm{Sym}(E)$-equivariant index maps — identity, swap, subject-collapse $(s, o) \mapsto (s, s)$, object-collapse $(s, o) \mapsto (o, o)$ — $D \subseteq E \times E$ is a $\mathrm{Sym}(E)$-invariant sub-support, and $\psi : \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie$ is a bounded bilattice endomorphism.*

*Proof.* See *Spatiotemporal Knowledge Presheaves* §6.7. $\square$

The four generator classes are named **specialization** (identity-with-sub-support), **converse** (swap), **subject-projection** (subject-collapse), and **object-projection** (object-collapse). Definitions 6.1–6.4 of *Spatiotemporal Knowledge Presheaves* give them formally.

### 3.2 Infinite-$E$ cascade convergence

Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* (cascade convergence to quiescence) assumes finite $\mathbf{L}, E, \mathcal{C}$. The proof relies on finiteness of $A_p$ to invoke stabilization of ascending chains. When $E$ is infinite (as the present paper allows for genuine first-order quantification), $A_p$ is infinite, and ascending chains need not stabilize at $\omega$.

Scott-continuity of the closure operator suffices for $\omega$-convergence, extending the result of *Spatiotemporal Knowledge Presheaves* to the infinite-$E$ setting.

**Definition 3.2.1 (Scott-continuity).** A closure operator $\mathrm{cl}_p : A_p \to A_p$ is **Scott-continuous** (in $\leq_k$) if for every $\leq_k$-directed subset $S \subseteq A_p$,
$$\mathrm{cl}_p\bigl(\textstyle\bigvee_k S\bigr) = \textstyle\bigvee_k \{\mathrm{cl}_p(x) : x \in S\}.$$

Scott-continuity arises naturally when inference rules have finite antecedents: each rule fires on a $\bigvee_k$-join iff it fires on some finite sub-join. Fitting's logic-programming closure (1991) and description-logic TBox closures are Scott-continuous.

**Theorem 3.2.2 (transfinite cascade convergence under Scott-continuity).** *Let $v$ be a continuous, closure-driven spatiotemporal knowledge presheaf over $(\mathbf{L}, \mathcal{C}, E, \lambda)$. If the closure operator $\mathrm{cl}$ is Scott-continuous on each fiber and the increment sequence $(u_\tau)$ is eventually zero (there exists $\tau_0 < \lambda$ with $u_\tau(p) = \bot$ for all $\tau > \tau_0$ and all $p$), then there exists $\tau^* \leq \tau_0 + \omega$ such that $v_\tau(p) = v_{\tau^*}(p)$ for all $p \in \mathcal{C}$ and all $\tau$ with $\tau^* \leq \tau < \lambda$.*

*Proof.* After $\tau_0$, cascade evolves by closure: $v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p))$. Let $w_n := \mathrm{cl}_p^n(v_{\tau_0}(p))$. The sequence $(w_n)_{n < \omega}$ is $\leq_k$-directed by inflationarity. Cascade continuity at $\tau_0 + \omega$ gives $v_{\tau_0 + \omega}(p) = \bigvee_k \{w_n : n < \omega\}$. By Scott-continuity,
$$\mathrm{cl}_p(v_{\tau_0 + \omega}(p)) = \textstyle\bigvee_k \{\mathrm{cl}_p(w_n)\} = \textstyle\bigvee_k \{w_{n+1}\} = v_{\tau_0 + \omega}(p).$$
So $v_{\tau_0 + \omega}(p)$ is a fixed point of $\mathrm{cl}_p$, and $v_{\tau_0 + \omega + 1}(p) = v_{\tau_0 + \omega}(p)$. Taking $\tau^* = \tau_0 + \omega$ completes the argument. $\square$

**Corollary 3.2.3.** Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* is the finite instance of Theorem 3.2.2: when $\mathbf{L}, E, \mathcal{C}$ are finite, every closure operator is Scott-continuous vacuously (finite lattices have no non-trivial directed joins to preserve), and the $\omega$-bound sharpens to $\tau^* < \tau_0 + \omega$ by the finite-chain argument.

Non-Scott-continuous closure — typical when inference rules have infinitary antecedents (e.g., $\forall x \in E. p(x) \Rightarrow q$ with infinite $E$) — has closure ordinal exceeding $\omega$. §10 analyzes this regime rigorously.

## 4. The Temporal Object

the temporal parameter in *Spatiotemporal Knowledge Presheaves* is a linear ordinal $\lambda$: the cascade is a sequence $(v_\tau)_{\tau < \lambda}$ satisfying $\leq_k$-monotonicity, expressible as a functor $\lambda \to \prod_p A_p$. This 1-categorical structure is sufficient for the finite Scott-continuous regime (§3.2) but too flat for the non-Scott-continuous case, where cascade iteration fails to stabilize at any countable ordinal and the structural information is carried in coherence 2-cells.

This paper replaces the linear $\lambda$ with a 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ built on a 2-adjunction between Gray–Street's colax-idempotent 2-monad for fibrations and Emmenegger et al.'s lax-idempotent 2-comonad. The cascade becomes an orbit of a coalgebra in this 2-category. The KZ-lax-idempotent diamond that collapses to the linear cascade in the strict-idempotent case is native to the construction.

### 4.1 Why the linear $\lambda$ is insufficient

Four observations pushing beyond linear $\lambda$:

1. **Non-stabilizing cascades.** Theorem 3.2.2 gives $\omega$-convergence for Scott-continuous closure. For non-Scott-continuous closure — typical of quantifier-induced inference on infinite $E$ — closure ordinals exceed $\omega$ and may be unbounded. A linear $\lambda$ of countable length cannot witness such cascades.

2. **Coherence 2-cells.** When closure is lax-idempotent (non-strict), the relation $\mathrm{cl}^2(v) = \mathrm{cl}(v)$ holds only up to canonical 2-cell. Linear $\lambda$ discards this information; a 2-categorical time-base preserves it.

3. **Priestley dualization.** *Spatiotemporal Knowledge Cohomology* (cohomology of the Priestley dual) needs a dualizable temporal object. The $\mathcal{K}^{\mathrm{op}}$-identity — lax-idempotent 2-monad on $\mathcal{K}^{\mathrm{op}}$ = lax-idempotent 2-comonad on $\mathcal{K}$ — applies cleanly to 2-adjunctions and not to plain ordinals.

4. **Coalgebraic semantics.** Expressing the cascade as a coalgebra for a cascade endofunctor (§9) requires an ambient 2-category rich enough to carry the fibered endofunctor structure. $\mathbf{Cat}/\mathcal{C}$ suffices; $\lambda$ does not.

### 4.2 The Gray–Street–Emmenegger 2-adjunction

On the 2-category $\mathbf{Cat}/\mathcal{C}$ of functors over $\mathcal{C}$, two 2-monadic structures are classical:

**Theorem 4.2.1 (Gray 1966, Street 1974).** *The 2-functor $\mathbb{M} : \mathbf{Cat}/\mathcal{C} \to \mathbf{Cat}/\mathcal{C}$ sending $F : A \to \mathcal{C}$ to the comma construction $\mathcal{C}/F \to \mathcal{C}$ extends to a colax-idempotent 2-monad $(\mathbb{M}, \mu, \eta)$. Pseudo-algebras for $\mathbb{M}$ are cloven Grothendieck fibrations over $\mathcal{C}$.*

**Theorem 4.2.2 (Emmenegger, Mesiti, Rosolini, Streicher 2024).** *The 2-monad $\mathbb{M}$ has a right 2-adjoint $\mathbb{N} : \mathbf{Cat}/\mathcal{C} \to \mathbf{Cat}/\mathcal{C}$, which extends to a lax-idempotent 2-comonad. Pseudo-coalgebras for $\mathbb{N}$ are (equivalently) cloven Grothendieck fibrations over $\mathcal{C}$.*

The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ has canonical unit, counit, multiplication, and comultiplication 2-cells; together with the (co)lax-idempotent coherence, these form a **diamond** of 2-cells at each iteration level. Emmenegger et al. 2024 proves both halves of the adjunction monadically: $\mathbb{M}$ generates strict fibrations (split), $\mathbb{N}$ generates cloven fibrations.

### 4.3 The temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$

**Definition 4.3.1.** The **temporal 2-category** $\mathbf{T}(\mathcal{C}, \lambda)$ has:

- **0-cells:** pairs $(\tau, X)$ with $\tau < \lambda$ an ordinal and $X \in \mathbf{Cat}/\mathcal{C}$.
- **1-cells:** morphisms $(\sigma, X) \to (\tau, Y)$ for $\sigma \leq \tau$ in $\lambda$ are $\mathbf{Cat}/\mathcal{C}$-morphisms $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ for some decomposition $\tau - \sigma = \alpha + \beta$.
- **2-cells:** $\mathbf{Cat}/\mathcal{C}$-2-cells, plus the canonical coherence 2-cells of $\mathbb{M} \dashv \mathbb{N}$ (unit, counit, multiplication, comultiplication) and the (co)lax-idempotent coherence 2-cells.

The 1-cells encode "advance the cascade by $\alpha + \beta$ ordinal steps" — $\alpha$ applications of $\mathbb{N}$ followed by $\beta$ applications of $\mathbb{M}$. The 2-cells encode the (co)lax coherence of both 2-monads.

**Remark 4.3.2.** When $\mathbb{M}$ and $\mathbb{N}$ are strict-idempotent (§10's Regime A), the 2-cells in $\mathbf{T}(\mathcal{C}, \lambda)$ are identities, and $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to the ordinal $\lambda$ as a 1-category. The linear cascade of *Spatiotemporal Knowledge Presheaves* is recovered exactly in this regime.

**Remark 4.3.3 (the diamond).** The lax-idempotent 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ carries a square of canonical 2-cells at each iteration level: unit $\eta : 1 \Rightarrow \mathbb{M}$, counit $\epsilon : \mathbb{N} \Rightarrow 1$, multiplication $\mu : \mathbb{M}^2 \Rightarrow \mathbb{M}$, comultiplication $\delta : \mathbb{N} \Rightarrow \mathbb{N}^2$. Adjoint triangle equalities witnessed by invertible 2-cells make this square into a diamond. In the lax-idempotent case these 2-cells carry additional coherence from the Kelly–Lack (K1) condition. This is the "KZ-lax-idempotent diamond" this paper uses throughout.

### 4.4 Priestley dualizability preview

By the $\mathcal{K}^{\mathrm{op}}$ identity:

- A lax-idempotent 2-monad on $\mathcal{K}^{\mathrm{op}}$ is a lax-idempotent 2-comonad on $\mathcal{K}$.
- A lax-idempotent 2-monad on $\mathcal{K}^{\mathrm{co}}$ (2-cells reversed) is a colax-idempotent 2-monad on $\mathcal{K}$.

The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ dualizes via $\mathcal{K}^{\mathrm{op}}$ to an adjunction $\mathbb{M}^* \dashv \mathbb{N}^*$ on $\mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$ with the 2-monad/2-comonad roles swapped. The diamond shape is preserved. §11 gives the full Priestley-dualization picture.

### 4.5 Comparison with synthetic guarded domain theory

Synthetic guarded domain theory (SGDT; Birkedal, Bizjak, Møgelberg, and collaborators) is an alternative framework for handling infinite-behavior dynamics via a "later" modality $\blacktriangleright$ on a topos. This paper does *not* adopt SGDT:

- The SGDT "later" modality is a single-direction time operator; it lacks the diamond's two-sided 2-adjoint structure.
- Priestley dualization of SGDT structures requires additional apparatus not present in the core framework.
- The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ provides a native connection to cloven fibrations (Theorems 4.2.1, 4.2.2), matching the present fibration-theoretic hyperdoctrine definition (§5).

SGDT is cited as a kindred framework for aperiodic-orbit handling but not as a foundation.

### 4.6 Cascade as coalgebra

The cascade $(v_\tau)_{\tau < \lambda}$ of a spatiotemporal knowledge presheaf is an **orbit** of a cascade endofunctor $F_U : \mathbf{PrFib}(\mathcal{C}) \to \mathbf{PrFib}(\mathcal{C})$ (the sub-2-category of presheaf fibrations, defined in §5), equipped with a coalgebra structure $c : \mathcal{E} \to F_U(\mathcal{E})$. The formal definition of $F_U$ requires the closure 2-monad (§9); the coalgebraic framing is the 2-categorical expression of the cascade-monotonicity axiom of *Spatiotemporal Knowledge Presheaves*.

§5 develops this in full; §9 analyzes the cascade endofunctor's structure; §10 classifies cascade orbits by their closure ordinal into four regimes.

## 5. Spatiotemporal Knowledge Hyperdoctrines

The spatiotemporal knowledge hyperdoctrine is defined in three layers: a **spatiotemporal knowledge presheaf fibration** (static spatial structure), a **spatiotemporal knowledge hyperdoctrine** (the fibration equipped with hyperdoctrinal adjoint and coherence properties), and a **spatiotemporal knowledge presheaf** (the hyperdoctrine equipped with a cascade coalgebra). The presheaf object of *Spatiotemporal Knowledge Presheaves* corresponds to Layer C; the title object of the present paper is Layer B.

### 5.1 Layer A: spatiotemporal knowledge presheaf fibrations

**Definition 5.1.1 (spatiotemporal knowledge presheaf fibration).** Fix base parameters $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L}$ an integral commutative residuated lattice, $\mathcal{C}$ a small category with finite limits, and $E$ an entity set. A **spatiotemporal knowledge presheaf fibration** over $(\mathbf{L}, \mathcal{C}, E)$ is a cloven Grothendieck fibration
$$p : \mathcal{E} \twoheadrightarrow \mathcal{C}$$
satisfying:

**(A1) Fiber uniformity.** For every $q \in \mathcal{C}$, the fiber $\mathcal{E}_q := p^{-1}(q)$ is canonically isomorphic to the fiber algebra $A_q := \mathbf{L}^{\bowtie E \times E}$, viewed as a thin category via its $\leq_k$-poset.

**(A2) Generator action.** For each of the four generator classes of $\mathcal{C}$-morphisms — specialization, converse, subject-projection, object-projection (Proposition 3.1.1 above, corresponding to Definitions 6.1–6.4 of *Spatiotemporal Knowledge Presheaves*) — the reindexing functor $f^* : \mathcal{E}_p \to \mathcal{E}_q$ for $f : q \to p$ acts on fiber elements as specified by Theorem 3.6 of *Spatiotemporal Knowledge Presheaves*.

**(A3) Fiber structure preservation.** For every $f$ in $\mathcal{C}$, the reindexing $f^*$ is a bilattice-residuated homomorphism: it preserves $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim, \odot, \Rightarrow$ pointwise.

**Remark 5.1.2.** By Emmenegger et al. 2024 Theorem 3.4, cloven fibrations over $\mathcal{C}$ are exactly pseudo-coalgebras for the lax-idempotent 2-comonad $\mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ (§4.2). Definition 5.1.1 is equivalently: *a spatiotemporal knowledge presheaf fibration is a pseudo-$\mathbb{N}$-coalgebra satisfying (A1)–(A3).* Being a pseudo-coalgebra is the weakening of strict coalgebra that matches the non-strict composition of generators in *Spatiotemporal Knowledge Presheaves* (see the proof remarks in its §3.5).

**Remark 5.1.3 (Grothendieck transpose).** The fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ of *Spatiotemporal Knowledge Presheaves* is the Grothendieck-transpose of a spatiotemporal knowledge presheaf fibration: cloven fibrations correspond bijectively to pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$, and $F$ is this pseudo-functor restricted to land in $\mathbf{DBiLat}(\mathbf{L}) \hookrightarrow \mathbf{Cat}$. The present paper uses the fibration framing throughout; the indexed-category form of *Spatiotemporal Knowledge Presheaves* remains valid via the Grothendieck correspondence.

**Remark 5.1.4 (spatiotemporal knowledge presheaf fibrations form a 2-category).** Let $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ denote the full sub-2-category of $\mathbf{Cat}/\mathcal{C}$ on spatiotemporal knowledge presheaf fibrations. Morphisms are morphisms of cloven fibrations respecting (A1)–(A3); 2-cells are natural transformations of fibration morphisms. This 2-category is the ambient structure for §9's closure 2-monad.

### 5.2 Layer B: spatiotemporal knowledge hyperdoctrines

**Definition 5.2.1 (spatiotemporal knowledge hyperdoctrine).** A **spatiotemporal knowledge hyperdoctrine** is a spatiotemporal knowledge presheaf fibration additionally satisfying:

**(B1k) $\leq_k$-quantifier adjoints.** For every $f : q \to p$ in $\mathcal{C}$, the reindexing $f^* : \mathcal{E}_p \to \mathcal{E}_q$ has both a left adjoint $\exists_f^k$ and a right adjoint $\forall_f^k$ in the $\leq_k$-enriched 2-category:
$$\exists_f^k \dashv f^* \dashv \forall_f^k.$$

**(B1t) $\leq_t$-quantifier adjoints.** For every $f$ as in (B1k), dual adjoints in the $\leq_t$-enrichment:
$$\exists_f^t \dashv f^* \dashv \forall_f^t.$$

**(B2k) Frobenius reciprocity for $\wedge_k$.** For every $f : q \to p$ and every $\alpha \in \mathcal{E}_p, \phi \in \mathcal{E}_q$:
$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi).$$

**(B2t) Frobenius reciprocity for $\wedge_t$.** For every $f$ as in (B2k):
$$\exists_f^t(f^*(\alpha) \wedge_t \phi) \cong \alpha \wedge_t \exists_f^t(\phi).$$

**(B3) Beck–Chevalley coherence.** For every pullback square in $\mathcal{C}$
$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array}$$
and every $\phi \in \mathcal{E}_B$, the canonical natural transformation
$$\exists_{p_A}^{k/t}(p_B^*\phi) \to f^*(\exists_g^{k/t}\phi) \quad \in \mathcal{E}_A$$
is an isomorphism, for both the $\leq_k$- and $\leq_t$-adjoint systems. Dually for $\forall$.

**(B4) Comprehension.** For every $p \in \mathcal{C}$, the **extension functor**
$$\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p, \quad (g : q \to p) \mapsto \exists_g^t(\mathbf{1}_q^t)$$
has a right adjoint $\{p : -\}_\mathbf{t} : \mathcal{E}_p \to \mathcal{C}/p$. Here $\mathbf{1}_q^t$ is the $\leq_t$-terminal of the fiber $\mathcal{E}_q$ (constant-$\mathbf{t}$ valuation). The analogous right adjoint $\{p : -\}_\top$ for the $\leq_k$-system also exists.

**Remark 5.2.2 (hyperdoctrine as a property).** By Kelly–Lack 1997's property-like theorem (see §2.4 (K2)/(K3)), (B1)–(B4) are *properties* of the underlying spatiotemporal knowledge presheaf fibration, not additional structural data. A Layer-A object either verifies these properties (becoming a Layer-B object) or fails to; no independent choice is made.

**Remark 5.2.3 (two parallel adjoint systems).** The presence of both (B1k)/(B2k)/(B4k) and (B1t)/(B2t)/(B4t) is structurally distinctive. The fiber algebra of *Spatiotemporal Knowledge Presheaves* has two natural orders ($\leq_k$ for knowledge, $\leq_t$ for truth), and both support hyperdoctrinal adjoint structure. §7 gives explicit formulas per generator per order; §8 derives two equality predicates (classical and paraconsistent) from the two comprehension schemas.

**Remark 5.2.4 (Frobenius for $\odot$ fails).** The twist-product fusion $\odot$ on $\mathbf{L}^\bowtie$ is non-integral (Remark 4.2 of *Spatiotemporal Knowledge Presheaves*): its monoidal unit $(1, 1) = \top$ is not the $\leq_t$-top $\mathbf{t}$, and its absorber $\mathbf{f}$ is not the $\leq_k$-bottom $\bot$. Specialization's $\exists_f$ extends by $\bot$ (for $\leq_k$) or $\mathbf{f}$ (for $\leq_t$); Frobenius demands the connective's absorber align with the extension value. $\wedge_k$'s absorber is $\bot$ (aligned); $\wedge_t$'s absorber is $\mathbf{f}$ (aligned); $\odot$'s absorber is $\mathbf{f}$ — *not* aligned with $\bot$. Hence the $\leq_k$-Frobenius-for-$\odot$ fails for three of the four generator classes. Explicit counterexample in §7.3.

### 5.3 Layer C: spatiotemporal knowledge presheaves (cascade-equipped hyperdoctrines)

**Definition 5.3.1 (spatiotemporal knowledge presheaf).** A **spatiotemporal knowledge presheaf** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a pair $(\mathcal{E}, c)$ where:

**(C1)** $\mathcal{E}$ is a spatiotemporal knowledge hyperdoctrine (Definition 5.2.1).

**(C2)** $c : \mathcal{E} \to F_U(\mathcal{E})$ is a coalgebra for the cascade endofunctor $F_U$ (defined in §9, Definition 9.5.1) parametrized by an increment sequence $U = (u_\tau)_{\tau < \lambda}$.

**(C3) Cascade monotonicity.** The orbit $(v_\tau)_{\tau < \lambda}$ derived from $c$ satisfies $\sigma \leq \tau \Rightarrow v_\sigma \leq_k v_\tau$ pointwise, at every predicate $p$ and every cell $(s, o)$.

The orbit is defined by $v_0 = \mathcal{E}$ and $v_{\tau+1} = F_U^{\tau+1}(\mathcal{E})$ at successor ordinals, $v_\mu = \bigvee_k\{v_\sigma : \sigma < \mu\}$ at limit ordinals (cascade continuity; cf. Definition 3.2 of *Spatiotemporal Knowledge Presheaves*).

**Remark 5.3.2 (recovery of the antecedent paper).** In the finite Scott-continuous regime (§10's Regime A or B), $\mathcal{E}$ reduces to a fiber functor in the sense of *Spatiotemporal Knowledge Presheaves*, the cascade coalgebra $c$ to the cascade sequence $(v_\tau)$, and (C3) to the cascade-monotonicity axiom there. Definition 3.1 of *Spatiotemporal Knowledge Presheaves* is exactly the 1-truncation of Definition 5.3.1.

**Remark 5.3.3 ($\mathcal{C}$-closed presheaves as closure-algebras).** Definition 3.1a of *Spatiotemporal Knowledge Presheaves* identifies "$\mathcal{C}$-closed spatiotemporal knowledge presheaves" as those whose state at each cascade step is natural in $\mathcal{C}$. In Layer C terms, $\mathcal{C}$-closure is equivalent to the state being an algebra for the closure 2-monad $\mathrm{Cl}$ (§9). By Kelly–Lack's property-like theorem, this is a property — unique up to unique iso — matching Remark 3.1a of *Spatiotemporal Knowledge Presheaves*.

**Remark 5.3.4 (presheaf reading).** Remark 3.1a of *Spatiotemporal Knowledge Presheaves* observes that a fully $\mathcal{C}$-closed spatiotemporal knowledge presheaf is equivalent to a presheaf $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_*(\mathbf{L})$. In the present layered setup, this emerges as a corollary: the total coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$, when every state is a closure-algebra, admits a transpose to a $\lambda$-indexed family of pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}_*$. The name "spatiotemporal knowledge presheaf" is recovered as an algebra-theoretic consequence rather than an axiomatic stipulation.

### 5.4 First example

**Example 5.4.1 (§11.5 of *Spatiotemporal Knowledge Presheaves* in Layer C).** Take $E = \{p_1, p_2, a\}$, $\Pi = \{\text{parent}, \text{adultParent}\}$, $\mathcal{C}$ with specialization $\text{adultParent} \to \text{parent}$ and $\mathrm{dom}(\text{adultParent}) = \{(p_1, a)\}$, $\lambda = \omega$. Closure rule: `adultParent(x, y) ⇒ parent(x, y)`. Initial state $\mathcal{E}_0$ with $v_0(\text{adultParent})(p_1, a) = \mathbf{t}$, else $\bot$.

- **Layer A:** fibration $p : \mathcal{E} \to \mathcal{C}$ with fibers $\mathbf{2}^{\bowtie 9}$.
- **Layer B:** reindexing $f^*$ is specialization in the sense of Definition 6.1 of *Spatiotemporal Knowledge Presheaves*; $\exists_f^k, \forall_f^k$ are the extensions given by Proposition 12.1 there.
- **Layer C:** cascade coalgebra $c$ gives orbit $v_0 \to v_1$ (closure fires to derive $v_1(\text{parent})(p_1, a) = \mathbf{t}$) $\to v_\tau = v_1$ for $\tau \geq 1$.

Full worked examples in §12.

## 6. The Spatial Algebra of Substitutions

This section develops Definition 5.2.1 (B3): Beck–Chevalley coherence for every pullback square in $\mathcal{C}$. The main result (Theorem 6.4.1) proves BC for the spatiotemporal knowledge hyperdoctrine by reducing to a cellwise base-change lemma on the category of equivariant partial maps on $E \times E$.

### 6.1 Morphism inventory

By Proposition 3.1.1, every natural bilattice homomorphism $\phi : A_q \to A_p$ between fiber algebras factors through one of four equivariant index maps on $E \times E$, combined with sub-support restrictions. *Spatiotemporal Knowledge Presheaves*, Definitions 6.1–6.4 name these:

**Definition 6.1.1 (specialization).** A **specialization** $f : q \to p$ consists of predicates $q, p$ and an index-map inclusion $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p) \subseteq E \times E$. Fiber action: $f^*(v)(s, o) = v(s, o)$ for $(s, o) \in \mathrm{dom}(q)$, else $\bot$.

**Definition 6.1.2 (converse).** A **converse** $f : p^c \to p$ is the morphism induced by the swap $(s, o) \mapsto (o, s)$: $f^*(v)(s, o) = v(o, s)$.

**Definition 6.1.3 (subject-projection).** A **subject-projection** $f : q \to p$: $f^*(v)(s, o) = v(s, s)$. Binary predicate $q$ is defined from $p$'s subject-diagonal content.

**Definition 6.1.4 (object-projection).** An **object-projection** $f : q \to p$: $f^*(v)(s, o) = v(o, o)$. Dual of subject-projection.

Theorem 3.6 of *Spatiotemporal Knowledge Presheaves* establishes that each of these induces a bilattice homomorphism. Proposition 4.6 there extends this to preservation of $\odot$ and $\Rightarrow$.

### 6.2 Closure under composition and pullback

**Proposition 6.2.1.** *The four generator classes are closed under composition, with the following composition table at the fiber-action level (for $|E| \geq 3$):*

| $\circ$ | id | sw | sp1 | sp2 |
|---|---|---|---|---|
| id | id | sw | sp1 | sp2 |
| sw | sw | id | sp2 | sp1 |
| sp1 | sp1 | sp1 | sp1 | sp2 |
| sp2 | sp2 | sp2 | sp1 | sp2 |

*(Abbreviations: id = trivial specialization, sw = swap/converse, sp1 = subject-projection, sp2 = object-projection; reading $g \circ f$ from row $g$ and column $f$. Sub-support restrictions compose by intersection.)*

*Proof.* Direct calculation on the index-map level. For example, subject-projection composed with converse: $(s, o) \mapsto (o, s) \mapsto (o, o)$ — object-projection. $\square$

**Proposition 6.2.2.** *The four generator classes are closed under pullback formation in $\mathcal{C}$.*

*Proof.* Ten unordered pullback pairs verified case-by-case in the course of verifying §6.2 (summary: spec×spec → spec on intersection; spec×converse → specialization-with-swap-of-sub-support; spec×subject-proj → specialization of rows; converse×subject-proj → diagonal; subject-proj×object-proj → diagonal; etc.). All pullbacks yield objects in the four-generator closure. $\square$

### 6.3 Finite-limit morphisms decompose as generators

The cartesian structure on $\mathcal{C}$ (finite limits, §3) introduces morphisms from finite-limit constructions: projections $\pi_i : p \times q \to p$, diagonals $\Delta_p : p \to p \times p$, pairings $\langle f, g\rangle$, terminal maps, equalizer maps. None of these requires a new generator class.

**Proposition 6.3.1.** *Every finite-limit construction morphism in $\mathcal{C}$ decomposes as a composition of the four generator classes.*

*Proof sketch.* The uniform-fiber-algebra axiom (5.1.1 A1) makes every cartesian-structure morphism act on fibers as a trivial specialization (when both source and target have the full sub-support $E \times E$) or as a specific four-generator composition (when sub-supports restrict).

- Projections $\pi_i : p \times q \to p$: trivial specialization (identity on fibers).
- Terminal maps $! : p \to \mathbf{1}$: trivial specialization.
- Diagonal $\Delta_p : p \to p \times p$: trivial specialization.
- Pairing $\langle f, g\rangle : r \to p \times q$: composition determined by $f^*$ and $g^*$ (which must agree).
- Equalizer map $e : \mathrm{Eq}(f, g) \to p$: specialization to the sub-support where $f^* = g^*$, computable from the generator classes of $f$ and $g$.

$\square$

**Corollary 6.3.2 (equality-via-equalizer).** *The equalizer of $\mathrm{id}_p$ and $\mathrm{converse}_p$ is a specialization with sub-support $\Delta_E = \{(s, s) : s \in E\}$ — the diagonal of $p$.*

This equalizer characterization sets up §8's equality construction via Lawvere's $\Sigma$ along the diagonal.

### 6.4 Beck–Chevalley coherence

**Theorem 6.4.1 (Beck–Chevalley).** *Let $\mathcal{E}$ be a spatiotemporal knowledge presheaf fibration (Definition 5.1.1). Then $\mathcal{E}$ satisfies (B3) of Definition 5.2.1: for every pullback square in $\mathcal{C}$
$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array}$$
and every $\phi \in \mathcal{E}_B$, the canonical maps
$$\exists_{p_A}^{k}(p_B^*\phi) \to f^*(\exists_g^{k}\phi), \qquad \exists_{p_A}^{t}(p_B^*\phi) \to f^*(\exists_g^{t}\phi)$$
are isomorphisms in $\mathcal{E}_A$. The dual statements for $\forall$ also hold.*

*Proof.* The proof has three parts.

**Part I (cellwise reduction).** All four generators act on fibers by $f^*(v)(s, o) = v(\phi_f(s, o))$ where $\phi_f : E \times E \rightharpoonup E \times E$ is an equivariant partial function (*Spatiotemporal Knowledge Presheaves*, Theorem 3.6, §6.1 above). The left adjoints $\exists_f^{k/t}$ are given cellwise: extension by $\bot$/$\mathbf{f}$ for specialization, swap for converse, row-/column-folds for projections (see §7 for explicit formulas). Dually for $\forall_f$. Compositions of generators are again cellwise reindexings plus cellwise extensions.

BC at the fibration level thus reduces to a cellwise statement at each $(s, o) \in E \times E$: "the canonical map between two composite partial-function-pullback-and-fold expressions is a bijection." This is a pointwise property of the equivariant-partial-map category.

**Part II (pullback closure).** By Proposition 6.2.2, the four generator classes are closed under pullback in $\mathcal{C}$. Thus every $\mathcal{C}$-pullback square lifts, on the fiber level, to a pullback square in the category $\mathbf{IndexMap}(E)$ of equivariant partial maps on $E \times E$.

**Part III (base change in $\mathbf{IndexMap}(E)$).** The category $\mathbf{IndexMap}(E)$ has pullbacks computed as intersections of sub-supports composed with compositions of equivariant partial functions. By the classical base-change lemma for set-indexed categories (Jacobs 1999 Ch 1; Streicher 2018 §13), left Kan extension along a pullback equals pullback of a left Kan extension. This gives BC cellwise. $\square$

**Remark 6.4.2 (uniform-fiber structure makes BC clean).** The spatiotemporal knowledge hyperdoctrine's BC argument is unusually direct because of the uniform-fiber-algebra construction of *Spatiotemporal Knowledge Presheaves* (A1). In classical hyperdoctrines with fiber $P(X)$ varying by type $X$, BC involves non-trivial naturality of sub-object formation across pullback. Here the fibers are uniformly $\mathbf{L}^{\bowtie E \times E}$, and reindexing is cellwise; BC reduces to cellwise index-map pullback, which is immediate.

**Remark 6.4.3 (2-categorical BC in $\mathbf{T}(\mathcal{C}, \lambda)$).** The theorem establishes BC at the 1-categorical level of $\mathcal{C}$. Whether BC lifts to the 2-categorical temporal structure of $\mathbf{T}(\mathcal{C}, \lambda)$ (§4.3) is a separate question; a conjectural positive answer follows Emmenegger et al. 2024's 2-categorical arguments, but a full proof is outside the present scope. *Spatiotemporal Knowledge Cohomology* or a sequel addresses this.

## 7. Quantifier Adjoints

This section gives explicit formulas for the two adjoint systems (B1k, B1t of Definition 5.2.1), proves Frobenius reciprocity for $\wedge_k$ and $\wedge_t$ (B2k, B2t), and exhibits the failure of Frobenius-for-$\odot$ promised in Remark 5.2.4.

### 7.1 Explicit adjoint formulas per generator

**The $\leq_k$-system** (Proposition 12.1 and Remark 12.2 of *Spatiotemporal Knowledge Presheaves*)**.**

**Specialization $f : q \to p$** with $\mathrm{dom}(q) \subseteq \mathrm{dom}(p)$:
- $\exists_f^k(w)(s, o) = w(s, o)$ for $(s, o) \in \mathrm{dom}(q)$, else $\bot$. *(Extension by $\bot$.)*
- $\forall_f^k(w)(s, o) = w(s, o)$ for $(s, o) \in \mathrm{dom}(q)$, else $\top$. *(Extension by $\top$.)*

**Converse $f : p^c \to p$:** $\exists_f^k(w)(s, o) = w(o, s) = \forall_f^k(w)(s, o)$. *(Swap; self-adjoint.)*

**Subject-projection $f : q \to p$:**
- $\exists_f^k(w)(s, s) = \bigvee_k\{w(s, o') : o' \in E\}$; $\exists_f^k(w)(s, o) = \bot$ for $s \neq o$. *(Row-$\vee_k$-fold onto diagonal.)*
- $\forall_f^k(w)(s, s) = \bigwedge_k\{w(s, o') : o' \in E\}$; $\forall_f^k(w)(s, o) = \top$ for $s \neq o$. *(Row-$\wedge_k$-fold.)*

**Object-projection:** dual — column folds.

**$\leq_t$-system** (new to this paper). The bilattice's secondary order $\leq_t$ supports a parallel adjoint triple. For specialization:
- $\exists_f^t(w)(s, o) = w(s, o)$ for $(s, o) \in \mathrm{dom}(q)$, else $\mathbf{f}$. *(Extension by $\mathbf{f}$, the $\leq_t$-bottom.)*
- $\forall_f^t(w)(s, o) = w(s, o)$ for $(s, o) \in \mathrm{dom}(q)$, else $\mathbf{t}$. *(Extension by $\mathbf{t}$, the $\leq_t$-top.)*

Adjoint check: $\exists_f^t(w) \leq_t v \iff \exists_f^t(w)(s, o) \leq_t v(s, o)$ cellwise. On $\mathrm{dom}(q)$: $w \leq_t v$; off: $\mathbf{f} \leq_t v$, always. Equivalent to $w \leq_t f^*v$.

For converse, subject-projection, object-projection: formulas parallel the $\leq_k$-system with $\wedge_t, \vee_t$ replacing $\wedge_k, \vee_k$ and $\mathbf{t}, \mathbf{f}$ replacing $\top, \bot$.

### 7.2 Composition of adjoints

For $g \circ f$, adjoints compose: $\exists_{g \circ f}^{k/t} = \exists_g^{k/t} \circ \exists_f^{k/t}$; similarly for $\forall$. This extends the per-generator formulas to all $\mathcal{C}$-morphisms via Proposition 6.2.1's composition closure.

### 7.3 Frobenius for $\wedge_k$ and $\wedge_t$

**Theorem 7.3.1 (Frobenius reciprocity).** *For any generator $f : q \to p$, any $\alpha \in \mathcal{E}_p$, $\phi \in \mathcal{E}_q$:*
$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi),$$
$$\exists_f^t(f^*(\alpha) \wedge_t \phi) \cong \alpha \wedge_t \exists_f^t(\phi).$$

*Proof.* Case-by-case on the four generators. The structural reason is that $\wedge_k$-absorber is $\bot$ (aligned with specialization's $\exists_f^k$-extension) and $\wedge_t$-absorber is $\mathbf{f}$ (aligned with $\exists_f^t$'s extension). One case in detail:

**Specialization, $\leq_k$-system.** On $(s, o) \in \mathrm{dom}(q)$: both sides equal $\alpha(s, o) \wedge_k \phi(s, o)$. Off $\mathrm{dom}(q)$: LHS is $\bot$ (since $\exists_f^k$ extends by $\bot$); RHS is $\alpha(s, o) \wedge_k \bot = \bot$ (since $\bot$ is $\wedge_k$-absorber). Equal. ✓

**Subject-projection, $\leq_k$-system.** At $(s, s)$: $\exists_f^k(f^*\alpha \wedge_k \phi)(s, s) = \bigvee_k\{\alpha(s, s) \wedge_k \phi(s, o') : o'\} = \alpha(s, s) \wedge_k \bigvee_k_{o'} \phi(s, o')$ (by bilattice distributivity; *Spatiotemporal Knowledge Presheaves* §2.1) $=$ RHS. Off-diagonal: both $\bot$. ✓

Converse and object-projection analogous. The $\leq_t$-cases mirror with $\mathbf{f}$ replacing $\bot$ and $\wedge_t, \vee_t$ replacing $\wedge_k, \vee_k$. $\square$

### 7.4 Frobenius-for-$\odot$ fails

**Proposition 7.4.1.** *Frobenius-for-$\odot$ does NOT hold for specialization, subject-projection, or object-projection. It holds for converse only.*

*Counterexample for specialization.* Let $E = \{a, b\}$, $\mathrm{dom}(q) = \{(a, a)\}$, $\mathrm{dom}(p) = E \times E$. Take $\alpha \in \mathcal{E}_p$ with $\alpha(a, b) = \mathbf{f}$ (else arbitrary). Take $\phi \in \mathcal{E}_q$ with $\phi(a, a) = \bot$.

- LHS at $(a, b)$: $\exists_f^k$ extends by $\bot$, so $= \bot$.
- RHS at $(a, b)$: $\alpha(a, b) \odot \exists_f^k(\phi)(a, b) = \mathbf{f} \odot \bot$. Computing: $\mathbf{f} = (0, 1)$, $\bot = (0, 0)$; $\mathbf{f} \odot \bot = (0 \cdot 0, (0 \to 0) \wedge (0 \to 1)) = (0, 1) = \mathbf{f}$.

LHS $= \bot \neq \mathbf{f} = $ RHS. ✗

**Structural cause.** Frobenius-for-$\otimes$ requires the conjunction's absorber to equal the $\exists_f$-extension value. For specialization's $\exists_f^k$, the extension is $\bot$; $\wedge_k$'s absorber is $\bot$ (aligned); $\odot$'s absorber is $\mathbf{f}$ (not aligned). The non-integrality of $\odot$ on $\mathbf{L}^\bowtie$ (*Spatiotemporal Knowledge Presheaves* Remark 4.2) is the fundamental obstruction.

**Where $\odot$-Frobenius succeeds.** Converse's $\exists_f^k = f^*$ is the swap — no $\bot$-extension, so no absorber-alignment issue. For converse, Frobenius-for-$\odot$ holds by the same computation as Frobenius-for-$\wedge_k$ with $\odot$ in place of $\wedge_k$:
$$\exists_f^k(f^*\alpha \odot \phi)(s, o) = (f^*\alpha \odot \phi)(o, s) = \alpha(s, o) \odot \phi(o, s) = \alpha(s, o) \odot \exists_f^k(\phi)(s, o). \checkmark$$

Frobenius is therefore stated for $\wedge_k$ (and $\wedge_t$), not $\odot$. This is a genuine departure from Maruyama 2021's substructural-hyperdoctrine convention ($\otimes$-Frobenius), forced by the non-integral bilattice setting.

### 7.5 Relation to the $\odot \dashv \Rightarrow$ adjunction of *Spatiotemporal Knowledge Presheaves* residuation

The failure of Frobenius-for-$\odot$ does not invalidate the residuation adjunction $\odot \dashv \Rightarrow$ of *Spatiotemporal Knowledge Presheaves* (Theorem 4.1 there). That adjunction lives at the propositional-connective level, within fibers, and operates on the $\leq_t$-order; it remains correct as stated.

This paper's fibers thus carry two distinct conjunction-style operations serving different roles:

- **$\wedge_k$ (and $\wedge_t$):** bilattice meet operations. Frobenius holds; used for hyperdoctrinal quantifier coherence.
- **$\odot$:** twist-product fusion. Residuated ($\odot \dashv \Rightarrow$); used for the linear-logic reading of *Spatiotemporal Knowledge Presheaves* (§4.5 there); does *not* carry Frobenius uniformly.

The Nelson identity (Theorem 9.4 of *Spatiotemporal Knowledge Presheaves*) — $(x \Rightarrow (x \Rightarrow y)) \wedge_k (\sim y \Rightarrow (\sim y \Rightarrow \sim x)) = x \Rightarrow y$ on $\mathbf{FOUR}$ — is the $\odot \dashv \Rightarrow$-side structural conservation law, complementing Frobenius-for-$\wedge_k$ on the knowledge-meet side.

### 7.6 BC plus Frobenius interaction

Lawvere 1970's general observation: BC for $\exists$-along-pullback plus $\otimes$-absorber-equals-$\exists$-extension implies Frobenius-for-$\otimes$. This paper realizes this: BC (Theorem 6.4.1) holds cellwise independent of conjunction choice; the absorber-alignment condition holds for $\wedge_k, \wedge_t$ and fails for $\odot$; Frobenius follows accordingly.

This clean structural statement — *BC is about pullback-coherence, Frobenius additionally requires absorber-alignment* — separates the two hyperdoctrinal coherence conditions in a way that integral hyperdoctrines (Lawvere, Seely) conflate.

## 8. Equality and Comprehension

This section derives equality predicates and comprehension schemas from the Layer B structure. The central observation: because a spatiotemporal knowledge hyperdoctrine carries two parallel adjoint systems ($\leq_k$ and $\leq_t$, §7), it carries two Lawvere-style equality predicates — a *classical* $\mathbf{t}/\mathbf{f}$-valued equality $=_E$ from the $\leq_t$-system, and a *paraconsistent* $\top/\bot$-valued equality $\Delta_E^k$ from the $\leq_k$-system. Classical equality is **derived**, not postulated. Comprehension holds in both schemas (Theorem 8.2.2 below).

### 8.1 Equality constructions

**Lawvere 1970's construction.** For a hyperdoctrine with adjoint triple $\exists_f \dashv f^* \dashv \forall_f$ and a diagonal term $\langle X, X\rangle : X \to X \times X$, the equality predicate $\Delta_X \in P(X \times X)$ is defined as $\Delta_X := \exists_{\langle X, X\rangle}(1_X)$, the $\Sigma$-image of the fiber terminal.

This paper's adaptation: for the spatiotemporal knowledge hyperdoctrine, fix a specialization $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E = \{(s, s) : s \in E\}$ (the diagonal sub-support, derived from Corollary 6.3.2). The Lawvere equality is $\exists_g^{k/t}(\mathbf{1}_q^{k/t})$ — $\Sigma$ of the fiber terminal for the relevant order.

**Definition 8.1.1 (paraconsistent equality).** The **$\leq_k$-equality** is
$$\Delta_E^k := \exists_g^k(\mathbf{1}_q^k) \in \mathcal{E}_p$$
where $\mathbf{1}_q^k$ is the $\leq_k$-terminal of $\mathcal{E}_q$ (constant-$\top$ valuation on $\Delta_E$).

Computing (§7.1 specialization case): $\Delta_E^k(s, o) = \top$ for $s = o$; $\Delta_E^k(s, o) = \bot$ for $s \neq o$.

**Definition 8.1.2 (classical equality).** The **$\leq_t$-equality** is
$$=_E \; := \; \exists_g^t(\mathbf{1}_q^t) \in \mathcal{E}_p$$
where $\mathbf{1}_q^t$ is the $\leq_t$-terminal of $\mathcal{E}_q$ (constant-$\mathbf{t}$ valuation on $\Delta_E$).

Computing: $=_E(s, o) = \mathbf{t}$ for $s = o$; $=_E(s, o) = \mathbf{f}$ for $s \neq o$. **This is classical two-valued equality, derived without postulating.**

**Remark 8.1.3 (two equality predicates on one spatiotemporal knowledge presheaf).** Both $\Delta_E^k$ and $=_E$ live as distinguished fibers of the same spatiotemporal knowledge hyperdoctrine, derived from the same diagonal specialization $g$, differing only in which order's $\exists$-adjoint is applied. A spatiotemporal knowledge hyperdoctrine therefore carries *two* equality predicates simultaneously; applications select the one matching their intended semantics:

- **Distributed / CRDT / paraconsistent reasoning:** use $\Delta_E^k$. The $\top$ on diagonal means "information-maximal"; $\bot$ off means "no claim." Stable under $\vee_k$-merge.
- **Classical knowledge-base / database queries:** use $=_E$. Two-valued, compatible with classical entailment.
- **Paraconsistent KR with designated values** (Ma & Hitzler 2009 style): use $\Delta_E^k$, treating $\top$ cells as conflicts that do not trivialize.

**Remark 8.1.4 (comparison with prior literature).** Bilattice first-order logics in the literature (Omori–Wansing BD∆; Kamide–Zohar 2020; Běhounek–Daňková–Dvořák 2023) postulate classical $\mathbf{t}/\mathbf{f}$-valued equality as a primitive relation. This paper's derivation shows the postulate is unnecessary: classical equality falls out of the $\leq_t$-adjoint system via Lawvere's construction. The postulate-as-primitive convention arises from not having identified the dual adjoint triple.

### 8.2 Comprehension schemas

**Definition 8.2.1 (extension functor, $\leq_t$).** For $p \in \mathcal{C}$, the **extension functor** $\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p$ sends a specialization $g : q \to p$ to $\exists_g^t(\mathbf{1}_q^t) \in \mathcal{E}_p$ — the characteristic function of $\mathrm{dom}(q)$.

Intuitively, $\mathrm{Ext}^t(g)$ takes value $\mathbf{t}$ on $\mathrm{dom}(q)$ and $\mathbf{f}$ elsewhere.

**Theorem 8.2.2 (Lawvere comprehension).** *For every $p \in \mathcal{C}$, the extension functor $\mathrm{Ext}^t$ has a right adjoint*
$$\{p : -\}_\mathbf{t} : \mathcal{E}_p \to \mathcal{C}/p$$
*sending $\psi \in \mathcal{E}_p$ to the specialization $q_\psi \to p$ with $\mathrm{dom}(q_\psi) := \psi^{-1}(\mathbf{t})$.*

*Proof.* The adjunction $\mathrm{Ext}^t(g) \leq_t \psi \iff g$ factors through $\{p : \psi\}_\mathbf{t}$:

- $\mathrm{Ext}^t(g) \leq_t \psi$ means $\exists_g^t(\mathbf{1}_q^t)(s, o) \leq_t \psi(s, o)$ for all $(s, o)$. On $\mathrm{dom}(q)$: $\mathbf{t} \leq_t \psi(s, o) \iff \psi(s, o) = \mathbf{t}$ (since $\mathbf{t}$ is $\leq_t$-top). Off: $\mathbf{f} \leq_t \psi$, always. So: $\mathrm{dom}(q) \subseteq \psi^{-1}(\mathbf{t})$.
- $g$ factors through $\{p : \psi\}_\mathbf{t}$ iff $\mathrm{dom}(q) \subseteq \mathrm{dom}(q_\psi) = \psi^{-1}(\mathbf{t})$.

Same condition. ✓ $\square$

**Theorem 8.2.3 (parallel comprehension in $\leq_k$).** *The analogous construction in the $\leq_k$-system gives a right adjoint $\{p : -\}_\top : \mathcal{E}_p \to \mathcal{C}/p$ to $\mathrm{Ext}^k$, with $\mathrm{dom}(q_\psi) := \psi^{-1}(\top)$.*

*Proof.* Parallel to 8.2.2 with $\mathbf{t} \leadsto \top$, $\mathbf{f} \leadsto \bot$, and $\leq_t \leadsto \leq_k$. $\square$

**Remark 8.2.4 (two comprehension designations).** The two comprehension schemas correspond to different "designated truth values":

- $\{p : \psi\}_\mathbf{t}$: **classical designation**, "$\psi$ holds (is $\mathbf{t}$)."
- $\{p : \psi\}_\top$: **information designation**, "$\psi$ is information-maximal (is $\top$)."

Both are right adjoints to extension functors; both satisfy the Lawvere-style comprehension schema.

**Remark 8.2.5 (Pitts-style designated comprehension).** Pitts 2002 identified a comprehension property weaker than Lawvere's that still supports topos constructions. In the bilattice setting, the analogue is **Belnap-designated comprehension** $\{p : \psi\}_\mathrm{des} := \psi^{-1}(\{\mathbf{t}, \top\})$ — sub-support where $\psi$ takes designated values. The adjointness argument is more delicate (requires a modified extension functor); full development deferred.

### 8.3 Two internal logics

The two adjoint systems plus their comprehension schemas furnish every spatiotemporal knowledge hyperdoctrine with two internal first-order logics:

- **Classical logic** via $\leq_t$: truth-valued, $\mathbf{t}/\mathbf{f}$-valued equality $=_E$, classical Lawvere-comprehension $\{-\}_\mathbf{t}$. Recovers (a bilattice extension of) standard first-order predicate logic.

- **Information logic** via $\leq_k$: knowledge-valued, $\top/\bot$-valued paraconsistent equality $\Delta_E^k$, information comprehension $\{-\}_\top$. Stable under CRDT-style merge operations (*Spatiotemporal Knowledge Presheaves* §9.6); compatible with paraconsistent description logics.

Both logics are internal to the same fibration. Applications select the logic matching their intended semantics; queries can be framed in either.

**Proposition 8.3.1 (parallel truth-valued logics on every spatiotemporal knowledge presheaf).** *Every spatiotemporal knowledge hyperdoctrine $\mathcal{E}$ supports:*

- *A classical first-order theory $T_t(\mathcal{E})$ over the $\leq_t$-adjoint system, with equality $=_E$ and comprehension $\{-\}_\mathbf{t}$.*
- *A paraconsistent first-order theory $T_k(\mathcal{E})$ over the $\leq_k$-adjoint system, with equality $\Delta_E^k$ and comprehension $\{-\}_\top$.*

*These theories are distinct: a sentence derivable in one need not be derivable in the other.*

*Proof.* The two systems have different adjoints, different equalities, different comprehension. A concrete example of divergence: "$\forall x, y. x = y \vee x \neq y$" is classically derivable (from excluded middle on $=_E$, which is two-valued) but not paraconsistently (since $\Delta_E^k$ admits $\top$ as a non-classical value at off-diagonal cells in inconsistent states). $\square$

### 8.4 Comprehension-as-equalizer

Lawvere 1970 (Theorem in Section 2) gives a comprehension-as-equalizer characterization: under suitable conditions on equality proofs, $\{X : f_1 \circ f_2\} \hookrightarrow X \rightrightarrows Y$ is an equalizer in the base category.

This paper's version: combining Corollary 6.3.2 (equality-via-equalizer) with Theorem 8.2.2 (comprehension), we obtain that for terms $f_1, f_2 : p \to q$ in $\mathcal{C}$, the extension $\{p : f_1 \circ^\mathcal{C} f_2\}_\mathbf{t}$ — where $\circ^\mathcal{C}$ denotes the classical equality predicate composed with the terms — gives the equalizer $\mathrm{Eq}(f_1, f_2)$ up to canonical iso.

The coherence conditions for this theorem to hold (Lawvere 1970's "uniqueness of equality proofs" + "strictness" hypotheses) translate to conditions on the spatiotemporal knowledge hyperdoctrine's fiber algebra. This paper states the classical-designation version; a full bilattice-aware treatment is deferred to future work.

## 9. Closure as a KZ 2-Monad

Section 5 of *Spatiotemporal Knowledge Presheaves* defines the closure operator as a family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ of endomaps on fibers, satisfying monotonicity, inflationarity, idempotence, and $\mathcal{C}$-naturality. This paper lifts this to a **lax-idempotent 2-monad** on spatiotemporal knowledge presheaf fibrations, whose pseudo-algebras are exactly $\mathcal{C}$-closed knowledge presheaves.

The closure 2-monad is distinct from the fibration-KZ 2-adjunction of §4 ($\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$). The distinction is structurally important: the two KZ structures interact cleanly at the fibration level but are independent.

### 9.1 Two KZ structures disentangled

The theory developed here has two lax-idempotent 2-monadic structures, living at different levels:

**Fibration-KZ ($\mathbb{M}$ and $\mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$, §4.2).** Gives $\mathcal{E}$ its cloven-fibration structure over $\mathcal{C}$ — the "vertical" part of the spatiotemporal knowledge hyperdoctrine. Pseudo-algebras for $\mathbb{M}$ = pseudo-coalgebras for $\mathbb{N}$ = cloven fibrations.

**Closure-KZ ($\mathrm{Cl}$ on $\mathbf{PrFib}(\mathcal{C})$, this section).** Gives the spatiotemporal knowledge presheaf its $\mathcal{C}$-closure structure — the "state-saturation" part carried through cascade iterations. Pseudo-algebras = $\mathcal{C}$-closed spatiotemporal knowledge presheaf fibrations.

The two are independent in the following sense:
- $\mathbb{M}$-algebra status: "$\mathcal{E}$ is a fibration." A vertical structural property.
- $\mathrm{Cl}$-algebra status: "$\mathcal{E}$'s state is closed under $\mathcal{C}$-inference." A saturation property.

They compose: a presheaf that is both an $\mathbb{M}$-algebra (= cloven fibration) and a $\mathrm{Cl}$-algebra (= $\mathcal{C}$-closed) is a **fully $\mathcal{C}$-closed spatiotemporal knowledge presheaf** (cf. Definition 3.1a of *Spatiotemporal Knowledge Presheaves* and Remark 5.3.3 above).

### 9.2 The closure 2-monad

**Definition 9.2.1 (closure 2-monad).** Given a $\mathcal{C}$-natural closure family $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ as in Definition 5.1 of *Spatiotemporal Knowledge Presheaves*, the **closure 2-monad**
$$\mathrm{Cl} : \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E) \to \mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$$
is defined by $\mathrm{Cl}(\mathcal{E})_q := \mathrm{cl}_q(\mathcal{E}_q)$ — fiberwise application of the closure family.

- **Unit** $\eta : 1 \Rightarrow \mathrm{Cl}$: the inclusion-into-closure. At each fiber, $\eta_{\mathcal{E}, p}(v) : v \to \mathrm{cl}_p(v)$ is the inflationarity 2-cell $v \leq_k \mathrm{cl}_p(v)$.
- **Multiplication** $\mu : \mathrm{Cl}^2 \Rightarrow \mathrm{Cl}$: the nested-closure collapse. In the strict case, $\mu$ is identity; in the lax case, $\mu$ is a canonical non-identity 2-cell witnessing idempotence up to coherence.

### 9.3 Lax-idempotent verification

**Proposition 9.3.1 ($\mathrm{Cl}$ is lax-idempotent).** *The 2-monad $\mathrm{Cl}$ satisfies Kelly–Lack (K1): there is an adjunction $\mu \dashv \eta_\mathrm{Cl}$ in $[\mathbf{PrFib}, \mathbf{PrFib}]$ with counit $\mu \cdot \eta_\mathrm{Cl} = 1_\mathrm{Cl}$.*

*Proof.* Checking (K1) requires verifying two conditions:

(i) The counit $\mu \cdot \eta_\mathrm{Cl}$ on $\mathrm{Cl}$: at each fiber, $\mu_{\mathrm{Cl}(\mathcal{E}), p} \circ \eta_{\mathrm{Cl}(\mathcal{E}), p}$ traces $\mathrm{cl}_p(v) \xrightarrow{\eta} \mathrm{cl}_p(\mathrm{cl}_p(v)) \xrightarrow{\mu} \mathrm{cl}_p(v)$. By inflationarity and idempotence (strict or lax), this is the identity. ✓

(ii) Adjoint triangle equalities hold by the monad laws.

So $\mu \dashv \eta_\mathrm{Cl}$. By Kelly–Lack (K1), $\mathrm{Cl}$ is lax-idempotent. $\square$

**Corollary 9.3.2 (algebra uniqueness).** *By Kelly–Lack's property-like theorem (K2), every spatiotemporal knowledge presheaf fibration admits at most one $\mathrm{Cl}$-algebra structure up to unique iso. Being a $\mathrm{Cl}$-algebra is a property, not additional structural data.*

### 9.4 Algebras of $\mathrm{Cl}$

**Theorem 9.4.1.** Pseudo-algebras of $\mathrm{Cl}$ are exactly the $\mathcal{C}$-closed presheaf fibrations, in the sense of Definition 3.1a of *Spatiotemporal Knowledge Presheaves*.

*Proof.* A pseudo-algebra structure on $\mathcal{E}$ is a morphism $a : \mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ inverse to $\eta_\mathcal{E}$ up to canonical iso. By inflationarity, $\eta_\mathcal{E}$ is an inclusion $\mathcal{E} \hookrightarrow \mathrm{Cl}(\mathcal{E})$; for $a$ to be inverse requires $\mathrm{Cl}(\mathcal{E}) = \mathcal{E}$ — i.e., $\mathcal{E}$ is already closed. Conversely, every $\mathcal{C}$-closed spatiotemporal knowledge presheaf admits the identity as its canonical $\mathrm{Cl}$-algebra structure. ✓ $\square$

This recovers Remark 3.1a of *Spatiotemporal Knowledge Presheaves* exactly: "$\mathcal{C}$-closure is the characteristic property that the closure operator produces" is now upgraded to "being $\mathcal{C}$-closed is a $\mathrm{Cl}$-algebra structure, which is unique-up-to-iso by (K2)."

### 9.5 The cascade endofunctor

**Definition 9.5.1 (cascade endofunctor).** Given a spatiotemporal knowledge hyperdoctrine $\mathcal{E}$ and an increment sequence $U = (u_\tau)_{\tau < \lambda}$, the **cascade endofunctor** $F_U : \mathbf{PrFib}(\mathcal{C}) \to \mathbf{PrFib}(\mathcal{C})$ is
$$F_U(\mathcal{E})_\tau := \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$$
where $\mathrm{Cl}$ is the closure 2-monad (Definition 9.2.1) and $\vee_k u_\tau$ is fiberwise $\leq_k$-join with the increment at step $\tau$.

Unpacking: at each cascade step, first apply closure (saturate under derivable consequences), then merge in new external evidence. Iterate $\lambda$ times.

**Remark 9.5.2.** This is the corrected form of the cascade endofunctor. An earlier version (pre-correction) wrote $F_U = \mathbb{M}(\mathcal{E}) \vee_k U$ conflating fibration-KZ with closure-KZ; the correct form uses $\mathrm{Cl}$, as established in §9.1's disentanglement.

### 9.6 Quiescence as algebra-structure

**Proposition 9.6.1 (quiescence ↔ closure-algebra).** *A spatiotemporal knowledge presheaf $(\mathcal{E}, c)$ reaches a cascade fixed point at ordinal $\tau^*$ iff the state $\mathcal{E}_{\tau^*}$ is a $\mathrm{Cl}$-algebra (equivalently, $\mathcal{C}$-closed).*

*Proof.* Cascade fixed point means $c^{\tau^*+1} = c^{\tau^*}$, i.e., $F_U(\mathcal{E}_{\tau^*}) = \mathcal{E}_{\tau^*}$. Assuming eventually-zero increments (so $u_\tau = \bot$ for $\tau > \tau_0$), this reduces to $\mathrm{Cl}(\mathcal{E}_{\tau^*}) = \mathcal{E}_{\tau^*}$, which is the definition of $\mathcal{C}$-closure = $\mathrm{Cl}$-algebra structure. ✓ $\square$

This unifies "quiescence" (Definition 5.5 of *Spatiotemporal Knowledge Presheaves*) with $\mathrm{Cl}$-algebra structure: the cascade stabilizes iff the state acquires the (property-like) $\mathrm{Cl}$-algebra structure.

### 9.7 Regime-dependent structure

The closure 2-monad $\mathrm{Cl}$ is strict-idempotent in the finite Scott-continuous regime and genuinely lax-idempotent otherwise:

- **Strict-idempotent $\mathrm{Cl}$:** closure satisfies $\mathrm{cl}_p^2 = \mathrm{cl}_p$ on the nose. $\mu = $ identity. Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* (cascade convergence) applies.
- **Genuinely lax-idempotent $\mathrm{Cl}$:** $\mathrm{cl}_p^2 = \mathrm{cl}_p$ only up to canonical 2-cell. $\mu$ is non-identity. Cascade has closure ordinal exceeding $\omega$ (Theorem 3.2.2 is violated).

§10 analyzes the boundary between these regimes into four sub-regimes (A/B/C/D) and formalizes aperiodicity.

### 9.8 Revised closure operator definition for general use

The strict-idempotence axiom of Definition 5.1 in *Spatiotemporal Knowledge Presheaves* becomes, in the 2-categorical setting:

**Definition 9.8.1 (closure operator, 2-categorical).** A **closure operator** on a spatiotemporal knowledge presheaf fibration $\mathcal{E}$ is a fibered endofunctor $\mathrm{Cl} : \mathcal{E} \to \mathcal{E}$ satisfying:

1. Monotone in $\leq_k$ (2-functoriality).
2. Inflationary (unit of 2-monad).
3. **Lax-idempotent**: $\mu \dashv \eta_\mathrm{Cl}$ with identity counit (Kelly–Lack K1).
4. $\mathcal{C}$-natural.

Under Scott-continuity (Definition 3.2.1), Definition 9.8.1 reduces to Definition 5.1 of *Spatiotemporal Knowledge Presheaves* (strict idempotence is recovered because lax-idempotence + Scott-continuity implies strict).

## 10. The Finite/Infinite Dichotomy

The cascade convergence of Theorem 5.4 in *Spatiotemporal Knowledge Presheaves* assumes finite $\mathbf{L}, E, \mathcal{C}$. Theorem 3.2.2 above extends to infinite $E$ under Scott-continuity. This section completes the picture: a four-regime hierarchy indexed by the closure ordinal $\kappa$ of the cascade endofunctor. Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* sits in the leftmost regime; the "aperiodic in the infinite" regime is the rightmost.

### 10.1 The closure ordinal

**Definition 10.1.1 (closure ordinal).** For a cascade endofunctor $F_U$ starting from initial spatiotemporal knowledge presheaf $\mathcal{E}_0$, the **closure ordinal**
$$\kappa(F_U, \mathcal{E}_0)$$
is the least ordinal $\tau$ such that $F_U^{\tau+1}(\mathcal{E}_0) = F_U^\tau(\mathcal{E}_0)$. If no such ordinal exists in the ambient universe, $\kappa = \infty$.

By Knaster–Tarski plus transfinite induction, $\kappa \leq |\mathbf{PrFib}|^+$ in any fixed ambient (successor cardinal of the 2-category's object class).

### 10.2 The four regimes

**Theorem 10.2.1 (dichotomy).** *For a spatiotemporal knowledge presheaf $(\mathcal{E}, c)$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with eventually-zero increments and initial state $\mathcal{E}_0$, let $\kappa := \kappa(F_U, \mathcal{E}_0)$. Exactly one of the following holds:*

**Regime A (strict).** $(\mathbf{L}, E, \mathcal{C})$ are all finite. Then $\kappa < \omega$. The closure-KZ $\mathrm{Cl}$ is strict-idempotent. $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$ as a 1-category. Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* applies.

**Regime B ($\omega$-Scott).** *$\mathrm{cl}$ is Scott-continuous; at least one of $\mathbf{L}, E, \mathcal{C}$ is infinite. Then $\kappa \leq \omega$. Effectively-strict closure at the $\omega$-limit. Theorem 3.2.2 applies.*

**Regime C (transfinite-bounded).** *$\mathrm{cl}$ is non-Scott-continuous (infinitary inference rules on infinite $E$); the state space has bounded cardinality. Then $\omega < \kappa < |\mathbf{PrFib}|^+$. Closure-KZ $\mathrm{Cl}$ is genuinely lax-idempotent. $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional up to $\kappa$, then stabilizes.*

**Regime D (aperiodic).** *$\mathrm{cl}$ is non-Scott-continuous; the state space is unbounded (proper class or inaccessible cardinal). Then $\kappa = \infty$ in the working universe. Cascade is strictly ascending at every ordinal step.*

*Proof.* Regimes A and B follow from Proposition 3.1.1 and Theorem 3.2.2 respectively. Regime C follows from Cousot–Cousot / Knaster–Tarski transfinite iteration of non-Scott-continuous closure. Regime D: if $\kappa < $ any set-size ordinal, then $\kappa \leq |\mathbf{PrFib}|^+$ (Knaster–Tarski); unbounded state space means no such bound, so $\kappa = \infty$. $\square$

### 10.3 Spatial vs temporal infinity

"Infinite" in the dichotomy has two independent senses:

- **Spatial infinity:** $E$ or $\mathcal{C}$ infinite, making fiber algebras $A_p = \mathbf{L}^{\bowtie E \times E}$ infinite.
- **Temporal infinity:** closure ordinal $\kappa > \omega$, i.e., closure fails to stabilize at $\omega$.

**Proposition 10.3.1.** *Temporal infinity requires spatial infinity: finitary inference rules on a finite state space trivially stabilize within finite steps.*

| | Spatial finite | Spatial infinite |
|---|---|---|
| **Finitary closure** | Regime A | Regime B |
| **Infinitary closure** | Regime A | Regime C/D |

Temporal infinity specifically arises from quantifier-induced infinitary inference rules ($\forall$-antecedents over infinite $E$). This is the precise mechanism by which the hyperdoctrinal quantifier structure flagged in §12.1 of *Spatiotemporal Knowledge Presheaves* destabilizes the finite-convergence theorem there.

### 10.4 Formal aperiodicity

**Definition 10.4.1 (aperiodic cascade).** A cascade is **aperiodic** iff its closure ordinal $\kappa \geq \omega_1$, i.e., no countable ordinal is a strict fixed point.

**Theorem 10.4.2.** A cascade is aperiodic iff its closure operator $\mathrm{cl}$ is non-Scott-continuous and its state space has cofinality at least $\omega_1$.

*Proof.* The Cousot–Cousot bound gives $\kappa \leq |\mathbf{PrFib}|^+$. If $\mathrm{cl}$ is Scott-continuous, $\kappa \leq \omega$ (Theorem 3.2.2), so not aperiodic. Conversely, non-Scott-continuity plus sufficient cofinality in the state space lets $\kappa$ exceed every countable ordinal. $\square$

Aperiodic cascades are the natural home for *Spatiotemporal Knowledge Cohomology*'s cohomology: orbits that do not stabilize but are *coherent* — strictly $\leq_k$-ascending, carrying all 2-cell information of the KZ diamond — and whose invariants are not accessible via fixed-point theorems.

### 10.5 Regime-dependent structure of the KZ diamond

The "KZ-lax-idempotent diamond" of §4.3 has regime-dependent content:

- **Regime A:** Diamond 2-cells trivialize. Closure-KZ and fibration-KZ both strict-idempotent. $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$.
- **Regime B:** Diamond 2-cells trivialize at $\omega$; up to $\omega$ the cascade sequence has genuine 1-cells but strictifies at the $\omega$-limit.
- **Regime C:** Diamond 2-cells are non-trivial up to $\kappa$; $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional in a bounded range.
- **Regime D:** Diamond 2-cells are non-trivial throughout. $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional without bound. **This is the regime where the KZ-lax-idempotent diamond is fully "alive."**

The finite-case picture of *Spatiotemporal Knowledge Presheaves* corresponds to Regime A; the novel content of the present paper lies in Regimes B, C, and especially D; the cohomology of *Spatiotemporal Knowledge Cohomology* targets Regime D specifically.

### 10.6 Where each regime occurs

Typical sources for each regime:

- **Regime A:** finite relational databases, finite TBoxes, finite Kripke frames. The examples in §§11.1–11.5 of *Spatiotemporal Knowledge Presheaves* all sit here.
- **Regime B:** countable knowledge bases with finitary inference (logic programming, description logics over infinite entity spaces with finitary rules).
- **Regime C:** infinite KBs with explicit universal quantifiers over finite subsets of an infinite entity space, stabilizing after the quantifier-induced closures complete.
- **Regime D:** open-world knowledge representation over class-sized entity spaces with unrestricted universal quantification; certain cohomologically rich dynamical systems.

### 10.7 Recovery of Theorem 5.4 from *Spatiotemporal Knowledge Presheaves*

Theorem 5.4 of *Spatiotemporal Knowledge Presheaves* asserts: "if $\mathbf{L}, E, \mathcal{C}$ are finite and increments are eventually zero, the cascade stabilizes at $\tau^* < \omega$." This is the Regime A statement of Theorem 10.2.1. The dichotomy theorem sharpens the conclusion by extending to infinite settings (Regimes B, C, D) with corresponding conclusions (convergence at $\omega$, transfinite convergence, or aperiodicity).

## 11. Priestley Dualizability

Section 8 of *Spatiotemporal Knowledge Presheaves* establishes Priestley duality for distributive bilattices via Jung–Rivieccio 2012: $\mathbf{DBiLat}^{\mathrm{op}} \simeq \mathbf{PairedPriSp}$. This section lifts the duality from fibers to the full spatiotemporal knowledge hyperdoctrine structure. The main result (Theorem 11.1.1) is existence and coherence of a dual object; cohomology on the dual is the target of *Spatiotemporal Knowledge Cohomology*.

### 11.1 The dualization theorem

**Theorem 11.1.1 (Priestley dualizability).** For every spatiotemporal knowledge hyperdoctrine $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$, there exists a coherent dual structure $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*)$ with:

- *Dual opfibration $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$ with fibers $\mathcal{E}^*_q = \mathrm{Spec}(A_q) \in \mathbf{PairedPriSp}$.*
- *Dual reindexing $(f^*)^* : \mathcal{E}^*_q \to \mathcal{E}^*_p$ for each $f : q \to p$ in $\mathcal{C}$, with variance reversed (opfibration).*
- *Dual adjoint systems: $\exists_f^{k/t} \dashv f^* \dashv \forall_f^{k/t}$ dualize to dual adjoint triples on Priestley; Frobenius, BC, comprehension all preserved.*
- *Dual fibration-KZ 2-adjunction: $\mathbb{M}^* \dashv \mathbb{N}^*$ on $\mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$, with $\mathbb{M}^*$ now lax-idempotent 2-comonad and $\mathbb{N}^*$ colax-idempotent 2-monad (roles swapped, diamond preserved).*
- *Dual closure 2-comonad $\mathrm{Cl}^*$ with pseudo-coalgebras corresponding to $\mathcal{C}$-closed states on the dual side.*
- *Dual temporal 2-category $\mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}})$ with cascade algebra $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$.*

*All structural coherences (four checks below) are satisfied.*

### 11.2 Proof: per-piece dualization

**Fiberwise duality (§8 of *Spatiotemporal Knowledge Presheaves*).** Theorem 8.1 there, following Jung–Rivieccio 2012, gives $\mathbf{DBiLat}^{\mathrm{op}} \simeq \mathbf{PairedPriSp}$. Applied fiberwise, each $\mathcal{E}_q = A_q$ dualizes to a paired Priestley space $\mathcal{E}^*_q = \mathrm{Spec}(A_q)$.

**Opfibration variance.** A fibration $p : \mathcal{E} \to \mathcal{C}$ whose fibers are in a contravariantly-dual category ($\mathbf{DBiLat}$ vs $\mathbf{PairedPriSp}^{\mathrm{op}}$) dualizes to an opfibration $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$: morphism direction stays on $\mathcal{C}$-side but variance on the fiber-direction flips.

**Generator dualization.** Each of the four generators has a Priestley dual:
- Specialization dualizes to *inclusion of Priestley spectra* (extending from sub-support spectrum to full-support spectrum).
- Converse dualizes to the *swap* on Priestley pairs.
- Subject-projection dualizes to *diagonal-extension* (lifting a function on diagonal points to a rowwise function).
- Object-projection: dually.

**Adjoint-system dualization.** $\leq_k$ on fibers corresponds to Priestley-refinement order on paired Priestley points; $\leq_t$ to designated-values-comparison order. Adjoints in each order dualize via Jung–Rivieccio functoriality; explicit formulas follow from §8 of *Spatiotemporal Knowledge Presheaves* together with §7 above.

**Fibration-KZ dualization.** By the $\mathcal{K}^{\mathrm{op}}$-identity:

| Primal | Dual |
|---|---|
| $\mathbb{M}$ colax-idempotent 2-monad | $\mathbb{M}^*$ lax-idempotent 2-comonad |
| $\mathbb{N}$ lax-idempotent 2-comonad | $\mathbb{N}^*$ colax-idempotent 2-monad |

The 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ dualizes to $\mathbb{M}^* \dashv \mathbb{N}^*$; the diamond shape is preserved (with roles swapped).

**Closure-KZ dualization.** $\mathrm{Cl}$ (lax-idempotent 2-monad on $\mathbf{PrFib}$) dualizes to $\mathrm{Cl}^*$ (colax-idempotent 2-comonad on $\mathbf{PrFib}^*$). The dual closure operator acts by *restriction-to-confirming-Priestley-points*: dually to "inflate and add consequences," it "deflate and remove non-confirming points." Classical Stone-duality intuition — expansion in algebra = contraction in space.

**Temporal 2-category dualization.** $\mathbf{T}(\mathcal{C}, \lambda)$'s 0-cells $(\tau, X)$ dualize to $(\tau, X^*)$ where $\tau \in \lambda^{\mathrm{op}}$ and $X^* \in \mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$; 1-cells and 2-cells dualize via the 2-adjunction duality above. Result: $\mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}})$.

**Cascade coalgebra-algebra duality.** Standard categorical duality sends coalgebras $c : X \to F(X)$ to algebras $c^* : F^*(X^*) \to X^*$ of the dual functor. This paper's cascade coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ dualizes to cascade algebra $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$. The orbit on the primal side ($\leq_k$-monotone) dualizes to a co-monotone orbit on the dual side.

### 11.3 Coherence checks

**Functoriality.** The dualization operations are functorial: morphisms of spatiotemporal knowledge hyperdoctrines dualize to morphisms of dual structures; composition preserved. Follows from Jung–Rivieccio's categorical duality. ✓

**Self-duality of the KZ diamond.** The 2-adjoint pair $(\mathbb{M}, \mathbb{N})$ has the same abstract structure as $(\mathbb{M}^*, \mathbb{N}^*)$ with roles swapped — an involutive structure. This is what makes the diamond shape preserved under dualization. ✓

**Compatibility of the two adjoint systems.** Both $\leq_k$ and $\leq_t$ systems dualize to parallel dual systems. The Jung–Rivieccio duality preserves both orders (they correspond to orthogonal directions on the paired Priestley space). ✓

**Coalgebra-algebra duality with KZ duality.** Both are $\mathcal{K}^{\mathrm{op}}$-style dualizations; they commute. Coalgebra structure $c$ dualizing to algebra structure $c^*$ is consistent with dualizing the endofunctor $F_U$ to $F_U^*$ via $\mathrm{Cl} \leftrightarrow \mathrm{Cl}^*$. ✓

### 11.4 Regime-dependent dual structure

Each regime (Theorem 10.2.1) has dual interpretation:

- **Regime A dual:** finite Priestley spaces, dual cascade converges in finite steps (dually). Standard finite Stone-duality.
- **Regime B dual:** Scott-cocontinuous dual closure; cascade converges at $\omega$ dually.
- **Regime C dual:** transfinite-bounded co-closure ordinal matching primal $\kappa$.
- **Regime D dual:** aperiodic dual cascade. The dual Priestley spectrum carries cohomology classes detecting the aperiodic orbit's invariants.

### 11.5 Setup for *Spatiotemporal Knowledge Cohomology* cohomology

Theorem 11.1.1 establishes only *existence and coherence* of the dual object. *Spatiotemporal Knowledge Cohomology* picks up:

- Sheaves $F$ on the dual Priestley-dual paired space.
- Cohomology $H^n(\mathbf{T}^*, F)$ for each $n$, via standard derived-functor machinery.
- Classification of Regime-D cascades by their cohomology classes.
- Connection to CRDT convergence (*Spatiotemporal Knowledge Presheaves* §9.6) via cohomological interpretation of merging.

Explicitly *not* in this paper:
- Cohomology computation for any specific sheaf.
- Moduli spaces of *Spatiotemporal Knowledge Presheaves* hyperdoctrines.
- Deformation theory via dual tangent structure.
- Representation theory.

These are the territory of *Spatiotemporal Knowledge Cohomology* and subsequent works.

### 11.6 Significance of the Priestley route

Section 8 of *Spatiotemporal Knowledge Presheaves* flagged the Priestley dual as "an alternative computational representation" without developing it. Theorem 11.1.1 makes this alternative representation coherent at the full hyperdoctrine level. *Spatiotemporal Knowledge Cohomology*'s cohomology then yields the invariants that are *inaccessible* from the primal side — specifically, the aperiodic-orbit invariants in Regime D, which do not arise as fixed points of any primal closure.

The Priestley route thus makes Regime D, which spatiotemporal knowledge presheaf could not approach with fixed-point theorems, the domain where *Spatiotemporal Knowledge Cohomology* has its richest content.

## 12. Examples

Five worked examples plus one qualitative, across the four regimes, exhibiting the distinctive features of the present spatiotemporal knowledge hyperdoctrine (four-generator inventory, two adjoint systems, finite/infinite dichotomy, Priestley dualizability).

### 12.1 Recovery of *Spatiotemporal Knowledge Presheaves*: adultParent/parent cascade (Regime A)

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \{p_1, p_2, a\}$, $\Pi = \{\text{parent}, \text{adultParent}\}$, $\lambda = \omega$. Specialization $f : \text{adultParent} \to \text{parent}$ with $\mathrm{dom}(\text{adultParent}) = \{(p_1, a)\}$, $\mathrm{dom}(\text{parent}) = E \times E$. Closure rule: `adultParent(x, y) ⇒ parent(x, y)`. Increment: $u_0$ asserting $v_0(\text{adultParent})(p_1, a) = \mathbf{t}$.

**Cascade.**
- $\tau = 0$: $v_0(\text{adultParent})(p_1, a) = \mathbf{t}$; all else $\bot$.
- $\tau = 1$: closure fires. $v_1(\text{parent})(p_1, a) = \mathbf{t}$.
- $\tau \geq 1$: quiescent.

**Closure ordinal:** $\kappa = 1 < \omega$. **Regime A.**

**Layered structure.** Layer A: fibration with uniform fibers $\mathbf{2}^{\bowtie 9}$. Layer B: reindexing = specialization restriction; $\exists_f^k$ extends by $\bot$; BC vacuous (no non-trivial pullbacks in this $\mathcal{C}$). Layer C: cascade coalgebra $c$ with orbit $v_0 \to v_1 \to v_1 \to \ldots$.

**Priestley dual.** Finite paired Priestley space; dual cascade converges in 1 step (dually).

**Role.** §11.5 of *Spatiotemporal Knowledge Presheaves* recast in the present language. Shows the three-layer stack in the simplest non-trivial case.

### 12.2 Four-generator example: friendship and self-regard (Regime A)

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \{a, b\}$, $\Pi = \{\text{likes}, \text{likedBy}, \text{isHappy}, \text{isHappyBroadcast}\}$.

**$\mathcal{C}$ morphisms (all four generators exhibited).**
- Specialization $f_\text{spec} : \text{isHappy} \to \text{likes}$ with $\mathrm{dom}(\text{isHappy}) = \Delta_E = \{(a, a), (b, b)\}$.
- Converse $f_\text{conv} : \text{likedBy} \to \text{likes}$: $f_\text{conv}^*(v)(s, o) = v(o, s)$.
- Subject-projection $f_\text{sp} : \text{isHappyBroadcast} \to \text{isHappy}$: $f_\text{sp}^*(v)(s, o) = v(s, s)$.
- (Object-projection analogous, not separately exhibited.)

**Initial valuations.** $v_0(\text{likes})(a, b) = \mathbf{t}$, else $\bot$. $v_0(\text{isHappy})(a, a) = \mathbf{t}$, else $\bot$.

**Reindexing computations.**
- $f_\text{spec}^*(v_0(\text{likes}))(a, a) = \bot$ (the $\mathbf{t}$ at $(a, b)$ is off-diagonal, gets $\bot$ under restriction to $\Delta_E$).
- $f_\text{conv}^*(v_0(\text{likes}))(b, a) = v_0(\text{likes})(a, b) = \mathbf{t}$ ("$b$ is liked by $a$" because "$a$ likes $b$").
- $f_\text{sp}^*(v_0(\text{isHappy}))(a, \cdot) = \mathbf{t}$ (broadcast $a$'s self-regard across the row); $f_\text{sp}^*(v_0(\text{isHappy}))(b, \cdot) = \bot$.

**Regime:** A. Cascade stabilizes at $\tau = 0$ (no closure rules in this example).

**Role.** Exhibits the four-generator morphism inventory of the spatiotemporal knowledge presheaf paper. Subject-projection corresponds to a "broadcast" construction absent from classical hyperdoctrines.

### 12.3 Infinite-$E$ Scott-continuous: natural-number successor (Regime B)

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \mathbb{N}$, $\Pi = \{P\}$, $\lambda = \omega + 1$.

**Closure rule (finitary).** `P(n, n) ⇒ P(n+1, n+1)`.

**Initial state.** $v_0(P)(0, 0) = \mathbf{t}$, else $\bot$.

**Cascade.**
- $\tau = n$ (finite): $v_n(P)(k, k) = \mathbf{t}$ for $0 \leq k \leq n$.
- $\tau = \omega$: $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$ (by cascade continuity + $\leq_k$-join).
- $\tau = \omega + 1$: no further closure fires.

**Closure ordinal:** $\kappa = \omega$. **Regime B.** Theorem 3.2.2 applies; cascade stabilizes at $\omega$.

**2-categorical structure.** The cascade sequence $(v_n)_{n < \omega}$ has genuine 1-cells (each $v_n \to v_{n+1}$ is a strict $\leq_k$-increase); at $\omega$ the colimit converges strictly. $\mathbf{T}(\mathcal{C}, \lambda)$ is 1-categorical beyond $\omega$.

**Priestley dual.** Paired Priestley space over $\mathbb{N} \times \mathbb{N}$; dual cascade is a Scott-cocontinuous descending chain of Priestley spectra converging (dually) at $\omega$.

**Role.** Spatial infinity without temporal infinity. Typical of standard knowledge-representation systems (description logic TBoxes, logic-programming fixed points).

### 12.4 Quantifier-induced transfinite cascade (Regime C)

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \omega + 1$ (naturals plus a limit element), $\Pi = \{P\}$, $\lambda = \omega + 2$.

**Closure rules.**
- Rule 1 (finitary): `P(n, n) ⇒ P(n+1, n+1)` for $n \in \mathbb{N}$.
- Rule 2 (**infinitary**): `(∀n ∈ ℕ. P(n, n) = t) ⇒ P(ω, ω) ≥_k t`. Universal quantifier in antecedent.

**Cascade from $v_0(P)(0, 0) = \mathbf{t}$.**
- $\tau < \omega$: same as Example 12.3; Rule 1 propagates.
- $\tau = \omega$: $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$. Rule 2's antecedent satisfied.
- $\tau = \omega + 1$: Rule 2 fires. $v_{\omega+1}(P)(\omega, \omega) = \mathbf{t}$.
- $\tau = \omega + 2$: no further closure.

**Closure ordinal:** $\kappa = \omega + 1$. **Regime C.**

**Scott-continuity check.** Rule 2 has infinitary antecedent: it cannot fire on any finite sub-collection; only on the full $\omega$-limit. This breaks Scott-continuity: $\mathrm{cl}(\bigvee_k \{\text{finite stages}\}) \neq \bigvee_k \{\mathrm{cl}(\text{finite stage})\}$.

**Closure-KZ structure.** $\mathrm{Cl}$ is genuinely lax-idempotent here. $\mathrm{Cl}(\mathrm{Cl}(v_0)) \neq \mathrm{Cl}(v_0)$ in the strict sense: the first $\mathrm{Cl}$ gives $v_\omega$ (finitely-iterated closure); the second $\mathrm{Cl}$ adds the $\omega$-level consequent. $\mathbf{T}(\mathcal{C}, \lambda)$ has non-trivial 2-cells at $\tau = \omega$ and $\tau = \omega + 1$.

**Priestley dual.** Dual cascade on the paired Priestley space over $\omega + 1$ has co-closure ordinal $\omega + 1$.

**Role.** Smallest natural example of temporal infinity. The quantifier in Rule 2 is exactly the mechanism of non-Scott-continuity identified in §10.3. Higher closure ordinals $\omega + 2, \omega \cdot 2, \omega^2, \ldots$ arise from stacking similar rules.

### 12.5 Two adjoint systems: classical and paraconsistent equality

**Setup.** Same as Example 12.1 ($E = \{p_1, p_2, a\}$).

**$\leq_k$-equality $\Delta_E^k$ (paraconsistent, Definition 8.1.1).**

Apply $\exists_g^k$ to constant-$\top$ on diagonal specialization $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E$:

| Cell | $\Delta_E^k$ |
|---|---|
| $(p_1, p_1), (p_2, p_2), (a, a)$ | $\top$ |
| all six off-diagonal cells | $\bot$ |

**$\leq_t$-equality $=_E$ (classical, Definition 8.1.2).**

Apply $\exists_g^t$ to constant-$\mathbf{t}$ on diagonal specialization:

| Cell | $=_E$ |
|---|---|
| $(p_1, p_1), (p_2, p_2), (a, a)$ | $\mathbf{t}$ |
| all six off-diagonal cells | $\mathbf{f}$ |

**Interpretation.** Both equalities derive from the same diagonal specialization, differing only in which adjoint-system's $\exists$ is applied. $\Delta_E^k$ is information-maximal on diagonal; $=_E$ is classical two-valued.

**Use cases.**
- CRDT/distributed: $\Delta_E^k$ is stable under $\vee_k$-merge.
- Classical KR: $=_E$ is compatible with two-valued entailment.
- Paraconsistent reasoning: $\Delta_E^k$ with $\top$ treated as non-trivializing conflict.

**Regime:** A. Both equalities are finite constructions.

**Role.** Exhibits the most structurally distinctive feature of this paper: two parallel first-order logics on the same spatiotemporal knowledge presheaf, with different internal equality predicates, both rigorously derived without postulates.

### 12.6 Aperiodic cascade (Regime D — qualitative)

No fully-worked Regime-D example is given; concrete aperiodic cascades require proper-class $E$ or inaccessible cardinals, pushing the construction into *Spatiotemporal Knowledge Cohomology*'s territory.

Qualitative sketch:
- $E$ = a class-sized collection of entities, or $E = \kappa$ for an inaccessible cardinal $\kappa$.
- Closure rules with infinitary antecedents quantifying over arbitrary collections of $E$-elements.
- The cascade does not stabilize at any countable ordinal. It produces strictly-ascending chains beyond $\omega_1, \omega_2, \ldots, \kappa$.

On the Priestley dual, such cascades have non-trivial cohomology: the dual Priestley spectrum carries cohomology classes detecting aperiodic invariants. *Spatiotemporal Knowledge Cohomology* develops this.

### 12.7 Cross-example summary

| Example | Regime | $\|E\|$ | $\kappa$ | Generators exhibited | Adjoint systems |
|---|---|---|---|---|---|
| 12.1 | A | 3 | 1 | specialization | $\leq_k$ |
| 12.2 | A | 2 | 0 | all four | $\leq_k, \leq_t$ |
| 12.3 | B | $\omega$ | $\omega$ | identity | $\leq_k$ |
| 12.4 | C | $\omega + 1$ | $\omega + 1$ | identity | $\leq_k$ |
| 12.5 | A | 3 | 0 | specialization | $\leq_k, \leq_t$ |
| 12.6 | D | class-sized | unbounded | various | various |

Examples 12.2 and 12.5 are the ones most distinctive to this paper (four-generator inventory; two internal logics). Examples 12.3 and 12.4 exhibit the regime transition from B to C. Example 12.1 is the recovery of *Spatiotemporal Knowledge Presheaves*; Example 12.6 is the *Spatiotemporal Knowledge Cohomology* entry point.

## 13. Discussion

### 13.1 Relation to Maruyama 2021 — direct predecessor

Maruyama 2021's Full Lambek hyperdoctrine is the closest predecessor to the present spatiotemporal knowledge hyperdoctrine. Both are substructural hyperdoctrines with residuated fiber structure, both handle non-cartesian-closed fibers, both give completeness results for classes of non-classical predicate logics.

Two distinctions:

**(a) Fiber structure.** Maruyama's fibers are Full Lambek algebras with integral fusion ($\otimes$-unit = top). This paper's fibers are distributive bilattices with non-integral residuation ($\odot$-unit $(1, 1) = \top \neq $ lattice-top $\mathbf{t}$). The non-integrality causes Frobenius-for-$\odot$ to fail (§7.4); this paper uses Frobenius-for-$\wedge_k$ or $\wedge_t$ instead.

**(b) Two adjoint systems.** Maruyama has one adjoint triple per hyperdoctrine. This paper has two (§§5, 7, 8). The bilattice's two orders ($\leq_k, \leq_t$) each support hyperdoctrinal structure; they coexist on the same fibration without contradiction.

The spatiotemporal knowledge hyperdoctrine's two-system structure is absent from Maruyama; this paper makes it the central structural distinction.

### 13.2 Relation to Lawvere 1969 / Seely 1983

Lawvere's original hyperdoctrines (1969) are cartesian-closed-fiber; Seely 1983 adds coproducts for disjunction. This paper's spatiotemporal knowledge hyperdoctrine is in this family but with bilattice-valued fibers rather than cartesian-closed.

Lawvere 1970's key contributions inherit in adapted form:
- Equality via diagonal $\Sigma$: §8.1 gives *two* equalities (classical and paraconsistent), both derived from the diagonal in the two-system framework.
- Frobenius reciprocity: holds in this paper for $\wedge_k$ and $\wedge_t$ (Theorem 7.3.1), not for the $\odot$ Maruyama 2021 would prefer.
- Comprehension schema: Theorem 8.2.2 gives parallel comprehension schemas for both designations.

Seely's Beck–Chevalley result (1983 main theorem): "a hyperdoctrine satisfies BC for a pullback iff it knows the diagram is a pullback." Theorem 6.4.1 confirms BC holds uniformly for all pullback squares in $\mathcal{C}$ — cellwise structure of the spatiotemporal knowledge hyperdoctrine makes BC automatic.

### 13.3 Relation to Jacobs 1999 / fibration-theoretic framework

This paper uses fibration-theoretic framing (Jacobs 1999 Ch 1; Streicher 2018 for Bénabou's detailed theory). The fibration formulation is equivalent to Lawvere's indexed-category but aligns better with:
- The 2-categorical Gray–Street–Emmenegger 2-adjunction of §4.
- The cloven-vs-split distinction (cloven = pseudo-algebra, split = strict algebra).
- The coalgebraic cascade structure of §5.3.

Jacobs' comprehension categories (1999 Ch 5) are stronger than plain hyperdoctrines: they require a "truth" 1-cell with specific right-adjoint properties. This paper's spatiotemporal knowledge hyperdoctrine is a hyperdoctrine with comprehension (Definition 5.2.1 B4) but does not elevate to a full comprehension category; the stronger structure is future work.

### 13.4 The spatiotemporal knowledge hyperdoctrine is not a tripos

Triposes (Hyland, Johnstone, Pitts 1980; Pitts 1981, 2002) are Heyting-valued hyperdoctrines with generic predicates, yielding toposes via the tripos-to-topos construction. This paper's spatiotemporal knowledge hyperdoctrine is *not* a tripos for four reasons:

1. **Fiber structure.** spatiotemporal knowledge presheaf fibers are distributive bilattices with residuated $\odot \dashv \Rightarrow$ structure, not Heyting algebras.
2. **Preorder truncation.** Triposes require preorder fibers; this paper needs genuine 2-categorical fiber structure for the KZ diamond (§4).
3. **No generic predicate.** Triposes postulate a universal predicate-classifier $\Sigma \in C$; this paper has no such object.
4. **Base category.** Triposes live over 1-categorical bases; the present full structure is 2-categorical.

Consequently the tripos-to-topos construction does not directly apply. A "bilattice tripos" would be a natural future structure; it could yield an "spatiotemporal knowledge presheaf topos" suitable for the cohomological development of *Spatiotemporal Knowledge Cohomology*, but this is not the present scope.

Pitts 2002 §4 identifies a comprehension property weaker than Lawvere's that still supports topos construction; the analogue in this paper (Remark 8.2.5) is the Belnap-designated-comprehension, a variant option.

### 13.5 Open problems

**(1) spatiotemporal knowledge presheaf-FOL ↔ BD∆ correspondence.** Establish formally that the present spatiotemporal knowledge hyperdoctrine's internal first-order logic (under classical designation, $\leq_t$-system) recovers BD∆ (Omori–Wansing). Phase 2.6 flagged this as a correspondence theorem requiring a separate detailed argument, or a standalone appendix.

**(2) Higher-categorical extensions.** Whether the present structure extends to $(\infty, 1)$-categorical settings — replacing strict 2-categories with quasicategories and the Emmenegger 2-adjunction with a higher adjoint structure. Potentially useful for formal coherence arguments that this paper currently treats modulo strictification.

**(3) Regime D concrete examples.** Identify naturally-occurring knowledge-representation scenarios where Regime D aperiodic cascades arise. §12.6's qualitative sketch requires proper-class constructions; finding scenarios of practical interest would situate Regime D in application.

**(4) Deformation theory.** Whether the Priestley dual admits tangent structure for infinitesimal deformations of spatiotemporal knowledge hyperdoctrines. Reserved for a later paper in the series.

**(5) Representation theory.** Identify what the spatiotemporal knowledge hyperdoctrine is a representation of. Candidate: the free residuated 2-category generated by $\mathcal{C}$. Paper 6+.

**(6) 2-categorical Beck–Chevalley.** Theorem 6.4.1 establishes 1-categorical BC. Whether BC lifts to the 2-categorical temporal structure $\mathbf{T}(\mathcal{C}, \lambda)$ — needed for certain cohomology arguments — is open.

### 13.6 Downstream: what *Spatiotemporal Knowledge Cohomology* picks up

*Spatiotemporal Knowledge Cohomology* (planned) picks up:

- **§11's dual object.** Theorem 11.1.1 establishes existence and coherence of the Priestley dual; *Spatiotemporal Knowledge Cohomology* develops cohomology on it.
- **§10's Regime D.** Aperiodic cascades are the natural home for cohomology; *Spatiotemporal Knowledge Cohomology* classifies Regime-D spatiotemporal knowledge presheaves by cohomology classes.
- **§9's closure-KZ.** The transfinite closure orbits of Regime D have invariants detectable via $H^*$ of the dual; *Spatiotemporal Knowledge Cohomology* makes this precise.
- **§7's two adjoint systems.** Both dualize; *Spatiotemporal Knowledge Cohomology* may find cohomological interpretations for the distinction.

Explicitly *not* in *Spatiotemporal Knowledge Cohomology*:
- This paper's hyperdoctrinal content (established here).
- Cohomology-flavored intuitions about the present results (kept structural in this paper).

### 13.7 Series outlook

The planned series:

1. *Spatiotemporal Knowledge Presheaves* — foundational reference (done).
2. *Spatiotemporal Knowledge Hyperdoctrines* — the present paper.
3. *Spatiotemporal Knowledge Cohomology* — planned.
4. *Moduli of Spatiotemporal Knowledge Hyperdoctrines* — speculative.
5. *Deformation Theory of Spatiotemporal Knowledge Presheaves* — speculative.
6. *Representation Theory of the Predication 2-Category* — speculative.

Each paper establishes structure for its successors to build on, without developing downstream content itself. The present paper achieves the hyperdoctrinal-structure-plus-dual-object framework that *Spatiotemporal Knowledge Cohomology* and its successors use without reproving.

## References

Aczel, P. (1988). *Non-Well-Founded Sets*. CSLI Lecture Notes 14. Stanford: CSLI Publications / University of Chicago Press.

Almeida, P. S., Shoker, A., & Baquero, C. (2018). Delta state replicated data types. *Journal of Parallel and Distributed Computing*, 111, 162–173.

Arieli, O., & Avron, A. (1996). Reasoning with logical bilattices. *Journal of Logic, Language and Information*, 5(1), 25–63.

Arieli, O., & Avron, A. (1998). The value of the four values. *Artificial Intelligence*, 102(1), 97–141.

Barr, M. (1979). *\*-Autonomous Categories* (with an appendix by Po-Hsiang Chu). Lecture Notes in Mathematics, Vol. 752. Springer-Verlag.

Běhounek, L., Daňková, M., & Dvořák, A. (2023). Free quantification in four-valued and fuzzy bilattice-valued logics. In *Integrated Uncertainty in Knowledge Modelling and Decision Making (IUKM 2023)*, LNAI 14290, Springer, 24–38. arXiv:2306.13079.

Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn & G. Epstein (Eds.), *Modern Uses of Multiple-Valued Logic* (pp. 5–37). Reidel.

Bénabou, J. (1985). Fibered categories and the foundations of naive category theory. *Journal of Symbolic Logic*, 50(1), 10–37.

Blackburn, P., de Rijke, M., & Venema, Y. (2001). *Modal Logic*. Cambridge Tracts in Theoretical Computer Science, Vol. 53. Cambridge University Press.

Bou, F., & Rivieccio, U. (2011). The logic of distributive bilattices. *Logic Journal of the IGPL*, 19(1), 183–216.

Bunge, M., & Funk, J. (2006). *Singular Coverings of Toposes*. Lecture Notes in Mathematics, Vol. 1890. Springer-Verlag.

Busaniche, M., & Cignoli, R. (2014). The subvariety of commutative residuated lattices represented by twist-products. *Algebra Universalis*, 71(1), 5–22.

Chajda, I., & Länger, H. (2021). Adjoint operations in twist-products of lattices. *Symmetry*, 13(2), Article 253.

Console, M., Guagliardo, P., & Libkin, L. (2018). Propositional and predicate logics of incomplete information. In *Proc. 16th International Conference on Principles of Knowledge Representation and Reasoning (KR 2018)*, AAAI Press, 592–601.

emsenn. *Spatiotemporal Knowledge Presheaves.* Foundational paper of the present series. (Cited throughout as *Spatiotemporal Knowledge Presheaves*.)

emsenn. *Spatiotemporal Knowledge Cohomology.* Sequel to the present paper, in preparation. (Cited as *Spatiotemporal Knowledge Cohomology*.)

Emmenegger, J., Mesiti, L., Rosolini, G., & Streicher, T. (2024). A comonad for Grothendieck fibrations. *Theory and Applications of Categories*, 40(13). arXiv:2305.01474.

Fitting, M. (1991). Bilattices and the semantics of logic programming. *Journal of Logic Programming*, 11(2), 91–116.

Fitting, M. (2006). Bilattices are nice things. In T. Bolander, V. Hendricks, & S. A. Pedersen (Eds.), *Self-Reference* (pp. 53–77). CSLI Publications.

Galatos, N., Jipsen, P., Kowalski, T., & Ono, H. (2007). *Residuated Lattices: An Algebraic Glimpse at Substructural Logics*. Studies in Logic and the Foundations of Mathematics, Vol. 151. Elsevier.

Ganter, B., & Wille, R. (1999). *Formal Concept Analysis: Mathematical Foundations*. Springer.

Ginsberg, M. L. (1988). Multivalued logics: A uniform approach to inference in artificial intelligence. *Computational Intelligence*, 4(3), 265–316.

Gray, J. W. (1966). Fibred and cofibred categories. In *Proc. Conf. Categorical Algebra (La Jolla, 1965)* (pp. 21–83). Springer.

Hayes, P., & Patel-Schneider, P. F. (2014). *RDF 1.1 Semantics*. W3C Recommendation. https://www.w3.org/TR/rdf11-mt/

Hellerstein, J. M., & Alvaro, P. (2020). Keeping CALM: When distributed consistency is easy. *Communications of the ACM*, 63(9), 72–81.

Hermida, C. (1993). *Fibrations, Logical Predicates and Indeterminates*. PhD thesis, University of Edinburgh.

Hermida, C., & Jacobs, B. (1998). Structural induction and coinduction in a fibrational setting. *Information and Computation*, 145(2), 107–152.

Hyland, J. M. E. (1982). The effective topos. In A. S. Troelstra & D. van Dalen (Eds.), *The L.E.J. Brouwer Centenary Symposium* (pp. 165–216). North-Holland.

Hyland, J. M. E., Johnstone, P. T., & Pitts, A. M. (1980). Tripos theory. *Mathematical Proceedings of the Cambridge Philosophical Society*, 88(2), 205–232.

Jacobs, B. (1999). *Categorical Logic and Type Theory*. Studies in Logic and the Foundations of Mathematics, Vol. 141. Elsevier.

Jacobs, B. (2016). *Introduction to Coalgebra: Towards Mathematics of States and Observation*. Cambridge Tracts in Theoretical Computer Science, Vol. 59. Cambridge University Press.

Jakl, T. (2025). Four imprints of Belnap's useful four-valued logic in computer science. arXiv:2503.20679.

Jung, A., & Rivieccio, U. (2012). Priestley duality for bilattices. *Studia Logica*, 100(1–2), 223–252.

Kamide, N., & Zohar, Y. (2020). Completeness and cut-elimination for first-order ideal paraconsistent four-valued logic. *Studia Logica*, 108(3), 549–571.

Kelly, G. M., & Lack, S. (1997). On property-like structures. *Theory and Applications of Categories*, 3(9), 213–250.

Kock, A. (1995). Monads for which structures are adjoint to units. *Journal of Pure and Applied Algebra*, 104(1), 41–59.

Lack, S. (2010). A 2-categories companion. In *Towards Higher Categories* (IMA Volumes in Mathematics and its Applications, Vol. 152, pp. 105–191). Springer. arXiv:math/0702535.

Lawvere, F. W. (1969). Adjointness in foundations. *Dialectica*, 23(3–4), 281–296. Reprinted: *Theory and Applications of Categories* Reprints 16 (2006), 1–16.

Lawvere, F. W. (1970). Equality in hyperdoctrines and comprehension schema as an adjoint functor. In *Applications of Categorical Algebra*, Proceedings of Symposia in Pure Mathematics, Vol. 17, 1–14. American Mathematical Society.

Lawvere, F. W. (1975). Continuously variable sets: algebraic geometry = geometric logic. In *Logic Colloquium '73* (pp. 135–156). North-Holland.

Lawvere, F. W. (1976). Variable quantities and variable structures in topoi. In A. Heller & M. Tierney (Eds.), *Algebra, Topology, and Category Theory: A Collection of Papers in Honor of Samuel Eilenberg* (pp. 101–131). Academic Press.

Lawvere, F. W. (1979). Categorical dynamics. In *Topos Theoretic Methods in Geometry*, Aarhus Math. Inst. Var. Publ. Ser. 30 (pp. 1–28).

Ma, Y., & Hitzler, P. (2009). Paraconsistent reasoning for OWL 2. In *Proc. Third International Conference on Web Reasoning and Rule Systems (RR 2009)*, LNCS 5837. Springer.

Mac Lane, S. (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics, Vol. 5. Springer-Verlag.

Maruyama, Y. (2021). Fibred algebraic semantics for a variety of non-classical first-order logics and topological logical translation. *Journal of Symbolic Logic*, 86(3), 1189–1213.

Mobasher, B., Pigozzi, D., Slutzki, G., & Voutsadakis, G. (2000). A duality theory for bilattices. *Algebra Universalis*, 43, 109–125.

Omori, H., & Wansing, H. (2017). 40 years of FDE: an introductory overview. *Studia Logica*, 105(6), 1021–1049.

Pitts, A. M. (1981). *The Theory of Triposes*. PhD thesis, University of Cambridge.

Pitts, A. M. (2002). Tripos theory in retrospect. *Mathematical Structures in Computer Science*, 12(3), 265–279.

Priestley, H. A. (1970). Representation of distributive lattices by means of ordered Stone spaces. *Bulletin of the London Mathematical Society*, 2, 186–190.

Rivieccio, U. (2010). *An Algebraic Study of Bilattice-based Logics*. PhD thesis, University of Barcelona / University of Genoa. arXiv:1010.2552.

Rivieccio, U., Jung, A., & Jansana, R. (2017). Four-valued modal logic: Kripke semantics and duality. *Journal of Logic and Computation*, 27(1), 155–199.

Rutten, J. J. M. M. (2000). Universal coalgebra: a theory of systems. *Theoretical Computer Science*, 249(1), 3–80.

Seely, R. A. G. (1983). Hyperdoctrines, natural deduction and the Beck condition. *Zeitschrift für mathematische Logik und Grundlagen der Mathematik*, 29(6), 505–542.

Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M. (2011). Conflict-free replicated data types. In X. Défago, F. Petit, & V. Villain (Eds.), *Stabilization, Safety, and Security of Distributed Systems (SSS 2011)*, LNCS 6976 (pp. 386–400). Springer.

Streicher, T. (2022). *Fibered Categories à la Jean Bénabou*. arXiv:1801.02927.

Street, R. (1974). Fibrations and Yoneda's lemma in a 2-category. In *Category Seminar (Sydney 1972/73)*, Lecture Notes in Mathematics, Vol. 420 (pp. 104–133). Springer.

Zöberlein, V. (1976). Doktrinen auf 2-Kategorien. Manuscript, Mathematisches Institut, Universität Düsseldorf.

