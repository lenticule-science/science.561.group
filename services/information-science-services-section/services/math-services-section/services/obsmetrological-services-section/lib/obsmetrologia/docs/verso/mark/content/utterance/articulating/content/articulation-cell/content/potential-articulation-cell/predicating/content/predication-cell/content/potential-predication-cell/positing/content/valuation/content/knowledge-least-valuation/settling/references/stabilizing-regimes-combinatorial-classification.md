---
kind: theorem
status: proved
depends-on: [moduli-classifying-function, biequivalence-cohomological-collapse, settling-cohomology-vanishes-above-degree-1, four-regime-dichotomy, settling-morphism]
---

# Strict and Scott-continuous regimes: combinatorial moduli classification

On the strict and Scott-continuous strata of the [coarse settling moduli](../objects/coarse-settling-moduli.md), the [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ is injective, but the injectivity has *no cohomological-class detection*: $H^1(\mathcal{F}_U) = 0$ on these regimes ([settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md) plus regime-specific Scott-continuity), so every class on these strata maps to $0 \in H^1$.

Equivalent moduli classes on these strata are detected by combinatorial cell-pattern matching: $\mathcal{I}_B([v]) = \mathcal{I}_B([v'])$ iff there exists a [settling-morphism](../morphisms/settling-morphism.md) $(\delta, \phi) : v \to v'$ witnessing MLD-equivalence.

## Proof

By [biequivalence-cohomological collapse](biequivalence-cohomological-collapse.md): on each regime, sheaf-iso of $\mathcal{F}_U$ coincides with MLD-equivalence.
On the strict and Scott-continuous regimes, $H^1 = 0$ trivializes the cohomological detection mechanism, leaving the underlying MLD-equivalence definition — existence of an invertible settling-morphism — as the operational test.

For the strict regime (finite settlings): the settling-morphism check is a finite combinatorial search.
Cellwise reindexings $g : E \times E \to E \times E$ are bijections of a finite set; bilattice homomorphisms $\phi_{q, \tau}$ between finite fiber algebras are finitely many; ordinal shifts $\delta < \omega$ are finitely bounded.

For the Scott-continuous regime (Scott-continuous, settling reaches $\omega$): the check generalizes to a polynomial-time decision per settling-stage match, since each stage's designated-cell set is at most countable and stage-by-stage MLD-matching reduces to bijection checks. $\square$

## Computational complexity

For finite strict-regime bases: the moduli classification is *finitely checkable* — the set of MLD-classes is finite, and equality is decidable in polynomial time.
The [single-entity moduli](../examples/single-entity-moduli.md) example exhausts the moduli over the smallest non-trivial base; the [two-entity moduli](../examples/two-entity-moduli.md) example exhibits a 160-class natural enumeration.

For Scott-continuous regime: each MLD-equivalence check is polynomial (in the settling length); the moduli itself may be infinite (countably-many MLD-classes over an infinite base) but each pair-comparison is tractable.

## Why no $H^1$-shortcut

In the transfinite-bounded and aperiodic regimes the $H^1$-class is a *single piece of finite or transfinite data* that captures the entire MLD-class.
In the strict and Scott-continuous regimes no such single invariant lives in $H^1$ — the entire designated-cell evolution is the data, and MLD-checking is the only mechanism.
The two regimes-pairs use *fundamentally different detection mechanisms* (cohomological vs combinatorial), even though the underlying [biequivalence-cohomological collapse](biequivalence-cohomological-collapse.md) makes them produce the same partition on each stratum.
