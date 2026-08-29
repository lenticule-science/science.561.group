---

title: "The Adjoint Structure of Predication on Bilattice-Valued Fibers"
description: "The Lambek residuation on predicate-argument combination, instantiated on the twist product 2⊗2, lifts to a decidable modal calculus over any system of subject-predicate-object triples"
date-created: 2026-03-30
defines:
  - bilattice-valued-predicate-fiber
  - predicate-fiber-functor
extends:
  - lambek-calculus
  - lawvere-hyperdoctrine
  - busaniche-cignoli-residuation
requires:
  - residuated-lattice
  - twist-product
  - belnap-four-valued-bilattice
produces:
  - decidable-modal-calculus-of-predication
  - linear-logic-interpretation-of-spo
references:
  - id: arieli1996
    type: document
    title: Reasoning with Logical Bilattices
    author:
      - literal: O. Arieli
      - literal: A. Avron
    container-title: J. Logic, Language and Information, 5(1), 25–63
    issued:
      - year: 1996
  - id: belnap1977
    type: document
    title: A Useful Four-Valued Logic
    author:
      - literal: N. D. Belnap
    container-title: Modern Uses of Multiple-Valued Logic, Reidel, 5–37
    issued:
      - year: 1977
  - id: busaniche2014
    type: document
    title: The Subvariety of Commutative Residuated Lattices Represented by Twist-Products
    author:
      - literal: M. Busaniche
      - literal: R. Cignoli
    container-title: Algebra Universalis, 71, 5–22
    issued:
      - year: 2014
  - id: chajda2021
    type: document
    title: Adjoint Operations in Twist-Products of Lattices
    author:
      - literal: I. Chajda
      - literal: H. Langer
    container-title: Symmetry, 13(2), Article 253
    issued:
      - year: 2021
  - id: fitting1991
    type: document
    title: Bilattices and the Semantics of Logic Programming
    author:
      - literal: M. Fitting
    container-title: J. Logic Programming, 11(2), 91–116
    issued:
      - year: 1991
  - id: fitting2002
    type: document
    title: Bilattices Are Nice Things
    author:
      - literal: M. Fitting
    container-title: Self-Reference, CSLI Publications
    issued:
      - year: 2002
  - id: frege1879
    type: document
    title: Begriffsschrift
    author:
      - literal: G. Frege
    container-title: Louis Nebert
    issued:
      - year: 1879
  - id: galatos2007
    type: document
    title: Residuated Lattices: An Algebraic Glimpse at Substructural Logics
    author:
      - literal: N. Galatos
      - literal: P. Jipsen
      - literal: T. Kowalski
      - literal: H. Ono
    container-title: Elsevier
    issued:
      - year: 2007
  - id: jakl2025
    type: document
    title: Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science
    author:
      - literal: T. Jakl
    container-title: arXiv:2503.20679
    issued:
      - year: 2025
  - id: jung2012
    type: document
    title: Priestley Duality for Bilattices
    author:
      - literal: A. Jung
      - literal: U. Rivieccio
    container-title: Studia Logica, 100(1–2), 223–252
    issued:
      - year: 2012
  - id: kalman1958
    type: document
    title: Lattices with Involution
    author:
      - literal: J. A. Kalman
    container-title: Trans. AMS, 87(2), 485–491
    issued:
      - year: 1958
  - id: lambek1958
    type: document
    title: The Mathematics of Sentence Structure
    author:
      - literal: J. Lambek
    container-title: American Mathematical Monthly, 65(3), 154–170
    issued:
      - year: 1958
  - id: lawvere1969
    type: document
    title: Adjointness in Foundations
    author:
      - literal: F. W. Lawvere
    container-title: Dialectica, 23(3–4), 281–296
    issued:
      - year: 1969
  - id: lawvere1970
    type: document
    title: Equality in Hyperdoctrines and Comprehension Schema as an Adjoint Functor
    author:
      - literal: F. W. Lawvere
    container-title: Proc. AMS Symp. Pure Math., 17, 1–14
    issued:
      - year: 1970
  - id: maruyama2021
    type: document
    title: Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics and Topological Logical Translation
    author:
      - literal: Y. Maruyama
    container-title: J. Symbolic Logic, 86(3), 1189–1213
    issued:
      - year: 2021
  - id: rivieccio2017
    type: document
    title: rivieccio2017
    author:
      - literal: U. Rivieccio
      - literal: A. Jung
      - literal: R. Jansana
    container-title: J. Logic and Computation, 27(1), 155–199
    issued:
      - year: 2017
---

## Abstract

We name the mathematical object formed by a system of subject-predicate-object triples carrying values in the free bounded distributive bilattice $\mathbf{2} \otimes \mathbf{2}$ a **predication modal geometry**, and prove it is a Chu space. Lambek (1958) proved that predicate-argument combination in categorial grammar is a residuation; Lawvere (1969) established a related adjunction pattern $\exists \dashv f^* \dashv \forall$ in categorical logic. We instantiate residuation on $\mathbf{2} \otimes \mathbf{2}$ via the twist-product residuation of Busaniche & Cignoli (2014), obtaining operations $\odot$ (extending) and $\Rightarrow$ (restricting) with a verified adjunction $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$. This adjunction lifts to a fiber functor over any bilattice-valued SPO system, producing a bilattice-valued hyperdoctrine in the sense of Lawvere (1970) and Maruyama (2021). Under Jakl's (2025) identification of the Chu construction with the twist construction — $\mathbf{2} \otimes \mathbf{2} \cong \mathrm{Chu}(\mathbf{2}, 0)$ — we prove every bilattice-valued SPO system *is* a predication modal geometry, i.e. a predicate-indexed Chu space over $(\mathbf{2}, 0)$, with $\odot$ and $\Rightarrow$ the Chu tensor and linear implication. The modal calculus is decidable (Rivieccio, Jung, & Jansana 2017); the operations and adjunction restrict to the post-closure set $\{t, f, \top\}$; and the dynamics of iterated extension and restriction on the four-element algebra are characterized by exhaustive computation.

## 1. Predication as residuation

Frege (1879) established that a predicate is an unsaturated function: it takes a subject and returns a value. In a subject-predicate-object triple $\langle S, P, O \rangle$, the predicate $P$ combines $S$ and $O$ into an assertion.

Lambek (1958) formalized how this combination works. In the Lambek calculus, a product operation $\cdot$ on expressions admits exactly two residuals:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

The left residual $a \backslash c$ asks what must combine with $a$ on the right to yield something below $c$. The right residual $c / b$ asks what must combine with $b$ on the left. These two residuals exhaust the modes of functor-argument interaction. This is a theorem: the product has two argument positions, so there are exactly two residuals.

Galatos, Jipsen, Kowalski, & Ono (2007) proved that the Lambek calculus is the logic of residuated lattices. The residuals $/$ and $\backslash$ are residuals in the algebraic sense, and the full theory of residuated lattices applies.

Lawvere (1969) established a related adjunction pattern in categorical logic. The fundamental adjunction on a hyperdoctrine is $\exists_f \dashv f^* \dashv \forall_f$, where $f^*$ is substitution along a morphism $f$, $\exists$ is the left adjoint (generative: extends a predicate to a larger context), and $\forall$ is the right adjoint (constraining: restricts a predicate to where it holds universally). The Lambek and Lawvere adjunctions are not literally the same theorem — Lambek's is a pair of residuals for a non-commutative monoidal product on a poset, and Lawvere's is a chain of adjoints to base-change along a morphism — but the two exhibit a common pattern in which the generative/combining side is left-adjoint to a substitution/restriction operation. It is this pattern that the twist-product residuation of §2 instantiates in the algebraic case.

In the commutative case ($a \cdot b = b \cdot a$), the two Lambek residuals coincide into a single implication $\Rightarrow$. The adjunction retains its two sides: the product side (combining, generating, extending) and the implication side (testing, constraining, restricting).

## 2. Instantiation on the four-valued bilattice

### 2.1 The twist product $\mathbf{2} \otimes \mathbf{2}$

Belnap (1977) defined four epistemic states for a knowledge system receiving information from multiple sources: $\bot$ (no information), $t$ (told true), $f$ (told false), $\top$ (told both). Kalman (1958) introduced the twist product construction on bounded distributive lattices; Fitting (1991) extended it to bilattices and proved $\{\bot, t, f, \top\} \cong \mathbf{2} \otimes \mathbf{2}$. Fitting (2002) proved this is the free bounded distributive bilattice on one generator.

In the twist-product representation, each value is a pair $(a, b) \in \{0,1\}^2$: $\bot = (0,0)$, $t = (1,0)$, $f = (0,1)$, $\top = (1,1)$. The first component tracks positive evidence; the second tracks negative evidence. The bilattice carries two orderings: truth ($\leq_t$, with $f$ at bottom and $t$ at top) and knowledge ($\leq_k$, with $\bot$ at bottom and $\top$ at top).

### 2.2 The residuated pair

**Theorem 1** (Busaniche & Cignoli 2014; Chajda & Langer 2021). *On the twist product $L \otimes L$ of any integral commutative residuated lattice $L$, the operations*

$$(x,y) \odot (z,v) = (x \cdot z,\ (x \to v) \wedge (z \to y))$$
$$(x,y) \Rightarrow (z,v) = ((x \to z) \wedge (v \to y),\ x \cdot v)$$

*form a residuated pair with respect to the twist-product order (corresponding to $\leq_t$):*

$$a \odot p \leq_t q \quad\text{if and only if}\quad p \leq_t (a \Rightarrow q)$$

This is the Lambek residuation instantiated on $\mathbf{2} \otimes \mathbf{2}$. The product $\odot$ is extending: it combines two epistemic states by fusing their positive evidence and cross-referencing each side's positive evidence against the other's negative evidence. The implication $\Rightarrow$ is restricting: it tests implication in both truth directions and combines negative evidence.

We verified this adjunction by exhaustive computation on all 64 triples $(a, p, q) \in \{\bot, t, f, \top\}^3$. Zero violations.

### 2.3 Algebraic properties

The following properties hold on $\{\bot, t, f, \top\}$ (verified computationally):

**Proposition 1.** *$\top$ is the identity element for $\odot$: $\top \odot a = a$ for all $a$.*

**Proposition 2.** *$f$ is the absorbing element for $\odot$: $f \odot a = f$ for all $a$.*

**Proposition 3.** *$t$, $f$, and $\top$ are idempotent under $\odot$. $\bot$ is not: $\bot \odot \bot = f$.*

**Proposition 4.** *$a \Rightarrow a = t$ for $a \in \{\bot, t, f\}$, and $\top \Rightarrow \top = \top$.*

Chajda & Langer (2021) also establish a second adjoint pair on twist products — the Nelson implication $x \Rightarrow_N y = (x \supset y) \wedge (\mathord{\sim} y \supset \mathord{\sim} x)$, incorporating contrapositive symmetry.

**Proposition 5** (Nelson identity). *For all $x, y \in \{\bot, t, f, \top\}$:*

$$(x \Rightarrow (x \Rightarrow y)) \wedge_k (\mathord{\sim} y \Rightarrow (\mathord{\sim} y \Rightarrow \mathord{\sim} x)) = x \Rightarrow y$$

**Proposition 6.** *The simple contrapositive fails: $\mathord{\sim}(a \odot b) \neq \mathord{\sim} b \Rightarrow \mathord{\sim} a$ in general. Neither $\odot$ nor $\Rightarrow$ commutes with negation $\sim$ or conflation $-$.*

Propositions 1–6 are verifiable by inspection of the operation tables (a finite computation on 4 elements). The Nelson identity (Proposition 5) means negation-aware iterated implication is sound even though naive contrapositive is not.

## 3. The fiber functor

### 3.1 Predicate fibers

Let $\mathcal{S}$ be a system of subject-predicate-object triples where each triple carries a value in $\{\bot, t, f, \top\}$. For each predicate $p$ occurring in $\mathcal{S}$, the **fiber** of $p$ is the collection of all triples using $p$:

$$\mathrm{Fib}(p) = \{ \langle s, o, v \rangle : \langle s, p, o \rangle \in \mathcal{S} \text{ with value } v \}$$

The pointwise bilattice operations on $\mathrm{Fib}(p) \to \{\bot, t, f, \top\}$ define a **fiber algebra** $A_p$.

**Proposition 7.** *Each fiber algebra $A_p$ is a distributive bilattice.* (Pointwise products of distributive bilattices are distributive; Fitting 2002.)

### 3.2 The functor

Let $\mathcal{C}$ be the category whose objects are predicates occurring in $\mathcal{S}$ and whose morphisms are generated by three classes of predicate relationships in the vocabulary: **specialization** (one predicate restricts to another), **inversion** (one predicate is the converse-and-negation of another), and **composition** (one predicate is the pointwise conjunction of two others). These are the three classes of relationships between predicates that induce bilattice homomorphisms between fiber algebras; they are exhaustive within the homomorphism constraint that defines $\mathcal{F}$.

**Theorem 2** (Fiber Functor). *The assignment $p \mapsto A_p$ extends to a contravariant functor $\mathcal{F}: \mathcal{C}^{\mathrm{op}} \to \mathbf{BiLat}$.*

*Proof.* Each of the three morphism classes of $\mathcal{C}$ must map to a bilattice homomorphism in $\mathbf{BiLat}$. Specialization induces restriction of valuations, which preserves pointwise bilattice operations. Inversion applies negation $\sim$ pointwise, which is a bilattice homomorphism (Fitting 1991). Composition applies $\wedge_k$ pointwise, preserving bilattice structure by Proposition 7. For functoriality, $\mathcal{F}$ must satisfy $\mathcal{F}(\mathrm{id}_p) = \mathrm{id}_{A_p}$ and $\mathcal{F}(g \circ f) = \mathcal{F}(f) \circ \mathcal{F}(g)$ on composable generators. Identity is immediate: the identity morphism in $\mathcal{C}$ is the identity specialization, inducing the identity restriction on $A_p$. Composition: the composite of two specializations is the specialization along the composite fiber inclusion, whose induced restriction is the composite of the two restrictions; two successive inversions apply $\sim \circ \sim = \mathrm{id}$ to each valuation; and repeated $\wedge_k$-composition is associative and commutative by Proposition 7. $\square$

This makes $\mathcal{S}$ a bilattice-valued hyperdoctrine in the sense of Lawvere (1970), instantiating Maruyama's (2021) fibered algebraic semantics for the specific case of $\mathbf{2} \otimes \mathbf{2}$ over predicate-structured data.

**Corollary 1.** *The adjunction $\odot \dashv \Rightarrow$ lifts to fibers: for each predicate $p$, extending and restricting on $A_p$ are adjoint fiber-wise.*

## 4. Predication modal geometries as Chu spaces

The object whose adjoint structure the previous sections describe is a Chu space. This identification is what gives the name *predication modal geometry*: *predication* from the SPO indexing, *modal* from the paired Priestley-dual geometry of $\mathbf{2} \otimes \mathbf{2}$ (Jung & Rivieccio 2012), *geometry* from the Chu-space structure we now establish.

### 4.1 The Chu construction

For a bounded distributive lattice $L$ with a distinguished element $\bot \in L$, the **Chu construction** $\mathrm{Chu}(L, \bot)$ is the category whose objects are triples $(X, A, r)$ with $X, A$ sets and $r: X \times A \to L$ a pairing, and whose morphisms $(X, A, r) \to (Y, B, s)$ are pairs of maps $(f: X \to Y, g: B \to A)$ satisfying $r(x, g(b)) = s(f(x), b)$. The construction is due to Barr; we use here only its object-level structure.

### 4.2 Jakl's identification

**Theorem 3** (Jakl 2025). *For $H$ a Heyting algebra and $0 \in H$ its bottom, the Chu construction $\mathrm{Chu}(H, 0)$ is isomorphic to the twist-product construction: $(a, b) \in H \otimes H$ corresponds to the Chu object with the natural pairing into $H$. Under this isomorphism, the multiplicative tensor $\otimes$ of the Chu construction corresponds to the twist product $\odot$ of Theorem 1, and the linear implication $\multimap$ corresponds to $\Rightarrow$.*

Specializing to $H = \mathbf{2}$ gives $\mathbf{2} \otimes \mathbf{2} \cong \mathrm{Chu}(\mathbf{2}, 0)$, and in particular $\mathbf{FOUR} \cong \mathrm{Chu}(\mathbf{2}, 0)$ as residuated structures.

### 4.3 Bilattice-valued SPO systems are predication modal geometries

**Definition.** A **predication modal geometry** is a bilattice-valued SPO system $\mathcal{S}$ regarded through its structure as a predicate-indexed Chu space: for each predicate $p$ occurring in $\mathcal{S}$, the triple $(E, E, v(-, p, -))$ with $v(-, p, -): E \times E \to \mathbf{2} \otimes \mathbf{2}$ is an object of $\mathrm{Chu}(\mathbf{2}, 0)$ under Theorem 3, and the family $\{(E, E, v(-, p, -))\}_{p \in \Pi}$ is indexed by the category $\mathcal{C}$ of §3.2.

**Theorem 4.** *Every bilattice-valued SPO system is a predication modal geometry: the assignment $p \mapsto (E, E, v(-, p, -))$ factors the fiber functor $\mathcal{F}$ of Theorem 2 through the Chu category as $\mathcal{F} = \jmath \circ \mathcal{F}_{\mathrm{Chu}}$, where $\mathcal{F}_{\mathrm{Chu}}: \mathcal{C}^{\mathrm{op}} \to \mathrm{Chu}(\mathbf{2}, 0)$ and $\jmath: \mathrm{Chu}(\mathbf{2}, 0) \to \mathbf{BiLat}$ is the algebraic isomorphism of Theorem 3.*

*Proof.* By Theorem 3, $\mathbf{FOUR} = \mathbf{2} \otimes \mathbf{2}$ is isomorphic as a residuated structure to $\mathrm{Chu}(\mathbf{2}, 0)$; let $\jmath$ denote this isomorphism. Each fiber algebra $A_p = \mathbf{FOUR}^{\mathrm{Fib}(p)}$ is therefore a $\mathrm{Chu}(\mathbf{2}, 0)$-valued function space, equivalently the Chu object $(\mathrm{Fib}(p), \mathrm{Fib}(p), v(-, p, -))$ in which both state and attribute sides are the subject-object-pair index and the pairing is the valuation. Define $\mathcal{F}_{\mathrm{Chu}}: \mathcal{C}^{\mathrm{op}} \to \mathrm{Chu}(\mathbf{2}, 0)$ on objects by $p \mapsto (\mathrm{Fib}(p), \mathrm{Fib}(p), v(-, p, -))$ and on the three generating morphism classes of §3.2 by the correspondents of the $\mathbf{BiLat}$-homomorphisms of Theorem 2 under $\jmath$: these are well-defined because $\jmath$ is a category isomorphism on the underlying algebras. Functoriality follows from functoriality of $\mathcal{F}$ (Theorem 2) and the isomorphism $\jmath$. By construction $\jmath \circ \mathcal{F}_{\mathrm{Chu}} = \mathcal{F}$. $\square$

**Corollary.** *The adjunction $\odot \dashv \Rightarrow$ on predicate fibers is the $\otimes \dashv \multimap$ adjunction of linear logic at the algebraic level, via the Chu identification of Theorem 3.*

This is the naming theorem: the adjoint structure of predication on bilattice-valued fibers is the Chu-multiplicative structure on a predicate-indexed Chu space over $(\mathbf{2}, 0)$.

## 5. Consequences

### 5.1 Decidability

Rivieccio, Jung, & Jansana (2017) proved that modal operators on the four-valued bilattice decompose into pairs of classical modal operators on the twist components:

$$\Box(a^+, a^-) = (\Box_1(a^+),\ \Diamond_2(a^-))$$

The resulting four-valued modal logic has the finite model property and is decidable.

**Corollary 2.** *The modal calculus arising from the fiber functor $\mathcal{F}$ is decidable.*

This follows because the fiber algebras are distributive bilattices (Proposition 7) over $\mathbf{2} \otimes \mathbf{2}$, and the modal logic on $\mathbf{2} \otimes \mathbf{2}$ is decidable by Rivieccio, Jung, & Jansana (2017).

### 5.2 Post-closure restriction

Under closure (iterating inference rules to a fixpoint in the sense of Fitting 1991), $\bot$-valued assertions within scope are pushed upward in $\leq_k$. The effective algebra operates on $\{t, f, \top\}$.

**Theorem 5.** *The set $\{t, f, \top\}$ is closed under both $\odot$ and $\Rightarrow$. The identity element $\top$ is in $\{t, f, \top\}$. The adjunction $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$ holds on $\{t, f, \top\}$ with zero violations.*

*Proof.* Exhaustive computation on all 27 triples. $\square$

The adjunction persists after closure.

### 5.3 Dynamics

The following results are computed exhaustively on $\{\bot, t, f, \top\}$.

**Proposition 8.** *All orbits under iterated left-$\odot$ or left-$\Rightarrow$ reach fixed points in at most 2 steps.*

**Proposition 9.** *The only oscillatory behavior in the system: alternating $\odot$-by-$\bot$ and $\Rightarrow$-by-$\bot$ produces period-2 orbits ($\bot \to f \to \bot \to f \to \cdots$). All other alternating dynamics converge.*

### 5.4 Geometry

The Priestley dual of $\mathbf{2} \otimes \mathbf{2}$ as a distributive bilattice is a discrete two-point space with a swap involution encoding negation (Jung & Rivieccio 2012). Bilattices are two-sorted structures whose duals are pairs of Priestley spaces linked by continuous order-preserving maps (Rivieccio & Jung 2012). The modal calculus of predication lives in these paired spaces.

## References

- Arieli, O. & Avron, A. (1996). "Reasoning with Logical Bilattices." *J. Logic, Language and Information*, 5(1), 25–63.
- Belnap, N. D. (1977). "A Useful Four-Valued Logic." In Dunn & Epstein (eds.), *Modern Uses of Multiple-Valued Logic*, Reidel, 5–37.
- Busaniche, M. & Cignoli, R. (2014). "The Subvariety of Commutative Residuated Lattices Represented by Twist-Products." *Algebra Universalis*, 71, 5–22.
- Chajda, I. & Langer, H. (2021). "Adjoint Operations in Twist-Products of Lattices." *Symmetry*, 13(2), Article 253.
- Fitting, M. (1991). "Bilattices and the Semantics of Logic Programming." *J. Logic Programming*, 11(2), 91–116.
- Fitting, M. (2002). "Bilattices Are Nice Things." In Bolander et al. (eds.), *Self-Reference*, CSLI Publications.
- Frege, G. (1879). *Begriffsschrift*. Louis Nebert.
- Galatos, N., Jipsen, P., Kowalski, T., & Ono, H. (2007). *Residuated Lattices: An Algebraic Glimpse at Substructural Logics*. Elsevier.
- Jakl, T. (2025). "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science." arXiv:2503.20679.
- Jung, A. & Rivieccio, U. (2012). "Priestley Duality for Bilattices." *Studia Logica*, 100(1–2), 223–252.
- Kalman, J. A. (1958). "Lattices with Involution." *Trans. AMS*, 87(2), 485–491.
- Lambek, J. (1958). "The Mathematics of Sentence Structure." *American Mathematical Monthly*, 65(3), 154–170.
- Lawvere, F. W. (1969). "Adjointness in Foundations." *Dialectica*, 23(3–4), 281–296.
- Lawvere, F. W. (1970). "Equality in Hyperdoctrines and Comprehension Schema as an Adjoint Functor." *Proc. AMS Symp. Pure Math.*, 17, 1–14.
- Maruyama, Y. (2021). "Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics and Topological Logical Translation." *J. Symbolic Logic*, 86(3), 1189–1213.
- Rivieccio, U., Jung, A., & Jansana, R. (2017). "Four-Valued Modal Logic: Kripke Semantics and Duality." *J. Logic and Computation*, 27(1), 155–199.
