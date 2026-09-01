---
type: theorem
class: engineering-claim
status: sketch
depends-on: [lawvere-comprehension-paraconsistent, lawvere-comprehension-classical, predication-hyperdoctrine, predicate-specialization, specialization-hyperdoctrinal-adjoints, knowledge-order, truth-order, four-bilattice]
see-also: [null-as-bilattice-position, transaction-isolation-as-knowledge-order-position, query-planning-via-beck-chevalley, paraconsistency-as-substrate-discipline]
---

# A SQL `WHERE` clause is a Lawvere comprehension parameterized by a designated truth value, and the choice of designation is the structural account of three-valued-logic surprises

**Claim (sketch).** A SQL query of the shape

```sql
SELECT ... FROM p WHERE \psi
```

against a substrate predicate $p$ is the substrate's evaluation of the [Lawvere comprehension](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md) right adjoint $\{p : -\}_D$ applied to the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) section $\psi \in \mathcal{E}_p$, where $D$ is a substrate-recorded **designated truth value** drawn from the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md):

A designation $D$ is a $\leq_t$-up-closed subset of $\mathbf{FOUR}$ — the natural family of comprehensions that respect the truth-order, since $\leq_t$-monotone closure of the selected set is what makes the comprehension a right adjoint. The principal up-sets give four canonical designations (recall $\mathbf{f} \leq_t \bot \leq_t \mathbf{t}$ and $\mathbf{f} \leq_t \top \leq_t \mathbf{t}$ in $\mathbf{FOUR}$):

| Designation $D$ | Selected sub-support $\psi^{-1}(D)$ | Engineering reading |
|---|---|---|
| $D = \{\mathbf{t}\}$ | strictly classically-true cells | "rows where $\psi$ holds classically" — the SQL standard's `WHERE`, per [classical comprehension](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md) |
| $D = \{\top\}$ | cells where $\psi$ records contradictory evidence | "rows where $\psi$'s evidence is in conflict" — the primitive needed for [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md) |
| $D = \{\mathbf{t}, \top\}$ | cells with positive evidence (possibly contradicted) | "rows where $\psi$ has any positive evidence" — classical `WHERE` extended to admit cells whose positive evidence is also under contradiction |
| $D = \{\mathbf{t}, \top, \bot\}$ | cells with no negative-only evidence | "rows where $\psi$ is not classically refuted" |

The paraconsistent comprehension $\{p : \psi\}_\top$ per [paraconsistent-comprehension](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md) is the case $D = \{\top\}$ — an information-maximal designation that selects exactly the cells the substrate must surface to a repair operator, and is *not* the "any information" reading. The "any information" reading (cells where $\psi$'s evidence is non-trivial in either direction) is a different designation, $D = \{\mathbf{t}, \mathbf{f}, \top\} = \mathbf{FOUR} \setminus \{\bot\}$, which is the maximal $\leq_t$-up-closed subset that excludes the no-information cell; this is not a principal up-set of a single element of $\mathbf{FOUR}$ and is the substrate's "WHERE the cell has been written to at all" primitive.

The notorious SQL three-valued-logic surprises (`WHERE x = NULL` matches nothing; `WHERE x IS NULL OR x IS NOT NULL` does not match cells with contradictory in-flight evidence; aggregates silently drop NULL) are the legacy of the standard fixing the designation at $D = \{\mathbf{t}\}$ without exposing the parameter. A substrate that records the designation per query exposes the choice and recovers structurally well-behaved alternatives.

## Why this is a sketch (not yet proved)

A clean proof requires:

1. **A precise binding of SQL surface syntax to the hyperdoctrinal expression.** The mapping `WHERE \psi → \psi \in \mathcal{E}_p` is folkloric in the corpus; an explicit functor from the SQL fragment under consideration into the predication-hyperdoctrine is needed for a fully formal claim. A reasonable starting fragment is the Codd algebra plus aggregate functions, deliberately excluding subqueries and recursive CTEs (which require a separate treatment via the closure-2-monad).
2. **A characterization of which designations give comprehension functors.** Per [paraconsistent comprehension](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-paraconsistent.md), the right adjoint $\{p : -\}_\top$ is a comprehension functor; per [classical comprehension](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/lawvere-comprehension-classical.md), so is $\{p : -\}_\mathbf{t}$. The conjecture is that *every* $\leq_t$-up-closed designation $D \subseteq \mathbf{FOUR}$ gives a right adjoint to a corresponding extension functor (extension by an element of $\mathbf{FOUR} \setminus D$), and that the four principal up-sets enumerated above are the canonical ones because their extension partners coincide with the bilattice's named generators ($\mathbf{f}, \bot, \top$). A formal version awaits a uniqueness lemma for the extension partner.
3. **The explicit reduction of legacy three-valued-logic surprises to specific designation choices.** Each of the SQL standard's well-known surprises reduces to "the designation was fixed at $\mathbf{t}$ but the application would have wanted a different designation"; tabulating that reduction across the standard's edge cases — `IS NULL`, `IS NOT NULL`, `IS DISTINCT FROM`, `COALESCE`, the aggregate functions — is mechanical but lengthy and is left to a future refinement.

A status-`proved` version lands once these three ingredients are written out as separate lemmas.

## Why the sketch is structurally on the right track

- The right-adjointness of $\{p : -\}_D$ (for both $D = \mathbf{t}$ and $D = \top$) is established per the comprehension theorems above. Both designations therefore give *real* comprehension functors with the universal property; neither is a hack.
- The two designations correspond to the two bilattice orders' top elements (per the [bilattice-two-orders-duality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-two-orders-duality.md)). The structural symmetry between truth-order and knowledge-order makes "the application picks which order it wants its `WHERE` to read against" a well-typed question, not a stylistic preference.
- The legacy SQL `NULL` is a *projection* per [null-as-bilattice-position](teaching/explanations/null-as-bilattice-position.md). The standard's three-valued logic is what one gets after projecting away the bilattice's $\bot$/$\top$ distinction and pretending the result is still a comprehension functor — which it is not, since the projection is not a right adjoint. The paraconsistent comprehension recovers the missing right-adjointness by working in the bilattice directly.

## Engineering consequence

- **A query's designation is substrate content.** Per [self-representation](../../teaching/explanations/self-representation.md), the designation $D$ chosen for a `WHERE` clause is recorded on the query-plan-record and witnessed in the [witness](../../../objects/witness.md) chain, alongside the [transaction-isolation-level](teaching/explanations/transaction-isolation-level.md). Two queries with the same syntactic `WHERE` may select different sub-supports because their designations differ; the substrate's audit machinery distinguishes them.
- **Backwards compatibility.** A substrate exposing a SQL surface fixes the default to $D = \mathbf{t}$, reproducing the SQL standard's behavior. Queries that want the paraconsistent reading opt in via a substrate-specific clause (e.g. `WHERE \psi WITNESSING ANY-INFORMATION`). The substrate does not silently change the answer to legacy queries.
- **Aggregates inherit the designation.** A `SUM(x) FROM p WHERE \psi` query aggregates over the comprehension's selected sub-support; aggregates over $\{p : \psi\}_\mathbf{t}$ drop $\bot$- and $\top$-cells (the SQL standard's "ignore NULLs" behavior); aggregates over $\{p : \psi\}_\top$ raise on $\top$-cells (refusing to sum over a contradiction without explicit repair). The substrate makes this choice visible, not hidden.
- **The $D = \{\top\}$ `WHERE` is the correct primitive for repair queries.** Per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md), a repair operator targeting cells in contradiction needs to *find* those cells; the classical $D = \{\mathbf{t}\}$ comprehension hides them by construction. The $D = \{\top\}$ comprehension selects exactly the contradiction-bearing cells and is the structural primitive the repair pipeline needs.
- **Composability with isolation.** Per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md), the transaction's chosen $\leq_k$-position determines which fiber-algebra section $\psi$ is evaluated against; the designation $D$ then determines which part of *that* section is selected. The two parameters are orthogonal: isolation picks the section, designation picks the comprehension. A coherent query specifies both.

## What the theorem rules out

- **Treating `WHERE` as Boolean filtering.** Boolean filtering presupposes the value space is two-valued; on a substrate whose value space is the bilattice $\mathbf{FOUR}$ (or any larger bilattice), Boolean filtering is the legacy projection and cannot be the substrate's own primitive. The substrate's primitive is comprehension parameterized by designation.
- **Aggregates that silently bridge designations.** A query that filters with $D = \mathbf{t}$ and aggregates as if the result lived in $D = \top$'s selection is incoherent; the substrate refuses such combinations or makes the bridging step an explicit substrate operator (typically an [apply-repair](../../../morphisms/apply-repair.md) or a [validate-against-shape](../../../morphisms/validate-against-shape.md) call).
- **`NULL` semantics as a property of `=`.** SQL's `x = NULL` returns `UNKNOWN` because the standard's equality is the truth-order projection of the substrate's [paraconsistent-equality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md) collapsed onto two values. The substrate's equality returns a $\mathbf{FOUR}$-valued result; whether `WHERE` selects on it is the designation's job, not the equality's. Predicates and comprehension are separable.

## Position

This theorem, together with [null-as-bilattice-position](teaching/explanations/null-as-bilattice-position.md) and [inverse-join-as-converse-self-adjoint](inverse-join-as-converse-self-adjoint.md), brings into the database-platform the predication-category atoms — paraconsistent comprehension, the converse self-adjointness, and the twist-product / four-bilattice account of cell positions — that the parent predicated-computing theory had developed but the database-platform had not yet specialized. With these in place, the database-platform's accounts of `WHERE`, `JOIN`, and `NULL` are bilattice-native primitives with legacy SQL recovered as the $D = \{\mathbf{t}\}$, $\bot$-projected default rather than as the underlying semantics.
