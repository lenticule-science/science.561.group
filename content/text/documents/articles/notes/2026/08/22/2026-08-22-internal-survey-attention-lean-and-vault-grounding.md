---
title: "Internal Survey: Attention, Light Cones, and Landauer Entropy in the Existing Vault"
description: "Full working notes from a five-agent internal survey of the estate's own formal (Lean/pymetrologic) and informal (notes, trading section, Web3 sections) material relevant to the attention-as-simulated-time theory, preserved in full rather than compressed into the theory note itself."
date-created: 2026-08-22
type: notes
name: 2026-08-22-internal-survey-attention-lean-and-vault-grounding
authors:
  - emsenn
  - claude-fable-5
status: draft-for-review
keywords: ["money-science", "attention", "lean", "causal-sets", "landauer", "internal-survey"]
tags: ["draft", "research-archive"]
---


This is the full, unabridged internal-mapping half of the research session behind
[Rung Six: Attention as Simulated Time](2026-08-22-note-on-attention-as-simulated-time.md).
Five agents surveyed different parts of the estate in parallel;
this document preserves their findings in full rather than the compressed pointers that ended up in the theory note itself, on the theory that research this expensive should leave a durable, complete trace in the vault, not just an out-of-band workflow log.
Companion document: the five external-literature guides in the economics section's `references/` folder (linked from the theory note).

`BASE` below = `/home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia`

## 1. The formal Lean/pymetrologic layer

### Attention-as-budget — `BASE/Cohomology/AttentionAllocation.lean`, namespace `Obsmetrologia.Cohomology.Attention`

- `Obstruction` (structure, `cost`/`benefit` : Nat) — a unit of unresolved-`⊤` demand, priced in attention.
- `totalCost`, `totalBenefit` — sum cost/benefit over a selection (list) of obstructions.
- `Feasible B S` — a selection fits inside attention budget `B`.
- `residual U S` — the held-`⊤` left over after spending attention on selection `S` out of universe `U`.
- `cost_monotone_cons` — spending on one more obstruction never lowers total cost (spend is irreversible/monotone).
- `feasible_of_cons` — feasibility is downward-closed (dropping a commitment never breaks budget).
- `feasible_extend` — greedy extension: adding an obstruction that fits stays feasible and captures its benefit.
- `residual_antitone` — more captured benefit implies less residual (residual is antitone in benefit).
- `residual_empty` — spending nothing leaves maximal residual (the do-nothing baseline).
- `attention_allocation` — the bundled theorem: budget-constrained, monotonically-consumed, irreversible selection that minimizes residual by maximizing captured benefit.
- Doc-comment framing (load-bearing prose, not a separate lemma):
  "The light cone makes this not a free knapsack. A jump... is committed once and cannot be refunded" — this is the explicit place the corpus already ties attention-spend to light-cone irreversibility, written for a different purpose and never followed up until this survey.

### Future light cone / causal reachability — `BASE/CausalSets/Causal/Cone.lean`, namespace `Obsmetrologia.CausalSets.Causal.Cone` (built on `CausalSets.Causal.Order`)

- `CausalSet.reaches` (in `Causal/Order.lean`) — the base primitive: directed `≺₀`-path reachability;
  `e₂` "reaches" `e₁` iff `e₂` sits in `e₁`'s future light cone.
- `Future e := C.reaches e ·` — strict causal future cone of an event.
- `Past e := C.reaches · e` — strict causal past cone.
- `CausalLe x y := x = y ∨ C.reaches x y` — reflexive causal precedence, the causal partial order.
- `ClosedFuture e`, `ClosedPast e` — reflexive (closed) future/past cones, principal up-/down-sets of `CausalLe`.
- `Spacelike x y := ¬reaches x y ∧ ¬reaches y x` — causal incomparability.
- `Diamond a b`, `ClosedDiamond a b` — strict/reflexive causal diamond `I⁺(a) ∩ I⁻(b)` (the Alexandrov interval).
- `causalLe_refl`/`causalLe_trans`/`causalLe_antisymm` — `CausalLe` is a genuine partial order (antisymmetry = "no closed timelike curve").
- `future_is_upward_closed`/`past_is_downward_closed` — cones are order-closed.
- `causal_reachability_is_cone_geometry` — bundled headline: reachability induces a full strict cone geometry.
- Companion module `CausalSets/Support/Causal.lean` (`Obsmetrologia.CausalSets.Support.Causal`):
  `Microsupport C S := causalClosure C S` — the union of future cones of a support set;
  `microsupport_point`: a point source's reach is exactly its closed future cone;
  `microsupport_excludes_spacelike` — influence never crosses to spacelike-separated events.
  This is the sharpest existing formal statement of "what a single event/computation can causally influence."
- `CausalSets/Causal/Alexandrov.lean`: `causalTopology`, `IsCausalOpen`, `closedFuture_isOpen`/`future_isOpen` — future cones are literally the open sets of the causal Alexandrov topology;
  `specializes_iff_causalLe` ties topological specialization to causal precedence.
- `CausalSets/Causal/Interval.lean`: `between`/`intervalCard` (the causal-order interval `I(x,y)`, i.e. the Alexandrov interval's cardinality/"abundance"), `pastLayer`/`layerCount` (grading the causal past by intermediate-event count) — the closest formal handle on "how much of the past/future is between two events," an amount-of-structure-resolved measure.

### Landauer / anti-Landauer entropy

`BASE/Cohomology/LandauerEntropy.lean` names the coordination cohomology `Ȟ¹` (cycle rank of a cover nerve) as the **Landauer entropy** (`landauerBits`): the number of irreversibly erased bits when settling glues local pieces together.
Zero iff the nerve is a forest — acyclic gluing is information-lossless (`landauer_zero_iff_reversible`).
On the stochastic side, `reversible_is_landauer_free` shows a detailed-balance Markov kernel produces no entropy (its stationary distribution is a fixed point with no obstruction) — same "reversible implies no erasure" idea for probabilistic settling.

`BASE/Cohomology/AntiLandauerEntropy.lean` names the dual: `antiLandauerBits := Ȟ⁰` (harmonic global-section count), the bits the settling keeps losslessly.
The two are linked by a discrete index theorem: `antiLandauerBits − landauerBits = χ` (Euler characteristic of the cover nerve) — `index_balance`.
Settling doesn't destroy or create structure overall; it only redistributes a fixed total (`χ`) between "harmonic content recovered" (anti-Landauer) and "cost paid to erase incompatible cycles" (Landauer).
`reversible_index_all_harmonic` is the clean limit: when nothing is irreversibly lost, the whole invariant is harmonic content.

**Plain gloss:** Landauer entropy is the part of settling's output that is genuinely spent/destroyed (the cost of resolving contradiction);
anti-Landauer entropy is the part that is recovered intact (the harmonic/signal content);
their difference is conserved (`χ`) regardless of how the settling proceeds.
This is a real, cited formal split between "cost" and "harmonic-content" of settling — good grounding for "compute compresses time into information into signal," provided one is honest that the corpus's `χ` conservation is about a cover-nerve gluing problem, not literally a temporal-compression theorem.

### VerificationTournament as a home for "simulating many futures before committing" — honest read

**Partially plausible, with a real gap.**
`BASE/GameTheory/VerificationTournament.lean` is explicitly scoped as a certificate, not a search/simulation engine: its own header says "It does not formalize libp2p transport, matchmaking, or the full Dialectica game semantics."
What it proves — `SurvivorReading`, `NashNoDeviation` (`fixedPoint ∧ pure ∧ noDominantRefutation`), `DialecticaWitnessSurvives`, `EquilibriumMatchesSurvivor`, `CorrespondsToSurvivor`, `SettledVerdict`, `settled_verdict_of_closure_certificate` — formalizes that a settled outcome, once reached, is stable and traceable to a surviving claim.
It does not formalize the exploration/branching process that produced the candidate strategies in the first place;
that is asserted as external "runtime obligations" (`RuntimeObligations`, `OperationalWitnesses`) supplied by the (unformalized) libp2p/matchmaking layer, not derived.

It is a plausible formal home for the *outcome* of tournament-style branch simulation — many candidate futures were played out, and here is the proof the survivor is the stable, non-dominated one, tied to a monotone-closure fixed point (`Charge.no_periodic_orbits` under the hood).
It is *not* a formal model of the branching/simulation process itself: no tree of futures, no cost-per-branch, no connection to `Attention.Obstruction`/budget.
Claiming "the corpus formalizes simulating many futures" would overclaim;
claiming "the corpus formalizes what it means for a settled future, chosen from many candidates, to be non-improvable/stable" is exactly right and citable.
This should be flagged explicitly as an honest limitation rather than forced.

### File paths cited

`BASE/Cohomology/AttentionAllocation.lean`, `BASE/Cohomology/LandauerEntropy.lean`, `BASE/Cohomology/AntiLandauerEntropy.lean`, `BASE/Computing/CausalityPacket.lean`, `BASE/GameTheory/VerificationTournament.lean`, `BASE/CausalSets/Causal/Order.lean`, `BASE/CausalSets/Causal/Cone.lean`, `BASE/CausalSets/Support/Causal.lean`, `BASE/CausalSets/Causal/Alexandrov.lean`, `BASE/CausalSets/Causal/Diamond.lean`, `BASE/CausalSets/Causal/Interval.lean`.
The pymetrologic `THEORY.md` at `.../obsmetrological-services-section/apps/pymetrologic/docs/THEORY.md` has rows (lines 46-49, 54, 87-90, 111, 128) for causal sets/light cones/Alexandrov/probability/stochastic settling — but **no rows exist yet** for `AttentionAllocation`, `Landauer`/`AntiLandauer` entropy, or `VerificationTournament`: these three Lean modules are not yet ledgered in `THEORY.md`, so cite the `.lean` files directly for those three, not the doc.

## 2. Prior informal thinking in the estate (attention, simulation, games, arenas)

**Vault link convention** (confirmed across notes): relative path is `../<DD>/<YYYY-MM-DD>-<slug>.md#anchor-id` — up one level from the current day-folder into a sibling day-folder under the same month, then the dated filename, then a `#slug` fragment matching a `{#slug}` heading-attribute in the target file.

### 2026-06-17 "Mysterious Spacetime" (the void note)

Core terms: charge `⟨α,β⟩`, twist product `L^⋈`, bilattice **FOUR** (⊥ absurd / t potential / f active / ⊤ stable), knowledge order vs truth order, closure ordinal κ, settling, four regimes (strict/Scott/transfinite-bounded/aperiodic), `H¹` obstruction, self-dual locus, "Catch-[0,2]", codec, fractal re-entry / metacircle.

- **Time as monotonicity, not a coordinate** (`#modal`):
  "Time is therefore not a coordinate the theory is given but the monotonicity of its own closure, and the reason the past is fixed and the future open is that knowledge accumulates and never retracts."
  This is the vault's existing time theory; any "attention compresses time" claim operates *on* this arrow, not in place of it.
- **Simulation, explicitly, via functional decision theory** (`#deciding`):
  "the cell *my algorithm outputs x* is shared across every instance — the agent, its predictors, its simulations, its copies — and settling it settles them all at once."
  Prior informal use of "simulation" means another instance of the agent's algorithm run elsewhere (a predictor), not "simulating future branches to save time" — but it is the nearest existing hook for an FDT-flavored treatment of simulated futures.
- **Compute/attention as budget already exists** (`#cost-quantale`):
  "Cost is a Lawvere quantale... the disembodied ranking over fuel, currency, and inference tokens gains coordinates for joules and bandwidth... a dispatch that exceeds an agent's energy or bandwidth budget is dominated regardless of its monetary cost."
  This is the existing attention-allocation-as-budget formalism to extend, not re-derive.
- **"Attention" used literally twice**:
  `#failure` — "Run the engine's attention on its own non-classical values" (colloquial);
  `#markets` — "the spectral gap of the attention graph: a well-connected market relaxes fast and arbitrage evaporates" (attention as a market/graph relaxation-rate concept, a possible bridge metaphor for faster forecasting via simulated futures).
- **Past light cone, explicitly named** (`#governance`):
  "accountability review confined to the causal past of a decision — the past light cone of the void."
  Light cones already exist in the corpus but only the *past* one is named/used;
  a future-light-cone compression claim is a genuine extension point, not a duplicate.
- **Moduli of worlds** (`#moduli`): a settling's cohomological invariant classifies a space of possible settlings/worlds — the closest existing machinery to "space of possible futures," worth reusing as the formal carrier for "simulated future branches" rather than inventing a new one.
- **Markets/arbitrage** (`#markets`): mispricing = Dirichlet energy of a reward field on a graph Laplacian;
  "how long an edge survives... is the spectral gap of the attention graph."
  Good precedent for tying attention-spend to speed of convergence/settling.

### 2026-06-18 "Mysterious Machines" (strategy/self/concurrent game)

Core terms: arena, strategy (receptive + courteous sub-event-structure), arena dual `A^⊥`, self-opponent (agent = arena with `A ≅ A^⊥`), category **CGS** (concurrent games with symmetry, star-autonomous), tower relation → agent → game → computer (forced by definability), Caillois's four play-types mapped onto the four regimes (ilinx/mimicry/alea/agon), swarm criteria (bounded per-agent cost, interchangeability, stigmergy), embedded agency, functional decision theory (FDT) vs CDT/EDT, Löbian wall, mutual local derivability (sameness).

- **FDT restated with explicit "instances/simulations/copies" language** (`#deciding`):
  "`x* = argmax_x E[u(w) | A(w)=x]` where `A(w)=x` asserts every instance of `A` in `w` outputs `x`."
  Same simulation-hook as the void note, now with a worked CDT/EDT/FDT comparison table (one-box/two-box, smoking lesion).
  A new "simulating futures compresses time" theory should probably be positioned as a temporal/computational reading of exactly this FDT machinery, not a competing formalism.
- **Coordination overhead is already quantified in compute terms** (`#coordination`/`#lm-agents`):
  "coordination overhead grows approximately quadratically with agent count... `Ω(n²)`";
  language-model agents fail swarm criteria because "context grows with the conversation."
  This is the existing compute-as-resource-not-just-currency thread — attention-as-compute-budget should connect here.
- **"No stable strategy" / ilinx = aperiodic regime with `H¹≠0`** (`#four-games`): games/regimes where the future can't be settled from inside are already tagged as the regime "that needs the outside and never settles from within" — the natural home for "why passive time-waiting is needed when you can't simulate enough of the light cone."
- **Deep play / magic-circle failure** (`#deep-play`): the boundary between simulated/bounded play and real-world stakes leaking through — potentially useful for bounding claims about "simulating the future" vs. actually living it.
- No explicit prior text about "attention lets you skip waiting for calendar time" — this appears to be genuinely new territory, though the FDT/simulation-instance language and the cost-quantale (inference-token budget) are the two load-bearing precedents to cite/extend rather than reinvent.

### 2026-07-07 "Note on Obsmetrologia Arenas"

Core terms (Lean-formalization register): event structure, causal order `<`, conflict `#`/`Con`, finite configuration (down-closed, conflict-free), position = (configuration, support, valuation), play (inclusion of positions), polarity λ (Player/Opponent), symmetry (configuration isomorphism), subarena/subobject, site/cover/overlap (Grothendieck-site machinery), settlement closure, strategy (prefix-closed, receptive, deterministic-Player, settlement-compatible), `B4` = {bot,t,f,top}.

This note is the rigorous Lean-grounded definition of "arena" the other two notes use informally — no discussion of attention, simulation, or compute-as-resource; it's pure structure (events/causality/positions/strategies).
Quotable line: "a strategy is not merely a trajectory but a lawful rule for responding inside the arena" (§1, requirement 9) — the vault already treats a strategy as intensional over all possible opponent moves, structurally very close to "an agent that has pre-simulated its responses to unrealized futures."
Simulated-future-compute should be described as strategy construction/refinement over the arena rather than a new primitive — this note gives the exact formal object (`Sigma`, receptivity, prefix-closure) to hang it on.

### `attention-services-section/README.md`

Very short — states the section's scope, not theory: it "owns the dies that price and allocate limited attention against a declared budget," referencing `Cohomology/AttentionAllocation.lean` and a monotone-budget greedy allocation over an ActivityStreams contract face for an `attention-allocation-readout-service`.
No discussion of simulation, futures, or time — this is the engineering stub for attention-as-budget (implementation of the cost-quantale idea from the void note), not theory.
It confirms "attention = a priced/allocated resource against a budget" is already an operational concept in the corpus, so the new theory should treat that Lean module as the thing to extend with a temporal/simulation semantics, rather than as prior art to restate.

### Synthesis

The vault already has:
(1) time = monotone knowledge-accumulation/closure-ordinal arrow (void note `#modal`);
(2) compute/inference-tokens as one more quantale coordinate on cost, alongside money/joules/bandwidth (`#cost-quantale`);
(3) an operational attention-budget allocator in Lean (`AttentionAllocation.lean`);
(4) simulation as "another instance of the same algorithm" via FDT (`#deciding` in both notes);
(5) strategies-in-arenas as lawful rules that already respond to unrealized opponent moves (arenas note, req. 9);
(6) a moduli-of-worlds machinery for spaces of possible settlings (`#moduli`);
(7) the past light cone named, but no future light cone treatment.
The genuine new contribution is the *future* light cone / compute-time-substitution claim — everything else cites into these six existing anchors rather than re-deriving them.

## 3. The trading section: exact formulas already implemented, and the Alpaca gap

Confirmed by direct grep: zero matches for "alpaca" (case-insensitive) anywhere in `emsenn-trading-services-section` or its parent `emsenn-economic-services-section` tree.
The two collector venues actually implemented are **Hyperliquid** and **GMX** (per `lib/collectors/README.md`'s venue survey, 2026-08-21);
Binance was tried and found geo-blocked.
Alpaca was not one of the surveyed candidates and does not appear in any file — a real gap, not an oversight elsewhere.

### Wit flow (`src/wit-flow.mjs`)

```
wit_flow[i] = fundingComponent[i] + proxyComponent[i]
cumulativeWit[i] = cumulativeWit[i-1] + wit_flow[i]     (running sum over available bars)
```

- `fundingComponent[i] = -fundingRate[i] * openInterestUsd[i]` — the one denominated (real-USD) term;
  available iff `funding.available && openInterest.available`.
- `proxyComponent`, two tiers preferred-to-fallback:
  - Tier 1 (signed flow available): `directionSign[i] = sign(signedFlowUsd[i])` if nonzero else `sign(mid[i]-mid[i-1])`;
    `buildingPortion[i] = max(0, openInterestUsd[i]-openInterestUsd[i-1]) * directionSign[i]`;
    `proxyComponent[i] = signedFlowUsd[i] - buildingPortion[i]`.
  - Tier 2 (no signed flow, e.g. GMX): `directionSign[i] = sign(mid[i]-mid[i-1])`;
    `proxyComponent[i] = max(0, -(openInterestUsd[i]-openInterestUsd[i-1])) * directionSign[i]`.
  - If neither available, `proxyComponent = null`, `wit_flow` falls back to `fundingComponent` alone (or `null`).
- Divergence detectors (rolling window `W` = `divergenceLookbackBars`, default 12; `zHigh`=1.5, `zLow`=0.5):

```
priceZ[i] = ((mid[i] - mid[i-W]) / mid[i-W]) / stdev(all window price-changes in the series)
witZ[i]   = (cumulativeWit[i] - cumulativeWit[i-W]) / stdev(all window wit-changes in the series)
price-without-settlement:  |priceZ[i]| >= zHigh  AND  |witZ[i]| <= zLow
settlement-without-price:  |witZ[i]|   >= zHigh  AND  |priceZ[i]| <= zLow
```

### Settlement half-life / tau (`src/settlement-half-life.mjs`)

1. Displacement event: fires at bar `i` when `|return[i]| > displacementK * trailingSigma[i]` (trailingSigma = sample stdev of preceding `sigmaWindowBars`=24 returns, excluding bar `i`).
2. Pre-event anchor: mean `mid` over the `anchorWindowBars` (default 3) bars immediately before the event.
3. Decay path: `d(j) = mid(j) - anchor`, tracked until sign-flip (crosses back through anchor) or `maxHorizonBars` exhausted.
4. Fit: OLS on `ln|d(j)|` vs `(j-i)`, since `d(j) = d(i) * exp(-(j-i)/tau)` is linear in log space;
   produces `tau` and `fitQuality` (R²).
5. Never-relaxing displacements are censored (`censored: true`), not dropped, if they never fall to `minRelaxFraction` (default 0.5) of initial size nor cross the anchor within the horizon;
   `tau` from partial path (can be `null`).
6. Once an event fires, its own path is excluded from re-triggering a new event until it resolves.
7. Rolling tau: `rollingTau[k] = mean(tau)` of the last `rollingWindowEvents` (default 5) events up to and including `k`, null-tau events excluded from average but not from event list.

### Four-state tape (`src/four-state-tape.mjs`)

Per-bar `(pro, con)` from one of three tiers:

- Tier 1 `oi-long-short-split`: `proRaw[i] = max(0, longOiUsd[i]-longOiUsd[i-1])`;
  `conRaw[i] = max(0, shortOiUsd[i]-shortOiUsd[i-1])`.
- Tier 2 `trade-count-split`: `proRaw[i] = buyCount[i]`;
  `conRaw[i] = sellCount[i]` (counts, not USD, since the collector only carries net USD).
- Tier 3 `ohlc-volume-split`: `range = high-low`;
  `buyShare = (close-low)/range` (0.5 if range==0);
  `proRaw = volumeUsd*buyShare`;
  `conRaw = volumeUsd*(1-buyShare)`.
- Classification: pro/con "high" iff `>=` `thresholdQuantile` (default median 0.5) of all classifiable bars' own pro/con in that series (adaptive per-series).
  Then `proHigh&&conHigh -> CONTESTED('C')`; `proHigh only -> advancing('A')`; `conHigh only -> refuting('R')`; `neither -> VACUUM('V')`; unclassifiable bar -> `'_'`.
  Tape emitted as a string over alphabet `{A,R,C,V,_}`.

### Shape for an eighth instrument, by analogy

The theory's seven named instruments per `lib/journal/SCHEMAS.md`: `settlement-half-life, obstruction-chart, witness-decay-levels, holonomy-oscillator, wit-flow, foam-gauge, cone-charting` (plus four-state-tape as the primitive).
A consistent eighth instrument should:
(a) trace to a theory note's own definition, quoted verbatim as the header;
(b) implement as a pure function over the canonical bar shape (`t, mid, fundingRate/fundingAvailable, openInterestUsd/openInterestAvailable, signedFlowUsd/signedFlowAvailable/signedFlowIsProxy, proRaw/conRaw, fourStateTapeMethod`) from `src/lib/bars.mjs`, importing only that module;
(c) every measurement carries `available`/`notes` — never a guessed value, `available:false` with an honest reason when a real number can't be derived;
(d) prefer a real/denominated term where the schema supports one, fall back through explicitly-labeled, ranked proxy tiers otherwise;
(e) any thresholds (z-scores, quantiles, sigma multiples) should be self-relative (per-series stdev/quantile) rather than fixed magnitudes;
(f) add a CLI alias in `scripts/instruments.mjs`, a canonical label in the `trading-instrument` dated record's `instrument` enum, and document the formula in `SCHEMAS.md` with the code as authoritative.

### Dated-record filename convention (from `data/state/README.md`)

```
YYYY/MM/DD/YYYY-MM-DD-trading-<record-type>.<extension>
```

`<record-type>` is one of: `snapshot`, `instrument`, `thesis`, `paper-trade`, `live-trade`, `reflection`.
All JSON, append-only per calendar day (first write of the day creates the file; later writes that day append a new uniquely-`id`'d item to the record's array field — `runs` for snapshot/instrument, `theses`/`entries`/`reviews` for journal types — never overwritten, never edited in place).

## 4. Web3/blockchain: what's already there, and where a new entry belongs

**Naming convention**: `X-services-section` nesting via `services/` subdirs;
each level has a README stating purpose, "Holdings," and "Org" (Over/Owns).
Enterprises (leaf orgs) use `-enterprise` suffix.

**Two parallel blockchain trees exist** (the vault has a science/theory side and an engineering/production side, mirrored):

1. **Theory side**: `science-services-section/.../engineering-science-services-section/.../computer-science-services-section/.../blockchain-services-section/` — no README, but has content:
   `content/text/glossary/topics/blockchain.md` (stub), `content/text/glossary/concepts/bet.md` (Bitcoin Exposure Token — a Hive-Engine NAV-pegged token/bot design, the closest existing thing to a "token as attention/value proxy" precedent), `content/text/glossary/terms/autonomous-world.md` (well-developed), `terms/on-chain.md`, `terms/hive-account.md`, `notes/hive-hashtags.md` (Hive tribe/token tags, attention-adjacent curation economies), `notes/autonomous-systems-blockchain-patterns-reconciliation.md` (flags governance/smart-contract/provenance/token-incentive questions as belonging to "blockchain-science research").
   No existing notes on oracles, MEV, or prediction markets anywhere in this tree or elsewhere in the vault.
2. **Production/engineering side**: `engineering-services-section/.../computer-blockchain-system-services-section/` — has a README (Red Cup Engineering's chain infra: Ethereum/EVM, settlement, multi-chain finality, Hive).
   Has its own `autonomous-world.md` term copy but nothing on oracles/MEV/prediction markets/attention tokens.
3. **Public-facing side**: `public-services-section/.../public-blockchain-services-section/` has only one populated child, `blockchain-trashpanda-services-section` (a code project, no README, no theory notes).
4. **DeFi section** (`.../web3-services-section/defi-services-section/README.md`): explicitly for third-party protocol integrations (GMX so far), explicitly *not* the Union's own chain infra.
   Web3-services-section siblings: `agrodao`, `hive-services-section`, `defi-services-section` — all code projects, no theory notes on oracles/MEV/prediction markets/attention.
5. **`curiosity-research-market-enterprise`** (`operations-services-section/.../union-market-services-section/services/curiosity-research-market-enterprise/`) — **no README.md exists**.
   It's an A2A/x402 market (settles on eip155:31337 EVM) for buyer-authored research assignments "motivated by non-evidentiary curiosity" — an on-chain-settled attention/curiosity market.
   This is the closest existing structural precedent for "attention as a priced, blockchain-settled good," though framed as curiosity-research procurement, not Web3-venue speculation.

**Best slot for a new note on Web3-as-venue-for-attention-buys-time-compression**: the theory-side glossary/notes location — `blockchain-services-section/content/text/glossary/concepts/` (sibling to `bet.md`/`autonomous-world.md`) or `articles/notes/` alongside `autonomous-systems-blockchain-patterns-reconciliation.md` — since that tree is the vault's designated home for blockchain-as-research-topic and already holds the one existing token-mechanism writeup.

## 5. Dedup sweep: what already exists that overlaps, and the Alpaca mention resolved

**Directories excluded**: `node_modules`, `.venv`, `.git`, `.hypothesis`, `.pytest_cache`, `data/`/`logs/`/`transcripts/` directories, and — after an initial pass returned ~20MB dominated by raw LLM-provider chat-log JSON — directories literally named `exchanges/`, `retired-json-exchanges.*/`, `ledgers/` under `.../computer-inference-system-services-section/` and under `koios-news/services/newscable-source-broker/data/`.
Even after exclusion, raw hit counts were large (e.g. "Herbert Simon" 112 files, "prediction market" 114, "Monte Carlo" 80, "MEV" 57) because of an enormous auto-generated services-section scaffold with many templated stub pages;
the survey below is targeted (filtered to `documents/articles/notes|essays`, the authored-content convention), not exhaustive.

Nothing in the vault argues the specific synthesis (attention/compute as spendable time → simulate more future → compress into information → signal → trading orders).
The closest and most relevant prior material found:

1. **`science-services-section/content/text/documents/articles/notes/2026/08/20/topology-native-autonomous-crypto-wallets.md`** — the nearest existing document to this pipeline.
   Surveys compute-heavy methods (stochastic control, Monte Carlo-adjacent approaches, mean-field games, deep RL) explicitly mapped to generating trading signals and executing on-chain trades, discusses MEV at length, has a "Social-attention trading" strategy row, and a capital-tiered build plan ($20-$20,000).
   Framed as crypto-trading research rather than a first-principles theory of attention-as-time, but overlaps heavily in mechanism — read in full and linked from the theory note.
2. **`.../economics-services-section/content/text/documents/articles/notes/undated/claim-state-capital-crypto-economic-machinery-for-information-topology.md`** — prices informational objects/claims as financial state;
   names "MEV/OEV-adjacent routing capital" as a capital form.
   Adjacent (information → market pricing) but not about attention/compute-as-time.
3. **`.../personal-services-section/emsenn-services-section/content/text/documents/articles/notes/undated/hive-as-an-attention-stake-economy-capital-yield-labor-governance-and-liquidity.md`** — "attention economy" framing, but in a blockchain staking/curation sense, not compute/time.
4. **`.../agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/.../notes/2026/08/19/2026-08-19-note-on-the-four-dimensional-substrate-and-its-exchange.md`** — treats transaction-ordering discretion (MEV) as a "thermodynamic cost" inside a multi-agent spacetime/coordination economy.
   Conceptually adjacent (time + computation + economy fused) but about agent-coordination protocols, not personal cognition or trading signal generation.
5. **Formal KB atoms** (duplicated verbatim across two `lib/legacy` snapshots, `2026-07-31-lenticule-science-corpus` and `2026-06-23-animating`):
   `.../planning/inference-time-search/inference-time-compute-tradeoff/inference-time-compute-tradeoff.md`, `.../inference-vs-training-compute-tradeoff/inference-vs-training-compute-tradeoff.md`, and `.../deciding/content/bounded-rationality/bounded-rationality.md` (cites Simon 1957, ties inference-time compute to anytime-algorithm tradeoffs).
   Formalize "compute traded for output quality" but never connect it to attention-economy or trading.
6. **`.../science-services-section/content/text/documents/articles/notes/2026/07/14/2026-07-14-research-on-stochastic-probabilistics.md`** — a technical martingale/Itô-calculus survey;
   "attention" appears only in generic English.
   Useful as formal vocabulary for the "compress time into signal" step, not a duplicate.
7. **"poverty of attention" — zero matches anywhere in the vault.**
   If invoking Simon's famous phrase, nothing currently quotes it;
   the one Simon citation found (`.../notes/2026/06/27/2026-06-27-research-on-answerable-management.md`, §3.4) is a generic bounded-rationality citation in an org-theory paper, unrelated to this theory.

No file combines "attention economy," compute-as-resource, and trading-order execution the way this theory does — item 1 (topology-native-crypto-wallets) is the closest, both to avoid overlap and because it already has a live-money hook.

### The Alpaca mention, resolved

`.../emsenn-professionalization-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-professional-identity-evidence-classes-and-the-watch-list-strategy.md`, §9.4 "The seed fund: ~$450 as a laboratory."
It's the **Alpaca trading platform** (brokerage/trading API), not the animal or a person.
Specifics: an "Esther-controlled Alpaca account" (~$150 on hand, ~$300 incoming) framed by "the Leader" as an "AI degen hedge fund" — used as a near-zero-blast-radius laboratory for a witnessed/content-addressed trade-settlement demo.
The note discusses cash-account pattern-day-trader constraints below $25k, Alpaca's paper-trading mode for wiring tests before real money, and explicitly distinguishes this new "Alpaca loop" from a separate, already-audited-as-incomplete "event-contract arbitrage desk (Molt Ledger)."
Directly relevant to the theory note's endpoint — a real venue where the "signal → trading order" step would actually execute — worth a cross-reference even though the note itself is strategy/identity material, not theory.
