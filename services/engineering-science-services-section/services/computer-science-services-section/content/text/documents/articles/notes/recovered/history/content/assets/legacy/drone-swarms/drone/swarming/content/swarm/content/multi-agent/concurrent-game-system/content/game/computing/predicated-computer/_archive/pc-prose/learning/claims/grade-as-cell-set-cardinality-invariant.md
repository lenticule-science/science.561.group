---
type: theorem
class: engineering-claim
status: proved
depends-on: [predication-cell-set, predication-valuation, closure-2-monad, closure-rule-system-realizes-closure-2-monad]
see-also: [closure-rule-system, settling-quiescence]
---

# Grade is a closure-invariant of the substrate's cell set (voidmath F2 as substrate predication)

**Claim.** Let $\Phi = E \times \Pi \times E$ be the substrate's [predication cell set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-cell-set.md), and let $v : \Phi \to \mathbf{L}^\bowtie$ be a [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md). Define the **grade** of $v$ to be the cardinality of its support — the number of cells at which $v$ commits to a non-$\bot$ value:

$$\mathrm{grade}(v) \;:=\; \#\{ \phi \in \Phi : v(\phi) \neq \bot \}.$$

Then $\mathrm{grade}$ is preserved under [closure 2-monad](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md) firing in the following sense: closure rules act on the *values* at cells, not on the cell set itself, so closure firing cannot increase or decrease the index set $\Phi$. Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), substrate operators that fire closure rules transform $v$ into $\mathrm{cl}(v)$ where $\mathrm{cl}(v)(\phi) \geq_k v(\phi)$ pointwise — the values move up the knowledge order, but the index $\phi$ ranges over the same $\Phi$.

The substrate's grade therefore changes only when *new cells enter the cell set* — when a substrate edit asserts a previously-uncommitted (subject, predicate, object) triple. Closure firing alone cannot grow the substrate's grade.

## Why this holds

Per [closure-rule-system-realizes-closure-2-monad](closure-rule-system-realizes-closure-2-monad.md), the closure operator is a function on valuations, $\mathrm{cl} : (\Phi \to \mathbf{L}^\bowtie) \to (\Phi \to \mathbf{L}^\bowtie)$, that is monotone in the knowledge order $\leq_k$ and idempotent up to lax-idempotence per [closure-2-monad-lax-idempotence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md). The operator's domain and codomain share the same $\Phi$; closure firing cannot extend $\Phi$ because the closure rule's antecedent and consequent both refer to cells already in the substrate's vocabulary — the rule changes a cell's value, it does not introduce a new cell address.

Substrate edits that admit new triples — per [`apply-edit`](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/morphisms/apply-edit.md) under [event-sourcing](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/event-sourcing.md) — *do* extend $\Phi$ when the admitted triple's address is not already in the support. These edits are the substrate's only source of grade change, and per the discipline's monotone-additive structure, they only increase grade.

## Engineering consequence

- **Grade is a free diff metric.** The substrate computes grade by counting the support of its valuation; the difference between two snapshots' grades is the number of new (subject, predicate, object) addresses admitted between them. The metric is $O(|\Phi|)$ to compute and $O(1)$ to maintain incrementally.
- **Grade is not a "richness" metric.** A high-grade substrate has many committed cells; it does not necessarily have rich values at those cells. An entity with grade-100 fiber whose every cell is at $\mathbf{f}$ has more committed structure than an entity with grade-10 fiber whose cells are at $\mathbf{t}$, but the latter is more affirmatively informative. Grade is a structural metric, not a content metric.
- **Closure firing is observably grade-neutral.** A substrate that detects a grade change during closure-only operation has detected a substrate-coherence diagnostic — closure should not be admitting new cells. Such a discrepancy localizes a non-conformant closure-rule realization.
- **Grade bounds inform capacity planning.** The substrate's storage and indexing cost scales with $\#\Phi$; grade is the operator's view of how much cell content has been admitted. Realizations can budget against grade growth without auditing the closure operator's behavior.

## Position

This theorem grounds voidmath's *F2 grade* as the cardinality of the [predication-valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md)'s support set. The voidmath claim "grade is preserved under all reductions" becomes: *closure firing acts on cell values within a fixed cell set, so it cannot change the cardinality of that set's support*. Adding a cell increases grade; removing one decreases it; closure-firing leaves it untouched.

The theorem composes with [event-as-transaction](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/event-as-transaction.md): the Δ-side of an event records a cell admission (which can grow grade), and the σ-side records the closure-induced settlement (which cannot).
