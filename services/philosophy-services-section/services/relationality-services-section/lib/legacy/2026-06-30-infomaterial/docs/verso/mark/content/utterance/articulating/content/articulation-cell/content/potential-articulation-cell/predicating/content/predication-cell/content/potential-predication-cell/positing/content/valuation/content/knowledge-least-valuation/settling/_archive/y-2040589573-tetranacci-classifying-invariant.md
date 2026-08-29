---
kind: example
status: draft
depends-on: [step-n-cohomological-rank-theorem, step-n-and-bilattice-correspondence, tetranacci-substitution-settling, padovan-classifying-invariant]
instantiates: [step-n-cohomological-rank-theorem, step-n-and-bilattice-correspondence]
lineage: 5
---

# Tetranacci classifying invariant

The L5f instance at $n = 4$.

## Post-quotient invariant

By the step-n cohomological rank theorem at $n = 4$:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(4)}(v_{\text{Tetranacci}}) \;=\; \mathbb{Z}^4.$$

The 4 generators correspond to the 4 substitution letters $\{a, b, c, d\}$. The cardinality of the alphabet matches the cardinality of the bilattice's full value set $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$, so a bijection between the two sets exists; per the [step-$n$ / bilattice cardinality coincidence theorem](../theorems/step-n-and-bilattice-correspondence.md), whether such a bijection is canonical (in the sense of being preserved by the substitution dynamics under any bilattice operation) is open.

## Cardinality match with the full bilattice

The rank-4 group's generators are bijection-compatible with the bilattice's complete 4-element value set — this is the largest cardinality at which such a bijection exists in the step-$n$ family, since $\mathbf{FOUR}$ has only 4 elements.

For comparison:
- Fibonacci ($n = 2$, $\mathbb{Z}^2$): alphabet size matches the bilattice's 2 partial orders.
- Padovan ($n = 3$, $\mathbb{Z}^3$): alphabet size matches the 3 non-bottom values.
- Tetranacci ($n = 4$, $\mathbb{Z}^4$): alphabet size matches the 4 full values.

The progression L5a → L5d → L5f exhibits an alphabet-size match against progressively-more-complete bilattice substructures. Whether this match is structural (i.e., the substitution matrices respect a bilattice operation under some bijection) or numerological is open.

## Position in Lineage 5f

The L5f classifying invariant. Establishes the corpus's framework at $n = 4$, where the alphabet cardinality matches the bilattice's full-value-set cardinality.

## Cardinality boundary at $n = 4$

Tetranacci sits at the *cardinality boundary* of the step-$n$ family's bilattice match: at $n = 4$, alphabet size equals $|\mathbf{FOUR}|$. For $n \geq 5$, no bilattice substructure has cardinality $\geq 5$, so no alphabet-to-bilattice-substructure bijection exists. The step-$n$ family extends to all $n \geq 2$, but the cardinality-match phenomenon is bounded at $n = 4$.
