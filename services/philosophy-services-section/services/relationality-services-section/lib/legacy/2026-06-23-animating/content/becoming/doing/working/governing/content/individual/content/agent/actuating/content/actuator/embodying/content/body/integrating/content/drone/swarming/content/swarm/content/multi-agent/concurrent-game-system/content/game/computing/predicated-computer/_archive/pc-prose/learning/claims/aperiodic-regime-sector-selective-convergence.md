---
name: aperiodic regime sector selective convergence
description: A polity in the aperiodic regime converges in the cohomological sense iff some non-empty proper subset of the four K4-equivariant sectors of its aperiodic-classifying-invariant stabilizes from some countable stage onward, while the complementary subset remains nonzero. Which sectors play which role is governance-regime-specific.
status: draft
depends-on:
  - ../../teaching/explanations/sector-selective-stabilization.md
---

# Aperiodic-regime swarm convergence is sector-selective

**Claim.** A polity (or swarm of polities) in the aperiodic regime ($\kappa \geq \omega_1$) converges in the cohomological sense iff *some non-empty proper subset* of the four $K_4$-equivariant sectors of its aperiodic-classifying-invariant stabilizes (vanishes from some countable stage $\tau_0$ onward), *while the complementary subset generically remains nonzero*.

For the joint settling $v^{\|}$ on the parallel composition $A_1 \| \cdots \| A_n$ in $\mathbf{CGS}$, the aperiodic-classifying-invariant
$$\mathrm{cl}\text{-}\mathrm{inv}(v^{\|}) \;\in\; H^1\!\left(\mathbf{T}^*_{\leq \omega_1},\ \mathcal{F}_{U^{\|}}\right)$$
projects under the $K_4$-equivariant decomposition into four isotypic sectors:
$$\mathrm{cl}\text{-}\mathrm{inv}(v^{\|}) \;=\; \big(\mathrm{cl}^{\mathrm{id}},\ \mathrm{cl}^{\chi_\sim},\ \mathrm{cl}^{\chi_-},\ \mathrm{cl}^{\chi_{\sim\circ -}}\big).$$
Convergence in the cohomological sense is sector-selective: some components vanish from $\tau_0$ onward; others do not. *Which* components play which role is governance-regime-specific.

Categorically, the joint state converges in the cofibered limit topology to the cofree-`!`-coalgebra fixed point in $\mathcal{Kl}(!_{\mathbf{CGS}})$ on the parallel composition, with convergence measured by sector-selective cohomological stability.

## Argument

The `aperiodic-regime-classification` theorem makes the aperiodic-classifying-invariant the complete MLD-invariant for aperiodic settlings: $v \sim_\text{MLD} v'$ iff $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$. Cohomological equivalence in $H^1$ classifies aperiodic settlings completely.

In strict and Scott-continuous regimes, $H^1 = 0$ structurally, so [`crdt-convergence-via-cohomological-calm`](../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-cohomological-calm.md) gives CRDT convergence by abstract nonsense from codomain vanishing in Mayer-Vietoris. In aperiodic and transfinite-bounded regimes, $H^1 \neq 0$ globally and the abstract argument fails. The $K_4$-equivariant decomposition refines $H^1$ into four isotypic sectors; *vanishing in some sectors but not others is weaker than global vanishing* but still gives a substantive convergence criterion.

This is the seam. The convergence criterion has to live at the level of *sector-selective* stabilization, not global vanishing. The structural fact is that the aperiodic regime *permits* this option — strict and Scott-continuous regimes do not, because their $H^1$ vanishes globally and cannot distinguish stabilizing from non-stabilizing sectors. The aperiodic regime's distinguishing structural strength is sector-selective convergence.

## Significance

A polity *needs* sector-selective convergence: some content (whatever the governance regime designates as load-bearing for action-licensing) must stabilize for the polity to remain capable of action; some other content (aim-generativity) must not stabilize for the polity to remain itself. The strict-regime alternative would have the polity saturate at a fixed point — losing its aim-generativity (which is what makes it an *endeavor* per [`aim-generativity`](../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/aim-generativity.md)). The aperiodic regime's sector-selectivity is what makes the polity continuous-without-completion.

The specific sectors that play the action-licensing role versus the aim-generative role are governance-specific:

- *Kyriarchical regime:* safety-critical sectors $H^1_{\chi_-}, H^1_{\chi_{\sim\circ -}}$ must stabilize (for the dispatch certifiability gate to license action); $H^1_\mathrm{id}, H^1_{\chi_\sim}$ remain aim-generative.
- *Kin-relational regime:* wolakȟota-stabilized sectors play the action-licensing role; their specific cohomological identification is open (see [`cohomological-articulation-of-wolakhota`](../questions/cohomological-articulation-of-wolakhota.md)).

The classical-analog table for swarm convergence:

| Classical hypothesis | Framework analog | Categorical home |
|---|---|---|
| ACO bounded-pheromone-update | Bounded cell-value updates | $\top, \bot$ bounds of $\mathbf{FOUR}$ |
| PSO parameter constraint | Coherence conditions on closure-rule-system | Lax-idempotence of closure 2-monad |
| Bounded-entropy local-rule | Bounded $r_\Gamma$ in aim-frontier ratio | Per [`aperiodicity-as-tractability`](aperiodicity-as-tractability.md) |
| Probabilistic convergence to global optimum | Sector-selective cohomological stability | $K_4$-projection of $\mathrm{cl}\text{-}\mathrm{inv}$ |
| Convergence in distribution to stable region | Cofree-`!`-coalgebra fixed point | Limit in $\mathcal{Kl}(!_{\mathbf{CGS}})$ |

## Proof obligations for promotion to proved-status

- The $K_4$-equivariant decomposition lifts cleanly to the aperiodic-classifying-invariant on parallel compositions (the $K_4$-action commutes with $\|$ at the cohomology level).
- Preservation of sector-vanishing under bidirectional event exchange (federation convergence with $K_4$-action equivariance).
- The cofree-`!`-coalgebra fixed point exists as the categorical limit of the closure 2-monad's iteration in the aperiodic regime — depends on the [`is-eff-equivalent-to-kleisli-bang-cgs`](../questions/is-eff-equivalent-to-kleisli-bang-cgs.md) identification or a direct categorical argument.

## Position

Resolves the prior open question of what swarm convergence means in the aperiodic regime. Derived from synthesis of: the aperiodic-regime-classification theorem (predication-categories), the crdt-convergence-via-cohomological-calm theorem's regime-specific reading (predication-categories), and the $K_4$-equivariant cohomology decomposition (predication-categories). Surfaced in the FAdRS-swarms survey, §7.4; promoted here to standalone claim as a governance-regime-agnostic structural fact.
