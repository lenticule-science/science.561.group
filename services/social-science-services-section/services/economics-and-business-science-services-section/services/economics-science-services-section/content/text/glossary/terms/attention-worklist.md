---
description: "Specification for a finite-budget obstruction-selection list, not an observed WIT-of-ACK or a verified on-chain implementation."
identity: attention-worklist
name: Attention worklist
date-created: 2026-10-08
status: specification
relations:
  uses:
    - tally-credit
    - pay-the-meet
---

# ATT allocation worklist

**Inputs:** obstruction universe `U=[o₁,…,oₙ]`, cost
`c_i∈ℕ`, benefit `v_i∈ℕ`, finite agent budget `B∈ℕ`.
A candidate `S⊆U` is feasible iff
`∑_{o∈S}cost(o) ≤ B`. Selection maximizes
`∑_{o∈S}benefit(o)`; residual benefit is
`totalBenefit(U)−totalBenefit(S)`. The proved
[allocation/solver](https://github.com/lenticule-science/science-services-section/tree/main/services/social-science-services-section/services/economics-and-business-science-services-section/services/economics-science-services-section/lib/obsmetrologia-economics/ObsmetrologiaEconomics)
specifies a bounded finite search, not a deployed Tidepool contract.
A submitted solution's mathematical feasibility and optimality
are distinct from an on-chain verifier actually receiving it.

An unacknowledged release half of an **economic tally** is a candidate
obstruction. Match requires the same case and its independent
admission half; a pool cannot self-mint the missing ACK. A contested
cell `⊤` may also be an obstruction. The worklist records which
candidate resolution acts a bounded agent can afford; **the worklist
is not itself ATT(w,a)**. A specific ATT of a counterparty ACK
still requires a second-order witnessed transition.

**Status:** Tidepool's Tidepool's B9 worklist specification (Causeway Public Services; cross-repository source identity and receiving unverified in this Science checkout)
is design evidence; this entry does not establish that contract
verification, transaction clearing or user receipt occurred.
