---
name: predication settling objects and preorder morphisms form a category
description: Predication-settlings over a common base, with predication-settling-preorder-morphisms as morphisms, satisfy Mac Lane's category axioms. The hom-sets are thin — singletons or empty — determined by the pointwise-and-stepwise knowledge order on valuations; identity exists by reflexivity of $\leq_k$, composition exists by transitivity, and associativity + identity laws hold vacuously in the thin hom-set structure.
status: draft
---

# Predication-settlings and preorder-morphisms form a category

**Claim.** Fix a residuated lattice $\mathbf{L}$, a [predicate category](../../../code/structures/predicate-category.md) $\mathcal{C}$, an [entity set](../../../code/structures/entity-set.md) $E$, and a settling bound $\lambda$. The class of [predication-settlings](../../../code/structures/predication-settling.md) over the common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$, with [predication-settling-preorder-morphisms](../../../code/transformers/predication-settling-preorder-morphism.md) as morphisms, satisfies Mac Lane 1971's axioms for a category. The category, denoted $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$, has thin hom-sets — singletons or empty — and its category structure is determined entirely by the pointwise-and-stepwise knowledge-order relation on valuations.

## Definitions

The definitions are stated from first principles. Internal citations are only to other records in this repository; external published mathematics appears as a citation in the proof's discharges and is listed in `## External references`.

### A residuated lattice $\mathbf{L}$

A commutative integral [residuated-lattice](../../../code/structures/residuated-lattice.md) is an algebra $\mathbf{L} = \langle L, \vee, \wedge, \cdot, \to, 1\rangle$ where $\langle L, \vee, \wedge\rangle$ is a lattice, $\langle L, \cdot, 1\rangle$ is a commutative monoid, the residual $\to$ satisfies $x\cdot y \leq z \iff x \leq y \to z$, and $1$ is the lattice top.

### The twist-product bilattice $\mathbf{L}^\bowtie$

For a residuated lattice $\mathbf{L}$, the [twist-product](../../../code/structures/twist-product.md) $\mathbf{L}^\bowtie$ is the [bilattice](../../../code/structures/bilattice.md) on $L \times L$ whose two orders are
$$\langle a_+, a_-\rangle \leq_t \langle b_+, b_-\rangle \iff a_+ \leq b_+ \text{ and } b_- \leq a_-,$$
$$\langle a_+, a_-\rangle \leq_k \langle b_+, b_-\rangle \iff a_+ \leq b_+ \text{ and } a_- \leq b_-,$$
with [negation](../../../code/transformers/negating.md) $\sim\langle a, b\rangle = \langle b, a\rangle$. The [order-of-knowledge](../../teaching/explanations/order-of-knowledge.md) $\leq_k$ is the order along which evidence accumulates.

### Predicate category, entity set, predication cell, fiber algebra

A [predicate-category](../../../code/structures/predicate-category.md) $\mathcal{C}$ is a small category whose objects are predicates. An [entity-set](../../../code/structures/entity-set.md) $E$ is the set of entities. The [predication-fiber-algebra](../../../code/structures/predication-fiber-algebra.md) at a predicate $p \in \mathrm{Ob}(\mathcal{C})$ is $A_p := \mathbf{L}^{\bowtie\,E\times E}$ — the pointwise twist product over the entity-pair index. An element of $A_p$ is a function $E \times E \to L \times L$.

### Predication-valuation, predication-settling

A [predication-valuation](../../../code/structures/predication-valuation.md) over $(\mathbf{L}, \mathcal{C}, E)$ is a function $v$ assigning to each predicate $p \in \mathcal{C}$ an element $v(p) \in A_p$.

A [predication-settling](../../../code/structures/predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a family $v = (v_\tau)_{\tau < \lambda}$ of predication-valuations satisfying *settling monotonicity*: for all $\sigma \leq \tau < \lambda$ and every $p \in \mathcal{C}$,
$$v_\sigma(p) \leq_k v_\tau(p)$$
pointwise in $A_p$.

### Predication-settling-preorder-morphism

For predication-settlings $v, v'$ over a common base $(\mathbf{L}, \mathcal{C}, E, \lambda)$, a [predication-settling-preorder-morphism](../../../code/transformers/predication-settling-preorder-morphism.md) $v \to v'$ holds iff for every $p \in \mathcal{C}$ and every $\tau < \lambda$,
$$v_\tau(p) \leq_k v'_\tau(p)$$
pointwise in $A_p$. The hom-class is a singleton when the relation holds and is empty otherwise; we write $\mathrm{morph}_{v \to v'}$ for the unique morphism when it exists.

### A category

Following Mac Lane 1971 (*Categories for the Working Mathematician*, ch. I, §2), a *category* $\mathcal{K}$ consists of:

- a class $\mathrm{Ob}(\mathcal{K})$ of objects;
- for each pair of objects $A, B \in \mathrm{Ob}(\mathcal{K})$, a set $\mathcal{K}(A, B)$ of morphisms (the *hom-set*);
- a composition operation $\circ : \mathcal{K}(B, C) \times \mathcal{K}(A, B) \to \mathcal{K}(A, C)$ for each triple of objects;
- for each object $A$, an *identity morphism* $\mathrm{id}_A \in \mathcal{K}(A, A)$,

satisfying two axioms:

- **(C1) Associativity.** For composable morphisms $f, g, h$, $(h \circ g) \circ f = h \circ (g \circ f)$.
- **(C2) Identity laws.** For every $f : A \to B$, $\mathrm{id}_B \circ f = f$ and $f \circ \mathrm{id}_A = f$.

## Statement (precise)

Define the proposed data $\mathbf{PS} := \mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ as follows:

- **Objects.** $\mathrm{Ob}(\mathbf{PS})$ is the class of predication-settlings over the base $(\mathbf{L}, \mathcal{C}, E, \lambda)$.
- **Hom-sets.** For $v, v' \in \mathrm{Ob}(\mathbf{PS})$, $\mathbf{PS}(v, v') := \{\mathrm{morph}_{v \to v'}\}$ when $v_\tau(p) \leq_k v'_\tau(p)$ for every $p \in \mathcal{C}$ and $\tau < \lambda$, and $\mathbf{PS}(v, v') := \emptyset$ otherwise.
- **Composition.** For $f \in \mathbf{PS}(v, v')$ and $g \in \mathbf{PS}(v', v'')$, $g \circ f := \mathrm{morph}_{v \to v''}$ — the unique element of $\mathbf{PS}(v, v'')$ when the latter is nonempty.
- **Identities.** For each $v \in \mathrm{Ob}(\mathbf{PS})$, $\mathrm{id}_v := \mathrm{morph}_{v \to v}$.

**(1) Hom-sets are well-defined sets.** For each pair $v, v'$, the proposed $\mathbf{PS}(v, v')$ is a set of cardinality at most one.

**(2) Identity exists.** For each $v \in \mathrm{Ob}(\mathbf{PS})$, the proposed $\mathrm{id}_v$ is an element of $\mathbf{PS}(v, v)$.

**(3) Composition is well-defined.** For $f \in \mathbf{PS}(v, v')$ and $g \in \mathbf{PS}(v', v'')$, the proposed $g \circ f$ is an element of $\mathbf{PS}(v, v'')$ — i.e., the underlying relation holds.

**(4) Associativity (C1) holds.** For composable $f, g, h$, $(h \circ g) \circ f = h \circ (g \circ f)$.

**(5) Identity laws (C2) hold.** For every $f \in \mathbf{PS}(v, v')$, $\mathrm{id}_{v'} \circ f = f$ and $f \circ \mathrm{id}_v = f$.

By (1)–(5), $\mathbf{PS}$ is a category in Mac Lane 1971's sense.

## Proof

### Proof of (1)

By the [predication-settling-preorder-morphism](../../../code/transformers/predication-settling-preorder-morphism.md) record's definition, the relation
$$\forall p \in \mathcal{C}.\,\forall \tau < \lambda.\;v_\tau(p) \leq_k v'_\tau(p)$$
either holds or fails to hold for given settlings $v, v'$. When it holds, $\mathbf{PS}(v, v')$ contains the single morphism $\mathrm{morph}_{v \to v'}$; when it fails, $\mathbf{PS}(v, v')$ is empty. In either case the hom-class has cardinality at most one, so it is a set. $\square_{(1)}$

### Proof of (2)

Fix $v \in \mathrm{Ob}(\mathbf{PS})$. For every $p \in \mathcal{C}$ and every $\tau < \lambda$, $v_\tau(p) \in A_p$. The order $\leq_k$ on $A_p$ is the pointwise lift of the order $\leq_k$ on the bilattice $\mathbf{L}^\bowtie$, which is a partial order on $L \times L$ (per the [pre-bilattice](../../../code/structures/pre-bilattice.md) definition, the second lattice $\langle B, \wedge_k, \vee_k\rangle$ has an associated partial order). Partial orders are reflexive, so $v_\tau(p)(s, o) \leq_k v_\tau(p)(s, o)$ for every $(s, o) \in E \times E$. The pointwise lift preserves reflexivity (a pointwise relation on functions $E \times E \to L \times L$ is reflexive iff the underlying relation is reflexive at every coordinate), so $v_\tau(p) \leq_k v_\tau(p)$ in $A_p$ for every $p, \tau$. Therefore the relation $v_\tau(p) \leq_k v_\tau(p)$ holds universally, so $\mathbf{PS}(v, v)$ is non-empty and contains $\mathrm{id}_v = \mathrm{morph}_{v \to v}$. $\square_{(2)}$

### Proof of (3)

Fix $f \in \mathbf{PS}(v, v')$ and $g \in \mathbf{PS}(v', v'')$. By the existence of $f$, $v_\tau(p) \leq_k v'_\tau(p)$ holds in $A_p$ for every $p \in \mathcal{C}$ and $\tau < \lambda$. By the existence of $g$, $v'_\tau(p) \leq_k v''_\tau(p)$ holds for every $p, \tau$. The order $\leq_k$ on $A_p$ inherits transitivity from the pointwise lift of $\leq_k$ on $\mathbf{L}^\bowtie$, which is a partial order. So $v_\tau(p) \leq_k v''_\tau(p)$ in $A_p$ for every $p, \tau$. The relation underlying $\mathbf{PS}(v, v'')$ therefore holds, so $\mathbf{PS}(v, v'')$ is non-empty and contains $\mathrm{morph}_{v \to v''}$. The proposed $g \circ f := \mathrm{morph}_{v \to v''}$ is an element of $\mathbf{PS}(v, v'')$. $\square_{(3)}$

### Proof of (4)

Fix composable $f \in \mathbf{PS}(v, v')$, $g \in \mathbf{PS}(v', v'')$, $h \in \mathbf{PS}(v'', v''')$. By (3) applied twice in each grouping, both $(h \circ g) \circ f$ and $h \circ (g \circ f)$ are elements of $\mathbf{PS}(v, v''')$. By (1), $\mathbf{PS}(v, v''')$ has cardinality at most one. Two elements of a one-element set are equal. So $(h \circ g) \circ f = h \circ (g \circ f)$. $\square_{(4)}$

### Proof of (5)

Fix $f \in \mathbf{PS}(v, v')$. By (2), $\mathrm{id}_{v'} \in \mathbf{PS}(v', v')$ and $\mathrm{id}_v \in \mathbf{PS}(v, v)$. By (3), $\mathrm{id}_{v'} \circ f \in \mathbf{PS}(v, v')$ and $f \circ \mathrm{id}_v \in \mathbf{PS}(v, v')$. By (1), $\mathbf{PS}(v, v')$ has cardinality at most one; it contains $f$, so the singleton is $\{f\}$. Therefore $\mathrm{id}_{v'} \circ f = f$ and $f \circ \mathrm{id}_v = f$. $\square_{(5)}$

By (1)–(5), $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ satisfies Mac Lane 1971's category axioms. $\square$

## Discussion

The proof is short because the hom-set structure is thin — singletons-or-empty. Thinness makes (4) and (5) trivial: any two parallel arrows in a thin hom-set are equal, so equational coherence holds vacuously. The substantive content is (2) and (3) — reflexivity and transitivity of the underlying $\leq_k$-relation on settlings. Both reduce to reflexivity and transitivity of $\leq_k$ on the bilattice $\mathbf{L}^\bowtie$, which is a partial order by the pre-bilattice axioms.

The category $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a *preorder-category* (also called a *thin category*) in the standard categorical sense — a category whose hom-sets are all sub-singletons. Equivalently, $\mathbf{PS}$ is the order-category of the preorder on settlings induced by the pointwise-and-stepwise $\leq_k$-relation. Whether this preorder is antisymmetric (so that $\mathbf{PS}$ is a poset-category) depends on whether settlings with mutual preorder-morphisms must be equal: $v_\tau(p) \leq_k v'_\tau(p)$ and $v'_\tau(p) \leq_k v_\tau(p)$ pointwise for all $p, \tau$ implies $v_\tau(p) = v'_\tau(p)$ for all $p, \tau$ (by antisymmetry of $\leq_k$ on $\mathbf{L}^\bowtie$), which is settling-equality. So the preorder is antisymmetric, and $\mathbf{PS}$ is a poset-category.

The category $\mathbf{PS}$ is the categorical home for several derived objects whose construction the present claim makes available:

- The *delta-injector* — the morphism placing a single datum at a single cell — has its codomain as a predication-valuation; iterating produces a settling, and the operation lifts to an endomorphism of $\mathbf{PS}$.
- The *positing morphism* $\mathrm{posit}_{(\phi, q)}: v \mapsto v \vee_k \delta_{\phi, q}$ — joining with a cell-indicator valuation — is a $\mathbf{PS}$-endomorphism by the knowledge-monotonicity of $\vee_k$, which is the subject of a separate claim.
- The *closure-2-monad* (per [closure-2-monad](../../../code/transformers/closure-2-monad.md)) is a 2-functor on the 2-category whose underlying 1-category restricts at a fixed base to $\mathbf{PS}(\mathbf{L}, \mathcal{C}, E, \lambda)$.

The category $\mathbf{PS}$ also admits the *modeling-morphism* (per [modeling-morphism](../../../code/transformers/modeling-morphism.md)) as a transverse morphism class, indexed by the truth-order $\leq_t$ rather than the knowledge-order $\leq_k$. Settlings with both preorder-morphisms and modeling-morphisms form a *doubly-enriched* structure where the two morphism classes index different categorical roles; the present claim only addresses the $\leq_k$-side.

The claim's content is not surprising — thin categories arising from preorders are a standard categorical construction. What the claim establishes is that $\mathbf{PS}$ is *categorically usable* — composable, identity-bearing, associativity-coherent — so subsequent claims (delta-injector existence, positing morphism's $\mathbf{PS}$-endomorphism status, closure 2-monad action on $\mathbf{PS}$) can be stated as morphism-level facts in $\mathbf{PS}$ rather than as relation-on-settlings facts re-derived each time.

## External references

- Mac Lane, S. (1971). *Categories for the Working Mathematician*. Graduate Texts in Mathematics 5. New York: Springer. Chapter I, §2 (definition of a category) and §3 (small and large categories).
