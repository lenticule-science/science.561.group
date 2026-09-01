---
type: concept
class: semantic-anchor
status: draft
depends-on: [cadence, recurrent-practice, settle-cycle, operations-settling, bilattice-accessibility-relation, modal-necessity-operator, modal-possibility-operator]
realizes: [cadence]
---

# Cadence as a modal frame

Sharpens [cadence](./cadence.md) from a temporal-grain anchor into a [bilattice accessibility relation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) on the [operations settling](../objects/operations-settling.md)'s stages: each cadence boundary $\tau_n \in T_R$ supplies the accessible-from-here stages, and the [modal necessity](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) and [modal possibility](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-possibility-operator.md) operators on that frame compute the recurrent practice's $\Box$- and $\Diamond$-statements directly on the substrate.

## The cadence frame

Let $R = (\mathcal{S}_R, T_R, \alpha_R)$ be a [recurrent practice](../objects/recurrent-practice.md) with cycle-boundary ordinals $T_R = \{\tau_0, \tau_1, \tau_2, \ldots\}$. The *cadence frame* of $R$ is the bilattice accessibility relation $R^{\mathrm{cad}} \subseteq \lambda \times \lambda$ defined by

$$\sigma \,R^{\mathrm{cad}}\, \sigma' \;\iff\; \sigma' \geq \sigma \;\text{ and }\; (\exists n)\,\sigma' \in [\tau_n, \tau_{n+1}) \;\text{ and }\; \sigma \in [\tau_{n-k}, \tau_{n-k+1})\,\text{ for some }\,0 \leq k \leq h_R$$

where $h_R$ is the *aggregation horizon* derived from $\alpha_R$: $h_R = 0$ for cycle-independent, $h_R = 1$ for Markov, $h_R = k$ for finite-history depth $k$, and $h_R = \infty$ for limit-aggregating. The relation says: from stage $\sigma$ in cycle $n - k$, accessible stages $\sigma'$ are exactly those in cycles $n - k$ through $n$ that the practice's antecedent rules can reach.

## Modal operators on the cadence frame

The two bilattice modal operators on $R^{\mathrm{cad}}$ compute, for any cell $\phi$:

$$\Box_{R^{\mathrm{cad}}} \phi(\sigma) \;=\; \bigwedge_t^{\sigma' :\, \sigma R^{\mathrm{cad}} \sigma'} \phi(\sigma'), \qquad \Diamond_{R^{\mathrm{cad}}} \phi(\sigma) \;=\; \bigvee_t^{\sigma' :\, \sigma R^{\mathrm{cad}} \sigma'} \phi(\sigma').$$

Operationally:

- $\Box_{R^{\mathrm{cad}}} \phi$ — "$\phi$ holds at *every* upcoming cycle within the practice's horizon." A standing-policy claim.
- $\Diamond_{R^{\mathrm{cad}}} \phi$ — "$\phi$ holds at *some* upcoming cycle." A scheduling claim.

These are the modal duals via $\Diamond \;=\; \sim \Box \sim$, by the same construction used in [deontic-modality](theories/predicated-governance/concepts/deontic-modality.md) for jural relations. The two modal vocabularies share the substrate: a power's authorized-continuations and a recurrent practice's upcoming-cycles are both bilattice-accessibility-relation shadows, differing only in which cells the relation is built on.

## Why this is more than a vocabulary upgrade

Three structural payoffs:

1. **Composition.** Cadence frames compose: a sprint cadence ($R^{\mathrm{spr}}$) inside a quarterly cadence ($R^{\mathrm{qtr}}$) gives the composite frame $R^{\mathrm{spr}} \circ R^{\mathrm{qtr}}$, with composite modal operator $\Box_{R^{\mathrm{spr}} \circ R^{\mathrm{qtr}}}$. Multi-cadence governance (weekly review nested in quarterly review) is a single modal expression, not a meta-level scheduler.

2. **Truth-and-knowledge separation.** Because $R^{\mathrm{cad}}$ is a bilattice accessibility relation, $\Box$ and $\Diamond$ are computed *separately* on the truth and knowledge orders, per [bilattice-accessibility-relation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md). "Will be true at every upcoming cycle" and "will be known at every upcoming cycle" are distinguishable claims with separate cohomology — making promise-tracking (truth-axis) and information-tracking (knowledge-axis) substrate-distinct without ad-hoc infrastructure.

3. **Cadence-mismatch as $H^1$ obstruction.** When two practices' cadence frames disagree at a limit ordinal — sprint-end and quarter-end falling on incompatible stages — the obstruction to unifying them is a class in $H^1$ of the joined frame, by the same machinery [regime-of-recurrent-practice](../theorems/regime-of-recurrent-practice.md) uses to land limit-aggregating practices in transfinite-bounded regime. Calendar-collision is a cohomological fact, not a project-management heuristic.

## Relation to existing pieces

[Cadence](./cadence.md) names what the temporal grain *is*; this concept names what the temporal grain *does* algebraically. [Settle-cycle](../morphisms/settle-cycle.md) records each cycle boundary as a witness; the cadence frame $R^{\mathrm{cad}}$ is the relation those witnesses generate. [Regime-of-recurrent-practice](../theorems/regime-of-recurrent-practice.md) classifies $R$ by closure ordinal; the cadence-frame view re-reads that classification as the regime of the modal operators $\Box_{R^{\mathrm{cad}}}, \Diamond_{R^{\mathrm{cad}}}$ themselves.

## Modal-axiom content of the cadence frame

The cadence frame inherits the bilattice modal logic $\mathrm{NM}^{\mathrm{B}}$, which is *non-normal*: see [cadence-modal-non-normality](../theorems/cadence-modal-non-normality.md). The K-axiom $\Box(\phi \to \psi) \to (\Box\phi \to \Box\psi)$ fails on $R^{\mathrm{cad}}$. Operationally: a recurrent practice's standing-policy commitments are not closed under cycle-local implication — forward $\Box$-commitments must be settled in $\mathcal{S}_R$ as their own rule entries, not derived from chained implications across cycles.
