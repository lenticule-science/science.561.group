---
title: Idle/Incremental Games as Discrete Growth Systems
description: Models idle and incremental games as discrete resource-growth systems — a state vector of resources, generators, multipliers, cost curves, soft/hard caps, unlocks, prestige, and offline accrual — with the design problem being to keep time-to-next-decision in a target band. Covers growth curves, economy optimization and where greedy ROI fails, prestige as renormalization, simulation/offline architecture, monetization as system variables, case studies, and a minimal TypeScript engine. Duplicate intake of a doc already settled at the idle-games node; kept as dated triage.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["idle-games", "growth-systems", "prestige", "offline-progression", "cost-curve", "game-economy", "monetization", "engine-architecture", "duplicate-intake"]
---

# Idle/Incremental Games as Discrete Growth Systems

## Abstract

Idle and incremental games are best understood as **discrete resource-growth systems**: a state vector accumulates resources; purchases transform future production; unlocks change the dimensionality of the state space; prestige maps compress prior progress into persistent meta-parameters; and offline accrual turns absence into a designed economic input. Their retention comes from alternating smooth growth with discontinuous phase changes. Their monetization usually sells changes to **time, rate, capacity, randomness, or convenience**, rather than content alone.

Anthony Pecorella’s technical articles are still a useful baseline: they explicitly model idle games in terms of currencies, generators, multipliers, costs, prestige, and large-number problems, rather than treating them as mere “numbers go up” toys.  
Source: [Anthony Pecorella, “The Math of Idle Games, Part I,” Game Developer](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i)

---

## 1. Genre definition

An **incremental game** is a game whose central loop is:

```text
accumulate resource → spend resource → increase future accumulation
```

The minimal formal system is:

```math
S_t=(r_t, x_t, u_t)
```

where `r_t` is at least one resource, `x_t` is at least one production-improving asset, and `u_t` is at least one rule that lets the player exchange accumulated resource for improved future production. The defining feature is **positive feedback under player-controlled reinvestment**.

An **idle game** is an incremental game where progress continues with reduced or zero active input. Idleness is therefore not just a mechanic; it is a pacing promise: “time away still matters.” The CHI PLAY paper *It Started as a Joke* emphasizes “active withdrawal” as an essential part of idle-game play, based on designer interviews and analysis of genre conventions.  
Source: [Katta Spiel et al., “It Started as a Joke: On the Design of Idle Games,” CHI PLAY 2019](https://bibbase.org/network/publication/spiel-alharthi-cen-hammer-nacke-toups-tanenbaum-itstartedasajokeonthedesignofidlegames-2019)

A useful technical taxonomy:

| Term | Technical definition |
|---|---|
| **Clicker game** | Active input, usually clicking/tapping, directly produces an early resource stream. |
| **Incremental game** | Reinvestment loop where accumulation increases future accumulation. |
| **Idle game** | Incremental system with passive, asynchronous, or offline progress. |
| **Prestige game** | Reset function maps previous progress into persistent meta-currency or modifiers. |
| **Unfolding game** | State space is initially hidden; new resources, menus, or subsystems appear after thresholds. |
| **Management idle game** | Multiple production nodes, staffing/manager automation, logistics, and efficiency bottlenecks. |
| **Automation game** | Manual procedures become executable rules: managers, autobuyers, scripts, queued actions. |
| **Resource-production game** | The economy is primarily a graph of resources, producers, converters, and sinks. |
| **Tycoon-like idle game** | Business/production fantasy with timers, managers, upgrades, and prestige per enterprise. |
| **Hybrid idle RPG** | Idle accumulation attached to combat, skills, loot, crafting, or character progression. |
| **Live-service idle game** | Idle economy plus events, stores, ads/IAP, telemetry, seasons, server state, and A/B tuning. |

So “idle” can be a mechanic, a pacing structure, a continuity promise, and an attention economy. The player’s absence is not external to the game; it becomes an input variable.

---

## 2. Mathematical primitives

The core mathematical object is a state vector:

```math
State=(resources, generators, upgrades, timers, unlocks, prestige, modifiers)
```

Most idle games are built from a small number of repeatable primitives.

A typical escalating cost ladder is:

```math
y=C_0 r^x
```

| Primitive | Formal structure and example | Pacing effect | Failure mode | Implementation pattern |
|---|---|---|---|---|
| **Resource** | Scalar `r_i ≥ 0`. Example: cookies, gold, antimatter, cash. | Gives visible progress and affordability thresholds. | Too many currencies become opaque. | Store canonical balance; derive display format. |
| **Generator** | Owned count `n_j`, production `p_j n_j`. Example: 10 cursors × 0.1 cookies/sec. | Converts one-time purchases into future rate. | Dominant generator makes all others irrelevant. | Aggregate by type; avoid per-unit simulation. |
| **Production rate** | `dr/dt = Σ n_j p_j M_j`. | Creates waiting-time calculus. | Rate spikes can skip intended unlocks. | Recompute lazily when state changes. |
| **Cost curve** | `C_j(n)=C_0j q_j^n`. Example: cost doubles each purchase. | Forces pacing gaps and prioritization. | `q` too high creates stalls; too low trivializes. | Use bulk-cost formula for buying many. |
| **Multiplier** | `M=Π(1+b_k)` or `M=1+Σb_k`. | Makes upgrades feel discontinuous. | Multiplicative stacks can explode. | Central modifier pipeline. |
| **Compounding** | Production buys production. | Produces exponential-feeling growth. | Runaway growth exceeds number library or content. | Balance against cost exponent and caps. |
| **Polynomial growth** | `r(t) ~ t^k`. | Good for staged systems and derivative chains. | May feel slow without unlocks. | Often appears in nested generators. |
| **Exponential growth** | `r(t) ~ a^t` or costs `C_n=C_0 q^n`. | Lets long games span many orders of magnitude. | Absolute values lose meaning. | Use scientific/log notation. |
| **Soft cap** | Formula changes slope after threshold: `f(x)=T+(x-T)^α`, `0<α<1`. | Slows runaway without hard stop. | Feels punitive if unexplained. | Piecewise formulas with UI disclosure. |
| **Hard cap** | `x ≤ X_max`. | Creates finite goals or storage tension. | Can produce dead stops. | Enforce in reducer, show capacity. |
| **Diminishing returns** | `f(x)=a log(1+x)` or `a(1-e^{-kx})`. | Makes repeated investment less dominant. | Players may stop valuing upgrades. | Use for storage, prestige, drop bonuses. |
| **Unlock threshold** | `unlock = [r>T]` or `[achievement]`. | Changes the optimization problem. | Bad thresholds create long empty waits. | Event check after purchases/ticks. |
| **Bottleneck** | Production chain limited by min-cut: `rate=min(a,b,c)`. | Creates management choices. | Hidden bottlenecks feel unfair. | Dependency graph plus diagnostics. |
| **Sink** | Recurring or one-time resource drain. | Prevents permanent abundance. | Tax-like sinks can feel hostile. | Model as negative flow or purchase category. |
| **Multi-currency system** | Vector `r ∈ R^m`. | Separates progression axes. | Currency bloat. | Resource registry and typed costs. |
| **Nested currency** | Currency A buys B-generator; B unlocks C. | Creates phase structure. | Dependency deadlocks. | Directed acyclic or carefully cyclic graph. |
| **Probability/loot** | Expected value `E[X]=Σp_i x_i`. | Adds variance and collection goals. | Gacha-like systems trigger fairness/regulatory concerns. | Seeded RNG, pity timers, odds disclosure. |
| **Time gate** | Action completes after `T`. | Supports return scheduling. | Excessive waiting becomes pure monetization pressure. | Timers persisted with timestamps. |
| **Offline accrual** | `gain=∫ rate(S(t)) dt`. | Turns absence into progression. | Clock tampering and runaway offline boosts. | Server time or capped client elapsed time. |
| **Catch-up mechanic** | Simulate missed ticks or grant compressed reward. | Lets returning players rejoin curve. | Too generous makes potential play irrelevant. | Cap, approximate, or event-segment offline sim. |
| **Seasonal modifier** | Temporary multiplier or event currency. | Produces re-engagement windows. | Event economy can invalidate core economy. | Modifier with expiry and telemetry tag. |

Pecorella’s terminology—primary currency, generators, exchange currency, multipliers, and prestige—maps closely onto this structure.  
Source: [Anthony Pecorella, “The Math of Idle Games, Part I,” Game Developer](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i)

---

## 3. Growth and pacing systems

Idle games use growth curves because the design problem is not “make numbers large.” It is:

```math
\text{keep time-to-next-interesting-decision within a desired band}
```

### Common growth patterns

| Curve | Formula | Use |
|---|---:|---|
| Linear | `r(t)=at+b` | Early click/tap production, simple passive income. |
| Polynomial | `r(t)=at^k` | Nested generators, derivative-like systems. |
| Exponential | `r(t)=ab^t` or `C_n=C_0q^n` | Long progression across orders of magnitude. |
| Super-exponential | `r(t)=a^(b^t)` or stacked exponentials | Late-game spectacle, dangerous without caps. |
| Logistic/S-curve | `L/(1+e^{-k(t-t_0)})` | Adoption, collection, saturation, soft content gates. |
| Piecewise | Formula changes after milestones. | Prevents a single equation from governing all play. |
| Reset-based | Run growth → reset → meta-growth. | Extends play by restarting at higher scale. |

Incremental games often pair **exponential costs** with **multiplicative production jumps**. If costs grow geometrically but production jumps at unlocks, the game alternates between waiting, purchase bursts, and new optimization regimes. The design problem is to tune the cost ratio `q`, base production `p`, multipliers `M`, and thresholds `T`.

A simple time-to-afford formula:

```math
T_{afford}=\max\left(0,\frac{C-r}{R}\right)
```

where `C` is cost, `r` current resource, and `R` current production rate. Designers can tune target wait times by solving this equation backward.

### Preventing runaway trivialization

Designers use several dampers:

1. **Escalating costs**: later purchases become more expensive geometrically.
2. **Soft caps**: post-threshold returns switch from `x` to `x^α`, `log x`, or a lower multiplier.
3. **Prestige resets**: compress huge prior progress into a smaller persistent variable.
4. **Unlock restructuring**: new resources alter what “best purchase” means.
5. **Storage caps and bottlenecks**: production is not useful unless the chain can absorb it.
6. **Notation changes**: scientific, engineering, alphabetic, or double-log displays preserve legibility.

Antimatter Dimensions is unusually explicit about this: its Steam description calls it an “unfolding” idle game with multiple unlock and prestige layers, automation, challenges, and even a custom scripting language for automation.  
Source: [Antimatter Dimensions on Steam](https://store.steampowered.com/app/1399720/Antimatter_Dimensions/)

---

## 4. Economy and optimization

A formal economy model:

```math
S=(r,g,u,t,\ell,p,m)
```

where:

- `r`: resource vector;
- `g`: generator counts;
- `u`: upgrades;
- `t`: timers/cooldowns;
- `ℓ`: unlock flags;
- `p`: prestige/meta state;
- `m`: active modifiers.

Production:

```math
\frac{dr_i}{dt}=\sum_j A_{ij}g_jp_jM_j(S)-sink_i(S)
```

Cost:

```math
Cost_j(n)=base_j \cdot scale_j^n \cdot discount_j(S)
```

Bulk cost for `k` purchases under geometric scaling:

```math
BulkCost(n,k)=base\cdot scale^n\cdot \frac{scale^k-1}{scale-1}
```

### Purchase optimization

For a candidate purchase `a`:

```math
ROI(a)=\frac{\Delta R(a)}{Cost(a)}
```

```math
Payback(a)=\frac{Cost(a)}{\Delta R(a)}
```

```math
TimeToAfford(a)=\max_i\left(\frac{\max(0,Cost_i(a)-r_i)}{income_i}\right)
```

A naive engine can compute “best next purchase” by minimizing:

```math
Score(a)=TimeToAfford(a)+Payback(a)
```

But real games become interesting when this greedy rule fails. Greedy ROI fails when:

- an upgrade unlocks a new system;
- a purchase affects multiple resources;
- a bottleneck, not total production, limits progress;
- a temporary boost changes the value of waiting;
- prestige timing dominates local purchases;
- mutually exclusive branches exist.

Players informally solve the same problem with heuristics: buy the cheapest upgrade, buy the highest payback improvement, save for unlocks, or prestige when growth slows. The economy collapses into a solved spreadsheet when all purchases are separable, permanent, visible, and ordered by stable ROI.

Pecorella’s Part II explicitly distinguishes standard generator models from derivative-like generator chains where higher tiers produce lower tiers, a structure that changes the player’s optimization problem from “buy best income source” to “manage a cascade.”  
Source: [Anthony Pecorella, “The Math of Idle Games, Part II,” Game Developer](https://www.gamedeveloper.com/game-platforms/the-math-of-idle-games-part-ii)

---

## 5. Prestige/reset mathematics

A prestige system is a function:

```math
Prestige:S\rightarrow S'
```

It erases some local state while preserving compressed information about prior progress.

A common prestige currency function is:

```math
P=\left\lfloor A\left(\frac{E}{K}\right)^\alpha \right\rfloor
```

where:

- `E` is lifetime or peak earnings;
- `K` is a scale constant;
- `0<α<1` gives diminishing returns;
- `A` controls payout magnitude.

The reward may become a multiplier:

```math
M_{prestige}=1+\beta P
```

or a spendable currency for permanent upgrades.

### What prestige preserves

Usually preserved:

- prestige currency;
- permanent upgrades;
- achievements;
- automation unlocks;
- cosmetic or collection state;
- sometimes storage, pets, account level, or premium currency.

Usually erased:

- run-local resources;
- generator counts;
- local upgrades;
- temporary boosts;
- local map/farm/mine progress;
- short-term timers.

Prestige is mathematically close to a **renormalization step**: collapse a huge state into a smaller set of parameters, restart the low-level system, and let the new parameters change the scale of the next run.

Pecorella describes prestige as a reset that grants a multiplier and “reins in” growth while letting players repeat the ladder faster; he notes that many systems use root-like functions rather than pure logarithms, and that prestige can be based on maximum or lifetime earnings.  
Source: [Anthony Pecorella, “The Math of Idle Games, Part III,” Game Developer](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-iii)

### Types of prestige

| Type | Preserved object | Example behavior |
|---|---|---|
| Simple reset-for-multiplier | Multiplier | Reset cash/buildings, gain permanent production bonus. |
| Currency prestige | Spendable meta-currency | Buy permanent upgrades after reset. |
| Skill-tree prestige | Persistent tree | Strategic long-term specialization. |
| Meta-progression prestige | Account-level advancement | Unlocks systems across runs. |
| Challenge reset | Constraint completion | Reset under special rules to earn reward. |
| Seasonal reset | Event-limited economy | Fresh competition or re-engagement. |
| Ascension/reincarnation layers | Higher-order reset | Prestige the prestige layer. |

Failure modes:

- prestige reward too weak: reset feels like lost progress;
- reward too strong: optimal play becomes constant resetting;
- reward opaque: players cannot judge timing;
- too many layers: state becomes cognitively unparseable.

---

## 6. Simulation and implementation

Idle games look simple but stress simulation architecture in unusual ways: extremely large numbers, long offline gaps, save migration, background throttling, and deterministic economy testing.

### Game loop choices

| Architecture | Best for | Risk |
|---|---|---|
| Fixed timestep | Deterministic combat, timers, reproducible tests. | Expensive for long offline periods. |
| Variable timestep | Simple continuous production. | Floating-point drift, frame-rate sensitivity. |
| Event-driven | Timers, purchases, unlocks, automation. | More complex scheduler. |
| Analytic update | Offline income with stable rates. | Hard when autobuyers or stochastic systems run offline. |

Browser implementations must account for background throttling: `requestAnimationFrame` is normally paused in background tabs or hidden iframes, so the game should compute elapsed time from timestamps rather than assuming frame updates continued.  
Source: [MDN Web Docs: `requestAnimationFrame`](https://developer.mozilla.org/en-US/docs/Web/API/Window/requestAnimationFrame)

### What should update every tick?

Update:

- elapsed timers;
- resource deltas;
- active temporary modifiers;
- unlock predicates;
- visible notifications.

Compute lazily:

- total production rates;
- affordability lists;
- large upgrade tables;
- projected time-to-next-unlock;
- formatting of huge values not on screen.

Persist:

- canonical resources;
- generator counts;
- purchased upgrades;
- unlock flags;
- prestige/meta state;
- RNG seed if deterministic;
- active boosts and expiry times;
- last save timestamp;
- version number.

Derive:

- production totals;
- costs from counts;
- UI labels;
- affordability;
- milestone progress bars.

### Offline progress

The simplest offline formula is:

```math
OfflineGain=Rate(S_{save})\cdot \min(\Delta t, Cap)
```

This is exact only if the state does not change while offline. If automation, autobuyers, combat, loot, or capacity caps apply, the engine needs one of these:

1. **Capped linear grant**: cheap but approximate.
2. **Coarse tick simulation**: simulate `N` offline ticks.
3. **Event segmentation**: jump to the next timer, purchase, or cap event.
4. **Hybrid**: analytic production between discrete events.

Antimatter Dimensions documents this tradeoff directly: offline progress is approximate because the game is complex; the player can adjust offline tick count, trading accuracy against performance.  
Source: [Antimatter Dimensions Wiki: Offline Progress](https://antimatter-dimensions.fandom.com/wiki/Offline_Progress)

### Persistence

For browser games, `localStorage` stores strings per origin without an expiration date, making it useful for small saves, though larger or structured saves often need IndexedDB or server/cloud persistence.  
Source: [MDN Web Docs: `localStorage`](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)

For live-service idle games, server-authoritative state is often needed for:

- premium currency;
- purchases;
- ad reward validation;
- competitive events;
- leaderboards;
- anti-clock-tampering;
- cross-device saves.

---

## 7. Monetization as system variables

Monetization in idle games usually modifies the economy through explicit variables:

| Monetization hook | System variable modified |
|---|---|
| Rewarded ad | Temporary multiplier, instant gain, premium currency, cooldown skip. |
| Interstitial ad | Session boundary or interruption; sometimes no direct economy variable. |
| Banner ad | Monetizes time-on-screen. |
| Remove-ads purchase | Removes interruption, sometimes preserves rewarded bonuses. |
| Speed boost | Multiplies `dt`, production rate, or action speed. |
| Premium currency | Buys skips, boosts, cosmetics, permanent upgrades, gacha rolls. |
| Starter pack | Early production multiplier or scarce currency injection. |
| Subscription | Recurring multiplier, daily currency, longer offline cap. |
| Battle/season pass | Event task rewards and retention schedule. |
| Gacha/loot | Randomized modifier acquisition. |
| Time skip | Grants `k` hours of current production. |
| Offline cap extension | Raises `Δt_max`. |
| Convenience purchase | Automation, queueing, inventory, managers. |

Rewarded ad SDKs are built around this economy hook: Unity’s documentation describes rewarded ads granting currency, consumables, lives, or XP multipliers after completion callbacks, and Google AdMob likewise frames rewarded ads as ads watched in exchange for in-app rewards.  
Sources: [Unity Ads: Rewarded ads](https://docs.unity.com/grow/ads/unity-sdk/rewarded-ads), [Google AdMob: Rewarded ads](https://developers.google.com/admob/android/rewarded)

Technically safe paid accelerators tend to be:

```math
Reward = k \cdot CurrentRate \cdot Time
```

rather than a fixed resource amount. This scales with player progress without permanently invalidating the economy. But it can still break pacing if `k` is too large or if the reward bypasses prestige thresholds.

Required telemetry includes:

- D1/D7/D30 retention;
- session length and return interval;
- time to first generator, first unlock, first prestige;
- ad impressions per daily active user;
- rewarded-ad opt-in rate;
- premium currency inflow/outflow;
- ARPDAU, ARPPU, payer conversion;
- bottleneck/drop-off points;
- boost usage before churn.

Unity’s analytics documentation defines N-day retention and standard monetization metrics such as ARPDAU and ARPPU, which are directly relevant to tuning idle progression and monetization.  
Source: [Unity Analytics terminology](https://docs.unity3d.com/2020.1/Documentation/Manual/UnityAnalyticsTerminology.html)

Regulatory and platform constraints matter when rewards are chance-based or tied to payments. Google Play policy, for example, distinguishes fixed-ratio loyalty rewards from variable or chance-based reward mechanisms and imposes disclosure or eligibility restrictions depending on the app type.  
Source: [Google Play Developer Policy: Real-money gambling, games, and contests](https://support.google.com/googleplay/android-developer/answer/17105854?hl=en-ph&rd=1&visit_id=639163315215052460-1634393820)

---

## 8. Real game case studies

Some mechanics below are documented by official pages; others rely on community wikis. Wiki-derived formulas should be treated as implementation observations unless verified against source code or official documentation.

| Game | Core loop | Growth/reset/offline/monetization | Technical lesson |
|---|---|---|---|
| **Cookie Clicker** | Click and buy buildings that produce cookies; upgrades multiply production. | Ascension grants Heavenly Chips and Prestige Levels; the community wiki documents a cubic cookie requirement for prestige levels and heavenly upgrades that can improve offline production. Source: [Cookie Clicker Wiki: Ascension](https://cookieclicker.fandom.com/wiki/Ascension). | Canonical building + upgrade + ascension architecture. Shows how simple primitives scale through notation, achievements, and prestige. |
| **AdVenture Capitalist** | Buy businesses, automate with managers, compound profits. | Angel Investors are claimed by reset; reset wipes money, businesses, upgrades, and unlocks while angels persist. Source: [AdVenture Capitalist Wiki: Angel/Hard Reset](https://adventure-capitalist.fandom.com/wiki/Angel/Hard_Reset). | Clean business-timer model; prestige is legible and commercially compatible. |
| **Clicker Heroes** | Defeat monsters, earn gold, hire heroes for DPS, push zones. | Zone progression creates DPS thresholds; later systems include Ascension and Transcendence. The community guide frames the game around optimizing speed through zones. Source: [Clicker Heroes Wiki: Newbie Guide](https://clickerheroes.fandom.com/wiki/Newbie_Guide%3A_Pre-Transcendence). | Converts idle production into combat throughput. The “resource” is partly damage-per-second and partly zone progress. |
| **Realm Grinder** | Choose factions, produce coins, buy upgrades, reset through abdication/reincarnation. | Reincarnation resets gems/stats/excavations but preserves trophies and grants persistent Reincarnation Power; later reincarnations require higher gem thresholds. Source: [Realm Grinder Wiki: Reincarnation](https://realm-grinder.fandom.com/wiki/Reincarnation). | Factional modifiers make the economy non-separable: “best” depends on build identity and reset layer. |
| **Antimatter Dimensions** | Buy dimensions; higher dimensions produce lower dimensions; unlock Infinity and later layers. | Steam page emphasizes unfolding layers, Infinity Points, challenges, automation, and a custom automation scripting language. Offline progress is approximate and tick-count configurable. Source: [Antimatter Dimensions on Steam](https://store.steampowered.com/app/1399720/Antimatter_Dimensions/). | Strong example of derivative-like production, large-number design, and offline-simulation tradeoffs. |
| **Universal Paperclips** | Make paperclips, optimize price/demand, then unfold into AI, computation, and world-scale production. | A finite narrative incremental game rather than endless live-service idle. Coverage describes it as an AI paperclip-maximization game that escalates from a market simulator into broader resource conversion. Source: [The New Yorker on Universal Paperclips](https://www.newyorker.com/culture/culture-desk/the-unexpected-philosophical-depths-of-the-clicker-game-universal-paperclips). | Demonstrates unfolding as argument: mechanics reveal a philosophical system. |
| **Melvor Idle** | Idle RPG skills, combat, loot, crafting, and progression inspired by RuneScape. | Steam page describes more than 20 skills, interaction between skills, combat, dungeons, offline progression, and cloud save. Source: [Melvor Idle on Steam](https://store.steampowered.com/app/1267910/Melvor_Idle/). | Hybrid idle RPG: resources are skill XP, items, equipment, monsters, and recipes, not one currency. |
| **Egg, Inc.** | Build chicken farm, expand habitats, vehicles, research, contracts, boosts. | Prestige grants Soul Eggs, a permanent boost; reset returns the farm to early egg state while preserving key meta systems. Source: [Egg, Inc. Wiki: Prestige](https://egg-inc.fandom.com/wiki/Prestige). | Strong example of prestige as farm-scale renormalization plus premium boost economy. |
| **Idle Miner Tycoon** | Mine shafts feed elevator and warehouse; managers automate production. | Official site emphasizes managers, investments, mines, events, and earning while away; help page says prestige resets a mine from the beginning with a higher earnings multiplier while preserving other currencies and mines. Source: [Idle Miner Tycoon official site](https://idleminertycoon.com/). | Management idle with visible bottlenecks: shaft/elevator/warehouse balancing is the core optimization problem. |
| **Exponential Idle** | Explicitly mathematical idle game based on exponential growth and formula upgrades. | Official and store pages describe exponential-growth accumulation; the wiki documents upgrade cost formulas, prestige/supremacy currencies, and notation changes including double-log display at extreme magnitudes. Source: [Exponential Idle official site](https://conicgames.github.io/exponentialidle/). | Makes the math foreground rather than hidden. Useful for studying notation and prestige layers. |
| **Kittens Game** | Resource colony sim with kittens, jobs, buildings, science, storage caps, and long planning horizons. | ETC Press paper frames it as a game that incentivizes players to “play less and plan more”; Paragon reset currency gives production/storage bonuses and can be spent on Metaphysics. Source: [The Pleasure of Playing Less](https://kilthub.cmu.edu/articles/book/The_Pleasure_of_Playing_Less_A_Study_of_Incremental_Games_Through_the_Lens_of_Kittens/6686957). | Shows idle design without pure exponential spectacle: scarcity, storage, and planning dominate. |
| **Cell to Singularity** | Tap/generate entropy and ideas, unlock evolution/civilization branches. | Reality Engine and Metabit systems provide reboot/meta-progression upgrades that increase simulation performance. Source: [Cell to Singularity Wiki: Reality Engine](https://cell-to-singularity.fandom.com/wiki/Reality_Engine). | Tree-shaped thematic unfolding plus reboot currency. |

---

## 9. Minimal engine architecture

The smallest serious architecture is a pure state reducer plus formula registries. Do not simulate every owned unit; simulate aggregate types.

```ts
type ResourceId = string;
type GeneratorId = string;
type UpgradeId = string;
type ModifierId = string;
type UnlockId = string;
type PrestigeLayerId = string;

interface DecimalLike {
  add(x: DecimalLike): DecimalLike;
  sub(x: DecimalLike): DecimalLike;
  mul(x: DecimalLike): DecimalLike;
  div(x: DecimalLike): DecimalLike;
  pow(x: number): DecimalLike;
  log10(): number;
  cmp(x: DecimalLike): -1 | 0 | 1;
  max(x: DecimalLike): DecimalLike;
  toDisplay(): string;
}

interface Resource {
  id: ResourceId;
  amount: DecimalLike;
  capacity?: DecimalLike;
}

interface Generator {
  id: GeneratorId;
  produces: ResourceId;
  owned: number;
  baseRate: DecimalLike;
  baseCost: DecimalLike;
  costScale: number;
  unlocked: boolean;
}

interface Upgrade {
  id: UpgradeId;
  cost: Partial<Record<ResourceId, DecimalLike>>;
  purchased: boolean;
  requires?: UnlockId[];
  modifiers: ModifierId[];
}

interface Modifier {
  id: ModifierId;
  target: "global" | ResourceId | GeneratorId;
  mode: "add" | "mul" | "pow" | "cap";
  value: DecimalLike;
  expiresAt?: number;
  source: "upgrade" | "prestige" | "event" | "monetization";
}

interface Unlock {
  id: UnlockId;
  predicate: (s: GameState) => boolean;
  revealed: boolean;
}

interface PrestigeLayer {
  id: PrestigeLayerId;
  currency: ResourceId;
  canPrestige: (s: GameState) => boolean;
  reward: (s: GameState) => DecimalLike;
  reset: (s: GameState, reward: DecimalLike) => GameState;
}

interface GameState {
  version: number;
  now: number;
  lastSavedAt: number;
  resources: Record<ResourceId, Resource>;
  generators: Record<GeneratorId, Generator>;
  upgrades: Record<UpgradeId, Upgrade>;
  modifiers: Record<ModifierId, Modifier>;
  unlocks: Record<UnlockId, Unlock>;
  prestige: Record<PrestigeLayerId, { times: number; currencyEarned: DecimalLike }>;
  rngSeed: string;
}

interface TickResult {
  dt: number;
  resourceDelta: Partial<Record<ResourceId, DecimalLike>>;
  newlyUnlocked: UnlockId[];
  expiredModifiers: ModifierId[];
}

interface OfflineProgressResult {
  elapsedSeconds: number;
  simulatedSeconds: number;
  capped: boolean;
  resourceDelta: Partial<Record<ResourceId, DecimalLike>>;
  method: "analytic" | "coarseTicks" | "eventSegmented";
}

interface SaveFile {
  version: number;
  savedAt: number;
  state: unknown;
  checksum?: string;
}

interface Migration {
  from: number;
  to: number;
  apply: (oldSave: SaveFile) => SaveFile;
}

interface MonetizationBoost {
  id: string;
  kind: "rateMultiplier" | "timeSkip" | "offlineCap" | "premiumCurrency" | "automation";
  value: DecimalLike;
  durationSeconds?: number;
  verified: boolean;
}

interface TelemetryEvent {
  name: string;
  at: number;
  sessionId: string;
  payload: Record<string, string | number | boolean>;
}
```

### Core update loop

```ts
function tick(state: GameState, dt: number): [GameState, TickResult] {
  let next = cloneState(state);
  const delta: Partial<Record<ResourceId, DecimalLike>> = {};

  expireModifiers(next, next.now + dt);

  for (const gen of Object.values(next.generators)) {
    if (!gen.unlocked || gen.owned <= 0) continue;

    const rate = productionRate(next, gen.id);
    const gain = rate.mul(D(dt));

    const res = next.resources[gen.produces];
    const capped = res.capacity ? res.amount.add(gain).min(res.capacity) : res.amount.add(gain);

    delta[gen.produces] = (delta[gen.produces] ?? D(0)).add(capped.sub(res.amount));
    res.amount = capped;
  }

  const newlyUnlocked: UnlockId[] = [];
  for (const unlock of Object.values(next.unlocks)) {
    if (!unlock.revealed && unlock.predicate(next)) {
      unlock.revealed = true;
      newlyUnlocked.push(unlock.id);
    }
  }

  next.now += dt;

  return [next, {
    dt,
    resourceDelta: delta,
    newlyUnlocked,
    expiredModifiers: [],
  }];
}
```

### Purchase validation

```ts
function generatorCost(g: Generator, count = 1): DecimalLike {
  // Geometric bulk cost:
  // base * scale^owned * (scale^count - 1) / (scale - 1)
  const first = g.baseCost.mul(D(g.costScale).pow(g.owned));
  const bulk = D(g.costScale).pow(count).sub(D(1)).div(D(g.costScale - 1));
  return first.mul(bulk);
}

function canBuyGenerator(s: GameState, id: GeneratorId, count = 1): boolean {
  const g = s.generators[id];
  const cost = generatorCost(g, count);
  const currency = s.resources["primary"];
  return currency.amount.cmp(cost) >= 0;
}

function buyGenerator(s: GameState, id: GeneratorId, count = 1): GameState {
  if (!canBuyGenerator(s, id, count)) return s;

  const next = cloneState(s);
  const g = next.generators[id];
  const cost = generatorCost(g, count);

  next.resources["primary"].amount = next.resources["primary"].amount.sub(cost);
  g.owned += count;

  return next;
}
```

### Analytic offline progress

```ts
function computeOfflineProgress(
  saved: GameState,
  resumedAt: number,
  offlineCapSeconds: number
): OfflineProgressResult {
  const elapsed = Math.max(0, resumedAt - saved.lastSavedAt);
  const simulated = Math.min(elapsed, offlineCapSeconds);

  // Exact only when production rates are constant during absence.
  const delta: Partial<Record<ResourceId, DecimalLike>> = {};

  for (const gen of Object.values(saved.generators)) {
    if (!gen.unlocked || gen.owned <= 0) continue;

    const rate = productionRate(saved, gen.id);
    const gain = rate.mul(D(simulated));
    delta[gen.produces] = (delta[gen.produces] ?? D(0)).add(gain);
  }

  return {
    elapsedSeconds: elapsed,
    simulatedSeconds: simulated,
    capped: elapsed > offlineCapSeconds,
    resourceDelta: delta,
    method: "analytic",
  };
}
```

### Prestige reset

```ts
function prestige(s: GameState, layerId: PrestigeLayerId): GameState {
  const layer = PRESTIGE_LAYERS[layerId];
  if (!layer.canPrestige(s)) return s;

  const reward = layer.reward(s);
  let next = layer.reset(s, reward);

  next.prestige[layerId].times += 1;
  next.prestige[layerId].currencyEarned =
    next.prestige[layerId].currencyEarned.add(reward);

  return next;
}
```

### Save/load and migration

```ts
function saveGame(s: GameState): SaveFile {
  return {
    version: s.version,
    savedAt: Date.now(),
    state: serializeCanonicalState(s),
    checksum: checksum(serializeCanonicalState(s)),
  };
}

function loadGame(file: SaveFile, migrations: Migration[]): GameState {
  let current = file;

  while (current.version < CURRENT_VERSION) {
    const migration = migrations.find(m => m.from === current.version);
    if (!migration) throw new Error(`Missing migration from ${current.version}`);
    current = migration.apply(current);
  }

  return hydrateState(current.state);
}
```

---

## 10. Balancing and testing

Balancing is not just changing prices until the game “feels good.” It is controlling the time series:

```math
\{T_{first\ click},T_{first\ generator},T_{first\ automation},T_{first\ prestige},T_{D1},T_{D7},...\}
```

### Metrics that matter

| Metric | Why it matters |
|---|---|
| Time to first purchase | Early comprehension and agency. |
| Time to first automation | When the game becomes idle. |
| Time to first prestige | Whether the reset loop is discoverable. |
| Time between meaningful decisions | Core pacing variable. |
| Resource surplus/deficit by stage | Detects bottlenecks and dead economies. |
| Purchase distribution | Reveals dominant or ignored systems. |
| Offline return interval | Whether absence is valuable but not mandatory. |
| D1/D7/D30 retention | Whether progression supports return behavior. |
| Ad opt-in rate | Whether monetized rewards are compelling. |
| Prestige timing distribution | Whether players understand reset value. |

### Simulation bots

Use deterministic bots with different policies:

```ts
type BotPolicy =
  | "cheapest"
  | "highestROI"
  | "lowestPayback"
  | "saveForUnlock"
  | "idleOnly"
  | "activeClicker"
  | "prestigeAt2x"
  | "adWatcher"
  | "spender";

interface ProgressSnapshot {
  simulatedAt: number;
  primary: DecimalLike;
  productionRate: DecimalLike;
  unlocked: string[];
  generators: Record<string, number>;
  prestigeCurrency: DecimalLike;
}
```

Run snapshots at:

- 1 minute;
- 5 minutes;
- 30 minutes;
- 4 hours;
- 1 day;
- 3 days;
- 7 days;
- 30 days;
- post-prestige run 1, 2, 5, 10.

### Balancing tests

```ts
test("generator costs are monotone", () => {
  for (const g of allGenerators()) {
    expect(generatorCost(g, 2).cmp(generatorCost(g, 1))).toBe(1);
  }
});

test("simple offline equals online for constant-rate production", () => {
  const s0 = fixtureConstantRateState();
  const [online] = runTicks(s0, 3600, 1);
  const offline = applyOffline(s0, 3600);
  expect(closeEnough(online.resources.gold.amount, offline.resources.gold.amount)).toBe(true);
});

test("first prestige is reachable within target window", () => {
  const result = simulateBot("highestROI", { maxSeconds: 7 * DAY });
  expect(result.firstPrestigeAt).toBeBetween(2 * HOUR, 3 * DAY);
});

test("prestige improves second-run rebuild speed", () => {
  const first = simulateToMilestone("firstPrestige");
  const second = simulateAfterPrestige(first.state, "sameMilestone");
  expect(second.elapsedSeconds).toBeLessThan(first.elapsedSeconds);
});

test("premium time skip does not bypass required tutorial unlocks", () => {
  const s = fixtureNewPlayer();
  const boosted = applyTimeSkip(s, 24 * HOUR);
  expect(boosted.unlocks["tutorialComplete"].revealed).toBe(false);
});
```

### Warning signs of broken pacing

- wait time grows while no new mechanic is visible;
- one purchase dominates all others for long periods;
- prestige gives less acceleration than expected;
- offline progress outperforms active play too much;
- paid boost skips learning or invalidates prestige;
- large-number formatting hides relevant ratios;
- automation buys irrationally or unpredictably;
- event economy gives permanent rewards that trivialize base game;
- migration invalidates old saves;
- soft caps are invisible and feel like bugs.

---

## 11. Open technical problems

1. **Exact offline simulation with automation**  
   If autobuyers, stochastic combat, inventories, and caps operate offline, exact simulation may be expensive. Approximation introduces fairness problems.

2. **Readable large-number meaning**  
   Scientific notation solves display, not meaning. Players understand ratios, thresholds, and time-to-goal better than absolute magnitudes.

3. **Balancing non-separable economies**  
   Once resources form dependency graphs, greedy ROI is insufficient. Designers need better tools for multi-resource forecasting.

4. **Ethical monetization of time**  
   Selling skips, boosts, and offline caps can become coercive when the base curve is intentionally painful.

5. **Prestige layer explosion**  
   Multiple reset layers can extend content but also produce opaque meta-state and brittle balance.

6. **Anti-cheat versus offline play**  
   Server authority protects monetized economies, but idle games often promise progress without constant connectivity.

7. **Save migration over years**  
   Long-lived idle games need schema evolution, formula changes, and compensation plans for old saves.

8. **Simulation-based design tooling**  
   The genre needs better public tooling for progression snapshots, automated bot balancing, and sensitivity analysis.

9. **Discoverability of hidden formulas**  
   Too much opacity destroys strategic play; too much transparency turns the economy into a solved spreadsheet.

10. **Live-service event interference**  
    Temporary events can distort the permanent economy unless rewards are carefully bounded or isolated.

---

## 12. Annotated bibliography

### Anthony Pecorella, “The Math of Idle Games” Parts I–III

Core technical source for idle-game currencies, generators, multipliers, cost balancing, prestige, and large-number concerns. Especially useful because it treats idle games as mathematical systems.

- [Part I](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-i)
- [Part II](https://www.gamedeveloper.com/game-platforms/the-math-of-idle-games-part-ii)
- [Part III](https://www.gamedeveloper.com/design/the-math-of-idle-games-part-iii)

### Anthony Pecorella, GDC Vault, “Idle Games: The Mechanics and Monetization of Self-Playing Games”

Industry talk framing idle games through core loops, metagame loops, retention, and free-to-play revenue mechanics.

- [GDC Vault page](https://www.gdcvault.com/play/1022065/Idle-Games-The-Mechanics-and)

### Katta Spiel et al., “It Started as a Joke: On the Design of Idle Games,” CHI PLAY 2019

Academic treatment of idle-game design based on designer interviews; important for the idea that “potential withdrawal” is central to idle gameplay.

- [Bibliographic page](https://bibbase.org/network/publication/spiel-alharthi-cen-hammer-nacke-toups-tanenbaum-itstartedasajokeonthedesignofidlegames-2019)

### Sultan A. Alharthi et al., “The Pleasure of Playing Less: A Study of Incremental Games Through the Lens of Kittens”

Academic study of *Kittens Game* emphasizing planning, delayed attention, and the pleasure of playing less.

- [KiltHub page](https://kilthub.cmu.edu/articles/book/The_Pleasure_of_Playing_Less_A_Study_of_Incremental_Games_Through_the_Lens_of_Kittens/6686957)

### MDN Web Docs: `requestAnimationFrame`, `localStorage`, and JavaScript number limits

Practical implementation references for browser timing, persistence, and JavaScript number limits.

- [`requestAnimationFrame`](https://developer.mozilla.org/en-US/docs/Web/API/Window/requestAnimationFrame)
- [`localStorage`](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- [`Number.MAX_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER)

### break_infinity.js documentation

Technical reference for large-number libraries designed for incremental games beyond normal JavaScript number ranges.

- [break_infinity.js documentation](https://patashu.github.io/break_infinity.js/index.html)

### Unity Ads and Google AdMob rewarded-ad documentation

Implementation references showing how rewarded ads are integrated as verified reward callbacks for in-game rewards, multipliers, or consumables.

- [Unity Ads: Rewarded ads](https://docs.unity.com/grow/ads/unity-sdk/rewarded-ads)
- [Google AdMob: Rewarded ads](https://developers.google.com/admob/android/rewarded)

### Google Play Developer Program Policy

Relevant platform-policy reference for chance-based and loyalty-style reward systems.

- [Google Play policy page](https://support.google.com/googleplay/android-developer/answer/17105854?hl=en-ph&rd=1&visit_id=639163315215052460-1634393820)

### Unity Analytics metrics documentation

Reference for retention and monetization metrics such as N-day retention, ARPDAU, and ARPPU.

- [Unity Analytics terminology](https://docs.unity3d.com/2020.1/Documentation/Manual/UnityAnalyticsTerminology.html)

### Antimatter Dimensions Steam page and community documentation

Useful case study for unfolding mechanics, multiple prestige layers, automation, large-number notation, and offline simulation accuracy/performance tradeoffs.

- [Steam page](https://store.steampowered.com/app/1399720/Antimatter_Dimensions/)
- [Offline Progress wiki page](https://antimatter-dimensions.fandom.com/wiki/Offline_Progress)

### Melvor Idle Steam page

Official source for idle RPG structure: skills, combat, offline progression, cloud saves, and interlocking systems.

- [Melvor Idle on Steam](https://store.steampowered.com/app/1267910/Melvor_Idle/)

### Cookie Clicker community documentation

Useful for ascension, Heavenly Chips, Prestige Levels, and offline-production upgrades. Formula details are community-documented unless verified against source.

- [Cookie Clicker Wiki: Ascension](https://cookieclicker.fandom.com/wiki/Ascension)

### Idle Miner Tycoon official/help pages

Sources for manager automation, earning while away, events, and mine prestige as a reset-with-multiplier mechanic.

- [Idle Miner Tycoon official site](https://idleminertycoon.com/)

### Exponential Idle official/store/wiki pages

Case study for explicit mathematical theming, exponential growth, upgrade cost formulas, prestige/supremacy layers, and notation changes.

- [Exponential Idle official site](https://conicgames.github.io/exponentialidle/)

### Coverage of Universal Paperclips by The New Yorker

Useful for understanding finite unfolding incremental design and the game’s relation to AI maximization thought experiments.

- [The New Yorker on Universal Paperclips](https://www.newyorker.com/culture/culture-desk/the-unexpected-philosophical-depths-of-the-clicker-game-universal-paperclips)
