---
type: theorem
status: proved
depends-on: [closure-rule, non-scott-continuous-firing-ordinal, increment-sequence, transfinite-bounded-regime-h1-generators, aperiodic-classifying-invariant, predication-settling, parameter-base-category]
see-also: [strict-regime-realizability, scott-continuous-regime-realizability, transfinite-bounded-regime-realizability, aperiodic-regime-realizability]
---

# Realizability cardinality bound

A *coarse* upper bound on the realizable image of the [moduli classifying function](../morphisms/moduli-classifying-function.md), regime-, axis-, and rule-language-agnostic. The per-regime realizability theorems give much tighter characterizations within their scope; the cardinality bound is the minimum that holds across all of them.

Fix a parameter base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with finite $\mathbf{L}^\bowtie$, countable predicate category $\mathcal{C}$, $|E| \leq \aleph_1$, and $\lambda \leq \omega_1 + 1$. Restrict attention to closure-rule systems whose rule list is at most countable and to [increment sequences](../objects/increment-sequence.md) with at most countably many cells set non-trivially across all stages.

The set of subsets $S \subseteq \omega_1$ realizable as $L_{\mathrm{ns}}(\mathcal{S}, U)$ for some such closure-rule system $\mathcal{S}$ and increment sequence $U$ has cardinality at most $2^{\aleph_0}$.

In particular, since the set of subsets of countable limit ordinals below $\omega_1$ has cardinality $2^{\aleph_1}$, at most $2^{\aleph_0}$-many of them are realizable; the realizable subsets form a strict sub-collection of all possible subsets.

## Proof

Count rule-system-and-increment-sequence pairs.

**Rule systems.** A [closure rule](../concepts/closure-rule.md) is a finite expression in the inherited signature on $B$. The signature alphabet consists of:
- entity constants from $E$ (at most $\aleph_1$);
- predicate-class generator names from $\mathcal{C}$ (at most $\aleph_0$);
- value constants from $\mathbf{L}^\bowtie$ (finite);
- logical symbols and entity variables (countably many, fixed across all bases).

The total alphabet has cardinality at most $\aleph_1$. The set of finite strings over an alphabet of cardinality $\aleph_1$ has cardinality $\aleph_1$. A closure-rule system is a finite or countable list of such strings, so the number of distinct rule systems is at most $\aleph_1^{\aleph_0}$.

By cardinal arithmetic $\aleph_1^{\aleph_0} = 2^{\aleph_0}$ (the upper bound from $\aleph_1 \leq 2^{\aleph_0}$ gives $\aleph_1^{\aleph_0} \leq (2^{\aleph_0})^{\aleph_0} = 2^{\aleph_0}$; the lower bound from $2 \leq \aleph_1$ gives $\aleph_1^{\aleph_0} \geq 2^{\aleph_0}$).

So there are at most $2^{\aleph_0}$ closure-rule systems.

**Increment sequences with countable support.** An increment $u_\tau$ at stage $\tau$ specifies a set of cell-value updates. An increment sequence of length $\lambda$ with at most countably many cells set non-trivially across all stages is determined by:
- the countable subset of $\lambda \times \mathcal{C} \times E \times E$ at which non-trivial updates occur;
- the value assigned at each such cell from $\mathbf{L}^\bowtie$.

The countable subsets of $\lambda \times \mathcal{C} \times E \times E$ — a set of cardinality at most $\aleph_1 \cdot \aleph_0 \cdot \aleph_1 \cdot \aleph_1 = \aleph_1$ — number at most $\aleph_1^{\aleph_0} = 2^{\aleph_0}$. The value assignment to a countable set has at most $|\mathbf{L}^\bowtie|^{\aleph_0} \leq 2^{\aleph_0}$ choices. The total is therefore at most $2^{\aleph_0}$.

**Pairs.** The number of (rule-system, increment-sequence) pairs is at most $2^{\aleph_0} \cdot 2^{\aleph_0} = 2^{\aleph_0}$.

**Each pair determines $L_{\mathrm{ns}}$.** A closure-rule system $\mathcal{S}$ generates a closure operator (existence and uniqueness from the least-monotone-fixpoint construction in [closure-rule](../concepts/closure-rule.md)); together with an increment sequence $U$ this determines a settling $v$, and from $v$ the [non-Scott-continuous firing-ordinal set](../concepts/non-scott-continuous-firing-ordinal.md) $L_{\mathrm{ns}}(v) \subseteq \omega_1$ is determined. So each pair maps to a single subset of countable limit ordinals.

The realizable subsets are the image of this map; their cardinality is at most $2^{\aleph_0}$.

**Strictness.** Subsets of the countable limit ordinals below $\omega_1$ have cardinality $2^{\aleph_1}$. By Cantor, $2^{\aleph_1} > 2^{\aleph_0}$, so the realizable subsets form a strict sub-collection. $\square$

## Looseness

The bound is far from tight. The actual realizable family in each regime is much smaller than $2^{\aleph_0}$:

- [Strict-regime realizability](strict-regime-realizability.md): the realizable family is the (finite) set of $\mathcal{C}$-natural cell configurations.
- [Scott-continuous-regime realizability](scott-continuous-regime-realizability.md): the realizable family is the countable set of $\mathcal{C}$-natural countable cell configurations.
- [Transfinite-bounded-regime realizability](transfinite-bounded-regime-realizability.md): in the bare $\Pi_1$+$<$ rule language, the realizable family is a *one-parameter family* of initial segments — much smaller than $2^{\aleph_0}$.
- [Aperiodic-regime realizability](aperiodic-regime-realizability.md): the same one-parameter family at the $\omega_1$-scale.

The cardinality bound captures only the rule-language's countable expressivity; per-regime structural constraints reduce the realizable family further by orders of magnitude.

The bound also depends on the countable-support restriction on increment sequences. With unrestricted increments — allowing $\aleph_1$-many non-trivial cell updates — the bound rises to $2^{\aleph_1}$ and the realizability question collapses: every subset is realizable via increment-by-direct-marking. The countable-support restriction is what makes realizability non-trivial.

## Dependence on the rule language

The argument shows that the bound is *exactly* $2^{\aleph_0}$ as long as the rule language has alphabet of size $\leq \aleph_1$ and is countable in syntactic structure. Enlarging the rule language to include richer primitives (e.g., second-order quantifiers, set-valued constants of cardinality $> \aleph_1$) would lift the bound. The $\Pi_1$ commitment of [closure-rule](../concepts/closure-rule.md) keeps the bound at $2^{\aleph_0}$.
