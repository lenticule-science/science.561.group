---
type: theorem
status: proved
depends-on: [predication-fibration, predication-hyperdoctrine, predicate-category, predication-fiber-algebra, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, predicate-generator-pullback-closure, knowledge-order, truth-order]
---

# Beck–Chevalley commutation on predication bilattices

Let $\mathcal{E}$ be an [predication fibration](../objects/predication-fibration.md). Then $\mathcal{E}$ satisfies the Beck–Chevalley axiom of an [predication hyperdoctrine](../objects/predication-hyperdoctrine.md): for every pullback square in the [predicate category](../objects/predicate-category.md) $\mathcal{C}$

$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array}$$

and every $\phi \in \mathcal{E}_B$, the canonical maps

$$\exists_{p_A}^{k}(p_B^*\phi) \to f^*(\exists_g^{k}\phi), \qquad \exists_{p_A}^{t}(p_B^*\phi) \to f^*(\exists_g^{t}\phi)$$

are isomorphisms in $\mathcal{E}_A$. The dual statements for $\forall$ also hold.

## Proof

The proof has three parts.

**Part I (cellwise reduction).** All four generators act on fibers by $f^*(v)(s, o) = v(\phi_f(s, o))$, where $\phi_f : E \times E \rightharpoonup E \times E$ is an equivariant partial function. The left adjoints $\exists_f^{k/t}$ are given cellwise: extension by $\bot$ or $\mathbf{f}$ for [specialization](../morphisms/predicate-specialization.md), swap for [converse](../morphisms/predicate-converse.md), row- or column-folds for [subject-projection](../morphisms/predicate-subject-projection.md) and [object-projection](../morphisms/predicate-object-projection.md). Dually for $\forall_f$. Compositions of generators are again cellwise reindexings plus cellwise extensions. Beck–Chevalley at the fibration level thus reduces to a cellwise statement at each $(s, o) \in E \times E$.

**Part II (pullback closure).** By the [predicate generator pullback closure](predicate-generator-pullback-closure.md) result, the four generator classes are closed under pullback in $\mathcal{C}$. Thus every $\mathcal{C}$-pullback square lifts, on the fiber level, to a pullback square in the category $\mathbf{IndexMap}(E)$ of equivariant partial maps on $E \times E$.

**Part III (base change in $\mathbf{IndexMap}(E)$).** The category $\mathbf{IndexMap}(E)$ has pullbacks computed as intersections of sub-supports composed with compositions of equivariant partial functions. By the classical base-change lemma for set-indexed categories ([@jacobs1999] Ch 1; [@streicher2018] §13), left Kan extension along a pullback equals pullback of a left Kan extension. This gives Beck–Chevalley cellwise. $\square$

## Remark

The predication-hyperdoctrine's Beck–Chevalley argument is unusually direct because of the uniform-fiber-algebra construction: in classical hyperdoctrines with fiber $P(X)$ varying by type $X$, BC involves non-trivial naturality of sub-object formation across pullback. Here the fibers are uniformly $\mathbf{L}^{\bowtie E \times E}$, and reindexing is cellwise; BC reduces to cellwise index-map pullback, which is immediate.

The theorem establishes BC at the 1-categorical level of $\mathcal{C}$. The 2-categorical lift to the [temporal 2-category](../objects/temporal-2-category.md) is established in [temporal Beck–Chevalley](temporal-beck-chevalley.md).
