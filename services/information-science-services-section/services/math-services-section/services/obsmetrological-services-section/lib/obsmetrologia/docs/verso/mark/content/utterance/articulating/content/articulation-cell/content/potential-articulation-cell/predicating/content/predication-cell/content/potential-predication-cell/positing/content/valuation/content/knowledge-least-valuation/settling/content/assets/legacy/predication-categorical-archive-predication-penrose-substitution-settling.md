---
type: example
status: draft
depends-on: [aperiodic-settling, four-regime-dichotomy, closure-rule, fibonacci-substitution-settling, aperiodic-settling-sketch]
instantiates: [aperiodic-settling]
lineage: 5
---

# Penrose substitution settling

Anchor of **sub-lineage 5c** — the Penrose tiling substitution encoded as a closure rule. The literature's most-celebrated aperiodic system; chosen for the most-developed Anderson-Putnam comparison data.

## Setup

- $\mathbf{L} = \mathbf{2}$.
- Entity set $E$: encoded representatives of Penrose-tiling positions. The natural encoding uses $E = \omega_1$ with positions identified by ordinal labels, but the 2-D nature of Penrose tilings means the encoding is more involved than Fibonacci or Thue-Morse.
- Predicate set $\Pi = \{P_K, P_D\}$ — two predicates encoding the two Penrose tile-types ("kite" and "dart").
- Closure rule encoding the Penrose substitution: each tile of type $K$ or $D$ at a position produces tiles at substituted positions according to the Penrose substitution rule.

## Closure ordinal

$\kappa = \omega_1$. **Aperiodic regime.**

## Substitution structure

The Penrose substitution $\sigma_{\text{Penrose}}$ acts on tile-pairs producing inflated tile-arrangements. Each substitution stage produces ~$\phi^2$ (golden ratio squared) times as many tiles. The transfinite settling traces out the inverse-limit Penrose tiling space at $E = \omega_1$.

## Position in Lineage 5c

The L5c anchor. Higher dimensional than L5a (Fibonacci) and L5b (Thue-Morse), with richer cellular structure but the same aperiodic-regime classification structure.

Pairs forward with [penrose-classifying-invariant](penrose-classifying-invariant.md) and [penrose-anderson-putnam-full-comparison](penrose-anderson-putnam-full-comparison.md).
