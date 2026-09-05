---
type: question
class: bridge
status: open
explores:
  - entity-set
  - predication-settling
  - lorentzian-causal-settling
  - continuum-lorentzian-limit
  - bitopological-settling-site
  - paired-priestley-space
---

# Spatial and metric structure on entity sets for embodied swarms

The corpus treats the [entity set](../objects/entity-set.md) $E$ as a structureless set. Entities have no spatial position, no topology, no metric, no notion of locality. Closure rules can fire across arbitrary entity-pairs without distance / spatial-locality constraints.

This is a foundational structural choice. *Embodied* swarms — robot swarms, drone formations, Vicsek-flocking models, biological swarms (starlings, ants), spatially-distributed sensor networks — have spatial structure as an inherent feature. The interaction strength between agents typically depends on distance; closure rules typically fire only between *neighbors* in a spatial sense; consensus dynamics are typically mediated by spatial structure.

The corpus has the [Lorentzian causal settling object](../objects/lorentzian-causal-settling.md) and the [continuum-Lorentzian limit question](continuum-lorentzian-limit.md), which gesture at relativistic-causal structure on entity sets. Neither is developed; neither addresses *non-relativistic* spatial structure, which is the more immediate need for embodied swarm modeling.

This question sets up the work to extend the corpus's apparatus with spatial / metric / topological structure on $E$ for engagement with embodied swarm theory.

## What the corpus has

- The [entity set](../objects/entity-set.md) $E$, structureless.
- The [Lorentzian causal settling object](../objects/lorentzian-causal-settling.md) — exists but minimally developed.
- The [continuum-Lorentzian limit question](continuum-lorentzian-limit.md) — open question on relativistic-flavored continuum limits.
- The [paired Priestley space object](../objects/paired-priestley-space.md) — already a topological object on the dual side; the spatial structure on $E$ would propagate dually to topological structure on the paired Priestley space.
- The [bitopological settling site](../objects/bitopological-settling-site.md) — already bitopological on the dual side.
- The [predicate specialization morphism](../morphisms/predicate-specialization.md) — has a `dom` predicate that already carries restriction structure; could be extended to carry spatial restriction.

## What the public literature has that this question needs to read

- **Vicsek 1995** — *Novel type of phase transition in a system of self-driven particles*. The foundational flocking / swarm-ordering paper.
- **Cucker–Smale 2007** — *Emergent behavior in flocks*. The foundational mathematical flocking model with explicit interaction-distance kernel.
- **Couzin et al on biological swarming** — empirical-mathematical models with explicit spatial structure.
- **Bullo, Cortés, Martínez** *Distributed Control of Robotic Networks* (2009) — standard textbook on spatially-distributed multi-robot systems.
- **Martínez, Bullo, Cortés on coverage control** — agent-positioning coordination problems.
- **Geometric multi-agent reinforcement learning** — recent line treating spatial structure as a first-class learning ingredient.
- **Hansen et al, Distributed Multi-Agent Coordination over Cellular Sheaves** ([arXiv 2504.02049](https://arxiv.org/abs/2504.02049)) — the closest sheaf-theoretic engagement with embodied swarms, with nonlinear edge potentials encoding consensus / formation / flocking objectives.
- **Topological approaches to distributed sensing** — Ghrist, Sanders et al on persistent homology for sensor coverage.
- **Synthetic differential geometry** — Kock, Lawvere; the categorical foundation for spatial structure that the corpus's framework could build on.
- **Recent work on Riemannian / metric-graph networks** — for the structural side of metric-on-graph.

## The question

How does the corpus's predication-settling apparatus extend when the entity set $E$ carries spatial / metric / topological structure, and what does the resulting machinery say about embodied swarms — flocking, formation, spatial coverage, distance-mediated consensus?

## Sub-questions

### (10a) What kind of spatial structure?

Five candidate structures on $E$, ordered roughly by generality:

- **Topology** — $E$ is a topological space. Closure rules fire only on cells $(s, p, o)$ where $s, o$ are in the same open neighborhood.
- **Metric** — $E$ is a metric space. Closure rules carry an *interaction range* $r > 0$; rules fire only on cells with $d(s, o) \leq r$.
- **Riemannian manifold** — $E$ is a smooth manifold. Settling dynamics carry differential structure; gradient-style settling becomes possible.
- **Graph metric** — $E$ has graph-theoretic metric structure (geodesic distance on a discrete graph). The natural fit for sensor networks, P2P systems, and discrete robot swarms.
- **Lorentzian / causal** — $E$ has light-cone / causal structure. The corpus's existing Lorentzian-causal-settling object addresses this; the natural fit for relativistic-flavored systems where "information cannot propagate faster than $c$."

Sub-question 10a asks: which candidate is the right place to start, and how does the choice constrain the rest? The metric structure is the most directly applicable for embodied swarms; the topological is the most general; the graph-metric is closest to the corpus's existing finite-$E$ setting.

### (10b) Distance-weighted closure rules

Vicsek / Cucker–Smale models have *interaction kernels*: agents at distance $d$ influence each other with strength $K(d)$, often a decreasing function. The corpus's deterministic closure rules don't have analogous strength-weighting.

Sub-question 10b asks: extend the [closure-rule language](../concepts/closure-rule-language.md) to support distance-weighted firing. Two candidates:

- **Threshold** — rule fires iff $d(s, o) \leq r$ (binary, simplest).
- **Continuous-weighted** — rule contributes $K(d(s, o)) \cdot V$ to the cell-value, requiring continuous-L (interlocks with [continuous-L stochastic swarm dynamics question](continuous-L-stochastic-swarm-dynamics.md)).

### (10c) Spatial-locality and the four-regime dichotomy

The [four-regime dichotomy](../theorems/four-regime-dichotomy.md) classifies settlings by closure ordinal. Spatial-locality of closure rules — rules that fire only on local neighborhoods — typically *accelerates* convergence: a spatially-local rule on a finite agent set in a bounded region typically converges in finite time.

Sub-question 10c asks: how does spatial-locality constrain the regime? Conjecture:

- *Strict regime* — bounded-range closure on finite spatial $E$ always reaches strict regime.
- *Scott-continuous regime* — bounded-range closure on countable $E$ in unbounded space reaches Scott-continuous regime.
- *Aperiodic regime* — only with unbounded-range closure, or with infinitary closure-rule-language, on uncountable $E$.

The deliverable: a spatial-locality theorem characterizing which regimes are reachable on which spatial structures.

### (10d) Network sheaves on spatial agent graphs

The corpus's [network-sheaf consensus on agent graphs theorem](../theorems/network-sheaf-consensus-on-agent-graphs.md) treats agent graphs as combinatorial only. Hansen et al's *Distributed Multi-Agent Coordination over Cellular Sheaves* (arXiv 2504.02049) treats them as cellular sheaves with nonlinear edge potentials encoding spatial-coordination objectives.

Sub-question 10d asks: extend the corpus's network-sheaf-consensus theorem with spatial / metric structure on the agent graph. The bilattice extension would give a *spatially-paraconsistent* consensus — agents distant from each other can hold contradictory information without immediate $\top$-firing because the spatial-locality of rules limits paraconsistent propagation.

### (10e) Lorentzian-causal embodied swarms

The corpus's existing [Lorentzian causal settling object](../objects/lorentzian-causal-settling.md) gives a relativistic-causal structure. In embodied-swarm terms, this corresponds to swarms where information propagates at finite speed (drone-to-drone radio range, light-speed-limited communication).

Sub-question 10e asks: develop the Lorentzian-causal-settling object beyond its current placeholder state. The interesting structural question: in the Lorentzian setting, the four-regime dichotomy should refine — settling regimes get a *causal-cone* structure, with timelike-separated cells receiving information at light-cone-bounded rates and spacelike-separated cells unable to coordinate.

This sub-question interlocks with the [continuum-Lorentzian limit question](continuum-lorentzian-limit.md) and the [Lorentzian apex-void as timelike-spacelike theorem](../theorems/lorentzian-apex-void-as-timelike-spacelike.md).

## What would settle the question

Five deliverables:

1. **Spatial-structure choice** (10a) — pick a starting candidate.
2. **Distance-weighted rule semantics** (10b).
3. **Spatial-locality regime theorem** (10c).
4. **Spatial network-sheaf consensus theorem** (10d).
5. **Lorentzian-causal embodied-swarm theorem** (10e).

Deliverables 1–2 are session-to-cluster scale. Deliverables 3–4 are cluster-scale. Deliverable 5 interlocks with existing corpus questions and is research-program-scale.

## Why this question

Embodied swarms are the largest application class for swarm theory in the engineering literature — robotics, drones, autonomous vehicles, sensor networks, biological-swarm modeling. The corpus's structureless-$E$ foundation does not engage these settings naturally. Lifting the foundation gives the corpus's bilattice / paraconsistent / cohomological apparatus access to:

- Spatially-distributed paraconsistent consensus (agents who disagree across space, with spatial-locality limiting the propagation).
- Spatial-locality refinements of the four-regime dichotomy.
- Lorentzian-causal swarm dynamics (at the speculative end).

What the corpus's machinery would yield specifically:

- *Bilattice-valued spatial coordination* — paraconsistent disagreement that respects spatial structure.
- *Cohomological invariants of spatial swarm dynamics* — the bitopological settling site already has paired Priestley spaces; spatial structure on $E$ propagates dually, giving a richer cohomological object.
- *Regime classification of embodied swarms* — specifically distinguishing flocking (typically strict / Scott-continuous), formation-control (Scott-continuous), pursuit-evasion (potentially aperiodic).

## Position in the program

This question is **adjacent to but not in** the [agentic-swarm-theory study plan](../narratives/toward-agentic-swarm-theory.md). It is a foundational extension that would underwrite spatial / embodied swarm content currently outside the plan.

It interlocks with:

- [Continuum-Lorentzian limit question](continuum-lorentzian-limit.md) — the existing relativistic-flavored continuum direction.
- [Continuous-L stochastic swarm dynamics question](continuous-L-stochastic-swarm-dynamics.md) — for distance-weighted-continuous closure rules.
- [Bilattice mean-field scaling-limit question](bilattice-mean-field-scaling-limit.md) — for spatial-graphon scaling limits.

This question stays `open` until 10a settles a starting spatial structure.
