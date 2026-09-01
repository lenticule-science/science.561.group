---
type: concept
class: structural-duality
status: stable
depends-on: [formal-context]
see-also: [concept-as-closed-pair, derivation-operator]
---

# Intent–extent duality

The structural duality on which FCA is built. Every formal context $(G, M, I)$ induces a pair of mutually adjoint operators between $\mathcal{P}(G)$ and $\mathcal{P}(M)$:

$$
A' \;:=\; \{m \in M \mid \forall g \in A.\ g \, I \, m\} \qquad B' \;:=\; \{g \in G \mid \forall m \in B.\ g \, I \, m\}
$$

— the **derivation operators** of the context. $A'$ is the set of attributes shared by every object in $A$; $B'$ is the set of objects bearing every attribute in $B$.

The pair $(({-})', ({-})')$ is a **Galois connection** between the powersets, both ordered by inclusion: $A_1 \subseteq A_2 \implies A_2' \subseteq A_1'$ (and dually); $A \subseteq A''$ for every $A \subseteq G$; $A' = A'''$. The composite $A \mapsto A''$ is therefore a **closure operator** on $\mathcal{P}(G)$ (idempotent, extensive, monotone), and dually $B \mapsto B''$ is a closure operator on $\mathcal{P}(M)$. The closed sets of these closures are exactly the extents and intents of the formal concepts of $(G, M, I)$ (per [concept-as-closed-pair](concept-as-closed-pair.md)).

## Why "duality"

The Galois connection inverts inclusion: enlarging the extent shrinks the intent and vice versa. This is the formal counterpart of the Aristotelian inverse relation between extension (the things falling under a concept) and intension (the attributes characterising the concept). In FCA, the inverse relation is not an empirical regularity but a definitional consequence of the Galois connection.

The duality also exchanges the roles of $G$ and $M$: the **dual context** $(M, G, I^{-1})$ has the same concept lattice as $(G, M, I)$ with intents and extents swapped. Many proofs in the lineage are written once and used twice by appealing to context-duality.

## Operational consequences

- **Computing concepts is computing closures.** Algorithms for concept-lattice extraction (NextClosure, AddIntent, In-Close) are at base closure-operator algorithms over $\mathcal{P}(G)$ or $\mathcal{P}(M)$.
- **Implications follow from the closure operator.** An attribute implication $B_1 \to B_2$ holds in the context iff $B_2 \subseteq B_1''$. The implication base of the context (per [attribute-implication](attribute-implication.md)) is therefore extracted from the closure operator on $\mathcal{P}(M)$.
- **Many-valued generalisation preserves the duality.** Belohlavek's residuated-lattice generalisation replaces the universal quantifier "$\forall g \in A.\ g \, I \, m$" with the residuated infimum $\bigwedge_{g \in A} I(g, m)$; the resulting operators are still adjoint and the closure operators still produce a complete concept lattice (see [residuated-context](../objects/residuated-context.md)).

## Relation to the predication-cell substrate

Read against [predicated-knowledge-systems](../../predicated-knowledge-systems/), the Galois closure on $\mathcal{P}(G)$ and $\mathcal{P}(M)$ is the [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) of one specific [closure-rule system](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md): the system whose only rules are the two derivation rules above, applied to the trivial single-predicate `has-attribute`. The intent–extent duality is, structurally, the substrate's adjoint pair $\exists_f \dashv f^*$ (per the predicated subtheory's [specialize](../../predicated-knowledge-systems/morphisms/specialize.md)) restricted to the trivial predicate-category.
