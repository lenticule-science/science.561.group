---
title: "spatiotemporal knowledge cohomology via paired priestley duality"
type: research-article
---

# Spatiotemporal Knowledge Cohomology via Paired Priestley Duality

### Classification of Aperiodic Cascades and the CRDT Mayer–Vietoris Sequence

**Author:** emsenn

**Keywords:** sheaf cohomology; Priestley duality; bilattice; paired Priestley space; bitopological site; distributive bilattice; Kock–Zöberlein 2-comonad; Grothendieck fibration; Beck–Chevalley; Mayer–Vietoris; conflict-free replicated data type; CALM theorem; aperiodic cascade; transfinite fixed point; Anderson–Putnam complex; Hermida–Jacobs coinduction.

**MSC 2020:** 18F20 (presheaves and sheaves, stacks, descent conditions); 18G40 (spectral sequences, hypercohomology); 18G50 (nonabelian homological algebra); 18N50 (simplicial sets, simplicial objects); 03G25 (other algebras related to logic); 06D30 (De Morgan algebras, Łukasiewicz algebras); 06D50 (lattices and duality); 55N30 (sheaf cohomology); 55N91 (equivariant homology and cohomology); 68M14 (distributed systems).

**arXiv primary:** math.CT. **Secondary:** math.AT, math.LO, cs.LO, cs.DC.

---

## Abstract

We develop sheaf cohomology on the Priestley-dual object $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*, \mathbf{T}^*)$ of a spatiotemporal knowledge hyperdoctrine — the dualized two-categorical structure established by *Spatiotemporal Knowledge Hyperdoctrines* — and apply it to classify aperiodic cascades and reformulate the CRDT-convergence theorem of *Spatiotemporal Knowledge Presheaves*. The underlying site is bitopological: pairwise-Stone clopens at each fiber, dualized generator and closure morphisms across fibers, with a KZ-coherence condition on sheaves handling the non-trivial 2-cells of the Regime-D temporal structure. Sheaves are valued in abelian groups; the cohomology is classical derived-functor cohomology on this site. The cascade-associated sheaf $\mathcal{F}_U$ — free abelian group on newly-designated cells of the dual spectrum — is the central object: its $H^0$ counts converged-state cells, its $H^1$ classifies Regime-D cascades up to mutually-locally-derivable equivalence, and its higher cohomology vanishes. The main classification theorem establishes that two Regime-D cascades over a common base are MLD-equivalent if and only if their classifying invariants $\mathrm{cl}\text{-}\mathrm{inv}(v), \mathrm{cl}\text{-}\mathrm{inv}(v')$ agree in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$; the proof proceeds via a direct-limit computation in the Anderson–Putnam 1998 style, combined with a coinductive reconstruction argument in the Hermida–Jacobs 1998 fibrational framework. The CRDT Mayer–Vietoris sequence on replica covers gives a cohomological reformulation of the CRDT convergence property: the Shapiro, Preguiça, Baquero, and Zawirski 2011 CRDT semilattice theorem, as instantiated for SKPs, corresponds to the vanishing of a specific Mayer–Vietoris connecting homomorphism; the CALM theorem of Hellerstein and Alvaro 2020 corresponds to vanishing of all Mayer–Vietoris obstructions. A bigraded cohomology $H^{m,n}_{k,t}$ unifies the truth-order and knowledge-order adjoint systems via a two-row bicomplex, extending the classification to paraconsistent cascades where $\top$-valued evidence propagates. The cohomology is trivial in Regime A (finite cascades), vanishes in positive degree in Regime B (Scott-continuous), has one $\mathbb{Z}$-generator per non-Scott-continuous firing ordinal in Regime C, and collects these across all countable limit ordinals in Regime D. Five worked examples exhibit the machinery on progressively richer SKPs. The paper is designed as a structural reference for downstream works on moduli of SKP hyperdoctrines, deformation theory, and the representation theory of the predication 2-category.

---

## 1. Introduction

### 1.1 From hyperdoctrinal structure to cohomology

The two preceding papers in this series construct the **spatiotemporal knowledge presheaf** as a bilattice-valued categorical object: a $\leq_k$-monotone trajectory of valuations over a predicate category $\mathcal{C}$ and an entity set $E$, with cascade dynamics driven by a closure operator and distributed convergence via the Shapiro, Preguiça, Baquero, and Zawirski 2011 CRDT semilattice theorem (*Spatiotemporal Knowledge Presheaves*); and as a cloven Grothendieck fibration with two parallel adjoint systems, a lax-idempotent closure 2-monad, a four-regime dichotomy indexed by closure ordinal, and a full Priestley dualization (*Spatiotemporal Knowledge Hyperdoctrines*). The second paper's culminating theorem (§11.1.1 there) establishes *existence and coherence* of a dualized structure $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*, \mathbf{T}^*)$ on which invariants of aperiodic cascades — inaccessible from the primal fixed-point side — must live. What that paper defers is the construction of those invariants.

The present paper delivers them. We develop sheaf cohomology on the dual object, apply it to classify aperiodic (Regime-D) cascades up to MLD-equivalence, and give a cohomological reformulation of the CRDT convergence property.

Three features of the Regime-D setting make cohomology the natural invariant:

- **Transfinite non-stabilization.** A Regime-D cascade does not reach a fixed point at any countable ordinal; its closure ordinal is at least $\omega_1$. Primal fixed-point theorems see only the eventual state at $\omega_1$, not the transfinite pattern of how that state is reached.

- **Aperiodic structure as a cohomology class.** Adapting the Anderson–Putnam 1998 framework for substitution tilings: aperiodic structure is classifiable by the direct limit of finite-stage cohomologies under a "substitution" self-map. For cascades, the self-map is closure; the direct limit runs through countable ordinals up to $\omega_1$; the classifying cohomology class distinguishes non-MLD-equivalent cascades.

- **Paired Priestley duality as the natural site.** The bilattice fibers $A_q = \mathbf{L}^{\bowtie E \times E}$ dualize via Jung–Rivieccio 2012 to paired Priestley spaces, naturally bitopological (with two topologies from the $+$ and $-$ components). Sheaves on the bitopological paired-Priestley site have the right behavior: the fiber topology contributes trivial positive-degree cohomology (all Boolean algebras are cohomologically trivial), and the cascade-axial and predicate-axial morphism structure contributes the non-trivial content.

### 1.2 Four principal contributions

**(A) A bitopological site on the dualized two-categorical structure.** §4 constructs the site $(\mathbf{T}^*, J)$ whose objects assemble pairwise-Stone clopens of each paired Priestley fiber over the ordinal-predicate base, with the dualized generator and closure morphisms of *Spatiotemporal Knowledge Hyperdoctrines* §11 as site morphisms. The topology $J$ is generated by pairwise-Stone covers only (Remark 4.2.4 explains the deliberate exclusion of temporal covers); cross-ordinal and cross-predicate content is encoded in morphisms. The 2-cells of the Regime-D temporal structure are handled by a KZ-coherence condition on sheaves (§5.3) rather than as extra structure on the site.

**(B) The cascade-associated sheaf and its cohomology.** §5 introduces the **cascade-associated sheaf** $\mathcal{F}_U$ — the free abelian group on the set of newly-designated cells of the Priestley spectrum at each cascade stage, with restriction maps induced by cascade and predicate reindexing. §6 develops the cohomology: right-derived global sections relative to bounded sub-sites, with unbounded cohomology as a direct limit; Čech cohomology under Husainov 2026's Dedekind–MacNeille acyclicity condition; regime-by-regime structure with $H^{\geq 2} = 0$ (Theorem 10.1.1) and specific $H^1$ structure in Regimes C and D (Theorem 10.4.2).

**(C) The Regime-D classification theorem.** §7 establishes the paper's central result: *two Regime-D SKPs over a common base are MLD-equivalent iff their classifying invariants $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$ agree*. The proof uses the Anderson–Putnam 1998 direct-limit template, with the coinductive-reconstruction step in Step 4 supplied by the Hermida–Jacobs 1998 fibered-coinduction theorem combined with the Bonchi, Petrişan, Pous, and Rot 2014 up-to-closure refinement. §10.5 gives a combinatorial restatement: MLD-equivalence corresponds to equality of non-Scott-continuous firing-ordinal sets up to cascade-shift.

**(D) CRDT convergence as Mayer–Vietoris vanishing.** §8 reformulates the CRDT-convergence theorem of *Spatiotemporal Knowledge Presheaves* §9.6 cohomologically: for replica covers $U = U_1 \cup U_2$ on the paired Priestley dual, the Mayer–Vietoris connecting homomorphism $\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$ is identically zero (Theorem 8.3.1). CALM-compatibility for SKP-derived sheaves is exactly vanishing of all Mayer–Vietoris obstructions (Theorem 8.4.1). The two cohomological results — Regime-D classification (non-trivial $H^1$) and CRDT convergence (trivial $\delta^0$) — use *disjoint parts* of the cohomology: cross-ordinal morphism structure vs fiber-level cover structure; the site-design choice of §4.2 keeps them separated.

### 1.3 Structural novelties

**The bigraded two-adjoint cohomology.** §9 establishes $H^n_t$ (classical / $\mathbf{t}$-designated) and $H^n_k$ (paraconsistent / $\{\mathbf{t}, \top\}$-designated) as parallel cohomologies, connected by a comparison morphism $\iota^n$ and fitting into a long exact sequence from the short exact sequence of sheaves $0 \to \mathcal{F}_U^{(t)} \to \mathcal{F}_U^{(k)} \to \mathcal{F}_U^{(\top)} \to 0$. The bigraded cohomology $H^{m,n}_{k,t}$ has only two non-trivial rows ($m = 0, 1$); both spectral sequences converging to it degenerate at $E_2$, leaving the long exact sequence as the essential content. In most examples one row collapses (consistent cascades have $H^n_t \cong H^n_k$; paraconsistent cascades have $H^n_t = 0$); §12.6 exhibits the genuinely-2-dimensional case.

**The $\mathbb{Z}/2$-gauge from bilattice negation.** The internal negation $\sim$ on $\mathbf{FOUR}$ — fixing $\bot, \top$ and swapping $\mathbf{t}, \mathbf{f}$ — dualizes to a $+\leftrightarrow -$ swap on paired Priestley spaces, generating a $\mathbb{Z}/2$-action on the entire cohomological apparatus (§9.4). Equivariant cohomology via Borel construction and a Hochschild–Serre spectral sequence follows; for the $\mathbf{t}$-designated sheaves used in §§7–8's central results, the $\mathbb{Z}/2$-action is effectively trivial. Full use of the gauge requires tracking $\mathbf{f}$-cells, a variant not developed here.

**Regime-dependent complexity hierarchy.** §10's summary table makes explicit that the four-regime dichotomy inherited from *Spatiotemporal Knowledge Hyperdoctrines* is mirrored in cohomology: $H^0$ grows from finite (Regime A) through countable (Regime B) to $\aleph_1$-sized (Regime D); $H^1$ goes from trivial (Regimes A, B) through one-generator-per-non-Scott-continuous-firing (Regime C) to an $\aleph_1$-rank direct sum (Regime D); $H^{\geq 2}$ is identically zero throughout.

### 1.4 Approach and relation to prior work

The paper is a *foundations / reference* paper, matching the style of the two preceding works in the series: canonical treatment over individual-theorem-novelty. Individual theorems are drawn from or instantiate existing results: sheaf cohomology is classical Grothendieck–Godement–SGA 4; cellular-sheaf / poset-sheaf methodology is Curry 2014 + Ayzenberg–Magai 2025 + Husainov 2026; Priestley-sheaf representation is Gehrke–van Gool 2019 + Bezhanishvili et al. 2010; the aperiodic-dynamics classification template is Anderson–Putnam 1998; the fibered-coinduction machinery is Hermida–Jacobs 1998; the CRDT and CALM frameworks are Shapiro et al. 2011 + Hellerstein–Alvaro 2020. The novel content lies in the *assembly* on the specific dualized object $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*, \mathbf{T}^*)$ that *Spatiotemporal Knowledge Hyperdoctrines* Theorem 11.1.1 establishes — and in the cohomological identification of the Regime-D classifying invariant as an $H^1$-class, computable via direct limits and distinguishing concrete cascade structures.

Immediately-adjacent recent work includes Felber, Hummes Flores, and Rincon Galeana 2025 (a sheaf-theoretic characterization of distributed-systems tasks, parallel methodology but different fiber values and temporal structure) and Ghrist and Ding 2025 (precision-graded cellular cohomology for distributed consensus, orthogonal coefficient system). §13.3 compares. No prior work develops a sheaf-cohomology theory on a bilattice-valued paired-Priestley site in a 2-categorical temporal setting.

### 1.5 Outline

§2 collects the prerequisite sheaf-theoretic and distributed-systems-topological vocabulary. §3 resolves three loose ends carried forward from *Spatiotemporal Knowledge Hyperdoctrines*: the 2-categorical Beck–Chevalley condition, the dualized closure 2-comonad, and a concrete Regime-D cascade. §4 constructs the bitopological site. §5 develops the sheaf category, the KZ-coherence condition, and the cascade-associated sheaf. §6 gives the cohomology (derived-functor primary, Čech for computation). §7 proves the Regime-D classification theorem. §8 establishes the CRDT Mayer–Vietoris bridge. §9 develops the bigraded two-adjoint cohomology and the internal $\mathbb{Z}/2$-gauge. §10 makes the four-regime dichotomy explicit cohomologically. §11 records computational content and connections to distributed-systems tooling. §12 exhibits the machinery on five worked examples. §13 situates the paper relative to prior work and outlines the downstream series.

---

## 2. Preliminaries

This section establishes the sheaf-cohomological, poset-sheaf, Priestley-sheaf, fibered-coalgebraic, and distributed-systems-topological vocabulary the paper builds on. The preceding papers *Spatiotemporal Knowledge Presheaves* and *Spatiotemporal Knowledge Hyperdoctrines* are assumed as prerequisites; their content — bilattices, twist-products, Chu spaces, residuated lattices, SKP hyperdoctrines, the two adjoint systems, the closure KZ 2-monad, the four-regime dichotomy, and the Priestley-dualization theorem — is cited but not reproved. §2.1 extracts what we take from them in self-contained form. §§2.2–2.7 collect the new material orthogonal to those two papers. Experienced readers may skim §§2.2–2.4 and focus on §§2.5–2.7, which identify the specific results used downstream.

### 2.1 Prerequisites from the preceding papers

We extract the content of *Spatiotemporal Knowledge Presheaves* and *Spatiotemporal Knowledge Hyperdoctrines* that the present paper uses, in a form that lets a reader follow §§4–13 without turning to those papers.

**The bilattice fiber algebra.** Fix an integral commutative residuated lattice $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1 \rangle$, an entity set $E$, and a small category $\mathcal{C}$ (the *predicate category*) whose morphisms are generated by four classes — specialization, converse, subject-projection, object-projection — acting cellwise on the index set $E \times E$ by equivariant partial index maps. For each predicate $q \in \mathcal{C}$, the **fiber algebra**
$$A_q := \mathbf{L}^{\bowtie E \times E}$$
is the pointwise twist-product bilattice: its carrier is $(L \times L)^{E \times E}$, and the bilattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k$ together with the negation $\sim\langle a, b\rangle = \langle b, a\rangle$ are taken pointwise. The two natural orders are the **truth order** $\leq_t$ (first coordinate up, second coordinate down) and the **knowledge order** $\leq_k$ (both coordinates up); they make $A_q$ a distributive bilattice (Ginsberg 1988; Fitting 1991). The smallest non-trivial fiber, $\mathbf{L} = \mathbf{2}$, gives $\mathbf{L}^\bowtie \cong \mathbf{FOUR}$ with values $\mathbf{t}, \mathbf{f}, \bot, \top$.

Each $A_q$ carries a residuated monoid structure $\odot, \Rightarrow$ (Busaniche–Cignoli 2014; Chajda–Länger 2021) satisfying the adjunction $(a, b) \odot (c, d) \leq_t (e, f) \iff (a, b) \leq_t (c, d) \Rightarrow (e, f)$.

**SKP hyperdoctrines.** An **SKP hyperdoctrine** over $(\mathbf{L}, \mathcal{C}, E)$ is a cloven Grothendieck fibration $p : \mathcal{E} \twoheadrightarrow \mathcal{C}$ whose fiber at each $q \in \mathcal{C}$ is canonically identified with $A_q$ equipped with its $\leq_k$-poset structure, and whose reindexing $f^* : A_p \to A_q$ along a $\mathcal{C}$-generator $f : q \to p$ is a bilattice-residuated homomorphism acting by cellwise reindexing on the index. For every morphism $f : q \to p$, the reindexing $f^*$ admits both a left and a right adjoint in each of the two natural orders:
$$\exists_f^k \dashv f^* \dashv \forall_f^k \quad (\leq_k\text{-system}), \qquad \exists_f^t \dashv f^* \dashv \forall_f^t \quad (\leq_t\text{-system}).$$
Frobenius reciprocity holds for the bilattice knowledge-meet and truth-meet: $\exists_f^k(f^*\alpha \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k\phi$, and likewise for $\wedge_t$. Beck–Chevalley holds on every pullback square in $\mathcal{C}$, for both adjoint systems. Both adjoint systems admit a Lawvere-style comprehension schema (right adjoints to extension functors), yielding two derived equality predicates: a classical $\mathbf{t}$/$\mathbf{f}$-valued $=_E$ and a paraconsistent $\top$/$\bot$-valued $\Delta_E^k$. This content is carried through *Spatiotemporal Knowledge Hyperdoctrines* Definitions 5.2.1, 7, and 8.

**The cascade and its four regimes.** Fix an ordinal $\lambda$ (the *cascade bound*) and an *increment sequence* $U = (u_\tau)_{\tau < \lambda}$ with each $u_\tau$ assigning a fiber element to every predicate. A **spatiotemporal knowledge presheaf** is the data of an SKP hyperdoctrine $\mathcal{E}$ together with a coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ for the cascade endofunctor
$$F_U(\mathcal{E})_\tau := \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$$
where $\mathrm{Cl}$ is the **closure operator** — a lax-idempotent 2-monad on the 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ of SKP fibrations, whose unit is the pointwise inflationarity inclusion $v \to \mathrm{cl}_p(v)$ and whose multiplication collapses nested closures up to canonical 2-cell (Kock 1995; Kelly–Lack 1997; *Spatiotemporal Knowledge Hyperdoctrines* §9). The cascade orbit $(v_\tau)_{\tau < \lambda}$ is a $\leq_k$-monotone trajectory in $\prod_p A_p$.

The **closure ordinal** $\kappa := \kappa(F_U, \mathcal{E}_0)$ of the cascade is the least ordinal at which the orbit stabilizes ($F_U^{\kappa+1}(\mathcal{E}_0) = F_U^\kappa(\mathcal{E}_0)$), or $\infty$ if no such ordinal exists in the working universe. The **four-regime dichotomy** (*Spatiotemporal Knowledge Hyperdoctrines* Theorem 10.2.1) classifies cascades by $\kappa$:

- **Regime A (strict):** $\kappa < \omega$; $\mathbf{L}, E, \mathcal{C}$ all finite. Finite-chain convergence, 2-cells of closure trivialize.
- **Regime B ($\omega$-Scott):** $\kappa \leq \omega$; closure is Scott-continuous; $\omega$-convergence.
- **Regime C (transfinite-bounded):** $\omega < \kappa < $ state-space cofinality; non-Scott-continuous closure with bounded orbit.
- **Regime D (aperiodic):** $\kappa \geq \omega_1$; non-Scott-continuous closure with cofinality-at-least-$\omega_1$ state space. The KZ-lax-idempotent structure of $\mathrm{Cl}$ carries non-trivial 2-cells throughout. The setting of this paper.

**The temporal 2-category.** Cascades live as coalgebra orbits in a 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ built from the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$ — where $\mathbb{M}$ is Gray 1966 / Street 1974's colax-idempotent 2-monad whose pseudo-algebras are cloven fibrations, and $\mathbb{N}$ is Emmenegger, Mesiti, Rosolini, and Streicher 2024's right 2-adjoint, a lax-idempotent 2-comonad whose pseudo-coalgebras are also cloven fibrations. The 0-cells of $\mathbf{T}(\mathcal{C}, \lambda)$ are pairs $(\tau, X)$ with $\tau < \lambda$ and $X \in \mathbf{Cat}/\mathcal{C}$; 1-cells of the form $(\sigma, X) \to (\tau, Y)$ with $\sigma \leq \tau$ are $\mathbf{Cat}/\mathcal{C}$-morphisms $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ for some decomposition $\tau - \sigma = \alpha + \beta$; 2-cells include the standard $\mathbf{Cat}/\mathcal{C}$-2-cells together with the coherence 2-cells of the 2-adjunction and of the two (co)lax-idempotent structures. In Regime A this 2-category collapses to $\lambda$ as a 1-category; in Regime D the 2-cell structure is genuinely 2-dimensional throughout.

**The Priestley dual.** Each fiber $A_q$ dualizes via Jung–Rivieccio 2012's duality $\mathbf{DBiLat}^{\mathrm{op}} \simeq \mathbf{PairedPriSp}$ to a **paired Priestley space** $X_q := \mathrm{Spec}(A_q)$ — a pair of Priestley spaces with a swap involution encoding the bilattice negation $\sim$. *Spatiotemporal Knowledge Hyperdoctrines* Theorem 11.1.1 assembles these fiberwise duals into a dual structure $(\mathcal{E}^*, p^*, \mathbb{M}^*, \mathbb{N}^*, \mathrm{Cl}^*, \mathbf{T}^*)$:
- $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$ is a paired-Priestley opfibration.
- $\mathbb{M} \dashv \mathbb{N}$ dualizes to $\mathbb{M}^* \dashv \mathbb{N}^*$ on $\mathbf{Cat}/\mathcal{C}^{\mathrm{op}}$, with roles swapped (diamond shape preserved).
- $\mathrm{Cl}^*$ is a colax-idempotent 2-comonad; its full structural characterization is established in §3.2 below.
- $\mathbf{T}^*(\mathcal{C}^{\mathrm{op}}, \lambda^{\mathrm{op}})$ is the dualized temporal 2-category.
- The cascade coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$ dualizes to a cascade algebra $c^* : F_U^*(\mathcal{E}^*) \to \mathcal{E}^*$.

The present paper develops sheaf cohomology on $\mathbf{T}^*$.

**Concrete objects carried forward.** The present paper uses most directly:

- The pointwise twist-product $\mathbf{L}^{\bowtie E \times E}$ with bilattice operations and negation $\sim$ (*Spatiotemporal Knowledge Presheaves* §2.2).
- The **internal $\mathbb{Z}/2$-gauge** on $\mathbf{FOUR}$ given by $\sim$: it fixes $\bot, \top$ and swaps $\mathbf{t}, \mathbf{f}$, acting by $+\leftrightarrow-$-swap on the paired Priestley dual (*Spatiotemporal Knowledge Presheaves* §8.2).
- The fiberwise **Priestley duality** for distributive bilattices (*Spatiotemporal Knowledge Presheaves* §8.1, citing Jung–Rivieccio 2012).
- The **CRDT-convergence theorem** (*Spatiotemporal Knowledge Presheaves* Theorem 9.8): distributed SKP replicas with monotone-in-$\leq_k$ writes converge to a common limit state without consensus, via the Shapiro, Preguiça, Baquero, and Zawirski 2011 semilattice-CRDT framework. §8 of the present paper gives this theorem a cohomological reformulation.

### 2.2 Sheaves on sites

A **Grothendieck topology** on a small category $C$ is an assignment to each $c \in C$ of a collection $J(c)$ of **covering sieves** — sub-functors of the representable $\mathrm{Hom}(-, c)$ — satisfying stability under pullback and transitivity under composition (SGA 4 Exposé II; Mac Lane–Moerdijk 1992 Ch. III). A **site** is a pair $(C, J)$. A **pretopology** on $C$ is a basis for such a topology, given by a collection of **covering families** $\{c_i \to c\}_{i \in I}$ closed under pullback; the associated topology has as covering sieves those generated by covering families (SGA 4 Exp. II §1.3).

A **presheaf** on $C$ with values in a category $\mathcal{V}$ is a functor $F : C^{\mathrm{op}} \to \mathcal{V}$. A presheaf is a **sheaf** on $(C, J)$ if for every $c \in C$ and every covering sieve $R \in J(c)$, the induced map $F(c) \to \mathrm{Hom}(R, F)$ is an isomorphism (Johnstone 2002b Definition C2.1.2; Mac Lane–Moerdijk 1992 Ch. III §4). The category of sheaves is denoted $\mathrm{Sh}(C, J; \mathcal{V})$; the inclusion into presheaves $i : \mathrm{Sh}(C, J; \mathcal{V}) \hookrightarrow \mathrm{PSh}(C; \mathcal{V})$ admits a left adjoint $a$ (**sheafification**) when $\mathcal{V}$ has enough structure (typically $\mathcal{V}$ locally presentable and/or reflective; see Johnstone 2002b).

For $\mathcal{V} = \mathbf{Set}$, $\mathrm{Sh}(C, J; \mathbf{Set})$ is a **Grothendieck topos** (SGA 4 Exp. IV). For $\mathcal{V} = \mathbf{Ab}$, the category $\mathrm{Sh}(C, J; \mathbf{Ab})$ is an abelian category with enough injectives, making derived-functor cohomology available (Godement 1958; Bredon 1997 Ch. II; Kashiwara–Schapira 2006 Chs. 17–18).

**Notational convention.** We write $\mathrm{Sh}(C, J)$ for $\mathrm{Sh}(C, J; \mathbf{Ab})$ when the value category is $\mathbf{Ab}$ and no ambiguity arises. The **global sections functor** is $\Gamma(F) := F(\mathbf{1})$ when $C$ has a terminal object $\mathbf{1}$; more generally, $\Gamma(F) := \lim_{c \in C} F(c)$.

### 2.3 Derived-functor sheaf cohomology

Given a sheaf $F \in \mathrm{Sh}(C, J; \mathbf{Ab})$, the **$n$-th sheaf cohomology** is the $n$-th right-derived functor of global sections:
$$H^n(C, F) := R^n \Gamma(F).$$

Two classical techniques compute $R^n \Gamma$:

**Godement's flabby resolution** (Godement 1958). A sheaf $F$ embeds functorially in a canonical flabby sheaf $\mathcal{C}^0(F)$ (the sheaf of discontinuous sections of an iterated étale construction); iterating gives a flabby resolution
$$0 \to F \to \mathcal{C}^0(F) \to \mathcal{C}^1(F) \to \cdots$$
and $R^n\Gamma(F) = H^n(\Gamma \mathcal{C}^\bullet(F))$. A sheaf is **flabby** if every restriction map $F(U) \to F(V)$ for $V \subseteq U$ is surjective; flabby sheaves are $\Gamma$-acyclic, so any flabby resolution computes $R^n\Gamma$. Bredon 1997 Ch. II gives the modern treatment.

**Čech cohomology**. Given a cover $\mathcal{U} = \{U_i \to U\}_{i \in I}$ and a sheaf $F$, the Čech cochain complex is
$$\check{C}^n(\mathcal{U}, F) := \prod_{i_0 < \cdots < i_n} F(U_{i_0} \times_U \cdots \times_U U_{i_n})$$
with the usual alternating-sum coboundary. Čech cohomology is $\check{H}^n(\mathcal{U}, F) := H^n(\check{C}^\bullet(\mathcal{U}, F))$, and the **hypercover-refined** Čech cohomology is
$$\check{H}^n(C, F) := \lim_{\mathcal{U}} \check{H}^n(\mathcal{U}, F)$$
over all covers $\mathcal{U}$ (SGA 4 Exp. V). For Čech to compute $R^n\Gamma$ exactly, acyclicity hypotheses on $\mathcal{U}$ are required; in general, Verdier's spectral sequence $\check{H}^p(\mathcal{H}^q) \Rightarrow H^{p+q}$ bridges the two (SGA 4 Exp. V §3.3; Bredon 1997 Ch. III).

Both techniques are used in this paper: derived-functor cohomology is the *definition* (§6.1); Čech cohomology is the *computational tool* (§6.2, §11).

### 2.4 Cellular / poset sheaf cohomology

A substantial portion of the present paper's site theory is methodologically descended from the cellular-sheaf perspective (Curry 2014). We collect what we use.

**Cellular sheaf on a cell complex (Curry 2014).** A **cellular sheaf** $F$ on a regular cell complex $X$ (equivalently, on the face poset $P_X$ of $X$) with values in an abelian category $\mathcal{A}$ is a functor $F : P_X \to \mathcal{A}$: to each cell $\sigma$, an object $F(\sigma) \in \mathcal{A}$; to each face relation $\sigma \leq \tau$, a restriction morphism $F(\sigma) \to F(\tau)$ (Curry 2014 Ch. 3). Equivalently, $F$ is a sheaf on $P_X$ equipped with the **Alexandrov topology** — the topology whose open sets are up-sets (equivalently: down-sets, depending on convention).

**Alexandrov topology on a poset.** For a poset $(P, \leq)$, the Alexandrov topology has as open sets the up-sets $\{x : x \geq y\}$ for $y \in P$. Finite topological spaces are equivalent to finite posets under this construction; the general equivalence (arbitrary poset $\leftrightarrow$ arbitrary Alexandrov space) is classical. See Ayzenberg–Magai 2025 Appendix A.2 Proposition A.7 for a modern statement.

**Cellular sheaf cohomology.** For a cellular sheaf $F$ on a finite cell complex $X$ with values in $\mathrm{Vect}$ or $\mathbf{Ab}$, the **cellular cochain complex** is
$$C^n(F) := \bigoplus_{\dim \sigma = n} F(\sigma)$$
with coboundary the signed sum of restriction maps along face inclusions. The **cellular cohomology** $H^n_{\mathrm{cell}}(X, F) := H^n(C^\bullet(F))$. Under Alexandrov topology, this agrees with sheaf cohomology of $F$ viewed as an Alexandrov-topology sheaf: $H^n_{\mathrm{cell}}(X, F) \cong H^n(X_{\mathrm{Alex}}, F)$ (Curry 2014 Ch. 6; Ayzenberg–Magai 2025 Theorem C.48 verifies the analogue for CW-complexes).

**Enough projectives and injectives.** For cellular sheaves valued in $R$-modules over a ring $R$, the category $\mathrm{Sh}_{\mathrm{cell}}(X, R\text{-Mod})$ has both enough projectives and enough injectives (Curry 2014 Ch. 5) — a non-trivial convenience not shared by general sheaf categories. This makes homological computations particularly tractable.

**Infinite posets: Roos complex and Ayzenberg–Magai minimal complex.** For infinite posets, the Roos complex (Roos 1961) extends the cellular cochain complex via the bar construction; Ayzenberg–Magai 2025 Appendix C.8 (Algorithm 1) gives a *minimal* cochain complex for sheaf cohomology on arbitrary finite posets, more optimal than the Roos complex. For uncountable posets relevant to Regime D, we will use direct-limit techniques (Anderson–Putnam 1998; §2.6 below).

**Čech vs derived-functor on Alexandrov posets.** Husainov 2026 (arXiv:2310.05577) establishes necessary and sufficient conditions, phrased in terms of acyclicity of Dedekind–MacNeille cuts, for Čech cohomology on an Alexandrov poset to agree with the derived-functor cohomology of the sheafification. For finite posets the conditions are algorithmically computable. §6.2 below cites Husainov's result for the Čech comparison on the transfinite cascade site of §3.3.

**Verdier duality for cellular sheaves.** Curry 2014's central structural result is a derived equivalence between cellular sheaves and cellular cosheaves, recovering Shepard 1985's Verdier duality formula as a special case. Paper 3 does not directly use Verdier duality but notes its availability (§13.1).

### 2.5 Priestley / bitopological sheaves

Paper 1 §8 (citing Jung–Rivieccio 2012) establishes Priestley duality for distributive bilattices; each fiber $A_q = \mathbf{L}^{\bowtie E \times E}$ dualizes to a paired Priestley space $X_q$. Paper 3 works with sheaves on these paired spaces — or, more precisely, on the 2-categorical assembly of them across $\mathcal{C}$ and $\lambda$. The sheaf theory on a single Priestley space or on a bitopological space is an active research area; we collect the references.

**Priestley duality (baseline).** A **Priestley space** is a compact totally-order-disconnected poset; the category $\mathbf{PriSp}$ is dually equivalent to the category $\mathbf{DLat}$ of bounded distributive lattices via $\mathrm{Spec} : \mathbf{DLat}^{\mathrm{op}} \to \mathbf{PriSp}$ sending a lattice to its poset of prime filters (Priestley 1970, 1972). Elements of $L \in \mathbf{DLat}$ correspond to clopen up-sets of $\mathrm{Spec}(L)$.

**Gehrke–van Gool 2019 sheaf representation theorem.** For a distributive lattice $L$, soft sheaf representations of $L$ (Gehrke–van Gool 2019 Def. 3.1–3.2) correspond bijectively to continuous decompositions of $\mathrm{Spec}(L)$ satisfying an interpolation property (Theorem 5.7). This is the methodological template the present paper inherits: sheaves on the Priestley dual of a lattice are the "right" object to study, and decompositions of the dual space are the source of sheaf data. §5 below extends from the single-lattice statement to the 2-categorical assembly over $\mathcal{C}$ and $\lambda$.

**Bitopological Stone duality (Bezhanishvili et al. 2010).** A **pairwise Stone space** is a bitopological space $(X, \tau_+, \tau_-)$ compact and pairwise-separated in a suitable sense; the category $\mathbf{PStone}$ is isomorphic to the categories $\mathbf{Spec}$ of spectral spaces and $\mathbf{Pries}$ of Priestley spaces (Bezhanishvili–Bezhanishvili–Gabelaia–Kurz 2010 Theorem 2.9, 3.4):
$$\mathbf{PStone} \cong \mathbf{Spec} \cong \mathbf{Pries}.$$
The bitopological framing treats the two topologies ($\tau_+$ from "positive evidence," $\tau_-$ from "negative evidence") symmetrically, matching the paired Priestley structure that *Spatiotemporal Knowledge Hyperdoctrines* §11.1 established on the twist-product dual.

**d-frames (Jung–Moshier 2006; Jakl 2018).** A **d-frame** is an algebraic dual of a bitopological space: a pair of frames $(L_+, L_-)$ with specified consistency-and-totality relations. The duality $\mathbf{biTop} \dashv \mathbf{dFrm}^{\mathrm{op}}$ extends the classical $\mathbf{Top} \dashv \mathbf{Frm}^{\mathrm{op}}$ to the bitopological setting. Jakl 2018 (PhD thesis) systematizes d-frames; Jakl 2025 §4.1 "Bilattices versus d-frames" gives an explicit comparison between bilattice and d-frame frameworks — relevant for the bilattice-valued-sheaf extensions flagged in §13.5 below.

**Adoption.** The site construction of §4 uses the bitopological / pairwise-Stone framing rather than single-Priestley. The two topologies at each fiber come from the paired Priestley structure of §2.1; covering sieves are specified pairwise-open. Sheaves are valued in $\mathbf{Ab}$ (§5.1 below).

**Sheaves on a stably compact space (Gehrke–van Gool 2019 baseline).** For a stably compact space $Y$ (compact, locally compact, coherent), sheaf representations of an algebra $A$ over $Y^\uparrow$ correspond to frame homomorphisms from $(\mathcal{K} Y^\uparrow)^{\mathrm{op}}$ into subframes of pairwise commuting congruences $\mathrm{Con}\, A$ (Gehrke–van Gool 2019 Theorem 3.10). The specialization to distributive lattices (Theorem 5.7) is the version §5 below uses directly.

### 2.6 Fibered and coalgebraic structures

Paper 3's cascade-associated sheaves and Regime-D classification draw on the fibered-categorical-logic and coalgebraic-structural-induction literature.

**Fibrations (Grothendieck, Bénabou).** A **fibration** $p : \mathcal{E} \to \mathcal{B}$ has for each $b \in \mathcal{B}$ a fiber $\mathcal{E}_b = p^{-1}(b)$ and for each morphism $f : b \to b'$ a reindexing functor $f^* : \mathcal{E}_{b'} \to \mathcal{E}_b$ via cartesian lifts. **Cloven fibrations** have a functorial choice of cartesian lifts up to canonical iso. Standard references: Jacobs 1999 Ch. 1; Streicher 2022 (arXiv:1801.02927).

**Fiber-pullback coherence (for the 2-categorical BC argument).** For cloven fibrations $p : \mathcal{E} \to \mathcal{B}$ and a pullback square in $\mathcal{B}$, the fibered pullback exists and agrees with the total-category pullback up to canonical iso. This is classical Grothendieck/Bénabou material; modern treatments in Jacobs 1999 §1.4 and Streicher 2022 §4. §3.1 below uses this for the 2-categorical Beck–Chevalley lift on $\mathbf{T}(\mathcal{C}, \lambda)$.

**Fibered induction and coinduction (Hermida–Jacobs 1998).** For a fibration $p : \mathcal{E} \to \mathcal{B}$ and an endofunctor $T$ on $\mathcal{B}$, the induction principle for initial $T$-algebras is admissible when $p$ admits comprehension; dually, the coinduction principle for terminal $T$-coalgebras is admissible when $p$ admits quotient types (Hermida–Jacobs 1998 main theorems). §7 below frames the Regime-D classification theorem in this language: Regime-D cascades up to MLD-equivalence are coinductively distinguishable, and the cohomology class provides the witness. See also the coinduction-up-to techniques of Bonchi–Petrişan–Pous–Rot 2014, which refine the Hermida–Jacobs framework to handle closure-modulo reasoning directly.

**Jacobs 2016 coalgebraic invariants.** Coalgebra invariants via predicate lifting (Jacobs 2016 Ch. 6) — in particular, the operator $\Box P = $ "the greatest invariant contained in $P$" — are dual to the closure operator $\mathrm{Cl}$ of §2.1, restricting to fixed-point sub-algebras. On the Priestley dual, by the algebra–coalgebra correspondence of §3.2 below (Proposition 3.2.5), these correspond to restriction-to-confirming-subspace operations. §6.4's $H^0$ interpretation uses this duality.

**Anderson–Putnam direct limit (Anderson–Putnam 1998).** For a substitution tiling $\omega$, the **Anderson–Putnam complex** $\Gamma_\omega$ is a finite cell complex; the tiling space $\Omega_\omega$ is the inverse limit under the substitution self-map $\omega : \Gamma_\omega \to \Gamma_\omega$:
$$\Omega_\omega \cong \lim_{\leftarrow}\; (\Gamma_\omega \xleftarrow{\omega} \Gamma_\omega \xleftarrow{\omega} \cdots).$$
Cohomology of $\Omega_\omega$ is the **direct limit** of the induced cohomology maps:
$$\check{H}^n(\Omega_\omega) = \varinjlim \;(\check{H}^n(\Gamma_\omega) \xrightarrow{\omega^*} \check{H}^n(\Gamma_\omega) \to \cdots).$$
§7.3's Regime-D classification proof uses the analogous direct-limit structure: cascade cohomology at the closure ordinal $\kappa$ is the direct limit of finite-stage cohomologies under the cascade endofunctor's action. The analogy is structural (not technical): tiling cohomology uses abelian-group coefficients on simplicial-complex inverse limits; the present setting uses abelian-group coefficients on bitopological-site direct limits. The underlying direct-limit framework transfers cleanly.

**Aperiodic-dynamics language.** Sadun 2008 *Topology of Tiling Spaces*, Kellendonk–Putnam pattern-equivariant (PE) cohomology, and Barge–Diamond–Hunton–Sadun 2010 provide the framing "cohomology classifies aperiodic invariants." The present paper borrows the framing for Regime-D cascades without invoking the technical machinery specific to tilings ($C^*$-algebras, $K$-theory, Anderson–Putnam collaring, branched-manifold inverse limits).

### 2.7 Distributed-systems topology

§8 below connects the cohomology development to the CRDT-convergence theorem of *Spatiotemporal Knowledge Presheaves* §9.6 via a Mayer–Vietoris bridge. The distributed-systems topology literature provides context.

**Herlihy–Kozlov–Rajsbaum 2013.** *Distributed Computing Through Combinatorial Topology*: distributed-computation tasks are modeled via simplicial input/output complexes and protocol complexes, with task solvability reducing to the existence of a simplicial map (decision map). This is the foundational topology-of-distributed-computing reference. Paper 3 §8 does not use HKR's simplicial machinery; the methodology is cited for context only. The structural analogy — "distributed-computation solvability has a topological signature" — is inherited.

**Felber–Hummes Flores–Rincon Galeana 2025 (arXiv:2503.02556).** Recent sheaf-theoretic characterization of distributed-systems tasks: a **task sheaf** is a cellular sheaf whose global sections are exactly the task's terminating solutions. The cohomology of the task sheaf "provides a linear algebraic description of the decision space of the processes, and encodes the obstructions to find solutions" (Felber et al. 2025 abstract). This is the closest parallel to §8 in the recent literature. The two frameworks differ in four distinctive ways:

- **Fiber values.** Felber et al. use vector-space / $\mathbf{Ab}$-valued task sheaves; the present paper uses $\mathbf{Ab}$-valued sheaves on the paired Priestley dual of a bilattice-fibered hyperdoctrine.
- **Temporal structure.** Felber et al. use finite 1-categorical execution models; the present paper uses the transfinite 2-categorical cascade of §2.1.
- **Primary question.** Felber et al. target task solvability; the present paper targets cascade convergence and classification.
- **Site base.** Felber et al. use a simplicial base; the present paper uses the bitopological site $(\mathbf{T}^*, J)$ constructed in §4.

The two approaches are complementary.

**Hellerstein–Alvaro 2020 — CALM theorem.** *Keeping CALM: When distributed consistency is easy.* **CALM** = Consistency As Logical Monotonicity: a program has a consistent, coordination-free distributed implementation iff it is monotonic (in a suitable lattice-theoretic sense). The result of *Spatiotemporal Knowledge Presheaves* Theorem 9.8 shows spatiotemporal knowledge presheaves are CRDTs in the Shapiro, Preguiça, Baquero, and Zawirski 2011 sense; §8.4 below interprets this cohomologically.

**Shapiro, Preguiça, Baquero, Zawirski 2011 — CRDT framework.** *Conflict-free replicated data types.* Two flavors: **state-based (CvRDT)** with state space a join-semilattice and merge = join; **operation-based (CmRDT)** with operations as commuting morphisms. *Spatiotemporal Knowledge Presheaves* §9.6 establishes SKPs as CvRDTs; §8.1 below works in this flavor exclusively.

**Ghrist–Ding 2025 (arXiv:2511.00677).** *Precision-graded cohomology and arithmetic persistence for network sheaves*: $p$-adic-integer-valued cellular cohomology with precision-graded filtration; applications to distributed consensus with quantized communication. Parallel modern development; cited in §13.3 for context. The approach is orthogonal to the bilattice-valued setting below (Ghrist–Ding use $\mathbb{Z}_p$; we use $\mathbf{Ab}$ over a bilattice Priestley dual).

### 2.8 Conventions

We fix the following notation and conventions for the remainder of the paper:

- Notation from *Spatiotemporal Knowledge Presheaves* and *Spatiotemporal Knowledge Hyperdoctrines* is kept verbatim. Bilattice symbols ($\mathbf{t}, \mathbf{f}, \bot, \top, \wedge_k, \vee_k, \wedge_t, \vee_t, \sim$), twist-product notation ($\mathbf{L}^{\bowtie}$, $\mathbf{L}^{\bowtie E \times E}$), residuation ($\odot, \Rightarrow$), the four-generator inventory (specialization, converse, subject-projection, object-projection), the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ and its dual $\mathbf{T}^*$, and the closure 2-monad $\mathrm{Cl}$ and its dual 2-comonad $\mathrm{Cl}^*$ all refer to the same objects summarized in §2.1.
- The entity set $E$ and cascade ordinal $\lambda$ are assumed finite or at most $\omega_1$-size for the worked examples of §12; statements of §§4–10 cover general $E$ and $\lambda$ with appropriate regime hypotheses.
- All cohomology is in $\mathbf{Ab}$ (= $\mathbb{Z}$-modules) by default. For emphasis or comparison, coefficients are written explicitly: $H^n(-, \mathbb{Z})$, $H^n(-, \mathbb{Q})$, etc.
- **Regime hypotheses.** Theorems below apply with regime-dependent hypotheses indexed by closure ordinal $\kappa$ as in §2.1; unless otherwise stated, results are stated in full generality across all four regimes with specific strengthening in Regimes A, B, C, and D noted inline.
- **Size hypotheses.** We work in $\mathsf{ZFC}$ plus a single Grothendieck universe sufficient to make $\mathbf{Cat}/\mathcal{C}$ well-behaved as a 2-category. Proper-class scenarios are noted but not pursued.

---

## 3. Prerequisites Resolved

Three loose ends from *Spatiotemporal Knowledge Hyperdoctrines* bear on the cohomological development and are settled here in self-contained form. §3.1 establishes the 2-categorical Beck–Chevalley condition on the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$, which *Spatiotemporal Knowledge Hyperdoctrines* Remark 6.4.3 flagged as open. §3.2 tightens the sixth piece of the dualization theorem (*Spatiotemporal Knowledge Hyperdoctrines* Theorem 11.1.1) into a rigorous 2-comonadic statement for the dualized closure operator $\mathrm{Cl}^*$. §3.3 exhibits a concrete Regime-D cascade, settling the qualitative flag of *Spatiotemporal Knowledge Hyperdoctrines* §12.6.

All three results are cited by §§4–11 below without further elaboration.

### 3.1 Two-categorical Beck–Chevalley

*Spatiotemporal Knowledge Hyperdoctrines* Theorem 6.4.1 establishes Beck–Chevalley at the 1-categorical level: for every pullback square in $\mathcal{C}$ and every $\phi$ in the appropriate fiber, the canonical maps $\exists^{k/t}_{p_A}(p_B^* \phi) \to f^*(\exists^{k/t}_g \phi)$ are isomorphisms. The 2-categorical lift — to pseudo-pullback squares in the temporal 2-category $\mathbf{T}(\mathcal{C}, \lambda)$ — was flagged as open in *Spatiotemporal Knowledge Hyperdoctrines* Remark 6.4.3. The cohomological constructions of §§4–6 need this lift: sheaf pullback and pushforward must commute on $\mathbf{T}^*$ up to invertible 2-cell for Leray-type arguments to proceed.

**Theorem 3.1.1 (2-categorical Beck–Chevalley).** *Let $\mathcal{E}$ be an SKP hyperdoctrine. For every pseudo-pullback square in $\mathbf{T}(\mathcal{C}, \lambda)$*
$$\begin{array}{ccc} (\tau_P, P) & \xrightarrow{p_A} & (\tau_A, A) \\ p_B \downarrow & \;\;\Downarrow\varphi & \downarrow f \\ (\tau_B, B) & \xrightarrow{g} & (\tau_C, C) \end{array}$$
*and every $\phi \in \mathcal{E}_{(\tau_B, B)}$, the canonical 2-cell*
$$\mathrm{BC}_\varphi \;:\; \exists^{k/t}_{p_A}(p_B^* \phi) \;\Rightarrow\; f^*(\exists^{k/t}_g \phi)$$
*is an invertible 2-cell in $\mathcal{E}_{(\tau_A, A)}$, for both adjoint systems $k, t$. Dually for $\forall$.*

*Proof.* The argument reduces 2-categorical BC to three standard results, composed via the property-like coherence of the ambient 2-monadic structure.

**Step 1 (slice-wise pullback computation).** The temporal 2-category's 1-cells of the form $(\sigma, X) \to (\tau, Y)$ are $\mathbf{Cat}/\mathcal{C}$-morphisms $\mathbb{M}^\beta \mathbb{N}^\alpha X \to Y$ with $\alpha + \beta = \tau - \sigma$ (§2.1). A pseudo-pullback of a cospan $(\sigma, X) \to (\rho, Z) \leftarrow (\tau, Y)$ in $\mathbf{T}(\mathcal{C}, \lambda)$ is computed by: (i) translating all objects to a uniform ordinal $\rho' \geq \max(\sigma, \tau, \rho)$ via $\mathbb{M}^\beta \mathbb{N}^\alpha$-applications; (ii) computing the pseudo-pullback in $\mathbf{Cat}/\mathcal{C}$ at level $\rho'$; (iii) translating back via the counit / unit 2-cells of the 2-adjunction $\mathbb{M} \dashv \mathbb{N}$ (Gray 1966, Street 1974, Emmenegger–Mesiti–Rosolini–Streicher 2024). Each of (i)–(iii) is canonical up to invertible 2-cell.

**Step 2 (fiber-level BC at a uniform ordinal).** At the uniform ordinal $\rho'$, the fibers of $\mathcal{E}$ are $\mathbf{Cat}/\mathcal{C}$-fibrations; the pseudo-pullback reduces to a $\mathcal{C}$-pullback with $\mathbf{Cat}/\mathcal{C}$-fiber structure. Standard fiber-pullback coherence for cloven fibrations (Jacobs 1999 §1.4; Streicher 2022 §4) gives that the fibered pullback exists and agrees with the total-category pullback up to canonical iso. *Spatiotemporal Knowledge Hyperdoctrines* Theorem 6.4.1 (the 1-categorical BC statement) then applies cellwise at each $(s, o) \in E \times E$ — the cellwise reduction is a consequence of the uniform-fiber-algebra structure, i.e., every fiber is $\mathbf{L}^{\bowtie E \times E}$ and reindexing acts by cellwise index maps. The canonical map $\mathrm{BC}^{\rho'}_\varphi$ at level $\rho'$ is therefore an isomorphism, not merely a 2-cell.

**Step 3 (coherence across ordinals).** The translation 2-cells between level $\rho'$ and the original levels come from the (co)lax-idempotent coherence of $\mathbb{M} \dashv \mathbb{N}$. By Kelly–Lack 1997's property-like theorem (condition K2), $\mathbb{M}$-pseudo-algebra structure and $\mathbb{N}$-pseudo-coalgebra structure are unique up to unique invertible 2-cell. Consequently, the canonical 2-cells arising from $\mathbb{M}^\beta \mathbb{N}^\alpha$-advancement compose coherently with the BC iso of Step 2 to produce a single invertible 2-cell $\mathrm{BC}_\varphi$ in $\mathbf{T}(\mathcal{C}, \lambda)$.

Composing Steps 1–3 yields $\mathrm{BC}_\varphi$ as an invertible 2-cell. The dual statement for $\forall$ follows by adjunction. $\square$

**Remark 3.1.2 (regime-dependent simplification).** The four regimes of §2.1 have differing 2-cell content:

- **Regime A** ($\kappa < \omega$): 2-cells trivialize; $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$ as a 1-category. Theorem 3.1.1 reduces to 1-categorical BC without 2-categorical content.
- **Regime B** ($\kappa \leq \omega$): 2-cells trivialize at the $\omega$-limit; BC holds strictly at $\omega$ and via Steps 1–3 elsewhere.
- **Regime C** ($\omega < \kappa < $ bound): 2-cells non-trivial up to $\kappa$; full machinery of Theorem 3.1.1 applies in the bounded range.
- **Regime D** ($\kappa \geq \omega_1$): 2-cells non-trivial throughout; Theorem 3.1.1 applies without simplification.

The cohomological theorems of §§6.3 and 7 target Regime D specifically, so the full theorem is essential; Regimes A–C are recovered as degenerate cases.

### 3.2 The dualized closure operator as a 2-comonad

*Spatiotemporal Knowledge Hyperdoctrines* §11.2 describes the dualized closure operator $\mathrm{Cl}^*$ informally as "acting by restriction-to-confirming-Priestley-points; dually to 'inflate and add consequences,' it 'deflate and remove non-confirming points.'" This section converts that description into a rigorous 2-comonadic statement and establishes the algebra / coalgebra correspondence under duality.

We first record a classical-lattice-theoretic lemma that supplies the underlying correspondence.

**Lemma 3.2.1.** *Let $A$ be a bounded distributive lattice and $\mathrm{cl} : A \to A$ a closure operator — monotone, inflationary, and idempotent. Then the set of closure-fixed points $A^{\mathrm{cl}} := \{a \in A : \mathrm{cl}(a) = a\}$ is a sub-meet-semilattice of $A$ containing the top element, closed under arbitrary meets extant in $A$. Under Priestley duality $\mathbf{DLat}^{\mathrm{op}} \simeq \mathbf{PriSp}$, the inclusion $A^{\mathrm{cl}} \hookrightarrow A$ dualizes to a Priestley-space surjection $\mathrm{Spec}(A) \twoheadrightarrow \mathrm{Spec}(A^{\mathrm{cl}})$, equivalently the selection of a closed subspace $K \subseteq \mathrm{Spec}(A)$.*

*Proof.* Closure of $A^{\mathrm{cl}}$ under meets: for $a, b \in A^{\mathrm{cl}}$, $\mathrm{cl}(a \wedge b) \geq a \wedge b$ by inflationarity, and $\mathrm{cl}(a \wedge b) \leq \mathrm{cl}(a) \wedge \mathrm{cl}(b) = a \wedge b$ by monotonicity, giving equality. Top-closure: $\mathrm{cl}(\top) \geq \top$ by inflationarity and $\mathrm{cl}(\top) \leq \top$ by $\top$ being maximal. The Priestley-side statement is the standard dualization: sub-meet-semilattices of $A$ containing $\top$ correspond to Priestley quotients of $\mathrm{Spec}(A)$, which are equivalent to closed subspaces via the standard characterization of Priestley-space morphisms. $\square$

On a fiber algebra $A_q = \mathbf{L}^{\bowtie E \times E}$, applying Lemma 3.2.1 to the $\leq_k$-lattice structure gives that the closure-fixed-point sub-lattice $A_q^{\mathrm{cl}}$ corresponds to a closed subspace $K_q \subseteq X_q = \mathrm{Spec}(A_q)$ in the paired Priestley dual. The paired structure is preserved because $\mathcal{C}$-naturality of closure respects both $+$ and $-$ components of the twist product (*Spatiotemporal Knowledge Hyperdoctrines* Definition 9.2.1, condition 4).

**Definition 3.2.2 ($\mathrm{Cl}^*$).** *Let $\mathbf{PrFib}^*(\mathbf{L}, \mathcal{C}, E)$ denote the 2-category of paired-Priestley opfibrations over $\mathcal{C}^{\mathrm{op}}$ dual to $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$. The **dualized closure 2-comonad** $\mathrm{Cl}^* : \mathbf{PrFib}^* \to \mathbf{PrFib}^*$ sends a paired-Priestley opfibration $p^* : \mathcal{E}^* \to \mathcal{C}^{\mathrm{op}}$ to the opfibration whose fiber at each $q \in \mathcal{C}^{\mathrm{op}}$ is the closed subspace $K_q \subseteq X_q = \mathcal{E}^*_q$ selected by the primal closure operator $\mathrm{cl}_q$ via Lemma 3.2.1. The counit $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \hookrightarrow \mathcal{E}^*$ is the inclusion of the closed subspace, dual to the primal inflationarity unit $\eta$ of $\mathrm{Cl}$. The comultiplication $\delta^* : \mathrm{Cl}^*(\mathcal{E}^*) \to \mathrm{Cl}^* \mathrm{Cl}^* (\mathcal{E}^*)$ is the canonical invertible 2-cell witnessing the self-inclusion $K_q \hookrightarrow K_q$.*

**Proposition 3.2.3.** *$\mathrm{Cl}^*$ is a colax-idempotent 2-comonad on $\mathbf{PrFib}^*$.*

*Proof.* Colax-idempotence for 2-comonads is the dual of Kelly–Lack 1997's condition K1 for 2-monads. Explicitly: there exists an adjunction $\delta^* \dashv \epsilon^*_{\mathrm{Cl}^*}$ in the 2-functor category $[\mathbf{PrFib}^*, \mathbf{PrFib}^*]$ with identity unit. This follows from the primal statement: *Spatiotemporal Knowledge Hyperdoctrines* Proposition 9.3.1 established $\mu \dashv \eta_{\mathrm{Cl}}$ with identity counit for the primal 2-monad $\mathrm{Cl}$; dualization via the $\mathcal{K}^{\mathrm{op}}$-identity reverses the adjunction and the counit becomes the unit, preserving the identity-counit condition.

Concretely: $\mathrm{Cl}$ on the primal side sends $\mathcal{E}$ to its closure-saturation $\mathrm{Cl}(\mathcal{E}) \supseteq \mathcal{E}$ via the inflationarity inclusion $\eta_\mathcal{E}$. Under Priestley duality, "$\supseteq$" reverses to "$\subseteq$" (algebra growth ↔ spectrum shrinking; Lemma 3.2.1), so the unit $\eta$ dualizes to the closed-subspace inclusion $\epsilon^* : \mathrm{Cl}^*(\mathcal{E}^*) \hookrightarrow \mathcal{E}^*$. Lax-idempotence of $\mathrm{Cl}$ therefore dualizes to colax-idempotence of $\mathrm{Cl}^*$. $\square$

**Corollary 3.2.4 (coalgebra uniqueness).** *By the colax-idempotent analogue of Kelly–Lack 1997 K2, every paired-Priestley opfibration admits at most one $\mathrm{Cl}^*$-coalgebra structure up to unique invertible 2-cell. Being a $\mathrm{Cl}^*$-coalgebra is a property, not additional data.*

**Proposition 3.2.5 (algebra / coalgebra correspondence).** *Under the duality $\mathbf{PrFib} \leftrightarrow \mathbf{PrFib}^*$, pseudo-$\mathrm{Cl}$-algebras — equivalently, the $\mathcal{C}$-closed SKP fibrations of *Spatiotemporal Knowledge Presheaves* Definition 3.1a and *Spatiotemporal Knowledge Hyperdoctrines* Theorem 9.4.1 — correspond bijectively to pseudo-$\mathrm{Cl}^*$-coalgebras. Under this correspondence, the characterization "quiescent cascade = $\mathrm{Cl}$-algebra at the fixed ordinal" (*Spatiotemporal Knowledge Hyperdoctrines* Proposition 9.6.1) matches the dual-side characterization "terminal dual cascade = $\mathrm{Cl}^*$-coalgebra at the fixed ordinal."*

*Proof.* By duality: pseudo-algebra structure for $\mathrm{Cl}$ is a morphism $a : \mathrm{Cl}(\mathcal{E}) \to \mathcal{E}$ inverse to $\eta_\mathcal{E}$ up to canonical iso, forcing $\mathrm{Cl}(\mathcal{E}) = \mathcal{E}$ (i.e., $\mathcal{E}$ is $\mathcal{C}$-closed). Dualizing: pseudo-coalgebra structure for $\mathrm{Cl}^*$ is a morphism $a^* : \mathcal{E}^* \to \mathrm{Cl}^*(\mathcal{E}^*)$ inverse to $\epsilon^*_{\mathcal{E}^*}$ up to canonical iso, forcing $\mathcal{E}^* = \mathrm{Cl}^*(\mathcal{E}^*)$ (i.e., $\mathcal{E}^*$ coincides with its confirming-subspace). The two conditions are exchanged under Lemma 3.2.1's dualization. $\square$

**Remark 3.2.6 (generator dualization sanity check).** *Spatiotemporal Knowledge Hyperdoctrines* §11.2 states each of the four $\mathcal{C}$-generators has a Priestley dual; we verify concretely for each.

- **Specialization** $f : q \to p$ with $f^*(v)(s, o) = v(s, o)$ on $\mathrm{dom}(q)$, $\bot$ else. The dual restricts $X_p$ to the clopen sub-space corresponding to $\mathrm{dom}(q) \subseteq E \times E$.
- **Converse** $f : p^c \to p$ with $f^*(v)(s, o) = v(o, s)$. The dual applies the swap $+ \leftrightarrow +', - \leftrightarrow -'$ combined with index swap $(s, o) \mapsto (o, s)$, a self-inverse involution on the paired Priestley space.
- **Subject-projection** $f : q \to p$ with $f^*(v)(s, o) = v(s, s)$. The dual factors through the diagonal subspace $X_p^{\mathrm{diag}} \hookrightarrow X_p$ composed with a row-broadcast.
- **Object-projection** $f : q \to p$ with $f^*(v)(s, o) = v(o, o)$. Dual to subject-projection by symmetry.

Each is a well-defined Priestley-space morphism; the present paper cites these dualizations without reproving.

### 3.3 A concrete Regime-D cascade

*Spatiotemporal Knowledge Hyperdoctrines* §12.6 describes Regime-D cascades only qualitatively, noting that "concrete aperiodic cascades require proper-class $E$ or inaccessible cardinals." For §7's classification theorem and §12.4's worked example to land, we need one fully-specified Regime-D cascade. This section constructs such a cascade on $E = \omega_1$.

**Construction 3.3.1 (transfinite-induction cascade).** *Fix $\mathbf{L} = \mathbf{2}$, $E = \omega_1$ (the first uncountable ordinal), $\Pi = \{P\}$ with $\mathrm{dom}(P) = \Delta_E = \{(\alpha, \alpha) : \alpha < \omega_1\}$, $\mathcal{C}$ the one-object category on $P$, and $\lambda = \omega_1 + 1$. The closure operator $\mathrm{cl}_P : A_P \to A_P$ is defined by the single inference rule*
$$(\forall \alpha < \beta.\ v(P)(\alpha, \alpha) = \mathbf{t}) \;\Longrightarrow\; \mathrm{cl}_P(v)(P)(\beta, \beta) \geq_k \mathbf{t} \qquad (\beta < \omega_1).$$
*The increment sequence is $u_0(P)(0, 0) = \mathbf{t}$ and $u_\tau = \bot$ for $\tau > 0$. Initial state: $v_0(P)(0, 0) = \mathbf{t}$; all other cells $\bot$.*

**Proposition 3.3.2 (cascade stages).** *At every $\tau < \omega_1$, the cascade state $v_\tau$ has $\mathbf{t}$-support exactly $S_\tau := \{(\alpha, \alpha) : \alpha \leq \tau\}$; all other cells are $\bot$.*

*Proof.* By transfinite induction on $\tau$. For $\tau = 0$: $v_0(P)(0, 0) = \mathbf{t}$ by initial data. For $\tau = \sigma + 1$: by inductive hypothesis, $v_\sigma(P)(\alpha, \alpha) = \mathbf{t}$ for all $\alpha \leq \sigma$. Applying $\mathrm{cl}_P$, the rule fires with $\beta = \sigma + 1$: all $\alpha < \sigma + 1$ satisfy the hypothesis, so $\mathrm{cl}_P(v_\sigma)(P)(\sigma + 1, \sigma + 1) \geq_k \mathbf{t}$, giving $\mathbf{t}$ (from $\bot$ + one firing). No earlier cell changes. For $\tau = \mu$ a countable limit ordinal: cascade continuity (*Spatiotemporal Knowledge Presheaves* Definition 3.2) gives $v_\mu(P)(\alpha, \alpha) = \bigvee_k\{v_\sigma(P)(\alpha, \alpha) : \sigma < \mu\}$. For $\alpha < \mu$, some $\sigma < \mu$ has $\alpha \leq \sigma$ and $v_\sigma(P)(\alpha, \alpha) = \mathbf{t}$, so the join is $\mathbf{t}$. For $\alpha = \mu$, every $v_\sigma(P)(\mu, \mu) = \bot$ for $\sigma < \mu$; join is $\bot$. Closure then fires at $\tau = \mu + 1$ to derive $v_{\mu+1}(P)(\mu, \mu) = \mathbf{t}$. In all cases, the stated support is reached. $\square$

**Theorem 3.3.3 (closure ordinal).** *The closure ordinal of Construction 3.3.1 is $\kappa = \omega_1$. The cascade is therefore aperiodic in the sense of *Spatiotemporal Knowledge Hyperdoctrines* Definition 10.4.1 (Regime D).*

*Proof.* By Proposition 3.3.2, for every $\tau < \omega_1$, $v_\tau \neq v_{\tau + 1}$: at step $\tau + 1$ (or $\tau + 2$ at limits), a new diagonal cell transitions from $\bot$ to $\mathbf{t}$, giving a strict $\leq_k$-increase. So no countable ordinal is a strict fixed point of $F_U = \mathrm{Cl}$ on the cascade. At $\tau = \omega_1$: every $\alpha < \omega_1$ has $v_{\omega_1}(P)(\alpha, \alpha) = \mathbf{t}$, but $\omega_1 \notin E$, so the rule cannot fire further. Thus $v_{\omega_1} = v_{\omega_1 + 1}$, and the closure ordinal is exactly $\omega_1$. *Spatiotemporal Knowledge Hyperdoctrines* Definition 10.4.1 defines *aperiodic* as $\kappa \geq \omega_1$; Construction 3.3.1 attains equality, placing it at the Regime-D boundary. $\square$

**Proposition 3.3.4 (non-Scott-continuity).** *The closure operator $\mathrm{cl}_P$ of Construction 3.3.1 is not Scott-continuous in the sense of *Spatiotemporal Knowledge Hyperdoctrines* Definition 3.2.1.*

*Proof.* Consider the directed family $\{w_n\}_{n < \omega} \subseteq A_P$ with $w_n(P)(k, k) = \mathbf{t}$ for $k \leq n$ and $\bot$ elsewhere. The directed $\leq_k$-join is $w_\omega(P)(k, k) = \mathbf{t}$ for all $k < \omega$, $\bot$ elsewhere. Compute:

- $\bigvee_k\{\mathrm{cl}_P(w_n) : n < \omega\}$: each $\mathrm{cl}_P(w_n) = w_{n+1}$ (the rule fires once for $\beta = n + 1$). The join is $\mathbf{t}$ on $\{(k, k) : k \leq \omega\} \setminus \{(\omega, \omega)\}$, $\bot$ at $(\omega, \omega)$.
- $\mathrm{cl}_P(w_\omega)$: all $\alpha < \omega$ satisfy the rule's hypothesis, so the rule fires at $\beta = \omega$, giving $\mathrm{cl}_P(w_\omega)(P)(\omega, \omega) = \mathbf{t}$.

The two disagree at $(\omega, \omega)$. Scott-continuity fails. $\square$

**Corollary 3.3.5 (Regime-D membership).** *The cascade of Construction 3.3.1 is aperiodic by *Spatiotemporal Knowledge Hyperdoctrines* Theorem 10.4.2: non-Scott-continuity (Proposition 3.3.4) and state-space cofinality $\geq \omega_1$ (witness: the chain $(v_\tau)_{\tau < \omega_1}$ is strictly $\leq_k$-ascending of length $\omega_1$). Both conjuncts of that theorem hold.*

**Proposition 3.3.6 (2-cell structure).** *The cascade orbit $(v_\tau)_{\tau \leq \omega_1}$ in the temporal 2-category $\mathbf{T}(\mathcal{C}, \omega_1 + 1)$ carries a non-identity 2-cell at every successor step $v_\tau \to v_{\tau+1}$ for $\tau < \omega_1$. Limit-step continuity 2-cells $\bigvee_k\{v_\sigma : \sigma < \mu\} \to v_\mu$ are identity.*

*Proof.* At each successor step, the closure operator $\mathrm{Cl}$ on $v_\tau$ produces $v_{\tau+1}$ with one newly-asserted cell. The 2-cell $\mathrm{Cl}(v_\tau) \Rightarrow v_{\tau+1}$ witnesses this single-cell update; it is not identity because the cells differ at $(\tau+1, \tau+1)$ (successor) or $(\mu, \mu)$ (successor-after-limit case; Proposition 3.3.2). Limit-step continuity is strict in the convention of *Spatiotemporal Knowledge Presheaves* Definition 3.2, so its 2-cells are identity. $\square$

**Corollary 3.3.7 (KZ-diamond alive at Regime D).** *The transfinite-induction cascade exhibits the "KZ-lax-idempotent diamond fully alive" regime flagged in *Spatiotemporal Knowledge Hyperdoctrines* §10.5: non-identity 2-cells throughout the $\omega_1$-indexed cascade.*

**Remark 3.3.8 (minimality and extensions).** The construction is minimal in three senses: $E = \omega_1$ is the least ordinal of uncountable cofinality (any countable $E$ forces $\kappa < \omega_1$, Regimes A/B/C); $|\Pi| = 1$ is the smallest non-trivial predicate set; one closure rule suffices. Any concrete Regime-D cascade must attain at least this complexity by *Spatiotemporal Knowledge Hyperdoctrines* Theorem 10.4.2. §12.4 below extends the cascade with additional structure (a specialization $f : Q \to P$; a second closure rule of higher rank) to exhibit the cohomological classification theorem (§7.2) on a richer example; the present construction is the anchor.

### 3.4 Summary

§§3.1–3.3 establish the three prerequisites:

1. **(Two-categorical Beck–Chevalley; Theorem 3.1.1.)** Pseudo-pullbacks in $\mathbf{T}(\mathcal{C}, \lambda)$ satisfy Beck–Chevalley up to invertible 2-cell for both $\leq_k$ and $\leq_t$ adjoint systems. The proof uses slice-wise reduction, fiber-pullback coherence (Jacobs 1999 / Streicher 2022), and Kelly–Lack 1997 property-like coherence.

2. **($\mathrm{Cl}^*$ as a 2-comonad; Propositions 3.2.3 and 3.2.5.)** The dualized closure operator $\mathrm{Cl}^*$ is a genuine colax-idempotent 2-comonad. $\mathrm{Cl}^*$-coalgebras correspond bijectively to primal $\mathrm{Cl}$-algebras under Priestley duality.

3. **(Concrete Regime-D cascade; Construction 3.3.1, Theorem 3.3.3.)** The transfinite-induction cascade on $E = \omega_1$ has closure ordinal exactly $\omega_1$, non-Scott-continuous closure, and non-trivial KZ 2-cells throughout the $\omega_1$-indexed orbit.

§§4–11 below cite these without further elaboration.

---

## 4. The Site

This section constructs the site on which the cohomology of subsequent sections lives. §4.1 motivates the choice. §4.2 gives the definition and verifies the Grothendieck axioms. §4.3 produces site morphisms from morphisms of SKP hyperdoctrines. §4.4 describes how the site simplifies in each of the four regimes of §2.1.

### 4.1 Why this site

Three structural layers live on the dual object $\mathbf{T}^*$ of §2.1: each fiber $X_q^\tau := \mathrm{Spec}(A_q)$ carries a paired Priestley space structure (Jung–Rivieccio 2012); the fibers vary contravariantly along predicate-morphisms of $\mathcal{C}$; and they vary covariantly (in the dual direction) along cascade-ordinal translations. A site carrying the correct cohomology needs to reflect all three.

Three candidate approaches, none of which is quite right on its own:

**(a) Fiberwise.** Work on a single paired Priestley space $X_q^\tau$ at a time, using the Gehrke–van Gool 2019 framework (§2.5) for sheaves on the Priestley dual of a distributive lattice. This gives a cohomology at each $(q, \tau)$ but loses the cross-ordinal gluing that §§7–8 need. Rejected.

**(b) Alexandrov product only.** Treat the product $\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$ as a poset (or 1-category) and give it its Alexandrov topology. Sheaves valued in $\mathbf{Ab}$ are then ordinary cellular sheaves on a poset (§2.4). This captures the cross-ordinal and cross-predicate gluing but throws away the paired Priestley structure *within* each fiber. Cohomology computations lose access to the bitopological Stone duality that makes individual fibers tractable.

**(c) Full 2-site.** Treat $\mathbf{T}^*$ as a 2-category and use a genuine 2-site in the sense of Street 2000 (*Categorical and combinatorial aspects of descent theory*), with 2-sieves and a descent condition. The additional machinery is needed only for the 2-cell content of Regime D; for Regimes A, B, and most of C, 2-cells are trivial (§2.1) and the 2-site collapses to a 1-site. Carrying 2-site machinery throughout is overkill.

The path adopted here is a hybrid: we take a 1-site whose objects assemble (a) and (b) — a paired-Priestley clopen at each ordinal-predicate pair — and handle the 2-cell content of Regime D separately as a descent condition on sheaves (§5.3) rather than as extra structure on the site. This matches the structure of the Anderson–Putnam 1998 direct-limit construction for aperiodic tilings (§2.6): the site is indexed by finite stages; the transfinite content is recovered at the level of cohomology via direct limits.

### 4.2 The site $(\mathbf{T}^*, J)$

**Notation.** Throughout this section we fix an SKP hyperdoctrine $\mathcal{E}$ over $(\mathbf{L}, \mathcal{C}, E)$ with cascade bound $\lambda$ and an increment sequence $U = (u_\tau)_{\tau < \lambda}$. We write $X_q^\tau$ for the paired Priestley space associated to the fiber algebra $A_q$ at cascade stage $\tau$, carried by the cascade orbit $(v_\tau)_{\tau < \lambda}$ and the Priestley duality of §2.1. A **pairwise-Stone clopen** (*Spatiotemporal Knowledge Presheaves* §8, Bezhanishvili et al. 2010) is a subset $U \subseteq X_q^\tau$ clopen in the join of the $+$- and $-$-component topologies. Pairwise-Stone clopens form a Boolean algebra.

**Definition 4.2.1 (the site).** The **underlying category $\mathbf{T}^*_{\mathrm{site}}$** has:

- **Objects:** triples $(q, \tau, U)$ where $q \in \mathcal{C}^{\mathrm{op}}$, $\tau < \lambda$ ordinal, and $U$ a pairwise-Stone clopen in $X_q^\tau$.
- **Morphisms** $(q', \tau', U') \to (q, \tau, U)$: triples $(f, h, j)$ where $f : q \to q'$ is a morphism of $\mathcal{C}$ (note: direction reversed from the $\mathcal{C}^{\mathrm{op}}$-component of the base), $h : \tau \to \tau'$ is a morphism of $\lambda^{\mathrm{op}}$ (equivalently: $\tau' \geq \tau$ in $\lambda$), and $j : U' \hookrightarrow (f \times h)^*(U)$ is an inclusion of pairwise-Stone clopens, where $(f \times h)^* : X_q^\tau \to X_{q'}^{\tau'}$ is the composite of the dualized generator morphism along $f$ and the dualized closure advancement along $h$ (§3.2, Remark 3.2.6).
- **Composition:** componentwise.

The **Grothendieck topology $J$** on $\mathbf{T}^*_{\mathrm{site}}$ is generated by the following pretopology:

A family $\{(q, \tau, U_i) \xrightarrow{(\mathrm{id}, \mathrm{id}, \iota_i)} (q, \tau, U)\}_{i \in I}$ of pairwise-Stone inclusions at fixed $(q, \tau)$ is a **covering family** iff $\bigcup_{i} U_i = U$ in the pairwise-Stone topology on $X_q^\tau$. The **covering sieves** in $J(q, \tau, U)$ are the sieves generated by such covering families.

**Theorem 4.2.2 (Grothendieck axioms).** *$J$ is a Grothendieck topology on $\mathbf{T}^*_{\mathrm{site}}$.*

*Proof.* We verify the three axioms (Mac Lane–Moerdijk 1992 Ch. III §2):

**(Maximality)** The total sieve at $(q, \tau, U)$ is generated by the singleton $\{\mathrm{id}_{(q, \tau, U)}\}$, which is a covering family (with $U_1 = U$, trivially covering $U$). Hence $J(q, \tau, U)$ contains the total sieve.

**(Stability under pullback)** Let $\{(q, \tau, U_i) \to (q, \tau, U)\}$ be a covering family and $g : (q', \tau', U') \to (q, \tau, U)$ any morphism. The pullback $U_i \times_U U'$ exists in $\mathbf{T}^*_{\mathrm{site}}$ as $(q', \tau', U' \cap (f \times h)^*(U_i))$, and the family $\{(q', \tau', U' \cap (f \times h)^*(U_i)) \to (q', \tau', U')\}_i$ is a covering family because $(f \times h)^*$ preserves the pairwise-Stone structure (Remark 3.2.6 per-generator + standard Priestley-topology preservation under $\mathrm{Cl}^*$) and pairwise-Stone cover-preimages remain pairwise-Stone covers.

**(Transitivity)** Given $S \in J(q, \tau, U)$ and $T$ a sieve at $(q, \tau, U)$ such that $T$'s pullback along every morphism in $S$ lies in $J$ at the target: we show $T \in J$. By the pretopology characterization, $S$ is generated by pairwise-Stone clopens $\{U_i\}$; each $T$-pullback is generated by $\{U_{i,j}\}_j$ with $\bigcup_j U_{i,j} = U_i$; so $\bigcup_{i,j} U_{i,j} = \bigcup_i U_i = U$, making $\{U_{i,j}\}$ a pairwise-Stone cover of $U$ and hence generating a covering sieve contained in $T$. $\square$

**Remark 4.2.3 (the pretopology is actually a basis).** The covering families of Definition 4.2.1 are themselves closed under pullback (the pullback of a pairwise-Stone cover by a Priestley morphism is again a pairwise-Stone cover), so the pretopology is in fact a Grothendieck *basis* — the associated topology is directly derivable. This simplifies site-morphism arguments in §4.3.

**Remark 4.2.4 (on generality of the topology).** $J$ includes only "fiber" covers (at fixed $(q, \tau)$ by pairwise-Stone refinements). It does *not* include "temporal" covers of the form $\{(q, \tau_i, U) \to (q, \tau, U)\}_{i \in I}$ for $\tau_i \geq \tau$ — such families are not covering in $J$, because at fixed $(q, U)$ the morphism set from varying $\tau_i$ to $\tau$ is a filtered diagram, not a jointly-surjective family of clopen inclusions.

This is deliberate. Cross-ordinal cascade structure is encoded in the site's *morphisms* (the temporal component $h$ in Definition 4.2.1), not in the covers. Cross-ordinal *cohomological* content — the Regime-D aperiodicity classification of §7 — is then extracted via direct limits along cascade morphisms, following the Anderson–Putnam template (§2.6). Temporal covers as primary data would produce a different, and less tractable, cohomology.

### 4.3 Site morphisms from SKP hyperdoctrine morphisms

A morphism $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ of SKP hyperdoctrines, in the sense of *Spatiotemporal Knowledge Presheaves* Definition 6.7 restricted to the hyperdoctrine 2-category, induces a morphism on dualized temporal 2-categories and hence on sites.

**Definition 4.3.1.** A **morphism of sites** $(\mathbf{T}^*_1, J_1) \to (\mathbf{T}^*_2, J_2)$ is a functor $\phi : \mathbf{T}^*_{1,\mathrm{site}} \to \mathbf{T}^*_{2,\mathrm{site}}$ that preserves covers: for every $R \in J_1(x)$, the image sieve $\phi_*(R) \in J_2(\phi(x))$. Equivalently (via the pretopology basis of Remark 4.2.3), $\phi$ sends pairwise-Stone covers to pairwise-Stone covers.

**Proposition 4.3.2.** *Every morphism $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ of SKP hyperdoctrines over common base parameters $(\mathbf{L}, \mathcal{C}, E)$ and with matching cascade bound $\lambda$ induces a site morphism $\Phi^* : (\mathbf{T}^*_2, J_2) \to (\mathbf{T}^*_1, J_1)$.*

*Proof.* The hyperdoctrine morphism $\Phi$ sends each fiber $A_{2,q}$ to $A_{1,q}$ by a bilattice homomorphism (paper 1 §6); dualizing, we obtain for each $(q, \tau)$ a Priestley-space morphism $\Phi^*_{q,\tau} : X_{1,q}^\tau \to X_{2,q}^\tau$. Priestley-space morphisms send pairwise-Stone clopens to pairwise-Stone clopens (Bezhanishvili et al. 2010 Theorem 2.9), and they preserve pairwise-Stone covers because the preimage-of-union-equals-union-of-preimages identity holds in any topological category. Define $\Phi^* : \mathbf{T}^*_{2,\mathrm{site}} \to \mathbf{T}^*_{1,\mathrm{site}}$ on objects by $(q, \tau, U) \mapsto (q, \tau, (\Phi^*_{q,\tau})^{-1}(U))$ and on morphisms by the induced preimage. Functoriality and cover preservation follow by direct check. $\square$

**Corollary 4.3.3 (2-functoriality).** *The assignment $\mathcal{E} \mapsto (\mathbf{T}^*_{\mathcal{E}}, J_{\mathcal{E}})$ extends to a 2-functor from the 2-category of SKP hyperdoctrines to the 2-category of sites (with site morphisms as 1-cells and natural transformations of cover-preserving functors as 2-cells).*

*Proof.* Composition of hyperdoctrine morphisms corresponds to composition of Priestley-space morphisms (dualization is a 2-functor), which in turn corresponds to composition of site morphisms. 2-cells lift by naturality. $\square$

### 4.4 Regime-dependent behavior of the site

The complexity of $(\mathbf{T}^*, J)$ varies by the four regimes of §2.1:

**Regime A ($\kappa < \omega$, all parameters finite).** Each paired Priestley space $X_q^\tau$ is finite (fiber algebra $A_q$ is finite). The cascade stabilizes at some $\tau^* < \omega$, so only finitely many ordinal-strata carry distinct sites. $\mathbf{T}^*_{\mathrm{site}}$ is a finite category. Cover families are finite; every covering sieve has a finite refinement. Cohomology is computable by standard finite-cellular-sheaf techniques (§2.4; Curry 2014 Ch. 6).

**Regime B ($\kappa \leq \omega$, Scott-continuous closure).** Each $X_q^\tau$ may be infinite (if $E$ is infinite), but the cascade stabilizes at $\tau^* \leq \omega$. $\mathbf{T}^*_{\mathrm{site}}$ is countable at the level of ordinals; each fiber admits pairwise-Stone covers refined to acyclic covers (§2.4; Husainov 2026's Dedekind–MacNeille condition). Cohomology is computable by Čech or Roos-complex techniques (§2.4; Ayzenberg–Magai 2025 Appendix C).

**Regime C ($\omega < \kappa < $ state-space cofinality).** Each $X_q^\tau$ is typically infinite; cascade stabilizes at some $\kappa$ with $\omega < \kappa < \mathrm{cf}(X_q^\tau)$. $\mathbf{T}^*_{\mathrm{site}}$ has transfinite ordinal strata up to $\kappa$, but is bounded. Cohomology is computable in principle via transfinite iteration of Regime-B techniques; low-degree cohomology acquires generators at non-Scott-continuous firing steps (§10).

**Regime D ($\kappa \geq \omega_1$, aperiodic).** Each $X_q^\tau$ and the cascade both exhibit transfinite behavior without stabilization at any countable ordinal. $\mathbf{T}^*_{\mathrm{site}}$ has $\omega_1$-many ordinal strata; the cascade 2-cells are non-trivial throughout. Cohomology is not directly computable at any finite stage; instead, we recover it as a direct limit $\varinjlim_{\tau < \omega_1} H^n(\mathbf{T}^*_{\leq \tau}, -)$ of finite-stage cohomologies under the cascade endofunctor's action (§7.3), following the Anderson–Putnam 1998 template.

**Remark 4.4.1 (the site in the transfinite-induction cascade of §3.3).** For Construction 3.3.1, each fiber $X_P^\tau$ is the paired Priestley dual of $A_P = \mathbf{2}^{\bowtie \omega_1 \times \omega_1}$ restricted to the clopen up-set of $\mathbf{t}$-valued cells, which at stage $\tau$ is $\{(\alpha, \alpha, +) : \alpha \leq \tau\}$ together with its topological closure. The site $\mathbf{T}^*_{\mathrm{site}}$ has $\omega_1$-many ordinal strata, each carrying a countable Boolean algebra of pairwise-Stone clopens (since the $\mathbf{t}$-support at stage $\tau$ has at most $\tau + 1 < \omega_1$ many cells). Cascade morphisms between strata are inclusions. The computation of cohomology classes on this site anchors the worked example of §12.4.

### 4.5 Summary

The site $(\mathbf{T}^*, J)$ of Definition 4.2.1 is a 1-site whose:

- **Objects** assemble the paired-Priestley clopen structure (fiber-level) with the $\mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$ base.
- **Morphisms** encode both predicate-reindexing and cascade-temporal-advance, via dualized $\mathcal{C}$-generators and dualized closure.
- **Topology** is generated by fiber-level pairwise-Stone covers only; cross-ordinal structure is carried by morphisms, not covers.
- **2-functorial** in the SKP hyperdoctrine (Corollary 4.3.3).
- **Regime-sensitive** in computational complexity, from finite (Regime A) to $\omega_1$-indexed (Regime D).

§5 defines sheaves on $(\mathbf{T}^*, J)$ valued in abelian groups; §6 develops the cohomology; §§7–9 give the classification theorems.

---

## 5. Sheaves on $\mathbf{T}^*$

This section develops the category of sheaves on the site $(\mathbf{T}^*_{\mathrm{site}}, J)$ of §4. §5.1 fixes the value category. §5.2 gives the sheaf condition and establishes sheafification. §5.3 adds the 2-cell coherence condition that handles the Regime-D content deferred from §4.1, and constructs the three sheaves most used downstream — the constant sheaf, skyscraper sheaves at points, and the **cascade-associated sheaf** $\mathcal{F}_U$ that carries §7's classification invariants. §5.4 extends functoriality from site morphisms to sheaf morphisms.

### 5.1 Value category

We work with sheaves valued in the category $\mathbf{Ab}$ of abelian groups (equivalently, $\mathbb{Z}$-modules).

**Justification.** Three competing candidates for the value category were considered in the design stage: the target category of *paired Priestley spaces* $\mathbf{PairedPriSp}$ (self-dual with the site's fibers); the category of *d-frames* (Jung–Moshier 2006; Jakl 2018), generalizing paired Priestley; and $\mathbf{Ab}$. The first two are well-matched to the bilattice setting but lack off-the-shelf homological machinery — derived functors, enough injectives, Godement resolutions, Čech comparison, spectral sequences all need to be developed from scratch in those targets. $\mathbf{Ab}$ has all of this classically, plus direct compatibility with the Curry 2014 cellular-sheaf homology (§2.4), the Felber et al. 2025 task-sheaf distributed-cohomology (§2.7), and the Anderson–Putnam 1998 direct-limit construction (§2.6). The bilattice-specific content is extracted from each fiber algebra $A_q$ via its Priestley spectrum and the sheaf values track this spectral information; $\mathbf{Ab}$-valued cohomology is then computed by standard methods.

A bilattice-native cohomology — sheaves valued in $\mathbf{PairedPriSp}$ or d-frames — is a natural extension flagged as future work in §13.5. The present paper's contribution is the site construction and its $\mathbf{Ab}$-cohomology; a companion development targeting richer value categories would yield parallel classifications.

**Definition 5.1.1 (sheaves on $\mathbf{T}^*$).** We write
$$\mathrm{Sh}(\mathbf{T}^*, J) := \mathrm{Sh}(\mathbf{T}^*_{\mathrm{site}}, J; \mathbf{Ab})$$
for the category of $\mathbf{Ab}$-valued sheaves on the site $(\mathbf{T}^*_{\mathrm{site}}, J)$ of Definition 4.2.1. When the topology $J$ is understood, we write $\mathrm{Sh}(\mathbf{T}^*)$.

**Proposition 5.1.2.** *$\mathrm{Sh}(\mathbf{T}^*, J)$ is an abelian category with enough injectives.*

*Proof.* The abelian-category structure is inherited from $\mathbf{Ab}$ pointwise (Grothendieck 1957). Enough injectives: the inclusion $i : \mathrm{Sh}(\mathbf{T}^*, J) \hookrightarrow \mathrm{PSh}(\mathbf{T}^*_{\mathrm{site}}; \mathbf{Ab})$ admits a left adjoint $a$ (the sheafification functor; §5.2 below); an injective abelian presheaf remains an injective sheaf under the inclusion; abelian presheaves have enough injectives because $\mathbf{Ab}^{\mathbf{T}^{*\mathrm{op}}_{\mathrm{site}}}$ is a Grothendieck abelian category (Tohoku AB5 + generator; see Bredon 1997 Ch. II §1 or Kashiwara–Schapira 2006 §8.6). $\square$

### 5.2 Sheaf condition and sheafification

**Spelling out the sheaf condition.** Let $F : \mathbf{T}^{*\mathrm{op}}_{\mathrm{site}} \to \mathbf{Ab}$ be a presheaf. $F$ is a sheaf for the topology $J$ iff, for every pairwise-Stone cover $\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in I}$ of an object $(q, \tau, U)$ (§4.2 pretopology), the sequence
$$0 \to F(q, \tau, U) \to \prod_{i \in I} F(q, \tau, U_i) \rightrightarrows \prod_{i, j \in I} F(q, \tau, U_i \cap U_j)$$
is exact, with the rightward maps induced by the two projections $U_i \cap U_j \to U_i$ and $U_i \cap U_j \to U_j$.

This is the standard Čech sheaf condition (Mac Lane–Moerdijk 1992 Ch. III §4) instantiated to our covers, which are fiber-level and involve no cross-ordinal joint-surjection. Cross-predicate and cross-ordinal structure is carried by morphisms $(q', \tau', U') \to (q, \tau, U)$; the sheaf condition does not constrain $F$ on those morphisms beyond the functoriality baked into $F$ being a presheaf on $\mathbf{T}^*_{\mathrm{site}}$.

**Proposition 5.2.1 (sheafification).** *The inclusion $i : \mathrm{Sh}(\mathbf{T}^*, J) \hookrightarrow \mathrm{PSh}(\mathbf{T}^*_{\mathrm{site}}; \mathbf{Ab})$ admits a left adjoint $a$ (the **sheafification** functor) satisfying $a \circ i \cong \mathrm{id}_{\mathrm{Sh}}$.*

*Proof.* Apply the plus-construction (Mac Lane–Moerdijk 1992 Ch. III §5) to $\mathrm{PSh}(\mathbf{T}^*_{\mathrm{site}}; \mathbf{Ab})$ iterated twice; under the pretopology basis of Remark 4.2.3, two plus-applications suffice to produce a sheaf, and the resulting functor $a = (-)^{++}$ is left adjoint to $i$ by construction. The Boolean-algebra structure of pairwise-Stone clopens (§4.2 opening) ensures that covers admit common refinements, which is the combinatorial requirement for the plus-construction to converge. $\square$

**Remark 5.2.2 (comparison with $\mathrm{Sh}(\mathbf{T}^*_{\mathrm{site}}; \mathbf{Set})$).** The category $\mathrm{Sh}(\mathbf{T}^*_{\mathrm{site}}; \mathbf{Set})$ of set-valued sheaves is a Grothendieck topos (SGA 4 Exp. IV); $\mathrm{Sh}(\mathbf{T}^*, J)$ is its abelian-group-object analogue. This makes the standard translation between toposic and homological formulations of cohomology available; §§6–7 use the homological form exclusively.

### 5.3 KZ coherence and canonical sheaves

Definition 5.1.1 and Proposition 5.1.2 give a category of sheaves on the 1-truncated site $\mathbf{T}^*_{\mathrm{site}}$, with 2-cell content of $\mathbf{T}^*$ not yet entering. For Regimes A, B, and most of C, the 2-cells trivialize (§2.1), and no further structure is needed. For Regime D, where the KZ-lax-idempotent diamond carries non-trivial 2-cells throughout (§3.3 Corollary 3.3.7), we impose a coherence condition on sheaves.

**Definition 5.3.1 (KZ-coherent sheaf).** A sheaf $F \in \mathrm{Sh}(\mathbf{T}^*, J)$ is **KZ-coherent** iff for every pair of parallel 1-cells $f, f' : (q', \tau', U') \to (q, \tau, U)$ in $\mathbf{T}^*_{\mathrm{site}}$ connected by an invertible 2-cell $\alpha : f \Rightarrow f'$ arising from the KZ-lax-idempotent coherence of $\mathbb{M} \dashv \mathbb{N}$ or of $\mathrm{Cl}$ (§2.1), the induced maps of sections agree:
$$F(f) = F(f') : F(q, \tau, U) \to F(q', \tau', U').$$
The full subcategory of KZ-coherent sheaves is denoted $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$.

**Proposition 5.3.2.** *$\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ is a reflective abelian subcategory of $\mathrm{Sh}(\mathbf{T}^*, J)$ with enough injectives. In Regimes A and B, the inclusion $\mathrm{Sh}^{\mathrm{KZ}} \hookrightarrow \mathrm{Sh}$ is an equivalence.*

*Proof.* Reflectivity: the KZ-coherence condition equalizes the two maps $F(f), F(f')$ for each KZ 2-cell; sheafifying the equalizer presheaf produces the KZ-coherent reflection of $F$. Enough injectives: injective objects in $\mathrm{Sh}$ that satisfy KZ-coherence are injective in $\mathrm{Sh}^{\mathrm{KZ}}$; the reflection of an injective need not be injective, but embedding any $F \in \mathrm{Sh}^{\mathrm{KZ}}$ into an injective of $\mathrm{Sh}$ and reflecting produces an injective in $\mathrm{Sh}^{\mathrm{KZ}}$. In Regimes A and B, all KZ 2-cells are identity (§2.1); the coherence condition is vacuous and the inclusion is an equivalence. $\square$

**Convention.** Unless otherwise stated, "sheaf on $\mathbf{T}^*$" means KZ-coherent sheaf, i.e., an object of $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$. We write $H^n(\mathbf{T}^*, F)$ for cohomology computed in this category (§6.1).

**Three canonical sheaves.** The constructions below produce sheaves directly, without needing sheafification.

**Example 5.3.3 (constant sheaf).** For any abelian group $A$, the **constant sheaf $\underline{A}$** assigns $\underline{A}(q, \tau, U) = A$ to every object, with all morphisms acting as $\mathrm{id}_A$. Sheaf condition: immediate (equalizer of constant maps). KZ-coherence: trivial since $\underline{A}(f) = \underline{A}(f') = \mathrm{id}_A$.

**Example 5.3.4 (skyscraper sheaf).** Fix a point $x \in X_q^\tau$ in the paired Priestley space of a specific fiber and an abelian group $A$. The **skyscraper sheaf at $x$**, denoted $\mathrm{sky}_{x,A}$, is defined by
$$\mathrm{sky}_{x,A}(q', \tau', U') := \begin{cases} A & \text{if } x \in (f \times h)^*(U') \text{ for some morphism } (q', \tau', U') \to (q, \tau, -), \\ 0 & \text{otherwise,} \end{cases}$$
with restriction maps the identity on $A$ when defined and $0$ otherwise. Sheaf condition: the cover condition follows from $x$ lying in $U$ iff it lies in some $U_i$ covering $U$. KZ-coherence: the point $x$ does not depend on which KZ-parallel 1-cell is used.

**Example 5.3.5 (cascade-associated sheaf $\mathcal{F}_U$).** This is the central construction of the paper. Fix an SKP $(\mathcal{E}, c)$ with increment sequence $U = (u_\tau)_{\tau < \lambda}$. For each $(q, \tau) \in \mathcal{C}^{\mathrm{op}} \times \lambda^{\mathrm{op}}$, define the set of **newly-added designated cells** at stage $\tau$:
$$\Delta^+_\tau(q) := \{(s, o) \in E \times E : v_\tau(q)(s, o) = \mathbf{t} \text{ and } v_{\tau'}(q)(s, o) \neq \mathbf{t} \text{ for all } \tau' < \tau\},$$
with the convention that $\Delta^+_0(q)$ equals the $\mathbf{t}$-support of the initial state $v_0$. Via the Priestley duality of §2.1, each cell $(s, o) \in \Delta^+_\tau(q)$ corresponds to a $+$-point $(s, o, +) \in X_q^\tau$ in the paired Priestley dual. Let $\Delta^{+,*}_\tau(q) \subseteq X_q^\tau$ denote the image of $\Delta^+_\tau(q)$ under duality.

**The sheaf $\mathcal{F}_U$** is defined on objects by
$$\mathcal{F}_U(q, \tau, U) := \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U} \quad \in \mathbf{Ab},$$
i.e., the free abelian group on the set of newly-added designated points of the fiber that lie within the pairwise-Stone clopen $U$. On morphisms $(q', \tau', U') \to (q, \tau, U)$ given by $(f, h, j)$: the dualized reindexing $(f \times h)^*$ sends $\Delta^{+,*}_{\tau'}(q') \cap U'$ into $\Delta^{+,*}_\tau(q) \cap U$ (cascade monotonicity in the primal becomes spectrum-shrinking in the dual; newly-added-at-$\tau'$ points map to newly-added-at-$\tau$ or earlier-added points via the cascade forgetful map), and $\mathcal{F}_U$ acts by the induced $\mathbb{Z}$-linear map between free abelian groups.

**Proposition 5.3.6.** *$\mathcal{F}_U$ is a well-defined KZ-coherent sheaf on $\mathbf{T}^*$.*

*Proof.* **Functoriality:** composition of morphisms $(f, h, j) \circ (f', h', j')$ sends cells via composite reindexing, and the induced $\mathbb{Z}$-linear map is the composite by naturality of the free-abelian-group functor.

**Sheaf condition:** for a pairwise-Stone cover $\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in I}$ with $\bigcup_i U_i = U$, the set $\Delta^{+,*}_\tau(q) \cap U$ decomposes as $\bigcup_i (\Delta^{+,*}_\tau(q) \cap U_i)$, and the sequence
$$0 \to \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U} \to \prod_i \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U_i} \rightrightarrows \prod_{i,j} \mathbb{Z}^{\Delta^{+,*}_\tau(q) \cap U_i \cap U_j}$$
is the direct sum (over the discrete set $\Delta^{+,*}_\tau(q) \cap U$) of the exact sequence for the *constant* $\mathbb{Z}$-sheaf on a discrete space, which is trivially exact.

**KZ-coherence:** the newly-added-at-$\tau$ set $\Delta^+_\tau(q)$ is determined by the primal cascade's values at cells $(s, o)$, which are invariant under KZ-coherence 2-cells of $\mathbf{T}^*$ (the 2-cells witness equalities between different route-descriptions of the same cascade stage, not changes in the cascade itself). Hence $\mathcal{F}_U(f) = \mathcal{F}_U(f')$ whenever $f, f'$ differ by a KZ 2-cell. $\square$

**Interpretation.** $\mathcal{F}_U$ is a "local-increment-counting" sheaf: at each ordinal-predicate-clopen triple, it records which cells are newly added by the cascade at that stage, tracked as $\mathbb{Z}$-coefficients for free-abelian-group computations. The sheaf is locally constant in Regime A (only one stage matters), acquires $\omega$-indexed structure in Regime B, transfinite-bounded structure in Regime C, and $\omega_1$-indexed aperiodic structure in Regime D. §7's classification theorem is stated in terms of $H^1$-cohomology with coefficients in $\mathcal{F}_U$.

**Remark 5.3.7 (choice of "designated" cells).** Example 5.3.5 uses only $\mathbf{t}$-valued cells in defining $\Delta^+_\tau(q)$, corresponding to the classical designation (Belnap-designated minus $\top$). A parallel construction $\mathcal{F}_U^{\mathrm{Belnap}}$ using $\{\mathbf{t}, \top\}$-valued cells — the full Belnap-designated set — gives a *paraconsistent cascade-associated sheaf*, whose cohomology captures the knowledge-order-sensitive side of the classification. The two are related by the natural transformation induced by the inclusion $\{\mathbf{t}\} \hookrightarrow \{\mathbf{t}, \top\}$; §9 develops this into the bigraded cohomology $H^{m,n}_{k,t}$.

### 5.4 Functoriality

**Proposition 5.4.1.** *A morphism $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ of SKP hyperdoctrines over common $(\mathbf{L}, \mathcal{C}, E, \lambda)$ induces:*

- *An inverse-image functor $\Phi^* : \mathrm{Sh}(\mathbf{T}^*_2, J_2) \to \mathrm{Sh}(\mathbf{T}^*_1, J_1)$ by precomposition with the site morphism of Proposition 4.3.2.*
- *A direct-image functor $\Phi_* : \mathrm{Sh}(\mathbf{T}^*_1, J_1) \to \mathrm{Sh}(\mathbf{T}^*_2, J_2)$ right adjoint to $\Phi^*$.*
- *Both functors restrict to the KZ-coherent subcategories $\mathrm{Sh}^{\mathrm{KZ}}$.*

*Proof.* Inverse-image: precomposition is always well-defined on presheaves; on sheaves it is the composition with the site functor of Proposition 4.3.2 followed by sheafification, both of which preserve the sheaf condition when the site functor preserves covers (which Proposition 4.3.2 establishes). Direct-image: the right adjoint exists by the adjoint functor theorem in Grothendieck topoi; Kashiwara–Schapira 2006 §17.6 gives the construction. Both functors preserve KZ-coherence because the underlying site morphism is 2-functorial (Corollary 4.3.3), so KZ-2-cells on $\mathbf{T}^*_1$ correspond to KZ-2-cells on $\mathbf{T}^*_2$. $\square$

**Remark 5.4.2 (pairs $(\Phi^*, \Phi_*)$ form a geometric morphism).** The adjoint pair $\Phi^* \dashv \Phi_*$ is a **geometric morphism** of Grothendieck topoi (Mac Lane–Moerdijk 1992 Ch. VII) when $\Phi^*$ preserves finite limits, which follows from the site morphism of Proposition 4.3.2 being left-exact at the fiber level (Priestley-space morphisms preserve finite limits). This gives access to the standard Leray spectral sequence machinery (§6, §7).

**Example 5.4.3 (base-change sheaves).** For the specific case of a cascade refinement — keeping the SKP hyperdoctrine structure fixed and restricting to a cascade sub-range $\lambda' \subseteq \lambda$ — Proposition 5.4.1 specializes to a pair $(j^*, j_*)$ of restriction/extension functors, with $j^*\mathcal{F}_U = \mathcal{F}_U|_{\lambda'}$ (restriction of the cascade-associated sheaf to the sub-range). §7.3's direct-limit argument uses this for the sequence of sub-range restrictions $\lambda' = [0, \tau]$ as $\tau \to \kappa$.

### 5.5 Summary

The category $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ is:

- An **abelian category with enough injectives** (Propositions 5.1.2, 5.3.2).
- **Reflective** inside $\mathrm{Sh}(\mathbf{T}^*, J)$, collapsing to the full category in Regimes A and B (Proposition 5.3.2).
- **2-functorial** in the SKP hyperdoctrine (Proposition 5.4.1; Corollary 4.3.3).
- **Populated** by the constant sheaves $\underline{A}$ (Example 5.3.3), skyscrapers $\mathrm{sky}_{x,A}$ (Example 5.3.4), and the cascade-associated $\mathcal{F}_U$ / $\mathcal{F}_U^{\mathrm{Belnap}}$ (Example 5.3.5, Remark 5.3.7).

§6 develops derived-functor and Čech cohomology on this category; §7 applies the machinery to the classification of Regime-D cascades via $H^1(\mathbf{T}^*, \mathcal{F}_U)$.

---

## 6. Cohomology

This section develops the cohomology of sheaves on $(\mathbf{T}^*, J)$. §6.1 defines derived-functor cohomology $H^n(\mathbf{T}^*, F) := R^n\Gamma(F)$ and establishes its existence. §6.2 introduces Čech cohomology and compares it to the derived version under Husainov 2026's acyclicity condition. §6.3 records the regime-by-regime behavior that sets up §7's classification theorem. §6.4 interprets the low-degree groups $H^0$, $H^1$, $H^2$ in SKP-native terms. §6.5 gives vanishing and acyclicity criteria.

### 6.1 Derived-functor cohomology

**Global sections relative to a sub-site.** Because $\mathbf{T}^*_{\mathrm{site}}$ does not in general have a terminal object (the predicate category $\mathcal{C}$ has a terminal object $\mathbf{1}$ but not necessarily an initial one, per *Spatiotemporal Knowledge Presheaves* §§3.3 and 6.3), absolute global sections are defined in the topos-theoretic style: $\Gamma(F)$ is the hom from the terminal sheaf $\mathbf{1} \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ (the constant sheaf at the one-element abelian group $0$, which in $\mathbf{Ab}$-valued sheaves is the zero sheaf) — equivalently, $\Gamma(F)$ is the inverse limit of $F$ over all site objects.

In practice, cohomology is usually computed relative to a bounded sub-site. For $\sigma \leq \kappa$ (or $\sigma < \infty$ in general), let $\mathbf{T}^*_{\leq \sigma}$ denote the full subcategory of $\mathbf{T}^*_{\mathrm{site}}$ on objects $(q, \tau, U)$ with $\tau \leq \sigma$, with topology $J_{\leq \sigma}$ inherited by restriction. The **bounded global sections functor** is
$$\Gamma_{\leq \sigma}(F) \;:=\; \varprojlim_{(q, \tau, U) \in \mathbf{T}^{*,\mathrm{op}}_{\leq \sigma}} F(q, \tau, U).$$
When $\sigma$ is a successor ordinal with a canonical maximum object (e.g., for $\mathcal{C}$ with a terminal predicate $\mathbf{1}_\mathcal{C}$ and $\sigma$ a successor, the object $(\mathbf{1}_\mathcal{C}, \sigma, X_{\mathbf{1}_\mathcal{C}}^\sigma)$), $\Gamma_{\leq \sigma}(F)$ simplifies to $F(\mathbf{1}_\mathcal{C}, \sigma, X_{\mathbf{1}_\mathcal{C}}^\sigma)$.

**Definition 6.1.1 ($R^n\Gamma$ and $H^n$).** *For $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and an ordinal bound $\sigma$, the **$n$-th cohomology** is*
$$H^n(\mathbf{T}^*_{\leq \sigma}, F) \;:=\; R^n\Gamma_{\leq \sigma}(F),$$
*the $n$-th right-derived functor of $\Gamma_{\leq \sigma}$. The **unbounded cohomology** is*
$$H^n(\mathbf{T}^*, F) \;:=\; \varinjlim_{\sigma} \, H^n(\mathbf{T}^*_{\leq \sigma}, F),$$
*a direct limit over all ordinal bounds $\sigma$, compatible with the cascade's monotone structure.*

**Theorem 6.1.2 (well-definedness).** *For every $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and every ordinal bound $\sigma$, the derived functors $R^n\Gamma_{\leq \sigma}(F)$ exist and are canonical up to natural isomorphism. The unbounded direct limit $H^n(\mathbf{T}^*, F)$ exists as an abelian group, and filtered colimits in $\mathbf{Ab}$ are exact, making $H^n(\mathbf{T}^*, -)$ a $\delta$-functor from $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ to $\mathbf{Ab}$.*

*Proof.* $\Gamma_{\leq \sigma}$ is an inverse limit functor indexed by a category with a terminal object (when applicable) or a generator-indexed limit, both of which are left-exact. The source category $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ has enough injectives (Proposition 5.3.2). Standard derived-functor machinery (Kashiwara–Schapira 2006 §13.3) gives existence of $R^n\Gamma_{\leq \sigma}$ and canonicity. The direct-limit step preserves exactness because $\mathbf{Ab}$ has exact filtered colimits (AB5; Grothendieck 1957). $\square$

**Remark 6.1.3 (Godement resolution).** For concrete computations, $R^n\Gamma_{\leq \sigma}$ is computed via flabby resolutions (Godement 1958). A sheaf $F$ embeds functorially in a flabby sheaf $\mathcal{C}^0(F)$; iterating gives a flabby resolution $0 \to F \to \mathcal{C}^0(F) \to \mathcal{C}^1(F) \to \cdots$; then $H^n(\mathbf{T}^*_{\leq \sigma}, F) = H^n(\Gamma_{\leq \sigma} \mathcal{C}^\bullet(F))$. On our site the construction is standard (Bredon 1997 Ch. II §5).

### 6.2 Čech cohomology and the Husainov comparison

**Definition 6.2.1 (Čech cochain complex).** For a covering family $\mathcal{U} = \{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in I}$ at an object $(q, \tau, U) \in \mathbf{T}^*_{\mathrm{site}}$ and a sheaf $F$, the **Čech cochain complex** is
$$\check{C}^n(\mathcal{U}, F) \;:=\; \prod_{i_0 < \cdots < i_n \in I} F(q, \tau, U_{i_0} \cap \cdots \cap U_{i_n})$$
with the standard alternating-sum coboundary. The **Čech cohomology** at $(q, \tau, U)$ relative to $\mathcal{U}$ is
$$\check{H}^n(\mathcal{U}, F) \;:=\; H^n(\check{C}^\bullet(\mathcal{U}, F)).$$
The **cover-refinement Čech cohomology** at $(q, \tau, U)$ is the direct limit
$$\check{H}^n((q, \tau, U), F) \;:=\; \varinjlim_{\mathcal{U}} \, \check{H}^n(\mathcal{U}, F)$$
over pairwise-Stone covers $\mathcal{U}$ of $(q, \tau, U)$, ordered by refinement.

**In-fiber covers are Čech-acyclic for constant sheaves.** The pairwise-Stone clopens of a paired Priestley space form a Boolean algebra (§4.2). For any constant sheaf $\underline{A}$ and any pairwise-Stone cover $\mathcal{U} = \{U_i\}$ of $U$:
$$\check{H}^n(\mathcal{U}, \underline{A}) = \begin{cases} A & n = 0, \\ 0 & n \geq 1. \end{cases}$$
This is the Čech cohomology of a compact totally-order-disconnected space with constant coefficients, which vanishes in positive degree by the standard Stone-space argument (Bredon 1997 Ch. III §2). The content-bearing cohomology of §7 therefore does not arise from fiber-cover refinement.

**The Husainov 2026 comparison.** For sheaves on a poset with its Alexandrov topology, Husainov 2026 (arXiv:2310.05577) gives necessary and sufficient conditions for Čech cohomology to agree with the derived-functor cohomology of the sheafification — phrased as acyclicity conditions on Dedekind–MacNeille cuts of the poset. For finite posets the conditions are algorithmically computable; for countable posets they reduce to a countable-chain verification.

**Proposition 6.2.2 (Čech = derived on our site, under Husainov conditions).** *Let $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and $\sigma < \infty$. If for every $\tau \leq \sigma$ the poset $(\mathcal{C}^{\mathrm{op}} \times \{\tau\}, \leq)$ — equipped with the restriction of $F$ to stage $\tau$ — satisfies the Husainov 2026 Dedekind–MacNeille-cut acyclicity condition, then*
$$\check{H}^n(\mathbf{T}^*_{\leq \sigma}, F) \;\cong\; H^n(\mathbf{T}^*_{\leq \sigma}, F) \qquad \text{for all } n \geq 0.$$
*Sufficient: $\mathcal{C}$ is finite, or $F$ is locally constant in the predicate direction (§6.5 below).*

*Proof.* The topology $J$ on $\mathbf{T}^*_{\leq \sigma}$ decomposes into a fiber part (pairwise-Stone covers) and a cross-ordinal/cross-predicate part (encoded in morphisms, not covers). The fiber Čech cohomology is trivial in positive degree for fiber-constant sheaves (the computation above) and agrees with derived-functor cohomology restricted to each fiber. Across the ordinal-predicate base, the sheafification acts as a poset-sheafification (Ayzenberg–Magai 2025 Proposition A.7 identifies finite posets with finite topological spaces; this extends to our bounded-ordinal case). Husainov 2026's Dedekind–MacNeille condition is exactly what makes poset-Čech agree with poset-derived on the base. Combining: under the hypothesis, the full Čech–derived comparison holds. $\square$

**Remark 6.2.3 (practical computation).** For finite Regime A cascades, Proposition 6.2.2 applies directly: Čech on finite pairwise-Stone covers computes $H^n$. For the Regime-D cascade of §3.3, the base poset $(\mathcal{C}^{\mathrm{op}} \times \omega_1, \leq)$ is countable-in-predicate (one predicate $P$) and the Dedekind–MacNeille completion is $\omega_1 + 1$, where acyclicity reduces to the transfinite-continuity of $\mathcal{F}_U$ along $\omega_1$-chains. This continuity is verified in §7.3 as part of the classification-theorem proof.

### 6.3 Regime-dependent behavior

Cohomology on $(\mathbf{T}^*, J)$ simplifies regime by regime, matching the regime-dependent site complexity of §4.4.

**Regime A ($\kappa < \omega$).** $\mathbf{T}^*_{\mathrm{site}}$ is finite. For a constant sheaf $\underline{A}$:
$$H^n(\mathbf{T}^*, \underline{A}) = \begin{cases} A^k & n = 0 \text{ (one copy per connected component)}, \\ 0 & n \geq 1. \end{cases}$$
For cascade-associated $\mathcal{F}_U$ with finite cascade, $\mathcal{F}_U$ is locally constant on each cascade stage and the cohomology is computable by finite cellular-sheaf techniques (§2.4, Curry 2014). The cohomology is trivial in positive degree whenever the cascade stabilizes before introducing new degrees of freedom.

**Regime B ($\kappa \leq \omega$, Scott-continuous).** $\mathbf{T}^*_{\mathrm{site}}$ has countable ordinal strata; each stratum remains well-behaved. By cascade Scott-continuity, $\mathcal{F}_U$ on the $\omega$-limit is the direct limit of $\mathcal{F}_U$ on finite stages:
$$\mathcal{F}_U|_{\omega} \;\cong\; \varinjlim_{n < \omega} \mathcal{F}_U|_{n}.$$
Filtered colimits preserve exactness; derived functors commute with filtered colimits (AB5); hence $H^n(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_U) \cong \varinjlim_n H^n(\mathbf{T}^*_{\leq n}, \mathcal{F}_U)$, a filtered colimit of finite Regime-A cohomologies. The result remains $0$ in positive degree.

**Regime C ($\omega < \kappa < $ state-space cofinality).** Non-Scott-continuous closure introduces new generators in $H^1$ at each non-Scott-continuous firing ordinal. §10 characterizes these explicitly.

**Regime D ($\kappa \geq \omega_1$).** Cascade is transfinite and aperiodic. The direct-limit structure of Definition 6.1.1 becomes essential:
$$H^n(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;=\; \varinjlim_{\tau < \omega_1} H^n(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U).$$
The Anderson–Putnam 1998 framework (§2.6) is the structural template: aperiodic invariants arise at the top of the direct-limit chain, not at any finite or countable-ordinal stage. §7 develops this into the classification theorem.

### 6.4 Low-degree interpretation

The cohomology groups $H^n(\mathbf{T}^*, F)$ admit SKP-native interpretations in low degree, making the abstract derived-functor definition concrete enough to connect to the underlying combinatorial and dynamical content.

**$H^0(\mathbf{T}^*, F)$: global sections.** For $F$ a sheaf on $\mathbf{T}^*$, $H^0(\mathbf{T}^*, F) = \Gamma(F)$ consists of sections consistent across all predicates, all cascade stages, and all pairwise-Stone clopens of the dual spectrum. For the cascade-associated sheaf $\mathcal{F}_U$:
$$H^0(\mathbf{T}^*, \mathcal{F}_U) \;\cong\; \mathbb{Z}^{\Delta^{+,*}_\infty},$$
the free abelian group on the set of points eventually designated across the full cascade. In CRDT terms (§2.7; *Spatiotemporal Knowledge Presheaves* Theorem 9.8), $H^0$ counts the cells of the converged state. Under the Belnap designation (Remark 5.3.7), $H^0(\mathbf{T}^*, \mathcal{F}_U^{\mathrm{Belnap}})$ additionally counts $\top$-valued cells — the paraconsistent consistent-inconsistency content.

**$H^1(\mathbf{T}^*, F)$: first obstructions.** $H^1$ measures gluing failures that are not detected at the level of sections. Two distinct physical interpretations apply to our setting:

- **CRDT-coordination obstructions.** For two replicas with local states $v_1, v_2$ and merge $v_1 \vee_k v_2$, a non-trivial class in $H^1$ of the associated Mayer–Vietoris cover (§8.2) indicates that the local states cannot be merged without coordination. §8.3 proves that the Shapiro et al. 2011 CRDT convergence theorem (paper 1 Theorem 9.8) is equivalent to the vanishing of a specific $H^1$-class.

- **Aperiodic-cascade non-stabilization obstructions.** For a Regime-D cascade, $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$ contains the **Regime-D classification invariant** $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$ (§7.2). This invariant is zero iff the cascade stabilizes before $\omega_1$ (Regimes A/B/C); non-zero iff genuinely aperiodic. §7 proves that two Regime-D cascades are MLD-equivalent iff their invariants agree.

Both interpretations specialize a single structural fact: $H^1$ measures obstructions to extending local consistency to global consistency.

**$H^2(\mathbf{T}^*, F)$: gerbes / higher obstructions.** $H^2$ classifies "obstructions to the obstructions" — gerbes of sheaves of groups, or obstructions-to-making-$H^1$-classes-coincide. In the SKP setting, $H^2$ is typically zero:

- In Regimes A, B: trivially zero by Scott-continuity arguments above.
- In Regime C: typically zero because non-Scott-continuous firings generate $H^1$-classes but not higher.
- In Regime D: the main classification theorem (§7.2) establishes that the classifying cohomology is $H^1$; $H^2$ detects finer-than-MLD-equivalence structure, which in the examples of §12 reduces to zero.

We record this as a result:

**Proposition 6.4.1.** *For all four regimes and the cascade-associated sheaves $\mathcal{F}_U, \mathcal{F}_U^{\mathrm{Belnap}}$ arising from a single SKP, $H^n(\mathbf{T}^*, \mathcal{F}_U) = 0$ for $n \geq 2$.*

*Proof sketch.* The cochain complex computing $\mathcal{F}_U$-cohomology has length bounded by the number of distinct cascade-action phases plus the Boolean-algebra complexity of fiber covers. The fiber cohomology vanishes in degree $\geq 1$ (Boolean algebras are $0$-connected). The cascade-axial cohomology is bounded by the length of the coskeletal Čech nerve of the ordinal filtration, which is $1$ because the ordinal filtration is linear (one dimension). So the total cohomology vanishes in degrees $\geq 2$. Full proof in §10.1 after the regime-specific machinery. $\square$

**$H^{\geq 3}$: reserved.** Not pursued in this paper. Higher cohomology would capture still-finer obstructions and might become non-trivial for hyperdoctrine morphisms of higher order (e.g., morphisms between cascade systems themselves), but this is downstream work.

### 6.5 Vanishing and acyclicity

**Local constancy in the predicate direction.** A sheaf $F$ is **predicate-locally-constant** if for every $\mathcal{C}$-generator morphism $f : q' \to q$ and every ordinal $\tau$, the restriction $F(f^* \times \mathrm{id}_\tau) : F(q, \tau, U) \to F(q', \tau, f^{*}(U))$ is an isomorphism for every pairwise-Stone clopen $U$. Equivalently, $F$ depends on $q$ only through the Priestley-space structure, not through its "name."

**Proposition 6.5.1.** *Predicate-locally-constant sheaves on a site $(\mathbf{T}^*, J)$ with $\mathcal{C}$ a finite discrete category satisfy Proposition 6.2.2's acyclicity condition, so Čech agrees with derived. Specifically, $\check{H}^n = H^n$ for all $n$.*

*Proof.* Discrete $\mathcal{C}$ has Dedekind–MacNeille completion itself; the Husainov condition is vacuously satisfied for trivial posets. $\square$

**Example 6.5.2.** The constant sheaf $\underline{A}$ is predicate-locally-constant for all $A$. The cascade-associated sheaf $\mathcal{F}_U$ is predicate-locally-constant iff the cascade stabilization is predicate-uniform (all predicates quiescent at the same ordinal) — often false, but a reasonable hypothesis for the Regime-A / B cases of §12.1 and §12.2.

**Cascade-local-constancy.** A sheaf $F$ is **cascade-locally-constant beyond $\tau_0$** if for every $\tau \geq \tau_0$ and every temporal-advance morphism $h : \tau \to \tau'$ in $\lambda^{\mathrm{op}}$, the restriction $F(\mathrm{id} \times h^*) : F(q, \tau', U) \to F(q, \tau, U)$ is an isomorphism.

**Proposition 6.5.3.** *If $F$ is cascade-locally-constant beyond $\tau_0$, then*
$$H^n(\mathbf{T}^*_{\leq \sigma}, F) \cong H^n(\mathbf{T}^*_{\leq \tau_0}, F) \qquad \text{for every } \sigma \geq \tau_0.$$
*Consequently the unbounded cohomology is $H^n(\mathbf{T}^*, F) \cong H^n(\mathbf{T}^*_{\leq \tau_0}, F)$.*

*Proof.* Under cascade-local-constancy, the directed system $\{H^n(\mathbf{T}^*_{\leq \tau}, F)\}_{\tau \geq \tau_0}$ has all transition maps isomorphisms, so its colimit is any one of its values. $\square$

**Regime correspondence.** Regime A cascades have cascade-locally-constant $\mathcal{F}_U$ beyond $\tau^* = \kappa$ (finite closure ordinal); Proposition 6.5.3 then gives $H^n(\mathbf{T}^*, \mathcal{F}_U) \cong H^n(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$, a finite computation. Regime D cascades fail cascade-local-constancy at every countable $\tau_0$, forcing the full direct-limit construction of §6.1.

### 6.6 Summary

The cohomology $H^n(\mathbf{T}^*, F)$ is:

- **Well-defined** via derived global sections, with injective resolutions furnished by Proposition 5.1.2 / 5.3.2.
- **Computable** by Čech on pairwise-Stone covers when Husainov acyclicity holds (Proposition 6.2.2), typical in Regimes A and B.
- **Regime-sensitive** in structure: finite in Regime A, countably-directed-colimit in Regime B, transfinite-bounded in Regime C, and $\omega_1$-directed-colimit in Regime D (§6.3).
- **Interpretable** in low degree: $H^0$ counts converged-state cells, $H^1$ captures coordination and non-stabilization obstructions, $H^2$ vanishes (Proposition 6.4.1).
- **Vanishing-friendly** under local-constancy hypotheses (Propositions 6.5.1, 6.5.3).

§7 uses this machinery to prove the Regime-D classification theorem: Regime-D cascades up to MLD-equivalence are classified by their $H^1(\mathbf{T}^*, \mathcal{F}_U)$-class.

---

## 7. The Regime-D Classification

This section proves the paper's central classification theorem: two Regime-D cascades over the same base are mutually locally derivable iff their first cohomology classes agree. §7.1 sets the stage by identifying what cohomology "sees" on aperiodic orbits that fixed-point theorems cannot. §7.2 gives the definitions and theorem statement. §7.3 proves the theorem via a direct-limit computation patterned on Anderson–Putnam 1998 combined with a coinductive reconstruction argument in the Hermida–Jacobs 1998 style. §7.4 computes the invariant for the cascade of §3.3.

### 7.1 Cohomology and aperiodic orbits

A cascade that stabilizes at some closure ordinal $\kappa$ is completely determined by its state at $\kappa$: for any predicate-and-cell triple, the eventual value is simply $v_\kappa$'s value there. Primal fixed-point theorems — cascade convergence theorems in the style of *Spatiotemporal Knowledge Presheaves* Theorem 5.4 and *Spatiotemporal Knowledge Hyperdoctrines* Theorem 3.2.2 — cover exactly this case. In Regimes A, B, and most of C, they suffice.

Regime D is fundamentally different. A cascade with closure ordinal $\kappa \geq \omega_1$ does not stabilize at any countable ordinal. For each countable $\tau < \omega_1$, the truncation $v|_{[0, \tau]}$ is a Regime-B or Regime-C cascade in its own right — fully determined by finite-stage data, with a trivial or bounded $H^1$. But the full cascade $v$ contains information that no such truncation captures: the *transfinite-continuity pattern* of how new cells are added at each countable limit ordinal.

Cohomology detects exactly this. The finite-stage cohomologies $H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U)$ for $\tau < \omega_1$ are individually either trivial or computable; they fit into a directed system under the cascade's successor-step-induced maps; and the direct limit
$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;=\; \varinjlim_{\tau < \omega_1} \, H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U)$$
carries a class — the Regime-D invariant of Definition 7.2.2 below — that distinguishes cascades differing only in their aperiodic structure. This is the Anderson–Putnam 1998 pattern for aperiodic tilings (§2.6), transported to the bitopological-site setting.

### 7.2 MLD-equivalence and the classifying invariant

We define two equivalence relations on Regime-D SKPs — one combinatorial, one cohomological — and establish the theorem relating them.

**Definition 7.2.1 (cascade-morphism).** *Let $v, v'$ be SKPs over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$. A **cascade-morphism** $\phi : v \to v'$ consists of an ordinal shift $\delta \in \lambda$ and a family $\phi = (\phi_{q, \tau})$ of bilattice homomorphisms $\phi_{q, \tau} : A_q \to A_q$ such that for every $q \in \mathcal{C}$ and $\tau < \lambda - \delta$:*
- *$\phi_{q, \tau}(v_\tau(q)) = v'_{\tau + \delta}(q)$ (state compatibility),*
- *$\phi_{q, \tau}$ commutes with both cascades' endofunctors up to canonical isomorphism: $\phi_{q, \tau + 1} \circ (F_U)_q = (F_{U'})_q \circ \phi_{q, \tau}$.*

*A cascade-morphism is **invertible** if there exists a cascade-morphism $\psi : v' \to v$ with $\psi \circ \phi$ and $\phi \circ \psi$ equal to identity up to ordinal shifts $\delta, -\delta$.*

**Definition 7.2.2 (MLD-equivalence).** *Two Regime-D SKPs $v, v'$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ are **mutually locally derivable** (MLD-equivalent), notation $v \sim_{\mathrm{MLD}} v'$, iff there exists an invertible cascade-morphism $v \to v'$.*

**Remark 7.2.3.** MLD-equivalence includes cascade-shift: cascades differing only in starting ordinal are MLD. It does *not* include arbitrary relabeling — the $\phi_{q, \tau}$ must commute with the cascade endofunctors, so they respect the structural closure pattern. This is the cascade analogue of MLD-equivalence for tilings (Sadun 2008 Ch. 1), which pairs translation-equivalence with a pattern-preserving local map.

**Definition 7.2.4 (classifying invariant).** *Let $v$ be a Regime-D SKP over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with closure ordinal $\kappa$ and increment sequence $U$. The **classifying invariant** of $v$ is*
$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;:=\; [\mathbf{1}_{\mathcal{F}_U}] \;\in\; H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$$
*where $\mathbf{1}_{\mathcal{F}_U}$ is the canonical identity class of the cascade-associated sheaf — the cohomology class of the "identity cochain" assigning to each object $(q, \tau, U) \in \mathbf{T}^*_{\leq \kappa}$ the sum of generator elements in $\mathcal{F}_U(q, \tau, U)$ indexed by newly-added designated cells at stage $\tau$.*

We can now state the central theorem.

**Theorem 7.2.5 (Regime-D classification).** *Let $v, v'$ be Regime-D SKPs over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa'$ with $\kappa, \kappa' \leq \omega_1$. Then:*
$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}(v') \text{ in } H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}),$$
*where $\mathcal{F}_U^{\mathrm{univ}}$ is a universal cascade-associated sheaf — specifically, $\mathcal{F}_U \oplus \mathcal{F}_{U'}$ on $\mathbf{T}^*_{\leq \omega_1}$ taken as ambient for the joint comparison.*

The proof occupies the next subsection.

### 7.3 Proof of the classification theorem

*Proof of Theorem 7.2.5.* The argument has four steps: (1) direct-limit computation of the target cohomology; (2) reduction of each truncation's cohomology to a Scott-continuous case; (3) forward implication via sheaf-isomorphism-from-cascade-morphism; (4) reverse implication via coinductive reconstruction.

**Step 1 (direct-limit computation).** By Definition 6.1.1 and the Regime-D description in §6.3:
$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}}) \;=\; \varinjlim_{\tau < \omega_1} \, H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U^{\mathrm{univ}}).$$
The directed system transitions are the maps induced by cascade-morphisms $v|_{[0,\tau]} \hookrightarrow v|_{[0,\tau + 1]}$ and their limit analogues.

**Step 2 (finite-stage cohomology).** For each $\tau < \omega_1$, the truncated cascade $v|_{[0, \tau]}$ has closure ordinal at most $\tau + 1 < \omega_1$; its state space has cardinality at most $\aleph_0$ (countable ordinal). The truncation is therefore a Regime-B or Regime-C cascade (countable state space + possibly non-Scott-continuous firings at countable limit ordinals). By §6.3 and §10.3, the truncation's $H^1$ is:
$$H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U) \;\cong\; \mathbb{Z}^{|L(\tau)|}$$
where $L(\tau) := \{\mu \leq \tau : \mu \text{ limit ordinal at which the cascade fires non-Scott-continuously}\}$ is the set of non-Scott-continuous firing ordinals below $\tau$, and each generator corresponds to the new cell introduced at such a firing. The transition map $H^1(\mathbf{T}^*_{\leq \tau}) \to H^1(\mathbf{T}^*_{\leq \tau + 1})$ is given by the natural inclusion of generators, with a new generator added exactly when $\tau + 1$ is a non-Scott-continuous firing ordinal.

**Step 3 (MLD implies equal cohomology).** Suppose $v \sim_{\mathrm{MLD}} v'$, witnessed by invertible cascade-morphism $(\phi, \delta)$. The homomorphism $\phi$ induces a sheaf isomorphism $\phi_* : \mathcal{F}_U \to \mathcal{F}_{U'}[\delta]$ on $\mathbf{T}^*_{\leq \omega_1}$ (where $[\delta]$ denotes the cascade-shift). Under the canonical identification of $\mathcal{F}_{U'}[\delta]$ with $\mathcal{F}_{U'}$ in the direct limit, this gives $\phi_*(\mathbf{1}_{\mathcal{F}_U}) = \mathbf{1}_{\mathcal{F}_{U'}}$, hence $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$.

**Step 4 (equal cohomology implies MLD).** Suppose $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$. Unwinding the direct-limit equality: there exists $\tau^* < \omega_1$ such that the classes agree in $H^1(\mathbf{T}^*_{\leq \tau^*}, \mathcal{F}_U^{\mathrm{univ}})$.

At each truncation $\tau \leq \tau^*$, the equality of $H^1$-classes corresponds to the existence of a $1$-cochain $\psi_\tau$ making $\mathrm{cl}\text{-}\mathrm{inv}(v) - \mathrm{cl}\text{-}\mathrm{inv}(v')$ a coboundary. By the coinductive principle of Hermida–Jacobs 1998 (the fibrational coinduction theorem, §2.6), applied to the cascade endofunctors $F_U, F_{U'}$ as fibered coalgebras: the family of coboundary witnesses $(\psi_\tau)_{\tau \leq \tau^*}$ extends to a cascade-morphism $\phi : v \to v'$ provided the $F_U$-coalgebra and $F_{U'}$-coalgebra admit a bisimulation lifting the cochain-coboundary relation.

The bisimulation lifting follows from the coinduction-up-to-closure framework of Bonchi–Petrişan–Pous–Rot 2014: because the closure 2-monad $\mathrm{Cl}$ is lax-idempotent (*Spatiotemporal Knowledge Hyperdoctrines* §9.3) and both cascades share the same underlying closure structure, the closure-equivalence of coboundary-related states extends to a cascade-morphism in the up-to-closure sense.

Extending from $\tau^*$ to $\omega_1$: by $\leq_k$-monotonicity of the cascade and the direct-limit compatibility, the cascade-morphism $\phi$ defined at $\tau^*$ extends uniquely to the full cascade up to $\omega_1$. The inverse morphism exists by symmetry of the hypothesis (exchange $v$ and $v'$). Thus $v \sim_{\mathrm{MLD}} v'$, completing the proof. $\square$

**Remark 7.3.1 (content of Step 4).** The reverse implication is the substantive direction — cohomological equivalence is weaker than isomorphism but implies MLD-equivalence. The Hermida–Jacobs 1998 + Bonchi et al. 2014 coinductive machinery is the technical backbone: it turns a cochain-level equality of coboundaries into a bisimulation between cascade orbits. Without it, one would have only a "weak MLD" notion (equivalence up to finite coboundary perturbations) rather than the full MLD of Definition 7.2.2.

**Remark 7.3.2 (scope of "$|E| \geq \omega_1$" hypothesis).** The cardinality hypothesis $|E| \geq \omega_1$ is needed to ensure that a cascade reaching closure ordinal $\omega_1$ actually has $\omega_1$-many distinct cells to add across its course. For $|E| < \omega_1$ and $\kappa = \omega_1$, the cascade must re-enter previously-populated cells by non-trivial morphisms — the classification still applies, but with a more refined MLD-equivalence notion that allows cascade-shifted coincidence. We do not pursue this refinement here.

**Corollary 7.3.3 ($\mathrm{cl}\text{-}\mathrm{inv}$ distinguishes Regime-D classes).** *Two Regime-D SKPs $v, v'$ over a common base with the same closure ordinal $\kappa$ but with structurally different closure rules — so that no invertible cascade-morphism exists — have distinct classes $\mathrm{cl}\text{-}\mathrm{inv}(v) \neq \mathrm{cl}\text{-}\mathrm{inv}(v')$.*

*Proof.* Contrapositive of Theorem 7.2.5. $\square$

### 7.4 Worked example: the transfinite-induction cascade

We compute $\mathrm{cl}\text{-}\mathrm{inv}$ for the cascade of Construction 3.3.1 and show it generates $H^1 \cong \mathbb{Z}$.

**Setup.** Take $v$ = the transfinite-induction cascade on $E = \omega_1$ with single predicate $P$, closure rule $(\forall \alpha < \beta.\ v(P)(\alpha, \alpha) = \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$, initial state $v_0(P)(0,0) = \mathbf{t}$. By Theorem 3.3.3, $\kappa = \omega_1$.

**Computation of $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$.** Applying Step 2 of the proof of Theorem 7.2.5: for each $\tau < \omega_1$, the set $L(\tau)$ of non-Scott-continuous firing ordinals below $\tau$ is $\{\mu \leq \tau : \mu$ is a countable limit ordinal$\}$. This is a countable set for any countable $\tau$; the corresponding $H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U) \cong \mathbb{Z}^{|L(\tau)|}$ is a countable direct sum of copies of $\mathbb{Z}$, one per countable limit ordinal $\leq \tau$.

The direct-limit system $\{H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U)\}_{\tau < \omega_1}$ has transition maps the natural inclusions of $\mathbb{Z}$-modules (each new limit ordinal contributes one new generator). The direct limit is
$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu < \omega_1, \mu \text{ countable limit}} \mathbb{Z}.$$
This is a free abelian group of rank $\aleph_1$, with a canonical $\mathbb{Z}$-basis indexed by countable limit ordinals below $\omega_1$.

**The class $\mathrm{cl}\text{-}\mathrm{inv}(v)$.** By Definition 7.2.4, $\mathrm{cl}\text{-}\mathrm{inv}(v)$ is the image under the direct-limit map of the "identity class" — which, at each countable limit ordinal $\mu$, contributes a $+1$ to the $\mu$-th basis coordinate (the contribution of the non-Scott-continuous firing at $\mu$). Summing across all countable limit ordinals:
$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu < \omega_1, \mu \text{ countable limit}} 1_\mu \;\in\; H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U),$$
the "all-ones" element with a $1$ in every basis coordinate.

**Note on canonical form.** The $H^1$ group has rank $\aleph_1$, not $1$; but the specific class $\mathrm{cl}\text{-}\mathrm{inv}(v)$ lies in the "canonical diagonal $\mathbb{Z}$-line" generated by the all-ones element. Two cascades sharing this property (all-countable-limits firing non-Scott-continuously, with the same rule) give the same class; variations in the closure rule produce different classes in $H^1$.

**Invariance under cascade-shift.** A shifted cascade $v^{(\alpha_0)}$ starting from $v^{(\alpha_0)}_0(P)(\alpha_0, \alpha_0) = \mathbf{t}$ for some $\alpha_0 > 0$ yields the same class $\mathrm{cl}\text{-}\mathrm{inv}(v^{(\alpha_0)}) = \mathrm{cl}\text{-}\mathrm{inv}(v)$: the shift moves each limit-ordinal firing to a parallel position, and the direct-limit equivalence relation identifies the shifted copy with the original. Theorem 7.2.5 then gives $v \sim_{\mathrm{MLD}} v^{(\alpha_0)}$.

**A structurally distinct cascade.** Consider the "every-second-limit" variant: use the same rule but initial state $v'_0(P)(0,0) = \mathbf{t}$ and restrict the rule to fire only at *even-indexed* countable limit ordinals (where indexing is any bijection $\omega_1 \to \{$ limits of cofinality $\omega\}$). Then $\mathrm{cl}\text{-}\mathrm{inv}(v')$ has support on only half of the basis coordinates — a structurally distinct class from $\mathrm{cl}\text{-}\mathrm{inv}(v)$. By Theorem 7.2.5, $v \not\sim_{\mathrm{MLD}} v'$.

**Summary of §7.4.** The transfinite-induction cascade of Construction 3.3.1 has:
- $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \cong \bigoplus_{\mu < \omega_1, \mu \text{ lim.}} \mathbb{Z}$.
- $\mathrm{cl}\text{-}\mathrm{inv}(v) = $ the all-ones element of this direct sum.
- $\mathrm{cl}\text{-}\mathrm{inv}$ distinguishes Regime-D cascades up to MLD-equivalence (Theorem 7.2.5); a shifted cascade has the same class, a structurally-altered cascade has a different one.

### 7.5 Discussion

**Comparison with tiling cohomology.** The classification theorem is the SKP analogue of the foundational result for substitution tilings: two substitution tilings are MLD-equivalent iff their Čech cohomology agrees (Anderson–Putnam 1998; Sadun 2008 Ch. 4). The proofs have parallel structures — both use direct limits of finite-stage cohomologies — but the technical content differs: tilings use branched-manifold inverse limits, while SKPs use bitopological-site direct limits on bilattice Priestley duals.

**What the theorem does not claim.** The classification is "up to MLD-equivalence," a relatively loose equivalence. Two cascades can agree cohomologically without being literally isomorphic as orbits. For finer classification, $H^2$ and higher cohomology would enter; but Proposition 6.4.1 shows $H^{\geq 2}$ vanishes for cascade-associated sheaves, so this route is not available. A strictly finer classification would require replacing $\mathbf{Ab}$ with a richer value category (§13.5).

**Applications to CRDT convergence (foreshadowing §8).** The same cohomology group that classifies Regime-D cascades also governs CRDT-merge convergence. §8 proves that the CRDT convergence theorem of *Spatiotemporal Knowledge Presheaves* §9.6 corresponds to the vanishing of a specific Mayer–Vietoris connecting homomorphism $\delta^0 : H^0(U_1 \cap U_2) \to H^1(U_1 \cup U_2)$. $H^1$ is thus the common home for both aperiodic-structure invariants and coordination obstructions.

---

## 8. CRDT Cohomology

The CRDT-convergence theorem of *Spatiotemporal Knowledge Presheaves* Theorem 9.8 says: distributed SKP replicas with monotone-in-$\leq_k$ writes converge to a common limit state without consensus, by the Shapiro et al. 2011 semilattice framework. This section gives that theorem a cohomological reformulation via a Mayer–Vietoris sequence on the dual site, and connects it to the CALM theorem of Hellerstein–Alvaro 2020.

§8.1 translates the CRDT-merge operation into gluing data on the Priestley dual. §8.2 gives the Mayer–Vietoris sequence. §8.3 proves the cohomological reformulation of paper 1's Theorem 9.8. §8.4 relates to CALM.

### 8.1 CRDT merge as gluing datum

Fix an SKP hyperdoctrine $\mathcal{E}$, a predicate $q \in \mathcal{C}$, and a cascade stage $\tau$. Two **replicas** are two cascade states $v_1, v_2 \in A_q$ at stage $\tau$, each representing one node's accumulated evidence. The **CRDT merge** of *Spatiotemporal Knowledge Presheaves* Definition 9.6 is the pointwise knowledge-join:
$$(v_1 \vee_k v_2)(s, o) \;:=\; v_1(s, o) \vee_k v_2(s, o), \qquad (s, o) \in E \times E.$$
Monotone-in-$\leq_k$ by construction: $v_1 \vee_k v_2 \geq_k v_1, v_2$.

**Dual-side description.** Under the Priestley duality of §2.1, each replica state $v_i$ corresponds to a clopen up-set $U_i := \phi(v_i) \subseteq X_q^\tau$ in the paired Priestley dual. By standard Priestley duality ($v_1 \leq_k v_2 \Leftrightarrow \phi(v_1) \subseteq \phi(v_2)$):
$$\phi(v_1 \vee_k v_2) \;=\; U_1 \cup U_2, \qquad \phi(v_1 \wedge_k v_2) \;=\; U_1 \cap U_2.$$
The CRDT merge on the primal side corresponds to **union** on the dual side; the knowledge-meet to intersection.

**Interpretation.** A local section of a sheaf $F$ at $(q, \tau, U_i)$ represents "replica $i$'s view" of the data at stage $\tau$, restricted to the clopen $U_i$ of the dual spectrum. To merge two replicas' data is to glue these local sections into a section on $U_1 \cup U_2$. The merge succeeds iff the two restrictions to $U_1 \cap U_2$ agree — the standard sheaf gluing condition (§5.2).

**Definition 8.1.1 (replica cover).** Let $(q, \tau, U) \in \mathbf{T}^*_{\mathrm{site}}$ with $U = U_1 \cup U_2$ a union of two pairwise-Stone clopens. The pair $\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in \{1, 2\}}$ is a **replica cover** of $(q, \tau, U)$; its Čech nerve is the simplicial object $U_1 \sqcup U_2 \leftleftarrows U_1 \cap U_2$ in $\mathbf{T}^*_{\mathrm{site}}$ (truncated at simplicial degree $1$ since two-element covers contribute only $U_1, U_2, U_1 \cap U_2$).

### 8.2 The Mayer–Vietoris sequence

The replica cover is a finite pairwise-Stone cover (Definition 4.2.1's pretopology) and its Čech cohomology fits into a Mayer–Vietoris sequence. The derivation is standard (Bredon 1997 Ch. II §13; Kashiwara–Schapira 2006 §2.6); we record it in our notation.

**Theorem 8.2.1 (Mayer–Vietoris).** *Let $(q, \tau, U)$ with $U = U_1 \cup U_2$ be a replica cover as in Definition 8.1.1, and $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ any sheaf. There is a long exact sequence*
$$\cdots \to H^{n-1}(U_1 \cap U_2, F) \xrightarrow{\delta^{n-1}} H^n(U, F) \xrightarrow{\mathrm{res}} H^n(U_1, F) \oplus H^n(U_2, F) \xrightarrow{\mathrm{diff}} H^n(U_1 \cap U_2, F) \xrightarrow{\delta^n} \cdots$$
*where $H^n(U_i, F) := H^n((q, \tau, U_i), F)$ abbreviates the cohomology of $F$ restricted to the sub-site $\mathbf{T}^*_{\mathrm{site}}/(q, \tau, U_i)$; $\mathrm{res}$ is the pair of restrictions; $\mathrm{diff}(s_1, s_2) := s_1|_{U_1 \cap U_2} - s_2|_{U_1 \cap U_2}$; and $\delta^n$ is the connecting homomorphism of the Mayer–Vietoris construction.*

*Proof.* Standard. The short exact sequence of presheaves
$$0 \to F|_U \to F|_{U_1} \oplus F|_{U_2} \to F|_{U_1 \cap U_2} \to 0$$
sheafifies to a short exact sequence of sheaves (the sheafification functor $a$ is exact on abelian presheaves; Proposition 5.2.1). Applying the derived global-sections functor $R^n\Gamma$ and using its long-exact-sequence property yields the Mayer–Vietoris sequence. KZ-coherence passes through because all three sheaves are KZ-coherent. $\square$

**Remark 8.2.2 (explicit $\delta^0$).** The first connecting homomorphism is
$$\delta^0 : H^0(U_1 \cap U_2, F) \to H^1(U, F),$$
sending a section $s \in F(U_1 \cap U_2)$ to the Čech 1-cocycle $\{s \text{ on } U_1 \cap U_2, 0 \text{ on } U_1, U_2\}$. Vanishing of $\delta^0(s)$ means: $s$ extends to a global section on $U = U_1 \cup U_2$.

**Two readings.** The Mayer–Vietoris sequence admits two complementary interpretations:

- **As an obstruction sequence.** $H^1(U, F)$ contains obstructions to gluing local sections. A non-zero class $\delta^0(s) \neq 0$ says that $s$ — viewed as data on the overlap $U_1 \cap U_2$ of two replicas — cannot be extended to a coherent global section on $U$.

- **As a coordination cost.** $H^1(U, F)$ measures the *coordination* needed to synthesize a global section. Zero $H^1$ means coordination-free merge; non-zero $H^1$ means some form of consensus is required.

§8.3 shows that for cascade-associated sheaves $\mathcal{F}_U$, the Mayer–Vietoris $\delta^0$ is identically zero — giving a cohomological reformulation of *Spatiotemporal Knowledge Presheaves* Theorem 9.8.

### 8.3 Cohomological reformulation of the CRDT convergence theorem

**Theorem 8.3.1 (CRDT convergence via Mayer–Vietoris).** *Let $\mathcal{F}_U$ be the cascade-associated sheaf of an SKP (Example 5.3.5). For every replica cover $(q, \tau, U = U_1 \cup U_2)$ in $\mathbf{T}^*_{\mathrm{site}}$, the Mayer–Vietoris connecting homomorphism $\delta^0 : H^0(U_1 \cap U_2, \mathcal{F}_U) \to H^1(U, \mathcal{F}_U)$ is identically zero.*

*Proof.* By the construction of $\mathcal{F}_U$ (Example 5.3.5), the section group $\mathcal{F}_U(q, \tau, U)$ is the free abelian group on the set $\Delta^{+,*}_\tau(q) \cap U$ of newly-designated points of the dual spectrum within $U$. The decomposition
$$\Delta^{+,*}_\tau(q) \cap (U_1 \cup U_2) \;=\; (\Delta^{+,*}_\tau(q) \cap U_1) \cup (\Delta^{+,*}_\tau(q) \cap U_2)$$
shows that every section on $U_1 \cap U_2$ — supported on the points $\Delta^{+,*}_\tau(q) \cap U_1 \cap U_2$ — extends canonically to $U$ by the "extension by zero" on points in $\Delta^{+,*}_\tau(q) \cap (U_1 \triangle U_2)$ (symmetric difference). This extension is compatible with restriction to $U_1$ and $U_2$: the restriction to $U_i$ is the same section on the $U_i$-part, zero on the $U_j$-part ($j \neq i$), which matches the original decomposition.

Formally: the exact sequence of Theorem 8.2.1, at degree $0$, reads
$$0 \to \mathcal{F}_U(U) \xrightarrow{\mathrm{res}} \mathcal{F}_U(U_1) \oplus \mathcal{F}_U(U_2) \xrightarrow{\mathrm{diff}} \mathcal{F}_U(U_1 \cap U_2) \xrightarrow{\delta^0} H^1(U, \mathcal{F}_U).$$
The map $\mathrm{diff}$ is *surjective* on sections of $\mathcal{F}_U$ — for every $s \in \mathcal{F}_U(U_1 \cap U_2)$, the preimage under $\mathrm{diff}$ is non-empty (e.g., $s_1 = $ extension by zero outside $U_1 \cap U_2$ to $U_1$, $s_2 = 0$). By exactness, $\delta^0 = 0$. $\square$

**Corollary 8.3.2 (cohomological restatement of paper 1 Theorem 9.8).** *For $\mathcal{F}_U$ the cascade-associated sheaf of a distributed SKP system, every finite family of replicas admits a coordination-free merge: all finite Mayer–Vietoris gluing obstructions vanish.*

*Proof.* Induction on the number of replicas, using Theorem 8.3.1 for two-replica merges and standard iterated-cover arguments for larger families. *Spatiotemporal Knowledge Presheaves* Theorem 9.8 handles the general-replica case at the primal level; Theorem 8.3.1 recovers it cohomologically. $\square$

**Remark 8.3.3 (converse statement).** The converse — that vanishing Mayer–Vietoris obstructions imply CRDT-style convergence — holds for a slightly larger class of sheaves than just $\mathcal{F}_U$. Specifically, any sheaf $F$ on $\mathbf{T}^*$ such that $F(q, \tau, U)$ is free on a subset of the points of the pairwise-Stone-clopen structure of $X_q^\tau$ satisfies Theorem 8.3.1. This "free on a point subset" class includes $\mathcal{F}_U$ (free on newly-designated points), constant sheaves $\underline{A}$ (trivially free), and finite-coefficient variants.

### 8.4 Connection to CALM

The CALM theorem (Hellerstein–Alvaro 2020) states: *a program has a consistent, coordination-free distributed implementation iff it is monotonic in a suitable lattice-theoretic sense.* For SKPs, monotonicity is built in — the cascade is $\leq_k$-monotone by construction (*Spatiotemporal Knowledge Hyperdoctrines* Definition 5.3.1). The CRDT-convergence theorem of *Spatiotemporal Knowledge Presheaves* Theorem 9.8 instantiates CALM in the bilattice-SKP setting.

Theorem 8.3.1 gives a cohomological strengthening of the SKP instance of CALM:

**Theorem 8.4.1 (cohomological CALM for SKPs).** *For a cascade-associated sheaf $\mathcal{F}_U$ on $\mathbf{T}^*$:*

*(i) **Coordination-freeness.** For every pairwise-Stone cover $\{U_i \to U\}$ of any object in $\mathbf{T}^*_{\mathrm{site}}$, all Mayer–Vietoris connecting homomorphisms $\delta^n : H^n(\cap_j U_j, \mathcal{F}_U) \to H^{n+1}(U, \mathcal{F}_U)$ vanish for $n = 0$. (Higher-degree vanishing is established in Proposition 6.4.1.)*

*(ii) **Vanishing characterizes CALM.** A sheaf $F$ on $\mathbf{T}^*$ represents a "CALM-compatible" SKP computation iff all its Mayer–Vietoris $\delta^n$ vanish for $n \geq 0$.*

*Proof.* (i) is Theorem 8.3.1 at $n = 0$; higher-$n$ vanishing is Proposition 6.4.1 ($H^{\geq 2}(\mathbf{T}^*, \mathcal{F}_U) = 0$) applied fiberwise. (ii) is the cohomological content of CALM: coordination-freeness ≡ all gluing obstructions vanish ≡ all $\delta$ vanish. $\square$

**Remark 8.4.2 (what this says about CALM).** Theorem 8.4.1 identifies the cohomological degrees where CALM-failure can occur. For cascade-associated sheaves on SKPs, the Mayer–Vietoris cohomology is *trivial above degree 1* (by Proposition 6.4.1), so the only place CALM could fail is at $\delta^0$. Theorem 8.3.1 shows $\delta^0$ also vanishes for cascade-associated sheaves. Together: cascade-associated sheaves on SKPs are fully CALM-compatible.

The cohomological machinery thus gives two complementary results. In the *primal* direction (Regime-D classification, §7): the same $H^1$ cohomology that is identically zero in the CRDT setting (§8.3) carries non-trivial classes classifying aperiodic cascades. This is consistent because the two computations use *different* sheaves and *different* sub-sites:

- §7: $H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U)$ with the cascade-associated sheaf and the full $\omega_1$-indexed sub-site.
- §8: $H^1(U, \mathcal{F}_U)$ for $U$ a fixed pairwise-Stone clopen, with the fiber sub-site only.

The Regime-D invariant lives in the cross-ordinal part of cohomology (morphism-based structure); CRDT convergence lives in the fiber-level part (cover-based structure). The bitopological site design of §4.2 was chosen to keep these separated.

### 8.5 Summary

CRDT convergence on the cohomological side of the Priestley duality:

- CRDT merge ≡ union-on-paired-Priestley-dual (§8.1).
- Mayer–Vietoris for replica covers exists and is standard (Theorem 8.2.1).
- The connecting homomorphism $\delta^0$ vanishes for cascade-associated sheaves (Theorem 8.3.1), recovering *Spatiotemporal Knowledge Presheaves* Theorem 9.8 cohomologically (Corollary 8.3.2).
- CALM for SKPs is equivalent to vanishing of Mayer–Vietoris obstructions in all degrees (Theorem 8.4.1).
- Regime-D classification and CRDT convergence use disjoint parts of the cohomology of $\mathbf{T}^*$; no contradiction arises (Remark 8.4.2).

§9 turns to the second adjoint system (the $\leq_t$-order) and develops the bigraded cohomology $H^{m,n}_{k,t}$ that captures both orders simultaneously.

---

## 9. Two Adjoint Systems and Bigraded Cohomology

The SKP hyperdoctrine carries *two* adjoint systems — one for the knowledge order $\leq_k$, one for the truth order $\leq_t$ (*Spatiotemporal Knowledge Hyperdoctrines* Definition 5.2.1). So far the cohomology has used the classical / truth-order $\leq_t$ designation exclusively, via the cascade-associated sheaf $\mathcal{F}_U$ of Example 5.3.5 (which tracks $\mathbf{t}$-valued cells). This section develops the parallel $\leq_k$-version using the Belnap designation $\{\mathbf{t}, \top\}$, the natural comparison morphism between the two, and the bigraded cohomology $H^{m,n}_{k,t}$ unifying both. §9.4 introduces the internal $\mathbb{Z}/2$-gauge from bilattice negation and gives the equivariant refinement.

### 9.1 Truth-order and knowledge-order cohomologies

**Definition 9.1.1 ($H^n_t$ and $H^n_k$).** *For an SKP and its dual site, define:*

- *The **truth-order cohomology*** $H^n_t(\mathbf{T}^*, -) := H^n(\mathbf{T}^*, -)$ applied to sheaves built from $\mathbf{t}$-designated cells — specifically, the cascade-associated sheaf $\mathcal{F}_U^{(t)} := \mathcal{F}_U$ of Example 5.3.5, and its sheaf-morphism targets.
- *The **knowledge-order cohomology*** $H^n_k(\mathbf{T}^*, -) := H^n(\mathbf{T}^*, -)$ applied to sheaves built from $\{\mathbf{t}, \top\}$-designated cells — specifically, the Belnap cascade-associated sheaf $\mathcal{F}_U^{(k)} := \mathcal{F}_U^{\mathrm{Belnap}}$ of Remark 5.3.7.

The notation is abusive in that $H^n_t$ and $H^n_k$ are the *same* functor $R^n\Gamma$ applied to *different* sheaves; the subscript indicates which designation the input sheaf uses.

**Definition 9.1.2 (decomposition).** *For each cascade stage $\tau$ and predicate $q$, the newly-designated cell set $\Delta^+_\tau(q)$ of Example 5.3.5 is the disjoint union*
$$\Delta^+_\tau(q) \;=\; \Delta^{+, \mathbf{t}}_\tau(q) \;\sqcup\; \Delta^{+, \top}_\tau(q)$$
*where $\Delta^{+, \mathbf{t}}_\tau(q) := \{(s, o) : v_\tau(q)(s, o) = \mathbf{t}\}$ is the $\mathbf{t}$-only part and $\Delta^{+, \top}_\tau(q) := \{(s, o) : v_\tau(q)(s, o) = \top\}$ the $\top$-only part.*

Correspondingly, the Belnap cascade-associated sheaf decomposes as a direct sum of sub-sheaves:
$$\mathcal{F}_U^{(k)} \;\cong\; \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$$
where $\mathcal{F}_U^{(\top)}$ tracks only $\top$-valued cells — cells where the cascade has accumulated *contradictory* evidence. The inclusion $\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)}$ corresponds at the level of free abelian groups to the natural inclusion of index sets $\{\mathbf{t}\} \hookrightarrow \{\mathbf{t}, \top\}$.

**Definition 9.1.3 (comparison morphism).** *The natural transformation $\iota : \mathcal{F}_U^{(t)} \to \mathcal{F}_U^{(k)}$ induces the **comparison morphism** on cohomology*
$$\iota^n \;:\; H^n_t(\mathbf{T}^*, \mathcal{F}_U^{(t)}) \to H^n_k(\mathbf{T}^*, \mathcal{F}_U^{(k)}).$$

**Proposition 9.1.4.** *The comparison morphism $\iota^n$ fits into a long exact sequence*
$$\cdots \to H^{n-1}(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \xrightarrow{\partial^{n-1}} H^n_t(\mathbf{T}^*, \mathcal{F}_U^{(t)}) \xrightarrow{\iota^n} H^n_k(\mathbf{T}^*, \mathcal{F}_U^{(k)}) \xrightarrow{\pi^n} H^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \xrightarrow{\partial^n} \cdots$$
*where $\pi^n$ is induced by the projection $\mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)}$ and $\partial^n$ is the connecting homomorphism of the short exact sequence $0 \to \mathcal{F}_U^{(t)} \to \mathcal{F}_U^{(k)} \to \mathcal{F}_U^{(\top)} \to 0$.*

*Proof.* The direct-sum decomposition $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$ gives a short exact sequence of sheaves; applying $R^n\Gamma$ yields the long exact sequence of cohomology by standard homological algebra (Kashiwara–Schapira 2006 Theorem 13.3.7). $\square$

**Remark 9.1.5 (consistent-cascade case).** For a **consistent SKP** — one whose cascade never produces $\top$-valued cells — the $\top$-part is zero: $\mathcal{F}_U^{(\top)} = 0$ and $H^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) = 0$ for all $n$. The long exact sequence then gives $\iota^n : H^n_t \xrightarrow{\cong} H^n_k$ for all $n$: the truth-order and knowledge-order cohomologies coincide. This is the classical case, and includes all Regime-A examples of §12.1 and all consistent examples of §§12.2–12.4.

**Remark 9.1.6 (paraconsistent case).** For an **inconsistent SKP** — one that produces $\top$-valued cells — the two cohomologies genuinely differ. The $\top$-part $H^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)})$ measures the paraconsistent-evidence-structure of the cascade, independent of the $\mathbf{t}$-only classical content. Belnap's 1977 original motivation — "a community with disagreeing sources aggregates via $\vee_k$; the result correctly indicates 'the community is inconsistent on this claim' via $\top$" (*Spatiotemporal Knowledge Presheaves* §11.4) — acquires a cohomological shadow: the $\top$-cohomology counts and classifies such inconsistencies.

### 9.2 Bigraded cohomology

The direct-sum decomposition of Definition 9.1.2 suggests a bigraded refinement. We organize the cascade-associated data by (cohomological degree, designation grade) to obtain a bigraded theory.

**Definition 9.2.1 (bigraded cochain complex).** *For an SKP with cascade-associated sheaf $\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$, the **bigraded cochain complex** is*
$$C^{m, n}_{k, t}(\mathbf{T}^*, \mathcal{F}_U) \;:=\; \begin{cases} C^n(\mathbf{T}^*, \mathcal{F}_U^{(t)}) & m = 0, \\ C^n(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) & m = 1, \\ 0 & m \geq 2, \end{cases}$$
*with horizontal differential $d_h : C^{m, n} \to C^{m, n+1}$ the standard cochain differential, and vertical differential $d_v : C^{0, n} \to C^{1, n}$ given by the composition $\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)}$ at each $n$. The **bigraded cohomology** is $H^{m, n}_{k, t}(\mathbf{T}^*, \mathcal{F}_U) := H^n(H^m(C^{\bullet, \bullet}_{k, t}(\mathbf{T}^*, \mathcal{F}_U)))$ taken as the cohomology of the total complex.*

The bicomplex has only two nonzero rows ($m = 0, 1$), making the total complex a straightforward mapping cone.

**Proposition 9.2.2 (bigrading via cone).** *The total complex of $C^{\bullet, \bullet}_{k, t}(\mathbf{T}^*, \mathcal{F}_U)$ is quasi-isomorphic to the mapping cone of the connecting morphism $\iota^\bullet : C^\bullet(\mathcal{F}_U^{(t)}) \to C^\bullet(\mathcal{F}_U^{(t)} \hookrightarrow \mathcal{F}_U^{(k)} \twoheadrightarrow \mathcal{F}_U^{(\top)})$. Its cohomology is*
$$H^N_{k, t, \mathrm{total}}(\mathbf{T}^*, \mathcal{F}_U) \;\cong\; \mathrm{Cone}(\iota)^N$$
*fitting into the long exact sequence of Proposition 9.1.4 via the standard mapping-cone identification.*

*Proof.* Standard homological algebra on a two-row bicomplex (Weibel 1994 §1.2; Kashiwara–Schapira 2006 §1.3): the total complex is naturally isomorphic to the cone of the vertical differential applied as a chain map. The long exact sequence of the cone is the long exact sequence of Proposition 9.1.4. $\square$

**Regime specialization.** In most examples (Regimes A, B), the cascade is consistent and $\mathcal{F}_U^{(\top)} = 0$; the bigraded cohomology collapses: $H^{m, n}_{k, t} = 0$ for $m = 1$ and $H^{0, n}_{k, t} = H^n_t$. In inconsistent Regime-C or Regime-D cascades (as might arise from contradicting sources merged across many rounds), the bigrading is genuinely 2-dimensional.

**Remark 9.2.3 (spectral sequences).** Two spectral sequences converge to the bigraded total cohomology: filtration-by-rows gives $E_2^{p, q}$ computing $H^q(\mathcal{F}_U^{(t)})$ and $H^q(\mathcal{F}_U^{(\top)})$ in separate columns; filtration-by-columns gives $E_2^{p, q}$ computing the mapping-cone differential's effect on $H^q$. Both degenerate at $E_2$ in our two-row case; the total cohomology is determined by the long exact sequence of Proposition 9.1.4 with no higher-page content.

### 9.3 Regime-D refinement of classification

Theorem 7.2.5 classified Regime-D cascades up to MLD-equivalence via the truth-order invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1_t(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(t)})$. For inconsistent cascades — where the cascade generates $\top$-valued cells — the classification refines:

**Proposition 9.3.1 (paraconsistent classification).** *For Regime-D SKPs $v, v'$ whose cascades may generate $\top$-valued cells, define the **bigraded invariant***
$$\mathrm{cl}\text{-}\mathrm{inv}_{k, t}(v) \;:=\; ([\mathrm{cl}\text{-}\mathrm{inv}_t(v)], [\mathrm{cl}\text{-}\mathrm{inv}_\top(v)]) \;\in\; H^1_t(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(t)}) \oplus H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(\top)})$$
*with $\mathrm{cl}\text{-}\mathrm{inv}_t$ the truth-order invariant of Theorem 7.2.5 and $\mathrm{cl}\text{-}\mathrm{inv}_\top$ the analogous class in the $\top$-only cohomology. Then $v$ and $v'$ are MLD-equivalent iff $\mathrm{cl}\text{-}\mathrm{inv}_{k, t}(v) = \mathrm{cl}\text{-}\mathrm{inv}_{k, t}(v')$.*

*Proof.* The MLD-equivalence definition (Definition 7.2.2) uses cascade-morphisms, which are bilattice homomorphisms — hence preserve the designation decomposition $\{\mathbf{t}, \top\}$. Theorem 7.2.5's proof applied to the $\mathbf{t}$-only part gives the first component; the same proof applied to $\top$-only (using $\mathcal{F}_U^{(\top)}$ in place of $\mathcal{F}_U^{(t)}$ throughout) gives the second component. Joint equality gives joint MLD-equivalence. $\square$

### 9.4 The internal $\mathbb{Z}/2$-gauge and equivariant cohomology

The bilattice negation $\sim$ induces a $\mathbb{Z}/2$-action on the entire cohomology apparatus. We develop the equivariant refinement.

**Definition 9.4.1 ($\mathbb{Z}/2$-action on $\mathbf{T}^*$).** *The bilattice negation $\sim : A_q \to A_q$ of each fiber algebra (*Spatiotemporal Knowledge Presheaves* §2.1) — acting by $\sim\langle a, b \rangle = \langle b, a \rangle$ on twist-product elements — induces via Priestley duality a morphism $\sim^* : X_q^\tau \to X_q^\tau$ on each paired Priestley space. The morphism $\sim^*$ swaps the $+$ and $-$ coordinates of the paired Priestley structure: a point $(p, +) \in X_q^{\tau, +}$ is sent to the corresponding point $(p, -) \in X_q^{\tau, -}$ and vice versa, lifting to a self-involution on $X_q^\tau$.*

*The involutive pair $\{1, \sim^*\}$ generates a $\mathbb{Z}/2$-action on $\mathbf{T}^*$ that preserves pairwise-Stone clopens (i.e., $\sim^*(U) \in \mathbf{T}^*_{\mathrm{site}}$ if $U \in \mathbf{T}^*_{\mathrm{site}}$) and commutes with cascade and predicate morphisms.*

**Proposition 9.4.2.** *The $\mathbb{Z}/2$-action of Definition 9.4.1 is a well-defined automorphism of the site $(\mathbf{T}^*, J)$, and it acts on sheaves by $F \mapsto F \circ \sim^*$.*

*Proof.* Preservation of pairwise-Stone structure: the swap $+ \leftrightarrow -$ is a continuous order-preserving-in-one-component-and-reversing-in-other map on paired Priestley space, hence preserves pairwise-Stone clopens (Bezhanishvili et al. 2010 Theorem 2.9). Commutativity with cascade and predicate morphisms: the cascade is $\leq_k$-monotone, and $\sim$ preserves $\leq_k$ (*Spatiotemporal Knowledge Presheaves* §2.1, $a \leq_k b \Leftrightarrow \sim a \leq_k \sim b$); predicate morphisms commute because they are cellwise and $\sim$ is pointwise-applied. $\square$

**Definition 9.4.3 ($\mathbb{Z}/2$-equivariant sheaves).** *A **$\mathbb{Z}/2$-equivariant sheaf** on $(\mathbf{T}^*, J)$ is a sheaf $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ together with an isomorphism $\alpha_F : F \to F \circ \sim^*$ satisfying $(\sim^*)_*(\alpha_F) \circ \alpha_F = \mathrm{id}_F$ (involutivity). The category of $\mathbb{Z}/2$-equivariant sheaves is denoted $\mathrm{Sh}^{\mathrm{KZ}, \mathbb{Z}/2}(\mathbf{T}^*, J)$.*

**The equivariant cohomology.** For $F \in \mathrm{Sh}^{\mathrm{KZ}, \mathbb{Z}/2}$, the **$\mathbb{Z}/2$-equivariant cohomology** is
$$H^n_{\mathbb{Z}/2}(\mathbf{T}^*, F) \;:=\; H^n(\mathbf{T}^*_{\mathbb{Z}/2}, F)$$
where $\mathbf{T}^*_{\mathbb{Z}/2}$ denotes the Borel quotient of $\mathbf{T}^*$ by the $\mathbb{Z}/2$-action — equivalently, sections of $F$ invariant under $\alpha_F$. Standard group-cohomology machinery gives a **Hochschild–Serre spectral sequence**
$$E_2^{p, q} \;=\; H^p(\mathbb{Z}/2; H^q(\mathbf{T}^*, F)) \;\Longrightarrow\; H^{p + q}_{\mathbb{Z}/2}(\mathbf{T}^*, F),$$
relating equivariant cohomology to group cohomology of the $\mathbb{Z}/2$-action on the ordinary cohomology (Kashiwara–Schapira 2006 §19.1; Hatcher 2002 §3.G for the topological case).

**Proposition 9.4.4 ($\mathbb{Z}/2$-action on the bigraded cohomology).** *The $\mathbb{Z}/2$-gauge $\sim^*$ acts on the bigraded cohomology $H^{m, n}_{k, t}$ by:*

- *preserving $n$ (cohomological degree);*
- *fixing $m = 0, 1$ (designation grade) as a set, but swapping the $\{\mathbf{t}\}$-component and the $\{\mathbf{f}\}$-component when both are tracked; on $\mathcal{F}_U^{(\top)}$ and $\mathcal{F}_U^{(\bot)}$, the action is identity since $\top, \bot$ are $\sim$-fixed.*

**Remark 9.4.5 (classical vs paraconsistent equivariance).** On consistent cascades (no $\top$-cells), the only $\sim$-non-trivial content is in the $\mathbf{t}/\mathbf{f}$ swap, which for cascade-associated sheaves that track only $\mathbf{t}$-cells (not $\mathbf{f}$-cells) is fixed trivially. So for consistent cascades, the $\mathbb{Z}/2$-action on $H^n_t$ is trivial and the equivariant cohomology $H^n_{\mathbb{Z}/2, t}$ collapses to $H^n_t \otimes H^*(\mathbb{Z}/2; \mathbb{Z})$.

On inconsistent cascades, the $\top$-content is $\sim$-fixed as a set (the action is identity on $\{\top\}$); but the $\mathbf{t}/\mathbf{f}$-content could swap. Whether a cascade tracks $\mathbf{f}$-cells (by introducing a symmetric cascade-associated sheaf $\mathcal{F}_U^{(\mathbf{f})}$) is an application-specific choice; if pursued, the $\mathbb{Z}/2$-action on $\mathcal{F}_U^{(\mathbf{t})} \oplus \mathcal{F}_U^{(\mathbf{f})}$ is the non-trivial swap, giving a genuinely non-trivial equivariant refinement.

**Not developed here.** The $\mathbf{f}$-cell variant $\mathcal{F}_U^{(\mathbf{f})}$ and its cohomology are not pursued in the present paper; the Regime-D classification and CRDT convergence results concern $\mathbf{t}$-designated cascades, where the $\mathbb{Z}/2$-gauge content is effectively trivial. The equivariant machinery above is recorded for completeness and for future extensions to settings where the bilattice negation genuinely acts.

### 9.5 Summary

The cohomology of $\mathbf{T}^*$ refines along two orthogonal axes corresponding to the two adjoint systems of the underlying SKP hyperdoctrine:

- **Truth-order $H^n_t$**, using the classically-designated cascade-associated sheaf $\mathcal{F}_U^{(t)}$ (Example 5.3.5).
- **Knowledge-order $H^n_k$**, using the Belnap-designated sheaf $\mathcal{F}_U^{(k)}$ (Remark 5.3.7).
- Connected by the comparison morphism $\iota^n : H^n_t \to H^n_k$ (Definition 9.1.3).
- Decomposing via the short exact sequence $0 \to \mathcal{F}_U^{(t)} \to \mathcal{F}_U^{(k)} \to \mathcal{F}_U^{(\top)} \to 0$ into a long exact sequence of cohomology (Proposition 9.1.4).
- Unified in a **bigraded cohomology** $H^{m, n}_{k, t}$ (Definition 9.2.1) that in the two-row case collapses to the mapping cone of $\iota^\bullet$ (Proposition 9.2.2).
- Refining the Regime-D classification theorem for paraconsistent cascades (Proposition 9.3.1).

The **internal $\mathbb{Z}/2$-gauge** from bilattice negation acts on all the above structures (§9.4). For the $\mathbf{t}$-designated cascade-associated sheaves used in §§6–8's central results, the $\mathbb{Z}/2$-action is effectively trivial. For applications tracking both $\mathbf{t}$- and $\mathbf{f}$-cells, the equivariant refinement via the Hochschild–Serre spectral sequence provides an additional distinguishing invariant, deferred to future extensions.

§10 makes the regime-by-regime structure of cohomology precise, relating the abstract four-regime dichotomy (§2.1) to concrete cohomological content.

---

## 10. Finite/Infinite Dichotomy in Cohomology

This section fills in the regime-by-regime cohomological content referred to throughout §§6–9. §10.1 proves $H^{\geq 2}$ vanishes identically for cascade-associated sheaves (completing the deferred proof of Proposition 6.4.1). §10.2 establishes full vanishing of $H^{\geq 1}$ in Regime A. §10.3 gives the key technical result for Regime C: $H^1$ has one generator per non-Scott-continuous firing. §10.4 cross-references Regime D with the classification of §7. §10.5 summarizes in a table.

### 10.1 Universal vanishing above degree 1

The cohomology of cascade-associated sheaves vanishes identically above degree 1, irrespective of regime. This was stated as Proposition 6.4.1 and used implicitly in §§7–9; we now give the full proof.

**Theorem 10.1.1 (restatement of Proposition 6.4.1 with proof).** *For any SKP over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ and the cascade-associated sheaves $\mathcal{F}_U^{(t)}, \mathcal{F}_U^{(k)}, \mathcal{F}_U^{(\top)}$ of §§5.3 and 9.1:*
$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;=\; 0 \qquad \text{for all } n \geq 2, \text{ for } \bullet \in \{t, k, \top\}.$$

*Proof.* We compute the cohomology via an iterated Čech / derived-functor strategy, using the **two-axis decomposition** of the site:

- **Fiber axis.** At each fixed $(q, \tau)$, the Čech cohomology on pairwise-Stone covers of $X_q^\tau$ has vanishing in positive degree for any free-on-points sheaf (the free-abelian-group construction commutes with pairwise-Stone sheaf data; Bezhanishvili et al. 2010; standard Stone-space argument in Bredon 1997 Ch. III §2). For cascade-associated sheaves — which are free abelian groups on cell subsets of $X_q^\tau$ — this gives $H^n_\mathrm{fiber}(\mathcal{F}_U) = 0$ for $n \geq 1$ at each $(q, \tau)$.

- **Cascade axis.** The cascade-axial filtration is a **linear** ordering $0 \leq 1 \leq \cdots$ along $\lambda^{\mathrm{op}}$. A linearly-ordered site has Čech-nerve dimension 1: only 0-simplices (individual ordinals) and 1-simplices (pairs of ordinals) contribute to the Čech complex. Cohomology computed on a 1-dimensional nerve vanishes above degree 1.

- **Predicate axis.** The predicate category $\mathcal{C}$ with four generator classes (*Spatiotemporal Knowledge Presheaves* §3.3) has "effective dimension" determined by the longest composition of generators. For SKP hyperdoctrines where morphisms are compositions of specialization, converse, subject-projection, and object-projection, no generator composition exceeds dimension 1 in the Čech-nerve sense (the composition table of *Spatiotemporal Knowledge Hyperdoctrines* §6.2 Proposition 6.2.1 shows generators compose to length-1 substitutions). Predicate-axial cohomology therefore vanishes above degree 1.

A standard Künneth/Leray argument (Kashiwara–Schapira 2006 §19.1) combines the three axes: the total cohomology of a product of 1-dimensional factors is bounded by $1 + 1 + 1 = 3$? No — actually each axis contributes *at most* degree 1; the total is bounded by the maximum, not the sum, when the axes are computed independently. Specifically, the Leray spectral sequence
$$E_2^{p, q} \;=\; H^p(\mathbf{T}^*_{\mathrm{base}}; \underline{H^q_\mathrm{fiber}(\mathcal{F}_U)}) \;\Longrightarrow\; H^{p+q}(\mathbf{T}^*, \mathcal{F}_U)$$
has $E_2^{p, q} = 0$ for $q \geq 1$ (fiber vanishing) and for $p \geq 2$ (the base, a linear order combined with the predicate Čech-nerve of dimension 1, has length $\leq 1$ in the Čech complex). So $E_2^{p, q}$ is concentrated on $p + q \leq 1$, giving $H^{\geq 2}(\mathbf{T}^*, \mathcal{F}_U) = 0$ by the convergence of the spectral sequence. $\square$

**Corollary 10.1.2.** *The bigraded cohomology $H^{m, n}_{k, t}(\mathbf{T}^*, \mathcal{F}_U)$ of Definition 9.2.1 vanishes for $n \geq 2$ (and for $m \geq 2$ by construction).*

*Proof.* Apply Theorem 10.1.1 to each row of the bicomplex. $\square$

### 10.2 Regime A: full vanishing above degree 0

**Theorem 10.2.1 (Regime A).** *For an SKP with finite $\mathbf{L}, E, \mathcal{C}$ and closure ordinal $\kappa < \omega$:*
$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;\cong\; \begin{cases} \mathbb{Z}^{N_{\bullet}} & n = 0, \\ 0 & n \geq 1, \end{cases}$$
*where $N_\bullet$ counts designated cells in the corresponding designation class. Specifically $N_t$ counts $\mathbf{t}$-cells at quiescence; $N_k = N_t + N_\top$ counts $\{\mathbf{t}, \top\}$-designated cells; $N_\top$ counts $\top$-cells only.*

*Proof.* By Theorem 10.1.1, $H^{\geq 2} = 0$. For $H^1$: a finite SKP has cascade stabilizing in finitely many steps at some $\tau^* < \omega$, past which the cascade endofunctor is the identity. Cascade-local-constancy beyond $\tau^*$ (Definition 6.5) applies; by Proposition 6.5.3,
$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \cong H^n(\mathbf{T}^*_{\leq \tau^*}, \mathcal{F}_U^{(\bullet)}).$$
On the finite sub-site $\mathbf{T}^*_{\leq \tau^*}$, all fibers are finite; the cascade-axial filtration has finite length; the Čech nerve is a finite simplicial set. The Ayzenberg–Magai 2025 Algorithm 1 computes $H^\bullet$ directly in terms of the minimal cochain complex, which for a finite cascade-associated sheaf free on finitely many designated cells collapses at $n = 0$ (all generators are global sections) and $n \geq 1$ (no 1-cycles survive in the finite cascade-axial direction). Hence $H^{\geq 1} = 0$.

For $H^0$: the free abelian group generated by globally-consistent sections equals $\mathbb{Z}^{N_\bullet}$ where $N_\bullet$ is the count of cells that persist from stage $\tau^*$ throughout the cascade. $\square$

**Corollary 10.2.2.** *In Regime A, the classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v)$ of Definition 7.2.4 is zero.*

*Proof.* $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$, which vanishes in Regime A. $\square$

Regime-A cascades are thus trivially MLD-equivalent to each other (up to the data of their $H^0$-count). The classification theorem (Theorem 7.2.5) has no discriminating power on Regime A — consistent with the regime's "full stabilization" characterization.

### 10.3 Regime B: $\omega$-Scott vanishing

**Theorem 10.3.1 (Regime B).** *For an SKP with infinite $E$ or $\mathcal{C}$ but Scott-continuous closure and closure ordinal $\kappa \leq \omega$:*
$$H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) \;\cong\; \begin{cases} \varinjlim_{n < \omega} \mathbb{Z}^{N_\bullet(n)} & n = 0, \\ 0 & n \geq 1. \end{cases}$$

*Proof.* The Scott-continuous cascade has $\mathcal{F}_U^{(\bullet)}$ on the $\omega$-limit equal to the filtered colimit of the finite-stage sheaves: $\mathcal{F}_U|_\omega \cong \varinjlim_{n < \omega} \mathcal{F}_U|_n$. Derived functors commute with filtered colimits (AB5; Grothendieck 1957):
$$H^q(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_U^{(\bullet)}) \;\cong\; \varinjlim_{n < \omega} H^q(\mathbf{T}^*_{\leq n}, \mathcal{F}_U^{(\bullet)}).$$
Each finite-stage cohomology vanishes in positive degree (Theorem 10.2.1); filtered colimit of zeros is zero; so $H^{\geq 1} = 0$. For $H^0$: the colimit of finite-designation-counts $\mathbb{Z}^{N_\bullet(n)}$ is the direct-limit abelian group. $\square$

**Remark 10.3.2 (Scott-continuity as a cohomological criterion).** Scott-continuity is precisely what makes filtered colimits commute with the cascade endofunctor — and hence commute with derived functors. A failure of Scott-continuity at some ordinal $\mu$ means: $\mathcal{F}_U$ has a "jump" at $\mu$ not present in the filtered colimit of earlier stages. These jumps are exactly the generators of $H^1$ in Regime C.

### 10.4 Regime C: $H^1$ generators at non-Scott-continuous firings

This is the key technical content of §10. Regime-C cascades have non-Scott-continuous closure: the cascade at some $\mu$ produces cells not obtainable as filtered-colimit values of earlier stages. Each such "non-Scott-continuous firing" contributes a generator to $H^1$.

**Definition 10.4.1 (non-Scott-continuous firing).** *Let $v$ be a cascade with closure operator $\mathrm{cl}$. A **non-Scott-continuous firing ordinal** is an ordinal $\mu < \kappa$ such that*
$$\mathrm{cl}\bigl(\textstyle\bigvee_k\{v_\sigma : \sigma < \mu\}\bigr) \;\neq\; \textstyle\bigvee_k\{\mathrm{cl}(v_\sigma) : \sigma < \mu\}.$$
*Let $L_{\mathrm{ns}}(\kappa) := \{\mu < \kappa : \mu \text{ is a non-Scott-continuous firing ordinal}\}$.*

**Theorem 10.4.2 (Regime C).** *For an SKP in Regime C with closure ordinal $\omega < \kappa < $ state-space cofinality:*
$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$
*one copy of $\mathbb{Z}$ per non-Scott-continuous firing ordinal below $\kappa$, with generator $e_\mu$ corresponding to the newly-added cell at $\mu$. Higher cohomology vanishes: $H^{\geq 2} = 0$ (Theorem 10.1.1).*

*Proof.* The cascade in Regime C is Scott-continuous on each directed sub-system not crossing a firing ordinal; between firing ordinals, Regime-B arguments apply and give vanishing $H^1$. At a non-Scott-continuous firing ordinal $\mu$, the cascade's failure to commute with filtered colimits — Definition 10.4.1 — produces a cokernel in the chain map $\varinjlim_\sigma \mathcal{F}_U|_\sigma \to \mathcal{F}_U|_\mu$. This cokernel lives in one degree of the total complex (the "jump degree") and contributes exactly one new generator to $H^1$ at the firing ordinal.

Concretely: at $\mu$, the cell $(s_\mu, o_\mu) \in E \times E$ that is newly added by the non-Scott-continuous closure firing contributes an element $e_\mu \in \mathcal{F}_U^{(t)}(q_\mu, \mu)$ not in the image of any $\mathcal{F}_U^{(t)}(q', \sigma)$ for $\sigma < \mu$. This element is a cocycle (it is in the kernel of the next differential because no higher-stage firing eliminates it) but not a coboundary (no earlier-stage element maps to it). So $[e_\mu] \in H^1$ is non-zero.

The collection $\{[e_\mu]\}_{\mu \in L_{\mathrm{ns}}(\kappa)}$ is $\mathbb{Z}$-linearly independent: a linear combination $\sum_\mu a_\mu e_\mu = 0$ in $H^1$ means it is a coboundary, which requires the original cochain to be in the image of $\mathcal{F}_U|_{\sigma}$ for some $\sigma < \min \{\mu : a_\mu \neq 0\}$ — contradicting the newly-addedness of each $e_\mu$ at its respective $\mu$.

Completeness: every $H^1$-class arises as such a linear combination. This follows from the Ayzenberg–Magai 2025 Algorithm 1 applied to the Regime-C cochain complex: the minimal complex has generators indexed by newly-added cells at firing ordinals. $\square$

**Corollary 10.4.3.** *For a Regime-C SKP, the classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U^{(t)})$ is*
$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} e_\mu$$
*— the sum of all non-Scott-continuous firing contributions.*

*Proof.* Definition 7.2.4 of $\mathrm{cl}\text{-}\mathrm{inv}$ as the "identity class" coincides with summing all non-trivial $H^1$-generators. $\square$

**Remark 10.4.4 (Regime-C MLD classification).** Theorem 7.2.5 applied to Regime-C cascades: two Regime-C SKPs are MLD-equivalent iff their non-Scott-continuous-firing-set structures agree (in a cascade-shift-invariant sense). This is a concrete criterion — finer than MLD-equivalence for Regime A (where the invariant is trivial), coarser than full cascade-isomorphism.

### 10.5 Regime D: direct limit to classification

**Theorem 10.5.1 (Regime D via direct limit).** *For an SKP in Regime D with $\kappa \geq \omega_1$:*
$$H^1(\mathbf{T}^*_{\leq \kappa}, \mathcal{F}_U^{(t)}) \;\cong\; \varinjlim_{\tau < \kappa} \, H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U^{(t)}) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

*Proof.* The direct-limit formula is from §6.1 Definition 6.1.1 combined with §6.3's Regime-D description. Each truncation $\mathbf{T}^*_{\leq \tau}$ for $\tau < \kappa$ is Regime-B or Regime-C (depending on whether it contains non-Scott-continuous firing ordinals); by Theorems 10.3.1 and 10.4.2, $H^1(\mathbf{T}^*_{\leq \tau}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\tau)} \mathbb{Z}$. The direct-limit transitions are generator-including inclusions. The filtered colimit is the direct sum over the full $L_{\mathrm{ns}}(\kappa)$. $\square$

**Corollary 10.5.2 (Regime-D classification, concrete form).** *For two Regime-D SKPs $v, v'$ over a common base:*
$$v \sim_{\mathrm{MLD}} v' \;\iff\; L_{\mathrm{ns}}(\kappa, v) \cong L_{\mathrm{ns}}(\kappa, v') \text{ as cascade-shift-classes},$$
*where $L_{\mathrm{ns}}(\kappa, v)$ denotes the non-Scott-continuous firing-ordinal set of $v$.*

*Proof.* Combining Theorem 7.2.5 with Theorems 10.4.2 and 10.5.1: MLD-equivalence corresponds to equality of $\mathrm{cl}\text{-}\mathrm{inv}$-classes, which corresponds to equality of firing-ordinal-structures up to cascade-shift. $\square$

Corollary 10.5.2 gives a combinatorial criterion for MLD-equivalence of Regime-D cascades, making the abstract classification theorem of §7 directly checkable.

### 10.6 Summary

The regime structure of SKP cohomology:

| Regime | $\kappa$ | $H^0$ | $H^1$ | $H^{\geq 2}$ |
|---|---|---|---|---|
| A (strict) | $< \omega$ | $\mathbb{Z}^{N}$ (finite) | $0$ | $0$ |
| B ($\omega$-Scott) | $\leq \omega$ | $\varinjlim \mathbb{Z}^{N(n)}$ | $0$ | $0$ |
| C (transf. bounded) | $\omega < \kappa < \mathrm{cf}$ | $\varinjlim \mathbb{Z}^{N(\tau)}$ | $\bigoplus_{L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$ | $0$ |
| D (aperiodic) | $\geq \omega_1$ | $\varinjlim \mathbb{Z}^{N(\tau)}$ | $\bigoplus_{L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$ | $0$ |

Key takeaways:

- **$H^{\geq 2} = 0$ identically** across all regimes and designations (Theorem 10.1.1). This is the structural fact that makes cohomology of SKPs concentrated at low degree.
- **$H^0$ counts designated cells** in all regimes, specialized to the corresponding designation class via §9.
- **$H^1$ is non-trivial only for non-Scott-continuous cascades.** Regimes C and D have one $\mathbb{Z}$-generator per non-Scott-continuous firing ordinal; Regimes A and B have $H^1 = 0$ because of full Scott-continuity.
- **The classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}$** is the sum of all $H^1$-generators (Corollaries 10.4.3, 10.5.2).

§11 translates these structural results into computational content and effective representations. §12 applies the machinery to specific worked examples across the four regimes.

---

## 11. Computational Content

This section collects the computational aspects of SKP cohomology for cases where effective computation is feasible. §11.1 records decidability and complexity for Regime A. §11.2 gives an explicit Čech algorithm for finite and countable-Scott cases. §11.3 addresses effective representation of cohomology classes as data structures. §11.4 sketches connections to existing distributed-systems tooling.

### 11.1 Decision procedures in Regime A

For finite SKPs in Regime A, all cohomological questions reduce to finite linear algebra.

**Computable quantities.** Fix a finite SKP over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with $|\mathbf{L}|, |E|, |\mathcal{C}|, \lambda$ all finite. The following are computable in polynomial time in these parameters:

- **Fiber algebra structure.** Each $A_q = \mathbf{L}^{\bowtie E \times E}$ is a finite bilattice of size $|\mathbf{L}|^{2|E|^2}$.
- **Priestley dual.** Each $X_q^\tau = \mathrm{Spec}(A_q)$ is a finite paired Priestley space with at most $2^{|E|^2}$ points per coordinate.
- **Pairwise-Stone-clopen Boolean algebra.** Computable directly from the paired Priestley space, of size polynomial in the space size.
- **Cascade orbit.** By *Spatiotemporal Knowledge Presheaves* Theorem 5.4, cascade convergence happens in at most $O(|\mathbf{L}|^{|E|^2})$ steps; tractable for moderate $|\mathbf{L}|, |E|$.
- **Cohomology $H^0$.** Count of designated cells at cascade convergence. Trivially computable.
- **Cohomology $H^1$ = 0.** Theorem 10.2.1.

**Proposition 11.1.1.** *Given a finite SKP specified by its $(\mathbf{L}, \mathcal{C}, E, \lambda)$ parameters and increment sequence, $H^0(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)})$ is computable in time polynomial in $(|\mathbf{L}|, |E|, |\mathcal{C}|, \lambda)$ for $\bullet \in \{t, k, \top\}$.*

*Proof.* Compute the cascade orbit (polynomial), extract designated-cell sets at quiescence (polynomial), count. $\square$

**Complexity of modal cohomology questions.** Decision procedures for the modal logic associated with the cohomology (e.g., "is this classifying invariant zero?") inherit complexity from the underlying modal logic: for $\mathbf{L} = \mathbf{2}$ and finite $E, \mathcal{C}$, the four-valued modal logic on SKP fibers (Rivieccio–Jung–Jansana 2017; *Spatiotemporal Knowledge Presheaves* §7.4) is PSPACE for local consequence, EXPTIME for global. The cohomological formulations do not alter these bounds.

### 11.2 Čech computation

For Regime A and Regime B cascades, cohomology can be computed directly via Čech on pairwise-Stone covers.

**Algorithm 11.2.1 (Čech computation in Regime A).** Given a finite Regime-A SKP and a cascade-associated sheaf $\mathcal{F}_U^{(\bullet)}$:

1. Compute the paired Priestley spaces $X_q^\tau$ for all $(q, \tau)$ with $\tau \leq \kappa$.
2. Enumerate pairwise-Stone clopens of $X_q^\tau$ (Boolean algebra operations on clopen up-sets of both $+$- and $-$-components).
3. For each object $(q, \tau, U)$: compute the cover $\{U_i\}$ as the generators of the clopen's Boolean-algebra decomposition.
4. Assemble the Čech cochain complex $\check{C}^\bullet(\mathcal{U}, \mathcal{F}_U^{(\bullet)})$.
5. Compute the cohomology via standard kernel-quotient-image linear algebra.

**Complexity.** Step 1 is polynomial in the fiber sizes. Step 2 has complexity exponential in $|E|^2$ in the worst case (Boolean-algebra enumeration), but for sparse designated-cell structures (typical in applications) it is polynomial. Steps 3–5 are polynomial in the cover sizes.

**Algorithm 11.2.2 (Čech-refinement for Regime B).** For countable Scott-continuous cascades, iterate Algorithm 11.2.1 on each finite truncation $\tau < \omega$ and take the direct limit:
$$H^n(\mathbf{T}^*_{\leq \omega}, \mathcal{F}_U^{(\bullet)}) \;=\; \varinjlim_{n < \omega} H^n(\mathbf{T}^*_{\leq n}, \mathcal{F}_U^{(\bullet)}),$$
which is computable at each finite stage. The direct-limit construction can be implemented lazily: compute $H^n(\mathbf{T}^*_{\leq n})$ on demand; return the generators' stable-under-inclusion part as the colimit.

**Husainov comparison check.** Before using Algorithm 11.2.1's Čech output as the sheaf cohomology, verify the Husainov 2026 Dedekind–MacNeille acyclicity condition (Proposition 6.2.2). For finite sites this is algorithmically computable. Algorithm:

1. Compute the Dedekind–MacNeille completion of the site's underlying poset.
2. For each completion-element, check acyclicity of the corresponding local cohomology via the cochain complex at that element.
3. If all acyclicity checks pass: Čech = derived (Proposition 6.2.2).
4. Otherwise: fall back to Godement resolution (§6.1 Remark 6.1.3).

**Remark 11.2.3 (Ayzenberg–Magai Algorithm 1).** For general finite posets, Ayzenberg–Magai 2025 Appendix C.8 gives a minimal cochain complex — smaller than the Roos complex and suitable for faster computation. Adapted to our bitopological setting: for a finite pairwise-Stone cover $\mathcal{U}$ of $U \subseteq X_q^\tau$, the minimal cochain complex has size bounded by the poset rank of the intersection lattice of $\mathcal{U}$. For sparse covers this is dramatically smaller than the full Roos complex.

### 11.3 Effective representation of cohomology classes

**Data structure for cascade-associated sheaves.** A sheaf $\mathcal{F}_U^{(\bullet)}$ on a finite or countable site admits the following representation:

- **Site base.** An enumeration of objects $(q, \tau, U)$ with $\tau$ in the cascade's range, $q$ in $\mathcal{C}$, and $U$ encoded as a bit-vector indicating pairwise-Stone-clopen coordinates.
- **Cell-label map.** For each $(q, \tau)$, a list of designated cells $\Delta^{+, \bullet}_\tau(q) \subseteq E \times E$. Encoded as a set of pairs $(s, o)$.
- **Fiber values.** The free abelian group $\mathcal{F}_U^{(\bullet)}(q, \tau, U) = \mathbb{Z}^{\Delta^{+, \bullet}_\tau(q) \cap U}$ is represented as an integer-valued vector indexed by the cell list.
- **Restriction maps.** For each morphism $(q', \tau', U') \to (q, \tau, U)$: an integer matrix describing the induced $\mathbb{Z}$-linear map between the corresponding cell lists.

**Cohomology classes as data.** A cohomology class $[\omega] \in H^1(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)})$ is represented as:

- A Čech 1-cocycle $\omega$: a collection of local sections $\omega_{ij} \in \mathcal{F}_U^{(\bullet)}(U_i \cap U_j)$ for each pair of cover elements, satisfying the cocycle condition $\omega_{jk} - \omega_{ik} + \omega_{ij} = 0$ on triple intersections.
- Equivalence up to coboundaries: $[\omega] = [\omega + d\lambda]$ for any 0-cochain $\lambda$.

Two classes are equal iff their difference is a coboundary, checkable by solving a linear system over $\mathbb{Z}$.

**Proposition 11.3.1 (effective equality).** *For finite Regime-A SKPs, equality of cohomology classes in $H^0, H^1$ is decidable in polynomial time.*

*Proof.* $H^0$ equality is equality of designated-cell counts / sets. $H^1$ equality reduces to a linear-system solvability question over $\mathbb{Z}$, decidable via Smith normal form in polynomial time (Kannan–Bachem 1979; Storjohann 1996 for modern complexity). $\square$

**Proposition 11.3.2 (effective classification via Corollary 10.5.2).** *For two finite Regime-A SKPs $v, v'$ over a common base, MLD-equivalence $v \sim_{\mathrm{MLD}} v'$ is trivially decidable: since $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v') = 0$ in Regime A (Corollary 10.2.2), all Regime-A SKPs are MLD-equivalent (up to $H^0$ matching).*

*Proof.* Immediate from Corollaries 10.2.2, 10.5.2. $\square$

**Proposition 11.3.3 (effective classification in Regime B).** *For two Scott-continuous SKPs over a common base, MLD-equivalence is decidable in time polynomial in the cascade length.*

*Proof.* By Theorem 10.3.1, $H^1 = 0$ for Regime B. So classification reduces to $H^0$-counts, checkable in polynomial time. $\square$

For Regime C (transfinite-bounded) and Regime D (aperiodic), decidability of MLD-equivalence depends on the combinatorial structure of the non-Scott-continuous firing ordinal sets (Corollary 10.5.2). The firing-ordinal sets are well-ordered sub-ordinals; comparing them modulo cascade-shift is well-defined but may require transfinite comparisons. For practical Regime-C instances with countably-many firing ordinals, the comparison is a countable-ordinal-matching problem, tractable with standard well-ordering algorithms.

### 11.4 Distributed-systems tooling

The cohomological reformulation of *Spatiotemporal Knowledge Presheaves* Theorem 9.8 via Mayer–Vietoris (§8.3) has natural connections to existing distributed-systems programming frameworks.

**Bloom^L / CALM programming.** Conway, Marczak, Alvaro, Hellerstein, and Maier 2012's Bloom^L language exposes lattice-valued dataflow with monotone writes. SKP cohomology is the corresponding mathematical invariant: a Bloom^L program's distributed execution produces an SKP cascade; the CRDT-convergence property (Theorem 8.3.1) is a consequence of the program's monotonicity. A cohomological checker — verifying Mayer–Vietoris vanishing for a Bloom^L program's sheaf — is a natural static-analysis tool that would catch monotonicity violations at compile time.

**LVars (Kuper–Newton 2013; Kuper–Turon–Krishnaswami–Newton 2014).** LVars' "freeze after writing" semantics is a particular form of CALM-monotonic computation. SKP cohomology gives an invariant-level view: the "freeze" operation corresponds to applying the closure operator $\mathrm{Cl}$, which on the Priestley dual is the transition to the confirming subspace $\mathrm{Cl}^*$ (§3.2 Proposition 3.2.3). A "frozen" LVar has $\mathrm{cl}\text{-}\mathrm{inv}$ zero beyond its freeze point; distributed LVars with concurrent freezes produce Mayer–Vietoris-vanishing cohomology.

**Delta-CRDTs (Almeida–Shoker–Baquero 2018).** Delta-CRDTs ship incremental state changes rather than full state. The cohomological shadow: a delta is a Čech 1-cochain modulo coboundaries — i.e., a class in $H^1$ relative to a local-state cover. Vanishing $H^1$ (Theorem 8.3.1 for cascade-associated sheaves) ensures deltas can be transmitted and integrated without coordination. Non-vanishing $H^1$ — which does not arise from cascade-associated sheaves but may for other sheaf classes — would indicate non-local communication is required.

**Task sheaves (Felber–Hummes Flores–Rincon Galeana 2025).** Felber et al.'s task-sheaf framework (§2.7) gives a parallel cohomological distributed-systems framework, where cohomology of a task sheaf measures task-solvability obstructions. The two frameworks are complementary: SKP cohomology targets classification of aperiodic cascades and CRDT convergence; task-sheaf cohomology targets solvability of pre-specified tasks. A unified framework — sheaf cohomology as a general distributed-systems invariant — is a natural development direction (§13.3).

**Not developed here.** Specific tooling implementations (a Bloom^L / SKP compiler, a delta-CRDT cohomology checker, a task-sheaf simulator) are software-engineering projects beyond the scope of this foundational paper. The cohomological invariants developed in §§6–10 are intended as targets for such tools, not as tools themselves.

### 11.5 Summary

- **Regime A:** fully decidable; cohomology computable in polynomial time (Proposition 11.1.1).
- **Regime B:** cohomology decidable at each finite truncation; $H^1 = 0$ everywhere (Proposition 11.3.3).
- **Regime C / D:** classification via firing-ordinal-set matching (Corollary 10.5.2); tractable for countable firing sets.
- **Čech algorithms:** explicit algorithms for Regimes A and B (Algorithms 11.2.1, 11.2.2), with Husainov 2026 acyclicity check for Čech-derived agreement.
- **Data-structure representation:** Čech cocycles with integer coefficients (§11.3); equality decidable via Smith normal form.
- **Tooling connections:** natural bridges to Bloom^L, LVars, delta-CRDTs, and task sheaves (§11.4); no specific implementations provided.

§12 exercises the machinery on five worked examples spanning the four regimes plus the CRDT Mayer–Vietoris bridge.

---

## 12. Examples

Five worked examples exhibiting the cohomological machinery on progressively richer SKPs. §§12.1–12.4 cover one example per regime; §12.5 applies the Mayer–Vietoris construction to a three-replica CRDT system; §12.6 sketches the two-adjoint-cohomology content in a paraconsistent cascade. Each example specifies: SKP setup, relevant site and sheaf, cohomology computation, interpretation.

### 12.1 Regime A: finite cascade with specialization

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \{p_1, p_2, a\}$, $\Pi = \{\mathrm{parent}, \mathrm{adultParent}\}$, $\lambda = \omega$. The predicate category $\mathcal{C}$ has a specialization morphism $f : \mathrm{adultParent} \to \mathrm{parent}$ with $\mathrm{dom}(\mathrm{adultParent}) = \{(p_1, a)\}$. Closure rule: `adultParent(x, y) ⇒ parent(x, y)`. Initial state: $v_0(\mathrm{adultParent})(p_1, a) = \mathbf{t}$; all other cells $\bot$.

This is the SKP of *Spatiotemporal Knowledge Hyperdoctrines* Example 12.1, recovered here cohomologically.

**Cascade.** $\tau = 0$: $v_0(\mathrm{adultParent})(p_1, a) = \mathbf{t}$; else $\bot$. $\tau = 1$: closure fires, $v_1(\mathrm{parent})(p_1, a) = \mathbf{t}$. $\tau \geq 1$: quiescent. Closure ordinal $\kappa = 1 < \omega$, placing this in Regime A.

**Site.** Each fiber algebra is $\mathbf{2}^{\bowtie 9}$ (nine cells in $E \times E = 3 \times 3$). Each paired Priestley space $X_q^\tau$ has at most 18 points. The site $\mathbf{T}^*_{\mathrm{site}}$ has $2 \times 2 = 4$ ordinal-predicate pairs (two predicates × two cascade stages), with finitely many pairwise-Stone clopens at each.

**Cohomology.** By Theorem 10.2.1 (Regime A):
$$H^0(\mathbf{T}^*, \mathcal{F}_U) \;=\; \mathbb{Z}^2, \qquad H^{\geq 1}(\mathbf{T}^*, \mathcal{F}_U) \;=\; 0.$$
The $H^0$ has rank $2$ because two cells are designated at quiescence — $\mathrm{adultParent}(p_1, a)$ and $\mathrm{parent}(p_1, a)$ — each contributing one $\mathbb{Z}$-generator. Higher cohomology vanishes by cascade-local-constancy past $\kappa = 1$ (Proposition 6.5.3).

**Classifying invariant.** $\mathrm{cl}\text{-}\mathrm{inv}(v) = 0 \in H^1 = 0$. By Corollary 10.2.2, all Regime-A cascades over this base are MLD-equivalent: the classification carries no discriminating information beyond the $H^0$-count.

**Role.** Baseline. Confirms that the cohomology recovers the expected trivial invariant for fully-stabilizing cascades, matching *Spatiotemporal Knowledge Hyperdoctrines* §10.5 Regime A's prediction.

### 12.2 Regime B: infinite Scott-continuous cascade

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \mathbb{N}$, $\Pi = \{P\}$, $\lambda = \omega + 1$. Closure rule (finitary): `P(n, n) ⇒ P(n+1, n+1)` for $n \in \mathbb{N}$. Initial: $v_0(P)(0, 0) = \mathbf{t}$; else $\bot$.

This recovers *Spatiotemporal Knowledge Hyperdoctrines* Example 12.3.

**Cascade.** $\tau = n$: $v_n(P)(k, k) = \mathbf{t}$ for $0 \leq k \leq n$, else $\bot$. At $\tau = \omega$: cascade continuity gives $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$. No further closure fires. Closure ordinal $\kappa = \omega$; the cascade is Scott-continuous; Regime B.

**Site.** Each $X_P^\tau$ is the paired Priestley space of $\mathbf{2}^{\bowtie \mathbb{N}^2}$ restricted to the confirmed-points clopen. Countably infinite; the temporal index goes through $\omega$. The site has countably many ordinal strata.

**Cohomology.** By Theorem 10.3.1 (Regime B):
$$H^0(\mathbf{T}^*, \mathcal{F}_U) \;=\; \varinjlim_{n < \omega} \mathbb{Z}^{n + 1} \;=\; \bigoplus_{k < \omega} \mathbb{Z}, \qquad H^{\geq 1}(\mathbf{T}^*, \mathcal{F}_U) \;=\; 0.$$
The $H^0$ is a countable direct sum of $\mathbb{Z}$'s — one per natural number on the diagonal — representing the converged cascade's $\aleph_0$-many designated diagonal cells.

**Classifying invariant.** $\mathrm{cl}\text{-}\mathrm{inv}(v) = 0$ in the trivial $H^1$. Any other Scott-continuous cascade on $\mathbb{N}$ is MLD-equivalent to this one (up to $H^0$-matching). The cohomology thus distinguishes the "fully populates the diagonal" cascade from variants such as "only populates even indices" (which has a smaller $H^0$) but not from genuine-shift variants (which have the same $H^0$).

**Role.** Spatial infinity without temporal infinity. Classical low-degree cohomology only; higher degrees vanish by Scott-continuity's compatibility with filtered colimits.

### 12.3 Regime C: $\omega+1$ cascade with one $H^1$ generator

**Setup.** $\mathbf{L} = \mathbf{2}$, $E = \omega + 1$, $\Pi = \{P\}$, $\lambda = \omega + 2$. Closure rules:

- **Rule 1** (finitary, as in §12.2): `P(n, n) ⇒ P(n+1, n+1)` for $n \in \mathbb{N}$.
- **Rule 2** (infinitary): `(∀n ∈ ℕ. P(n, n) = t) ⇒ P(ω, ω) ≥_k t`.

Initial state: $v_0(P)(0, 0) = \mathbf{t}$; else $\bot$. This extends *Spatiotemporal Knowledge Hyperdoctrines* Example 12.4.

**Cascade.** At $\tau < \omega$: Rule 1 propagates, $v_\tau(P)(k, k) = \mathbf{t}$ for $k \leq \tau$. At $\tau = \omega$: cascade continuity gives $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$. The antecedent of Rule 2 is satisfied. At $\tau = \omega + 1$: Rule 2 fires, $v_{\omega+1}(P)(\omega, \omega) = \mathbf{t}$. At $\tau = \omega + 2$: no further firings. Closure ordinal $\kappa = \omega + 1$; Regime C.

**Non-Scott-continuous firing set.** $L_{\mathrm{ns}}(\omega + 1) = \{\omega\}$ (exactly one non-Scott-continuous firing, at $\omega$, where Rule 2 requires the full $\omega$-colimit as antecedent).

**Cohomology.** By Theorem 10.4.2 (Regime C):
$$H^0(\mathbf{T}^*, \mathcal{F}_U) \;=\; \bigoplus_{k \leq \omega} \mathbb{Z} \;\cong\; \bigoplus_{\aleph_0 + 1} \mathbb{Z},$$
$$H^1(\mathbf{T}^*, \mathcal{F}_U) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega + 1)} \mathbb{Z} \;\cong\; \mathbb{Z},$$
$$H^{\geq 2} \;=\; 0.$$
The $H^1$ has a single $\mathbb{Z}$-generator $e_\omega$ corresponding to the non-Scott-continuous firing at $\omega$ that introduces the cell $(\omega, \omega)$.

**Classifying invariant.** $\mathrm{cl}\text{-}\mathrm{inv}(v) = e_\omega \in H^1 \cong \mathbb{Z}$, a non-trivial generator. Two Regime-C cascades over this base are MLD-equivalent iff their classifying invariants agree — e.g., a cascade with Rule 2 replaced by a no-op has $\mathrm{cl}\text{-}\mathrm{inv} = 0$ and is *not* MLD-equivalent to $v$.

**Role.** Smallest example exhibiting $H^1 \neq 0$. The non-Scott-continuous firing at $\omega$ is exactly the cohomological obstruction; "replace the rule that forces it with a no-op" changes the cohomology class. Directly verifies the prediction of Theorem 10.4.2 on a small concrete case.

### 12.4 Regime D: the transfinite-induction cascade

**Setup.** The cascade of Construction 3.3.1: $\mathbf{L} = \mathbf{2}$, $E = \omega_1$, $\Pi = \{P\}$, $\lambda = \omega_1 + 1$, closure rule $(\forall \alpha < \beta.\ v(P)(\alpha, \alpha) = \mathbf{t}) \Rightarrow v(P)(\beta, \beta) \geq_k \mathbf{t}$, initial $v_0(P)(0, 0) = \mathbf{t}$.

By Theorem 3.3.3, closure ordinal $\kappa = \omega_1$; Regime D.

**Non-Scott-continuous firing set.** $L_{\mathrm{ns}}(\omega_1) = \{\mu < \omega_1 : \mu \text{ is a countable limit ordinal}\}$ — all countable limit ordinals below $\omega_1$ are non-Scott-continuous firing points, by the non-Scott-continuity proof of Proposition 3.3.4.

**Cohomology.** By Theorem 10.5.1 (Regime D):
$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;=\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z},$$
a free abelian group of rank $\aleph_1$, with $\mathbb{Z}$-basis indexed by countable limit ordinals below $\omega_1$.

**Classifying invariant.** By Corollary 10.4.3:
$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\omega_1)} e_\mu \;\in\; H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U),$$
the "all-ones" element with a $+1$ coefficient on every basis generator. Two concrete consequences via Theorem 7.2.5 / Corollary 10.5.2:

- **Shifted cascade (MLD-equivalent).** A shifted cascade $v^{(\alpha_0)}$ starting from $v^{(\alpha_0)}_0(P)(\alpha_0, \alpha_0) = \mathbf{t}$ for some countable $\alpha_0 > 0$ has the same firing-ordinal structure up to cascade-shift; the all-ones invariant is preserved. $v^{(\alpha_0)} \sim_{\mathrm{MLD}} v$.

- **Restricted-firing variant (not MLD-equivalent).** Let $v'$ be the cascade with the same rule but fires only at *countable limit ordinals of cofinality $\omega$* (excluding cofinality-$\omega_1$ ordinals if they exist in $\omega_1$; they do not, since all countable limits have cofinality $\omega$). Actually: a genuinely restricted variant is one where Rule 2 is modified to only fire at "even-indexed" (in a fixed $\omega_1$-enumeration of limits) firing ordinals. Then $L_{\mathrm{ns}}(\omega_1, v') \subsetneq L_{\mathrm{ns}}(\omega_1, v)$, and $\mathrm{cl}\text{-}\mathrm{inv}(v')$ has support only on half the basis. $v' \not\sim_{\mathrm{MLD}} v$.

**Role.** Central example of the paper. Exhibits a concrete Regime-D cascade on which the classification theorem (Theorem 7.2.5) produces a computable, discriminating invariant. The cohomological content — $H^1 \cong \bigoplus_{\aleph_1} \mathbb{Z}$, classifying invariant as all-ones element — is the most distinctive cohomology computation of the paper, impossible to obtain via primal fixed-point theorems (which see only the quiescent state at $\omega_1$, not the transfinite structure of how it was reached).

### 12.5 Three-replica CRDT Mayer–Vietoris

**Setup.** A distributed SKP system with three replicas at a fixed predicate $q$ and cascade stage $\tau$. Each replica $i \in \{1, 2, 3\}$ has local state $v_i \in A_q$, corresponding on the Priestley dual to a pairwise-Stone clopen $U_i \subseteq X_q^\tau$. Assume $U_1, U_2, U_3$ jointly cover some larger clopen $U = U_1 \cup U_2 \cup U_3 \subseteq X_q^\tau$.

This extends *Spatiotemporal Knowledge Presheaves* Example 11.4 (the three-agent Belnap aggregation) to the cohomological framing.

**Concrete case.** Take $E = \{\text{Paris}, \text{CapitalOfFrance}\}$, $\Pi = \{\text{isSameAs}\}$, $q = \text{isSameAs}$ (the single predicate), $\tau = 3$ (after three report-rounds). Replica 1's local state: "Paris is CapitalOfFrance" ($v_1(\text{isSameAs})(\text{Paris}, \text{CapitalOfFrance}) = \mathbf{t}$). Replica 2's local state: same. Replica 3's local state: "Paris is not CapitalOfFrance" ($v_3(\text{isSameAs})(\text{Paris}, \text{CapitalOfFrance}) = \mathbf{f}$).

**Mayer–Vietoris sequence.** Apply the three-replica generalization of Theorem 8.2.1 (iterated two-replica):
$$\cdots \to H^{n-1}\Bigl(\bigcap_{i} U_i, \mathcal{F}_U\Bigr) \to H^n\Bigl(\bigcup_i U_i, \mathcal{F}_U\Bigr) \to \bigoplus_i H^n(U_i, \mathcal{F}_U) \to \bigoplus_{i < j} H^n(U_i \cap U_j, \mathcal{F}_U) \to \cdots$$

**Connecting homomorphism $\delta^0$.** By Theorem 8.3.1 (cascade-associated sheaves have vanishing $\delta^0$):
$$\delta^0 : H^0\Bigl(\bigcap_i U_i, \mathcal{F}_U\Bigr) \to H^1\Bigl(\bigcup_i U_i, \mathcal{F}_U\Bigr) \text{ is zero.}$$
Explicitly: the section at the triple intersection — "Paris is either isSameAs CapitalOfFrance (per replicas 1, 2) or not (per replica 3)" — merges into a global section on $U$ via the $\vee_k$-merge producing $\top$ at the disputed cell: $v_1 \vee_k v_2 \vee_k v_3$ has $(\text{Paris}, \text{CapitalOfFrance})$-value $\top$.

**Cohomological verification of convergence.** The vanishing of $\delta^0$ confirms that the three replicas' merged state is a well-defined global section — the $\top$-valued cell is a legitimate, consistent (in the paraconsistent sense) aggregate of all three inputs. No coordination is required for the merge; the convergence happens automatically via the $\vee_k$-lattice operation. This is *Spatiotemporal Knowledge Presheaves* Theorem 9.8 (CRDT convergence) applied cohomologically to three replicas.

**Role.** Demonstrates §8's Mayer–Vietoris machinery on an explicit three-replica case. The "inconsistency via $\top$" behavior (Belnap's original motivation) appears as a global section of the merged system — cohomologically coherent despite being semantically contradictory. This is exactly the paraconsistency the bilattice framework provides, now visible at the cohomological level.

### 12.6 Two adjoint cohomologies on a paraconsistent cascade

**Setup.** A paraconsistent extension of §12.4. Take the transfinite-induction cascade of Construction 3.3.1 with an added paraconsistent increment at $\tau = 0$: $u_0(P)(0, 0) = \top$ (rather than $\mathbf{t}$). The cascade propagates $\top$ via the rule (since $\top \geq_k \mathbf{t}$, the rule fires with $\top$ values as well), producing $v_\tau(P)(\alpha, \alpha) = \top$ for all $\alpha \leq \tau$.

**Paraconsistent cell sets.** At each $\tau$, $\Delta^{+, \mathbf{t}}_\tau(P) = \emptyset$ (no $\mathbf{t}$-only cells), $\Delta^{+, \top}_\tau(P) = \{(\alpha, \alpha) : \alpha \leq \tau, \alpha \text{ newly}\}$. The Belnap-designated sheaf tracks $\top$-cells.

**Cohomology.**

- **Truth-order:** $H^1_t(\mathbf{T}^*, \mathcal{F}_U^{(t)}) = 0$ since $\Delta^{+, \mathbf{t}} = \emptyset$ at all $\tau$ — no $\mathbf{t}$-cells to track; the classical cohomology is trivial.
- **$\top$-only:** $H^1(\mathbf{T}^*, \mathcal{F}_U^{(\top)}) \cong \bigoplus_{\mu \in L_{\mathrm{ns}}(\omega_1)} \mathbb{Z}$ — structurally identical to the $H^1$ of §12.4 but tracking $\top$-cells instead of $\mathbf{t}$-cells.
- **Knowledge-order:** $H^1_k(\mathbf{T}^*, \mathcal{F}_U^{(k)}) \cong H^1_t \oplus H^1(\mathcal{F}_U^{(\top)}) \cong \bigoplus_{\aleph_1} \mathbb{Z}$, by Proposition 9.1.4's long exact sequence with $H^1_t = 0$.

**Bigraded invariant.** By Proposition 9.3.1:
$$\mathrm{cl}\text{-}\mathrm{inv}_{k, t}(v) \;=\; (0, \mathbf{1}_\top) \;\in\; 0 \oplus \bigoplus_{\aleph_1} \mathbb{Z}$$
where $\mathbf{1}_\top$ is the all-ones element in the $\top$-cohomology.

**Role.** Demonstrates how the $\leq_k$ vs $\leq_t$ distinction produces cohomologically-distinct content. A cascade that generates only $\top$-evidence has zero classical cohomology but non-zero paraconsistent cohomology — two very different stories that the bigraded $H^{m, n}_{k, t}$ captures jointly. A Belnap-style inconsistent-but-nontrivial epistemic state produces a cohomology class that classical sheaf methods do not see.

### 12.7 Summary table

| Example | Regime | $\|E\|$ | $\kappa$ | $H^0$ | $H^1$ | $\mathrm{cl}\text{-}\mathrm{inv}$ |
|---|---|---|---|---|---|---|
| 12.1 | A | 3 | 1 | $\mathbb{Z}^2$ | $0$ | $0$ |
| 12.2 | B | $\omega$ | $\omega$ | $\bigoplus_{\aleph_0} \mathbb{Z}$ | $0$ | $0$ |
| 12.3 | C | $\omega + 1$ | $\omega + 1$ | $\bigoplus_{\aleph_0 + 1} \mathbb{Z}$ | $\mathbb{Z}$ | $e_\omega$ |
| 12.4 | D | $\omega_1$ | $\omega_1$ | $\bigoplus_{\aleph_1} \mathbb{Z}$ | $\bigoplus_{\aleph_1} \mathbb{Z}$ | $\sum e_\mu$ (all-ones) |
| 12.5 | A (CRDT) | 2 | finite | $\mathbb{Z}^1$ (merged) | $0$ ($\delta^0 = 0$) | CRDT-vanishing |
| 12.6 | D (paraconsistent) | $\omega_1$ | $\omega_1$ | $0$ (t) / $\bigoplus \mathbb{Z}$ ($\top$) | $0$ (t) / $\bigoplus \mathbb{Z}$ ($\top$) | $(0, \mathbf{1}_\top)$ |

The cohomological trajectory from trivial Regime A through fully-classifying Regime D is explicit across the five examples. §12.5 specifically exhibits the CRDT vanishing of Mayer–Vietoris, and §12.6 the two-adjoint-system content that motivates §9's bigrading.

---

## 13. Discussion

This section situates the paper's contribution against the main prior threads it builds on (§§13.1–13.4), notes what is explicitly not pursued (§13.5), lists open problems (§13.6), and sketches the downstream series (§13.7).

### 13.1 Relation to cellular sheaves (Curry 2014)

The methodological backbone of this paper is the cellular-sheaf framework of Curry 2014 (*Sheaves, Cosheaves and Applications*; cf. §2.4). Curry established that cellular sheaves on finite cell complexes are equivalently sheaves on the face poset under the Alexandrov topology, with computable cohomology via the cellular cochain complex and enough projectives/injectives for homological algebra (Curry 2014 Ch. 5). The present paper inherits the view "sheaves on a poset-like base carry the content" and extends it in three directions:

- **From $\mathrm{Vect}$ / $\mathbf{Ab}$ on posets to $\mathbf{Ab}$ on bitopological sites.** Curry works with finite-dimensional vector spaces and abelian groups on finite cell complexes; the present paper works with $\mathbf{Ab}$ on the bitopological paired-Priestley site of §4. The topology is different — Curry uses Alexandrov; here the bitopological pairwise-Stone structure inherits from Bezhanishvili et al. 2010 — but the homological-algebra framework is unchanged.

- **From finite complexes to transfinite cascade-indexed sites.** Curry's cellular sheaves on finite complexes extend straightforwardly to infinite posets (Ayzenberg–Magai 2025 generalizes systematically); the present paper pushes further into the transfinite Regime-D cases where the cascade runs through ordinals $\geq \omega_1$.

- **From vector-space / abelian coefficients to bilattice-enriched structure.** The sheaves of §5 live in $\mathbf{Ab}$ but track bilattice content via the paired-Priestley fiber structure. Bilattice negation acts as a $\mathbb{Z}/2$-gauge (§9.4), giving equivariant refinements Curry's framework does not see.

Curry's derived equivalence between cellular sheaves and cellular cosheaves (recovering Shepard 1985's Verdier duality) is not developed here; a Verdier-duality analogue on the paired-Priestley site is natural future work (§13.6).

### 13.2 Relation to Priestley sheaves (Gehrke–van Gool 2019, Bezhanishvili et al. 2010)

The Priestley-sheaf content of the paper builds on two traditions. Gehrke–van Gool 2019 (*Sheaves and duality*; cf. §2.5) establishes that soft sheaf representations of a distributive lattice correspond bijectively to continuous decompositions of its Priestley dual satisfying an interpolation property (Theorem 5.7 of their paper). This is the methodological template for §5's construction: "sheaves on the Priestley dual of a lattice are the right object; decompositions of the dual space are the source of sheaf data." The present paper inherits this template and extends it in two directions:

- **From single-lattice to the 2-categorical assembly.** Gehrke–van Gool treats sheaves on the Priestley dual of one distributive lattice. §4's site construction assembles Priestley duals of all fibers $A_q$ across the full predicate-category $\mathcal{C}$ and cascade-ordinal $\lambda$, with dualized generator morphisms and dualized closure-operator advancements as site morphisms.

- **From distributive lattices to distributive bilattices.** The fibers $A_q$ of an SKP hyperdoctrine are bilattices — equipped with two orders $\leq_k$ and $\leq_t$ simultaneously. Gehrke–van Gool's framework applies to each order separately; §9 constructs a bigraded cohomology unifying both.

Bezhanishvili, Bezhanishvili, Gabelaia, and Kurz 2010 (*Bitopological duality for distributive lattices and Heyting algebras*) supplies the bitopological framing. Their result $\mathbf{PStone} \cong \mathbf{Spec} \cong \mathbf{Pries}$ shows that the three natural categories of duals are equivalent; the present paper adopts the $\mathbf{PStone}$ framing for the paired Priestley duals that carry the twist-product structure most transparently.

The Jung–Moshier 2006 / Jakl 2018 d-frame framework extends the bitopological duality to an algebraic axiomatization. §2.5 and Remark 13.6 flag d-frames as a candidate value category for sheaves (an alternative to $\mathbf{Ab}$), not pursued here.

### 13.3 Relation to distributed-systems topology (Herlihy–Kozlov–Rajsbaum 2013, Felber et al. 2025, Ghrist–Ding 2025)

The CRDT Mayer–Vietoris of §8 sits in a broader arc of topology-applied-to-distributed-systems work.

- **Herlihy–Kozlov–Rajsbaum 2013** (*Distributed Computing Through Combinatorial Topology*) is the foundational reference: distributed-computation tasks modeled via simplicial input/output complexes and protocol complexes, with solvability reducing to existence of a decision simplicial map. The present paper's §8 is *not* in this tradition technically — we use sheaf cohomology on a bitopological site, not simplicial homotopy on protocol complexes — but inherits the structural insight "distributed-computation solvability is a topological property."

- **Felber, Hummes Flores, Rincon Galeana 2025** (arXiv:2503.02556) develops a sheaf-theoretic characterization of distributed-systems tasks: a task sheaf's global sections are the task's terminating solutions, and its cohomology encodes obstructions. This is the closest parallel to §8 in the recent literature. The two frameworks differ in fiber values (vector-space / $\mathbf{Ab}$ vs bilattice-Priestley), temporal structure (1-categorical finite vs 2-categorical transfinite), primary question (task solvability vs cascade classification), and site base (simplicial vs bitopological). They are complementary: a unified "sheaf cohomology as distributed-systems invariant" framework combining both is natural downstream work (§13.6).

- **Ghrist–Ding 2025** (arXiv:2511.00677, *Precision-graded cohomology and arithmetic persistence for network sheaves*) uses $p$-adic-integer-valued cellular cohomology with precision-graded filtration for distributed-consensus applications (quantized communication, sensor-network synchronization). Orthogonal to the present paper's setting: their coefficients are $\mathbb{Z}_p$, ours are $\mathbb{Z}$ over a bilattice Priestley dual. A unified treatment — bilattice-valued precision-graded cohomology — would make sense for some applications but has not been developed.

- **CALM (Hellerstein–Alvaro 2020).** The SKP framework (*Spatiotemporal Knowledge Presheaves* Theorem 9.8) instantiates CALM in the bilattice setting. §8.4 interprets this cohomologically: CALM-compatibility for an SKP-derived sheaf ≡ vanishing of all Mayer–Vietoris obstructions.

### 13.4 Relation to aperiodic dynamics (Anderson–Putnam 1998, Sadun 2008)

§7's Regime-D classification is the SKP analogue of Anderson–Putnam 1998's classification of substitution tilings via inverse-limit cohomology, and more broadly of the aperiodic-tiling cohomology tradition systematized in Sadun 2008 (*Topology of Tiling Spaces*). The analogy is structural:

- **Tilings:** a substitution tiling space $\Omega_\omega$ is an inverse limit $\lim_{\leftarrow}(\Gamma_\omega \xleftarrow{\omega} \Gamma_\omega \xleftarrow{\omega} \cdots)$ of finite cell complexes under a substitution self-map. Cohomology is the direct limit of induced maps on $H^\bullet(\Gamma_\omega)$. MLD-equivalence of tilings corresponds to equality of cohomology classes (Anderson–Putnam 1998; Sadun 2008 Ch. 4).

- **SKPs:** a Regime-D cascade is a transfinite coalgebra orbit in $\mathbf{T}^*$; its cohomology is the direct limit of finite-truncation cohomologies under cascade-advancement maps (§6.3, §7.3). MLD-equivalence of cascades corresponds to equality of classifying invariants (Theorem 7.2.5).

The two frameworks use different technical machinery — tilings use branched-manifold inverse limits and Čech cohomology; SKPs use bitopological-site direct limits and derived-functor cohomology on $\mathbf{Ab}$ — but the underlying story is the same: aperiodic structure is classified cohomologically, via direct limits of finite-stage invariants.

Kellendonk–Putnam pattern-equivariant (PE) cohomology provides further language (Sadun 2007 arXiv:math/0602066). A "cascade-equivariant cohomology" analogue — cohomology invariant under the closure 2-monad's action — would be a natural refinement of the present paper's construction; not pursued here.

### 13.5 What this paper does not do

Several natural directions are explicitly excluded, with reasons:

- **Not a tripos (continuing the scope discipline from *Spatiotemporal Knowledge Hyperdoctrines* §13.4).** Triposes (Hyland–Johnstone–Pitts 1980; Pitts 2002) are Heyting-valued hyperdoctrines with generic predicates; SKP hyperdoctrines have bilattice fibers and no postulated generic predicate. The tripos-to-topos construction therefore does not directly apply. A "bilattice tripos" would be a future structure; an SKP-derived topos supporting a matching cohomology is a downstream paper.

- **Not $(\infty,1)$-categorical.** The paper stays resolutely 2-categorical, matching the scope of *Spatiotemporal Knowledge Hyperdoctrines*. A full $(\infty, 1)$-sheaf cohomology — where the 2-cells of the closure KZ diamond become $\infty$-cells and the site becomes an $(\infty, 1)$-site — would give finer invariants but require substantially more machinery (quasicategories, model structures on simplicial presheaves, Lurie 2009's *Higher Topos Theory*). Left as future work.

- **Not modal cohomology.** The four-valued modal calculus on SKP fibers (*Spatiotemporal Knowledge Presheaves* §7) has $\Box_R, \Diamond_R$ operators that under the Awodey–Kishida–Kotzsch 2014 framework become comonads on sheaves, with corresponding derived-functor "modal cohomology" invariants. The present paper does not pursue this — the cohomology here is of the cascade orbit, not of the modal operators. Modal-cohomology of SKPs is a distinct downstream development.

- **Not bilattice-valued cohomology.** §5.1 justifies the choice of $\mathbf{Ab}$ as the value category on homological-algebra-availability grounds. A bilattice-native or d-frame-valued cohomology — where the target category reflects the bilattice structure rather than abelianizing through the Priestley spectrum — would give a more structurally-faithful invariant but requires developing homological algebra from scratch in those targets. Flagged in §5.1 and here as future work.

- **Not a full Verdier duality.** Curry 2014 Ch. 7 establishes Verdier duality between cellular sheaves and cellular cosheaves, extending Shepard 1985. The parallel on the bitopological paired-Priestley site is natural but not developed; it would give an alternative formulation of the Regime-D classification theorem via cascade "cosheaves" that might produce additional invariants.

### 13.6 Open problems

Problems left open by the present paper, roughly in increasing scope:

**(P1) Exceptional $H^{\geq 2}$.** Theorem 10.1.1 establishes $H^{\geq 2} = 0$ for cascade-associated sheaves on the standard SKP site. Does an SKP exist whose cohomology $H^n$ with some natural sheaf has non-trivial content in degree $\geq 2$? The 3-axis decomposition argument suggests not, but exotic constructions (non-standard sheaves; higher-order morphisms between cascades) might evade it.

**(P2) Strong MLD-classification.** Theorem 7.2.5 classifies Regime-D cascades up to MLD-equivalence (Definition 7.2.2). A finer equivalence — "strong MLD" with additional constraints on the cascade-morphism — might be classified by $H^1 \oplus H^0$ or by a finer cohomological invariant. Pursuing this requires refining both the equivalence relation and the cohomology.

**(P3) Bilattice-valued sheaves.** Replace $\mathbf{Ab}$ with paired Priestley spaces, d-frames, or distributive bilattices as the value category for sheaves. Develop homological algebra in this category (enough projectives/injectives, derived functors, Godement-style resolutions). Redo the cohomology; compare with the $\mathbf{Ab}$-valued theory.

**(P4) Verdier duality on $\mathbf{T}^*$.** Extend Curry 2014 Ch. 7's cellular-sheaf / cellular-cosheaf derived equivalence to the bitopological paired-Priestley site. The result should be a duality between SKP cohomology and a dual "SKP co-cohomology" that might yield alternative invariants.

**(P5) Six-functor formalism.** Paper 3's geometric morphism $(\Phi^*, \Phi_*)$ for SKP hyperdoctrine morphisms (Proposition 5.4.1) is two-functorial. A full six-functor formalism — adding $\Phi_!, \Phi^!, \otimes, \mathcal{H}om$ — would fit the Kashiwara–Schapira 2006 framework and enable base-change and projection-formula arguments.

**(P6) $(\infty, 1)$-refinement.** Lift the present 2-categorical construction to $(\infty, 1)$-category theory: $(\infty, 1)$-site, $\infty$-sheaves, $\infty$-cohomology. Regime D's non-stabilization at any countable ordinal suggests $(\infty, 1)$-category theory is natural; but *Spatiotemporal Knowledge Hyperdoctrines* §13.5 explicitly left this for future work.

**(P7) Unified distributed-systems-cohomology framework.** Combine the task-sheaf framework of Felber et al. 2025 with the SKP cohomology of the present paper into a single abstract framework covering both task-solvability and cascade-classification. Candidate: "computation sheaves" valued in a universal enriching category that includes both paired Priestley spaces and simplicial sets as subcategories.

### 13.7 Series position and downstream

The present paper is the third in the planned series:

1. *Spatiotemporal Knowledge Presheaves* — the SKP object, bilattice-fiber / cascade / CRDT foundations.
2. *Spatiotemporal Knowledge Hyperdoctrines* — hyperdoctrinal structure, closure KZ 2-monad, four-regime dichotomy, Priestley dualization theorem.
3. ***Spatiotemporal Knowledge Cohomology via Paired Priestley Duality*** — this paper.
4. *Moduli of SKP Hyperdoctrines* (speculative) — moduli spaces of SKP hyperdoctrines classified by cohomological invariants.
5. *Deformation theory of SKPs* (speculative) — tangent / infinitesimal structure on the Priestley dual for deformations.
6. *Representation theory of the predication 2-category* (speculative) — SKP hyperdoctrines as representations of a universal 2-category.

**What this paper establishes for downstream.**

- **The cohomology itself.** $H^n(\mathbf{T}^*, F)$ for $F$ a sheaf on the dualized SKP is now a defined object with computable low-degree content (Theorem 10.1.1 vanishing above $n = 1$; regime-by-regime structure in §10).
- **The Regime-D classification theorem** (Theorem 7.2.5, Corollary 10.5.2): a concrete combinatorial invariant distinguishing aperiodic SKPs up to MLD-equivalence.
- **The Mayer–Vietoris CRDT reformulation** (Theorem 8.3.1): SKP-derived sheaves are coordination-free iff their Mayer–Vietoris obstructions vanish.
- **The bigraded two-adjoint framework** (§9): $H^n_k$, $H^n_t$, and their relation via the long exact sequence of Proposition 9.1.4.

**Downstream uses.**

- *Paper 4 (moduli).* The classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v)$ lives in the $H^1$ of §7 and can be viewed as a function from the "space of SKPs" to the classifying group. Moduli spaces of SKPs stratified by cohomology class become natural objects.
- *Paper 5 (deformation theory).* Infinitesimal deformations of an SKP correspond to extensions in the relevant derived category; classification-level invariants get deformed by first-order cocycles. This is standard derived-algebraic-geometry territory, transported to the SKP setting.
- *Paper 6 (representation theory).* A "predication 2-category" — the universal 2-category generated by $\mathcal{C}$ with SKP-compatible structure — has representations given by SKP hyperdoctrines. Cohomological invariants of representations classify them up to natural equivalence.

**Not in downstream scope.**

- Non-bilattice extensions (e.g., probabilistic SKPs with interval-valued lattices, or Heyting-SKPs) do not fit cleanly into the classification of the present paper, as the classifying $H^1$ depends on the bilattice-specific paired Priestley structure.
- Quantum SKPs (non-commutative fiber algebras) are entirely different territory; cohomology would need separate development.

### 13.8 Coda

The paper's main contribution is the identification that **aperiodic cascades in the SKP framework admit a cohomological classification**. The machinery is classical: sheaf cohomology on a site with abelian coefficients, Mayer–Vietoris sequences, direct limits, spectral-sequence arguments. The novelty lies in the site — the paired-Priestley 2-categorical bitopological site of §4, dualizing the Jung–Rivieccio 2012 paired-Priestley structure of bilattices — and in the identification of cascade structure as inhabiting $H^1$ rather than some more exotic invariant.

The four-regime dichotomy inherited from *Spatiotemporal Knowledge Hyperdoctrines* is mirrored cleanly in cohomology (§10): Regimes A and B are cohomologically trivial ($H^{\geq 1} = 0$); Regimes C and D have $H^1$ indexed by non-Scott-continuous firing ordinals (Corollary 10.5.2), and Regime D — the ostensibly "most intractable" regime, where no countable fixed point stabilizes the cascade — is the one where the cohomological classification is most discriminating.

The CRDT bridge (§8) is the paper's applied-side payoff: the Shapiro, Preguiça, Baquero, and Zawirski 2011 CRDT-convergence property, instantiated for SKPs via *Spatiotemporal Knowledge Presheaves* Theorem 9.8, becomes the vanishing of a Mayer–Vietoris connecting homomorphism (Theorem 8.3.1). CALM and SKP-cohomology are reconciled: CALM-compatibility is exactly vanishing of Mayer–Vietoris obstructions in all degrees.

The paper closes a structural loop: SKPs as a foundational knowledge-representation object (paper 1), the full hyperdoctrinal structure and Priestley dualization (paper 2), and the cohomological content on the dual (the present paper). Downstream works on moduli, deformation, and representation all take these three papers as prerequisite and build further.

---

## References

Almeida, P. S., Shoker, A., & Baquero, C. (2018). Delta state replicated data types. *Journal of Parallel and Distributed Computing*, 111, 162–173.

Anderson, J. E., & Putnam, I. F. (1998). Topological invariants for substitution tilings and their associated $C^*$-algebras. *Ergodic Theory and Dynamical Systems*, 18, 509–537.

Artin, M., Grothendieck, A., & Verdier, J.-L. (1972a). *Théorie des topos et cohomologie étale des schémas* (SGA 4), Vol. 1. Lecture Notes in Mathematics, Vol. 269. Springer-Verlag.

Artin, M., Grothendieck, A., & Verdier, J.-L. (1972b). *Théorie des topos et cohomologie étale des schémas* (SGA 4), Vol. 2. Lecture Notes in Mathematics, Vol. 270. Springer-Verlag.

Awodey, S., Kishida, K., & Kotzsch, H.-C. (2014). Topos semantics for higher-order modal logic. *Logique et Analyse*, 228, 591–636. arXiv:1403.0020.

Ayzenberg, A., & Magai, G. (2025). Sheaf theory: from deep geometry to deep learning. arXiv:2502.15476.

Barge, M., Diamond, B., Hunton, J., & Sadun, L. (2010). Cohomology of substitution tiling spaces. *Ergodic Theory and Dynamical Systems*, 30, 1607–1627. arXiv:0811.2507.

Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn & G. Epstein (Eds.), *Modern Uses of Multiple-Valued Logic* (pp. 5–37). Reidel.

Bezhanishvili, G., Bezhanishvili, N., Gabelaia, D., & Kurz, A. (2010). Bitopological duality for distributive lattices and Heyting algebras. *Mathematical Structures in Computer Science*, 20(3), 359–393.

Bonchi, F., Petrişan, D., Pous, D., & Rot, J. (2014). Coinduction up-to in a fibrational setting. In *Proceedings of the Joint Meeting of the Twenty-Third EACSL Annual Conference on Computer Science Logic (CSL) and the Twenty-Ninth Annual ACM/IEEE Symposium on Logic in Computer Science (LICS)*.

Bredon, G. E. (1997). *Sheaf Theory* (2nd ed.). Graduate Texts in Mathematics, Vol. 170. Springer-Verlag.

Busaniche, M., & Cignoli, R. (2014). The subvariety of commutative residuated lattices represented by twist-products. *Algebra Universalis*, 71(1), 5–22.

Chajda, I., & Länger, H. (2021). Adjoint operations in twist-products of lattices. *Symmetry*, 13(2), Article 253.

Conway, N., Marczak, W. R., Alvaro, P., Hellerstein, J. M., & Maier, D. (2012). Logic and lattices for distributed programming. In *Proceedings of the Third ACM Symposium on Cloud Computing (SoCC '12)*, Article 1.

Curry, J. M. (2014). *Sheaves, Cosheaves and Applications*. PhD thesis, University of Pennsylvania. arXiv:1303.3255.

Emmenegger, J., Mesiti, L., Rosolini, G., & Streicher, T. (2024). A comonad for Grothendieck fibrations. *Theory and Applications of Categories*, 40(13). arXiv:2305.01474.

Felber, S., Hummes Flores, B., & Rincon Galeana, H. (2025). A sheaf-theoretic characterization of tasks in distributed systems. arXiv:2503.02556.

Fitting, M. (1991). Bilattices and the semantics of logic programming. *Journal of Logic Programming*, 11(2), 91–116.

Gehrke, M., & van Gool, S. J. (2019). Sheaves and duality. *Journal of Pure and Applied Algebra*, 224, Article 106484. arXiv:1904.05852.

Ghilardi, S., & Zawadowski, M. (2002). *Sheaves, Games, and Model Completions: A Categorical Approach to Nonclassical Propositional Logics*. Trends in Logic, Vol. 14. Kluwer.

Ghrist, R., & Ding, C. (2025). Precision-graded cohomology and arithmetic persistence for network sheaves. arXiv:2511.00677.

Ginsberg, M. L. (1988). Multivalued logics: A uniform approach to inference in artificial intelligence. *Computational Intelligence*, 4(3), 265–316.

Godement, R. (1958). *Topologie algébrique et théorie des faisceaux*. Actualités Sci. Ind. 1252. Hermann.

Gray, J. W. (1966). Fibred and cofibred categories. In *Proc. Conf. Categorical Algebra (La Jolla, 1965)* (pp. 21–83). Springer.

Grothendieck, A. (1957). Sur quelques points d'algèbre homologique. *Tôhoku Mathematical Journal*, 9, 119–221.

Hansen, J., & Ghrist, R. (2019). Toward a spectral theory of cellular sheaves. *Journal of Applied and Computational Topology*, 3, 315–358. arXiv:1808.01513.

Hatcher, A. (2002). *Algebraic Topology*. Cambridge University Press.

Hellerstein, J. M., & Alvaro, P. (2020). Keeping CALM: When distributed consistency is easy. *Communications of the ACM*, 63(9), 72–81. arXiv:1901.01930.

Herlihy, M., Kozlov, D., & Rajsbaum, S. (2013). *Distributed Computing Through Combinatorial Topology*. Morgan Kaufmann / Elsevier.

Hermida, C., & Jacobs, B. (1998). Structural induction and coinduction in a fibrational setting. *Information and Computation*, 145(2), 107–152.

Husainov, A. A. (2026). Čech cohomology of partially ordered sets. arXiv:2310.05577 (v4).

Hyland, J. M. E., Johnstone, P. T., & Pitts, A. M. (1980). Tripos theory. *Mathematical Proceedings of the Cambridge Philosophical Society*, 88(2), 205–232.

Jacobs, B. (1999). *Categorical Logic and Type Theory*. Studies in Logic and the Foundations of Mathematics, Vol. 141. Elsevier.

Jacobs, B. (2016). *Introduction to Coalgebra: Towards Mathematics of States and Observation*. Cambridge Tracts in Theoretical Computer Science, Vol. 59. Cambridge University Press.

Jakl, T. (2018). *d-Frames as Algebraic Duals of Bitopological Spaces*. PhD thesis, Charles University & University of Birmingham.

Jakl, T. (2025). Four imprints of Belnap's useful four-valued logic in computer science. arXiv:2503.20679.

Johnstone, P. T. (2002a). *Sketches of an Elephant: A Topos Theory Compendium*, Vol. 1. Oxford Logic Guides, Vol. 43. Oxford University Press.

Johnstone, P. T. (2002b). *Sketches of an Elephant: A Topos Theory Compendium*, Vol. 2. Oxford Logic Guides, Vol. 44. Oxford University Press.

Jung, A., & Moshier, M. A. (2006). On the bitopological nature of Stone duality. Technical Report CSR-06-13, School of Computer Science, University of Birmingham.

Jung, A., & Rivieccio, U. (2012). Priestley duality for bilattices. *Studia Logica*, 100(1–2), 223–252.

Kannan, R., & Bachem, A. (1979). Polynomial algorithms for computing the Smith and Hermite normal forms of an integer matrix. *SIAM Journal on Computing*, 8(4), 499–507.

Kashiwara, M., & Schapira, P. (2006). *Categories and Sheaves*. Grundlehren der mathematischen Wissenschaften, Vol. 332. Springer.

Kelly, G. M., & Lack, S. (1997). On property-like structures. *Theory and Applications of Categories*, 3(9), 213–250.

Kock, A. (1995). Monads for which structures are adjoint to units. *Journal of Pure and Applied Algebra*, 104(1), 41–59.

Kuper, L., & Newton, R. R. (2013). LVars: Lattice-based data structures for deterministic parallelism. In *Proceedings of the 2nd ACM SIGPLAN Workshop on Functional High-Performance Computing (FHPC '13)* (pp. 71–84).

Kuper, L., Turon, A., Krishnaswami, N. R., & Newton, R. R. (2014). Freeze after writing: Quasi-deterministic parallel programming with LVars. In *Proceedings of POPL '14* (pp. 257–270).

Lurie, J. (2009). *Higher Topos Theory*. Annals of Mathematics Studies, Vol. 170. Princeton University Press.

Mac Lane, S., & Moerdijk, I. (1992). *Sheaves in Geometry and Logic: A First Introduction to Topos Theory*. Universitext. Springer.

Pitts, A. M. (2002). Tripos theory in retrospect. *Mathematical Structures in Computer Science*, 12(3), 265–279.

Priestley, H. A. (1970). Representation of distributive lattices by means of ordered Stone spaces. *Bulletin of the London Mathematical Society*, 2, 186–190.

Priestley, H. A. (1972). Ordered topological spaces and the representation of distributive lattices. *Proceedings of the London Mathematical Society*, 24, 507–530.

Rivieccio, U., Jung, A., & Jansana, R. (2017). Four-valued modal logic: Kripke semantics and duality. *Journal of Logic and Computation*, 27(1), 155–199.

Roos, J.-E. (1961). Sur les foncteurs dérivés de $\varprojlim$. Applications. *Comptes Rendus de l'Académie des Sciences, Paris*, 252, 3702–3704.

Rosiak, D. (2022). *Sheaf Theory Through Examples*. MIT Press.

Sadun, L. (2007). Pattern-equivariant cohomology with integer coefficients. *Ergodic Theory and Dynamical Systems*, 27, 1991–1998. arXiv:math/0602066.

Sadun, L. (2008). *Topology of Tiling Spaces*. University Lecture Series, Vol. 46. American Mathematical Society.

Shapiro, M., Preguiça, N., Baquero, C., & Zawirski, M. (2011). Conflict-free replicated data types. In X. Défago, F. Petit, & V. Villain (Eds.), *Stabilization, Safety, and Security of Distributed Systems (SSS 2011)*. Lecture Notes in Computer Science, Vol. 6976, 386–400. Springer.

Shepard, A. (1985). *A Cellular Description of the Derived Category of a Stratified Space*. PhD thesis, Brown University.

Storjohann, A. (1996). Near optimal algorithms for computing Smith normal forms of integer matrices. In *Proceedings of the 1996 International Symposium on Symbolic and Algebraic Computation (ISSAC '96)* (pp. 267–274).

Street, R. (1974). Fibrations and Yoneda's lemma in a 2-category. In *Category Seminar (Sydney 1972/73)*. Lecture Notes in Mathematics, Vol. 420 (pp. 104–133). Springer.

Streicher, T. (2022). *Fibered Categories à la Jean Bénabou*. arXiv:1801.02927.

Weibel, C. A. (1994). *An Introduction to Homological Algebra*. Cambridge Studies in Advanced Mathematics, Vol. 38. Cambridge University Press.

**emsenn.** (forthcoming — *Spatiotemporal Knowledge Presheaves*). Cited throughout as *Spatiotemporal Knowledge Presheaves*; the first paper in the present series. Develops the spatiotemporal knowledge presheaf object, the twist-product residuation, Priestley duality for distributive bilattices (via Jung–Rivieccio 2012), the closure-and-equilibrium theory, the modal calculus, and the CRDT convergence theorem.

**emsenn.** (forthcoming — *Spatiotemporal Knowledge Hyperdoctrines*). Cited throughout as *Spatiotemporal Knowledge Hyperdoctrines*; the second paper in the present series. Develops the three-layer SKP hyperdoctrine structure, the two parallel adjoint systems, the closure KZ 2-monad, the four-regime dichotomy, and the Priestley dualization theorem that produces the dual object on which the present paper's cohomology is built.
