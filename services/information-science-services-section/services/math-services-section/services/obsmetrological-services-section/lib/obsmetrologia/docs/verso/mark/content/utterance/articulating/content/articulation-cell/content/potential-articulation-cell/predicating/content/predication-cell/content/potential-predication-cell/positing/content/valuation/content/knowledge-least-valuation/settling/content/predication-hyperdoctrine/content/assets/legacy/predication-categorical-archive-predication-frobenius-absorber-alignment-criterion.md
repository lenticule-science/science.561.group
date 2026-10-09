---
type: theorem
status: proved
depends-on: [predication-fiber-algebra, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, knowledge-order, truth-order, four-bilattice]
---

# Frobenius absorber-alignment criterion

Let $f : q \to p$ be a [predicate-category](../objects/predicate-category.md) generator and $\exists_f$ the corresponding existential adjoint with off-support **extension default** $d \in \mathbf{L}^\bowtie$ — the value $\exists_f$ assigns to cells outside the image of $f$. Let $\star : \mathbf{L}^\bowtie \times \mathbf{L}^\bowtie \to \mathbf{L}^\bowtie$ be a binary operation that distributes pointwise over the joins used by $\exists_f$. Then **Frobenius reciprocity**

$$\exists_f(f^*\alpha \,\star\, \phi) \;\cong\; \alpha \,\star\, \exists_f(\phi)$$

holds for every $\alpha$ in the fiber at $p$ and every $\phi$ in the fiber at $q$ if and only if $d$ is an **absorber** of $\star$ — i.e. $a \star d = d$ for every $a \in \mathbf{L}^\bowtie$.

## Proof

Compare the two sides cellwise.

**On the image of $f$.** Both sides agree by the definitions of $f^*$ and $\exists_f$ on the sub-support: $f^*\alpha$ restricts $\alpha$, and $\exists_f$ acts as the identity (specialization) or as the relevant join (projections, by distributivity of $\star$ over the join). Each side reduces to $\alpha \,\star\, \phi$ pulled back through $f$, then $\exists_f$-pushed forward — they coincide.

**Off the image of $f$.** Here $\exists_f$'s extension default $d$ is in force. The left-hand side equals $d$: the inner expression $f^*\alpha \star \phi$ is supported on $\mathrm{dom}(q)$ and its $\exists_f$-image takes the default $d$ off-image. The right-hand side equals $\alpha(s, o) \star d$: $\exists_f(\phi)$ is $d$ off-image and $\alpha$ takes some value $\alpha(s, o)$ at the cell. Equality of the two sides at every off-image cell, for arbitrary $\alpha$, is the assertion

$$\alpha(s, o) \star d = d \quad \text{for every } \alpha(s, o) \in \mathbf{L}^\bowtie,$$

which is exactly the condition that $d$ be a $\star$-absorber.

The "if" direction is immediate from the absorber definition. For "only if": choose $\alpha$ taking any prescribed value $a$ at the off-image cell; the equality forces $a \star d = d$. $\square$

## Instances

Of the four generators, those with off-image cells — [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md), [subject-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md), [object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md) — carry two extension defaults each, one per order-system. Each meet of $\mathbf{L}^\bowtie$ has its absorbers fixed by the bilattice axioms.

| System | $\exists_f$-default $d$ | Aligned conjunction | Misaligned conjunction |
|---|---|---|---|
| $\leq_k$ | $\bot$ | $\wedge_k$ (absorber $\bot$) | $\odot$ (absorber $\mathbf{f}$) |
| $\leq_t$ | $\mathbf{f}$ | $\wedge_t$ (absorber $\mathbf{f}$) | — |

The aligned cells recover [Frobenius for the knowledge and truth meets](../../../../../references/frobenius-for-knowledge-and-truth-meets.md). The misaligned cell — $\bot \neq \mathbf{f}$ for $(\leq_k, \odot)$ — recovers [Frobenius for fusion fails](../../../../../references/frobenius-for-fusion-fails.md). [Converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md), where $\exists_f^k = f^*$ is the swap with no off-image cells, satisfies Frobenius for any $\star$ that distributes over the swap (no absorber question arises). For the projections, the on-diagonal cells collapse by distributivity of $\star$ over the join into a single $\star$-of-joins identity that holds without an absorber hypothesis; the off-diagonal cells (which the projection extends by the relevant default) reduce to the off-image absorber question of the criterion.

## Where this places the theorem

Beck–Chevalley coherence and Frobenius reciprocity are entwined in integral hyperdoctrines because integrality of the conjunction's monoid forces alignment automatically — the conjunction's absorber and the existential extension default are both the monoidal $\bot$. The bilattice setting is non-integral on $\odot$ and the alignment becomes a separate criterion. The [BC-vs-Frobenius separation](prose/teaching/explanations/bc-vs-frobenius-separation.md) reads the same observation as a structural principle; the [Frobenius-as-modular-law remark](prose/remarks/frobenius-as-modular-law.md) places it inside the allegorical lineage of [@carboni-walters1987] and [@freyd-scedrov1990], where modular-law-style axioms are stated separately from BC and the alignment question is unbundled by design.
