---
kind: theorem
status: proved
depends-on: [truth-order-closure, four-regime-dichotomy, closure-2-monad, klein-four-symmetry]
---

# Bilattice two-orders duality

The corpus's $\leq_k$-closure theory (knowledge-order, the standard development) and $\leq_t$-closure theory (truth-order, defined via [truth-order-closure](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/truth-order-closure/truth-order-closure.md)) are **structurally isomorphic** via $\sigma$-conjugation, where $\sigma$ is the order-swap involution on FOUR.

## Statement

**Theorem (bilattice two-orders duality).** *Let $\sigma : \mathrm{FOUR} \to \mathrm{FOUR}$ be the order-swap involution $\sigma : \bot \leftrightarrow \mathbf{f}, \mathbf{t} \leftrightarrow \top$. Then:*

1. *(Cellwise lift) The cellwise application $\sigma_* : v \mapsto \sigma \circ v$ extends to an involutive auto-equivalence of the predication-presheaves category.*

2. *(Order-intertwining) For any closure operator $T_k$ that's $\leq_k$-monotone-and-inflationary, the conjugate $\sigma_* T_k \sigma_*^{-1}$ is $\leq_t$-monotone-and-inflationary — i.e., a truth-order closure operator $T_t$.*

3. *(Settling correspondence) Every $T_k$-settling $v_\kappa^{(k)}$ corresponds to a $T_t$-settling $\sigma_*(v_\kappa^{(k)})$ under the conjugate $T_t = \sigma_* T_k \sigma_*^{-1}$, with the same closure ordinal $\kappa$ and the same firing-pattern combinatorics.*

4. *(Cohomology identification) The settling cohomologies match: $H^n(\mathcal{F}_{v_\kappa^{(k)}}) \cong H^n(\mathcal{F}_{\sigma_*(v_\kappa^{(k)})})$ as $\mathbb{Z}$-modules.*

## Proof

### Step 1: $\sigma$ swaps the two orders

Recall $\sigma : \bot \mapsto \mathbf{f}, \mathbf{t} \mapsto \bot, \mathbf{f} \mapsto \top, \top \mapsto \mathbf{t}$. Verify on the four covering relations of $\leq_k$:

- $\bot \leq_k \mathbf{t}$: under $\sigma$, becomes $\mathbf{f} \leq_? \bot$. In $\leq_t$: $\mathbf{f} <_t \bot$ ✓.
- $\bot \leq_k \mathbf{f}$: becomes $\mathbf{f} \leq_? \top$. In $\leq_t$: $\mathbf{f} <_t \top$ ✓.
- $\mathbf{t} \leq_k \top$: becomes $\bot \leq_? \mathbf{t}$. In $\leq_t$: $\bot <_t \mathbf{t}$ ✓.
- $\mathbf{f} \leq_k \top$: becomes $\top \leq_? \mathbf{t}$. In $\leq_t$: $\top <_t \mathbf{t}$ ✓.

So $\sigma$ takes $\leq_k$-covers to $\leq_t$-covers. The induced map on partial orders is $\sigma : (\mathrm{FOUR}, \leq_k) \to (\mathrm{FOUR}, \leq_t)$, an isomorphism of posets.

By the same calculation reversed, $\sigma$ takes $\leq_t$-covers to $\leq_k$-covers, so $\sigma : (\mathrm{FOUR}, \leq_t) \to (\mathrm{FOUR}, \leq_k)$ is also an isomorphism. $\sigma^2 = \mathrm{id}$ confirms involutivity. $\square$ (Step 1)

### Step 2: $\sigma_*$ as auto-equivalence

Define $\sigma_* : v \mapsto \sigma \circ v$ pointwise: $\sigma_*(v)(p)(s, o) := \sigma(v(p)(s, o))$. This is a strict 2-functor on predication-presheaves; involutive ($\sigma_*^2 = \mathrm{id}$), so an auto-equivalence. $\square$ (Step 2)

### Step 3: $\sigma$-conjugate of $T_k$ is a $T_t$

Define $T_t := \sigma_* \circ T_k \circ \sigma_*^{-1} = \sigma_* \circ T_k \circ \sigma_*$. Then:

- *$\leq_t$-inflation*: $T_t(v) = \sigma_* T_k \sigma_*(v)$. We need $v \leq_t T_t(v)$. Apply $\sigma_*$ to both sides; by Step 1 $\sigma_*$ takes $\leq_t$ to $\leq_k$: equivalently, $\sigma_*(v) \leq_k \sigma_* T_t(v) = T_k \sigma_*(v)$. This is the $\leq_k$-inflation of $T_k$, which holds. ✓

- *$\leq_t$-monotonicity*: $v \leq_t v'$ iff (via $\sigma$) $\sigma_*(v) \leq_k \sigma_*(v')$. By $T_k$-monotonicity, $T_k \sigma_*(v) \leq_k T_k \sigma_*(v')$, equivalently $\sigma_* T_t(v) \leq_k \sigma_* T_t(v')$, equivalently $T_t(v) \leq_t T_t(v')$. ✓

- *Lax-idempotence*: $T_t \circ T_t = \sigma_* T_k \sigma_* \sigma_* T_k \sigma_* = \sigma_* T_k T_k \sigma_*$. The $T_k$ KZ-2-cell $\delta_k : T_k T_k \Rightarrow T_k$ conjugates to a 2-cell $\delta_t := \sigma_* \delta_k \sigma_*^{-1} : T_t T_t \Rightarrow T_t$. Verify the lax-idempotence axioms by $\sigma$-conjugating the $T_k$ axioms — they all hold. ✓

So $T_t$ is a truth-order closure operator. $\square$ (Step 3)

### Step 4: settling correspondence

Iterating the conjugate intertwining $T_t \sigma_* = \sigma_* T_k$ gives $T_t^\tau \sigma_* = \sigma_* T_k^\tau$ for all ordinals $\tau$. Hence:

- $T_t^\tau(v) = T_t^{\tau+1}(v)$ iff $\sigma_*(T_k^\tau \sigma_*(v)) = \sigma_*(T_k^{\tau+1} \sigma_*(v))$ iff $T_k^\tau \sigma_*(v) = T_k^{\tau+1} \sigma_*(v)$.

So the closure ordinals match: $\kappa^t(v) = \kappa^k(\sigma_*(v))$. The firing pattern (which cells stabilize at which ordinal) maps under $\sigma_*$ as a relabeling — same combinatorial structure, $\sigma$-conjugated values. $\square$ (Step 4)

### Step 5: cohomology identification

The settling-associated sheaf $\mathcal{F}_v$ is built from the firing pattern; per Step 4, the firing pattern is preserved by $\sigma_*$. The induced map on sheaves $\mathcal{F}_v \to \mathcal{F}_{\sigma_*(v)}$ is an isomorphism (cellwise $\sigma$-relabeling). Cohomology of a sheaf is invariant under isomorphism, so $H^n(\mathcal{F}_v) \cong H^n(\mathcal{F}_{\sigma_*(v)})$ as $\mathbb{Z}$-modules. $\square$ (Step 5)

Combining Steps 1-5: every theorem about $T_k$ has a parallel theorem about $T_t = \sigma_* T_k \sigma_*$, with all structural data transferred via $\sigma_*$-conjugation. $\blacksquare$

## Consequences

### The "two-orders" structure of the corpus's theory

Every closure-2-monad-flavored theorem in the corpus has a *truth-order analog*. Specifically:

- *Four-regime dichotomy*: $T_t$ obeys the same regime classification (strict, SC, TB, aperiodic), with regimes assigned by $\kappa^t$.
- *Aperiodic-regime cohomology*: $H^1(T_t\text{-settling}) \cong \bigoplus_{L_{\mathrm{ns}}^t} \mathbb{Z}$, with NSC firings counted in the $\leq_t$ sense.
- *No-tunneling theorem*: $T_t$-settling paths preserve the $T_t$-classification invariant.
- *Klein-four orbit refinements*: the bilattice's Klein-four acts on $T_t$-settlings; the existing strong-MLD orbit theorems transfer.

### The 8-element extended symmetry group

The order-swap $\sigma$ together with the Klein-four group $K_4 = \langle \mathrm{neg}, \mathrm{conf} \rangle$ generates an 8-element group:

$$G_8 := \langle \mathrm{neg}, \mathrm{conf}, \sigma \rangle.$$

$\sigma$ doesn't commute with negation or conflation in general (it exchanges fixed-points), so $G_8$ is non-abelian. Its action on FOUR:

- $K_4$ orbits within each order: $\{\bot, \top\}$ and $\{\mathbf{t}, \mathbf{f}\}$ in $\leq_k$; same set, dual interpretation in $\leq_t$.
- $\sigma$ swaps $\{\bot, \mathbf{f}\}$ and $\{\mathbf{t}, \top\}$ — different orbit structure.

The $G_8$ orbit structure refines the $K_4$-orbit classification of settlings. Concretely, settlings whose firing pattern is $G_8$-invariant (vs. only $K_4$-invariant) form a smaller subclass with extra structure. Open: which corpus examples lie in this subclass.

### Pairing with the long exact sequence

The [truth-knowledge cohomology long exact sequence](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) connects $H^n_t$ and $H^n_k$ for the *same* $T_k$-settling via different sheaf-designations:

$$\cdots \to H^{n-1}(\mathcal{F}^{(\top)}) \to H^n_t(\mathcal{F}^{(t)}) \to H^n_k(\mathcal{F}^{(k)}) \to H^n(\mathcal{F}^{(\top)}) \to \cdots$$

This is *one settling, two designations*. By contrast, the bilattice two-orders duality says: there's *another settling* (the $T_t$-settling, $\sigma$-conjugate of the $T_k$-settling) whose cohomology equals the $T_k$-settling's cohomology by Step 5.

The two are complementary: the LES connects two designations on one settling; the duality theorem connects two settlings via $\sigma$-conjugation. Both statements hold simultaneously, decomposing the truth-order/knowledge-order interplay.

## Position in the program

Closes the bilattice two-orders structural picture: the corpus's theory is genuinely bi-fold, with $T_k$ and $T_t$ giving parallel theories related by $\sigma$-conjugation.

This is **Phase 3.1 complete**. The two-orders duality is established formally.

Pairs with:
- The [truth-order closure object](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/truth-order-closure/truth-order-closure.md) — the underlying setting.
- The [truth-knowledge cohomology long exact sequence](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) — complementary same-settling comparison.
- The [conflation-strong-MLD theorem](conflation-strong-mld.md) — Klein-four duality already established for conflation.

Open downstream:
- *$G_8$-orbit classification of substitution settlings*: extending the [Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md) to the $G_8$ orbit structure including $\sigma$.
- *Mixed $T_k$-$T_t$ dynamics*: settlings where some cells evolve via $T_k$ and others via $T_t$. The duality theorem doesn't directly apply; needs new infrastructure.
- *$\sigma$ as a time-reversal operator*: speculative interpretation of $\sigma$ as exchanging "knowing the past" and "knowing the future." Connects to the corpus's [cosettling](../../../../../../../../valuation/content/knowledge-least-valuation/settling/content/cosettling/cosettling.md) work.
