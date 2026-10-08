---
type: definition
class: presheaf
symbol: "v^{(n)}"
depends-on: [predication-settling, predicate-category, entity-set, closure-2-monad]
name: $n$-ary predication
description: Generalizes predication categories' binary predication-cells ($E \times E$) to $n$-ary cells ($E^n$) for $n \geq 1$.
---


Generalizes predication categories' [binary predication-cells](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/n-ary-predication/_archive/predication-settling.md) ($E \times E$) to **$n$-ary cells** ($E^n$) for $n \geq 1$. An $n$-ary predicate $p$ has values $v^{(n)}(p)(e_1, \ldots, e_n) \in \mathbf{L}$ — a bilattice-valued (or $\mathcal{V}$-valued) assignment of "how $p$ relates the $n$-tuple $(e_1, \ldots, e_n)$."

Special cases:
- $n = 0$: nullary predication — global facts (e.g., "is the world clean?"). Single-cell.
- $n = 1$: unary predication — properties (e.g., "is $e$ red?"). $|E|$-many cells.
- $n = 2$: binary predication (predication categories' standard) — relations.
- $n = 3$: ternary — triples (e.g., causal: $(\mathrm{cause}, \mathrm{effect}, \mathrm{mechanism})$).
- General $n$: $n$-tuples.

## Definition

Fix an entity set $E$ and an $n$-ary predicate category $\mathcal{C}^{(n)}$ — a category whose objects are predicates of arity $n$ and whose morphisms are predicate-refinement (or predicate-substitution) relations. An **$n$-ary predication settling** is a functor

$$v^{(n)} : (\mathcal{C}^{(n)})^{\mathrm{op}} \to \mathbf{L}^{E^n}$$

assigning to each $n$-ary predicate $p \in \mathcal{C}^{(n)}$ a function $v^{(n)}(p) : E^n \to \mathbf{L}$, with the standard naturality / monotonicity conditions of [predication-settling](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/n-ary-predication/_archive/predication-settling.md).

The **fiber algebra** $A_p^{(n)} := \mathbf{L}^{E^n}$ has size $|\mathbf{L}|^{|E|^n}$ — exponential in $n$ for fixed $E$.

## Closure operator (multiple arity-flavors)

For $n$-ary predications, the closure rule is no longer just "transitive composition" (which has a unique shape for $n = 2$: $R(s, z) \otimes R(z, o)$). At higher arity, multiple closure-shapes are natural:

### Composition closures

For ternary $R \subseteq E^3$, candidate compositions include:

- $R(s_1, s_2, z) \otimes R(z, s_3, ?) \to R(s_1, s_2, s_3)$ (chain on third coordinate).
- $R(s_1, z, s_3) \otimes R(z, s_2, ?) \to \cdots$ (chain on second coordinate).
- $R(s_1, s_2, s_3)$ via $R(s_1, *, *), R(*, s_2, *), R(*, *, s_3)$ joint.

In general, an $n$-ary closure step picks a **partition** $\mathcal{P}$ of the index set $\{1, \ldots, n\}$ and a *join-pattern* on the variables. For binary ($n = 2$), there's essentially one nontrivial pattern (transitive composition). For ternary and beyond, the pattern space is combinatorially richer.

### Projection-extension closures

A second flavor: project an $n$-ary predication to a $k$-ary one by quantifying out variables, then extend back.

- *Projection*: $\pi_k(R)(s_1, \ldots, s_k) := \bigvee_{e_{k+1}, \ldots, e_n} R(s_1, \ldots, s_n)$.
- *Extension*: $\iota_n(S)(s_1, \ldots, s_n) := S(s_1, \ldots, s_k)$ (constant in last $n - k$ coordinates).

A closure rule of the form $T_{\pi, \iota}(R) := R \vee \iota_n(\pi_k(R))$ adds the projection back at full arity.

### Datalog-style closures

For $n$-ary predications encoding logic-program rules: each rule is a closure operator that takes specific $n$-ary predications and produces new $n$-ary content. The settling is the *minimal model* of the rules (in the Tarskian / datalog fixed-point sense).

## Closure 2-monad on $n$-ary predications

The closure 2-monad structure transfers from binary to $n$-ary directly: $\mathrm{Cl}^{(n)}$ is the lax-idempotent 2-monad on the $n$-ary predication category, with $\eta$, $\mu$, and the lax-idempotence 2-cell $\delta$ all natural in the predicate variable.

Key fact: **the 2-monad's structure is independent of $n$.** What changes is the *fiber algebra size* and the *richness of closure operators* available. The four-regime dichotomy applies uniformly: $\kappa^{(n)}$ for the $n$-ary settling can be strict, Scott-continuous, transfinite-bounded, or aperiodic, with the same equivalences as the binary case.

## Cohomology and rank

For $n$-ary settlings on finite $E$ with bilattice values, the cohomology $H^1(\mathcal{F}_{v^{(n)}})$ is given by the [aperiodic-regime cohomology via direct limit theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md) — one $\mathbb{Z}$-generator per non-Scott-continuous firing.

The number of NSC firings can be much larger for higher arity (since there are more cells). Per the [higher-arity cohomological rank theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/higher-arity-cohomological-rank.md), the $H^1$ rank scales combinatorially with $n$ — explicitly, for an $n$-ary settling on a $k$-state space with maximum-firing closure dynamics, the rank is at most the number of cells $k^n$ minus the number of strict-firing cells.

## Connection to existing structure

The corpus's binary-predication infrastructure is the $n = 2$ case of this object. **All theorems applicable to binary predications generalize to $n$-ary, with appropriate index-set adjustments.**

Specifically:
- *Closure 2-monad lax-idempotence*: holds for all $n \geq 0$.
- *Four-regime dichotomy*: holds for all $n \geq 0$, with regime determined by $\kappa^{(n)}$.
- *Bitopological settling site*: extends to $E^n$ as the underlying space.
- *Anderson-Putnam direct-limit cohomology*: applies to $n$-ary substitution settlings.
- *Klein-four symmetry*: the bilattice's Klein-four involutions act on $n$-ary settlings cellwise — same group action.

What's *new* at higher arity: richer closure-shape combinatorics, higher-rank cohomology, and the possibility of *partial closures* (closure on some indices, leaving others unchanged) which has no analog in the binary case.

## Worked example sketch: ternary causal triples

Let $E = \{a_1, a_2, a_3\}$ (3 events) and $\mathcal{C}^{(3)} = \{\mathrm{causes\text{-}via}\}$ (a single ternary predicate "$a_i$ causes $a_j$ via mechanism $a_k$"). Initial settling $v_0$: a fact-base of known causal triples, with $\mathbf{t}$ for known and $\bot$ otherwise.

Closure rule: *causal transitivity*: if $a_i$ causes $a_j$ via $a_k$, and $a_j$ causes $a_l$ via $a_m$, then $a_i$ causes $a_l$ via the *composition* of $a_k$ and $a_m$ (formally: a new mechanism, possibly named or just witnessed).

The settling computes the closure of the causal triple system under transitivity. Per the [3-ary settling benchmark](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/benchmark-causal-triples-3-ary.md), this terminates in a finite number of steps for finite $E$, placing it in the **strict regime**.

## Position in predication categories

First explicit object generalizing predication beyond binary. Establishes the framework's arity-independence: the same 2-monad / closure / regime / cohomology machinery applies to $n$-ary, with combinatorial richness scaling in $n$.

Pairs with:
- The [higher-arity cohomological rank theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/higher-arity-cohomological-rank.md) — quantitative claim about rank scaling.
- The [3-ary causal-triple benchmark](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/benchmark-causal-triples-3-ary.md) — concrete computation.

Open downstream:
- *Variable-arity settlings*: predications whose arity varies across cells (e.g., a predicate $p$ that's binary in some contexts and ternary in others). Required for full natural-language reasoning. Open whether this fits within the framework or requires arity-fibered presheaves.
- *Hypergraph cohomology*: $n$-ary edges in a hypergraph form an $n$-ary settling; the cohomology of the closure system gives a hypergraph invariant. Connection to standard hypergraph theory open.
- *$n$-ary Klein-four refinements*: at higher arity, the bilattice's Klein-four extends to a *configuration* group acting on the index set $\{1, \ldots, n\}$ via permutations interleaved with bilattice involutions. For $n = 2$, this is just Klein-four. For $n = 3$, it's $\mathbb{Z}_2^3 \rtimes S_3$. Open structural classification.
