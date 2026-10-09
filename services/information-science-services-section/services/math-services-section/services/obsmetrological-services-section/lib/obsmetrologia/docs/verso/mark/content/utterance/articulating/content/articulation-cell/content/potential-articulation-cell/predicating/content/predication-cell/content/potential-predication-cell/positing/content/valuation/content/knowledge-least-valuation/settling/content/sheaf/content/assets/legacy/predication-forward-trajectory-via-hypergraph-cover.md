---
type: theorem
status: proved
depends-on: [cosettling, closure-2-monad, closure-operator]
---

# Forward trajectory inside the cosettling — closure-cover hypergraph path

Alternative proof of [forward trajectory inside the cosettling](backward-closure-recovers-forward-trajectory.md) via the closure-cover hypergraph framework. Where the original proof characterizes pre-images by an ad-hoc local condition, this path identifies the pre-image set with the closure-covers of an explicit hypergraph constructed from the rule system.

## The closure-cover hypergraph

For a strict-regime closure operator $T$ with rule set $R$ on a finite cell space and a closure-stable target $w$, define the **closure-cover hypergraph** $H_w$:

- Vertices $V(H_w) := w$ (the cells of the target).
- Hyperedges $E(H_w) := \{(c, A) : c \in w, A = \mathrm{antec}(r) \text{ for some } r \in R \text{ with } c \in \mathrm{conseq}(r)\}$.

A hyperedge $(c, A)$ encodes "rule $r$ produces $c$ from antecedent set $A$." Each cell $c \in w$ has at least one incoming hyperedge unless $c \in \mathrm{seed}$ (cells with no producing rule).

A subset $v \subseteq V(H_w)$ is a **closure-cover** of $H_w$ iff:

1. $\mathrm{seed} \subseteq v$, and
2. for every $c \in V(H_w) \setminus v$, some hyperedge $(c, A)$ has $A \subseteq v$.

## Statement

**Theorem.** *In the strict regime, $T^{-1}(w)$ equals the set of closure-covers of $H_w$:*

$$T^{-1}(w) \;=\; \{v \subseteq w : v \text{ is a closure-cover of } H_w\}.$$

*The trajectory $\{v_0, v_1, \ldots, v_\kappa\}$ is contained in $\bigcup_k (T^{-1})^k(w)$, and the inclusion is generally strict — closure-covers off the trajectory exist whenever $H_w$ has more than one minimal vertex cover modulo the seed.*

## Proof

**Pre-image $\Rightarrow$ closure-cover.** Let $v \in T^{-1}(w)$, so $T(v) = w$.

- *Seed condition.* Cells of $\mathrm{seed}$ have no producing rule, so they cannot be added by $T$. If $s \in \mathrm{seed} \setminus v$, then $s \notin T(v) = w$, contradicting $s \in w$. Hence $\mathrm{seed} \subseteq v$.

- *Cover condition.* For $c \in w \setminus v$, $c$ must be added by $T$ in one step, so some rule $r \in R$ with $c \in \mathrm{conseq}(r)$ fires at $v$. Firing means $\mathrm{antec}(r) \subseteq v$. So the hyperedge $(c, \mathrm{antec}(r))$ has its antecedent set contained in $v$, satisfying the cover condition.

**Closure-cover $\Rightarrow$ pre-image.** Let $v$ be a closure-cover of $H_w$.

- $v \subseteq w$ by the vertex-set definition $V(H_w) = w$.
- $T(v) \supseteq v$ by inflation. For $c \in w \setminus v$: cover condition gives a hyperedge $(c, A)$ with $A \subseteq v$, hence rule firing producing $c$, hence $c \in T(v)$. So $T(v) \supseteq w$.
- $T(v) \subseteq w$: by closure-stability of $w$ and antecedent-monotonicity of rules, every rule firing at $v \subseteq w$ also fires at $w$, with output in $T(w) = w$. So $T(v) \subseteq w$.

Combining: $T(v) = w$, so $v \in T^{-1}(w)$. $\square$

## The forward trajectory as a chain of closure-covers

The forward trajectory $v_\tau \subseteq v_{\tau+1}$ gives an ascending chain of closure-covers of $H_w$:

- $v_0 = \mathrm{seed}$ is a closure-cover iff every cell of $w \setminus \mathrm{seed}$ has an incoming hyperedge with antecedents in $\mathrm{seed}$. This holds when one closure step suffices to reach $w$ — i.e., $\kappa = 1$. For $\kappa \geq 2$, $v_0$ is not a single-step pre-image.
- $v_{\kappa-1}$ is always a closure-cover: the cells of $w \setminus v_{\kappa-1}$ are exactly those added at the last firing, with antecedents in $v_{\kappa-1}$ by definition of the trajectory.
- $v_\kappa = w$ is trivially a closure-cover (every cell is in $v$).

The intermediate $v_\tau$ for $0 < \tau < \kappa-1$ are not closure-covers: cells added at later firings $\sigma > \tau$ require antecedents that may not be in $v_\tau$.

## When the inclusion is strict

The closure-cover set $T^{-1}(w) \supseteq \{v_{\kappa-1}, v_\kappa\}$ generically contains additional elements. From the [iterated cosettling counts derivable cells](../../../../cosettling/content/assets/legacy/iterated-cosettling-counts-derivable-cells.md) data:

- *parallel-firing-2*: $|T^{-1}| = 4$, vs. $|\{v_0, v_1\}| = 2$. Off-trajectory closure-covers: $\{a, b\}, \{a, c\}$.
- *parallel-firing-3*: $|T^{-1}| = 8$, vs. $|\{v_0, v_1\}| = 2$. Six off-trajectory closure-covers.
- *diamond*: $|T^{-1}| = 7$, vs. $|\{v_1, v_2\}| = 2$. Five off-trajectory closure-covers.

Off-trajectory closure-covers correspond to vertex-cover-style choices in $H_w$ that are valid one-step pre-images but don't appear as forward iterations from the canonical seed.

## What this proof gives that the original doesn't

The original [pre-image characterization](backward-closure-recovers-forward-trajectory.md) gives a local condition for membership in $T^{-1}(w)$ but no combinatorial framework for *counting* or *classifying* pre-images.

The closure-cover formulation:
- **Identifies $T^{-1}(w)$ as a known combinatorial object** — vertex covers of a hypergraph (with the directional twist of "antecedent-cover" rather than "edge-cover"). Connects to the broader literature on hypergraph covers.
- **Makes the count combinatorial.** $|T^{-1}(w)|$ = number of closure-covers of $H_w$, computable directly from $H_w$'s structure rather than by enumerating subsets of $w$.
- **Suggests classifications** by hypergraph type (tree-shaped, diamond, conjunctive bottleneck, etc.) — see [closure-cover hypergraph classification question](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/learning-articles/questions/closure-cover-hypergraph-classification.md).
