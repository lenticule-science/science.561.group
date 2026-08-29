---
title: "spatiotemporal knowledge presheaves"
type: research-article
---

# Spatiotemporal Knowledge Presheaves

### A Bilattice-Valued Foundation for Adjudicated Predication

**Author:** emsenn

**Keywords:** bilattice; twist-product; Chu space; residuated lattice; hyperdoctrine; four-valued logic; modal logic; conflict-free replicated data type; knowledge representation; Priestley duality.

**MSC 2020:** 03G25 (other algebras related to logic); 03B45 (modal logic, including provability logic); 03B70 (logic in computer science); 06D30 (De Morgan algebras, Łukasiewicz algebras); 18B10 (categories of spans, relations, partial maps); 18D99 (categorical structures).

**arXiv primary:** math.LO. **Secondary:** cs.LO, cs.DC.

---

## Abstract

We introduce the **spatiotemporal knowledge presheaf** (SKP) as a formal mathematical object: a family $(v_\tau)_{\tau < \lambda}$ of $\mathcal{C}$-natural, $\leq_k$-monotone valuations of a small cartesian **predicate category** $\mathcal{C}$ into the pointwise twist-product bilattice $\mathbf{L}^{\bowtie E \times E}$ over a fixed entity set $E$ and integral commutative residuated lattice $\mathbf{L}$, indexed by a **cascade** ordinal $\lambda$. Equivalently, an SKP is a presheaf on $\mathcal{C} \times \lambda^{\mathrm{op}}$ valued in pointed distributive bilattices. SKPs generalize classical (two-valued) knowledge representations — RDF triple stores, description-logic ABoxes, relational databases — to a bilattice-valued setting in which inconsistency ($\top$) and partial information ($\bot$) are first-class epistemic states. We develop the full algebraic, modal, and dynamical theory of SKPs. The adjoint structure $\odot \dashv \Rightarrow$ on fiber algebras instantiates the Busaniche–Cignoli / Chajda–Länger twist-product residuation at the predicate-fiber level. A closure operator drives the cascade to quiescence in finitely many steps when the entity and predicate sets are finite; after quiescence the $\bot$-valued cells are eliminated and the adjoint structure restricts to a three-valued sub-algebra. The modal calculus on SKPs inherits decidability and the finite model property from the Rivieccio–Jung–Jansana four-valued modal logic. Priestley duality lifts fiberwise, exhibiting a $\mathbb{Z}/2$ gauge structure at each point of the predicate base. Most consequentially, SKPs are conflict-free replicated data types: distributed SKP replicas with monotone-in-$\leq_k$ writes converge to a common limit state without consensus, by the Shapiro et al. semilattice-convergence framework. Five worked examples exhibit the construction on progressively richer structures. The paper is designed as a foundational reference for downstream algebraic works — paraconsistent description logics, bilattice-valued OWL, distributed knowledge graphs, SKP-native first-order logic — to cite without reproving the groundwork.

## 1. Introduction

### 1.1 The adjudication problem

Consider a knowledge base — a collection of facts about a domain of entities, organized as subject-predicate-object triples. In classical treatments (Codd's relational model, RDF graphs, description-logic ABoxes), each triple is assigned a Boolean value: the triple is either asserted or it is not. Closed-world variants treat absence as negation; open-world variants treat absence as unknown. In either case the target is a two-valued model.

Three features of knowledge systems in practice are left unmodeled by this choice.

First, **inconsistency**. Real sources disagree. When two agents assert contradictory facts about the same triple, classical two-valued logic has no native representation: the closed-world "either absent or present" cannot say "both asserted and denied." Introducing such a case via $p \wedge \neg p$ in classical logic leads to trivialization: $p \wedge \neg p \vdash q$ for every $q$. Inconsistency breaks inference globally; this is desirable in exactly no application.

Second, **partial information**. A triple may be genuinely unknown — not merely false by closed-world assumption, but epistemically unsettled. Three-valued logics address this via an explicit "unknown" value, but the resulting structure is not compositional in a clean way with inconsistency handling.

Third, **temporal accumulation and distribution**. Knowledge grows: new evidence arrives, new inferences fire. Different agents or replicas accumulate differently. Yet a well-designed system must ensure that all replicas converge to the same body of knowledge, without requiring them to coordinate every update via consensus.

Belnap (1977) addressed the first two by introducing the four-valued bilattice $\mathbf{FOUR}$ with values $\mathbf{t}, \mathbf{f}, \bot, \top$ (*told true*, *told false*, *no information*, *told both*). Fitting (1991) developed fixed-point semantics for bilattice-valued logic programs, giving the dynamical piece. Shapiro et al. (2011) gave the CRDT framework for convergence-without-consensus on general join-semilattices. But these three threads — bilattice-valued values, fixed-point cascades, and CRDT convergence — have not been assembled into a single structural object with a complete account of the adjoint, modal, gauge, and dynamical facts.

This paper constructs that object: the **spatiotemporal knowledge presheaf** (SKP).

### 1.2 What an SKP is

An SKP is a $\lambda$-indexed family of $\mathcal{C}$-natural, $\leq_k$-monotone valuations in the pointwise twist-product bilattice $\mathbf{L}^{\bowtie E \times E}$ (Definition 3.1); equivalently — and justifying the "presheaf" name — a functor $\mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_\ast(\mathbf{L})$ into the category of pointed distributive bilattices (Remark 3.1a). The predicate category $\mathcal{C}$ is small and cartesian; the cascade ordinal $\lambda$ is the temporal parameter; $\mathbf{L}$ is a fixed integral commutative residuated lattice.

The name is chosen carefully. "Spatiotemporal" marks the two indexing axes: the (contravariant) predicate axis and the (covariant) cascade axis. "Knowledge" marks the interpretation of the bilattice values, following Belnap's and Fitting's tradition. "Presheaf" marks the technical type: a contravariant-covariant functor is literally a presheaf on a product category, and we work with the presheaf-theoretic vocabulary throughout.

We note the terminological clash with the knowledge-graph-embedding literature, where "knowledge manifold" has been used in a metric/differential-geometric sense (Xiao, Huang, & Zhu 2016) — constraining valid triples to lie on Riemannian manifolds. Our sense is combinatorial/algebraic and presheaf-theoretic, entirely distinct.

### 1.3 Contributions

This paper makes four principal contributions.

**(A) A canonical definition of SKPs** as bilattice-valued presheaves over a predicate category × cascade ordinal, with precise axioms for cascade monotonicity, continuity, and closure-drivenness (§3).

**(B) A complete account of the algebraic and dynamical structure:**
- The adjoint structure $\odot \dashv \Rightarrow$ on the fiber algebras, instantiating the Busaniche–Cignoli (2014) / Chajda–Länger (2021) twist-product residuation on distributed predicate fibers (§4).
- The closure-and-equilibrium theory, with a convergence theorem for finite cases and restriction to $\{\mathbf{t}, \mathbf{f}, \top\}$ after quiescence (§5).
- The categorical structure of $\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E)$, including limits, colimits, and a classification of structure-respecting morphisms (§6).
- The modal calculus via Rivieccio–Jung–Jansana (2017) translation, giving decidability and the finite model property (§7).
- The Priestley-style gauge and duality (Jung & Rivieccio 2012), lifted fiberwise (§8).
- The Nelson identity as a conservation law recovering contrapositive symmetry in a corrected form (§9.4).

**(C) A CRDT convergence theorem for SKPs (§9.6):** distributed SKP replicas with monotone-in-$\leq_k$ writes converge without consensus, by Shapiro et al.'s (2011) semilattice framework applied fiberwise. This connects SKPs to the CALM theorem (Hellerstein & Alvaro 2020) and makes SKPs directly applicable as the substrate for distributed knowledge systems.

**(D) An explicit usability contract for downstream algebraic works (§12.6):** the paper's theorems are designed to be *citable* by subsequent constructions — bilattice-valued OWL, distributed knowledge graphs, paraconsistent description logics, SKP-native first-order logic — without re-proving the foundational material.

### 1.4 Approach and prior work

The paper is a *foundations paper* in the tradition of Mac Lane's *Categories for the Working Mathematician*, Johnstone's *Stone Spaces* and *Elephant*, and Jacobs' *Categorical Logic and Type Theory*: its goal is canonical treatment rather than individual theorem-novelty. Individual theorems are drawn from or instantiate existing results: the residuation proof is adapted from Chajda & Länger (2021); the modal decidability is lifted from Rivieccio et al. (2017); the CRDT convergence is applied from Shapiro et al. (2011); the Priestley duality is from Jung & Rivieccio (2012). The novel content lies in the *assembly*: showing that these pieces fit together on a single object, in a single notation, with clean interactions.

Prior work in bilattice-valued knowledge representation (Fitting 1991; Arieli & Avron 1996; Ma & Hitzler 2009; Zhang et al. 2009) treats bilattices as value domains for existing representation formalisms but does not develop the structural theory of the resulting knowledge base as an object in its own right. The present paper addresses that gap directly: the presheaf framing, the complete categorical structure, the modal decomposition lifted from Rivieccio et al. (2017), the CRDT convergence theorem, and the usability contract together constitute the foundational treatment the literature has been missing.

### 1.5 Outline

§2 collects the prerequisite algebra: bilattices, twist products, Chu spaces, residuated lattices, monoidal closure. §3 defines SKPs and establishes the fiber functor. §4 constructs the adjoint structure with a full proof of the residuation theorem. §5 develops the closure and cascade-convergence theory. §6 studies morphisms and the category $\mathbf{SKP}$. §7 gives the modal calculus and its decidability. §8 lifts Priestley duality. §9 treats dynamics, conservation, and the CRDT convergence theorem. §10 records computational content. §11 gives five worked examples. §12 positions SKPs in the broader landscape and sketches downstream applications.

## 2. Preliminaries

This section fixes the algebraic structures on which spatiotemporal knowledge presheaves will be built: bilattices (§2.1), twist products (§2.2), Chu spaces (§2.3), residuated lattices (§2.4), and a minimal monoidal-closure vocabulary (§2.5). Experienced readers may skim.

### 2.1 Bilattices

A **pre-bilattice** is an algebra $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k \rangle$ in which $\langle B, \wedge_t, \vee_t \rangle$ and $\langle B, \wedge_k, \vee_k \rangle$ are both lattices (Ginsberg 1988; Fitting 1991). The order associated with the first lattice is the **truth order** $\leq_t$; the order associated with the second is the **knowledge order** $\leq_k$. When both lattices are bounded, their extremes are denoted $\mathbf{f}, \mathbf{t}$ (bottom, top of $\leq_t$) and $\bot, \top$ (bottom, top of $\leq_k$).

A pre-bilattice is **interlaced** (Fitting 1991) if each of the four lattice operations is monotone with respect to both orders. It is **distributive** if all twelve distributive laws $x \circ (y \bullet z) \approx (x \circ y) \bullet (x \circ z)$ hold for distinct $\circ, \bullet \in \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$.

A **bilattice** is a pre-bilattice equipped with a unary **negation** $\sim$ satisfying $a \leq_t b \Rightarrow \sim b \leq_t \sim a$, $a \leq_k b \Rightarrow \sim a \leq_k \sim b$, and $\sim \sim a = a$ (Ginsberg 1988; Rivieccio 2010 Def. 1.3.6). A bilattice may also carry a **conflation** $-$ satisfying $-$ reverses $\leq_k$, preserves $\leq_t$, with $-{-a} = a$. When both are present, they are typically required to commute: $\sim - = -\sim$ (Fitting 2006).

The smallest non-trivial bilattice is $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$ (Belnap 1977, recast as a bilattice by Ginsberg 1988):
- $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ and $\mathbf{f} \leq_t \top \leq_t \mathbf{t}$ (truth order).
- $\bot \leq_k \mathbf{f} \leq_k \top$ and $\bot \leq_k \mathbf{t} \leq_k \top$ (knowledge order).
- $\sim$ fixes $\bot$ and $\top$, swaps $\mathbf{t}$ and $\mathbf{f}$.

The four values are often glossed as *told true*, *told false*, *no information*, and *told both*, respectively (Belnap 1977). $\mathbf{FOUR}$ is distributive and, as a bilattice, simple; up to isomorphism it is the unique subdirectly irreducible bounded distributive bilattice (Rivieccio 2010, following Mobasher et al. 2000). The variety $\mathrm{DBiLat}$ of distributive bilattices is generated by $\mathbf{FOUR}$ (Bou & Rivieccio 2011).

A bilattice $\mathbf{B}$ acts pointwise on any index set $S$: the algebra $\mathbf{B}^S$ with coordinate-wise operations is a bilattice, inheriting interlacing, distributivity, and (if present in $\mathbf{B}$) negation and conflation (Fitting 2006).

### 2.2 Twist products

Let $\mathbf{L}_1, \mathbf{L}_2$ be lattices with operations $\sqcap_i, \sqcup_i$ and orders $\leq_i$. The **twist product** $\mathbf{L}_1 \bowtie \mathbf{L}_2$ (Kalman 1958 for the lattice-with-involution case; Ginsberg 1988 for the bilattice case; Rivieccio 2010 Definition 1.3.8) is the pre-bilattice with carrier $L_1 \times L_2$ and operations

$$\langle a_1, a_2 \rangle \wedge_t \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1, a_2 \sqcup_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \vee_t \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1, a_2 \sqcap_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \wedge_k \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1, a_2 \sqcap_2 b_2 \rangle$$
$$\langle a_1, a_2 \rangle \vee_k \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1, a_2 \sqcup_2 b_2 \rangle$$

The induced orders are
$$\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } b_2 \leq_2 a_2$$
$$\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \text{ and } a_2 \leq_2 b_2.$$

The first coordinate tracks *positive evidence*; the second tracks *negative evidence*. The truth order raises positive and lowers negative; the knowledge order raises both.

When $\mathbf{L}_1 = \mathbf{L}_2 = \mathbf{L}$, write $\mathbf{L}^\bowtie$ for the twist product and endow it with the negation $\sim \langle a, b \rangle = \langle b, a \rangle$. The result is a bilattice (Fitting 1991). If $\mathbf{L}$ is distributive, so is $\mathbf{L}^\bowtie$ (Fitting 2006).

**Theorem 2.1 (Avron's Representation; Avron 1996, Rivieccio 2010 Thm. 1.3.9–10).** *A bounded pre-bilattice is interlaced iff it is isomorphic to $\mathbf{L}_1 \bowtie \mathbf{L}_2$ for some bounded lattices $\mathbf{L}_1, \mathbf{L}_2$. A bounded bilattice is interlaced iff it is isomorphic to $\mathbf{L}^\bowtie$ for some bounded lattice $\mathbf{L}$.*

Specializing to $\mathbf{L} = \mathbf{2}$, the two-element Boolean lattice, yields $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$ with
$$\mathbf{f} = \langle 0, 1 \rangle, \quad \bot = \langle 0, 0 \rangle, \quad \top = \langle 1, 1 \rangle, \quad \mathbf{t} = \langle 1, 0 \rangle.$$

### 2.3 Chu spaces

Let $\mathcal{V}$ be a symmetric monoidal closed category and let $d \in \mathcal{V}$. The **Chu construction** $\mathrm{Chu}(\mathcal{V}, d)$ has as objects triples $(a, b, r)$ with $a, b \in \mathcal{V}$ and $r : a \otimes b \to d$ a morphism, and as morphisms $(a, b, r) \to (x, y, s)$ pairs $(f : a \to x, g : y \to b)$ satisfying $r \circ (1_a \otimes g) = s \circ (f \otimes 1_y)$ (Barr 1979). The construction is functorial and produces a *-autonomous category — a model of classical multiplicative linear logic.

For $\mathcal{V} = \mathbf{Set}$ and $d = \mathbf{2}$, a Chu space is a triple $(A, B, r)$ with $A, B$ sets and $r : A \times B \to \mathbf{2}$ — equivalently, a formal context in the sense of formal concept analysis (Ganter & Wille 1999). For $\mathcal{V}$ a Heyting algebra $H$ (thin category, tensor = meet) and $d = 0$, objects of $\mathrm{Chu}(H, 0)$ are pairs $(a_+, a_-) \in H \times H$ with $a_+ \wedge a_- = 0$ (Pratt 1995; Jakl 2025).

**Lemma 2.2 (Jakl 2025, Lemma 3.1).** *For $H$ a Heyting algebra, the linear-logic connectives of $\mathrm{Chu}(H, 0)$ are term-definable from the bilattice structure of $H^\bowtie$. In particular, the Chu tensor $\otimes$ corresponds to the twist-product fusion and the linear implication $\multimap$ corresponds to the residuated implication (§2.4).*

Jakl's Lemma 2.2 identifies the Chu construction with the consistent sub-algebra $\{(a_+, a_-) : a_+ \wedge a_- = 0\}$ of the twist product $H^\bowtie$. We will work with the full twist product (including points with $a_+ \wedge a_- \neq 0$), which encodes the *inconsistent* epistemic state $\top$.

### 2.4 Residuated lattices

A **commutative residuated lattice** is an algebra $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ such that $\langle L, \vee, \wedge \rangle$ is a lattice, $\langle L, \cdot, 1 \rangle$ is a commutative monoid, and $\cdot, \to$ satisfy the **residuation** axiom
$$x \cdot y \leq z \iff x \leq y \to z \quad \text{(for all } x, y, z \in L \text{).}$$

$\mathbf{L}$ is **integral** if $1$ is the top element of $\langle L, \vee, \wedge \rangle$. It is **bounded** if a bottom $0$ exists. Galatos, Jipsen, Kowalski, and Ono (2007) give the canonical modern reference; we record the facts used below.

**Proposition 2.3 (standard residuation identities; Chajda–Länger 2021 Proposition 2.2).** *For an integral commutative residuated lattice $\mathbf{L}$ and all $x, y, z \in L$:*

1. $x \leq y$ implies $x \cdot z \leq y \cdot z$.
2. $x \cdot y \leq x$ and $x \cdot y \leq y$.
3. $1 \to x = x$.
4. $x \leq y \to x$.
5. $x \to y = 1$ iff $x \leq y$.
6. $x \leq y$ implies $y \to z \leq x \to z$ and $z \to x \leq z \to y$.
7. $x \to (y \wedge z) = (x \to y) \wedge (x \to z)$.
8. $(x \cdot y) \to z = x \to (y \to z)$.

These are all consequences of the residuation axiom alone (together with integrality). We use them freely in §4.

The Boolean lattice $\mathbf{2}$ with $\cdot = \wedge$ and the classical implication $x \to y := \neg x \vee y$ is an integral commutative residuated lattice. More generally, any Heyting algebra is such a lattice with $\cdot = \wedge$; MV-algebras are such lattices with $\cdot$ the Łukasiewicz strong conjunction.

### 2.5 Monoidal closure and linear logic

We use the standard vocabulary of symmetric monoidal closed categories for the linear-logical reading of the adjoint structure in §4.5. For the purposes of this paper, the minimal facts are:

- A **symmetric monoidal closed category** has a tensor $\otimes$, a unit $I$, and an internal hom $\multimap$ satisfying $\mathrm{Hom}(A \otimes B, C) \cong \mathrm{Hom}(A, B \multimap C)$.
- A **$*$-autonomous category** (Barr 1979) is a symmetric monoidal closed category with a dualizing object $\bot$ making the double-dual map $A \to (A \multimap \bot) \multimap \bot$ an isomorphism.
- $\mathrm{Chu}(\mathcal{V}, d)$ is always $*$-autonomous (Barr 1979).

For our purposes, a residuated lattice is the degenerate case of a symmetric monoidal closed category where Hom-sets are order-theoretic (truthvaluefunctions into $\mathbf{2}$) rather than set-valued. The residuation axiom is exactly the $\otimes \dashv \multimap$ adjunction specialized to this case.

---

## 3. Spatiotemporal Knowledge Presheaves

### 3.1 Motivation

Classical knowledge representations — relational databases, RDF triple stores, description-logic ABoxes — assign to each subject-predicate-object triple a Boolean value: the triple is either asserted or not. Three features of real knowledge systems are left unmodeled by this choice:

- **Inconsistency.** Two sources may assert contradictory facts; the combined body of knowledge should not trivialize (as it does in classical logic via $p \wedge \neg p \vdash q$).
- **Partial information.** A triple may be genuinely unknown: neither asserted nor refuted.
- **Temporal accumulation.** Knowledge grows monotonically as evidence arrives; absent coordination between sources, replicas must nevertheless converge.

Belnap (1977) introduced the four-valued bilattice $\mathbf{FOUR}$ — with values $\mathbf{t}, \mathbf{f}, \bot, \top$ — to handle the first two at the propositional level. Fitting (1991) developed fixed-point semantics for bilattice-valued logic programs, addressing the third. Paraconsistent description logics (Ma & Hitzler 2009; Zhang et al. 2009) applied $\mathbf{FOUR}$ to OWL. Shapiro et al. (2011) gave the CRDT account of convergence-without-consensus for general join-semilattices.

What is missing from this literature is a *structural* theory of the bilattice-valued knowledge base as a mathematical object — a definition rich enough to carry the adjoint, modal, gauge, dynamical, and convergence-theoretic facts simultaneously, and clean enough to be usable as a substrate for downstream algebraic works.

This section introduces the **spatiotemporal knowledge presheaf** (SKP) as that object.

### 3.2 Definition

Fix an integral commutative residuated lattice $\mathbf{L}$, a small cartesian category $\mathcal{C}$ (the **predicate category**; §3.3), an **entity set** $E$, and an ordinal $\lambda$ (the **cascade bound**). Write
$$A_p := \mathbf{L}^{\bowtie\, E \times E}$$
for the **fiber algebra** of each predicate $p \in \mathcal{C}$ — the pointwise twist-product bilattice on $E \times E$. The fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ sending $p \mapsto A_p$, with generator action specified in §3.5 and Theorem 3.6, is fixed by the parameters $(\mathbf{L}, \mathcal{C}, E)$.

**Definition 3.1 (SKP).** A **spatiotemporal knowledge presheaf** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ of **$\mathcal{C}$-natural valuations**, where:

- Each $v_\tau$ assigns to every predicate $p \in \mathcal{C}$ an element $v_\tau(p) \in A_p$.
- ($\mathcal{C}$-naturality) For every morphism $f : q \to p$ in $\mathcal{C}$ and every $\tau < \lambda$,
$$f^*(v_\tau(p)) = v_\tau(q).$$
- (**Cascade monotonicity**) For all $\sigma \leq \tau < \lambda$ and every $p$,
$$v_\sigma(p) \leq_k v_\tau(p) \quad \text{pointwise in } A_p.$$

**Remark 3.1a (presheaf reading).** An SKP is equivalently a functor $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_\ast(\mathbf{L})$ into the category of pointed distributive bilattices, sending $(p, \tau)$ to the pointed algebra $(A_p, v_\tau(p))$. Predicate-functoriality is $\mathcal{C}$-naturality of $v$; cascade-functoriality is $\leq_k$-monotonicity of the distinguished point. This functorial framing justifies the name "presheaf."

**Remark 3.1b (cascade bound).** The parameter $\lambda$ is typically $\omega$ (for finite-to-countable cascades) and may be any fixed ordinal. Bounding by a fixed $\lambda$ avoids the size-theoretic issues of indexing by the class $\mathbf{Ord}$ of all ordinals while retaining flexibility for transfinite applications. All theorems in the finite setting (§5.3, §7.3, §9.6) instantiate $\lambda = \omega$.

**Definition 3.2 (continuous SKP).** An SKP is **continuous** if for every limit ordinal $\mu < \lambda$ and every $p \in \mathcal{C}$,
$$v_\mu(p) = \bigvee_k \{ v_\sigma(p) : \sigma < \mu \} \quad \text{(cellwise knowledge-join colimit)}.$$

**Definition 3.3 (closure-driven SKP).** An SKP is **closure-driven** by a closure operator $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ (§5.1) if each successor step has the form
$$v_{\tau+1}(p) = \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr)$$
for some increment sequence $(u_\tau)_{\tau < \lambda}$ of $\mathcal{C}$-natural valuations.

Most SKPs of interest are both continuous and closure-driven; the body of the paper treats these as the default case.

### 3.3 Spatial base

The spatial base of an SKP is the triple $(E, \Pi, \mathcal{C})$ consisting of:

- An **entity set** $E$, with no additional structure assumed in general. In applications, $E$ is finite (to support decision procedures; §7.3) and may be sorted. Entities play the role of *individuals* or *nodes* the predicates discuss.

- A **predicate set** $\Pi = \mathrm{Ob}(\mathcal{C})$, the object set of the predicate category.

- A small cartesian category $\mathcal{C}$ whose morphisms are generated by three classes, each inducing a bilattice homomorphism between the corresponding fiber algebras (Definitions 6.1–6.3):

  - **Specialization** $f : q \to p$ with $\mathrm{Fib}(q) \subseteq \mathrm{Fib}(p)$ interpreted as: $q$-triples are a sub-class of $p$-triples.
  - **Converse** $f : p^c \to p$ interpreted as: $p^c$ is the relational converse of $p$, via the swap $(s, o) \mapsto (o, s)$ on the index.
  - **Composition** $p \sqcap q \to p$ (one of two projections) interpreted as: the composite predicate $p \sqcap q$ holds where both factors hold, with the knowledge-meet of their evidence.

The symbol $\sqcap$ denotes the predicate-level composition; it is distinct from the bilattice operation $\wedge_k$ on values (although the two are related: the fiber-algebra map induced by a composition generator is pointwise $\wedge_k$ of valuations).

These three generators suffice to cover the structure-respecting morphisms between fiber algebras under a natural hypothesis; a precise statement appears in §6.7.

**Remark 3.4a (closure under converse and composition).** The predicate set $\Pi = \mathrm{Ob}(\mathcal{C})$ is not required to be closed under the operations $(-)^c$ and $\sqcap$. A converse morphism $p^c \to p$ exists in $\mathcal{C}$ only when $p^c$ is itself an object of $\mathcal{C}$; likewise for $p \sqcap q$. An application may choose which predicate-level operations to include in $\Pi$. The clauses in Definitions 6.1–6.3 are conditional: they describe how $\mathcal{C}$-morphisms of these types act *when they exist*, without mandating their existence.

**Proposition 3.4 (cartesian structure of $\mathcal{C}$).** *When $\Pi$ is closed under composition, $\mathcal{C}$ has finite products given on objects by $p \sqcap q$ and on morphisms by the two projections.*

*Proof.* The projections $\pi_1 : p \sqcap q \to p$ and $\pi_2 : p \sqcap q \to q$ are composition generators. For the universal property, given $r$ with $f : r \to p$ and $g : r \to q$, the composite $p \sqcap q$ together with $f, g$ factors through a unique $h : r \to p \sqcap q$ because pointwise $\wedge_k$ is the lattice meet in the knowledge order at the value level. $\square$

A terminal object $\mathbf{1}$ exists when $\Pi$ contains the "universal" predicate with full support and constant-$\top$ valuation. No initial object exists in general (cf. §6.3).

### 3.4 Temporal axis: the cascade

The cascade-bound $\lambda$ parameterizes the temporal unfolding of knowledge in the SKP. At $\tau = 0$, the SKP may be at any state; at each successor step, information is added (either by external claim or by closure of existing claims under inference rules). Cascade monotonicity (Definition 3.1) ensures that values in $\leq_k$ grow over time: no information is ever retracted; conflicts accumulate as $\top$ rather than trivializing.

**Remark 3.5.** The cascade-bound $\lambda$ may be chosen to fit the application: $\omega$ for countable cascades in finite systems (the setting of the main theorems), an inaccessible cardinal for general transfinite cascades, or any other fixed ordinal. Fixing $\lambda$ keeps all quantifications set-sized.

### 3.5 Fiber algebras and the fiber functor

The fiber algebra $A_p = \mathbf{L}^{\bowtie\, E \times E}$ is the pointwise twist-product bilattice on the index set $E \times E$; it is the same algebra for every predicate $p$ and every cascade step $\tau$. The SKP's data is the cascade $(v_\tau)$ of distinguished valuations *within* these algebras, not a choice of algebra per predicate.

"No data" at a cell $(s, o)$ at step $\tau$ is encoded as $v_\tau(p)(s, o) = \bot$ (a legitimate element of $\mathbf{L}^\bowtie$); the **support at step $\tau$** is derived,
$$\mathrm{Fib}_\tau(p) := \{ (s, o) \in E \times E : v_\tau(p)(s, o) \neq \bot \}.$$

By cascade monotonicity, $\sigma \leq \tau \Rightarrow \mathrm{Fib}_\sigma(p) \subseteq \mathrm{Fib}_\tau(p)$: the support grows monotonically.

**Theorem 3.6 (fiber functor).** *The assignment $p \mapsto A_p = \mathbf{L}^{\bowtie E \times E}$ extends to a contravariant functor*
$$F : \mathcal{C}^{\mathrm{op}} \longrightarrow \mathbf{DBiLat}(\mathbf{L})$$
*with generators acting as follows.*

- *Specialization $f : q \to p$ with inclusion $\iota_f : \mathrm{Fib}(q) \hookrightarrow \mathrm{Fib}(p)$ induces $F(f) = f^* : A_p \to A_q$ by $f^*(v)(s, o) = v(s, o)$ if $(s, o) \in \mathrm{Fib}(q)$, else $\bot$.*
- *Converse $f : p^c \to p$ induces $F(f) = f^*(v)(s, o) = v(o, s)$.*
- *Composition $\pi_1 : p \sqcap q \to p$ induces $F(\pi_1) : A_p \to A_{p \sqcap q}$ by $F(\pi_1)(v_p) = v_p \wedge_k v_q$ (pointwise knowledge-meet), where $v_q$ is the $q$-valuation.*

*Proof.* Each generator induces a bilattice homomorphism at the pointwise level:
- Specialization = restriction along $\iota_f$, which preserves all four pointwise lattice operations.
- Converse = the swap $(s, o) \mapsto (o, s)$, which is an isomorphism of the index set and preserves all pointwise operations on $\mathbf{L}^\bowtie$.
- Composition = pointwise $\wedge_k$, which is a bilattice homomorphism $A_p \times A_q \to A_{p \sqcap q}$ by the interlacing axioms (§2.1).

Functoriality requires $F(\mathrm{id}_p) = \mathrm{id}_{A_p}$ (immediate: each generator-class contains the identity as a degenerate case) and $F(g \circ f) = F(f) \circ F(g)$ on composable generators. Verification by case analysis on the nine pairs of generator types; each case reduces to standard properties of restriction, negation, and meet. $\square$

**Corollary 3.7.** *The residuation adjunction $\odot \dashv \Rightarrow$ (Theorem 4.1 below) lifts pointwise to an adjunction on each fiber algebra $A_p$.*

The fiber functor $F$ lands in $\mathbf{DBiLat}(\mathbf{L})$ and also preserves the residuated structure $\odot, \Rightarrow$ on each $A_p$ under every $\mathcal{C}$-morphism (Proposition 4.6). The bilattice negation $\sim$ is an *internal* operation on each $A_p$ — available pointwise — but does not commute with $\odot$ (Proposition 9.5); this is a structural fact about the pair $(\odot, \sim)$ on $\mathbf{L}^\bowtie$, not about any morphism of $\mathcal{C}$.

### 3.6 First example

**Example 3.8 (trivial SKP).** Take $E = \{a\}$, $\Pi = \{p\}$, $\mathcal{C}$ the discrete one-object category, $\lambda = 1$. The fiber algebra $A_p = \mathbf{L}^{\bowtie \{(a, a)\}} \cong \mathbf{L}^\bowtie$ has a single cell. Setting $v_0(p)(a, a) = \mathbf{t}$ gives a valid SKP: $\mathcal{C}$-naturality is trivial (no non-identity morphisms), cascade monotonicity is vacuous at $\lambda = 1$. This is the smallest non-trivial SKP.

Further examples — exhibiting specialization, converse, composition, cascade dynamics, and the CRDT convergence — appear in §11.

## 4. The Adjoint Structure

This section constructs the residuation operations on the twist-product $\mathbf{L}^\bowtie$ and proves the central adjointness theorem. §4.4 lifts the adjunction to fibers. §4.5 gives the linear-logical reading via the Chu correspondence (Jakl 2025). §4.6 records the algebraic properties specific to $\mathbf{FOUR}$.

### 4.1 The product $\odot$

Let $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$ be an integral commutative residuated lattice. Define on the carrier $L^2$ of the twist product $\mathbf{L}^\bowtie$:
$$(x, y) \odot (z, v) := (x \cdot z, \ (x \to v) \wedge (z \to y)). \tag{4.1}$$

The operation $\odot$ is the **twist-product fusion** (Busaniche & Cignoli 2014; Chajda & Länger 2021). Its first component is the monoid product of positive-evidence components; its second component cross-tests each side's positive evidence against the other side's negative evidence.

### 4.2 The implication $\Rightarrow$

Dually, define the **twist-product right residual**:
$$(x, y) \Rightarrow (z, v) := ((x \to z) \wedge (v \to y), \ x \cdot v). \tag{4.2}$$

The first component tests implication in both directions of the residuated-lattice structure; the second collects the product of the antecedent's positive evidence with the consequent's negative evidence.

### 4.3 The residuation theorem

**Theorem 4.1 (Residuation on $\mathbf{L}^\bowtie$).** *For any integral commutative residuated lattice $\mathbf{L}$, the structure $(L^2, \sqcup, \sqcap, \odot, \Rightarrow, (1, 1))$ is a commutative residuated lattice. Explicitly:*

1. *$\langle L^2, \sqcup, \sqcap \rangle$ is a lattice.*
2. *$\langle L^2, \odot, (1, 1) \rangle$ is a commutative monoid.*
3. *Residuation (adjointness) holds:*
$$(a, b) \odot (c, d) \leq_t (e, f) \iff (a, b) \leq_t (c, d) \Rightarrow (e, f). \tag{4.3}$$

The theorem is due to Busaniche & Cignoli (2014) and independently Tsinakis & Wille (2006); Chajda & Länger (2021) give a direct proof of (4.3). Below we reproduce that proof in our notation.

*Proof of (4.3).* The following are equivalent:

(i) $(a, b) \odot (c, d) \leq_t (e, f)$,

(ii) $(a \cdot c,\ (a \to d) \wedge (c \to b)) \leq_t (e, f)$ — by definition of $\odot$,

(iii) $a \cdot c \leq e$ and $f \leq (a \to d) \wedge (c \to b)$ — by definition of $\leq_t$ on $L^2$,

(iv) $a \cdot c \leq e$, $f \leq a \to d$, $f \leq c \to b$ — the meet condition expanded,

(v) $a \leq c \to e$, $a \leq f \to d$, $c \cdot f \leq b$ — applying residuation in $\mathbf{L}$ three times (using commutativity to rewrite $a \cdot f \leq d$ as $a \leq f \to d$ in the second),

(vi) $a \leq (c \to e) \wedge (f \to d)$ and $c \cdot f \leq b$ — combining the two $a$-bounds by meet,

(vii) $(a, b) \leq_t ((c \to e) \wedge (f \to d),\ c \cdot f)$ — by definition of $\leq_t$,

(viii) $(a, b) \leq_t (c, d) \Rightarrow (e, f)$ — by definition of $\Rightarrow$.

Every step is an if-and-only-if. $\square$

Parts (1) and (2) of Theorem 4.1 are verified by direct computation; part (1) is immediate and part (2) uses commutativity and associativity of $\cdot$, currying ((8) of Proposition 2.3), and $x \to 1 = 1$. Complete details appear in Chajda & Länger (2021, Theorem 2.3).

**Remark 4.2.** The monoidal unit $(1, 1)$ is not the top of the lattice $\langle L^2, \sqcup, \sqcap \rangle$, which is $(1, 0)$. Consequently $(L^2, \odot, \Rightarrow)$ is a **non-integral** commutative residuated lattice.

**Remark 4.3 (negation duality).** With the antitone involution $(x, y)' := (y, x)$ on $L^2$ (= the bilattice negation $\sim$ when $\mathbf{L}^\bowtie$ is so structured),
$$(x, y) \odot (z, v) = ((x, y) \Rightarrow (z, v)')'$$
(Chajda & Länger 2021 eq. after Theorem 2.3). The product and implication are related by conjugation with the involution.

**Remark 4.4 (alternative adjoint pair).** Chajda & Länger (2021, §5) introduce an alternative residuated pair on $L^2$ using $(y'\cdot v')'$ in the second component of $\odot$ — valid when $\mathbf{L}$ is bounded and satisfies the double-negation law. This alternative pair makes the resulting residuated lattice *integral* (the monoidal unit coincides with the lattice top). We do not adopt this alternative; the Busaniche–Cignoli pair (4.1)–(4.2) remains our default.

### 4.4 Lifting to fibers

**Corollary 4.5 (pointwise lift).** *For each predicate $p \in \mathcal{C}$ and cascade step $\tau$, the fiber algebra $A_p = \mathbf{L}^{\bowtie E \times E}$ inherits a pointwise residuation adjunction: for $v_1, v_2, v_3 \in A_p$,*
$$v_1 \odot v_2 \leq_t v_3 \iff v_1 \leq_t v_2 \Rightarrow v_3,$$
*where $\odot, \Rightarrow$, and $\leq_t$ act cellwise.*

*Proof.* Both directions of the equivalence hold cellwise by Theorem 4.1 applied at each $(s, o)$. $\square$

The fiber functor $F$ (Theorem 3.6) carries each fiber algebra $A_p$ to a distributive bilattice; the residuated structure of Corollary 4.5 is additional data on each $A_p$. We verify that every morphism of $\mathcal{C}$ preserves this residuated structure.

**Proposition 4.6 (naturality).** *For every morphism $f : q \to p$ in $\mathcal{C}$, the induced $f^* : A_p \to A_q$ is a residuated-lattice homomorphism: $f^*(v_1 \odot v_2) = f^*(v_1) \odot f^*(v_2)$ and $f^*(v_1 \Rightarrow v_2) = f^*(v_1) \Rightarrow f^*(v_2)$.*

*Proof.* It suffices to check the generators. Specialization, converse, and composition each induce cellwise maps on the underlying index set — restriction along a sub-support inclusion, swap $(s, o) \mapsto (o, s)$, and pointwise knowledge-meet, respectively. The operations $\odot, \Rightarrow$ are pointwise in $\mathbf{L}^\bowtie$, so any cellwise reindexing commutes with them; the pointwise knowledge-meet is a bilattice homomorphism which is also residuated-structure-preserving since $\odot, \Rightarrow$ are cellwise. $\square$

A separate — and dynamically important — fact is that the internal bilattice negation $\sim$ on $\mathbf{L}^\bowtie$ does *not* commute with $\odot$: naive contrapositive fails. This is a property of the pair $(\odot, \sim)$, independent of any $\mathcal{C}$-morphism; it is stated formally as Proposition 9.5 and the Nelson identity (Theorem 9.4) exhibits the corrected form in which contrapositive symmetry is recovered.

### 4.5 Linear-logical reading

Jakl (2025, Lemma 3.1) establishes the term-definability of the linear-logic connectives of $\mathrm{Chu}(H, 0)$ from the bilattice structure of $H^\bowtie$. Restricted to our setting and notation: for $\mathbf{L}$ a Heyting algebra (equivalently, an integral commutative residuated lattice with $\cdot = \wedge$ and meet-preserving implication), the Chu tensor $\otimes$ on the consistent sub-algebra $\{(a_+, a_-) : a_+ \wedge a_- = 0\}$ coincides with the twist-product fusion $\odot$ defined by (4.1); the Chu linear implication $\multimap$ coincides with $\Rightarrow$ defined by (4.2).

**Corollary 4.7 (Chu / linear-logic reading).** *The adjunction $\odot \dashv \Rightarrow$ on $\mathbf{L}^\bowtie$ is the $\otimes \dashv \multimap$ adjunction of classical multiplicative linear logic, algebraically instantiated on the $*$-autonomous category $\mathrm{Chu}(\mathbf{L}, 0)$ when restricted to the consistent sub-algebra.*

The full twist-product $\mathbf{L}^\bowtie$ extends the linear-logic model beyond the consistency constraint $a_+ \wedge a_- = 0$. This extension corresponds to allowing the Chu pairing $a_+ \wedge a_-$ to take *any* value in $\mathbf{L}$, rather than requiring it to be $0$. The inconsistent element $\top = (1, 1)$ is the case $a_+ \wedge a_- = 1$ — maximal simultaneous positive and negative evidence.

### 4.6 Algebraic properties on $\mathbf{FOUR}$

Specializing to $\mathbf{L} = \mathbf{2}$ gives $\mathbf{L}^\bowtie = \mathbf{FOUR}$, and (4.1)–(4.2) specialize to operations on the four epistemic values. The following are direct computations.

**Proposition 4.8.** *In $\mathbf{FOUR}$ with $\odot, \Rightarrow$ of Theorem 4.1:*

1. *$\top$ is the identity for $\odot$: $\top \odot a = a$ for all $a$.*
2. *$\mathbf{f}$ is absorbing: $\mathbf{f} \odot a = \mathbf{f}$ for all $a$.*
3. *$\mathbf{t}, \mathbf{f}, \top$ are idempotent under $\odot$; $\bot$ is not: $\bot \odot \bot = \mathbf{f}$.*
4. *Self-implication: $a \Rightarrow a = \mathbf{t}$ for $a \in \{\bot, \mathbf{t}, \mathbf{f}\}$; $\top \Rightarrow \top = \top$.*

*Proof.* (1) $(1, 1) \odot (x, y) = (1 \cdot x,\ (1 \to y) \wedge (x \to 1)) = (x, y \wedge 1) = (x, y)$. (2) $(0, 1) \odot (x, y) = (0 \cdot x,\ (0 \to y) \wedge (x \to 1)) = (0, 1 \wedge 1) = (0, 1) = \mathbf{f}$. (3) $(x, y) \odot (x, y) = (x \cdot x,\ (x \to y) \wedge (x \to y)) = (x, x \to y)$; computing case by case: $\mathbf{t} \odot \mathbf{t} = (1, 0) = \mathbf{t}$; $\mathbf{f} \odot \mathbf{f} = (0, 1) = \mathbf{f}$; $\top \odot \top = (1, 1) = \top$; $\bot \odot \bot = (0, 0 \to 0) = (0, 1) = \mathbf{f}$. (4) direct calculation. $\square$

**Remark 4.9.** Direct computational verification of the residuation adjointness on all $|\mathbf{FOUR}|^3 = 64$ triples in $\mathbf{FOUR}$ is a one-line consequence of Theorem 4.1: the theorem holds for any integral commutative residuated lattice $\mathbf{L}$, and $\mathbf{2}$ is such a lattice.

## 5. Closure and Equilibrium

The cascade axis of an SKP unfolds knowledge over time. At each successor step, new claims may arrive from outside, and inference rules internal to the SKP may fire. This section formalizes both via a **closure operator** and proves that cascade-with-closure SKPs reach equilibrium (quiescence) in finitely many steps when $E$ and $\mathcal{C}$ are finite.

### 5.1 The closure operator

**Definition 5.1 (closure operator).** A **closure operator** on the fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is a family of maps $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ with $\mathrm{cl}_p : A_p \to A_p$ such that:

1. **Monotone in $\leq_k$:** $v \leq_k v' \Rightarrow \mathrm{cl}_p(v) \leq_k \mathrm{cl}_p(v')$.
2. **Inflationary:** $v \leq_k \mathrm{cl}_p(v)$.
3. **Idempotent:** $\mathrm{cl}_p \circ \mathrm{cl}_p = \mathrm{cl}_p$.
4. **Natural in $\mathcal{C}$:** $f^* \circ \mathrm{cl}_q = \mathrm{cl}_p \circ f^*$ for every $f : p \to q$ in $\mathcal{C}$.

Conditions (1)–(3) are the classical lattice-theoretic closure axioms; (4) says closure commutes with the predicate-category base change.

**Proposition 5.2.** *Each $\mathrm{cl}_p$ is a closure operator on the knowledge-order lattice $(A_p, \leq_k)$ in the classical sense.*

*Proof.* Conditions (1)–(3) of Definition 5.1 are exactly the classical axioms. $\square$

**Interpretation.** The closure $\mathrm{cl}_p(v)$ is the *consequence closure* of the valuation $v$ under the inference rules encoded in $\mathrm{cl}$. For a logic-programming-style SKP, $\mathrm{cl}$ implements Fitting's (1991) fixed-point operator per fiber. For a description-logic-style SKP, $\mathrm{cl}$ implements TBox-driven inference. The SKP definition is *closure-agnostic*: any closure operator satisfying Definition 5.1 is admissible; applications choose $\mathrm{cl}$ to suit.

### 5.2 Monotonicity and inflationarity of the cascade

**Proposition 5.3.** *Let $v = (v_\tau)_{\tau < \lambda}$ be a continuous (Definition 3.2), closure-driven (Definition 3.3) SKP. Then for every $p$, the sequence $(v_\tau(p))_{\tau < \lambda}$ is $\leq_k$-monotone in $A_p$.*

*Proof.* Successor step: $v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p) \vee_k u_{\tau+1}(p)) \geq_k v_\tau(p) \vee_k u_{\tau+1}(p) \geq_k v_\tau(p)$, using inflationarity of $\mathrm{cl}_p$ and the lattice property $a \leq_k a \vee_k b$. Limit step: by continuity, $v_\mu(p)$ is the cellwise $\vee_k$-colimit of $\{v_\sigma(p) : \sigma < \mu\}$, and every earlier element is below it by the cocone property. $\square$

In particular, closure-driven continuous SKPs automatically satisfy the cascade monotonicity axiom (Definition 3.1).

### 5.3 Cascade convergence

**Theorem 5.4 (cascade convergence).** *Let $v$ be a continuous, closure-driven SKP over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $\mathbf{L}$, $E$, and $\mathcal{C}$ all finite and $\lambda \geq \omega$. Suppose the increment sequence $(u_\tau)$ is eventually zero: there exists $\tau_0$ such that $u_\tau(p) = \bot$ for all $\tau > \tau_0$ and all $p$. Then there exists $\tau^* < \tau_0 + \omega$ such that $v_\tau(p) = v_{\tau^*}(p)$ for all $p \in \mathcal{C}$ and all $\tau$ with $\tau^* \leq \tau < \lambda$.*

*Proof.* After $\tau_0$, the cascade evolves only by closure:
$$v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p)) \quad \text{for } \tau \geq \tau_0.$$
By Proposition 5.3, $(v_\tau(p))_{\tau \geq \tau_0}$ is a $\leq_k$-ascending chain in $A_p$. Since $\mathbf{L}$ and $E$ are finite, $A_p = \mathbf{L}^{\bowtie E \times E}$ is finite, hence every ascending chain stabilizes in finitely many steps. Let $\tau^*(p) < \tau_0 + \omega$ be the stabilization ordinal for predicate $p$. Since $\mathcal{C}$ is finite, $\tau^* := \max_{p \in \mathcal{C}} \tau^*(p) < \tau_0 + \omega$ stabilizes the cascade globally. $\square$

**Definition 5.5 (quiescence).** An SKP is **quiescent at $\tau^*$** if $v_\tau(p) = v_{\tau^*}(p)$ for all $p \in \mathcal{C}$ and all $\tau$ with $\tau^* \leq \tau < \lambda$.

**Corollary 5.6.** *Every finite-$E$-and-$\mathcal{C}$ continuous closure-driven SKP with eventually-zero increments is quiescent at some $\tau^* < \omega$ (setting $\tau_0 = 0$ gives a finite bound when all increments happen at once).*

### 5.4 Restriction to $\{\mathbf{t}, \mathbf{f}, \top\}$

When a cascade reaches quiescence, $\bot$-valued cells correspond to predicate-triples on which no evidence can be inferred by the closure. The effective algebra after quiescence operates on $\{\mathbf{t}, \mathbf{f}, \top\}$ — the "told something" sub-algebra of $\mathbf{FOUR}$.

**Proposition 5.7.** *The set $\{\mathbf{t}, \mathbf{f}, \top\}$ is closed under $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ on $\mathbf{FOUR}$.*

*Proof.* Direct inspection of the operation tables on the 9-element product $\{\mathbf{t}, \mathbf{f}, \top\}^2$. $\square$

**Theorem 5.8 (post-closure adjunction).** *The subset $\{\mathbf{t}, \mathbf{f}, \top\} \subseteq \mathbf{FOUR}$ is closed under $\odot$ and $\Rightarrow$. The identity $\top$ lies in $\{\mathbf{t}, \mathbf{f}, \top\}$. The adjunction of Theorem 4.1 restricts:*
$$a \odot p \leq_t q \iff p \leq_t (a \Rightarrow q) \quad \text{for } a, p, q \in \{\mathbf{t}, \mathbf{f}, \top\}.$$

*Proof.* Closure under $\odot, \Rightarrow$: enumeration on $\{\mathbf{t}, \mathbf{f}, \top\} \times \{\mathbf{t}, \mathbf{f}, \top\} = 9$ ordered pairs; each $a \odot b$ and $a \Rightarrow b$ computed from (4.1)–(4.2) lies in $\{\mathbf{t}, \mathbf{f}, \top\}$. The identity $\top \in \{\mathbf{t}, \mathbf{f}, \top\}$. Adjointness is inherited from the full $\mathbf{FOUR}$-case (Theorem 4.1) because the restriction contains witnesses for all $a, p, q$. $\square$

### 5.5 Post-closure algebra

At quiescence, the valuation $v_{\tau^*}(p)$ takes values in $\{\mathbf{t}, \mathbf{f}, \top\} \subseteq \mathbf{FOUR}$ on the support $\mathrm{Fib}_{\tau^*}(p)$ — cells are either *told true* ($\mathbf{t}$), *told false* ($\mathbf{f}$), or *told both* ($\top$). Cells outside the support remain $\bot$ by convention, representing the declaration that the predicate does not apply at those $(s, o)$-pairs.

**Remark 5.9.** $\top$-valued cells after closure represent genuine inconsistency — evidence of both $\mathbf{t}$ and $\mathbf{f}$ that the closure could not reconcile. In the bilattice setting this is not a pathology; it is an observation that the inference rules (and the information provided) allow contradictions. The CRDT framework (§9.6) shows that $\top$-values are stable under merging: once an inconsistency appears, it persists. If the application requires detecting and resolving inconsistencies, a meta-closure can be built that pushes $\top$-valued cells to a separate error state; the SKP definition does not mandate this.

## 6. Morphisms and the Category $\mathbf{SKP}$

### 6.1 Predicate-morphism generators

The predicate category $\mathcal{C}$ was introduced in §3.3 as a small cartesian category with three classes of generating morphisms. We now pin down each precisely.

**Definition 6.1 (specialization).** A **specialization** $f : q \to p$ is a pair of predicates $q, p$ with an index map $\iota_f : E \times E \to E \times E$ (identity on a sub-support) such that $\mathrm{Fib}(q) \subseteq \mathrm{Fib}(p)$. The induced fiber-algebra map $f^* : A_p \to A_q$ is the restriction of valuation along $\iota_f$: $f^*(v)(s, o) = v(s, o)$ for $(s, o) \in \mathrm{Fib}(q)$, else $\bot$.

**Definition 6.2 (converse).** A **converse** $f : p^c \to p$ is the morphism induced by the index swap: $f^*(v)(s, o) = v(o, s)$. It encodes the relational converse of $p$.

**Definition 6.3 (composition).** When $\Pi$ contains $p \sqcap q$, the **composition** morphisms are the projections $\pi_p : p \sqcap q \to p$ and $\pi_q : p \sqcap q \to q$, with induced action $\pi_p^*(v_{p}) = v_{p} \wedge_k v_{q}$ pointwise (the composite carries both components' evidence knowledge-meet, using the bilattice operation $\wedge_k$ on values).

**Proposition 6.4.** *Each of the three generator classes induces a bilattice homomorphism on the corresponding fiber algebras.*

*Proof.* Proved case by case in Theorem 3.6. $\square$

### 6.2 SKP morphisms

**Definition 6.5.** Let $v, v'$ be SKPs over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and $(\mathbf{L}', \mathcal{C}', E', \lambda')$ respectively. An **SKP morphism** $\phi : v \to v'$ consists of:

1. A homomorphism $\ell : \mathbf{L} \to \mathbf{L}'$ of integral commutative residuated lattices.
2. A function $e : E \to E'$.
3. A functor $\pi : \mathcal{C} \to \mathcal{C}'$ preserving generator classes.
4. An order-preserving map $\phi_\lambda : \lambda \to \lambda'$.
5. A family $\phi = (\phi_{p, \tau})$ of bilattice homomorphisms $\phi_{p, \tau} : A_p \to A_{\pi(p)}'$, each induced by $\ell^\bowtie$ and $e \times e$, such that $\phi_{p, \tau}(v_\tau(p)) = v'_{\phi_\lambda(\tau)}(\pi(p))$ for all $p, \tau$.

For most of the paper we fix $(\mathbf{L}, \mathcal{C}, E, \lambda) = (\mathbf{L}', \mathcal{C}', E', \lambda')$ and $\ell = \mathrm{id}, e = \mathrm{id}, \pi = \mathrm{id}, \phi_\lambda = \mathrm{id}$; the SKP morphism is then a compatible family of bilattice endomorphisms $\phi_{p, \tau} : A_p \to A_p$ with $\phi_{p, \tau}(v_\tau(p)) \leq_k v'_\tau(p)$ at every $(p, \tau)$.

### 6.3 The category $\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E, \lambda)$

**Definition 6.6.** $\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ is the category whose objects are SKPs over fixed $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and whose morphisms are the restricted-setting morphisms of Definition 6.5.

**Proposition 6.7.** *$\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has a terminal object $\mathbf{1}$ given by the constant-$\top$ SKP: $v_\tau^{\mathbf{1}}(p)(s, o) = \top$ for every $(p, \tau, s, o)$. There is no initial object in general.*

*Proof.* Terminal: any SKP $v$ has a unique morphism to $\mathbf{1}$ given at each $(p, \tau)$ by the constant-$\top$ map (which satisfies $v_\tau(p) \leq_k \top$ trivially). For initial: a prospective initial SKP would have to admit a unique morphism to every SKP including any constant-$\bot$ one; but the ordering constraint $\phi_{p,\tau}(\bot) \leq_k v'_\tau(p)$ is satisfied trivially, so uniqueness fails. Hence no initial object in general. $\square$

### 6.4 Limits and colimits

**Theorem 6.8 (completeness and cocompleteness).** *$\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E, \lambda)$ has all small limits and colimits, computed pointwise in $\mathbf{DBiLat}(\mathbf{L})$.*

*Proof.* An SKP is a $\mathcal{C}$-natural, $\leq_k$-monotone family of valuations in $\prod_p A_p$, indexed by the set-sized ordinal $\lambda$. Pointwise limit/colimit of a small diagram of SKPs gives a family of valuations again in $\prod_p A_p$; $\mathcal{C}$-naturality and $\leq_k$-monotonicity are preserved by pointwise operations because $A_p$ is a complete lattice in both orderings. (Mac Lane 1971, Ch. V.) $\square$

**Corollary 6.9.** *The pointwise $\vee_k$-join of two SKPs $v, v'$ — i.e., $(v \vee_k v')_\tau(p)(s, o) := v_\tau(p)(s, o) \vee_k v'_\tau(p)(s, o)$ — is a $\leq_k$-semilattice operation on SKPs. This is the CRDT merge (§9.6).*

### 6.5 The fiber functor, revisited

The fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ of Theorem 3.6 depends only on the base parameters $(\mathbf{L}, \mathcal{C}, E)$, not on the specific SKP. An SKP is then a $\leq_k$-monotone, $\mathcal{C}$-natural $\lambda$-indexed trajectory through the product $\prod_p F(p)$. The fiber functor is to the SKP as the configuration space is to a physical state: the SKP is a trajectory in the space of valuations, parameterized by the cascade axis.

### 6.6 Configuration space vs. trajectory

**Remark 6.12.** The decomposition of SKP data into (a) the fiber functor $F$ and (b) the cascade trajectory $v$ is structural: $F$ depends only on the base parameters $(\mathbf{L}, \mathcal{C}, E)$ and is shared across all SKPs with the same base; the SKP-specific data lives in the $\lambda$-indexed family $v_\tau$ of points in $\prod_p A_p$. Two SKPs over the same base differ only in their trajectories.

### 6.7 Remarks on generator exhaustiveness

It is natural to ask whether specialization, converse, and composition exhaust the class of predicate-morphisms inducing bilattice homomorphisms between fiber algebras. The answer depends on a hypothesis on what counts as "structure-respecting." We state a precise version and sketch the proof.

**Definition 6.13 (natural morphism).** A bilattice homomorphism $\phi : A_q \to A_p$ between fiber algebras is **natural** if for every permutation $\sigma$ of $E$, the induced relabelings $\sigma^* : A_q \to A_q$ and $\sigma^* : A_p \to A_p$ satisfy $\sigma^* \circ \phi = \phi \circ \sigma^*$.

Naturality forbids $\phi$ from treating particular entities specially; only the *structure* of the argument's fiber enters the image.

**Proposition 6.14 (exhaustiveness of generators under naturality).** *Every natural bilattice homomorphism between SKP fiber algebras factors through a finite composition of specialization, converse, and composition morphisms.*

*Proof sketch.* A natural bilattice homomorphism $\phi : A_q \to A_p$ is determined by its action on canonical inputs. By naturality under $E$-relabelings, $\phi$ cannot distinguish specific entities; its action must factor through structure-preserving index maps and pointwise bilattice operations. The $E$-equivariant bijections $E \times E \to E \times E$ are generated by the identity (a trivial specialization) and the swap $(s, o) \mapsto (o, s)$ (converse). The $E$-equivariant non-bijective index maps — restrictions to sub-supports — are specializations. Multi-input cellwise combinations are generated by pointwise $\wedge_k$ (composition) and its iterates. No further generator class is needed. $\square$

**Remark 6.15.** Without the naturality hypothesis, pathological bilattice homomorphisms can be constructed by distinguishing particular entities (e.g., mapping $v$ to a fiber-algebra element that depends on the value at one specific $(s_0, o_0)$-cell while ignoring others). Such homomorphisms are bilattice-algebraic but are not faithful to the SPO-relational structure of the SKP. The naturality hypothesis is the correct principle for restricting to structure-respecting morphisms; Proposition 6.14 says the three generators suffice under this principle.

## 7. The Modal Calculus

This section defines four-valued modal operators on SKP fibers, connects them to classical bimodal Kripke semantics via the twist-product translation of Rivieccio, Jung, and Jansana (2017), and establishes decidability and the finite model property for the SKP modal calculus.

### 7.1 Four-valued modal operators on fibers

Fix an SKP $\mathbf{M}$ with a Kripke-style world structure on its fibers: a set $W$ (the "worlds," possibly the cascade ordinals themselves or a separate index set), an accessibility relation $R : W \times W \to \mathbf{L}^\bowtie$ (the four-valued generalization of the classical Kripke relation), and world-indexed valuations $v_w \in A_p$ for each predicate $p$.

**Definition 7.1 (necessity).** The **necessity operator** $\Box_R$ acts on world-indexed valuations by
$$(\Box_R v)_w(s, o) := \bigwedge_t \{ R(w, w') \to v_{w'}(s, o) : w' \in W \} \tag{7.1}$$
where $\bigwedge_t$ is the truth-order meet on $\mathbf{L}^\bowtie$ and $\to$ is the strong implication (the right residual of the fusion $\odot$ — equivalently the $\Rightarrow$ of §4.2, restricted to per-cell action).

**Definition 7.2 (possibility).** Dually,
$$(\Diamond_R v)_w(s, o) := \bigvee_t \{ R(w, w') \odot v_{w'}(s, o) : w' \in W \}. \tag{7.2}$$

These are the four-valued analogues of the classical $\Box$ and $\Diamond$; they reduce to the Boolean modal operators when $\mathbf{L} = \mathbf{2}$ and $R$ is $\{0, 1\}$-valued.

**Proposition 7.3 (basic properties).** *The operator $\Box_R$ satisfies:*

1. *$\Box_R \mathbf{t} = \mathbf{t}$ (where $\mathbf{t}$ denotes the constant-$\mathbf{t}$ valuation).*
2. *$\Box_R(v \wedge_t v') = \Box_R v \wedge_t \Box_R v'$.*
3. *$\Box_R(c \to v) = c \to \Box_R v$ for constants $c \in \{\mathbf{t}, \mathbf{f}, \bot, \top\}$.*

*Proof.* Pointwise consequences of the corresponding identities on $\mathbf{L}^\bowtie$ established by Rivieccio, Jung, and Jansana (2017, Proposition 3.2). $\square$

**Proposition 7.4 (non-normality).** *The normality axiom $\Box_R(\phi \to \psi) \to (\Box_R \phi \to \Box_R \psi)$ does not hold in general.*

*Proof.* Witness: $|W| = 1$, $R(w, w) = \bot$; $v(p, w) = \bot$, $v(q, w) = \mathbf{f}$. Then $v(p \to q) = \bot \to \mathbf{f} = \bot$, $\Box p = \bot \to \bot = \mathbf{t}$, $\Box q = \bot \to \mathbf{f} = \bot$, $\Box(p \to q) = \bot \to \bot = \mathbf{t}$, while $\Box p \to \Box q = \mathbf{t} \to \bot = \bot$. So the normality-axiom formula evaluates to $\mathbf{t} \to \bot = \bot \notin \{\mathbf{t}, \top\}$. $\square$

This non-normality reflects the paraconsistent nature of the bilattice modal logic and is central to the structural difference between SKP modalities and classical Kripke modalities.

### 7.2 Translation to classical bimodal logic

Rivieccio, Jung, and Jansana (2017, Proposition 5.20 and Theorem 5.22) establish a translation of the four-valued modal logic on $\mathbf{FOUR}^\bowtie$ into classical bimodal logic on a pair of Boolean modal algebras. The translation lifts to SKPs.

**Definition 7.5 (twist translation).** To each formula $\phi$ in the modal language over $\mathbf{L}^\bowtie$, assign a pair $\nu(\phi) = (\nu_1(\phi), \nu_2(\phi))$ of classical-bimodal-language formulas, where $\nu_1$ extracts positive-evidence and $\nu_2$ extracts negative-evidence. For modal formulas:
$$\nu_1(\Box \phi) := \Box_+ \nu_1(\phi) \wedge \Box_- \sim \nu_2(\phi)$$
$$\nu_2(\Box \phi) := \sim \Box_+ \sim \nu_2(\phi)$$
where $\Box_+, \Box_-$ are two classical modal operators corresponding to the positive and negative components of the four-valued accessibility $R$.

**Theorem 7.6 (Rivieccio–Jung–Jansana 2017, Proposition 5.21).** *For a modal bilattice $\mathbf{B} = \mathbf{A}^\bowtie$ over a bimodal Boolean algebra $\mathbf{A}$, and formulas $\Gamma \cup \{\phi\}$ in the four-valued modal language: $\Gamma \vdash_g \phi$ iff $\nu_1(\Gamma) \vdash^{cb}_g \nu_1(\phi)$ (and similarly for local consequence), where $\vdash^{cb}$ is classical bimodal consequence.*

**Corollary 7.7.** *The four-valued modal logic on SKP fibers is equi-expressive with classical bimodal logic on the pair $(\nu_1, \nu_2)$-components.*

### 7.3 Decidability and finite model property

**Theorem 7.8 (Rivieccio–Jung–Jansana 2017, Theorem 5.22).** *Both the local and global consequence relations of the four-valued modal logic on $\mathbf{FOUR}^\bowtie$ have the finite model property, and therefore are decidable.*

*Proof sketch.* Classical bimodal logic has the finite model property (Blackburn, de Rijke, Venema 2001, Theorems 2.7.9 and 3.1.10). Theorem 7.6 transfers the property to the four-valued modal logic via the translation $\nu$. Given a failed consequence $\Gamma \not\vdash \phi$, the corresponding $\nu_1(\Gamma) \not\vdash^{cb} \nu_1(\phi)$ admits a finite bimodal Boolean model; recombining this model via the twist-product structure produces a finite four-valued Kripke model witnessing the original failed consequence. $\square$

**Corollary 7.9.** *The modal calculus on SKP fibers over $\mathbf{L} = \mathbf{2}$ has the finite model property and is decidable.*

### 7.4 Complexity

Classical bimodal logic is decidable but computationally non-trivial: local consequence is PSPACE-complete and global consequence is EXPTIME-complete for the minimal normal bimodal logic (Halpern & Moses 1992; Blackburn et al. 2001). The translation $\nu$ of Theorem 7.6 has polynomial size, so the complexity of the four-valued modal logic inherits the classical complexity up to a polynomial factor:

**Proposition 7.10.** *Local consequence on the SKP modal calculus is in PSPACE. Global consequence is in EXPTIME.*

*Proof.* Immediate from Theorem 7.6 and the complexity of classical bimodal logic. $\square$

For finite fiber-algebra cases (finite $E$ and $\mathbf{L} = \mathbf{2}$), these bounds specialize to polynomial-time enumeration over $\mathbf{FOUR}^{E \times E}$.

## 8. Gauge and Duality

Jung and Rivieccio (2012) give a Priestley-style duality for distributive bilattices: each distributive bilattice corresponds to a pair of Priestley spaces linked by continuous order-preserving maps, and the bilattice negation corresponds to a swap involution on the pair. This section lifts the duality fiberwise to SKPs, exhibits the $\mathbb{Z}/2$ gauge structure carried by the swap involution, and describes the resulting dual representation.

### 8.1 Priestley duality for $\mathbf{FOUR}$

Recall that **Priestley duality** (Priestley 1970, 1972) establishes a contravariant equivalence between the category of bounded distributive lattices and the category of Priestley spaces (compact, totally order-disconnected ordered topological spaces):
$$\mathbf{DLat}^{\mathrm{op}} \simeq \mathbf{PriSp}.$$
The functor $\mathrm{Spec} : \mathbf{DLat}^{\mathrm{op}} \to \mathbf{PriSp}$ sends a lattice to its space of prime filters; the inverse sends a Priestley space to its lattice of clopen up-sets.

**Theorem 8.1 (Jung–Rivieccio 2012).** *The category of distributive bilattices is dually equivalent to a category of paired Priestley spaces: each distributive bilattice $\mathbf{B} \cong \mathbf{L}^\bowtie$ corresponds to the pair $(\mathrm{Spec}(\mathbf{L}), \mathrm{Spec}(\mathbf{L}))$ with a swap involution encoding the bilattice negation.*

For $\mathbf{FOUR} = \mathbf{2}^\bowtie$: since $\mathrm{Spec}(\mathbf{2})$ is a single point, the Priestley dual of $\mathbf{FOUR}$ is a two-point space $\{+, -\}$ with a swap map $+ \leftrightarrow -$. This is the simplest non-trivial paired Priestley space.

### 8.2 The internal $\mathbb{Z}/2$ gauge

The swap involution on the Priestley dual of $\mathbf{FOUR}$ has order 2: applied twice it returns to identity. It exchanges the two "coordinates" of the twist-product — positive-evidence and negative-evidence — and, dually, corresponds to the bilattice negation $\sim$.

**Definition 8.2 (internal gauge).** The **internal gauge** of $\mathbf{FOUR}$ is the $\mathbb{Z}/2$-action on $\mathbf{FOUR}$ by $\sim$: the non-trivial element of $\mathbb{Z}/2$ acts as $\sim$, the identity as $\mathrm{id}$.

This gauge action preserves the knowledge order $\leq_k$, reverses the truth order $\leq_t$, and fixes the two "symmetric" values $\bot, \top$ while swapping $\mathbf{t}, \mathbf{f}$. The paired-Priestley-space dual inherits the corresponding $\mathbb{Z}/2$-action on the dual.

### 8.3 Duality lifted to SKPs

The fiberwise application of Jung–Rivieccio duality to an SKP yields a dual structure.

**Definition 8.3 (dual SKP).** Given an SKP $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \mathbf{Ord} \to \mathbf{DBiLat}(\mathbf{L})$, its **dual** is the functor
$$\hat{\mathbf{M}} : \mathcal{C} \times \mathbf{Ord}^{\mathrm{op}} \longrightarrow \mathbf{PairedPriSp}_\mathbf{L}$$
where $\mathbf{PairedPriSp}_\mathbf{L}$ denotes the category of paired Priestley spaces over $\mathrm{Spec}(\mathbf{L})$ (Jung–Rivieccio 2012), and the variance reversal on both arguments follows the contravariance of the duality.

**Proposition 8.4 (duality theorem for SKPs).** *The assignment $\mathbf{M} \mapsto \hat{\mathbf{M}}$ extends to a contravariant equivalence of categories*
$$\mathbf{SKP}(\mathbf{L}, \mathcal{C}, E)^{\mathrm{op}} \simeq \widehat{\mathbf{SKP}}(\mathbf{L}, \mathcal{C}, E)$$
*where the right-hand side is the category of "paired-Priestley SKP-duals" — functors $\mathcal{C} \times \mathbf{Ord}^{\mathrm{op}} \to \mathbf{PairedPriSp}_\mathbf{L}$ satisfying the contravariant analogue of cascade monotonicity.*

*Proof sketch.* Apply the Jung–Rivieccio duality fiberwise. Since the duality is a categorical equivalence, and our SKP definition is a functor-category construction, the equivalence lifts to SKPs. Full details are standard and omitted. $\square$

**Interpretation.** The dual $\hat{\mathbf{M}}$ reverses the cascade direction: as the primal SKP accumulates evidence (knowledge rising in $\leq_k$), the dual tightens (filters shrinking in the Priestley dual lattice). This is the "Stone-dual" perspective: knowledge grows is dual to "possibility space shrinks."

### 8.4 Dual representation

Some computations are easier in the Priestley dual. For finite SKPs (finite $E$ and $\mathbf{L} = \mathbf{2}$), the dual is a finite combinatorial object: a family of pairs of finite posets indexed by $\mathcal{C} \times \mathbf{Ord}^{\mathrm{op}}$. Enumeration of prime filters is polynomial in the fiber-algebra size, and queries like "is this assertion implied?" become set-theoretic intersections in the dual.

Computational implementations of SKPs may choose to maintain the primal representation (valuations as $\mathbf{FOUR}$-valued arrays) or the dual (prime-filter sets). The dual has the advantage of efficient boolean-combination queries; the primal has the advantage of efficient update by $\vee_k$-join. A hybrid representation — primal for updates, dual for queries — is natural for applications.

**Remark 8.5.** A full development of SKP duality, including decidability transfer via the dual and the dual formulation of the modal calculus, is outside the scope of this paper. The Jung–Rivieccio duality suffices as a reference point; a downstream paper could develop the full dual theory.

## 9. Dynamics, Convergence, Conservation

This section collects the dynamical content of SKPs: iterated-residuation orbits, the convergence-rate theorem on $\mathbf{FOUR}$, the $\bot$-oscillation analysis, the Nelson identity as a conservation law, the failure of naive contrapositive, and the main CRDT-convergence theorem.

### 9.1 Iterated residuation orbits

Fix $a \in \mathbf{L}^\bowtie$. The map $\mathrm{L}_a : \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie$ defined by $\mathrm{L}_a(x) = a \odot x$ is called **left multiplication by $a$**. Analogously, $\mathrm{R}_a(x) = a \Rightarrow x$ is **left residuation by $a$**. Iterated application gives orbits $(\mathrm{L}_a^n(x))_n$ and $(\mathrm{R}_a^n(x))_n$.

**Proposition 9.1.** *$\mathrm{L}_a$ is monotone in $\leq_t$: $x \leq_t x' \implies a \odot x \leq_t a \odot x'$. $\mathrm{R}_a$ is antitone in its first argument and monotone in its second.*

*Proof.* Follows from Proposition 2.3 (standard residuation identities) applied cellwise. $\square$

### 9.2 Fixed-point convergence rate on $\mathbf{FOUR}$

**Proposition 9.2 (convergence rate).** *On $\mathbf{FOUR}$, for every $a \in \mathbf{FOUR}$ and every starting point $x_0 \in \mathbf{FOUR}$, the orbit $(x_n)$ defined by $x_{n+1} = \mathrm{L}_a(x_n)$ satisfies $x_2 = x_3$. The same holds for $\mathrm{R}_a$.*

*Proof.* Verified by direct enumeration on the $|\mathbf{FOUR}|^2 = 16$ pairs $(a, x_0)$ for each operator. For each pair, compute $x_1, x_2, x_3$ using (4.1) for $\mathrm{L}_a$ or (4.2) for $\mathrm{R}_a$ and confirm $x_2 = x_3$. The verification is a finite case-enumeration; a reference script performing it automatically is straightforward. $\square$

This is a strengthening of the abstract Knaster–Tarski bound for the specific case of $\mathbf{FOUR}$.

### 9.3 $\bot$-alternation oscillation

**Proposition 9.3.** *The alternating iteration $x_{n+1} = \bot \odot x_n$ if $n$ is even, $x_{n+1} = \bot \Rightarrow x_n$ if $n$ is odd, starting from $x_0 = \bot$, produces the period-2 orbit $\bot \to \mathbf{f} \to \bot \to \mathbf{f} \to \cdots$. All other alternating dynamics between $\odot$ and $\Rightarrow$ with a fixed operand $a \neq \bot$ converge.*

*Proof sketch.* Direct computation: $\bot \odot \bot = \mathbf{f}$ (Proposition 4.8(3)); $\bot \Rightarrow \mathbf{f} = (1 \wedge 1, 0 \cdot 1) = (1, 0) = \mathbf{t}$... wait, let me recompute: $\bot = (0, 0)$, $\mathbf{f} = (0, 1)$.
$\bot \Rightarrow \mathbf{f} = ((0 \to 0) \wedge (1 \to 0), 0 \cdot 1) = (1 \wedge 0, 0) = (0, 0) = \bot$.
So we get $\bot \to \mathbf{f} \to \bot \to \mathbf{f} \to \cdots$: period 2. For $a \neq \bot$: case analysis on $a \in \{\mathbf{t}, \mathbf{f}, \top\}$ shows convergence in at most 2 steps. $\square$

The $\bot$-alternation is the only genuinely oscillatory behavior in the finite residuation-orbit dynamics on $\mathbf{FOUR}$. It reflects the degenerate role of $\bot$ (no evidence): pure-no-evidence-conjoined-with-pure-no-evidence produces pure-negative-evidence, which is then incompatible with pure-no-evidence-as-premise, yielding pure-no-evidence-again, and so on.

### 9.4 The Nelson identity

Although naive contrapositive fails on the twist-product residuation (Proposition 4.6), a corrected contrapositive — due to David Nelson — does hold in bilattice-valued residuated structures. Chajda and Länger (2021) discuss this in the context of twist-product residuation.

**Theorem 9.4 (Nelson identity on $\mathbf{FOUR}$).** *For all $x, y \in \mathbf{FOUR}$,*
$$(x \Rightarrow (x \Rightarrow y)) \wedge_k (\sim y \Rightarrow (\sim y \Rightarrow \sim x)) = x \Rightarrow y. \tag{9.1}$$

*Proof.* Direct enumeration on the $|\mathbf{FOUR}|^2 = 16$ pairs $(x, y)$. For each pair, compute both sides of (9.1) using (4.2) and the negation $\sim(a_+, a_-) = (a_-, a_+)$, and confirm equality. $\square$

**Remark 9.4a.** The Nelson identity does not generalize directly to arbitrary integral commutative residuated lattices $\mathbf{L}$. Algebraic expansion of $x \Rightarrow (x \Rightarrow y)$ produces terms of the form $x_+ \cdot x_+$ and $x_+ \to (x_+ \to y_+)$ which equal $x_+$ and $x_+ \to y_+$ only when $\mathbf{L}$ is idempotent (i.e., $x \cdot x = x$ for all $x \in L$). The Boolean lattice $\mathbf{2}$ is idempotent; Łukasiewicz MV-algebras are not. Whether a suitably modified identity holds in non-idempotent $\mathbf{L}^\bowtie$ — and whether the modification has the same conservation-law interpretation — is open.

**Interpretation.** The Nelson identity says: the *iterated* application of implication, together with its contrapositive-with-negation, recovers the original implication. Where naive contrapositive $\sim(x \odot y) = \sim y \Rightarrow \sim x$ fails, the Nelson-corrected version (involving double applications of $\Rightarrow$) holds. This is a conservation law in the dynamical sense: implication is invariant under the joint action of "apply twice" and "negate and swap arguments."

### 9.5 Contrapositive failure

The residuation operations $\odot, \Rightarrow$ do not commute with the bilattice negation $\sim$ on $\mathbf{L}^\bowtie$ in general. The failure of naive contrapositive is a structural property of the pair $(\odot, \sim)$ and is independent of the $\mathcal{C}$-morphism structure; the following records this explicitly.

**Proposition 9.5.** *Neither $\odot$ nor $\Rightarrow$ commutes with $\sim$ or conflation $-$ in general. Specifically, $\sim(a \odot b) \neq \sim a \odot \sim b$ and $\sim(a \Rightarrow b) \neq \sim a \Rightarrow \sim b$ for some $a, b \in \mathbf{FOUR}$.*

*Proof.* Witness computed in Proposition 4.6 (for $\odot$); analogous for $\Rightarrow$. $\square$

The failure of naive contrapositive and the success of Nelson's corrected contrapositive are two sides of the same structural fact: the twist-product residuation has a *non-trivial* interaction with negation, captured exactly by the Nelson identity.

### 9.6 CRDT convergence

We now state the main convergence theorem for distributed SKPs.

**Definition 9.6 (distributed SKP system).** A **distributed SKP system** over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a finite family $\{v^{(i)}\}_{i \in I}$ of SKPs, each evolving independently via its own closure-driven cascade. Replicas exchange state via the **merge operation**: the pointwise $\leq_k$-join of their valuations,
$$(v^{(i)} \vee_k v^{(j)})_\tau(p)(s, o) := v^{(i)}_\tau(p)(s, o) \vee_k v^{(j)}_\tau(p)(s, o).$$

**Proposition 9.7 (semilattice structure of merge).** *$\vee_k$ on SKPs is commutative, associative, and idempotent.*

*Proof.* Pointwise lift of the knowledge-order join being a semilattice operation on $\mathbf{L}^\bowtie$. $\square$

**Theorem 9.8 (SKPs are CRDTs).** *Let $\{v^{(i)}\}_{i \in I}$ be a distributed SKP system with finite $\mathbf{L}, E, \mathcal{C}$. Suppose each replica applies a common closure operator $\mathrm{cl}$ after each merge, and suppose every write on any replica is eventually merged into every other replica. Then all replicas converge to the same limit valuation $v^\infty$, reached in finitely many merge steps. No consensus protocol is required.*

*Proof.* Let $U$ denote the (eventually finite) set of all writes issued anywhere in the system. Each replica's state at local time $\tau$ is the closure of the cellwise $\vee_k$-join of the writes it has received by $\tau$:
$$v^{(i)}_\tau(p)(s, o) = \mathrm{cl}_p\left(\bigvee_k \{ u(s, o) : u \in U, \text{ received by } i \text{ by time } \tau\}\right)(s, o).$$
Once every replica has received every write, this becomes $\mathrm{cl}_p(\bigvee_k U)$ at each cell, which is the same across all replicas. Convergence to this common limit is reached in finitely many steps because $\bigvee_k U$ is finite (writes are finite; the value space $\mathbf{L}^\bowtie$ is finite) and closure is idempotent. No replica needs to negotiate with any other; convergence is guaranteed by the semilattice + monotone-closure structure alone. $\square$

**Corollary 9.9 (CALM theorem applied; Hellerstein–Alvaro 2020).** *SKP-based computation is coordination-free: all queries computable as $\leq_k$-monotone functions of the SKP state can be evaluated without cross-replica coordination.*

*Proof.* Direct instantiation of the CALM theorem (Hellerstein & Alvaro 2020): SKP updates are monotone in $\leq_k$; CALM says monotonicity is equivalent to coordination-freeness. $\square$

**Remark 9.10 (delta-state representation).** Practical distributed SKP implementations ship not full states but *deltas* — the individual writes $u \in U$. By Proposition 9.7, merging deltas is the same as merging full states: the semilattice structure is invariant under the choice of representation. This corresponds to the delta-state CRDTs of Almeida, Shoker, and Baquero (2018), specialized to the SKP setting.

## 10. Computational Content

This section collects the computational aspects of SKPs: decision procedures for the modal calculus (§10.1), enumeration-based verification of algebraic identities (§10.2), and effective representations of SKPs suitable for implementation (§10.3).

### 10.1 Decision procedures

For $\mathbf{L} = \mathbf{2}$ and finite $E, \mathcal{C}$:

- **Fiber-algebra membership:** determining whether $v \in A_p$ is a simple array access, $O(|E|^2)$ in the worst case.
- **Closure application:** applying $\mathrm{cl}_p$ once is $O(|\mathrm{cl}\text{-rules}| \cdot |E|^2)$ in typical logic-programming-style closures; total cascade-convergence cost is bounded by the finite-chain height $O(|\mathbf{FOUR}|^{|E|^2}) = O(4^{|E|^2})$ in the worst case, though the 2-step per-cell bound of Proposition 9.2 gives typically much tighter convergence in practice.
- **Modal satisfaction:** $\Box_R, \Diamond_R$ require aggregating over worlds $W$; cost $O(|W|)$ per cell.
- **Consequence ($\Gamma \models \phi$):** PSPACE for local, EXPTIME for global (Proposition 7.10).

For finite $E$ and $\mathbf{L} = \mathbf{2}$ with a finite cascade, the full SKP can be represented in $O(|\mathcal{C}| \cdot |E|^2 \cdot |\tau^*|)$ bits, where $|\tau^*|$ is the convergence ordinal.

### 10.2 Enumeration-based verification

Because $\mathbf{FOUR}$ has only four elements, algebraic identities in $\mathbf{FOUR}^{\bowtie}$ reduce to finite case-enumerations. Any identity of the form $t(x_1, \ldots, x_n) = s(x_1, \ldots, x_n)$ for terms $t, s$ in the bilattice-residuated language has $|\mathbf{FOUR}|^n = 4^n$ cases. For $n \leq 4$ (most identities of interest), this is at most 256 cases — tractable by hand or automated tool.

Concrete verified identities include: the Nelson identity (Theorem 9.4), contrapositive failure (Proposition 9.5), residuation adjointness (Theorem 4.1 on $\mathbf{FOUR}$), and the algebraic properties of $\odot$ on $\mathbf{FOUR}$ (Proposition 4.8). A short reference script — iterating over the 16 or 64 tuples and computing both sides — suffices to machine-verify each identity.

### 10.3 Effective SKP representation

Given finite $E, \mathcal{C}, |\tau^*| = n$, an SKP can be represented as:

- **Entity set:** finite list / enumeration $[1, \ldots, |E|]$.
- **Predicate category:** object list $[p_1, \ldots, p_{|\mathcal{C}|}]$ plus a generator-morphism list encoding specialization, converse, composition (each with an index map on $E \times E$).
- **Valuations:** a three-dimensional array indexed by $(p, s, o, \tau) \in \mathcal{C} \times E \times E \times [n]$, each cell holding a value in $\mathbf{FOUR}$ (2 bits per cell).
- **Closure operator:** a list of rewrite rules of the form "if $v(p_1, s, o) = a_1$ and $\cdots$ and $v(p_k, s, o) = a_k$ then $v(p', s, o) \geq_k b$" or analogous for non-local rules.

Total space: $O(|\mathcal{C}| \cdot |E|^2 \cdot n)$ for the valuation array; polynomial overhead for the category and closure data.

**Distributed implementation.** The CRDT merge (Definition 9.6) is implemented as a cellwise $\vee_k$-update on the two-bit representation:
$$(a_+, a_-) \vee_k (b_+, b_-) = (a_+ \vee b_+, a_- \vee b_-)$$
— two bitwise ORs per cell, per merge. This is the simplest possible CRDT update, with $O(1)$ per-cell cost and $O(|\mathcal{C}| \cdot |E|^2)$ per full-state merge.

### 10.4 Reference implementation

A complete reference implementation — left as future work — would provide:

1. Data structures for entities, predicates, fiber algebras.
2. Closure-operator compilation from rewrite-rule specifications.
3. Cascade execution with fixed-point detection.
4. Merge and delta-state representation.
5. Query evaluation for modal satisfaction.

The space is small — $< 1000$ lines in a modern language — and the correctness proofs reduce to the theorems of this paper.

**Remark 10.1.** For $\mathbf{L}$ other than $\mathbf{2}$ (for example $\mathbf{L} = [0, 1]$ with MV-structure), the values are continuous and the finite-enumeration arguments of §10.2 don't directly apply. The representation theorems of §2 still hold, but numerical stability and termination become application-specific concerns. We note the continuous case as worth future treatment but do not develop it here.

## 11. Examples

This section presents five worked SKPs of increasing structural richness. Each example specifies: the spatial base $(E, \mathcal{C})$, the closure operator (if any), the cascade sequence of valuations, and the final quiescent state. All values are in $\mathbf{FOUR}$ (i.e., $\mathbf{L} = \mathbf{2}$) unless stated otherwise; we write $(a_+, a_-)$ for twist-product elements when the four-symbol notation would be cumbersome.

### 11.1 The trivial SKP

**Data.** $E = \{a\}$, $\Pi = \{p\}$, $\mathcal{C}$ discrete (no non-identity morphisms).

**Cascade.** $\tau = 0$: $v(a, p, a; 0) = \mathbf{t}$. No increments or closures afterward.

**Quiescent state.** $v_\tau(p)(a, a) = \mathbf{t}$ for all $\tau < \lambda$.

**Role.** Establishes that Definition 3.1 is non-vacuous. The trivial SKP is the smallest instance; any simpler would require $|E| = 0$.

### 11.2 Relational-database SKP

**Data.** $E = \{\text{Alice}, \text{Bob}, \text{Carol}\}$, $\Pi = \{\text{Likes}\}$, $\mathcal{C}$ discrete.

**Support.** Full: $\mathrm{Fib}(\text{Likes}) = E \times E = 9$ cells.

**Cascade.** $\tau = 0$ (initial declarations from a single source):

| Cell | Value | Meaning |
|---|---|---|
| (Alice, Bob) | $\mathbf{t}$ | declared positive |
| (Bob, Alice) | $\mathbf{f}$ | declared negative |
| (Alice, Carol) | $\top$ | two sources disagree |
| all other cells | $\bot$ | no declaration |

No closure rules; no further cascade steps.

**Quiescent state.** $v_\tau(\text{Likes})$ for all $\tau$ is as above.

**Observation.** All four epistemic states of $\mathbf{FOUR}$ occur. Classical logic cannot represent the $\top$-cell; two-valued logic cannot represent the $\bot$-cells. Only the bilattice-valued representation captures all four cases natively.

**Role.** Shows the "four epistemic states in action" in the simplest relational setting. Direct bilattice generalization of a classical RDF triple store.

### 11.3 Knowledge-graph SKP with specialization

**Data.** $E = \{\text{Spot}, \text{Dog}, \text{Mammal}\}$, $\Pi = \{\text{isA}, \text{isMammal}\}$. $\mathcal{C}$ has a specialization morphism $\text{isMammal} \preceq \text{isA}$ (every $\text{isMammal}$-assertion is an $\text{isA}$-assertion restricted to the "mammal" class).

**Closure.** Encoding the TBox axiom "Dog isA Mammal": if $v(x, \text{isA}, \text{Dog}; \tau) = \mathbf{t}$, then $v(x, \text{isA}, \text{Mammal}; \tau+1) \geq_k \mathbf{t}$.

**Cascade.**
- $\tau = 0$: $v(\text{Spot}, \text{isA}, \text{Dog}; 0) = \mathbf{t}$; all other cells $\bot$.
- $\tau = 1$ (closure fires): $v(\text{Spot}, \text{isA}, \text{Mammal}; 1) = \mathbf{t}$ (derived). Existing cells unchanged.
- $\tau \geq 1$: quiescent.

**Quiescent state.** $v(\text{Spot}, \text{isA}, \text{Dog}) = v(\text{Spot}, \text{isA}, \text{Mammal}) = \mathbf{t}$; all else $\bot$.

**Role.** Smallest example exhibiting a non-trivial closure operator. Shows how a cascade step can populate $\bot$-cells with derived evidence. Analogous to RDFS inference over a small class hierarchy.

### 11.4 Multi-agent epistemic SKP (Belnap's motivation revisited)

**Data.** $E = \{\text{Paris}, \text{CapitalOfFrance}\}$, $\Pi = \{\text{isSameAs}\}$.

**Setup.** Three agents $A_1, A_2, A_3$ each make an assertion about the truth-value of $(\text{Paris}, \text{isSameAs}, \text{CapitalOfFrance})$. The SKP cascade steps correspond to each agent's report arriving.

**Cascade.**
- $\tau = 0$: $v = \bot$ (no reports).
- $\tau = 1$ ($A_1$: "yes"): $v(\text{Paris}, \text{isSameAs}, \text{CapitalOfFrance}; 1) = \bot \vee_k \mathbf{t} = \mathbf{t}$.
- $\tau = 2$ ($A_2$: "yes"): $v = \mathbf{t} \vee_k \mathbf{t} = \mathbf{t}$. No change.
- $\tau = 3$ ($A_3$: "no"): $v = \mathbf{t} \vee_k \mathbf{f} = \top$ (positive evidence from $A_1, A_2$; negative evidence from $A_3$).

**Quiescent state.** $v(\text{Paris}, \text{isSameAs}, \text{CapitalOfFrance}) = \top$.

**Role.** Recovers Belnap's (1977) original motivation for four-valued logic: a community with disagreeing sources aggregates via $\vee_k$; the result correctly indicates "the community is inconsistent on this claim" via $\top$ — rather than trivializing (as classical logic would) or silently dropping one source's input.

**Remark 11.1.** This example is also a small distributed-SKP system (§9.6): each agent is a replica; the cascade steps correspond to merges arriving at a central coordinator (or, equivalently, to a gossip protocol reaching a common state). By Theorem 9.8, the order of agent-report arrivals does not affect the final state.

### 11.5 Worked cascade with specialization and closure

**Data.** $E = \{\text{p}_1, \text{p}_2, \text{a}\}$, $\Pi = \{\text{parent}, \text{adultParent}\}$. $\mathcal{C}$ has specialization $\text{adultParent} \preceq \text{parent}$.

**Closure.** The axiom "adultParent(x, y) implies parent(x, y)" is encoded:
$$v(x, \text{adultParent}, y; \tau) = \mathbf{t} \implies v(x, \text{parent}, y; \tau+1) \geq_k \mathbf{t}.$$
Plus: no cross-predicate negative propagation (we don't force $\mathbf{f}$ through specialization).

**Cascade.**
- $\tau = 0$: $v(\text{p}_1, \text{adultParent}, \text{a}; 0) = \mathbf{t}$; all other $v$-cells $\bot$.
- $\tau = 1$ (closure): $v(\text{p}_1, \text{parent}, \text{a}; 1) = \mathbf{t}$ (derived from the axiom). adultParent cells unchanged.
- $\tau \geq 1$: quiescent.

**Fiber-algebra check.** At $\tau = 1$:
- $A_{\text{adultParent}} = \mathbf{FOUR}^{9}$ with only one non-$\bot$ cell: $(p_1, a) \mapsto \mathbf{t}$.
- $A_{\text{parent}} = \mathbf{FOUR}^{9}$ with the same one non-$\bot$ cell: $(p_1, a) \mapsto \mathbf{t}$.
- The specialization morphism $f^* : A_{\text{parent}} \to A_{\text{adultParent}}$ restricts the parent valuation; post-cascade, $f^*$ sends the parent cell $(p_1, a) \mapsto \mathbf{t}$ to the adultParent cell $(p_1, a) \mapsto \mathbf{t}$ — consistent, as required by the fiber functor (Theorem 3.6) acting on specialization.

**Role.** End-to-end demonstration of the SKP formalism: spatial base (entities), predicate category (with non-trivial morphism), fiber algebras, cascade-with-closure, quiescence. Any more complex example in applications (knowledge graphs, description logics, multi-agent systems) is obtained by scaling up these primitives.

**Remark 11.2 (from example to application).** The five examples here are deliberately minimal, designed to exhibit the primitives. Real applications — a bilattice-valued OWL ontology, a distributed knowledge-graph store, a multi-party belief-revision system — compose these primitives at much larger scale. The theorems of §§4–9 guarantee that the resulting SKP is well-defined, that its cascade converges, and that distributed replicas converge without consensus. Downstream algebraic works (§12.6) can take these theorems as given and build additional structure on top.

## 12. Discussion

This section situates SKPs in the broader landscape of categorical logic, linear-logic models, distributed-systems theory, and knowledge representation (§§12.1–12.4), identifies open problems (§12.5), and sketches the downstream algebraic constructions that SKPs are designed to enable (§12.6).

### 12.1 Relation to hyperdoctrines

Lawvere (1969, 1970) introduced the hyperdoctrine as the adjoint-theoretic skeleton of first-order logic: a functor $P : \mathcal{B}^{\mathrm{op}} \to \mathbf{Cat}$ (or into a specified algebraic category) with each substitution $f^* : P(Y) \to P(X)$ having left and right adjoints $\exists_f \dashv f^* \dashv \forall_f$. Seely (1983) systematized the apparatus, connecting it to natural deduction. Maruyama (2021) extends the framework to substructural logics, including four-valued settings.

An SKP is essentially a bilattice-valued hyperdoctrine over $\mathcal{C}$ parametrized additionally by a cascade ordinal. The fiber functor $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is the non-temporal "spatial slice" of the SKP; the cascade axis adds a temporal direction on top of the hyperdoctrinal structure.

**Proposition 12.1 (hyperdoctrinal adjoints on specialization).** *For a specialization morphism $f : q \to p$ in $\mathcal{C}$ with support inclusion $\iota_f : \mathrm{Fib}(q) \hookrightarrow \mathrm{Fib}(p)$, the induced fiber map $f^* : A_p \to A_q$ has both $\leq_k$-adjoints in $A_p$:*

- $\exists_f : A_q \to A_p$ — **extension by $\bot$**:
$$(\exists_f w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{Fib}(q) \\ \bot & (s, o) \notin \mathrm{Fib}(q) \end{cases}$$

- $\forall_f : A_q \to A_p$ — **extension by $\top$**:
$$(\forall_f w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{Fib}(q) \\ \top & (s, o) \notin \mathrm{Fib}(q). \end{cases}$$

*They satisfy $\exists_f w \leq_k v \iff w \leq_k f^* v$ and $v \leq_k \forall_f w \iff f^* v \leq_k w$, giving the hyperdoctrinal chain $\exists_f \dashv f^* \dashv \forall_f$.*

*Proof.* Both claims are pointwise. For $\exists_f w \leq_k v$ to hold, we need $(\exists_f w)(s, o) \leq_k v(s, o)$ for every cell: on $\mathrm{Fib}(q)$ this is $w(s, o) \leq_k v(s, o)$; off $\mathrm{Fib}(q)$ it is $\bot \leq_k v(s, o)$ which always holds. So $\exists_f w \leq_k v$ iff $w \leq_k f^*v$ (restriction to $\mathrm{Fib}(q)$). Dually for $\forall_f$: $v \leq_k \forall_f w$ requires $v(s, o) \leq_k w(s, o)$ on $\mathrm{Fib}(q)$ and $v(s, o) \leq_k \top$ off, the latter always holding. So $v \leq_k \forall_f w$ iff $f^*v \leq_k w$. $\square$

So SKPs inherit Lawvere's $\exists \dashv f^* \dashv \forall$ adjunction pattern, in the bilattice-valued setting. This makes SKPs a natural habitat for first-order bilattice logic, with the residuated $\odot \dashv \Rightarrow$ pair (§4) providing the propositional-connective adjunctions and the hyperdoctrinal $\exists, \forall$ providing the quantifier adjunctions.

**Remark 12.2.** The converse generators of $\mathcal{C}$ act as self-inverse auto-equivalences at the fiber-algebra level: $(p^c)^c = p$, and the induced $f^*$ is its own inverse. They commute with the hyperdoctrinal $\exists_f \dashv f^* \dashv \forall_f$ pattern in the sense that converse intertwines $\exists$ and $\forall$ along the swapped index. The composition generators are the cartesian products of the hyperdoctrine and are compatible with both adjoint patterns.

### 12.2 Relation to linear-logic models

Via Jakl's (2025) identification (§2.3, §4.5), SKPs inherit a linear-logical reading: each fiber algebra, restricted to its consistent sub-algebra, is a model of classical multiplicative linear logic via the Chu construction. The full twist-product extends the model to the inconsistent region.

This places SKPs in the tradition of *concrete models of linear logic* — alongside coherence spaces (Girard), games (Abramsky, Blass), phase spaces, and so on. The specific contribution of SKPs over these models is the spatial-and-temporal indexing structure: a linear-logic model per $(p, \tau)$, compatibly organized.

### 12.3 Relation to CRDTs and CALM

§9.6 established that SKPs form a CRDT class in the sense of Shapiro et al. (2011), and §12.1 connected them to CALM (Hellerstein & Alvaro 2020). This situates SKPs in the distributed-systems literature as a *structurally enriched* CRDT: more algebraic than a plain semilattice, but retaining the same convergence guarantees. Related lattice-theoretic distributed-programming models — Kuper & Newton's LVars (2013, 2014) and Conway et al.'s Bloom^L (2012) — are instances of the same monotonicity principle applied at the language level; SKPs provide the corresponding bilattice-valued model-theoretic substrate.

**Downstream implication.** Any distributed system whose state can be modeled as an SKP inherits eventual consistency without coordination. This includes distributed knowledge-graph stores, multi-agent belief systems, and decentralized reasoning systems where inference rules (the closure operator) can be applied locally without cross-replica synchronization.

### 12.4 Relation to description logics, RDF, and FCA

- **RDF (Hayes & Patel-Schneider 2014).** An RDF graph is a two-valued SKP: triples are either present or absent, positive only. The SKP generalization to bilattice values lets us handle negative assertions, conflicts, and partial information natively — addressing the well-known limitations of RDF's monotone, positive-only semantics.
- **Description logics (Baader et al. 2003).** Classical DLs are two-valued. Paraconsistent DLs (Ma & Hitzler 2009; Zhang et al. 2009) extend DL semantics to $\mathbf{FOUR}$, but without developing the structural theory of the KB as an object. SKPs provide exactly that structural theory.
- **Formal Concept Analysis (Ganter & Wille 1999).** A formal context $(G, M, I)$ with $I \subseteq G \times M$ is a Chu space over $\mathbf{Set}$; the resulting concept lattice is the lattice of Galois-closed subsets. FCA is the Boolean-valued case; an SKP-based "bilattice-valued FCA" would generalize to handle inconsistencies in formal contexts.

### 12.5 Open problems

1. **Exhaustiveness of generators.** Proposition 6.14 states exhaustiveness under the naturality hypothesis, with a proof sketch. A complete proof, or a counterexample exhibiting a non-trivial natural morphism outside the generator span, is an open question.
2. **Continuous-$\mathbf{L}$ SKPs.** For $\mathbf{L} = [0, 1]$ (MV-algebra) or other continuous residuated lattices, the convergence and decidability theorems need revisitation. Which extend, which fail, and what replaces them?
3. **Higher-order SKPs.** The SKP definition is first-order (unary fibers over binary relations). A higher-order generalization — predicates of arbitrary arity, or predicates over predicates — is a natural extension.
4. **Computational complexity refinement.** §10.1's PSPACE / EXPTIME bounds are inherited from classical bimodal logic. Tighter bounds specific to the bilattice structure would improve applicability.
5. **Probabilistic SKPs.** Replacing the bilattice with a probability lattice (e.g., an interval-valued lattice) gives a probabilistic-SKP candidate. The relationship to imprecise-probability frameworks (Dempster–Shafer, credal sets) is worth development.

### 12.6 Downstream constructions

The paper's title calls SKPs a "foundation for adjudicated predication." We list what this foundation enables — constructions that can be built on top of SKPs without re-proving the groundwork:

1. **Bilattice-valued OWL / description logics.** With SKPs as the underlying KB object, a paraconsistent OWL semantics reduces to: choose $\mathcal{C}$ = the RBox, choose the closure operator = TBox inference, evaluate ABox queries on the post-cascade SKP. The semantic soundness follows from Theorems 5.4 and 7.8.
2. **Distributed bilattice-valued reasoning.** Theorem 9.8 guarantees that any SKP-based reasoner replicated across a distributed system converges without consensus. This enables a distributed knowledge-graph backend with CRDT-style semantics at the semantic-web level, not just the storage level.
3. **Conservation-law reasoning.** The Nelson identity (Theorem 9.4) is a conservation law in the algebraic sense: certain iterated applications of implication and negation are invariant. Downstream work could develop a "conservation-law calculus" for SKPs, analogous to invariants in classical physics.
4. **Categorical-logic extensions.** §12.1 positioned SKPs as hyperdoctrines; Maruyama-style (2021) first-order substructural-logic extensions are directly applicable. An SKP-native first-order logic with $\exists, \forall$ and the $\odot \dashv \Rightarrow$ propositional connectives is a natural development.
5. **Dual representations.** §8 introduced Priestley duality for SKPs. A dual-representation computational theory, in which SKPs are represented by their paired-Priestley-space duals rather than by valuations, is a future development.
6. **Typed / sorted SKPs.** Restricting entity sets to be typed (a family $E = (E_s)_{s \in S}$ over sorts $S$) is a straightforward extension. Doing so links SKPs to typed categorical logic and to the sorted-DL literature.
7. **Monoidal enrichment.** An SKP valued in a more enriched category — say, an abelian category rather than a bilattice — would generalize the framework further. This might bring connections to sheaf cohomology and derived categories.

These are not claims of novelty; they are *uses* the SKP foundation is designed to support. The paper's contribution is to make such constructions cite-able: a downstream author defining, say, "distributed bilattice OWL," can write "Let $\mathbf{M}$ be an SKP as in Definition 3.1 of [this paper]" and immediately have access to the adjoint, modal, duality, and CRDT-convergence theorems without reproving them.

## References

Almeida, P. S., Shoker, A., & Baquero, C. (2018). Delta state replicated data types. *Journal of Parallel and Distributed Computing*, 111, 162–173.

Arieli, O., & Avron, A. (1996). Reasoning with logical bilattices. *Journal of Logic, Language and Information*, 5(1), 25–63.

Arieli, O., & Avron, A. (1998). The value of the four values. *Artificial Intelligence*, 102(1), 97–141.

Avron, A. (1996). The structure of interlaced bilattices. *Mathematical Structures in Computer Science*, 6(3), 287–299.

Baader, F., Calvanese, D., McGuinness, D. L., Nardi, D., & Patel-Schneider, P. F. (Eds.). (2003). *The Description Logic Handbook: Theory, Implementation, and Applications*. Cambridge University Press.

Barr, M. (1979). *\*-Autonomous Categories* (with an appendix by Po-Hsiang Chu). Lecture Notes in Mathematics, Vol. 752. Springer-Verlag.

Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn & G. Epstein (Eds.), *Modern Uses of Multiple-Valued Logic* (pp. 5–37). Reidel.

Blackburn, P., de Rijke, M., & Venema, Y. (2001). *Modal Logic*. Cambridge Tracts in Theoretical Computer Science, Vol. 53. Cambridge University Press.

Bou, F., & Rivieccio, U. (2011). The logic of distributive bilattices. *Logic Journal of the IGPL*, 19(1), 183–216.

Busaniche, M., & Cignoli, R. (2014). The subvariety of commutative residuated lattices represented by twist-products. *Algebra Universalis*, 71, 5–22.

Chajda, I., & Länger, H. (2021). Adjoint operations in twist-products of lattices. *Symmetry*, 13(2), Article 253. arXiv:2101.00677.

Conway, N., Marczak, W. R., Alvaro, P., Hellerstein, J. M., & Maier, D. (2012). Logic and lattices for distributed programming. *Proc. of the Third ACM Symposium on Cloud Computing (SoCC '12)*, Article 1.

Fitting, M. (1991). Bilattices and the semantics of logic programming. *Journal of Logic Programming*, 11(2), 91–116.

Fitting, M. (2006). Bilattices are nice things. In T. Bolander, V. Hendricks, & S. A. Pedersen (Eds.), *Self-Reference* (pp. 53–77). CSLI Publications. [Manuscript dated December 2002.]

Galatos, N., Jipsen, P., Kowalski, T., & Ono, H. (2007). *Residuated Lattices: An Algebraic Glimpse at Substructural Logics*. Studies in Logic and the Foundations of Mathematics, Vol. 151. Elsevier.

Ganter, B., & Wille, R. (1999). *Formal Concept Analysis: Mathematical Foundations*. Springer.

Ginsberg, M. L. (1988). Multivalued logics: A uniform approach to inference in artificial intelligence. *Computational Intelligence*, 4(3), 265–316.

Halpern, J. Y., & Moses, Y. (1992). A guide to completeness and complexity for modal logics of knowledge and belief. *Artificial Intelligence*, 54(3), 319–379.

Hayes, P., & Patel-Schneider, P. F. (2014). *RDF 1.1 Semantics*. W3C Recommendation. https://www.w3.org/TR/rdf11-mt/

Hellerstein, J. M., & Alvaro, P. (2020). Keeping CALM: When distributed consistency is easy. *Communications of the ACM*, 63(9), 72–81.

Jacobs, B. (1999). *Categorical Logic and Type Theory*. Studies in Logic and the Foundations of Mathematics, Vol. 141. Elsevier.

Jakl, T. (2025). Four imprints of Belnap's useful four-valued logic in computer science. arXiv:2503.20679.

Jung, A., & Rivieccio, U. (2012). Priestley duality for bilattices. *Studia Logica*, 100(1–2), 223–252.

Kalman, J. A. (1958). Lattices with involution. *Transactions of the American Mathematical Society*, 87(2), 485–491.

Kuper, L., & Newton, R. R. (2013). LVars: Lattice-based data structures for deterministic parallelism. *Proc. of the 2nd ACM SIGPLAN Workshop on Functional High-Performance Computing (FHPC '13)*, 71–84.

Kuper, L., Turon, A., Krishnaswami, N. R., & Newton, R. R. (2014). Freeze after writing: Quasi-deterministic parallel programming with LVars. *Proc. of POPL '14*, 257–270.

Lambek, J. (1958). The mathematics of sentence structure. *American Mathematical Monthly*, 65(3), 154–170.

Lambek, J. (1961). On the calculus of syntactic types. In *Structure of Language and its Mathematical Aspects* (pp. 166–178). Proceedings of Symposia in Applied Mathematics, Vol. 12. American Mathematical Society.

Lawvere, F. W. (1969). Adjointness in foundations. *Dialectica*, 23(3–4), 281–296.

Lawvere, F. W. (1970). Equality in hyperdoctrines and comprehension schema as an adjoint functor. In *Applications of Categorical Algebra*, Proceedings of Symposia in Pure Mathematics, Vol. 17, 1–14. American Mathematical Society.

Ma, Y., & Hitzler, P. (2009). Paraconsistent reasoning for OWL 2. In *Proc. of the Third International Conference on Web Reasoning and Rule Systems (RR 2009)*. LNCS, Vol. 5837. Springer.

Mac Lane, S. (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics, Vol. 5. Springer-Verlag.

Maruyama, Y. (2021). Fibred algebraic semantics for a variety of non-classical first-order logics and topological logical translation. *Journal of Symbolic Logic*, 86(3), 1189–1213.

Mobasher, B., Pigozzi, D., Slutzki, G., & Voutsadakis, G. (2000). A duality theory for bilattices. *Algebra Universalis*, 43, 109–125.

Pratt, V. (1995). The Stone gamut: A coordinatization of mathematics. In *Proc. of the Tenth Annual IEEE Symposium on Logic in Computer Science (LICS '95)*, 444–454.

Priestley, H. A. (1970). Representation of distributive lattices by means of ordered Stone spaces. *Bulletin of the London Mathematical Society*, 2, 186–190.

Priestley, H. A. (1972). Ordered topological spaces and the representation of distributive lattices. *Proceedings of the London Mathematical Society*, 24, 507–530.

Rivieccio, U. (2010). *An Algebraic Study of Bilattice-based Logics*. PhD thesis, University of Barcelona / University of Genoa. arXiv:1010.2552.

Rivieccio, U., Jung, A., & Jansana, R. (2017). Four-valued modal logic: Kripke semantics and duality. *Journal of Logic and Computation*, 27(1), 155–199.

Seely, R. A. G. (1983). Hyperdoctrines, natural deduction and the Beck condition. *Zeitschrift für mathematische Logik und Grundlagen der Mathematik*, 29(6), 505–542.

Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M. (2011). Conflict-free replicated data types. In X. Défago, F. Petit, & V. Villain (Eds.), *Stabilization, Safety, and Security of Distributed Systems (SSS 2011)*. LNCS, Vol. 6976, 386–400. Springer.

Tsinakis, C., & Wille, A. M. (2006). Minimal varieties of involutive residuated lattices. *Studia Logica*, 83, 407–423.

Xiao, H., Huang, M., & Zhu, X. (2016). From one point to a manifold: Knowledge graph embedding for precise link prediction. In *Proc. of the 25th International Joint Conference on Artificial Intelligence (IJCAI 2016)*, 1315–1321. [arXiv:1512.04792, 2015.]

Zhang, X., Lin, Z., & Wang, K. (2009). Paraconsistent reasoning with OWL. In *Proc. of the 8th International Semantic Web Conference (ISWC 2009)*. LNCS, Vol. 5823. Springer.
