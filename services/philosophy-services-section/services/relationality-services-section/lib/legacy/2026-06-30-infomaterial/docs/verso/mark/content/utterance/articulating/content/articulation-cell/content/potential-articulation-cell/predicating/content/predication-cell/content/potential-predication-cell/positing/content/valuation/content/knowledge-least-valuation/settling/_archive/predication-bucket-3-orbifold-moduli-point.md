---
kind: concept
type: moduli-substratum
depends-on: [coarse-settling-moduli, visible-automorphism-quotient, rigid-moduli-point, visible-automorphism-sources]
---

# Orbifold moduli point

A point of the [coarse settling moduli](../objects/coarse-settling-moduli.md) whose natural visible-automorphism group is non-trivial — the complement of the [rigid moduli point](rigid-moduli-point.md) substratum.

A moduli point $[v]$ is **orbifold** iff

$$\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) \;\neq\; \{1\}.$$

The orbifold substratum within each regime is

$$|\mathrm{KP}^{\mathrm{vis}}(B)|_X^{\mathrm{orb}} \;:=\; \{[v] \in |\mathrm{KP}^{\mathrm{vis}}(B)|_X \,:\, \mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) \neq \{1\}\}.$$

By [visible automorphism sources](../theorems/visible-automorphism-sources.md), at an orbifold point at least one of *fiber-swap*, *entity-permutation stabilizer*, or *predicate-automorphism stabilizer* contributes non-trivially: an element of that source stabilizes $v$ and permutes newly-designated cells non-trivially.

## When orbifold-ness occurs

Typical of settlings with cell-symmetry. A simple example: over $B = (\mathbf{2}, \{a, b\}, \{P\}, \omega)$, the settling with initial state $\{P(a, b) = \mathbf{t}, P(b, a) = \mathbf{t}\}$ has natural fiber-swap stabilizing it (the designated-cell set is swap-symmetric) and permuting the two newly-designated cells non-trivially — giving $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}} \supseteq \mathbb{Z}/2$.

The [two-entity moduli](../examples/two-entity-moduli.md) example exhibits 48 orbifold strict-regime points (out of 160 MLD-classes total) — those with off-diagonal swap-symmetric designated cells.

## Substratification well-definedness

Both the rigid and orbifold substrata are well-defined under MLD-equivalence: by [settling-automorphism decomposition](../theorems/settling-automorphism-decomposition.md), MLD-conjugation gives an isomorphism $\mathrm{Aut}^\simeq(v) \cong \mathrm{Aut}^\simeq(v')$ that preserves $N$, hence induces a group iso on the visible quotient. So $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}$ is an MLD-invariant up to group isomorphism.

## What this gives

The moduli stratifies as

$$|\mathrm{KP}^{\mathrm{vis}}(B)| \;=\; \bigsqcup_X \bigl(|\mathrm{KP}^{\mathrm{vis}}(B)|_X^{\mathrm{rig}} \,\sqcup\, |\mathrm{KP}^{\mathrm{vis}}(B)|_X^{\mathrm{orb}}\bigr),$$

partitioned by [regime](../theorems/regime-decomposition.md) and within each regime by visible-automorphism symmetry. The [moduli classifying function](../morphisms/moduli-classifying-function.md) further refines orbifold loci of the transfinite-bounded and aperiodic regimes by classifying-invariant.
