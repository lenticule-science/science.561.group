---
title: Voidskiff Multiplayer Terminal Game Design
description: Design documentation for a Rust-based telnet multiplayer space game, covering Karst cluster geography, eight player lineages with distinct teachings, and core gameplay.
date-created: 2026-04-13
type: note
name: voidskiff-multiplayer-terminal-game
keywords:
  - morphism-mechanics
  - player-lineages
  - karst-cluster
  - world-systems
  - play-loop
specialization: idea
source: sunday-funday-design-session
serves: [paradigm-applications, ordering-first-computation, endeavor-resource-planning]
related-ideas:
  - fars-voidmath-geometric-computation
paracosm-sources:
  - operations/command/personnel/emsenn/projects/writing/fiction/okaga/triage/slop/okaga/okaga-comes-to-ben.md
target-location: operations/science/research/voidskiff/
implementation-language: rust
genre: [elite-lineage, mud, persistent-multiplayer]
math-corrections:
  - Older docs cite Fibonacci/golden-ratio for ghost-quotient compression scaling. Correct constant is the plastic number ρ ≈ 1.3247, limit of the Padovan recurrence a_n = a_{n-2} + a_{n-3}. Padovan governs both the finite algebra and infinite coalgebra of voidmath.
  - Voidmath and the bilattice are the same math at different vocabulary; the bilattice is voidmath's settled face.
---

A multiplayer terminal space-game where the substrate IS the game. Built in Rust, one binary, telnet-in. The Karst is a place; spore-respawn is the spine; combat is claim-injection; the economy runs through the wavefront; players teach each other by writing morphisms.

The project directory `operations/science/research/voidskiff/` does not yet exist — to be created when implementation begins. This plan is read-only.

---

## 1. The Karst — the place the game is set in

The Karst is a ~120-system cluster in the Okagan paracosm, light-millennia from the Ben events. Karst-terrain metaphor (a collapsed limestone plexus) is load-bearing: the Karst is what's LEFT after the mycorrhizal trade-plexus's central coherence-reservoirs folded. The event is called **the Subsidence**, three generations gone. Everyone you meet has a theory about why it happened; nobody has the whole story. That missing story is the long-tail mystery arc for players who stay.

### Live systems (authored; busy)

1. **Cap-Horizon** — the survivor capital. A gas-giant-orbit ring station (Anastomosis Hub Prime, "the Prime"). Mycorrhizal-clade seat. Expensive dock fees, thick with patrol skiffs. Black-market just two hops out. Noisy substrate — thousands of live claims/second.
2. **Ostiole** — a tidally-locked rocky system around a white dwarf. One station, "Quiet-on-the-Rim," run by forsaken hermits. Low traffic but the substrate is dense with old, strange morphism declarations left by passing hermits. Library system; players come to learn.
3. **Cordyceps Reach** — twin-star system. The Hartig Net's main node. Heavy trade, contested; Quires raids average one every few days. Cargo hub.
4. **Septa** — six ring-stations in a shepherded asteroid belt. Culturally plural, one station per clade. Neutral ground by long treaty; dueling rings and arbitration courts. Where player-vs-player disputes get settled in-lore.
5. **Volva-Minor** — frontier live system bordering drift voids. Last fuel before the deep Karst. Weathered, friendly. Mission-rich.

### Sinkhole systems (procedural framework, authored keystones)

6. **Thrombus** — a sinkhole around a binary pulsar. The Subsidence's suspected origin. Lift-loss here is severe (~40% per fusion). Wreckage-dense. Saprotroph fleet homewater. Anyone who claims to have crossed Thrombus and remembers what they saw is lying or enlightened.
7. **Hollowshield** — a dead-quiet sinkhole. One moon-sized mycelial ruin drifts through it, largest single intact dead-organism in the cluster. Strange ghost-quotients; compasses (sensors) lie inside 3 AU.
8. **Mitre-Deep** — sinkhole where the Ostiole Quiet's founder allegedly still drifts, centuries old. Pilgrimage site.

### Drift voids / routes

9. **The Pleurotus Chain** — a string of still-traversable short-hop routes connecting Cap-Horizon → Septa → Cordyceps. Policed by the Hartig Net. Toll zone.
10. **Anthrax Straits** — between Volva-Minor and Thrombus. Quire hunting ground. Where new captains learn fear.

### Named lineages

- **The Hartig Net** — mycorrhizal trade-clade. Bureaucratic, patient, multilineally wealthy. Voice: legalistic. Goal: monopoly on the Pleurotus Chain; reopening a route to Thrombus. Grievance: the Quires, who keep killing their couriers. Teach: specialization morphisms (how to be many things in one skiff).
- **The Anthrax Quires** — parasitic raiders. Named for the black fruiting-body. Voice: threats in couplets, oddly formal. Goal: harvest mycelial substrate from dying skiffs; breed. Grievance: the Hartig Net for policing the Straits. Teach: inversion morphisms (weaponized) — but only if you survive an anastomosis.
- **The Ostiole Quiet** — forsaken hermits. Voice: fragmentary, mostly silence; speak in sensed claims not words. Goal: nothing legible to outsiders. Grievance: noise. Teach: fusion morphisms (the rarest, most dangerous).
- **The Cordycipit Order** — militant mycorrhizal. Split from Hartig Net 40 ticks ago over Thrombus policy. Voice: zealous. Goal: re-cultivate Thrombus by force-of-claims. Grievance: Hartig Net as traitors. Teach: constraint morphisms.
- **The Sclerotic Choir** — saprotroph fleet. Voice: choral, always plural "we". Goal: arrive first at every dying skiff in the Karst. Grievance: the Quires poach their carcasses. Teach: composition morphisms (threading routes through wreckage).
- **561-group-finance-operations-services-sectionder Cartel** — neutral smugglers. Voice: transactional, warm. Goal: move anything anywhere for coin. Grievance: the Net's toll zones. Teach: implication morphisms (cause-and-effect shortcuts).
- **Russula Bloom** — an upstart mycorrhizal cooperative in Volva-Minor; democratic, ragged, loved by new captains. Voice: collegial, earnest. Goal: build a second plexus independent of the Net. Grievance: the Net extortion rates. Teach: basic morphism hygiene (safe declaration practice).
- **The Stinkhorn Few** — parasite splinter; fewer than thirty skiffs, deeply feared. Voice: single-word replies. Goal: unknown. Grievance: existence. Teach: nothing willingly; rumored to know seventh morphism class the engine does not implement.

Players form opinions about these. Aligning with Russula Bloom vs. Hartig Net is a real choice with real consequences for what missions, what ports, what prices.

---

## 2. Play loop at every scale

### First login (15 minutes)

You telnet in. You pick a captain name and a seed lineage (Russula Bloom is the default newcomer-pick). You're presented with a short **kernel myth** — two paragraphs about the voidskiff as mycelial craft and the Karst as what-comes-after. Then:

- You spawn at a **public reservoir spore** in Volva-Minor's Bloom hub. Your skiff is small, substrate lean, three morphism declarations seeded from your lineage.
- A tutorial NPC ("Keeper Oys of the Bloom") asserts a job into the substrate and invites you to accept. The job is to carry a crate two hops down the Pleurotus Chain.
- You `look`, `sense`, `accept job-0`, `undock`, `chart`, `hyphal-fuse cap-horizon`. You feel the lift-loss number tick.
- You arrive, dock, deliver, earn credit-claims. You learn `sporulate` and drop your first spore. You log off.

### A 30-minute experienced session

You log back in, spawn from your Cap-Horizon spore. You check the lineage-news feed (substrate query over claims tagged `(news, concerns, <lineage>)`). Quires raided a Net convoy near Anthrax Straits — prices for pharmaceutical-spore cargo spiked 22% in Cordyceps. You have a pharm-spore lot and a half-written morphism for stealth-hop. You:

- Spend 3 minutes tuning the morphism (testing it against your own substrate in a sandboxed scope).
- Hyphal-fuse to a drift void waypoint, quiesce your skiff (go passive), wait for a Quire patrol to pass.
- Arrive Cordyceps, dock, sell, pocket enormous profit, drop three spores along the return, head home.

### A multi-week career arc

You accrete reputation in Russula Bloom, run enough missions to be trusted with route-guardian duty on a Pleurotus hop. You start teaching your stealth-hop morphism to other Bloom captains via symbiosis (anastomosis-with-teaching). One student gets killed; the Quires now know the morphism and counter it. You hunt the Quire who did it. You find them. You lose. You die. You respawn at your Septa spore, minus your cargo, minus your best accretion, but your lineage-rep persists — and other Bloom captains who anastomosed with you can now spawn from your recent spores, meaning your death *seeded a distributed network of captains who share your style*. This is the Padovan fold: one situation settles; three more open.

---

## 3. Spore-respawn, fully specified

**Spore.** A substrate-fragment dropped at `(system, local-coords)` persisting `P_n` ticks where $P_n$ is the $n$-th Padovan number, $n$ = sporulate-effort (1..10). $P_{10} = 28$. Effort costs coherence. Practical range: 3–9.

A spore carries:
- `(spore-<id>, dropped-by, captain-<X>, true)`
- `(spore-<id>, of-lineage, <L>, true)`
- `(spore-<id>, at, <system>:<coords>, true)`
- `(spore-<id>, carries, <morphism-declaration-subset>)` — optional, the captain chooses what to include
- `(spore-<id>, permits, <other-captain>, true)` — entries for each anastomosed partner
- `(spore-<id>, expires, <tick>, true)`
- `(spore-<id>, reputation-stake, <value>, true)` — an integer coherence deposit the spore "carries" for fast re-bootstrap.

**Death.** Skiff coherence (§4) reaches zero or wavefront fails to converge for more than `P_5 = 7` ticks. The skiff vaporizes. Its in-body substrate spills as wreckage — a bundle of loose claims in the system substrate that any captain can `salvage` into their own substrate for a coherence cost.

**Respawn.** On next login, server lists your live spores by freshness. Pick one. You re-fruit there. You inherit:
- Your lineage-rep in lineage substrates (persistent).
- The spore's `reputation-stake` (respawn coherence).
- Any morphism declarations the spore carries (a subset you chose).

You lose: all cargo, in-progress missions, reputation-specifics accreted since that spore (e.g., if you killed someone after dropping the spore, that fact is in the world but your *body*'s direct memory of it is gone; the lineage remembers through claims; you might have to learn you're a killer by being told).

**Anastomosis-respawn.** Captain B who anastomosed with captain A before A's spore drop may spawn from A's spore *if* the spore bears `(permits, B, true)`. A chooses whether to permit at dock-time. Lineage persistence across identities — this is the *mycelial inheritance* feature that makes the social fabric real. You can revive a dead friend at your spore.

**Spore predation.** A captain can `corrupt <spore>` by injecting contradictions into its substrate. If the corruption wavefront pushes the spore past coherence, the spore dies (tick-expire now). This is how the Quires hunt: they don't just kill, they hunt backward through the target's spore-trail. Counter: spores in competent lineages' patrol zones; keeping spore locations private (metadata in spore substrate is itself claim-graph — visible under sense, hidable by restriction).

**No spores = permadeath of captain-identity.** You start fresh: name, zero rep. Lineage remembers (your killer has the rep), but the fruiting body you were is gone. The myth is explicit about this and the game does not soften it.

---

## 4. Combat — claim-injection warfare

### Skiff coherence (HP)

Compute at each tick:
$$
C = 100 \cdot \left(1 - \frac{|\{\text{triples in skiff substrate with closedValue}=\text{both}\}|}{|\text{triples in skiff substrate}|} \cdot \rho^{-w}\right)
$$
where $w$ is a weighting by the "load-bearing"-ness of each contradicted triple (if it participates in many morphism declarations: high weight). $\rho$ is the plastic number. This makes contradictions in structurally central claims much worse than contradictions at the leaves. Death: $C \leq 0$ or wavefront non-convergence.

### Attack verbs

- `inject <target> (<S>, <P>, <O>, false)` — assert a false-valued version of a claim you believe they hold true; if they hold it true, their triple goes to `both`. Cost: coherence, ammo (claim-shells), range (sensor-line to target).
- `pattern <target> inversion-bomb <ontology-class>` — fire a crafted pair of inversion-declared predicates that mutually contradict within a chosen class. Requires you have learned the `inversion` morphism at level ≥ 3.
- `pattern <target> fusion-poison <fiber>` — inject a claim that triggers a fusion morphism they've declared, but with a toxic cofactor, polluting the fiber.
- `anastomosis-assault <target>` — forced dock. Their substrate receives yours as a batch; the merge pushes contradictions. High-risk / high-reward. If target survives, *you* inherit their rep grievances — they can spawn from your spores without permission.
- `spore-hunt <spore-id>` — corrupt a specific spore you have discovered.

### Defense verbs

- `withdraw <pattern>` — lower the value of matched triples in your substrate from `true` toward `none` in the knowledge order. This is *forgetting* — useful but costs accreted competence.
- `quiesce` — freeze settlement for `P_n` ticks (with Padovan schedule on cooldown). No new claims in or out. You cannot act, but nobody can reach you with injection. Tactical pause.
- `sever <captain-X>` — drop all anastomosis claims connecting you to X, rebuilding the fiber without those linkages. Costs coherence but flushes a poisoning.
- `drop-declaration <morphism-id>` — remove a morphism declaration from your substrate. Removes one attack surface. Costs: you can't use it, and students of yours can't either.
- `counter-inject` — assert the true-valued version back at the attacker, trying to push their substrate to contradiction first.

### Fight transcript (authentic sample)

```
> sense
Skiff RUSSULA-EMS. Coherence 87%. 4 cargo, 2 spores out.
Proximity: QUIRE-NICTH (Anthrax Quires), 1.2 AU. Hostile posture.
> pattern QUIRE-NICTH inversion-bomb cargo-manifest
You assert (our-cargo, is, empty, false) and (our-cargo, is, full, false).
QUIRE-NICTH substrate receives. Their cargo fiber lifts toward BOTH.
[QUIRE-NICTH coherence 74% → 68%]
[Incoming] QUIRE-NICTH: "Your bloom will fade slow, child of the meadow."
[Incoming] (your-drive, is, functional, false) ×3 injection
Your drive fiber at BOTH on (hyphal-fusion, requires-substrate, yes).
Coherence 87% → 71%.
> quiesce 5
Settlement frozen for 7 ticks.
[...7 ticks pass; QUIRE-NICTH circles but cannot inject...]
Settlement resumes. Coherence 71%.
> counter-inject (quire-nicth, navigates, accurately, false)
QUIRE-NICTH coherence 68% → 52%.
[Incoming] (ems, regarded-as, prey, true) ×10
> pattern QUIRE-NICTH fusion-poison substrate-core
You trigger their declared recycle-fusion on your false-seeded carcass claim.
QUIRE-NICTH substrate wavefront: non-convergence.
Non-convergence 2 ticks... 4 ticks... 7 ticks.
*** QUIRE-NICTH substrate has failed to settle. Skiff vaporized. ***
Wreckage at 2.3 AU. You may salvage.
> salvage
You absorb 12 morphism-declaration fragments, 2 cargo, 1 spore-key.
Coherence 71% → 61% (integration cost).
```

Players will learn the patterns over weeks. Knowledge is power.

---

## 5. Trade economy

### Cargo types

- **Metabolic fluid** (dense, heavy; stations need constantly)
- **Spores — pharmaceutical** (fragile, time-gated)
- **Spores — industrial** (robust, cheap)
- **Signal-dust** (exotic; used to tune sensors)
- **Claim-shells** (ammunition for claim injection)
- **Cultivation apparatus parts** (for drives)
- **Passengers** (refugees, pilgrims, delegates; bilattice-flagged as conscious — carries different morphism constraints)
- **Ghost-quotient fragments** (Subsidence-era wreckage; contraband in the Hartig Net, gold in Ostiole)
- **Raw mycelium**
- **Fermented coherence** (liquor; literal bottled rep-tokens; cultural good)
- **Sealed information-claims** (mail/encrypted SPO bundles)
- **Wreckage — sclerotized** (what saprotrophs trade)

### Price propagation

At each station, price for cargo `X` = function of `(station, wants, X, ?value)` and `(station, offers, X, ?value)` bilattice values plus local supply claims from arriving/departing skiffs. When a skiff undocks carrying 10 metabolic-fluid, a claim `(station-Y, supplies, metabolic-fluid, decreased)` hits the substrate; specialization morphisms transport it into the price fiber; neighboring stations receive it via route-lineage fibers with a Padovan-dampened delay (news travels along routes with $P_n$ tick latency by distance).

Money = reputation-backed credit claims. `(captain-X, holds-credit, <lineage>, <amount>)` is the canonical form. Credit is lineage-denominated. Hartig Net credits aren't accepted at Quire ports (for which: good). Converting between denominations = reputation-lossy.

---

## 6. Missions

Schema: `(mission-<N>, wants-<verb>, <param>)` + `(mission-<N>, offers, <payment>)` + `(mission-<N>, deadline, <tick>)`.

Types:
1. **Courier** — reach `(target-station, receives, <crate>, true)`.
2. **Escort** — keep `(ally-<X>, in-proximity-with, self, true)` for N ticks along route.
3. **Scout** — observe `(target-system, contains, <thing>, ?)` and bring back the answer.
4. **Rescue-from-sinkhole** — spawn at target captain's spore and tow them out.
5. **Dispute-arbitration** — inject a settlement claim into two parties' mutual substrate such that both withdraw grievance claims.
6. **Wreckage-claim** — reach a specified wreck before other skiffs; salvage.
7. **Morphism-teaching** — anastomose with an NPC and transmit a specific morphism; NPC returns to lineage with it.
8. **Assassination** — a specified captain's coherence must fall to 0. (Only offered by certain lineages. Rep-heavy.)

Completion = the target triple reaches the target value in the right substrate and settles. The station observes, emits payment claim, removes the mission.

**Fold-dynamic** (voidmath I.10): completed missions *birth* new missions. When the arbitration settles, a new grievance opens elsewhere in the substrate; when wreckage is claimed, saprotrophs emit a vengeance-mission. The world generates itself by settling.

---

## 7. Lineages and reputation

Rep = SPO claims in each lineage's *own* substrate: `(captain-X, regarded-as, <stance>, <value>)`. Stances: `friend, trade-partner, nuisance, enemy, prey, teacher, kin`. Each NPC of a lineage consults its lineage substrate on encounter.

Rep accretes from:
- Direct claim by NPC or player of the lineage (`(ems, regarded-as, trade-partner, true)`).
- Morphism inference: if you've traded 10 times successfully, a specialization morphism transports "trader" → "trade-partner" in the lineage's substrate automatically.
- Anastomosis propagation: anastomose with a Bloom captain, their Bloom-rep claims flow partially into yours via fusion.

Rep decays via Padovan timers. An enemy tag fades in $P_{12}$ ticks (144) of no hostile action — your grudges age out. This is important: the world doesn't accumulate unwinnable hostility over time.

Faction-vs-faction: lineage substrates hold mutual claims too. Hartig Net holds `(anthrax-quires, regarded-as, enemy, true)`. When a lineage's mutual-enemy rep tips past threshold, that lineage's NPCs shift posture globally. Players can move the needle. A famous peacemaker is a real thing that can happen.

---

## 8. Player-authored morphisms

A player writes a morphism by asserting structural predicates the engine reads as declarations. Safe forms:

- `declare-specialization <pred-A> <pred-B>` — whenever A holds, B holds at same (s,o) with restricted value.
- `declare-inversion <pred-A> <pred-B>` — converse-negation.
- `declare-composition <pred-A> <pred-B> <pred-C>` — C is k-meet composition of A,B.
- `declare-fusion <pred-A> <pred-B> <pred-C>` — pointwise ⊙.
- `declare-implication <pred-A> <pred-B>` — pointwise ⇒.
- `declare-constraint <scope> <pattern>` — a boundedness condition.

Declarations are **local to substrate**: default scope is the player's own skiff. To export a morphism, you anastomose and the declarations flow (with partner consent via permits).

**Anti-grief**: declarations with global side effects (writes into other players' substrates) are forbidden at engine level — the dispatcher only applies a declaration against claims in the scope that contains it. A morphism in my skiff cannot fire on a claim in yours unless we're anastomosed. A morphism in a *station*'s substrate fires on any claim docked in that station — which is why station-posted morphism bounties exist.

**Jealous hoarding vs teaching**: an anastomosis can be configured as `teaching` (bulk export declarations) or `trade` (export only named). The Ostiole Quiet teaches via long observation — you quiesce near them and receive by drift.

Skill propagation: a morphism once taught can be retaught. Viral ideas spread. The Quires counter-evolve. This is the emergent-complexity story and it is the selling point.

---

## 9. Engine port plan (JS → Rust)

File-by-file, target under `crates/pam/`:

| JS source | Rust target | LOC est | Notes |
|---|---|---|---|
| `predication-algebra/bilattice.js` (251) | `crates/pam/src/bilattice.rs` | ~200 | Enum `Value { None, True, False, Both }`, tables for meet/join/fuse/restrict. Include `verify_adjunction` test. Straight port. |
| `predication-algebra/claim.js` (77) | `crates/pam/src/claim.rs` | ~80 | Struct `Triple { sid: u32, pid: u32, oid: u32, value: Value }`. |
| `predication-algebra/content-address.js` (64) | `crates/pam/src/addr.rs` | ~70 | Stable content hash (blake3). |
| `predication-algebra/fiber.js` (462) | `crates/pam/src/fiber.rs` + `src/geometry.rs` | ~500 | Split: Geometry (settled, many indexes) vs Fiber (standalone). `HashMap<u32, Vec<u32>>` for indexes; `FxHashMap` for speed. |
| `predication-algebra/morphisms/_pair-dispatch.js` (86) | `crates/pam/src/morphisms/pair.rs` | ~90 | |
| `predication-algebra/morphisms/inversion.js` (105) | `crates/pam/src/morphisms/inversion.rs` | ~120 | Each as module with `declarations`, `apply_for_claim`. Trait `Morphism`. |
| `predication-algebra/morphisms/specialization.js` (116) | `.../specialization.rs` | ~130 | |
| `predication-algebra/morphisms/composition.js` (229) | `.../composition.rs` | ~260 | |
| `predication-algebra/morphisms/fusion.js` (196) | `.../fusion.rs` | ~220 | |
| `predication-algebra/morphisms/implication.js` (193) | `.../implication.rs` | ~220 | |
| `predication-algebra/morphisms/constraint.js` (214) | `.../constraint.rs` | ~240 | |
| `predication-algebra-model/intern-table.js` (52) | `crates/pam/src/intern.rs` | ~80 | `DashMap` for concurrent intern; u32 ids. |
| `predication-algebra-model/model.js` (782) | `crates/pam/src/model.rs` | ~700 | Main `Model`, `message`, `assert`, `match`. Largest port risk. |
| `predication-algebra-model/settlement.js` (320) | `crates/pam/src/settlement.rs` | ~350 | Wavefront fixpoint loop; functor dispatch. |
| `predication-algebra-model/abduction.js` (96) | `.../abduction.rs` | ~110 | |
| `predication-algebra-model/prove.js` (113) | `.../prove.rs` | ~130 | |
| `predication-algebra-model/provenance.js` (86) | `.../provenance.rs` | ~100 | |

**Total Rust**: ~3600 LOC for algebra. Tricky bits:

- The JS model mutates geometry in place and clones by spread. Rust: arena-allocate triples in a `Vec<Triple>`, mutation via indexes, structural sharing via `Arc` for snapshots.
- Wavefront recursion termination is proved finite in JS by the `changed/oldValue/newValue` knowledge-order-monotonicity argument. Preserve the invariant.
- Morphism dispatch uses dynamic trait objects: `Vec<Box<dyn Morphism>>`. Or enum dispatch with match — faster; prefer enum since the set is closed.
- `_ancestry` set on derived claims for recursion-bound — port as `SmallVec<[DeclKey; 4]>` or `FxHashSet`.
- Property-test the port: run `verify_adjunction`, run the JS test vectors (serialize JS output, load in Rust test) for all five morphism classes.

---

## 10. Crate layout

```
voidskiff/
├── Cargo.toml                    # workspace
├── world/                        # authored content (markdown + YAML)
│   ├── systems/
│   │   ├── cap-horizon.md
│   │   ├── ostiole.md
│   │   ├── cordyceps-reach.md
│   │   ├── septa.md
│   │   ├── volva-minor.md
│   │   ├── thrombus.md
│   │   ├── hollowshield.md
│   │   ├── mitre-deep.md
│   │   └── templates/*.md
│   ├── lineages/
│   │   ├── hartig-net.md
│   │   ├── anthrax-quires.md
│   │   ├── ostiole-quiet.md
│   │   ├── cordycipit-order.md
│   │   ├── sclerotic-choir.md
│   │   ├── tinder-cartel.md
│   │   ├── russula-bloom.md
│   │   └── stinkhorn-few.md
│   ├── cargo/cargo.yml
│   ├── missions/templates/*.md
│   └── morphisms/starter-pack.md
├── crates/
│   ├── pam/                      # predication algebra model (port target)
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── bilattice.rs
│   │       ├── claim.rs
│   │       ├── addr.rs
│   │       ├── fiber.rs
│   │       ├── geometry.rs
│   │       ├── intern.rs
│   │       ├── model.rs
│   │       ├── settlement.rs
│   │       ├── abduction.rs
│   │       ├── prove.rs
│   │       ├── provenance.rs
│   │       └── morphisms/
│   │           ├── mod.rs
│   │           ├── pair.rs
│   │           ├── inversion.rs
│   │           ├── specialization.rs
│   │           ├── composition.rs
│   │           ├── fusion.rs
│   │           ├── implication.rs
│   │           └── constraint.rs
│   ├── voidmath/                 # plastic-number, Padovan, fold
│   │   └── src/lib.rs            # rho, padovan(n), lift_loss(), fold()
│   ├── world/                    # world loader + worldgen
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── systems.rs
│   │       ├── lineages.rs
│   │       ├── cargo.rs
│   │       ├── missions.rs
│   │       └── worldgen.rs
│   ├── game/                     # game rules over the PAM substrate
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── skiff.rs          # per-captain state + coherence calc
│   │       ├── combat.rs         # verbs → claim injections
│   │       ├── trade.rs          # cargo/price substrate hooks
│   │       ├── mission.rs        # generator + completion checker
│   │       ├── spore.rs          # sporulate/respawn semantics
│   │       ├── rep.rs            # lineage reputation model
│   │       ├── morphism_auth.rs  # player-authored safety
│   │       └── tick.rs           # world tick orchestration
│   ├── proto/                    # wire protocol + command parser
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── command.rs        # verb parser
│   │       ├── render.rs         # ansi + line formatting
│   │       └── auth.rs
│   ├── server/                   # tokio TCP/telnet server
│   │   └── src/
│   │       ├── lib.rs
│   │       ├── listener.rs
│   │       ├── session.rs
│   │       ├── broadcast.rs
│   │       └── persist.rs        # JSONL event log
│   └── client/                   # minimal telnet client (ANSI, readline)
│       └── src/main.rs
└── src/main.rs                   # `voidskiff` binary: serve | client | worldgen
```

---

## 11. TCP/telnet server architecture

- Tokio `TcpListener`. Each connection = one tokio task running `session::run`.
- Session handshake: captain-name + spore-key (simple sha256 of a user-chosen passphrase; captain is created on first connect if absent). No passwords stored plaintext.
- Per-session state: `SessionState { captain_id, current_skiff_id, last_cmd_tick, output_queue }`.
- Server holds the `Arc<RwLock<Model>>` (PAM substrate) + `Arc<RwLock<World>>` (systems/lineages).
- Commands arrive line-oriented. Parser produces `Command` enum; `game::apply(cmd, captain)` produces `Vec<ClaimOp>` to message into the substrate.
- **Broadcast semantics**: after each tick, a `SubstrateDelta` is computed (new triples + value changes). A per-session filter determines which deltas are visible (by presence in same system, by anastomosis, by sensor range). Visible deltas are rendered and emitted.
- Responsiveness: commands echo immediately and enqueue substrate ops. Full effect arrives on the next tick (≤100ms). Combat feels turn-paced, not twitch.
- Admin hatch: `#admin` verbs behind a local-socket only; never over TCP.

Auth for v0: the `spore-key` is both authentication and the cryptographic seed tying captain to their public-reservoir fallback. Lose your key, make a new captain.

---

## 12. World file format

Systems (`world/systems/cap-horizon.md`):

```markdown
---
id: cap-horizon
kind: live
position: [12.4, -3.1, 0.7]
connections: [septa, volva-minor, cordyceps-reach]
fusion-cost: 0.8
lift-loss: 0.05
stations:
  - id: the-prime
    lineage: hartig-net
    wants: [metabolic-fluid, claim-shells]
    offers: [cultivation-parts, sealed-information-claims]
    missions-per-tick: 0.4
authored-substrate:
  - [cap-horizon, substrate-kind, busy, true]
  - [the-prime, governed-by, hartig-net, true]
---

# Cap-Horizon

The Prime is a ring-station around Cap-Horizon's gas-giant...
(flavor prose; shown to players who `look`)
```

Lineages (`world/lineages/hartig-net.md`):

```markdown
---
id: hartig-net
voice-style: legalistic
default-posture: neutral-trade
homewaters: [cap-horizon, cordyceps-reach, septa]
rivals: [anthrax-quires, cordycipit-order]
teaches-morphism: specialization
teaches-level: 4
starter-claims:
  - [hartig-net, regards, anthrax-quires, enemy]
  - [hartig-net, polices, pleurotus-chain, true]
npc-templates: [net-courier, net-enforcer, net-arbiter]
---
```

Cargo (`world/cargo/cargo.yml`):

```yaml
- id: metabolic-fluid
  mass: 10
  base-price: 4
  perishable: false
  lineage-restricted: []
- id: ghost-quotient-fragments
  mass: 1
  base-price: 180
  perishable: false
  lineage-restricted: [hartig-net]  # contraband
```

Mission templates (`world/missions/templates/courier.md`):

```markdown
---
kind: courier
generator: per-station-per-N-ticks
pay-range: [20, 80]
deadline-padovan: 9
---
```

Morphism starter pack: a YAML/markdown of declarations per lineage, loaded into NPC-substrate and gifted to lineage starters.

---

## 13. Worldgen

Authored: 8 systems hand-written. Procedural: fill remaining ~80–100 systems into the Karst cluster using templates.

Algorithm:
1. Place systems on a 3D Padovan-spaced lattice (anchor points at Padovan distances from Cap-Horizon). Jitter with deterministic seed.
2. Assign kind by distance from authored live cores: close → live-template, mid → drift-template, far → sinkhole-template.
3. Each template produces a skeleton station set, cargo-wants/offers distribution from the template's lineage-affinity, and an authored-substrate seed of 10–30 claims.
4. Routes: for each system, connect to nearest $P_n$ neighbors (Padovan connectivity = natural scale-invariant graph). Mark some as "collapsed" probabilistically based on sinkhole proximity.
5. Deterministic from a seed so the Karst is the same for everyone (but new seeds can run private worlds).

Worldgen is a subcommand `voidskiff worldgen --seed 561 --out ./world-generated/`. It never overwrites authored content, only fills unnamed slots.

---

## 14. Tick model

One tick = 100ms target (10 Hz).

Per tick:
1. **Intake** (drain command queues from all sessions): collect `Vec<ClaimOp>`.
2. **Message phase**: for each op, `model.message(claim)`; settlement runs to fixpoint for that op. Cost is bounded by morphism-declaration count + changed cells.
3. **Tick triggers**: Padovan schedules fire (spore expirations, NPC actions, station mission generation, rep decay).
4. **World actions**: NPCs consult lineage substrates and act (inject claims).
5. **Delta compute**: compare `revision` before/after; gather changed triples.
6. **Broadcast**: for each session, filter delta, render, enqueue.
7. **Persist**: append ops + tick metadata to JSONL event log.

If settlement overruns the tick budget, the tick degrades gracefully — drop to 5 Hz — and logs a warning. The combat model tolerates variable tick rate; only Padovan counters need strict tick monotonicity.

**Responsiveness trick**: command-echo is synchronous ("you assert...") even though effects land on tick. Players never feel lag on input.

---

## 15. Out-of-scope for v0

Short list — cut polish, not shape:

- Graphical client (ANSI telnet only).
- Voice chat, in-game channels beyond simple "say".
- Spatial 3D movement within a system beyond coarse `at <station|coords>`.
- Persistent per-skiff cosmetics / fine-grained customization.
- Mobile/web client.
- Clustered multi-server sharding — one authoritative server per Karst instance.
- Procedural mission narrative generation (use templates; richer later).
- Complex economy simulation beyond the propagation model described.

In-scope and must-ship: lineages, ~30 live missions types, combat, trade, spore-respawn, player-authored morphisms, anastomosis, at least 8 authored systems, the procedural rest of the Karst.

---

## 16. Multiplayer session transcript (The Karst, 90 lines)

Two captains: `ems` (Russula Bloom, newish) and `kevra` (Tinder Cartel, veteran). They cross paths in Volva-Minor; ally; get ambushed by `nicth` (Anthrax Quires); one dies; one respawns from the other's spore.

```
[ems connects]
Welcome, ems. Spawning from spore spore-ems-17 at volva-minor:bloom-hub.
Skiff RUSSULA-EMS fruits. Coherence 92%. 3 morphisms loaded.
> look
Bloom Hub, Volva-Minor. A ragged ring-station around a yellow dwarf.
2 captains docked: ems, kevra. Russula Bloom posture: welcoming.
News: Hartig Net convoy lost in Anthrax Straits 4 ticks ago. Pharma prices +22% in Cordyceps.
> hail kevra
kevra: "Bloom-kin. You running something?"
> say kevra: half a lot of pharm-spores. Cordyceps-bound. Bloom will pay finder's cut.
kevra: "I'm Tinder, not Bloom. But I'll ride with you for a cut of the difference. Straits are hot."
> propose-anastomosis kevra trade-scope pharm-run
[kevra receives proposal]
kevra: accepted. Anastomosis established. Scope: pharm-run. Morphisms shared: route-chart-v2.
Coherence 92% → 89% (anastomosis cost).
> undock
RUSSULA-EMS undocks. kevra-TINDER-K follows.
> chart cordyceps-reach
Route: volva-minor → anthrax-straits → cordyceps-reach. Lift-loss projected 11%. Cost: 14 credits.
Warning: anthrax-straits is Quire hunting ground.
> hyphal-fuse anthrax-straits
Fusion... ghost-quotient compressing... lift-loss 6% (kevra's route-chart helped).
Arrived anthrax-straits. Empty drift-void. Sensors: 1 contact, QUIRE-NICTH, 2.4 AU, closing.
kevra: "Told you. Quiesce now, I'll try to talk."
> quiesce 7
Settlement frozen for 9 ticks.
kevra → NICTH: "Nicth. Tinder passage. No cargo of yours."
NICTH → kevra: "We hunger for meadow-fruit. We see RUSSULA behind you."
NICTH → ems: (ems, regarded-as, prey, true) [injection]
[quiesce blocks injection; buffered]
Tick 3 of quiesce...
kevra: "Ems, on tick 7 we both burn for cordyceps. Don't hesitate."
Tick 6...
Tick 9. Quiesce ends. Buffered injections settle: coherence 89% → 81%.
> hyphal-fuse cordyceps-reach
NICTH pattern: anastomosis-assault. [FORCED DOCK]
kevra severs and burns. kevra-TINDER-K fusion initiated.
Your fusion blocked by forced anastomosis. Coherence 81% → 62%.
> counter-inject (nicth, holds, forced-dock, false)
NICTH coherence 70% → 63%.
> sever nicth
Anastomosis severed. 14 Quire claims purged from substrate.
Coherence 62% → 54%.
> sporulate 5
Spore spore-ems-18 dropped here. Permits: kevra. Persists P_5=7 ticks. Reputation-stake 8.
Coherence 54% → 46%.
> hyphal-fuse cordyceps-reach
Fusion... lift-loss 9%...
NICTH pattern: inversion-bomb drive-class.
Your drive fiber lifts toward BOTH at 3 cells.
Fusion FAILS. Non-convergence warning.
> withdraw drive-class
Coherence 46% → 32%. Drive fiber settles. You are stranded in anthrax-straits.
[kevra reached cordyceps-reach]
[kevra broadcasts to anastomosis partners]: "Ems? Report."
> say kevra: stranded. Drive poisoned. NICTH still here. Spore dropped at my position.
[NICTH injection burst: 40 claims/tick]
Coherence 32% → 17% → 3%.
*** RUSSULA-EMS wavefront fails to converge. Skiff vaporized. ***
Wreckage at anthrax-straits:drift-3. 
[kevra receives spore-key for ems-18; kevra may spawn from it via permits]
[ems connection: you are disembodied. Awaiting spore-respawn.]
> spores
Available spores:
  spore-ems-17 (volva-minor:bloom-hub, expires in 12 ticks, stake 5)
  spore-ems-18 (anthrax-straits:drift-3, expires in 6 ticks, stake 8, permits:kevra)
> respawn spore-ems-17
Spawning at volva-minor:bloom-hub. 
You inherit: Bloom lineage-rep (preserved), 1 morphism (route-chart-v2, learned from kevra), stake 5.
You lose: 4 pharm-spores, mission pharm-run, accretion since tick 2201.
RUSSULA-EMS-B fruits. Coherence 73%. Welcome back.
[Bloom hub NPC, keeper-oys, approaches]
keeper-oys: "You fell. The meadow remembers. Your kin kevra lived — they spoke your loss to the Net."
[Russula Bloom substrate update: (ems, lost-to, anthrax-quires, true); (quires, owed-reckoning-by, bloom, +1)]
[kevra connects across anastomosis-residual; still alive at cordyceps-reach]
kevra: "Spore-ems-18 is still live back in the straits. If we go together, we raid the site and spawn you there."
> say kevra: meet at septa. We gather captains.
[6 other Bloom captains hail in response; raid-mission forming]
> sporulate 3
Spore spore-ems-19 dropped here (volva-minor:bloom-hub). Permits: kevra + 6. Persists 4 ticks.
[mission-generator emits: (mission-raid-nicth, wants-completed-by, bloom-collective, true)]
> accept mission-raid-nicth
...
```

Transcript ends mid-arc — which is the point. The game does not.

---

## 17. Risks and unknowns

1. **Port correctness**. The JS algebra has subtle invariants (wavefront termination, ancestry recursion bound, contradiction table maintenance). Mitigation: cross-port property-test harness that runs the same SPO sequences through JS and Rust and diffs the resulting triples. Build this before content work.
2. **Performance**. 10 Hz ticks × N skiffs × settlement budget. PAM settlement is linear-ish in affected fibers, but morphism-heavy substrates may blow budgets. Mitigation: profile early with synthetic loads; add per-session substrate budgeting (player-authored morphisms get declaration-quota caps).
3. **Anti-grief in player-authored morphisms**. A clever player may find a cascade that causes quadratic/exponential settlement in shared station substrate. Mitigation: declaration scopes enforced at dispatch; hard cap on morphism fire count per tick per scope; quarantine verbs.
4. **Economy stability**. Price propagation can spiral. Mitigation: bilattice value bounds it (nothing goes above `true`), but magnitudes (credit) need dampening — Padovan-rolling averages.
5. **Social bootstrap**. An empty server is boring. Mitigation: NPC skiffs across lineages populate the world; they fight, trade, teach each other morphisms; the world runs without human players.
6. **Telnet ergonomics**. Line editing, scrollback, ANSI — can suck. Mitigation: ship the Rust client alongside the server; recommend but don't require it. Accept raw telnet for MUD purists.
7. **Scope creep**. Every one of these systems could be twice as deep. Mitigation: the checklist in §15 is load-bearing. Anything there stays cut for v0.
8. **Subsidence mystery depth**. Players will investigate. Need enough authored lore-substrate that investigation is non-hollow. Mitigation: 3-layer lore design (surface rumor, mid-tier investigative finding, deep truth only accessible via morphism-level analysis of Thrombus). Reserve one full week of content authoring for this.
9. **Padovan overflow**. $P_{30} \approx 3.5\text{M}$; $P_{40} \approx 75\text{M}$. Cap Padovan indices at 20 for gameplay; use `u64` internally.
10. **JS→Rust morphism parity not bit-exact**. Map/iteration order differences. Mitigation: sort all iteration by (sid,pid,oid); test fixtures exhaustive.
