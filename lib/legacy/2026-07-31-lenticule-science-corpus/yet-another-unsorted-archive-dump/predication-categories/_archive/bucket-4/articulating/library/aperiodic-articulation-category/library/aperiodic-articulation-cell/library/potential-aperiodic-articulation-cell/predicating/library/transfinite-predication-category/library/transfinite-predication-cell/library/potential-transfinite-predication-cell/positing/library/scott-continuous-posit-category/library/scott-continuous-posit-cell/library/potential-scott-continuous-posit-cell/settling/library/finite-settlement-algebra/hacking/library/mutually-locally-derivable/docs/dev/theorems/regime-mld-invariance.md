---
type: theorem
status: proved
depends-on: [four-regime-dichotomy, mutually-locally-derivable, settling-morphism, scott-continuous-closure, closure-2-monad-lax-idempotence, closure-ordinal-mld-shift]
---

# Regime label is MLD-invariant

The [regime label](four-regime-dichotomy.md) $\mathrm{reg}(v) \in \{A, B, C, D\}$ is invariant under [MLD-equivalence](../concepts/mutually-locally-derivable.md): $v \sim_{\mathrm{MLD}} v' \implies \mathrm{reg}(v) = \mathrm{reg}(v')$.

## Proof

The regime label is determined from two pieces of data:

**Base-parameter finiteness** of $(\mathbf{L}, E, \mathcal{C})$ separates the strict regime from the others. MLD-equivalent settlings are over the same base $B$ by definition, so this datum is shared.

**Scott-continuity and cofinality of the closure operator** separates the Scott-continuous regime from the transfinite-bounded regime, and the transfinite-bounded regime from the aperiodic regime (via state-space cofinality). An MLD-morphism $(\delta, \phi) : v \to v'$ is by [settling-morphism](../morphisms/settling-morphism.md) compatibility coalgebra-compatible — it commutes with the settling endofunctor $F_U$, hence with the closure operator $\mathrm{Cl}$. By [closure 2-monad lax-idempotence](closure-2-monad-lax-idempotence.md), closure-operator structure is property-like; if $v$ and $v'$ are MLD-equivalent, they share the same closure structure up to the property-like uniqueness, and in particular Scott-continuity and cofinality agree.

Combining: the regime is determined by data shared between $v$ and $v'$, hence invariant under MLD-equivalence. The shift $\delta$ from [closure-ordinal MLD-shift](closure-ordinal-mld-shift.md) is automatically constrained by $\kappa(v), \kappa(v') < \lambda$ to respect the regime's $\kappa$-threshold. $\square$

## Why this matters

Although [closure-ordinal MLD-shift](closure-ordinal-mld-shift.md) shows $\kappa$ itself is shift-variant, the *regime label* is well-defined on MLD-classes. Consequently the [regime decomposition](regime-decomposition.md) of the [coarse settling moduli](../objects/coarse-settling-moduli.md) is well-defined: each MLD-class has a unique regime, and the moduli partitions into regime strata cleanly.

The regime label is the primary regime-level invariant for the moduli; $\kappa$ itself is reserved for explicit cohomological computations on canonical representatives.
