---
type: definition
class: morphism
symbol: "T_t"
depends-on: [closure-2-monad, predication-settling, four-regime-dichotomy]
---

# Truth-order closure operator

The corpus's standard closure operator $T_k$ is monotone in the **knowledge order** $\leq_k$: it produces sequences $v_0 \leq_k v_1 \leq_k \cdots$ where each step adds *information* (cells move from $\bot$ toward $\mathbf{t}, \mathbf{f}$, or $\top$). The **truth-order closure operator** $T_t$ is the parallel construction monotone in the **truth order** $\leq_t$: it produces sequences $v_0 \leq_t v_1 \leq_t \cdots$ where each step adds *truthfulness* (cells move from $\mathbf{f}$ toward $\bot$ or $\top$ to $\mathbf{t}$).

Both operators are well-defined; both produce settlings; predication categories' structural theorems (regime dichotomy, cohomology, KZ-lax-idempotence) apply to both. The relationship between them is governed by the [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md).

## The two orders on FOUR

Recall:
- $\leq_k$ (knowledge): $\bot \leq_k \mathbf{t}, \mathbf{f} \leq_k \top$. Bottom is "no information," top is "contradictory information."
- $\leq_t$ (truth): $\mathbf{f} \leq_t \bot, \top \leq_t \mathbf{t}$. Bottom is "false," top is "true." (Both $\bot$ and $\top$ are ambiguous between true and false.)

The two orders share the same 4-element set but order it orthogonally — both are bounded lattices with $|\mathrm{FOUR}| = 4$ elements.

## Definition

A **truth-order closure operator** on a [predication settling](../objects/predication-settling.md) $v : \mathcal{C}^\mathrm{op} \to \mathbf{L}^{E \times E}$ is an endofunctor

$$T_t : v \mapsto T_t(v)$$

satisfying:

1. **$\leq_t$-inflation**: $v(p)(s, o) \leq_t T_t(v)(p)(s, o)$ for every cell.
2. **$\leq_t$-monotonicity**: if $v \leq_t v'$ pointwise, then $T_t(v) \leq_t T_t(v')$.
3. **Lax-idempotence**: there exist KZ-2-cells $\delta : T_t \cdot T_t \Rightarrow T_t$ realizing the lax-idempotent KZ structure ([closure 2-monad](../morphisms/closure-2-monad.md)).

The **truth-order settling** $v_\kappa^t$ is the closure-stable fixed point under $T_t$ at the closure ordinal $\kappa^t$.

## Interpretation

$T_t$ models *change in truth-state*, distinct from $T_k$ which models *change in knowledge-state*. Concrete examples:

- **Door-opening**: a proposition like "the door is open" starts at $\mathbf{f}$ (false), moves through $\bot$ (uncertain — door is opening) or $\top$ (paraconsistent — partially open and closed simultaneously), and reaches $\mathbf{t}$ (true). Each step is $\leq_t$-monotone.
- **Healing**: "the wound is closed" starts at $\mathbf{f}$, moves through $\top$ (closed-and-open via partial healing) or $\bot$ (uncertain about complete closure), reaches $\mathbf{t}$. $\leq_t$-monotone.
- **Construction**: "the building exists" starts at $\mathbf{f}$, moves through $\bot$ (under construction, uncertain whether it counts), reaches $\mathbf{t}$. $\leq_t$-monotone.

These are dynamics where *the world is changing*, not just *our knowledge of the world*. $T_t$ is the natural closure operator for such dynamics.

## The order-swap involution

There exists an involution $\sigma : \mathrm{FOUR} \to \mathrm{FOUR}$ that **swaps the two orders**:

$$\sigma : \bot \leftrightarrow \mathbf{f}, \quad \mathbf{t} \leftrightarrow \top.$$

Equivalently: $\sigma = \bot \mapsto \mathbf{f}, \mathbf{t} \mapsto \bot, \mathbf{f} \mapsto \top, \top \mapsto \mathbf{t}$.

(Check: $\bot \leq_k \mathbf{t}$ becomes $\mathbf{f} \leq_t \bot$ ✓. $\mathbf{f} \leq_k \top$ becomes $\top \leq_t \mathbf{t}$ ✓. The full $\leq_k$ Hasse diagram maps to the full $\leq_t$ Hasse diagram bijectively.)

This is *not* a Klein-four-group element (it doesn't preserve either lattice structure individually). It's an involution of the underlying set that *exchanges* the two lattice structures.

Under $\sigma$:
- $T_k$-closure theory becomes $T_t$-closure theory (with all values $\sigma$-conjugated).
- $T_k$-settlings $\leftrightarrow$ $T_t$-settlings via cell-by-cell application of $\sigma$.

## Closure 2-monad structure

$T_t$ is a $\leq_t$-enriched closure 2-monad on the predication-presheaves category. The KZ-lax-idempotence diamond, the Eilenberg-Moore algebras, and the [closure-2-monad](../morphisms/closure-2-monad.md) infrastructure transfer directly under the order-swap involution.

Concretely: every theorem of the form "$T_k$ has property $P$" has a parallel theorem "$T_t$ has property $\sigma P$" where $\sigma P$ is the $\sigma$-conjugate of $P$. The corpus's full structural theory is bi-fold: each theorem has a $T_k$-version and a $T_t$-version.

## Closure ordinal and four regimes

Define the **truth-order closure ordinal** $\kappa^t := \min \{\tau : T_t^\tau(v_0) = T_t^{\tau+1}(v_0)\}$.

The four-regime dichotomy applies: $\kappa^t < \omega$ (strict), $\kappa^t = \omega$ (Scott-continuous), $\omega < \kappa^t < \omega_1$ (TB), $\omega_1 \leq \kappa^t$ (aperiodic). All structural theorems carry over via $\sigma$-conjugation.

A given initial settling $v_0$ has *both* $\kappa^k$ (knowledge-order ordinal) and $\kappa^t$ (truth-order ordinal). These can differ — a cell may stabilize quickly in knowledge but slowly in truth, or vice versa.

## Connection to existing structure

- *Long exact sequence*: predication categories' [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) connects $H^n_t$ and $H^n_k$ for the *same* settling via different sheaf-designations. The truth-order closure object adds a *parallel theory* of $T_t$-settlings with their own cohomology, enriching the existing comparison.
- *Klein-four group*: the bilattice's Klein-four group (negation, conflation, double, identity) acts on $\leq_k$ and $\leq_t$ separately. The order-swap $\sigma$ extends the group: $\langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$ is an 8-element group acting on FOUR. Its orbit structure on $T_t / T_k$ pairs is open.
- *Conflation*: conflation (swap $\bot \leftrightarrow \top$) acts on $\leq_k$ via reversal but is identity on $\leq_t$. So conflation is the $\leq_k$-dual within the bilattice. $\sigma$ is the *cross-order dual*, not within either order.

## Position in predication categories

First object explicitly defining the truth-order analog of knowledge-order closure. Sets up the bilattice two-orders duality theorem.

Pairs with:
- The [bilattice two-orders duality theorem](../theorems/bilattice-two-orders-duality.md) — formal isomorphism via $\sigma$-conjugation.
- The [truth-knowledge cohomology long exact sequence](../theorems/truth-knowledge-cohomology-long-exact-sequence.md) — existing comparison at the cohomology level.
- The [Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md) — empirical Klein-four work that may extend to the 8-element group $\langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle$.

Open downstream:
- *Mixed-order closure*: a closure operator that's $\leq_k$-monotone on some cells and $\leq_t$-monotone on others. Models hybrid knowledge-evolution + truth-evolution dynamics.
- *Joint $T_k \otimes T_t$ closure*: closure that simultaneously increases knowledge and truth. The natural composition is order-mixing and may not be lax-idempotent. Open whether this gives a meaningful closure 2-monad.
- *$\sigma$ as a temporal axis*: the order-swap involution might correspond to a *time-reversal* operation in some interpretations. Speculative — connect to predication categories' ongoing-vs-recovering settling distinction.
