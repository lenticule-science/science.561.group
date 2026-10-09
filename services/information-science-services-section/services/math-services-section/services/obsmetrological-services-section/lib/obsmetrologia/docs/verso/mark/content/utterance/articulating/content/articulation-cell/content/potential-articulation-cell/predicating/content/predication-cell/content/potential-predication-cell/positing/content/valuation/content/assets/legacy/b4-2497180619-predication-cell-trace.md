---
name: predication-cell-trace
description: "The slice of a predication-settling at a fixed predication-cell — the ≤_k-monotone function T_φ,v : λ → L^⋈ obtained by evaluating each v_τ at the cell φ = (s, p, o). A layer-1 categorical object; the per-cell trajectory of a settling. The cell-record packages the endpoint of a trace; the predication-cell-trace packages the full chain."
member-of: predication-cell-set
recording-value: bilattice-value
monotonic-in-knowledge-order: predication-cell-trace
collecting-valuations: predication-valuation
indexed-by-entity-set: entity-set
parameterized-by-residuated-lattice: residuated-lattice
closure-2-monad: predication-cell-trace
references:
  - id: birkhoff1973
    type: book
    title: Lattice Theory
    publisher: American Mathematical Society
    edition: 3rd
    issued:
      - year: 1973
  - id: ginsburg-sands1979
    type: article-journal
    title: Chains as a categorical primitive
    container-title: Algebra Universalis
    issued:
      - year: 1979
---

Fix base parameters $(\mathbf{L}, \mathcal{C}, E, \lambda)$ — an integral commutative residuated lattice, a small [predicate-category](../../../../../object/library/thing/library/category/library/predicate-category/predicate-category.md) with finite limits, an [entity-set](../../../../../entity-set/entity-set.md), and a settling bound $\lambda$. Fix a [predication-cell](../../predication-cell.md) $\phi = (s, p, o)$ and a [predication-settling](../../../../../predication-settling-category/library/predication-settling/predication-settling.md) $v = (v_\tau)_{\tau < \lambda}$ over those base parameters.

The **predication-cell-trace at $\phi$ along $v$** is the function

$$T_{\phi, v} \;:\; \lambda \longrightarrow \mathbf{L}^\bowtie, \qquad T_{\phi, v}(\tau) \;:=\; v_\tau(p)(s, o).$$

The codomain is the carrier $\mathbf{L}^\bowtie$ of the twist product at predicate $p$. The domain is the ordinal $\lambda$ viewed as a well-ordered set. The function inherits the knowledge order $\leq_k$ on $\mathbf{L}^\bowtie$ pointwise.

When the underlying settling is clear from context, we write $T_\phi$. When the cell is also clear, we write $T$.

## Theorems

The following theorems are proved here inline. Each theorem will be expanded into its own `learning/answering/predication-cell-trace-is-a-[$structure].md` file as the derivation chain it sits in grows.

### T1. Settling monotonicity slices to chain monotonicity

For every settling $v$, every cell $\phi$, and every $\sigma \leq \tau < \lambda$:

$$T_{\phi, v}(\sigma) \;\leq_k\; T_{\phi, v}(\tau) \quad \text{in } \mathbf{L}^\bowtie.$$

**Proof.** Settling monotonicity (the defining condition on a [predication-settling](../../../../../predication-settling-category/library/predication-settling/predication-settling.md)) asserts $v_\sigma(p) \leq_k v_\tau(p)$ pointwise in $A_p$. The fiber algebra's pointwise order is, by the definition of $A_p = \mathbf{L}^{\bowtie\, E \times E}$, the relation $\alpha \leq_k \beta \iff \forall (s', o') \in E \times E.\; \alpha(s', o') \leq_k \beta(s', o')$ in $\mathbf{L}^\bowtie$. Instantiate at $(s', o') = (s, o)$ to extract $v_\sigma(p)(s, o) \leq_k v_\tau(p)(s, o)$, which is $T_{\phi, v}(\sigma) \leq_k T_{\phi, v}(\tau)$. $\square$

**Corollary.** $T_{\phi, v}$ is a $\leq_k$-monotone chain in $\mathbf{L}^\bowtie$ — an element of the chain space $\mathrm{Chain}_{\leq_k}(\lambda, \mathbf{L}^\bowtie) := \{f : \lambda \to \mathbf{L}^\bowtie \;|\; \sigma \leq \tau \Rightarrow f(\sigma) \leq_k f(\tau)\}$.

### T2. Naturality under predicate-category reindexing

For every morphism $f : q \to p$ in $\mathcal{C}$ in any of the four generator classes — specialization, converse, subject-projection, object-projection — with reindexing functor $f^* : A_p \to A_q$ acting cellwise (axiom A2 of the [predication-fibration](../../../../../predication-fibration/predication-fibration.md)), the trace at the $f$-image cell along the $f$-reindexed settling factors through $f^*$:

$$T_{f.\phi,\, f^* v}(\tau) \;=\; f^*\bigl(T_{\phi, v}(\tau)\bigr)$$

for every $\tau < \lambda$, where $(f^* v)_\tau(q) := f^*(v_\tau(p))$ and $f.\phi$ denotes the cell after the morphism's effect on the cell-position (specialization preserves $\phi$; converse swaps the first and third coordinates; subject-projection collapses to $(s, s)$; object-projection collapses to $(o, o)$).

**Proof.** A2 says $f^*$ acts on a fiber element $\alpha \in A_p$ by cellwise reindexing — a permutation, restriction, or projection of the entity-pair index that yields an element of $A_q$. Cellwise reindexing commutes with pointwise evaluation at any fixed entity-pair: for $\alpha \in A_p$ and the appropriate $(s', o') \in E \times E$, $(f^* \alpha)(s', o') = f^*(\alpha(\rho_f(s', o')))$ where $\rho_f$ is the index-permutation induced by $f$, and in the cases of specialization (where $\rho_f$ is the identity), converse (swap), or the projections (where $\rho_f$ collapses), the right-hand side is exactly $f^*$ applied to the original pointwise value. Therefore $T_{f.\phi,\, f^* v}(\tau) = (f^* v)_\tau(q)(s', o') = (f^* v_\tau(p))(s', o') = f^*(v_\tau(p)(s, o)) = f^*(T_{\phi, v}(\tau))$. $\square$

T2 licenses lifting the four generator classes of the predicate category onto traces. Every theorem about settlings that depends on naturality of reindexing has a corresponding theorem on traces.

### T3. Joint slicing is injective; single-cell slicing is not

Define the **joint slicing function**

$$\mathrm{Sl} \;:\; \mathrm{Settling}(\mathbf{L}, \mathcal{C}, E, \lambda) \longrightarrow \mathrm{Chain}_{\leq_k}(\lambda, \mathbf{L}^\bowtie)^\Phi, \qquad \mathrm{Sl}(v) \;:=\; (T_{\phi, v})_{\phi \in \Phi}$$

and the **single-cell slicing function** $\mathrm{Sl}_\phi(v) := T_{\phi, v}$. Then $\mathrm{Sl}$ is injective; $\mathrm{Sl}_\phi$ is not.

**Proof.** $\mathrm{Sl}$ is injective because its image determines $v_\tau(p)(s, o)$ for every $(s, p, o) \in \Phi$ and every $\tau < \lambda$; the data $\{v_\tau(p)(s, o)\}_{(s, o) \in E \times E}$ determines $v_\tau(p) \in A_p$ as a function on entity-pairs, and the data $\{v_\tau(p)\}_{p \in \Pi}$ determines $v_\tau$ as a valuation. $\mathrm{Sl}_\phi$ fails to be injective: take $v$, fix a pair $(s', o') \neq (s, o)$ in $E \times E$, modify $v$ to $v'$ by changing $v_\tau(p)(s', o')$ to a different element while preserving settling monotonicity; then $v \neq v'$ but $T_{\phi, v} = T_{\phi, v'}$. $\square$

A settling is faithfully represented as its family of cell-traces, indexed by $\Phi$. No single cell-trace captures the whole settling; the whole settling is captured by all $|\Phi| = m n^2$ traces jointly.

### T4. Distinct from cell-record by signature arity

The structure [cell-record](../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/cell-record.md) has signature $\langle \phi, w, t \rangle$ — a single triple. A predication-cell-trace has signature $\lambda \to \mathbf{L}^\bowtie$ — a function over an ordinal. The endpoint projection $T \mapsto (\lambda - 1, T(\lambda - 1))$ (for $\lambda$ a successor) presents the trace's terminal-ordinal value, which a cell-record can package as $\langle \phi, T(\lambda - 1), t_{\lambda - 1} \rangle$ once a transaction-id is chosen. The reverse direction — recovering the trace from a single cell-record — discards the chain. The two structures are not in bijection. $\square$

### T5. Finite presentation by cell-trace

For every predication-cell-trace $T : \lambda \to \mathbf{L}^\bowtie$ at $\phi$, restricted to a finite ordinal $n \subseteq \lambda$, there is a [cell-trace](../../cell-record/library/cell-trace/cell-trace.md) $\tilde T = \langle r_0, \ldots, r_{n-1} \rangle$ with $r_i.\mathrm{cell} = \phi$, $r_i.\mathrm{value} = T(\tau_i)$ for some monotone sequence of ordinals $\tau_0 < \cdots < \tau_{n-1}$, and $r_i.t$ chosen monotone in ISO-8601 lexicographic order. The forgetful map $U : \mathrm{CellTrace}_\phi \to \mathrm{PredicationCellTrace}_\phi$ (restricted to finite chains) is surjective. $\square$

The cell-trace finitely presents the predication-cell-trace under the choice of an order-embedding $n \hookrightarrow \lambda$.

### T6. Datomic EAVT degeneracy

Specialize the apparatus to $\mathbf{L} = \mathbf{2}$ (the two-element residuated lattice $\{\top, \bot\}$ with meet, join, and $\Rightarrow$ as Boolean), $\lambda = 1$ (one-step settling — no closure iteration), and $\mathcal{C}$ generated only by identity morphisms (no specialization, converse, or projection — every predicate is its own thing). Then:

(a) $\mathbf{L}^\bowtie = \{\langle \top, \bot \rangle, \langle \top, \top \rangle, \langle \bot, \bot \rangle, \langle \bot, \top \rangle\} \cong \mathbf{FOUR}$ — Belnap's four-valued bilattice.
(b) A predication-cell-trace $T : 1 \to \mathbf{FOUR}$ is a single FOUR-value.
(c) A cell-trace at $\phi$ has length $\leq 1$.
(d) The cell-record $\langle \phi, w, t \rangle$ unrolls bijectively to a Datomic-style EAVT row $\langle E, A, V, T \rangle$ under $S \to E$, $P \to A$, $O \to V$, $t \to T$.

**Proof.** Each clause is immediate from the specialization. Clause (a) is the standard FOUR-from-$\mathbf{2}^\bowtie$ identification. Clauses (b)–(d) follow because $\lambda = 1$ collapses every chain to its single point and every settling to its asserted starting valuation. $\square$

T6 is the layer-2 stake. Datomic's EAVT is the bivalent, one-step degenerate case of the (subject, predicate, object, trace) quadruple SPOT, where in the non-degenerate case T is the cell-trace and $\mathbf{L}^\bowtie$ has the full bilattice structure.

## Why this is a distinct structure from predication-settling

A predication-settling is the full family $(v_\tau)_{\tau < \lambda}$ across all predicates and all entity-pairs. A predication-cell-trace is the slice at one cell. T3 shows the slice is *lossy* — it does not determine the settling. Conversely, the settling is the *joint* of all slices: the data of a settling equals the data of $(\mathrm{Sl}_\phi(v))_{\phi \in \Phi}$. Predication-cell-trace is the projection of predication-settling onto a single Φ-coordinate; predication-settling is the entire indexed family.

The structures are not in bijection. They sit in adjacent slots of the predication apparatus, related by the slicing functor.

## What "trace" means here

"Trace" here is the per-cell trajectory of values under the settling's closure-driven motion. It is *not*:

- a categorical trace operator in a traced monoidal category (that is a different categorical primitive named with the same English word; see Joyal-Street-Verity 1996 for that notion);
- a Datomic-style transaction-id alone (the trace contains an ordinal sequence of values, of which the transaction-id of the endpoint is one summary);
- a debug-style "execution trace" of which rule fired when (that is the layer-5 [cell-trace](../../cell-record/library/cell-trace/cell-trace.md)'s provenance data, which presents the trace but is not the trace itself).

The word is overloaded; this record commits to the per-cell settling-slice reading.

## Where this record progresses

- **Open derivations** are at [the questioning record](learning/questioning/what-is-predication-cell-trace.md). Each resolved derivation moves to its own `learning/answering/` file.
- **Layer-5 realization** is at [cell-trace](../../cell-record/library/cell-trace/cell-trace.md) — the finite-presentation form on disk.
- **Parent slicing operation** is at [predication-settling](../../../../../predication-settling-category/library/predication-settling/predication-settling.md) — the source of the slice.
- **Related not-yet-written $thing:** `closure-2-monad`, the categorical engine driving the slicing's dynamic content. Multiple records frontmatter-relate to it by slug; the directory does not yet exist.
