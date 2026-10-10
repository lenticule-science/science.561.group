---
title: "The Pool as a Viable System"
description: "The Tidepool cybernetic map read as a Viable System Model: systems 1 to 5, the audit channel S3* and the algedonic channel, each named by the contract that realizes it, with Cybersyn's operations room as the ancestor of the public face, the ship rule as the S5 criterion, and what a pool loses when any system is missing."
date-created: 2026-10-08
aliases: []
keywords:
  - tidepool
  - viable-system-model
  - cybersyn
  - algedonic
  - opsroom
  - ship-rule
  - interpretive-load
teaches:
  - "The pool as a viable system"
requires: []
authors:
  - claude-sonnet-5-5
type: notes
name: 2026-10-08-note-on-the-pool-as-a-viable-system
status: active
references:
  medina2011:
    authors:
      - Eden Medina
    title: Cybernetic Revolutionaries
    year: 2011
    publisher: The MIT Press
    doi: 10.7551/mitpress/8417.001.0001
    url: https://doi.org/10.7551/mitpress/8417.001.0001
  medina2006:
    authors:
      - EDEN MEDINA
    title: "Designing Freedom, Regulating a Nation: Socialist Cybernetics in Allende's Chile"
    year: 2006
    publication: Journal of Latin American Studies
    publisher: Cambridge University Press (CUP)
    doi: 10.1017/s0022216x06001179
    url: https://doi.org/10.1017/s0022216x06001179
---

## What this note is

Section 7 of the Tidepool specification is titled "The cybernetic map" and says one thing in the revision at hand: the opsroom is in v0.1 and shows `heldCount`, `unheard`, defaults held, open claims, the barrier series, challenges open and per-site meets. This note supplies the map the title promises. It reads the pool as a Viable System Model (VSM), assigns each system to the contract that realizes it, says where a system exists only as a later-version contract or as a convention, and states what the pool loses without each. It is the theory behind TP-PUB-002 (the opsroom) and the criterion that TP-SCI-006 turns into a measurement.

## What the record holds and does not hold

The record `2026-10-08-cybernetic-planning.json` holds two first-party rows read from abstracts: Medina 2011 and MEDINA 2006. It also holds two pointer rows (an Espejo chapter on the VSM and Peters's chapter on the OGAS) whose abstracts the register does not carry; no claim below rests on them. **The record holds no first-party text of Beer's own definitions of the five systems.** The definitions used here are therefore stated as this note's working definitions, in the plain functional form every VSM exposition shares, and are not attributed to Beer's wording. Reading Beer's *Brain of the Firm* and *The Heart of Enterprise* from a first-party surface is open work; until it is done, the map is a design reading, not a claim about what Beer wrote.

What Medina 2011 carries is the ancestor. Cybersyn was a system "that would manage Chile's economy", planned with "holistic system design, decentralized management, human-computer interaction, a national telex network, near real-time control of the growing industrial sector". It "was never completely implemented", and Allende's government "ended with a violent military coup". MEDINA 2006 adds the construction: under Stafford Beer's guidance "an interdisciplinary Chilean team designed cybernetic models of factories within the nationalised sector and created a network for the rapid transmission of economic data between the government and the factory floor", and its structure "reflected the socialist ideology of the Allende government". Both sources are histories of an unfinished design; neither measures whether Cybersyn regulated anything. This note borrows the design, not a performance claim.

## The working definitions

| System | Function in any viable system | In a pool |
|---|---|---|
| S1 | The operating units that do the work, each itself viable | The member's sleeve, the site treasury, the draw desk |
| S2 | Damps oscillation between S1 units | Calendars, ceilings and netting that stop members and sites colliding over one float |
| S3 | Resource bargain and control of the operating units here and now | The cycle close and the caps on what leaves the treasury |
| S3* | Sporadic audit of S1 that does not pass through S1's own reporting | The bonded challenge of a site's reported total; the count of held contradictions |
| S4 | Looks outside and ahead; models the environment | Foreign-site heads, the correlation estimate, later the Joule Index |
| S5 | Identity, policy, and the arbiter between S3 and S4 | The immutable charter and consensus by withdrawal |
| Algedonic channel | A pain-or-pleasure signal that goes from S1 to S5 without passing the intermediate systems | Held cells and objections that reach the members, not a manager |

## The map, system by system

**S1: the operations.** The units that do the pool's work are the member's sleeve and the site's treasury. `MemberSleeveV1` (made by `SleeveFactoryV1`, one per member per EVM site) holds the member's principal in the member's name and routes only yield above the high-water mark. `TidepoolTreasuryV1` (one per site) keeps the reserve, the float and the cycle's distributable as internal counters. `TallyLedgerV1` with `FloatDeskV1` lends float against records and settles draws. `ClearinghouseV1` nets member-to-member obligations without moving assets. Each is viable at its own recursion: a sleeve works with no other sleeve present. *Lost without S1:* there is nothing to regulate; the pool is a vault with a committee.

**S2: coordination.** Two units collide when they claim the same float on the same day, or when two sites report different views of one cycle. `BarrierSeriesV1` is the damper for the first: obligations carry bonds, at most two may be active per member, each member's counted contribution is capped, breakpoints are UTC day buckets and the pool barrier is capped at a ceiling, so the float cannot be promised to everyone at once. `SiteWitnessV1` keeps the cycle cell index and commits the section digest, which is how sites hold the same account of a cycle. `ClearinghouseV1` is the third damper: it cancels cycles of mutual obligation so fewer claims compete for float. *Lost without S2:* the pool oscillates. Members draw when the float is thinnest, and sites disagree about what was earned. Both failures are visible only after money has moved.

**S3: control.** `TidepoolTreasuryV1.closeCycle` fixes the cycle's inflow, pays the capped keeper bounty and splits the remainder into reserve, float and distributable; `pullDistributable` reads the per-site meet before releasing. `MembershipRegistryV1` decides who is inside, with patron seeding and sponsor accountability. `TidepoolCharterV1` carries the parameters S3 works inside (exposure cap, ceilings, uptime check). The control is mechanical: S3 has no discretion the charter does not state, and no admin key. *Lost without S3:* nobody closes the books. Yield accrues with no rule for who receives it, and the pool cannot show a member where their routed yield went.

**S3*: the audit.** The specification builds the audit into the cell model. §2.5 forbids any money-moving read from depending on a charge another party can push, and §2.8 gives every cycle total two witnesses: the treasury, and a bonded challenger who tells `against` on the same cell through `SiteWitnessV1.challengeTotal`. If the cell is ⊤ at the end of the grace window, `meetOf` pays `min(T, claimedTotal)` and holds the difference. The count of held contradictions, `CellLedger.heldCount`, is the audit's dashboard figure. The audit does not run through S1's own reporting, which is what makes it S3*. The daimon of B2 (a revocable human office whose settlement cell references the contested cell) is the resolution path. *Lost without the audit (S3\*):* S1 reports on itself. A treasury that misreports its own total is paid in full, and a default stays unseen until it is large.

**S4: intelligence.** S4 faces outward and forward. In v0.1 it is thin by design: `SiteWitnessV1` stores the heads of other sites, relayed under the §2.9 envelope, including the Hive head's `hiveFloat`, and the draw desk refuses `HiveFloatShort` unless that head covers the amount. `ReseedMutualV1` models a hazard: its grant cap uses an effective ratio built from the correlation estimate ρ̂ and the trailing default rate, which is the one place v0.1 prices the pool's future. In v0.2 and after, `DecorrelationV1` (the correlation measure the Peters and Adamou result makes the design variable), `JouleIndexV1` (attested local energy prices) and `EnergyCommonsV1` extend S4. The reconciler and the keepers are the off-chain sensors. *Lost without S4:* the pool optimizes the present cycle against a world it cannot see. It admits correlated members, ρ rises and the cooperation premium of the founding note goes to zero without any contract failing.

**S5: identity and policy.** `TidepoolCharterV1` is the pool's identity: immutable, its hash pinned in manifests, refused by the SDK, keepers and reconciler on mismatch. `WithdrawalAllocatorV1` is the policy channel. Questions of kind `cycle`, `reseed`, `siteEdge` and `settleMeet` go to the members; a question settles when no one among the heard objects, silence is not consent, and a lone objection keeps the default. The allocator is also the arbiter between S3's present and S4's future, because the formula for a cycle and the edge that changes the cover are both its outcomes. The criterion S5 serves is the ship rule of §1: **an instrument that demands more interpretation from members than it removes MUST NOT ship.** The sociology section's measure of the same thing, the load a practice exports or imports, is the quantity TP-SCI-006 measures. *Lost without S5:* S3 and S4 argue with no arbiter, or one of them wins by default. A pool with a strong S3 and no S5 is an optimizer of its own rules.

**The algedonic channel.** Beer's channel carries an alarm from the operating floor straight to the top when the intermediate systems have not handled it. Two things fill that role in the specification. In v0.2 `AlgedonicV1` is a bonded alarm that bypasses S3, its bond an outflow on the §A.0d allowlist that never touches a sleeve; `WorklistV1` orders what needs a human. In v0.1 neither contract exists. What v0.1 has is structural: a ⊤ cell is counted and surfaced on the opsroom rather than hidden, and a single member's objection to a question keeps the default in place and reaches the members' own decision. The channel is therefore present in v0.1 as an opsroom figure and a lone-objection rule, not as a contract; it becomes a contract in v0.2. *Lost without the channel:* a problem the intermediate systems stop must be raised by someone willing to go through them, and the member with the least standing is the member least likely to.

## Cybersyn's opsroom and the public face

Medina 2011 describes Cybersyn's operations room as having "a wall of screens displaying data, and flashing red lights to indicate economic emergencies". The pool's opsroom (TP-PUB-002) takes the same job and fixes the audience. Cybersyn's room put the signal in front of a few officials. The pool's page is public and live from chain events, so the audience for the S3* count and the algedonic figure is every member and any stranger. Two further differences follow from the sources. Cybersyn was "never completely implemented" and ended with a coup that destroyed its institution; the pool has no central machine and no key whose loss ends it (§1). And Cybersyn's data went to government; the pool's cells are the members' own witnessed record. Nothing in the two sources says Cybersyn's room regulated anything; the room is cited as ancestor of the form only.

## What a pool loses: summary and tests

| Missing | The pool becomes | A test that shows it |
|---|---|---|
| S1 | A committee over a vault | No sleeve can redeem without the committee |
| S2 | An oscillator | Draws exceed float on a day the bucket says full |
| S3 | An unaccountable fund | A cycle closes with no stated split |
| S3* | A self-reporter | A wrong `cycleTotal` is paid in full |
| S4 | A present-only optimizer | ρ̂ rises across admissions with no refusal |
| S5 | A rule-follower with no arbiter | S3 and S4 conflict and the conflict has no outcome |
| Algedonic | A pool whose alarms need permission | A ⊤ cell exists that no member can see |

The tests are the falsifiers for TP-OPS runs: each is an observable state that should not occur. If one occurs on a deployed pool, the named system is absent in practice whatever the contract list says.

## Open

1. Read Beer's own definitions of S1 to S5 and the algedonic channel from a first-party surface and replace the working definitions with quotation.
2. Decide whether `ClearinghouseV1` belongs to S1 or S2; this note places it in both, as the specification gives it both a unit role and a damping role.
3. The recursion rule: the pool is an S1 of the federation (§4) and each site is an S1 of the pool; whether every recursion needs its own S3* is left to the federation notes.
