---
kind: theorem
status: proved
depends-on: [four-regime-dichotomy, mutually-locally-derivable, non-scott-continuous-firing-ordinal, knowledge-order, settling-cohomology, transfinite-bounded-regime-h1-generators]
---

# Regime stratification is not $\leq_k$-semicontinuous

There exist three settlings $v_B, v_C, v_{\mathrm{pre}}$ over a common base satisfying $v_B \leq_k v_C \leq_k v_{\mathrm{pre}}$ pointwise at every settling stage, representing three distinct [MLD-classes](../concepts/mutually-locally-derivable.md), with $\dim H^1(\mathcal{F}_U)$ values $0, 1, 0$ along the chain (and closure-ordinal values $\omega, \omega + 1, \omega$).
Consequently, *no* partial order on MLD-classes extending the $\leq_k$ relation admits $\kappa$ or $\dim H^1$ as a semicontinuous function in either direction.

## Proof

### The three settlings

Fix base $B = (\mathbf{2}, \{P\}, \omega + 1, \omega + 2)$ — single predicate, $E = \omega + 1$, $\lambda = \omega + 2$.
The variable subscripts $v_B$, $v_C$, $v_{\mathrm{pre}}$ are mnemonic for "the settling that ends up in the *Scott-continuous* (B) / *transfinite-bounded* (C) regime stratum, plus a *pre*-asserted variant" — the proof exhibits explicit settlings landing in each stratum.

- **$v_B$.** Closure rule: $P(n, n) \Rightarrow P(n+1, n+1)$ for $n \in \mathbb{N}$.
  Initial state $v_{B, 0}(P)(0, 0) = \mathbf{t}$, else $\bot$.
- **$v_C$.** Same initial state.
  Closure rules: $v_B$'s rule plus the infinitary rule $(\forall n \in \mathbb{N}.\, P(n, n) = \mathbf{t}) \Rightarrow P(\omega, \omega) \geq_k \mathbf{t}$.
- **$v_{\mathrm{pre}}$.** Same closure rules as $v_C$.
  Initial state $v_{\mathrm{pre}, 0}(P)(0, 0) = v_{\mathrm{pre}, 0}(P)(\omega, \omega) = \mathbf{t}$, else $\bot$.

### Settling analysis

Direct computation:

| | $\kappa$ | Regime | $L_{\mathrm{ns}}$ | $\dim H^1$ |
|---|---|---|---|---|
| $v_B$ | $\omega$ | B | $\emptyset$ | $0$ |
| $v_C$ | $\omega + 1$ | C | $\{\omega\}$ | $1$ |
| $v_{\mathrm{pre}}$ | $\omega$ | B | $\emptyset$ | $0$ |

The $\dim H^1$-values follow from [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md): one generator per [non-Scott-continuous firing ordinal](../content/settling-continuity/content/non-scott-continuous-firing-ordinal/non-scott-continuous-firing-ordinal.md). $v_B$ has no infinitary rule, hence empty $L_{\mathrm{ns}}$. $v_C$ has the infinitary rule firing at $\omega$, giving $L_{\mathrm{ns}} = \{\omega\}$. $v_{\mathrm{pre}}$ has the rule but its consequent at $(\omega, \omega)$ is *pre-asserted* in the initial state, so the firing produces no new content and is not non-Scott-continuous.

### Pointwise comparison

$v_B \leq_k v_C \leq_k v_{\mathrm{pre}}$ as settlings: at every stage $\tau$ and every cell $(s, o)$, the values are $\leq_k$-monotone along the chain.
Strict at $(\omega, \omega, \tau = \omega + 1)$ between $v_B$ and $v_C$; strict at $(\omega, \omega, \tau \leq \omega)$ between $v_C$ and $v_{\mathrm{pre}}$.

### Distinct MLD-classes

At stage $\tau = 0$ the three initial states have 1, 1, 2 $\mathbf{t}$-cells respectively.
Under the naturality hypothesis, every invertible bilattice homomorphism between fiber algebras acts cellwise as $\phi(x)(s, o) = x(g(s, o))$ for a bijection $g$.
A hypothetical MLD-morphism $v_C \to v_{\mathrm{pre}}$ with shift $\delta$ would need $g$ to pull back $v_{\mathrm{pre}, \delta}$'s 2-cell support to $v_{C, 0}$'s 1-cell support — impossible since bijections preserve cardinality.
Symmetric argument rules out $v_{\mathrm{pre}} \to v_C$.
For $v_B$: its eventual support omits $(\omega, \omega)$, while both $v_C$ and $v_{\mathrm{pre}}$ include it eventually — so eventual-support cardinality distinguishes $[v_B]$ from the others.

### Semicontinuity refutation

Suppose a partial order $\preceq$ on MLD-classes extends $\leq_k$ in the sense $v \leq_k v' \Rightarrow [v] \preceq [v']$.
Then $[v_B] \preceq [v_C] \preceq [v_{\mathrm{pre}}]$.
If $\kappa$ were upper-semicontinuous in $\preceq$, its values would be non-decreasing along the chain; $\omega, \omega + 1, \omega$ is not non-decreasing.
Lower-semicontinuous: not non-increasing either.
Same for $\dim H^1$. $\square$

## The structural diagnosis

$\leq_k$-enhancement (adding information to a settling) interacts with closure rules in two competing ways:

- **Antecedent-satisfaction.** Adding cells can satisfy a rule's antecedent and *introduce* a new non-Scott-continuous firing — the $v_B \to v_C$ direction.
- **Consequent-preemption.** Adding cells can independently assert a rule's consequent and *pre-empt* a non-Scott-continuous firing — the $v_C \to v_{\mathrm{pre}}$ direction.

Neither behaviour dominates universally, so no ordering on MLD-classes derived from $\leq_k$ can make $\kappa$ or $\dim H^1$ semicontinuous.
The regime stratification of the moduli is therefore set-theoretic and combinatorial, not Zariski-style locally closed.
