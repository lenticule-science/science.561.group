---
title: Obsmetrologia financial methods catalog
date-created: 2026-07-18
description: Synthesizes two independent 2026-07-18 mining passes over the Obsmetrologia corpus (../../obsmetrological-services-section/src/services/obsmetrologia) — one from a US quantitative-finance lens, one from a Chinese fintech/market-structure…
---
# Obsmetrologia financial methods catalog

Synthesizes two independent 2026-07-18 mining passes over the Obsmetrologia
corpus (`../../obsmetrological-services-section/src/services/obsmetrologia`)
— one from a US quantitative-finance lens, one from a Chinese
fintech/market-structure lens — into one de-duplicated catalog. Every entry
names the Lean-proved object, the market translation, an honest confidence
rating, and its **state**: `proposed` (not yet code), `implemented` (real
code, running against real data, reported for observation only), or `live`
(a consuming enterprise's real decisions depend on it). See this section's
README for what moving between states requires.

Where both lenses independently proposed the same translation, that's
noted explicitly — it's the strongest evidence in this catalog that a
proposal isn't an artifact of one reading.

---

## 1. Allocation and budget theory

### 1.1 Monotone-budget greedy knapsack — `state: implemented`
**Source:** `Cohomology/AttentionAllocation.lean`, `AllocationSolver.lean`.
Proves a 0/1-knapsack selection under a monotone, irreversible budget is
optimal by greedy marginal-value capture (`attention_allocation`).
**Translation:** rank every candidate trade this tick by expected-value
density (edge per unit capital), fund the best under a real per-tick
capital budget, replacing a flat placeholder trade size. Both lenses
proposed this independently; the US lens additionally flagged that the
firm already reuses this exact theorem for coordination-cost bookkeeping
elsewhere (`allocating-attention`), so this is a second, independent
application of the same proof, not new math.
**Confidence:** rigorous (the optimality proof), speculative-but-real (the
market translation).
**Wired into:** Aagaard's trade sizing (`src/analysis/allocation.mts`),
replacing the `MICRO_QUANTITY` placeholder.

### 1.2 Tie-set degeneracy as choice-bits — `state: implemented`
**Source:** same files. When the optimum is tied across multiple distinct
selections, the two fold directions provably pick different ones
(`bias_witness`), quantified as `choiceBits = log2(|tie-set|)`
(`witness_one_choice_bit`) — zero iff the optimum is unique.
**Translation:** a **portfolio-construction fragility diagnostic**: high
choice-bits on a tick's allocation means the specific trades chosen were
arbitrary tie-breaks among equally-good alternatives, not genuinely
differentiated edge — a reason to size down or flag for review, distinct
from a continuous mean-variance sensitivity analysis because it's a
combinatorial selection-degeneracy count.
**Confidence:** high (US lens) — straightforward to compute by re-running
the allocator under small perturbations and counting distinct near-optimal
selections.
**Wired into:** Aagaard's allocator reports `choiceBits` per tick alongside
the funded selection.

---

## 2. Network rigidity

### 2.1 Percolation / spanning-forest rigidity threshold — `state: implemented`
**Source:** `AperiodicOrder/Tiling/Percolation.lean`,
`Cohomology/CoordinationCohomology.lean`. A cover-nerve is "load-bearing"
**iff** `cells ≥ (entities − components) + 1` — an exact, sharp threshold,
not an asymptotic one — and `density_not_sufficient` proves the same edge
*count* can realize either a floppy (fragile) or load-bearing network:
placement, not count, decides.
**Translation:** build the bipartite nerve of Hive-Engine's pool/token
connectivity graph (tokens = entities, pools = cells) and classify it as
floppy (exactly at the spanning-forest threshold — one pool closing
fragments an arbitrage path) versus load-bearing (redundant cycles exist).
Distinct from Aagaard's existing holonomy-cycle detection: holonomy finds
*whether a cycle is currently profitable*; this finds *whether the cycle's
existence itself is structurally fragile* — useful as a risk qualifier
alongside a detected cycle ("this arb depends on the one pool bridging DEC
and SPS; if that pool's liquidity is pulled, the whole cycle vanishes, not
just gets thinner").
**Confidence:** high (both lenses) — directly implementable as union-find
plus an edge count over the pools Aagaard already reads.
**Wired into:** `analysis/rigidity.mts`, reported on `LiquidityReading` and
the trading readout per tick; verified against real live pool data
(all currently-observed pool graphs read `h1Rank: 0`, i.e. floppy —
every live pool this fleet currently sees is a bridge, worth watching).

### 2.2 Rigidity-threshold contagion radius (Debye graph screening) — `state: implemented`
**Source:** `KineticTheory/Plasma/DebyeGraphScreening.lean`. The screened
potential from a source "charge" is the least fixed point of a monotone
relay-propagation closure — provably monotone in the source and idempotent.
**Translation:** model a large liquidation or a pool exploit as a source
shock on the pool-connectivity graph; the settled "screened cloud" gives a
provably-bounded reachability radius for how far the shock's price impact
propagates through connected pools, with hard monotonicity/idempotence
guarantees a naive iterative simulation doesn't have.
**Confidence:** medium (US lens) — clean math, real engineering lift to
build the attenuation kernel from actual pool depth data.
**Wired into:** `analysis/screening.mts`, using a disclosed simplified
kernel (depth-relative attenuation, bounded [0.1, 1] for guaranteed
termination) rather than the Lean's own kernel construction; reported on
`LiquidityReading` and the trading readout per token. Verified against
synthetic graph data and real live pool data (e.g. a real 3-pool graph
gave SWAP.HIVE a 1-hop reach to both connected tokens, while a token two
hops out took 2 hops to reach back).

---

## 3. Flow equilibrium

### 3.1 Detailed balance / signed net flux — `state: implemented`
**Source:** `ReactionNetworks/DetailedBalance.lean`. For a reversible
reaction pair, `DetailedBalance ⟺ netFlux = 0`; any propensity imbalance
gives a strictly *signed* net flux, not just a magnitude.
**Translation:** treat an AMM pool's buy/sell swap flow as a reversible
reaction with propensities fit from realized swap direction/volume; a
nonzero, signed net flux is a rigorous directional order-flow signal —
"this pool is currently running structurally in direction D" — with a
built-in null test (the theorem states exactly when the signal is
provably zero, not just small). Both lenses proposed this independently,
each citing real academic precedent (Sandhu/Georgiou/Tannenbaum-adjacent
econophysics work on market non-equilibrium; Seifert-style stochastic
thermodynamics applied to order flow).
**Confidence:** medium-high (both lenses, converging).
**Wired into:** `analysis/flow.mts`, fed by the market contract's real
`tradesHistory` table (verified shape); reported on `LiquidityReading`
and the trading readout. Verified against real live fills (e.g. DEC:
buyVolume 1482.9, sellVolume 2235.8, netFlux -752.9, unbalanced — a real,
plausible directional read).

---

## 4. Capacity bounds

### 4.1 Catabolic Lyapunov termination — `state: implemented`
**Source:** `ReactionNetworks/FreeEnergyDescent.lean`. In a catabolic
reaction network (every reaction strictly destroys total particle count),
total count is a Lyapunov potential, giving a **hard combinatorial bound**
on the number of possible reaction events — not an asymptotic decay rate.
**Translation:** define "mispricing mass" as a detected holonomy cycle's
total absolute log-deviation from no-arbitrage; each trade that closes part
of the cycle consumes some of that mass. The theorem gives a hard ceiling
on how many more times that specific cycle can be profitably traded before
its edge is provably exhausted — a discrete capacity bound, distinct from
an Ornstein-Uhlenbeck mean-reversion half-life because it's a conservation
law, not a decay-rate estimate. Both lenses proposed this independently.
**Confidence:** speculative-but-real (both lenses agree: cheap to
implement, main risk is that real mispricing mass can be replenished by
new information, so this bounds capacity *within a regime*, not in
absolute terms — must be labeled as such wherever reported, never as an
absolute ceiling).
**Wired into:** `analysis/capacity.mts`, reported on `TradingPlan` and the
trading readout per detected cycle; verified against real live data
(e.g. a real cycle read `mispricingMassHbd: 2.43, depthHbd: 37.08,
capacitySteps: 0` at a 5 HBD trade size — its edge is real but too small
to fund even one full-sized trade of that cycle right now).

---

## 5. Causal order and attribution

*Lower priority for Aagaard specifically*: Hive's blockchain gives a clean,
total, block-and-transaction-ordered causal history already — the
TradFi-motivating problem these methods solve (T+1 lag, cross-venue clock
disagreement, trading-halt ambiguity) mostly doesn't arise on-chain. Kept
in the catalog because a later consuming ME trading conventional markets
(or Aagaard itself reasoning about off-chain signal timing, e.g. curation
reward windows vs. external price moves) could still use them.

### 5.1 Causal-set partial order as a halt/lag-native alternative to Granger causality — `state: proposed`
**Source:** `CausalSets/Causal/{Order,Reachability,RegimeSection}.lean`.
Proves path-reachability is exactly Boolean transitive closure, "discrete
proper time" (longest causal chain) satisfies a *reverse* triangle
inequality, and causal-past cardinality gives a strictly monotone global
time function that ties spacelike (genuinely simultaneous/ambiguous)
events rather than force-ordering them.
**Translation (Chinese lens):** for markets with genuine causal ambiguity
(trading halts, T+1 settlement, cross-border relay lag), build the event
DAG only from unambiguous direct precedences and use transitive closure
rather than a forced total time index — two events with no path either way
are *provably* incomparable, not "coincidentally simultaneous."
**Confidence:** rigorous (the reachability engine), speculative-but-real
(as a causality model, no existing literature precedent found).

### 5.2 Paraconsistent (FOUR-valued) causal reports — `state: proposed`
**Source:** `CausalSets/Causal/ParaconsistentCone.lean`. Causal claims
valued in the `Charge` bilattice, with a proven commutative, inflationary
merge (`mergeReports`) that never silently resolves genuine disagreement.
**Translation:** when independent feeds disagree on event order (real
around halts/reconciliation), report the contradiction explicitly (`⊤`)
and propagate it, rather than picking one source or averaging.
**Confidence:** speculative-but-real.

### 5.3 Möbius-incidence inclusion-exclusion causal attribution — `state: proposed`
**Source:** `CausalSets/Incidence/Mobius.lean`. Hall's theorem, mechanized:
the Möbius function of a causal order equals the alternating signed count
of all causal chains between two events.
**Translation (US lens):** given a lead-lag DAG built by standard means
(transfer entropy, Granger tests), use the Möbius weight as an exact
inclusion-exclusion correction for multi-path over-counting in causal
attribution — "how much of B's move is *net* attributable to A once every
intermediate path is corrected for" — distinct from additive/Shapley-style
attribution, which double-counts multi-hop influence on a DAG with
multiple paths.
**Confidence:** medium — order theory is airtight and directly portable
(a few dozen lines of recursive Möbius computation); the attribution
application itself has no known prior art.

### 5.4 Benincasa–Dowker discrete d'Alembertian on a latency-based causal order — `state: proposed`
**Source:** `CausalSets/Operator/BenincasaDowker.lean`. The discrete wave
operator's coefficients are *forced* (unique solution of a moment-
annihilation system), giving exact stencils that work on an irregular
partial order rather than assuming regular sampling.
**Translation (US lens):** cross-venue/cross-datacenter event timestamps
can't be totally ordered by a shared clock at sub-millisecond scale (real
precedent: Wissner-Gross & Freer's relativistic-statistical-arbitrage work
on exchange-colocation light cones). Build the causal order from measured
propagation latencies; apply the corpus's stencil (derived from the
order's own interval-abundance structure) as a well-posed second-difference
operator, rather than a time-bucketed finite difference that assumes a
global clock that doesn't exist at that scale.
**Confidence:** medium — rigorous math, but a real engineering project
(measured latency causal order), not a quick signal. Not relevant to
Hive's own settlement layer (block-ordered already); would matter only for
reasoning about off-chain price-feed latency.

---

## 6. Regulatory/rule-based settling

*Also lower priority for Hive/Aagaard specifically* — these translations
target markets with an active regulator issuing discrete interventions
(circuit breakers, quota systems, delisting rulings), which has no direct
analogue in Hive-Engine's permissionless contract layer. Kept for
completeness and for any later TradFi- or CeFi-adjacent consuming ME.

### 6.1 Datalog-style rule closure as regulatory-intervention fixed point — `state: proposed`
**Source:** `Closure/RuleSystem.lean`. The immediate-consequence operator's
least fixed point above any seed is proved, exactly Datalog/van Emden–
Kowalski semantics.
**Translation (Chinese lens):** encode circuit-breaker/margin-escalation
rules as `ClosureRule`s; the fixed point is the market's minimal
regulatory-settled state, categorically distinct from a free-market
equilibrium because it's a rule-system fixed point over positive
(never-retracting) antecedents — the formal structure of how a
regulatory trigger actually behaves (it doesn't un-fire).
**Confidence:** rigorous (the closure engine), speculative-but-real (the
specific rule encoding).

### 6.2 Four-regime settling classifier — `state: proposed`
**Source:** `Closure/Regime.lean`. Proves a mutually-exclusive, jointly-
exhaustive four-way classification of any settling process, with a
cohomological obstruction (`H¹`) that vanishes exactly in the two "clean"
regimes.
**Translation:** classify how a trading halt or intervention resolved —
cleanly (bounded rounds, no residual obstruction) versus leaving a genuine
unresolved obstruction (conflicting reopening prices, contested
delisting) — as a decidable three-flag test computable from operational
data.
**Confidence:** speculative-but-real.

### 6.3 Settling monotonicity, quiescence, and cosettling — `state: proposed`
**Source:** `Closure/SettlingMonotonicityQuiescence.lean`. Information
never retracts in the knowledge order (contradiction accumulates toward
`⊤`, isn't averaged away); "cosettling" computes the finite lattice of all
prior information states consistent with a given observed outcome.
**Translation:** model rumor/investigation states the same never-retracts
way (matches sentiment-driven markets better than a scalar score that can
silently flip sign); use cosettling for forensic backtesting of what the
market could plausibly have known before a confirmed event.
**Confidence:** speculative-but-real.

### 6.4 Quota systems as chemical reaction networks — `state: proposed`
**Source:** `ReactionNetworks/{Network,Reachability}.lean`. Capital flow
as a vector-addition system: reactions consume finite resource counts,
firing is proved non-monotone (genuinely resource-constrained), and
`Coverable` is the decidable "can this target state ever be reached"
query, distinct from full (generally undecidable) reachability.
**Translation:** model quota-constrained capital flows literally as
`Species`/`Reaction` (quota-units consumed per cross-border trade); a risk
desk's "can we reach this exposure given remaining quota across several
legs" question is exactly `Coverable`, answerable by standard Petri-net
coverability methods.
**Confidence:** rigorous (discrete mechanics), speculative-but-real (as
the right abstraction — this is a faithful literal model, not a metaphor,
for markets with actual hard quota caps).

---

## 7. Aperiodic order

### 7.1 Substitution-matrix spectral class (Pisot/Salem) — `state: proposed`
**Source:** `AperiodicOrder/Tiling/StepN/SubstitutionMatrix.lean`. Proves
concrete substitution matrices (Fibonacci, Padovan) satisfy specific
annihilating polynomials by exhaustive computation, not fitting.
**Translation:** fit a substitution rule to a discretized price-move
sequence; a Pisot eigenvalue signature means genuine non-periodic
long-range order — a third alternative to "no structure" (random walk) and
"some periodicity" (seasonal/cyclical), not a parameter variant of
existing technical analysis.
**Confidence:** speculative-but-real (translation), rigorous (underlying
linear algebra).

### 7.2 Diffraction-type classifier — `state: proposed`
**Source:** `AperiodicOrder/Tiling/Diffraction.lean`. A three-way
pure-point / singular-continuous / absolutely-continuous decomposition,
cross-validated internally against the closure-regime and Pisot/Salem
classifiers agreeing on one answer.
**Translation:** classify a return-sign sequence into quasi-periodic
(tradeable), edge-of-chaos (structured but not exploitable at any finite
lag), or genuinely random — with a built-in internal consistency check a
single statistical test (Hurst exponent, autocorrelation cutoff) lacks.
**Confidence:** stretch — internal consistency is real; whether real price
data populates these three classes usefully is untested.

---

## 8. Kinetic/glass dynamics

### 8.1 Kinetically-constrained facilitation cascades — `state: proposed`
**Source:** `AperiodicOrder/GlassDynamics/{KCM,Heterogeneity}.lean`. A
proven monotone, terminating facilitation-closure (a site activates once
enough neighbors already have) plus a dynamic-heterogeneity mobility count.
**Translation:** model market-maker quote withdrawal as a KCM (a maker
freezes only once neighboring makers already have) — real precedent in
Bouchaud-school econophysics literature on glassy order-book dynamics.
Mobility-count spikes ahead of a full freeze are the discrete analogue of
the dynamic-heterogeneity precursor to a glass transition.
**Confidence:** medium-high (real precedent for the mechanism), medium
(this specific formalization's edge over existing threshold-cascade
models).

### 8.2 Ornstein-Zernike correlation completion — `state: proposed`
**Source:** `KineticTheory/Liquid/OrnsteinZernikeClosure.lean`. A
provably-least-fixed-point closure propagating a partial "direct
correlation" seed into a full "total correlation" field.
**Translation:** propagate partially-observed pairwise asset correlations
into a full structure with a proven minimality guarantee, as an
alternative to Ledoit-Wolf shrinkage.
**Confidence:** speculative — the analogy (correlation matrix ↔
pair-density field) is this catalog's own construction, unvalidated
against shrinkage-estimator benchmarks.

### 8.3 Quasineutrality relaxation bound — `state: proposed`
**Source:** `KineticTheory/Plasma/Quasineutrality.lean`. Net imbalance is
a strictly decreasing Lyapunov function; quasineutrality is reached in at
most `imbalance`-many discrete steps.
**Translation:** bound the number of hedge trades needed to neutralize
inventory imbalance, as a discrete alternative to an Ornstein-Uhlenbeck
convergence estimate.
**Confidence:** speculative-but-real (assumes unit-size counter-trades,
a simplification of real partial-fill hedging).

### 8.4 Molecular-chaos correlation-minor breakdown alarm — `state: proposed`
**Source:** `KineticTheory/Gas/MolecularChaosGluing.lean`. A 2×2
connected-correlation minor that must vanish under independence, with a
concrete maximally-correlated case that provably can't factorize.
**Translation:** a formal name and exact statistic for "in a crash all
correlations go to 1" — run the minor test pairwise across a factor
model's residuals during stress windows as a principled alarm, rather than
a rolling-correlation threshold.
**Confidence:** speculative-but-real.

---

## 9. Contextuality

*Stretch across the board* — real, rigorously-proved mathematics (KCBS,
PR-box, cohomological contextuality are established results, not invented
here), but every market translation below is this catalog's own
construction with no existing literature precedent found by either lens.

### 9.1 XOR-contextuality as a Condorcet-cycle generalization for combined rankings — `state: proposed`
**Source:** `QuantumContextuality/CohomologicalContextuality.lean`. "No
consistent global explanation" is exactly nonvanishing Čech `H¹` on a
context graph.
**Translation:** test whether combining multiple overlapping-window
ranking signals into one blended score is *structurally impossible*
(a cycle-sum obstruction), not just noisy — a rigorous generalization of
Condorcet-cycle detection in rank aggregation.
**Confidence:** medium (the cohomology; a few lines of code), stretch (the
ranking-cycle translation).

### 9.2 KCBS pentagon as a hidden-coordination test — `state: proposed`
**Source:** `QuantumContextuality/KCBS.lean`. Classical independence bound
`α(C₅)=2` proved by exhaustion, against a proved-higher quantum bound.
**Translation:** build a genuinely-pairwise-exclusive 5-cycle of market
triggers (limit locks, circuit breakers, basis constraints) and test for a
Bell-inequality-style violation of the classical bound as a witness of
non-independent-agent behavior.
**Confidence:** stretch — requires a genuinely logically-exclusive
structure, not merely anti-correlated instruments.

### 9.3 PR-box no-signaling as a cross-venue quote-consistency test — `state: proposed`
**Source:** `QuantumContextuality/EmpiricalModel.lean`.
**Translation:** test whether two venues' quote distributions sharing a
reference price are genuinely context-independent, versus violating
no-signaling in a way a same-timestamp comparison would miss.
**Confidence:** stretch.

---

## 10. No-arbitrage combinators

### 10.1 EOS-admissibility as a curve-combination library — `state: proposed`
**Source:** `DenseMatter/Neutron/EOS.lean`. Stability (monotone) and
causality (bounded slope) constraints, with a proved closure-under-max
combinator.
**Translation:** structurally identical to standard static no-arbitrage
constraints (monotone option prices in strike, bounded-slope discount
curves). Reuse the proved combinator when reconciling two independently-fit
monotone price curves from different venues (e.g. take a pointwise
max/min) while automatically preserving no-arbitrage admissibility, rather
than re-checking after each ad hoc combination.
**Confidence:** high as a software pattern, low novelty as a trading idea
(static no-arb checks are already standard practice) — the value is a
small proved combinator library, not a new signal.

---

## 11. Signal-combination methodology

### 11.1 Currency cocone as a principled multi-signal combiner — `state: proposed`, architectural
**Source:** `Cohomology/CurrencyCocone.lean`. Five distinct `H¹`-style
"prices" over one shared nerve are proved to satisfy real ordering
inequalities, bundled into a cocone whose colimit (max) is the least value
all five factor through — a proved universal property, not a fitted blend.
**Translation:** once at least two of the signals above (2.1, 3.1, 4.1,
...) are actually implemented over the same underlying market-structure
graph, empirically check whether they satisfy an analogous ordering
inequality, and if so use the proved colimit as the canonical composite
risk score instead of an ad hoc weighted ensemble.
**Confidence:** medium, and gated on having ≥2 real signals to combine
first — not actionable today.

---

## 12. Ledger settlement

### 12.1 Two-witness reconciliation reading — `state: implemented`
**Source:** `CausalSets/Causal/ParaconsistentCone.lean` (the `Charge` bilattice
of §5.2) as realized by the accounting model in
`@red-cup-engineering/organizing` (`src/accounting/ledger.mts`), which settles
every transaction and balance assertion as a FOUR cell through the one descent
of `@red-cup-engineering/relating` and holds a failed assertion as data.
**Translation:** for each (account, commodity) the reading names whether the
balance has two independent witnesses (a posting and a counterparty
assertion that agree), one, none, or two that contradict: verdicts agreed,
posted-only, asserted-only, inactive, mismatch. An unwitnessed account is
unknown, never zero. Code: `reconciliationReport` in organizing 0.1.14,
command `farolfi reconcile` in the Farolfi checkout. Measured on the main
ledger 2026-09-04: agreed 168, mismatch 0, posted-only 164, asserted-only 0,
inactive 131. Theory carrier: the accounting section's note
`reconciliation-as-a-two-witness-reading.md`.
**Confidence:** implemented and measured; the identification of the
unreconciled count with an obstruction class is conjecture there, not here.

## What's actually implemented right now

§1.1, §1.2 (monotone-budget allocator with choice-bits degeneracy
reporting), §2.1 (percolation rigidity), §3.1 (detailed-balance flow
direction), §4.1 (catabolic capacity bound), and §2.2 (Debye graph
screening reach) are wired into Aagaard and verified against real live
data as of this catalog's last update. All are `implemented` (real,
reported for observation) rather than `live` (gating an actual trade
decision) except §1.1/§1.2, which directly size and select real trades.
Everything else in this catalog remains `proposed`.

Fixing §1.1/§1.2 into real trade sizing also surfaced and fixed two real
bugs the previous flat-placeholder sizing had masked: corridor trades
built their pair in the wrong give-up/acquire direction (broadcasting a
sell of the token the strategy meant to buy), and computed quantities
ignored each token's own on-chain decimal precision. Both confirmed via
failed real broadcasts on-chain, both fixed and reverified.

A further real, separate gap surfaced during this work has since been
closed: every corridor "buy" trade needs the account to hold SWAP.HIVE
(Hive-Engine's wrapped token), but this fleet's real capital sat as plain
HIVE/HBD on the base chain. Real HIVE<->SWAP.HIVE wrapping/unwrapping is
now built (verified against the live deployed hivepegged contract and a
real on-chain deposit) and wired to auto-fund a tick's shortfall from
real liquid HIVE holdings, within a fixed reserve. One remaining real
constraint, not a bug: sigmund-vexler and help-fund currently hold
essentially zero LIQUID HIVE (their value sits in staked Hive Power or
HBD instead) — the wrap mechanism is correct but has nothing to convert
for those two accounts until real liquid HIVE exists there.

Remaining `proposed` items are unprioritized past this point; §1.1
through §4.1 covered this catalog's highest-confidence, cheapest, and
most cross-lens-convergent entries.
