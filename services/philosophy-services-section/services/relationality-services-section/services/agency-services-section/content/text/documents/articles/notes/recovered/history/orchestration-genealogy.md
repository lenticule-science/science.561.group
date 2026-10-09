---
date: 2026-05-29
kind: derivation
status: authority-for-the-orchestration-vocabulary in swarm-intelligence
builds-on: docs/GENEALOGY.md
scope: development/experimental/swarm-intelligence
---

# Orchestration genealogy: a conductor is a restricted character in an orchestration-governed ensemble

`docs/GENEALOGY.md` settled *where* the swarm/claude-code cut falls. This doc settles the **internal
categorical vocabulary** the swarm needs so that "conductor" is not a primitive but a **derived
restriction**: one type of character, in one type of swarm restricted into an ensemble, operating
under orchestration as its governance theory (user directive, 2026-05-29).

Everything below is highlighted as a **real category (object)** or **real morphism**, placed by the
one rule (which has to exist for the other? — that one generates, goes left/above). Existing swarm
$things are reused; missing ones are built; restriction machinery copies the ideas from voidmath's
`transferring`/`saturating` nuclei.

## The objects and the morphisms that generate them

A morphism generates its object (as `predicating` generates `predication-cell`). The spine:

| morphism (generator) | generates → object | gloss |
|---|---|---|
| **characterizing** | **character** | produce a persona/agent-bearer that can become a player |
| **forming** | **formed-collective** | form a collective out of characters (∼ voidmath `expanding`: parts → family) |
| **restricting** | (a sub-thing) | the restriction generator (variance: restriction; ∼ voidmath `transferring`/`saturating` nuclei) |
| **governing** | **governance** | edit the office-graph; a governed-coordination theory |
| **operating** | (operation events) | run one cycle of a collective (= existing `iterating-operations-loop`) |
| **orchestrating** | **orchestration** | governing *restricted* to the orchestration theory |
| **conducting** | **conductor** | operating *restricted* to the orchestrating office, held by a character |

## The restricted-formings: swarm and ensemble

`forming` makes a general collective. **swarm** and **ensemble** are both **restricted formings** —
`forming` followed by `restricting`:

- **swarm = restricting(forming)** — a formed collective restricted to participants sharing a
  federation + settling + recognition discipline. (Existing `swarm.schema.json` is this object; we
  reframe it as a restricted forming.)
- **ensemble = restricting(swarm)** — a swarm further restricted: coordinated under a single
  governance theory, with a recognized coordinating office. The ensemble is the unit that *operates*.

So: `characterizing → character`, then `forming` over characters → collective, then
`restricting` → swarm, then `restricting` → ensemble. Each `restricting` step declares its forgotten
axes (per `spotcomp/GENERATOR-VARIANCE.md`): swarm forgets ungoverned membership; ensemble forgets
swarms without a single governance theory + coordinating office.

## Governance, orchestration, operating

- **governing → governance** — governing edits the office-graph; governance is the resulting theory
  (existing `governance.schema.json`). Governance is substrate: an edit is a predication insertion
  that changes behavior on the next `operating` tick.
- **orchestration = restricting(governance)** — orchestration is *one* governance theory: the one
  whose office-graph has a single recognized coordinating office (the conductor) that dispatches and
  reconciles. **orchestrating = restricting(governing)** — the governing act restricted to that
  theory.
- **operating** — what an ensemble does under its governance (= existing `iterating-operations-loop`:
  heartbeat → dispatch → mode → tick → cost → audit, one cycle, regime-tagged witness rows). An
  ensemble has to exist for operating to mean anything, so `ensemble` generates `operating`.

## The conductor, derived

- **conductor = restricting(character)** — a conductor is a character restricted to hold the
  orchestrating office within an orchestration-governed ensemble. It is **not primitive**: it is one
  type of character, recognized (via existing `recognizing-an-agent-as-holding-office`, monotone,
  Scott-continuous) into the coordinating office.
- **conducting = restricting(operating)** to the orchestrating office — what the conductor does:
  orchestrating enacted across one operating cycle (dispatch the fungible enactors, reconcile their
  settlements by knowledge-meet, trigger dreaming, allocate budget).

So **claude-code is a conductor = a restricted character** holding the orchestrating office of an
ensemble that is a restricted forming of characters, operating under orchestration governance. This
replaces the earlier "leader flag" framing in `docs/GENEALOGY.md` §3 / the agentic-profile: the
leader/conductor is *derived by restriction + recognition*, exactly as the theory demands.

## Grounding from the lab surveys (copy these ideas, don't reinvent)

The lab's `surveys/` corpus (agentic-characters, ai-characters, autonomous-agents-and-swarms,
kyriarchical-agentics, orchestration-vs-choreography, tiyospaye-is-agentic-drone-swarm) settles the
real shapes:

- **character is a χ-nucleus.** A character is an agentic system carrying a stable disposition: a
  nuclear endomorphism `χ : H → H` on its behavioral fiber — *idempotent, monotone,
  inflationary* — with `F_χ = Fix(χ)` the behavioral space it endorses. "In character" = `χ(a)=a`;
  "out of character" = `χ(b)≠b`. The persona/character/role triad: **role** = capability-signature
  `Σ_R` (what it may do); **character** = the nucleus χ (how it does it); **persona** = the entity
  bearing it. So `characterizing` produces a χ-nucleus over a role.
- **forming is parallel composition `∥`** — the monoidal product on arenas; the algebraic shape of
  scale relations between coordinated participants (confederation across scales). `restricting` is the
  voidmath nuclear pair: `transferring` (Δ_t) and `saturating` (σ_t), inflationary closures with the
  commuting square `σ∘Δ = Δ∘σ`; in a swarm it also shows up as formation constraints and the
  withdrawal/refusal comodality (`iyúhá-šni`: discard on the negative side without violating no-copy
  on the positive side).
- **governance is a CATEGORY `Gov`, not a single thing.** Objects `G = (M_G, μ_G)`: a symmetric
  colored multicategory whose objects are *positions* and morphisms are joint *acts*, with a
  self-action `μ_G` encoding how acting revises the act-system. Its objects are **governance theories**,
  and they are genuinely different:
  - **orchestration** — centralized locus of control: a single coordinator (the conductor) is the
    agent-subject; the others are patients. Trades *visibility* for *bottleneck risk*.
  - **choreography** — distributed: each participant follows a shared protocol, responds to and emits
    events; no distinguished coordinator. Trades *scalability* for *opacity*.
  - **kyriarchical** — apex *captain* + scope-bounded, revocable delegation chain; accountability is
    `H⁰`-invariant under chain extension (delegating authority does not transfer answerability).
  - **kin-relational (wolakȟota)** — authority is recognized *conduct* (the *naca*), standing = the
    meet of member recognition-cells, bounded by the right of withdrawal. **The 561 Group's own
    meta-governance is this one.**
  So `governing` is the act in `Gov`; **orchestration is ONE object**, chosen here for the ensemble
  because the conductor wants visibility — *not* a default. A conductor is the orchestration object's
  coordinator role; its analogues are captain (kyriarchical) and naca (kin-relational), and
  choreography has none.
- **operating** is the loop: think → emit witness → let the substrate work many closure steps → think
  again (the aperiodic aim-frontier dispatch; CTDE — centralized decision, decentralized execution).

So the precise statement: **conductor = `restricting(character)` to the orchestrator position of an
`ensemble = restricting(swarm)` whose governance is `orchestration`, one object of `Gov`.** The
recast must encode locus-of-control as the discriminator so other governance theories
(choreography/kyriarchical/wolakȟota) are siblings, not afterthoughts.

## Build map (reuse vs. build)

- **Reuse:** `swarm`, `governance`, `office`, `recognizing-an-agent-as-holding-office`,
  `iterating-operations-loop` (operating), `agentic-system`/`agent-community` (forming codomains),
  `binding-character-to-player`.
- **Build (real $things, placed by the rule):** `characterizing`→`character`; `forming`;
  `restricting` (copy voidmath `transferring`/`saturating` nuclei: Δ_t transfer, σ_t saturation,
  commuting square); `ensemble`; `governing`; `orchestrating`→`orchestration`;
  `conducting`→`conductor`.
- **Variance honesty:** swarm/ensemble/orchestration/conductor are **restriction** generators (cite
  forgotten axes); the κ-band + nucleus proofs are asserted from voidmath/lab, so the cluster is
  placed under `hacking/` until those land.
