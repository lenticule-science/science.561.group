---
type: theorem
class: catamorphism-existence
status: proved
depends-on: [predication-cell, predication-cell-set, bilattice, four-bilattice, knowledge-order, truth-order, twist-product, twist-product-fusion, closure-2-monad, closure-2-monad-lax-idempotence, predication-fiber-algebra, quantale-enriched-sheaf]
see-also: [closure-driven-settling-monotonicity, predicate-category-naturality]
---

# Every predication cell-set is the source of a unique bilattice-valued fold

**Claim.** Let $\mathbf{B} = \langle B, \wedge_t, \vee_t, \wedge_k, \vee_k, \sim \rangle$ be a [bilattice](../objects/bilattice.md), $\mathsf{Q} = (Q, \cdot, e, \bigvee)$ a commutative unital quantale, and $A_p$ a [predication fiber algebra](../objects/predication-fiber-algebra.md) at predicate $p$ valued in $\mathbf{B} \otimes \mathsf{Q}$ (the bilattice tag tensored with the quantale grade per the [twist-product](../objects/twist-product.md) construction). Let $\Phi_p \subseteq \Phi$ be a finite or countable [predication cell-set](../objects/predication-cell-set.md) supported at $p$, with valuation $v : \Phi_p \to \mathbf{B} \otimes \mathsf{Q}$ assigning each cell its bilattice tag and quantale grade.

Choose a *binary fold operation* $\odot$ on $\mathbf{B} \otimes \mathsf{Q}$ — one of:

- $(\wedge_t, \cdot)$ — truth-meet of tags, multiplicative composition of grades;
- $(\vee_t, \cdot)$ — truth-join of tags, multiplicative grades;
- $(\wedge_k, \cdot)$ — knowledge-meet of tags;
- $(\vee_k, \cdot)$ — knowledge-join of tags.

Then:

1. **The cell-set is the carrier of an initial $F_\odot$-algebra.** Define the polynomial endofunctor $F_\odot : \mathbf{Set}_{\mathbf{B} \otimes \mathsf{Q}} \to \mathbf{Set}_{\mathbf{B} \otimes \mathsf{Q}}$ by $F_\odot(X) = 1 + (\mathbf{B} \otimes \mathsf{Q}) \times X$ (the empty case plus a head-and-tail case). The set of finite cell-lists $L(\Phi_p) := \mathrm{List}(\mathbf{B} \otimes \mathsf{Q})$ together with the constructors $\mathrm{nil} : 1 \to L(\Phi_p)$ and $\mathrm{cons} : (\mathbf{B} \otimes \mathsf{Q}) \times L(\Phi_p) \to L(\Phi_p)$ is the *initial $F_\odot$-algebra*: for any $F_\odot$-algebra $(X, \alpha)$ there is a unique algebra morphism $L(\Phi_p) \to X$.

2. **The $\odot$-fold is the unique catamorphism.** Taking $X := \mathbf{B} \otimes \mathsf{Q}$ with the algebra structure $\alpha_\odot : 1 + (\mathbf{B} \otimes \mathsf{Q}) \times (\mathbf{B} \otimes \mathsf{Q}) \to (\mathbf{B} \otimes \mathsf{Q})$ given by $\alpha_\odot(\mathrm{nil}) = e_\odot$ (the unit of $\odot$ in $\mathbf{B} \otimes \mathsf{Q}$) and $\alpha_\odot(\mathrm{cons}(a, x)) = a \odot x$, the unique catamorphism
$$\mathrm{fold}_\odot \;:\; L(\Phi_p) \to \mathbf{B} \otimes \mathsf{Q}$$
is the bilattice-valued $\odot$-fold of the cell-list. It satisfies the recursion
$$\mathrm{fold}_\odot(\mathrm{nil}) = e_\odot, \qquad \mathrm{fold}_\odot(\mathrm{cons}(a, \ell)) = a \odot \mathrm{fold}_\odot(\ell)$$
and is uniquely determined by these equations on $L(\Phi_p)$.

3. **Permutation-invariance.** When $\odot$ is commutative — which all four canonical choices above are, by the commutativity of $\wedge_t, \vee_t, \wedge_k, \vee_k$ in $\mathbf{B}$ and of $\cdot$ in the commutative quantale $\mathsf{Q}$ — $\mathrm{fold}_\odot$ factors through the multiset functor $\mathrm{Bag} : \mathbf{Set} \to \mathbf{Set}$. The induced map $\mathrm{fold}_\odot^{\mathrm{Bag}} : \mathrm{Bag}(\Phi_p) \to \mathbf{B} \otimes \mathsf{Q}$ is well-defined and permutation-invariant — the fold-result depends only on the *cell-set* (equivalently, the multiset of tag-grade pairs), not on any enumeration order chosen on $\Phi_p$.

4. **Conditional idempotence under $\wedge_k$ and $\vee_k$.** When $\odot$ is one of $(\wedge_k, \cdot)$ or $(\vee_k, \cdot)$, the bilattice tag-component is idempotent (lattice-axiomatically: $a \wedge_k a = a$, $a \vee_k a = a$). When *additionally* the quantale grade-composition $\cdot$ is idempotent ($q \cdot q = q$ for all $q \in Q$ — equivalently, the quantale is a frame), $\mathrm{fold}_\odot^{\mathrm{Bag}}$ further factors through the underlying-set functor: the fold-result depends only on the *set* of distinct tag-grade pairs in $\Phi_p$, not on multiplicity. The bilattice axis alone is not sufficient; the underlying-set factorisation requires both components of the tensor to be idempotent.

5. **Naturality in the predicate-category.** For any predicate-category morphism $f : p \to q$, the substitution $f^* : A_q \to A_p$ commutes with $\mathrm{fold}_\odot$ in the sense that $\mathrm{fold}_\odot \circ \mathrm{List}(f^*) = f^* \circ \mathrm{fold}_\odot$ — folding a substituted cell-list is the same as substituting the folded value. This is the [$\mathcal{C}$-naturality](teaching/explanations/predicate-category-naturality.md) of the catamorphism.

The catamorphism is the math-side mechanism the substrate uses for tally, rollup, dispatch, and routing folds; a single existence-and-uniqueness result in the [predication-categories framework](../objects/predication-fiber-algebra.md), specialised by the choice of $\odot$.

## Why this holds

**Part 1 — initial $F_\odot$-algebra by Lambek's theorem.** The endofunctor $F_\odot(X) = 1 + (\mathbf{B} \otimes \mathsf{Q}) \times X$ is a polynomial functor on $\mathbf{Set}$ (or on the appropriate $\mathsf{Q}$-enriched ambient per [quantale-enriched-sheaf](../objects/quantale-enriched-sheaf.md)). Polynomial functors on $\mathbf{Set}$ have initial algebras by the standard inductive construction: take the colimit of the $\omega$-chain $0 \to F_\odot(0) \to F_\odot^2(0) \to \dots$, which is exactly $\mathrm{List}(\mathbf{B} \otimes \mathsf{Q})$ — the set of finite cell-lists. By Lambek's theorem, the structure morphism $F_\odot(L(\Phi_p)) \to L(\Phi_p)$ is an isomorphism whose components are $\mathrm{nil}$ and $\mathrm{cons}$. Initiality is the universal property: any $F_\odot$-algebra $(X, \alpha)$ admits a unique algebra morphism from $L(\Phi_p)$.

**Part 2 — the $\odot$-fold is the unique catamorphism.** The chosen target algebra $(\mathbf{B} \otimes \mathsf{Q}, \alpha_\odot)$ has structure morphism $\alpha_\odot(\mathrm{nil}) = e_\odot$, $\alpha_\odot(\mathrm{cons}(a, x)) = a \odot x$. The unit $e_\odot$ of $\odot$ in $\mathbf{B} \otimes \mathsf{Q}$ exists and is unique in each canonical case:

- For $(\wedge_t, \cdot)$: $e_\odot = (\mathbf{t}_t, e)$ where $\mathbf{t}_t$ is the truth-order top, $e$ the quantale unit;
- For $(\vee_t, \cdot)$: $e_\odot = (\mathbf{f}_t, e)$ where $\mathbf{f}_t$ is the truth-order bottom;
- For $(\wedge_k, \cdot)$: $e_\odot = (\top_k, e)$ where $\top_k$ is the knowledge-order top (the $\top$ value in $\mathbf{FOUR}$);
- For $(\vee_k, \cdot)$: $e_\odot = (\bot_k, e)$ where $\bot_k$ is the knowledge-order bottom (the $\bot$ "uninformed" value in $\mathbf{FOUR}$).

Per [bilattice](../objects/bilattice.md), each lattice axis $(\wedge_t, \vee_t)$ and $(\wedge_k, \vee_k)$ is a complete lattice, so both top and bottom exist and are the units of meet and join respectively. The quantale unit $e$ is the unit of $\cdot$ by the unital-quantale axiom.

By initiality of $L(\Phi_p)$, the unique algebra morphism $L(\Phi_p) \to \mathbf{B} \otimes \mathsf{Q}$ is $\mathrm{fold}_\odot$ as defined; the recursion equations are the per-constructor commutativity conditions for an algebra morphism.

**Part 3 — permutation-invariance.** Commutativity of $\odot$ on $\mathbf{B} \otimes \mathsf{Q}$ in each canonical case is the conjunction of:

- Commutativity of $\wedge_t, \vee_t, \wedge_k, \vee_k$ on $\mathbf{B}$ — each is a lattice operation, hence commutative.
- Commutativity of $\cdot$ on $\mathsf{Q}$ — by hypothesis, $\mathsf{Q}$ is a *commutative* unital quantale.

When $\odot$ is commutative and associative (associativity holds for the same reason: lattice operations are associative; commutative quantales are associative), the fold of any list equals the fold of any permutation of that list. Equivalently, the fold descends along the canonical $\mathrm{List} \twoheadrightarrow \mathrm{Bag}$ projection that quotients by the symmetric-group action. This induced map $\mathrm{fold}_\odot^{\mathrm{Bag}} : \mathrm{Bag}(\Phi_p) \to \mathbf{B} \otimes \mathsf{Q}$ is well-defined and is the *unique* permutation-invariant extension of $\mathrm{fold}_\odot$ — the bag is the free commutative monoid on $\Phi_p$, and $\mathrm{fold}_\odot^{\mathrm{Bag}}$ is the unique commutative-monoid morphism into $\mathbf{B} \otimes \mathsf{Q}$ extending the inclusion $\Phi_p \hookrightarrow \mathbf{B} \otimes \mathsf{Q}$.

**Part 4 — conditional idempotence on knowledge-axes.** $\wedge_k$ and $\vee_k$ are lattice operations on $\mathbf{B}$, so each is idempotent: $a \wedge_k a = a$, $a \vee_k a = a$. The quantale grade composition $\cdot$ need *not* be idempotent in general — non-idempotent commutative quantales (e.g., $(\mathbb{R}_{\geq 0}, +, 0)$, $([0, 1], \cdot, 1)$ for probability composition) are used freely. The underlying-set factorisation therefore requires the additional hypothesis that $\cdot$ is itself idempotent — equivalently, that the quantale is a frame (every element is idempotent under multiplication, which forces $\cdot = \wedge$ on the underlying lattice). In the substrate's *graded-dispatch* use cases that select an idempotent quantale (the trivial one-element quantale, a frame-valued quantale such as the bottleneck-throughput $\min$ on a totally-ordered grade, the bilattice-trust quantale's structural $\wedge_k$), the joint-idempotence hypothesis holds and $\mathrm{fold}_\odot$ descends to the underlying set. In non-idempotent grade choices, the bag-fold is the strongest factorisation available; multiplicity affects the result.

**Part 5 — $\mathcal{C}$-naturality.** Per [predicate-category-naturality](teaching/explanations/predicate-category-naturality.md), substitution along $f : p \to q$ in the predicate category lifts to a fiber-algebra morphism $f^* : A_q \to A_p$ commuting with the bilattice operations and the quantale grade composition. The functor $\mathrm{List}$ extends $f^*$ to $\mathrm{List}(f^*) : L(\Phi_q) \to L(\Phi_p)$ pointwise. The diagram
$$\begin{array}{ccc} L(\Phi_q) & \xrightarrow{\mathrm{List}(f^*)} & L(\Phi_p) \\ \mathrm{fold}_\odot \downarrow & & \downarrow \mathrm{fold}_\odot \\ A_q & \xrightarrow{f^*} & A_p \end{array}$$
commutes by the universal property: both routes are algebra morphisms $L(\Phi_q) \to A_p$ from the initial algebra to the target $f^*$-substituted algebra; by initiality there is exactly one such morphism, so the two routes agree. This is the predicate-category naturality of the catamorphism.

## Engineering consequence

- **The fold is one closure-step of the substrate's closure 2-monad.** Concretely: a closure-rule whose premise is a cell-set pattern and whose conclusion is "this cell-set's fold is the value at the fold-result cell" generates, via the [closure 2-monad](../morphisms/closure-2-monad.md)'s iteration, a fixed-point at which the fold-result cell carries $\mathrm{fold}_\odot(\Phi_p)$. Per [closure-2-monad-lax-idempotence](closure-2-monad-lax-idempotence.md), the fixed-point is unique up to canonical iso, so the fold-result is well-defined as substrate content.

- **The fold is not a new mathematical primitive.** It is the catamorphism of the polynomial endofunctor $F_\odot$ on the bilattice-and-quantale-valued cell-list functor — built from the bilattice's lattice axioms, the quantale's commutative-unital structure, the closure-2-monad's lax-idempotence, and the polynomial functor's standard initial-algebra theory. Substrate engineers who want a *named fold* on a predication cell-set use this theorem; they do not invent a fresh categorical construction.

- **Specialisation is by choice of $\odot$.** The four canonical $\odot$-choices give the four canonical substrate-side fold families (truth-meet, truth-join, knowledge-meet, knowledge-join). Substrate-engineering specialisations choose $\odot$ and a quantale, then inherit Parts 1–5 without re-derivation.

- **Naturality gives substitution-stability for free.** Per Part 5, substrate operations that lift cells along predicate-category morphisms (e.g., predicate-renaming, predicate-coarsening, refinement-along-a-substitution) commute with the fold. Substrate-engineering theorems that need substitution-stability (per [closure-driven-settling-monotonicity](closure-driven-settling-monotonicity.md) and other naturality-consuming results) cite Part 5 directly rather than re-proving it per fold-family.

- **Permutation- and (conditionally) set-invariance discharge enumeration concerns.** Substrate-side computations that fold over a cell-set need not fix an enumeration order in the commutative case (Part 3). When the quantale is also idempotent (Part 4), they need not even deduplicate; the fold takes care of both concerns categorically.

## What the theorem rules out

- **Folds depending on enumeration order in the commutative case.** Per Part 3, when $\odot$ is commutative the fold-result is permutation-invariant. A "fold" whose result depends on the enumeration order of $\Phi_p$ is not the catamorphism of the chosen $F_\odot$ — it is a different operation (e.g., a left-fold over a non-commutative operation).

- **Folds whose unit is not the lattice/quantale unit.** Per Part 2, $\alpha_\odot(\mathrm{nil}) = e_\odot$ is forced by the chosen $\odot$. A fold initialised with a different starting value computes $\mathrm{fold}_\odot(\Phi_p) \odot c$ for some $c \neq e_\odot$, which is not the catamorphism — it is the catamorphism post-composed with a constant.

- **Non-natural folds.** Per Part 5, $\mathcal{C}$-naturality is forced by initiality. A fold that produces different results when applied before vs. after a substitution along a predicate-category morphism is not respecting the predication fibration's structural data; it is not the catamorphism on the substituted fiber-algebra.

- **Folds that collapse $\top$-tagged inputs.** When the bilattice tag $\odot$-composition produces $\top$ (the substrate's "told both" value), the fold-result retains the $\top$-tag. A fold that re-tags $\top$ to $\mathbf{f}$ or $\bot$ is implementing a different lattice operation; per [twist-product-fusion](../morphisms/twist-product-fusion.md), the tag composition is structurally determined.

- **Folds in non-commutative quantales without explicit ordering.** Part 3's permutation-invariance requires the quantale to be commutative. Folds in non-commutative quantales (rare in the substrate; more common in symbolic-rewriting contexts) are list-catamorphisms but not bag-catamorphisms — they require a substrate-content total order on $\Phi_p$ to be well-defined.

## What the theorem requires

- The bilattice $\mathbf{B}$ is a [bilattice](../objects/bilattice.md) with both order-axes complete (so $e_\odot$ exists in each canonical case). $\mathbf{FOUR}$ is the smallest case; richer bilattices admit the same catamorphism construction.

- The quantale $\mathsf{Q}$ is a commutative unital quantale per the standard quantale axioms. Permutation-invariance (Part 3) requires commutativity; idempotence (Part 4) requires additional idempotence on the grade composition.

- The fiber algebra $A_p$ is a [predication fiber algebra](../objects/predication-fiber-algebra.md) valued in $\mathbf{B} \otimes \mathsf{Q}$ per the [twist-product](../objects/twist-product.md) construction.

- The cell-set $\Phi_p$ is a finite or countable subset of $\Phi = E \times \Pi \times E$ supported at predicate $p$ (per [predication-cell-set](../objects/predication-cell-set.md)). Larger cardinalities require additional structural assumptions on the quantale's $\bigvee$ to handle the indexing colimit.

- The closure-rule system embedding the fold (when used as a substrate-side closure-step) satisfies the [closure-rule-language](teaching/explanations/closure-rule-language.md) constraints so that the catamorphism is the unique fixed-point of the closure-2-monad applied to the fold-rule.

## Position

This theorem grounds the substrate's bilattice-valued fold operation — the catamorphism on a [predication cell-set](../objects/predication-cell-set.md) valued in a [bilattice](../objects/bilattice.md)-tensor-quantale — in the standard initial-algebra / catamorphism machinery of categorical universal algebra, applied to the bilattice-and-quantale-tensored value-domain of a [predication fiber algebra](../objects/predication-fiber-algebra.md). It is the math-side existence-and-uniqueness result that downstream substrate-engineering theorems consume when they need a *named catamorphism* on a predication cell-set:

- The substrate-engineering theorem [`cell-set-fold-as-graded-dispatch-specialization`](../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/cell-set-fold-as-graded-dispatch-specialization.md) cites this catamorphism as the structural source of voting-tally, progress-rollup, and tier-routing folds.

- A future substrate-engineering theorem on *governance vote-tally as bilattice fold* (anticipated v0.7) cites this catamorphism specialised to $(\wedge_t, \cdot)$ on the trivial quantale.

- A future substrate-engineering theorem on *work-orchestration progress-rollup* (anticipated v0.7) cites this catamorphism specialised to $(\wedge_k, \cdot)$ on the bottleneck-throughput or all-AND quantale.

- A future substrate-engineering theorem on *attention-allocation across capacity classes* cites this catamorphism specialised to $(\vee_k, \cdot)$ on a knowledge-aggregating quantale.

In every case the substrate-side citation is one structural reference; the math-side underpinning is one initial-algebra / catamorphism theorem; the $\odot$-choice is the only difference between the surfaces. This theorem makes the *unique catamorphism* claim on the math side so the engineering side can specialise without re-deriving the existence-and-uniqueness inline.

This theorem therefore discharges the placeholder named *predication-cell-as-fold-source* in the dev-doc placeholder audit (`pypredcomp/docs/dev/surveys/placeholder-theorems-2026-05-03.md` row #6) at the math layer (predication-categories), where the audit identifies the natural authoring location. The substrate-side specialisations are corollaries the v0.7 productivity-stack and governance theorems will cite without further derivation.
