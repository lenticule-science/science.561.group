---
title: "Federation Topology Against Poverty Traps"
description: "The lattice result of Wand et al. 2024 (everyone gains; rich and poor clusters persist; a rich agent collapses without rich neighbours) read as the Tidepool federation's design rule, the Očhéthi Šakówiŋ reading restricted to Ω1, Ω2, Ω4 and Ω6 as the Lakota section's two structure documents hold them, and the statement of Federation.edge_admitted_iff_sharing_and_reduction for TP-LEAN-019."
date-created: 2026-10-08
aliases: []
keywords:
  - tidepool
  - federation
  - poverty-trap
  - network
  - lattice
  - decorrelation
  - ocheti-sakowin
  - omniciye
teaches:
  - "Federation topology against poverty traps"
requires:
  - ergodicity
authors:
  - claude-sonnet-5-5
type: notes
name: 2026-10-08-note-on-federation-topology-and-poverty-traps
status: draft
references:
  wand2024:
    authors:
      - Tobias Wand
      - Oliver Kamps
      - Benjamin Skjold
    title: "Cooperation in a non-ergodic world on a network: insurance and beyond"
    year: 2024
    publication: arXiv:2403.12095
    doi: 10.48550/arxiv.2403.12095
    url: https://arxiv.org/abs/2403.12095
  petersadamou2018:
    authors:
      - Ole Peters
      - Alexander Adamou
    title: An evolutionary advantage of cooperation
    year: 2018
    publication: arXiv:1506.03414v2
    url: https://arxiv.org/abs/1506.03414
---

## What this note is

Task TP-SCI-003 of the cooperative-pooling roadmap. Section 4 of the 2026-10-08 specification of the Tidepool protocol says a community deploys its own pool and that pools in a federation are parties to one another (§3 B1). It adopts a topology rule "from Wand et al." and a reading of the Očhéthi Šakówiŋ restricted to Ω1, Ω2, Ω4 and Ω6. This note states what the source for the rule establishes, derives the rule from it and from the two-party sharing test of the founding note, restricts the Lakota reading to what the Lakota section's two structure documents hold, and states the Lean theorem for TP-LEAN-019. Every outside claim cites a row of the `ergodicity-and-pooling` record by its label.

## What the lattice paper establishes

Wand et al. 2024 (Wand, Kamps and Skjold) is a simulation: 4096 agents on a 64 × 64 periodic square lattice with coordination number four, run for 200 time units, with insurance contracts restricted to lattice neighbours. The record carries two findings.

1. Under the neighbour restriction every agent still profits from cooperating. The source: "Under these restrictions, we still find that all agents profit from cooperating through insurance."
2. Clusters of rich and poor agents emerge endogenously and the inequality persists. The source: "clusters of poor and rich agents emerge endogenously on the two-dimensional map and that wealth inequalities persist for a long duration, consistent with the phenomenon known as the poverty trap." The record adds that a rich agent collapses unless other rich agents are nearby to insure it.

The record does not carry the size of the per-agent growth gains, which the source gives only in figures. The result is a simulation on one regular lattice. The record holds no field measurement of a federation of pools, and the founding note's first falsifier (no measured pooling gain in an operating cooperative) applies to federation too.

## The design rule

The rule is the house's reading of the two findings together with the premium formulae of Peters & Adamou 2018.

- **Why edges matter.** In the pooled-growth formulae the design variable is the correlation ρ of members' shocks, and the gain is zero at ρ = 1 (Peters & Adamou 2018: "cooperation relies on diversity in individual outcomes"). A neighbour who is exposed to the same shocks as the pool adds membership and no premium. Wand et al. 2024 show the same fact in space: where the neighbours are alike the cluster stays poor, and a rich agent's survival depends on neighbours who can insure it.
- **Rule.** A federation edge between two pools is admitted when the two-party sharing test of Peters & Adamou 2018 holds for the pair and the edge reduces the pair's pooled variance. Edges bridge clusters that differ in variance and wealth. Edges inside a cluster of like pools are the edges the reduction does not select.
- **What the rule does not say.** It does not say which pools are rich and which are poor, and it does not set a threshold. The sharing test is a condition on the pair's drift and volatility, μ₁ − 3σ₁²/4 < μ₂ − σ₂²/4 for the faster grower first, and the reduction is the pair's marginal reduction of pooled variance, both named in the Lean module `Decorrelation` of the founding note. Estimating μ, σ and ρ for a pool is a measurement the protocol makes after launch.

The specification schedules the registry and the federation mutual (`FederationRegistryV1`, `FederationMutualV1`) for v0.3 and the Lean module `Federation` with them. In v0.1 and v0.2 a federation is the deploy script and the clearinghouse (§3 B1: pools in a federation are parties).

## The Očhéthi Šakówiŋ reading, restricted

The specification restricts the reading to four rules: Ω1, Ω2, Ω4 and Ω6. The statements below are read from the Lakota section's two structure documents, `oceti-sakowin.md` and `omniciye-council.md` (in `lakota-services-section`, under `lakotaean-governance/philA/code/structures/`), and from nothing else. Both carry `status: draft`. They are the section's structural model of the confederacy and of its council. The `lakota-and-indigenous-economy` record has a frame and no source rows and no searches at this note's date, so no literature claim about Lakota governance or economy rests on it, and this note makes none.

- **Ω1, aggregation.** The document states the rule as a conjunction over the seven divisions: the confederacy exists when the seven divisions recognize the confederacy and each other, and the lapse of one division's cell does not collapse the confederacy entirely. Read for the federation: a pool's lapse is a lapse of one party, and the federation's existence is the conjunction of its members' recognitions, not a single custodian's state.
- **Ω2, great council on conditions.** The document states that the great council is convened by conditions (treaty negotiation, joint war, cosmological emergency) and that convening it was a polity-scale event. Read for the federation: the federation's joint body convenes on named conditions and not on a standing schedule. The specification's mechanism for deciding a joint question is A4 consensus by withdrawal.
- **Ω4, inter-division kinship.** The document states inter-division kinship as the structural glue of the confederacy, firing as marriages accumulate. Read for the federation: the glue is the accumulation of pairwise relations. For Tidepool the pairwise relation is an admitted edge, which is why edge admission is the rule this note states.
- **Ω6, health.** The document states that the confederacy is in wicozani when the per-division conditions hold and the inter-division kinship structure has no persistent contradictions. Read for the federation: the federation is healthy when each pool's own conditions hold and its edges carry no persistent contradiction. The specification names no federation-level health reading; this one is the note's.

The council document states that at confederacy scope whole divisions, not individuals, can withdraw from a question under consensus-by-withdrawal. That is the same mechanism the specification adopts in A4 at pool scope, here at federation scope with pools as the withdrawing parties.

What this reading does not claim: that the confederacy worked as a risk-pooling arrangement, that any Lakota institution was designed against poverty traps, or anything about present-day Lakota governance. The two documents describe a structural model, and the mapping to pools is the house's design reading.

## The Lean statement

For TP-LEAN-019, module `Obsmetrologia.Economics.Federation` (file `ObsmetrologiaEconomics/Federation.lean`, to be written; no file exists at this note's date), the theorem

`Obsmetrologia.Economics.Federation.edge_admitted_iff_sharing_and_reduction`

states: for two pools a and b with parameters (μ, σ, ρ) in the scaled integers of `Decorrelation`, the edge {a, b} is admitted by `Federation.admitted` if and only if `Decorrelation.shouldShare` holds for the pair (4μ₁ − 3σ₁² < 4μ₂ − σ₂², with the faster grower first) and `Decorrelation.marginalReduction` of the pair is strictly positive. Corollaries stated with it:

- `Federation.edge_not_admitted_at_full_correlation`: if ρ ≡ 1 between the pair, the reduction is zero and the edge is not admitted. This is the `Decorrelation.premium_zero_iff_perfect_correlation` case.
- `Federation.edge_not_admitted_between_equal`: a pool is not admitted to an edge with an identical pool. This is `Decorrelation.shouldShare_irreflexive_at_equal`.

The exact types of `Federation.admitted` are the Lean task's to fix; the specification's Appendix B lists the module as "as revision 2" without declarations, so this statement is the note's proposal for that task and not a copy of a prior one.

## Left open

- The record holds no measurement of a federation of pools and no source on which pools in an actual set of communities are rich or poor in the lattice paper's sense. The topology rule is a design reading of a simulation.
- The lattice has coordination number four. The record does not say how the result changes with other degrees or with edges that are not local, and the federation's graph is not a lattice.
- The `lakota-and-indigenous-economy` record is empty. A literature measurement of Lakota and Native economic and governance practice remains to be run before anything beyond the two structure documents is said.
- `FederationRegistryV1` and `FederationMutualV1` are v0.3 contracts. This note gives their admission rule and nothing about their funding.
