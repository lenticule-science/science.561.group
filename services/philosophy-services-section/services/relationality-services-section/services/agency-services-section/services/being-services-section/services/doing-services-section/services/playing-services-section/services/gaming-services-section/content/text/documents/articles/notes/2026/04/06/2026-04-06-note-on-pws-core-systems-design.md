---
title: PWS Core Systems Design
description: Implementable specifications of PWS core systems via reduction rules R1-R23, Rosetta structure mappings, and Curry-Howard-Lambek correspondence across computation, logic, topology, and physics.
date-created: 2026-04-06
type: note
name: pws-core-systems-design
keywords:
  - settlement-engine
  - reduction-system
  - rosetta-structure
  - nuclear-quartet
  - curry-howard-lambek
  - respond-composition
specialization: plan
application: world-sim
architecture-note: Application sublocale, not OS infrastructure — see applications-as-sublocales analysis
project: predication-world-sim-project
serves-system: fars
work-type: derivation
horizon: month
owner: first-officer
priority: "2"
depends-on: [pws-math-mining, foah-engineering-overhaul]
also-serves:
  - "foah-engineering-overhaul: \"The perception and action systems are the same respond() patterns that bridge/dispatch/plan-status use\""
  - "sunday-funday-sprint: \"Quest rendering IS the perspective renderer applied to task entities\""
---

Each system is a respond() composition over the algebra. None requires game-specific code. The idea file (predication-world-sim.md) describes all 8 systems conceptually. This plan turns those descriptions into implementable specs.

## The settlement engine IS the reduction system R1-R23 (Part 87, mined 2026-04-06)

The nuclear language reduction system is the COMPLETE formal specification of settlement:

**R1-R6 (modal identity/top):** σ(σ(M))→σ(M), Δ(Δ(M))→Δ(M), σ(M∧N)→��(M)∧σ(N), Δ(M∧N)→Δ(M)∧Δ(N), σ(⊤)→⊤, Δ(⊤)→⊤.

**R7 (nuclear commutation):** σ(Δ(M))→Δ(σ(M)). Canonical form: Transfer OUTSIDE, Saturate INSIDE. Process past before future.

**R8-R13 (disjunction absorption):** σ(σ(M)∨N)→σ(M∨N), etc. Nucleus distributes through disjunction with itself.

**R14-R19' (meet absorption):** σ((σ(M)∧σ(N))∨P)→σ((M∧N)∨P), etc. Including cross-type.

**R20-R23 (R7 closure):** Δ(σ(Δ(M)∨N))→Δ(σ(M∨N)), etc. Close all critical pairs involving R7 and Transfer-outer absorption.

**Properties:** Sound, strongly normalizing, confluent → every term has a UNIQUE normal form. Termination witnessed by (TermNuclearWeight, NestingDegree) lexicographic order.

For the settlement engine: each tick applies the 23 rules to every unsettled entity until reaching normal form. The stuck forms σ((Δ(M)∧Δ(N))∨P) and Δ((σ(M)∧σ(N))∨P) are where genuine cross-nuclear interaction remains unresolved — these are the entities still "in play."

## The Rosetta structure: every system is four systems (Part 267, mined 2026-04-06)

By the Baez-Stay correspondence, each of the 8 core systems is simultaneously:

| System | Computation (Algebra) | Logic (Language) | Topology (Geometry) | Physics (Dynamics) |
|---|---|---|---|---|
| Entity mgmt | Type creation | Proposition introduction | Point insertion | State preparation |
| Perception | Function evaluation | Proof checking | Section restriction | Observable measurement |
| Action | Program execution | Proof construction | Cobordism attachment | Evolution application |
| Settlement | Term normalization | Cut elimination | Gluing/sheafification | Equilibration |
| Perspective | Pretty-printing | Proof display | Chart rendering | State readout |
| History | Call stack | Proof history | Path tracing | Time evolution |
| Multiplayer | Concurrent execution | Multi-proof | Disjoint union | Tensor product |
| NPC | Automated program | Automated proof | Autonomous manifold | Self-evolving system |

Settlement = cut elimination = sheafification = equilibration. These aren't metaphors — they're the SAME operation in four registers. This is why the game needs no special code: the algebra already does everything in all four modes simultaneously.

## CHL = Nuclear Quartet (Part 39, mined 2026-04-06)

The Curry-Howard-Lambek correspondence maps EXACTLY onto the nuclear quartet:

| CHL column | Nuclear quartet | Term form | What denotes in |
|---|---|---|---|
| Type theory | H_t (free carrier) | M (no nuclear operators) | Full fiber |
| Logic | Fix(σ_t) (saturation-stable) | Saturate(M) | Past-stable sub-algebra |
| Category theory | Fix(Δ_t) (transfer-active) | Transfer(M) | Future-active sub-algebra |
| Domain theory | H*_t (doubly stable) | Transfer(Saturate(M)) | Fixed fiber |

**R7 IS CHL normalization:** σ(Δ(M)) → Δ(σ(M)) enforces the canonical CHL column order: logic (σ) before category theory (Δ). Strong normalization of R1-R23 = CHL normalization always terminates.

**Why exactly four:** The submonoid M(σ,Δ) under composition has exactly four elements: {id, σ, Δ, π}. Forced by idempotence + commutativity. Without commutativity, alternating compositions don't stabilize and there is no fourth column.

**Tower Fiber Seeding:** H*_t at level n = H_t at level n+1. Domain theory output feeds type theory input. The hyperverse tower IS CHL iterated. Each level is a fresh CHL orbit with new nuclei.

**Entanglement = cross-nuclear ordering work (Part 73):**
- ent(M∧N) = ent(M) + ent(N) — conjunction shares no settling work
- ent(σ(M)) = ent(M) + kc(M) — saturating costs one unit per Transfer occurrence
- Normal forms have ent = 0 — fully settled = zero entanglement
- The entanglement measure IS the CHL normalization distance

## Necessitating structure (Part 295, mined 2026-04-06)

Three levels of necessitation ground the core systems:
1. **Prefix order necessitates restriction maps** — the history structure FORCES propositions to be comparable across time. The game's save system exists because history forces it.
2. **Nucleus necessitates stability** — the settlement operators FORCE active layers to exist. The endgame exists because the algebra forces it.
3. **Topology necessitates coherence** — the covering structure FORCES local consistency to become global. Multiplayer consistency exists because the sheaf condition forces it.

| System | respond() pattern | Voidmath structures used |
|--------|------------------|--------------------------|
| Entity management | parseFile() → entity with fiber | F1 (histories), F2 (grade) |
| Perception | respond(entity, environment) filtered by sensory predicates | Umwelt = non-⊥ region of respond() |
| Action | respond(target, {channel, payload}) | I.6 (composition gap = new reach) |
| Settlement engine | collect firable (F4.1), fire (F3.1), settle | F5 (four positions), F6 (non-confluence) |
| Perspective renderer | respond(entity, perception-result) → text description | Fiber → natural language |
| History | entangled pairs (F8), bypass cones (F7) | "what if?" = cone query |
| Multiplayer | multiple entities → one tick → one settlement | MASH: many agents, one graph |
| NPC | respond(npc-goals, npc-perception) → action | Same algebra, different message source |
