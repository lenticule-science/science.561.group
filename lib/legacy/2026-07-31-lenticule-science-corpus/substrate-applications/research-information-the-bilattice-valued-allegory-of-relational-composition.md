---
title: "The Bilattice-Valued Allegory of Relational Composition"
description: "The allegory of bilattice-valued relations on $mathbf{2}otimesmathbf{2}$ decomposes as a product of two classical Freyd-Scedrov allegories. Classical relational composition embeds as a proper sub-allegory; the bilattice allegory is a strictly stronger, lossless refinement tracking an orthogonal refutation channel."
date-created: 2026-04-14
extends:
  - the-adjoint-structure-of-predication-on-bilattice-valued-fibers
  - freyd-scedrov-allegories
requires:
  - bilattice-valued-predicate-fiber
  - predicate-fiber-functor
references:
  - id: adjoint-paper
    type: document
    title: The Adjoint Structure of Predication on Bilattice-Valued Fibers
    author:
      - literal: unattributed
    container-title: library/domains/science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md
    issued:
      - year: 2026
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
  - id: freyd1990
    type: document
    title: Categories, Allegories
    author:
      - literal: P. Freyd
      - literal: A. Scedrov
    container-title: North-Holland Mathematical Library, vol. 39, Elsevier
    issued:
      - year: 1990
  - id: jakl2025
    type: document
    title: Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science
    author:
      - literal: T. Jakl
    container-title: arXiv:2503.20679
    issued:
      - year: 2025
  - id: tarski1941
    type: document
    title: tarski1941
    author:
      - literal: A. Tarski
    container-title: J. Symbolic Logic, 6(3), 73–89
    issued:
      - year: 1941
---

## Hypothesis

Classical Freyd-Scedrov allegories of two-valued relations (Freyd & Scedrov 1990) record a single channel of evidence: whether a pair $(x, y)$ is related. The bilattice $\mathbf{2} \otimes \mathbf{2}$ of the adjoint paper separates positive evidence (told-true) from negative evidence (told-false), with independent values $\bot$ (neither) and $\top$ (both). We prove that the allegory of bilattice-valued relations on $\mathbf{2} \otimes \mathbf{2}$ is a **strictly stronger, lossless refinement** of the classical Freyd-Scedrov allegory, in a precise sense:

- **Lossless.** The bilattice allegory $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ is allegory-isomorphic to the product $\mathbf{Rel}_\mathbf{2} \times \mathbf{Rel}_\mathbf{2}$ of two copies of the classical Freyd-Scedrov allegory. No information carried by a bilattice-valued relation is crushed by the allegorical structure; it is exactly the pair of its positive and negative classical projections (Theorem 2).
- **Strictly stronger.** The classical allegory $\mathbf{Rel}_\mathbf{2}$ embeds as a proper sub-allegory of $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ by $R \mapsto (R, \varnothing)$, and this embedding preserves composition, converse, and meet on the nose (Theorem 3). Any statement provable in the classical allegory is provable in the bilattice allegory about its image; and the bilattice allegory carries, in addition, an orthogonal refutation channel and the non-allegorical residuation $\odot \dashv \Rightarrow$ of the adjoint paper.

The current text proves both claims, verifies the Freyd-Scedrov axioms by a single product argument, and characterizes the image of the classical embedding.

All notation and prior results of the adjoint paper — values $\{\bot, t, f, \top\}$, twist representation $(a^+, a^-)$, orderings $\leq_t$ and $\leq_k$, operations $\wedge_k$, $\vee_k$, $\odot$, $\Rightarrow$, the fiber functor $\mathcal{F}: \mathcal{C}^{\mathrm{op}} \to \mathbf{BiLat}$ — are inherited and used without redefinition.

## 1. The bilattice allegory

**Definition 1.** For a finite entity set $E$, a **bilattice-valued relation on $E$** is a function $R: E \times E \to \{\bot, t, f, \top\}$. The **bilattice allegory** $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ has finite sets as objects and bilattice-valued relations as morphisms $E \to E'$, with the following structure:

- **Composition.** $(R \circ S)(x, y) := \bigvee^{k}_{m \in E'} R(x, m) \wedge_k S(m, y)$, where $\bigvee^k$ is the finite knowledge supremum.
- **Meet.** $(R \cap S)(x, y) := R(x, y) \wedge_k S(x, y)$ (pointwise knowledge meet).
- **Converse.** $R^{\circ}(x, y) := R(y, x)$ (pure swap; not negation-augmented inversion).
- **Identity.** $\Delta_E(x, y) := t$ if $x = y$, $\bot$ otherwise.

We will shortly see that this structure is an allegory, as a consequence of a decomposition theorem.

**Remark on converse.** The adjoint paper's §3.2 uses a negation-augmented converse $R^{\mathrm{inv}}(x, y) = \mathord{\sim} R(y, x)$ as a fiber-functor morphism. The allegorical converse here is pure swap without negation. These are two separate ingredients with two separate purposes: the fiber-functor inversion is a bilattice homomorphism governing epistemic flip; the allegorical converse is the anti-involutive pairing required by Freyd & Scedrov (1990). That they do not coincide is what one should expect — negation is logical, converse is geometric — and §2 will show that the product-decomposition isolates pure swap as the allegorical converse automatically.

## 2. Decomposition

Every bilattice value decomposes as a pair: $a = (a^+, a^-) \in \{0, 1\}^2$, with $\bot = (0,0)$, $t = (1,0)$, $f = (0,1)$, $\top = (1,1)$. The knowledge meet $\wedge_k$ and join $\vee_k$ act componentwise (Fitting 1991):

$$(a^+, a^-) \wedge_k (b^+, b^-) = (a^+ \wedge b^+,\ a^- \wedge b^-) \qquad (a^+, a^-) \vee_k (b^+, b^-) = (a^+ \vee b^+,\ a^- \vee b^-)$$

Apply this componentwise to a bilattice-valued relation:

**Definition 2.** For $R: E \times E' \to \{\bot, t, f, \top\}$, the **positive projection** $R^+: E \times E' \to \{0, 1\}$ and **negative projection** $R^-: E \times E' \to \{0, 1\}$ are the two-valued relations

$$R^+(x, y) := \text{first component of } R(x, y) \qquad R^-(x, y) := \text{second component of } R(x, y).$$

Each two-valued relation $R^\pm: E \times E' \to \{0, 1\}$ is a morphism in the classical Freyd-Scedrov allegory $\mathbf{Rel}_\mathbf{2}$ (Freyd & Scedrov 1990). The assignment $R \mapsto (R^+, R^-)$ takes bilattice-valued relations to pairs of classical relations. We prove this is an allegory isomorphism.

**Theorem 1** (Componentwise composition). *For bilattice-valued relations $R, S$ on a common entity domain,*

$$(R \circ S)^+ = R^+ \circ_\mathbf{2} S^+ \qquad (R \circ S)^- = R^- \circ_\mathbf{2} S^-$$

*where $\circ_\mathbf{2}$ is classical relational composition $(P \circ_\mathbf{2} Q)(x, y) = \exists m.\, P(x, m) \wedge Q(m, y)$.*

*Proof.* At point $(x, y)$:

$$(R \circ S)(x, y) = \bigvee^k_m R(x, m) \wedge_k S(m, y) = \bigvee^k_m \big(R^+(x, m) \wedge S^+(m, y),\ R^-(x, m) \wedge S^-(m, y)\big)$$

Since $\vee_k$ acts componentwise, the join distributes into the two components:

$$= \Big(\bigvee_m R^+(x, m) \wedge S^+(m, y),\ \bigvee_m R^-(x, m) \wedge S^-(m, y)\Big) = \big((R^+ \circ_\mathbf{2} S^+)(x, y),\ (R^- \circ_\mathbf{2} S^-)(x, y)\big) \quad \square$$

**Theorem 2** (Decomposition). *The assignment*

$$\Pi: \mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}} \longrightarrow \mathbf{Rel}_\mathbf{2} \times \mathbf{Rel}_\mathbf{2} \qquad R \longmapsto (R^+, R^-)$$

*is an isomorphism of categories with chosen structure — meet, converse, identity, and composition. In particular:*

1. *$\Pi$ is a bijection on hom-sets: $R \mapsto (R^+, R^-)$ has inverse $(P, Q) \mapsto \lambda(x, y).(P(x, y), Q(x, y))$.*
2. *$\Pi$ preserves identity: $\Pi(\Delta_E) = (\Delta_E, \varnothing_E)$ where $\Delta_E$ on the right is the classical diagonal and $\varnothing_E$ is the empty relation.*
3. *$\Pi$ preserves composition: by Theorem 1.*
4. *$\Pi$ preserves meet: $(R \cap S)^\pm = R^\pm \cap_\mathbf{2} S^\pm$ by componentwise action of $\wedge_k$.*
5. *$\Pi$ preserves converse: $(R^\circ)^\pm(x, y) = R^\pm(y, x) = (R^\pm)^\circ(x, y)$ by definition of pure swap.*

*Proof.* Each clause is immediate from the componentwise action of $\wedge_k$, $\vee_k$, and pure swap. Clause (3) is Theorem 1. Bijectivity in (1) is inverse pairing of components. $\square$

**Corollary 1** (Allegory axioms). *$\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ satisfies the Freyd-Scedrov allegory axioms: associativity of $\circ$; identity $\Delta$; anti-involution $(R^\circ)^\circ = R$; distribution of converse over composition and over meet; idempotency, commutativity, and associativity of $\cap$; and the modular law $R \cap (S \circ T) \leq_k (S \cap (R \circ T^\circ)) \circ T$.*

*Proof.* $\mathbf{Rel}_\mathbf{2}$ is a Freyd-Scedrov allegory (Freyd & Scedrov 1990). Products of allegories are allegories — each axiom is an equation or an inequation between composites of the allegory operations, and by Theorem 2 each such (in)equation in $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ holds iff it holds on both components in $\mathbf{Rel}_\mathbf{2}$. The partial order $\leq_k$ on bilattice relations is the pointwise pairing of the two inclusion orders on $\mathbf{Rel}_\mathbf{2}$; the modular law in $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ is therefore the conjunction of the classical modular law on $R^\pm, S^\pm, T^\pm$. $\square$

Theorem 2 is the *lossless* half of the hypothesis: the bilattice allegory carries precisely the information of a pair of classical allegory morphisms, with no identification or quotient.

## 3. Strict strengthening

Classical relational composition corresponds to the case where only positive evidence is tracked. Formalize this as an embedding.

**Definition 3.** The **positive embedding** $\iota: \mathbf{Rel}_\mathbf{2} \hookrightarrow \mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ sends a classical relation $P$ to the bilattice-valued relation $\iota(P)(x, y) := (P(x, y), 0)$ — i.e. $t$ where $P$ holds, $\bot$ elsewhere.

**Theorem 3** (Embedding). *The positive embedding $\iota$ is a faithful allegory homomorphism: it preserves composition, converse, meet, and identity strictly (on the nose, not merely up to isomorphism). Its image is the full sub-allegory of $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ consisting of relations $R$ with $R^- = \varnothing$. This sub-allegory is proper — there exist bilattice-valued relations not in its image.*

*Proof.* $\Pi(\iota(P)) = (P, \varnothing)$ by construction. Composition: by Theorem 1, $(\iota(P) \circ \iota(Q))^+ = P \circ_\mathbf{2} Q$ and $(\iota(P) \circ \iota(Q))^- = \varnothing \circ_\mathbf{2} \varnothing = \varnothing$, so $\iota(P) \circ \iota(Q) = \iota(P \circ_\mathbf{2} Q)$. The cases of converse, meet, and identity are analogous by Theorem 2. Faithfulness: if $\iota(P_1) = \iota(P_2)$, then $P_1 = (\iota(P_1))^+ = (\iota(P_2))^+ = P_2$. Properness of the image: the relation $R$ with $R(x_0, y_0) = f$ for a single chosen pair and $\bot$ elsewhere has $R^- \neq \varnothing$ and so lies outside $\iota(\mathbf{Rel}_\mathbf{2})$. $\square$

**Corollary 2** (Conservative extension). *Every equation or inequation in allegory operations provable in $\mathbf{Rel}_\mathbf{2}$ is provable about its $\iota$-image in $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$.*

*Proof.* By Theorem 3, $\iota$ preserves all allegory operations strictly. $\square$

Theorem 3 is the *strictly stronger* half: classical relational composition is literally a special case of bilattice relational composition — the slice where no refutation evidence is ever recorded. The bilattice allegory sees distinctions invisible to the classical allegory, and the four identifiable kinds of distinction are the cells of $\mathbf{2} \otimes \mathbf{2}$ itself:

- $R(x, y) = t$: a pair for which $\iota^{-1}$ exists — classical "$P$ relates $x$ to $y$."
- $R(x, y) = \bot$: a pair for which $\iota^{-1}$ exists — classical "$P$ does not relate."
- $R(x, y) = f$: refutation without corresponding support; no classical counterpart in $\iota$'s image.
- $R(x, y) = \top$: support and refutation jointly recorded; no classical counterpart in $\iota$'s image.

The refutation channel $R^-$ is orthogonal to the support channel $R^+$, and classical composition collapses both onto a single $\{0, 1\}$ channel.

**Proposition 1** (Refutation-path composition). *For $R, S$ bilattice-valued relations on $E$ and $(x, y) \in E \times E$:*

$$(R \circ S)(x, y) = \top \quad\text{iff}\quad \exists m, m' \in E:\ R^+(x, m) \wedge S^+(m, y) \ \text{and}\ R^-(x, m') \wedge S^-(m', y).$$

*Proof.* Apply Theorem 1 componentwise. The positive component of $(R \circ S)(x, y)$ is $1$ iff there exists $m$ with $R^+(x, m) = S^+(m, y) = 1$; the negative component is $1$ iff there exists $m'$ with $R^-(x, m') = S^-(m', y) = 1$; the value is $\top$ iff both hold. $\square$

The two existential witnesses need not coincide: $R \circ S$ records that *some* positive path and *some* refutation path exist simultaneously, through possibly distinct intermediates. Classical composition has no mechanism to record this — the refutation path is entirely invisible to it.

## 4. Relation to the adjoint paper

### 4.1 The fiber functor

The adjoint paper's fiber functor $\mathcal{F}: \mathcal{C}^{\mathrm{op}} \to \mathbf{BiLat}$ (Theorem 2, §3.2) tracks three classes of predicate relationships that induce bilattice homomorphisms between fiber algebras: specialization, inversion (negation-augmented swap), and parallel composition (pointwise $\wedge_k$). These operate on the *entire fiber algebra* $A_p$ as a bilattice, pointwise.

Bilattice relational composition $\circ$ is a distinct operation: it takes morphisms (parameterized by a second fiber) and produces a morphism via intermediate-entity join. By Theorem 1, $\circ$ factors through $\Pi$ into the two classical relational compositions. Neither factor is a bilattice homomorphism at the level of $\mathbf{2}\otimes\mathbf{2}$ — classical relational composition is not a homomorphism between the source lattices either; it is a morphism in the Freyd-Scedrov allegory. The failure-of-distributivity observations of Birkhoff (1948) and the non-homomorphism character of classical composition are inherited componentwise.

So there is no tension with the adjoint paper's fiber functor: the fiber functor formalizes the homomorphic structure (what the adjoint paper is *about*); the allegory formalizes the orthogonal composition-via-quantification structure (what the current paper is about). They live in different ambient categories — $\mathbf{BiLat}$ vs. $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ — over the same underlying entity-indexed data.

### 4.2 The residuation

The adjoint paper's operations $\odot$ (extending) and $\Rightarrow$ (restricting), applied pointwise, give a non-allegorical enrichment of $\mathbf{Rel}_{\mathbf{2}\otimes\mathbf{2}}$ that $\iota(\mathbf{Rel}_\mathbf{2})$ does not carry. The twist-product formulas

$$(x,y) \odot (z,v) = (x \wedge z,\ (x \to v) \wedge (z \to y)) \qquad (x,y) \Rightarrow (z,v) = ((x \to z) \wedge (v \to y),\ x \wedge v)$$

couple the positive and negative components — the negative component of $\odot$ depends on the positive components of both arguments and vice versa. Consequently $\odot$ and $\Rightarrow$ do **not** decompose as products of classical operations along $\Pi$. They are bilattice-native structure that has no counterpart in $\mathbf{Rel}_\mathbf{2}$ or in $\mathbf{Rel}_\mathbf{2} \times \mathbf{Rel}_\mathbf{2}$ regarded as an allegory alone.

**Proposition 2.** *The operations $\odot$ and $\Rightarrow$, applied pointwise to bilattice-valued relations, do not arise from any pair of operations on classical relations via the isomorphism $\Pi$ of Theorem 2.*

*Proof.* A componentwise operation $\Pi^{-1}(\alpha, \beta)$ would compute the positive component of its output from the positive components of its inputs and the negative from the negative. The $\odot$ formula computes $(x \odot z)^- = (x^+ \to z^-) \wedge (z^+ \to x^-)$, which depends on both positive components $x^+, z^+$ — crossing the product factorization. $\square$

Thus the bilattice allegory is strictly stronger than classical $\mathbf{Rel}_\mathbf{2}$ in two independent ways: the product factorization $\mathbf{Rel}_\mathbf{2} \times \mathbf{Rel}_\mathbf{2}$ (orthogonal refutation channel) and the residuation $\odot \dashv \Rightarrow$ (cross-channel coupling).

### 4.3 Decidability

Classical $\mathbf{Rel}_\mathbf{2}$ with composition, intersection, complement, and converse is undecidable (Tarski 1941). By Theorem 2 the bilattice allegory is a product of two classical allegories, and so its allegorical-operation fragment is undecidable for the same reason: decidability on the product reduces to decidability on each factor. The adjoint paper's decidability result (Corollary 2 of §5.1) applies to the modal calculus arising from the fiber functor $\mathcal{F}$, not to the allegorical fragment; the two decidability questions concern different fragments of the overall structure.

## 5. Summary

The allegory of bilattice-valued relations on $\mathbf{2} \otimes \mathbf{2}$ is a product of two classical Freyd-Scedrov allegories, with the positive and negative components of each bilattice value giving the two projections (Theorem 2). Classical $\mathbf{Rel}_\mathbf{2}$ embeds as a proper sub-allegory by the positive-only embedding $R \mapsto (R, \varnothing)$, preserving all allegory operations strictly (Theorem 3). The bilattice allegory carries, in addition to what classical $\mathbf{Rel}_\mathbf{2}$ can express, (a) an independent refutation channel with its own allegorical dynamics and (b) the adjoint paper's residuation $\odot \dashv \Rightarrow$, which crosses the product factorization and has no classical counterpart (Proposition 2). The bilattice-valued allegory is therefore a lossless strictly-stronger refinement of classical relational composition in the sense spelled out in the hypothesis.

## References

- Birkhoff, G. (1948). *Lattice Theory* (Revised edition). American Mathematical Society Colloquium Publications, vol. 25.
- Fitting, M. (1991). "Bilattices and the Semantics of Logic Programming." *J. Logic Programming*, 11(2), 91–116.
- Fitting, M. (2002). "Bilattices Are Nice Things." In Bolander et al. (eds.), *Self-Reference*, CSLI Publications.
- Freyd, P. & Scedrov, A. (1990). *Categories, Allegories*. North-Holland Mathematical Library, vol. 39. Elsevier.
- Jakl, T. (2025). "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science." arXiv:2503.20679.
- Tarski, A. (1941). "On the Calculus of Relations." *J. Symbolic Logic*, 6(3), 73–89.
- The Adjoint Structure of Predication on Bilattice-Valued Fibers (2026). `library/domains/science/domains/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md`
