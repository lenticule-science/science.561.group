---
type: theorem
status: proved
depends-on: [closure-ordinal, settling-endofunctor, scott-continuous-closure, closure-2-monad, residuated-lattice, entity-set, predicate-category, predicate-generator-exhaustiveness, transfinite-settling-convergence, temporal-2-category, aperiodicity-characterization]
see-also: [regime-chain-order, antecedent-regime-bound, regime-antimonotonicity, regime-decomposition, regime-mld-invariance]
---

# Four-regime dichotomy

For a [predication settling](../objects/predication-settling.md) $(\mathcal{E}, c)$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with eventually-zero increments and initial state $\mathcal{E}_0$, let $\kappa := \kappa(F_U, \mathcal{E}_0)$ be the [closure ordinal](../objects/closure-ordinal.md). The four regimes are the strata of the function $v \mapsto \kappa(v)$ at the ordinal boundaries $\omega$ and $\omega_1$. Exactly one holds:

**Strict regime.** $\kappa < \omega$. Equivalently, $\mathbf{L}$, $E$, and $\mathcal{C}$ are all finite, which forces a finite ascending chain in each [predication fiber algebra](../objects/predication-fiber-algebra.md). The [closure 2-monad](../morphisms/closure-2-monad.md) $\mathrm{Cl}$ is strict-idempotent; the [temporal 2-category](../../temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$ as a 1-category. The [settling convergence](../../../references/settling-convergence.md) theorem applies.

**Scott-continuous regime.** $\kappa = \omega$. Equivalently, the closure operator is [Scott-continuous](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md) and at least one of $\mathbf{L}, E, \mathcal{C}$ is infinite. Scott-continuity forces stabilization at the $\omega$-limit by [transfinite settling convergence](../../../references/transfinite-settling-convergence.md). $\mathrm{Cl}$ is effectively strict-idempotent at $\omega$.

**Transfinite-bounded regime.** $\omega < \kappa < \omega_1$. Equivalently, the closure operator is non-Scott-continuous and the state space has countable cofinality (so the closure ordinal stays countable). $\mathrm{Cl}$ is genuinely lax-idempotent; $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional up to $\kappa$, then stabilizes.

**Aperiodic regime.** $\omega_1 \leq \kappa$. Equivalently, the closure operator is non-Scott-continuous and the state space has cofinality $\geq \omega_1$ (so the closure ordinal can reach the first uncountable ordinal). $\mathrm{Cl}$ is genuinely lax-idempotent throughout; the orbit is strictly $\leq_k$-ascending across $\omega_1$-many stages.

## Proof

The four cases are mutually exclusive (each $\kappa$ falls in exactly one of $\{<\omega, =\omega, (\omega, \omega_1), [\omega_1, \cdot)\}$) and jointly exhaustive (the four cases cover all ordinals).

For the equivalences:

**Strict.** Finite $\mathbf{L}, E, \mathcal{C}$ make $A_p = \mathbf{L}^{\bowtie E \times E}$ finite, so any $\leq_k$-ascending chain is finite, so $\kappa < \omega$. Conversely, $\kappa < \omega$ requires finite stabilization at every fiber, which together with [predicate-generator exhaustiveness](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/predication-fibration/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) and the finiteness of the chain gives finite $A_p$, hence finite $\mathbf{L}, E, \mathcal{C}$.

**Scott-continuous.** Scott-continuity gives $\kappa \leq \omega$ by [transfinite settling convergence](../../../references/transfinite-settling-convergence.md); the infinite-base hypothesis distinguishes this from the strict regime ($\kappa = \omega$, not $< \omega$). Conversely, if $\kappa = \omega$ on an infinite base, the closure must commute with the directed $\omega$-join — which is exactly Scott-continuity.

**Transfinite-bounded vs aperiodic.** [Aperiodicity-characterization](../../aperiodic-settling/references/aperiodicity-characterization.md) establishes the equivalence $\kappa \geq \omega_1 \iff$ non-Scott-continuous closure + state-space cofinality $\geq \omega_1$. The complement among non-Scott-continuous closures — countable cofinality — gives $\kappa$ countable; combined with the lower bound $\kappa > \omega$ from non-Scott-continuity, this is the transfinite-bounded regime $\omega < \kappa < \omega_1$. $\square$

## Regime-dependent structure of the KZ diamond

The KZ-lax-idempotent diamond of the [temporal 2-category](../../temporal-2-category/temporal-2-category.md) has regime-dependent content:

- **Strict regime:** diamond 2-cells trivialize; both KZ structures strict-idempotent; $\mathbf{T}(\mathcal{C}, \lambda)$ collapses to $\lambda$.
- **Scott-continuous regime:** diamond 2-cells trivialize at $\omega$; below $\omega$ the settling has genuine 1-cells but strictifies at the limit.
- **Transfinite-bounded regime:** diamond 2-cells are non-trivial up to $\kappa$; $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional in a bounded countable range.
- **Aperiodic regime:** diamond 2-cells are non-trivial throughout an $\omega_1$-or-longer orbit; $\mathbf{T}(\mathcal{C}, \lambda)$ is genuinely 2-dimensional. This is the regime where the KZ-lax-idempotent diamond is fully alive.

## Typical sources

- *Strict regime:* finite relational databases, finite TBoxes, finite Kripke frames. The foundational worked examples — [trivial](../examples/trivial-settling.md), [relational-database](../examples/relational-database-settling.md), [knowledge-graph](../examples/knowledge-graph-settling.md), [multi-agent epistemic](../examples/multi-agent-epistemic-settling.md), [adult-parent settling](../examples/adult-parent-settling.md) — all sit here.
- *Scott-continuous regime:* countable knowledge bases with finitary inference (logic programming, description logics over infinite entity spaces with finitary rules).
- *Transfinite-bounded regime:* infinite knowledge bases with infinitary closure rules whose state-space cofinality is countable, stabilizing after the quantifier-induced closures complete. The [quantifier-induced transfinite settling](../examples/quantifier-induced-transfinite-settling.md) is the smallest natural instance.
- *Aperiodic regime:* infinitary closures on uncountable-cofinality state spaces. The [transfinite-induction settling](../examples/transfinite-induction-settling.md) on $E = \omega_1$ is the canonical example, with $\kappa = \omega_1$ exactly.

The cohomological content is concentrated in the transfinite-bounded and aperiodic regimes; the strict and Scott-continuous regimes have $H^1 = 0$ for the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md).
