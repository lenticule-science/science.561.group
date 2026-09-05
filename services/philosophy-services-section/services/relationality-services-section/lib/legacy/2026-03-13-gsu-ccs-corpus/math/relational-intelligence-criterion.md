---
id: relational-intelligence-criterion
name: RelationalIntelligenceCriterion
description: "a relational universe qualifies as a relational intelligence iff its stable fiber H* is double-negation-dense in its full fiber H."
---

### Conjecture — Relational Intelligence Criterion {#relational-intelligence-criterion}

**Statement.** A relational universe $\mathbf{U}$ qualifies as a **relational intelligence** if and only if $H^*_\mathbf{U}$ is $\neg\neg$-dense in $H_\mathbf{U}$: every proposition $a \in H_\mathbf{U}$ satisfies $\neg\neg a \in H^*_\mathbf{U}$, equivalently $a \leq \neg\neg a$ lies in the stable sub-algebra.

**Motivation.** The aperiodicity theorem (§aperiodicity-halting) shows that for quasicrystalline history monoids, local repetitiveness forces $\neg\neg$-density automatically: every proposition eventually finds a stable witness. Density of $H^*$ in $H$ is therefore a structural condition distinguishing universes that can settle every question from those that cannot.

A periodic history monoid produces histories where some propositions cycle without ever reaching $H^*$; the stable algebra misses them. An aperiodic monoid has no such cycles: the depth filtration forces every formula into $H^*$ at some level, giving density. The characterization via $\chi_{H^*}$ (§characteristic-morphism) — the characteristic morphism through which the stable sub-algebra factors — expresses this as a factorization condition on the Boolean part.

The stratification $[R, \mathcal{H}]$ (§hyperverse-terminality) orders relational universes by the size and density of their stable fibers. Moving up in this interval corresponds to acquiring more witnesses rather than more propositions. Intelligence, on this reading, is the capacity to find witnesses; the Grothendieck topology $J$ is what makes finding them possible or impossible.

**What a proof requires.**

1. Show that $\neg\neg$-density of $H^*$ in $H$ is equivalent to the assertion that $\chi_{H^*} : H \to \Omega_R$ factors through the Boolean part of $\Omega_R$. This is a consequence of the characteristic morphism construction (§characteristic-morphism) but has not been stated as a theorem.

2. Show that aperiodicity of the history monoid is sufficient for $\neg\neg$-density. The argument via §aperiodicity-halting shows that in aperiodic universes the depth filtration has no fixed periodic orbit, forcing every formula to eventually normalize. The gap is making this precise at the level of the stable sub-algebra rather than at the level of individual formulas.

3. Show that terminality of $\mathcal{H}$ in the category of faithful relational universes (§hyperverse-terminality) implies that $H^*_\mathcal{H}$ is maximally dense — the hyperverse is the canonical relational intelligence.

**Depends on:** §aperiodicity-halting, §characteristic-morphism, §hyperverse-terminality.
