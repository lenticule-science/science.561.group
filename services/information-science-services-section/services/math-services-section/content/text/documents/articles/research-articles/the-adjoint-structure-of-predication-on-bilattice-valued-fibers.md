---

title: "The Adjoint Structure of Predication on Bilattice-Valued Fibers"
description: "The Lambek residuation on predicate-argument combination, instantiated on the twist product 2⊗2, lifts to a decidable modal calculus over any system of subject-predicate-object triples"
date-created: 2026-03-30
type: paper
status: draft
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
  arieli1996:
    authors: ["O. Arieli", "A. Avron"]
    title: "Reasoning with Logical Bilattices"
    publication: "J. Logic, Language and Information, 5(1), 25–63"
    year: 1996
  belnap1977:
    authors: ["N. D. Belnap"]
    title: "A Useful Four-Valued Logic"
    publication: "Modern Uses of Multiple-Valued Logic, Reidel, 5–37"
    year: 1977
  busaniche2014:
    authors: ["M. Busaniche", "R. Cignoli"]
    title: "The Subvariety of Commutative Residuated Lattices Represented by Twist-Products"
    publication: "Algebra Universalis, 71, 5–22"
    year: 2014
  chajda2021:
    authors: ["I. Chajda", "H. Langer"]
    title: "Adjoint Operations in Twist-Products of Lattices"
    publication: "Symmetry, 13(2), Article 253"
    year: 2021
  fitting1991:
    authors: ["M. Fitting"]
    title: "Bilattices and the Semantics of Logic Programming"
    publication: "J. Logic Programming, 11(2), 91–116"
    year: 1991
  fitting2002:
    authors: ["M. Fitting"]
    title: "Bilattices Are Nice Things"
    publication: "Self-Reference, CSLI Publications"
    year: 2002
  frege1879:
    authors: ["G. Frege"]
    title: "Begriffsschrift"
    publication: "Louis Nebert"
    year: 1879
  galatos2007:
    authors: ["N. Galatos", "P. Jipsen", "T. Kowalski", "H. Ono"]
    title: "Residuated Lattices: An Algebraic Glimpse at Substructural Logics"
    publication: "Elsevier"
    year: 2007
  jakl2025:
    authors: ["T. Jakl"]
    title: "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science"
    publication: "arXiv:2503.20679"
    year: 2025
  jung2012:
    authors: ["A. Jung", "U. Rivieccio"]
    title: "Priestley Duality for Bilattices"
    publication: "Studia Logica, 100(1–2), 223–252"
    year: 2012
  kalman1958:
    authors: ["J. A. Kalman"]
    title: "Lattices with Involution"
    publication: "Trans. AMS, 87(2), 485–491"
    year: 1958
  lambek1958:
    authors: ["J. Lambek"]
    title: "The Mathematics of Sentence Structure"
    publication: "American Mathematical Monthly, 65(3), 154–170"
    year: 1958
  lawvere1969:
    authors: ["F. W. Lawvere"]
    title: "Adjointness in Foundations"
    publication: "Dialectica, 23(3–4), 281–296"
    year: 1969
  lawvere1970:
    authors: ["F. W. Lawvere"]
    title: "Equality in Hyperdoctrines and Comprehension Schema as an Adjoint Functor"
    publication: "Proc. AMS Symp. Pure Math., 17, 1–14"
    year: 1970
  maruyama2021:
    authors: ["Y. Maruyama"]
    title: "Fibred Algebraic Semantics for a Variety of Non-Classical First-Order Logics and Topological Logical Translation"
    publication: "J. Symbolic Logic, 86(3), 1189–1213"
    year: 2021
  rivieccio2017:
    authors: ["U. Rivieccio", "A. Jung", "R. Jansana"]
    title: "Four-Valued Modal Logic: Kripke Semantics and Duality"
    publication: "J. Logic and Computation, 27(1), 155–199"
    year: 2017
cites:
  - arieli1996
  - belnap1977
  - busaniche2014
  - chajda2021
  - fitting1991
  - fitting2002
  - frege1879
  - galatos2007
  - jakl2025
  - jung2012
  - kalman1958
  - lambek1958
  - lawvere1969
  - lawvere1970
  - maruyama2021
  - rivieccio2017
readiness: shaped
---
Abstract

Lambek (1958) proved that predicate-argument combination in categorial grammar is a residuation: two residuals exhaust the modes of functor-argument interaction. Lawvere (1969) identified the same adjunction in categorical logic as $\exists \dashv \forall$. We instantiate this residuation on the free bounded distributive bilattice $\mathbf{2} \otimes \mathbf{2}$ via the twist-product residuation of Busaniche & Cignoli (2014), obtaining explicit operations $\odot$ (extending) and $\Rightarrow$ (restricting) with a verified adjunction $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$. We prove this adjunction lifts to a fiber functor over any system of subject-predicate-object triples, producing a bilattice-valued hyperdoctrine in the sense of Lawvere (1970) and Maruyama (2021). The resulting modal calculus is decidable (Rivieccio, Jung, & Jansana 2017) and equivalent to a fragment of linear logic (Jakl 2025). Both operations and the adjunction restrict to the post-closure set $\{t, f, \top\}$, and we characterize the dynamics of iterated extension and restriction on the four-element algebra by exhaustive computation.

## 1. Predication as residuation

Frege (1879) established that a predicate is an unsaturated function: it takes a subject and returns a value. In a subject-predicate-object triple $\langle S, P, O \rangle$, the predicate $P$ combines $S$ and $O$ into an assertion.

Lambek (1958) formalized how this combination works. In the Lambek calculus, a product operation $\cdot$ on expressions admits exactly two residuals:

$$a \cdot b \leq c \quad\text{iff}\quad b \leq a \backslash c \quad\text{iff}\quad a \leq c / b$$

The left residual $a \backslash c$ asks what must combine with $a$ on the right to yield something below $c$. The right residual $c / b$ asks what must combine with $b$ on the left. These two residuals exhaust the modes of functor-argument interaction. This is a theorem: the product has two argument positions, so there are exactly two residuals.

Galatos, Jipsen, Kowalski, & Ono (2007) proved that the Lambek calculus is the logic of residuated lattices. The residuals $/$ and $\backslash$ are residuals in the algebraic sense, and the full theory of residuated lattices applies.

Lawvere (1969) identified the same structure in categorical logic. The fundamental adjunction on a hyperdoctrine is $\exists_f \dashv f^* \dashv \forall_f$, where $f^*$ is substitution along a morphism $f$, $\exists$ is the left adjoint (generative: extends a predicate to a larger context), and $\forall$ is the right adjoint (constraining: restricts a predicate to where it holds universally). The product side of the Lambek residuation corresponds to $\exists$; the implication side corresponds to $\forall$.

In the commutative case ($a \cdot b = b \cdot a$), the two residuals coincide into a single implication $\Rightarrow$. The adjunction retains its two sides: the product side (combining, generating, extending) and the implication side (testing, constraining, restricting).

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

Let $\mathcal{C}$ be the category whose objects are predicates occurring in $\mathcal{S}$ and whose morphisms are generated by predicate relationships (specialization, inversion, composition) in the vocabulary.

**Theorem 2** (Fiber Functor). *The assignment $p \mapsto A_p$ extends to a contravariant functor $\mathcal{F}: \mathcal{C}^{\mathrm{op}} \to \mathbf{BiLat}$.*

*Proof sketch.* Three classes of morphisms must map to bilattice homomorphisms. Specialization induces restriction of valuations, which preserves pointwise bilattice operations. Inversion applies negation $\sim$ pointwise, which is a bilattice homomorphism (Fitting 1991). Composition applies $\wedge_k$ pointwise, preserving bilattice structure by Proposition 7. Functoriality follows from associativity and involutivity in $\mathcal{C}$. $\square$

This makes $\mathcal{S}$ a bilattice-valued hyperdoctrine in the sense of Lawvere (1970), instantiating Maruyama's (2021) fibered algebraic semantics for the specific case of $\mathbf{2} \otimes \mathbf{2}$ over predicate-structured data.

**Corollary 1.** *The adjunction $\odot \dashv \Rightarrow$ lifts to fibers: for each predicate $p$, extending and restricting on $A_p$ are adjoint fiber-wise.*

## 4. Consequences

### 4.1 Decidability

Rivieccio, Jung, & Jansana (2017) proved that modal operators on the four-valued bilattice decompose into pairs of classical modal operators on the twist components:

$$\Box(a^+, a^-) = (\Box_1(a^+),\ \Diamond_2(a^-))$$

The resulting four-valued modal logic has the finite model property and is decidable.

**Corollary 2.** *The modal calculus arising from the fiber functor $\mathcal{F}$ is decidable.*

This follows because the fiber algebras are distributive bilattices (Proposition 7) over $\mathbf{2} \otimes \mathbf{2}$, and the modal logic on $\mathbf{2} \otimes \mathbf{2}$ is decidable by Rivieccio, Jung, & Jansana (2017).

### 4.2 Linear logic interpretation

Jakl (2025) proved that the Chu construction $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ is the twist construction. Under this identification, tensor in linear logic corresponds to fusion $\odot$ in the residuated bilattice, and linear implication $\multimap$ corresponds to $\Rightarrow$.

**Corollary 3.** *The extends/restricts adjunction on predicate fibers is the $\otimes \dashv \multimap$ adjunction of linear logic. Every bilattice-valued SPO system is a model of linear logic where the tracked resources are epistemic states.*

### 4.3 Post-closure restriction

Under closure (iterating inference rules to a fixpoint in the sense of Fitting 1991), $\bot$-valued assertions within scope are pushed upward in $\leq_k$. The effective algebra operates on $\{t, f, \top\}$.

**Theorem 3.** *The set $\{t, f, \top\}$ is closed under both $\odot$ and $\Rightarrow$. The identity element $\top$ is in $\{t, f, \top\}$. The adjunction $a \odot p \leq_t q$ iff $p \leq_t (a \Rightarrow q)$ holds on $\{t, f, \top\}$ with zero violations.*

*Proof.* Exhaustive computation on all 27 triples. $\square$

The adjunction persists after closure.

### 4.4 Dynamics

The following results are computed exhaustively on $\{\bot, t, f, \top\}$.

**Proposition 8.** *All orbits under iterated left-$\odot$ or left-$\Rightarrow$ reach fixed points in at most 2 steps.*

**Proposition 9.** *The only oscillatory behavior in the system: alternating $\odot$-by-$\bot$ and $\Rightarrow$-by-$\bot$ produces period-2 orbits ($\bot \to f \to \bot \to f \to \cdots$). All other alternating dynamics converge.*

### 4.5 Geometry

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
