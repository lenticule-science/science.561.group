---
type: example
depends-on: [predication-settling, closure-operator, scott-continuous-closure, four-regime-dichotomy, transfinite-settling-convergence, knowledge-order, settling-bound]
instantiates: [scott-continuous-closure, transfinite-settling-convergence]
lineage: 3
---

# Natural-number successor settling

The entry point of **Lineage 3** — the Scott-continuous-regime, $\mathbb{N}$-indexed example chain. Establishes the vocabulary the rest of the lineage carries: $\mathbf{L} = \mathbf{2}$, $E = \mathbb{N}$, single binary predicate $P$, finitary closure rule "$P(n, n) \Rightarrow P(n+1, n+1)$" (the L3 successor rule), $\lambda = \omega + 1$.

**Data.** $\mathbf{L} = \mathbf{2}$, [entity set](../objects/entity-set.md) $E = \mathbb{N}$, [predicate set](../objects/predicate-set.md) $\Pi = \{P\}$, [settling bound](../objects/settling-bound.md) $\lambda = \omega + 1$.

**Closure rule (finitary).** $P(n, n) \Rightarrow P(n+1, n+1)$. — **the L3 successor rule.**

**Initial state.** $v_0(P)(0, 0) = \mathbf{t}$, else $\bot$.

**Settling.**
- $\tau = n < \omega$: $v_n(P)(k, k) = \mathbf{t}$ for $0 \leq k \leq n$.
- $\tau = \omega$: $v_\omega(P)(k, k) = \mathbf{t}$ for all $k \in \mathbb{N}$, by [settling continuity](teaching/explanations/settling-continuity.md) and the $\leq_k$-join.
- $\tau = \omega + 1$: no further closure fires.

**Closure ordinal.** $\kappa = \omega$. **[Scott-continuous regime](../theorems/four-regime-dichotomy.md).** [Transfinite settling convergence](../theorems/transfinite-settling-convergence.md) applies: the closure is [Scott-continuous](teaching/explanations/scott-continuous-closure.md), so the orbit stabilizes exactly at the $\omega$-limit.

**2-categorical structure.** Each $v_n \to v_{n+1}$ is a strict $\leq_k$-increase — genuine 1-cells in the settling. At $\omega$ the colimit converges strictly; the [temporal 2-category](../objects/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to a 1-category beyond $\omega$.

**Priestley dual.** A paired Priestley space over $\mathbb{N} \times \mathbb{N}$; the [dual settling](../objects/dual-predication-hyperdoctrine.md) is a Scott-cocontinuous descending chain of Priestley spectra, converging dually at $\omega$.

**Role.** Spatial infinity without temporal infinity. Typical of standard knowledge-representation systems — description-logic TBoxes, logic-programming fixed points — where rules are finitary but the entity space is countable.

## Position in Lineage 3

L3 builds out the Scott-continuous regime via this $\mathbb{N}$-indexed setting. Members of L3 in order:

- (this file) — entry; the L3 successor settling.
- [scott-continuous-natural-number-moduli](scott-continuous-natural-number-moduli.md) — moduli stack on the L3 base.
- [scott-continuous-h1-vanishing-on-naturals](scott-continuous-h1-vanishing-on-naturals.md) (forthcoming) — explicit $H^1 = 0$ verification.
- [scott-continuous-d-frame-cohomology-on-naturals](scott-continuous-d-frame-cohomology-on-naturals.md) (forthcoming) — d-frame $H^0$ in the Scott-continuous regime.
- [lawvere-laplacian-on-natural-number-settling](lawvere-laplacian-on-natural-number-settling.md) (forthcoming) — Lawvere Laplacian computation.

L3's role: provide the *countable-but-tame* benchmark. Where L1 and L2 collapse predication categories' q-fuzzy / continuous machinery to discrete cases, L3 has countably many cells but with Scott-continuous closure that's still computationally tractable. The Lawvere Laplacian and directed-colimit cohomology have their first substantive instances here.

