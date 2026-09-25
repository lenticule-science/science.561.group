---
title: Topology-Native Autonomous Crypto Wallets
description: "Thesis: yes, information topology, sheaf/fiber models, paraconsistent and infinitely-valued logic, and linear/resource-sensitive logic can plausibly produce new private financial-analysis and autonomous-execution methods for crypto wallets."
keywords:
  - autonomous-wallets
  - defi
  - sheaf-obstruction
  - paraconsistent-market-state
  - linear-logic
  - resource-budget
  - no-trade-filter
  - account-abstraction
  - mev
  - liquidity-topology
  - persistent-homology
  - agent-safety
  - investment-adviser-risk
---
# Topology-Native Autonomous Crypto Wallets

## Abstract

**Thesis:** yes, information topology, sheaf/fiber models, paraconsistent and infinitely-valued logic, and linear/resource-sensitive logic can plausibly produce *new private financial-analysis and autonomous-execution methods* for crypto wallets. The novelty is not “AI predicts price better.” The novelty is a different representation of market state: local-to-global inconsistency, contradictory evidence, provenance, liquidity fragmentation, stale information, wallet-flow regimes, and hard resource budgets. That is especially suitable for DeFi because crypto markets expose graph structure, pool state, liquidity surfaces, wallet identities, oracle updates, bridge flows, mempools, governance events, and transaction execution risk in a way traditional markets usually do not.

The cold conclusion is that **the first realistic edge is not high-frequency MEV or CEX/DEX arbitrage**. Those are already dominated by specialized searchers, builder relationships, low-latency infra, and capital. A better first direction is a **private, non-custodial, own-wallet agent** that uses topology/paraconsistency as a *risk-aware signal and no-trade filter*, then executes tiny, allowlisted swaps or rebalances under strict spending caps. Coinbase’s AgentKit/Agentic Wallet, x402, Safe modules, ERC-4337, and EIP-7702 show that agent wallets and delegated execution are becoming real infrastructure, while recent x402 security papers show that payment/agent protocols still have serious replay, context-binding, and atomicity issues.

---

## 1. Current landscape of AI crypto trading agents

The current market separates into five layers.

### CEX bot platforms

3Commas, Cryptohopper, Bitsgap, Pionex, and similar tools mostly automate exchange API-key trading: grid bots, DCA, trailing stops, portfolio rebalancing, copy trading, market-making templates, and alert-driven execution. 3Commas emphasizes exchange account management through API keys; Cryptohopper markets 24/7 automation, DCA, trailing features, AI, and copy trading; Bitsgap integrates with many exchanges via API keys; Pionex bundles bot features inside an exchange-like trading venue. These products are real, but their “AI” is often thin or black-box marketing layered over ordinary automation.

### On-chain analytics platforms

Nansen, Dune, Glassnode, DeFiLlama, Flipside/SonarX, Arkham-like systems, and DEX Screener-style tools provide wallet labels, token flows, TVL, fees, liquidity, price charts, and SQL/API access. Nansen currently claims hundreds of millions of labeled addresses and “Smart Money” wallet tracking; Dune offers SQL/API-style on-chain datasets across many chains; DeFiLlama exposes DeFi TVL, volume, fees, stablecoins, yields, and protocol data. These are closer to the data layer a topology-native agent needs.

### DeFi automation and yield tools

DeFi Saver offers non-custodial automation for liquidation protection, loss minimization, gain locking, and yield automation. Yearn v3 vaults automate yield generation through ERC-4626 strategies. Enzyme supports on-chain asset-management vaults interacting with many protocols. These are not usually alpha-prediction engines; they are automated position-management and strategy-infrastructure systems.

### Agentic wallet systems

Coinbase AgentKit and Agentic Wallet explicitly give agents wallets and on-chain actions. AgentKit supports wallet actions and framework-agnostic integrations; Coinbase’s Agentic Wallet is framed as a suite for agents to hold, spend, trade, and earn stablecoins with guardrails. x402 targets web-native, machine-to-machine payments. Safe modules, Safe spending limits, ERC-4337, and EIP-7702 supply the permissioning substrate: session keys, spending caps, account abstraction, smart accounts, and weaker scoped subkeys.

### What is missing

Almost nobody publicly appears to use sheaf obstruction, paraconsistent market-state lattices, or linear-logic resource accounting as the core representation of an autonomous wallet’s market reasoning. Most systems optimize *trading convenience* or *execution automation*, not deep inconsistency-aware market predication.

---

## 2. Frontier mathematical finance

| Method | What it solves | Crypto/DeFi relevance | Independent-builder feasibility |
|---|---|---|---|
| Stochastic control / optimal stopping | Sequential decisions under uncertainty | Rebalancing, liquidation avoidance, gas-aware execution | Medium |
| Reinforcement learning / deep RL | Learn trading/hedging policies from simulated environments | Portfolio control, LP range management, execution | Hard; high overfit risk |
| Deep hedging | Risk-aware hedging under frictions | Perps/options, LP impermanent-loss hedging | Hard unless derivatives data exists |
| Mean-field games | Many interacting agents | LPs, bots, retail, whales, MEV searchers | Research-heavy but relevant |
| Rough volatility / rough paths / signatures | Irregular time-series path features | DEX liquidity/volume trajectories, order flow | Feasible for feature research |
| Optimal transport / Wasserstein DRO | Robust decisions under distribution shift | Regime shifts, pool-liquidity migration, robust allocation | Feasible |
| Graph ML / temporal GNNs | Learn from wallet-token-protocol graphs | Wallet flows, scams, whale regimes | Feasible with data pipeline |
| TDA / persistent homology | Shape/regime features in point clouds/graphs | Wallet-flow topology, liquidity fragmentation | Feasible for signals |
| Sheaf data fusion | Local-to-global consistency of heterogeneous data | Contradiction among price, liquidity, wallet flow, social claims | Highly novel, feasible at prototype scale |
| Paraconsistent / many-valued logic | Reason under contradiction without explosion | Simultaneous bullish/bearish evidence | Feasible |
| Linear logic / resource logic | Track scarce consumed/locked resources | Gas, slippage, risk budget, authority, stale evidence | Very feasible for guardrails |

Signature methods are already used in finance, including optimal execution, where a trading policy can be approximated as a linear functional on truncated path signatures. Wasserstein distributionally robust optimization is a mature robust-optimization framework that chooses decisions performing well under adverse distributions near the empirical distribution. Reinforcement learning in finance is active but fragile: surveys emphasize complexity, randomness, information asymmetry, and multi-agent structure. Deep hedging frames hedging as risk-averse stochastic control and actor-critic learning.

For this project, the strongest math is not “train a giant RL trader.” It is **structured signal representation plus formally bounded execution**.

---

## 3. Crypto/DeFi market structure

Crypto differs from traditional markets because much of the market state is public, composable, and directly executable. DEXs use AMMs rather than central order books. Uniswap’s documentation describes AMMs/constant-function market makers, concentrated liquidity, and newer hook/flash-accounting architecture. MEV is central: Flashbots describes its mission as mitigating negative externalities of maximal extractable value, and recent CEX/DEX arbitrage research finds that a small number of searchers captured a large share of extracted value, with profitability tied to builder integration.

### Signals only or unusually available on-chain

Wallet accumulation/distribution, exchange inflows/outflows, token holder concentration, LP position migration, protocol TVL changes, bridge flows, stablecoin peg stress, liquidation queues, oracle updates, governance execution, token emissions, vesting unlocks, smart-contract approvals, deployer behavior, and labeled “smart money” flows.

### Edges accessible to small wallets

The realistic small-wallet edge is not speed. It is **selectivity**: avoiding bad tokens, stale narratives, fragile liquidity, toxic pools, and overtrading; entering only when independent local signals cohere; using better gas/slippage/no-trade logic; and exploiting slow contextual relations before retail dashboards compress them into obvious signals.

### Capital tiers

| Capital | Realistic experiments | Avoid |
|---:|---|---|
| $20 | Paper trading, tiny Base swaps, no leverage, no bridging, signal logging | MEV, illiquid meme sniping, perps |
| $200 | Small basket rebalancing, stablecoin depeg monitoring, wallet-flow alerts | High-gas Ethereum mainnet |
| $2,000 | LP experiments, event-driven trades, limited arbitrage scans | Latency races |
| $20,000 | Serious routing, LP management, basis/perps tests, infrastructure spend | Public-user custody without legal review |

Base is a plausible first chain because it is an Ethereum L2 built by Coinbase and positioned as low-cost and developer-friendly; it also has AgentKit/Base ecosystem alignment.

---

## 4. Information topology as alpha

Model the market as a site or indexed family of contexts:

- **Objects:** tokens, wallets, pools, protocols, chains, bridges, narratives, oracle feeds, governance events.
- **Open sets:** local contexts where a signal is valid, such as “USDC pools on Base,” “wallets interacting with token X in the last 6 hours,” “pools sharing token A,” “bridged liquidity from chain C,” or “social claims about protocol P.”
- **Restrictions:** moving from a broad context to a narrower one, for example from all liquidity to only executable liquidity under $20 size and 1% slippage.
- **Sections:** local observations: price, liquidity, holder distribution, wallet flows, narrative claims, oracle state, contract risk.
- **Gluing:** consistency among local observations.
- **Obstruction:** failure of local observations to glue into a coherent global state.

Sheaf theory is already used as a formal language for heterogeneous data fusion: Robinson describes sheaves as canonical data structures for sensor integration, and later work frames sheaves as storing information over a relational/topological space with consistency constraints.

### Trading interpretation

A sheaf obstruction is not automatically an arbitrage. It is a *typed inconsistency*. Examples:

- Price glues, liquidity does not: apparent arbitrage is not executable.
- Social narrative glues, wallet flows refute: attention pump risk.
- DEX price and CEX price disagree, but gas/slippage destroys profit: non-executable discrepancy.
- Token looks bullish globally, but local holder topology shows insider concentration.
- Stablecoin peg appears stable globally, but bridge-specific liquidity topology is fragmenting.

This is a strong candidate for proprietary research because it can become a **contradiction map**: not a scalar score, but a localization of where evidence fails.

---

## 5. Paraconsistent and infinitely-valued market states

Classical buy/sell scoring collapses contradictory evidence. Crypto often has contradictory states: “liquid but fragile,” “accumulating but rug-risky,” “narratively hot but structurally weak,” “cheap but untradeable,” “bullish on-chain but bearish unlock schedule.”

Paraconsistent logic is designed to reason from inconsistent information without explosion. There is also recent work applying paraconsistent annotated evidential logic to futures trading signals, though that work is still closer to indicator aggregation than a full crypto market-state calculus.

A practical token state can be represented as:

```math
S_T = (B, R, U, L, E, P)
```

where:

- `B`: degree of support for bullish continuation.
- `R`: degree of refutation.
- `U`: uncertainty / missingness.
- `L`: liquidity/executability.
- `E`: execution risk.
- `P`: provenance quality.

This avoids collapsing to “score = 0.63.” A token can be both `B = 0.8` and `R = 0.7`. The result is not “neutral”; it is **contested-high-energy**. That may imply no-trade, smaller size, manual review, or wait-for-resolution.

### Update rules

- New wallet accumulation increases support.
- Insider wallet distribution increases refutation.
- Liquidity withdrawal increases execution risk.
- Stale data increases uncertainty.
- Contradictory evidence increases conflict, not automatic cancellation.
- Evidence can be single-use if assigned as a linear resource.

### Trade policy

- Buy only when support is high, refutation bounded, liquidity sufficient, execution risk low, and contradiction type acceptable.
- Sell/reduce when refutation rises faster than support, liquidity deteriorates, or provenance fails.
- Hold when evidence is mixed but no exit threshold is crossed.
- No-trade when contradiction is high and liquidity/execution risk dominates.

This is market predication, not truth. The model predicates *actionability under constraints*.

---

## 6. Linear logic and resource-sensitive execution

Linear logic treats formulas as resources rather than reusable truths. That maps cleanly to autonomous trading.

Resources:

- **Consumed:** gas, fees, slippage budget, API quota, attention.
- **Locked:** LP capital, collateral, open orders, borrow positions.
- **Risk-exposed:** wallet balance, approvals, contract permissions.
- **Regenerating:** daily risk budget, signal freshness, compute budget.
- **Authority-like:** session keys, signing permissions, token allowances.

A linear-logic risk controller can enforce:

- Evidence cannot be reused indefinitely to justify multiple trades.
- A signal has a freshness token that decays.
- A trade consumes risk budget.
- A position locks capital and creates monitoring obligations.
- A delegated wallet authority is scoped and non-duplicable.
- A trade proposal is not a signed transaction.

This is one of the most immediately useful mathematical components. It turns “the model thinks buy” into “the model may spend at most $0.50 risk budget, $0.05 gas, 0.5% slippage, on an allowlisted router, before the evidence expires.”

---

## 7. Autonomous wallet agent architecture

### Minimum viable autonomous wallet trading agent

- One owner.
- One isolated experiment wallet.
- One chain, preferably low-fee EVM L2.
- One or two allowlisted DEX routers.
- Token allowlist.
- Daily spend cap.
- Per-trade cap.
- Transaction simulation before signing.
- Paper trading first.
- Manual signing until the policy layer proves itself.

### Observes

DEX pool prices, reserves/liquidity, slippage curves, gas, wallet flows, token holder concentration, approvals, protocol events, oracle state, DeFiLlama/Nansen/Dune-style data, and optionally social/news claims.

### Decides

Whether to trade, not trade, ask for review, reduce position, rotate to stablecoin, or only log.

### Executes

Only bounded swaps or rebalances through allowlisted contracts. No arbitrary contract calls.

### Never without human review

Unlimited approvals, first-time contracts, bridges, leverage/perps, lending/borrowing, LP deployment, token launches/sniping, governance actions, NFT interactions, unknown tokens, high slippage, failed simulation, sanctions-risk interactions, or any transaction that exceeds precommitted risk.

### Safest wallet architecture

Separate hot experiment wallet funded with only the experiment amount; no seed/private key exposed to the LLM; smart account or Safe with module-based spending limits; optional hardware-wallet owner key; delegated session key with daily caps; deterministic policy engine between agent and signer.

### What can be LLM-based

Research summaries, claim extraction, narrative clustering, code review suggestions, post-trade notes, interface explanations.

### What must be deterministic

Transaction construction, risk limits, allowlist checks, slippage, gas caps, signature permissions, balance checks, approval checks, sanctions/policy blocks, and kill switch.

---

## 8. Strategy classes

| Strategy | Small-wallet viability | Main risk | Where topology/paraconsistency helps |
|---|---:|---|---|
| Trend/momentum | Medium | Whipsaw/fees | Regime detection, contradictory evidence |
| Mean reversion | Medium | Catching falling knives | Liquidity/provenance filters |
| DEX/CEX arbitrage | Low | Dominated by searchers | Detect, but rarely execute |
| Triangular arbitrage | Low | Latency/gas | Educational/backtest only |
| LP/concentrated liquidity | Medium at $2k+ | Impermanent loss, JIT/MEV | Liquidity topology, range control |
| Yield optimization | Medium | Smart-contract/bridge risk | Risk provenance, protocol dependency graph |
| Liquidation hunting | Low | Speed/capital | Mostly exclude |
| Oracle-lag trading | Risky | Manipulation/legal/platform risk | Exclude first prototype |
| Event-driven governance | Medium | Crowded/ambiguous | Claim-state provenance |
| Wallet-flow following | Medium | Spoofing/copy traps | Graph topology, paraconsistency |
| Whale-copying | Low-medium | Delayed signal | Local context restrictions |
| Token-launch sniping | Very low | Scams/MEV | Exclude |
| Social-attention trading | Medium | Pump/dump | Contradiction between social and on-chain |
| Stablecoin depeg monitoring | High | Execution/liquidity | Topology of peg/liquidity fragmentation |
| Rug-risk avoidance | High | False negatives | Graph/TDA/provenance filters |

First prototype should exclude leverage, bridges, token sniping, MEV, oracle manipulation, wash trading, spoofing, and anything whose edge depends on deception or transaction-order abuse.

---

## 9. Private algorithm hypotheses

### 1. Sheaf obstruction arbitrage filter

**Math:** sheaf consistency over price/liquidity/gas/execution contexts.  
**Intuition:** many apparent arbitrages fail to glue into executable arbitrage.  
**Signal:** obstruction type = price-only, liquidity-only, gas-only, provenance-only.  
**Use:** filter trades and flag fragmented liquidity.  
**Why new:** most dashboards show spreads, not local-to-global executability.  
**Why nonsense:** obstruction may just encode obvious slippage.  
**Difficulty:** medium.

### 2. Wallet-flow persistent homology regime detector

**Math:** persistent homology on temporal wallet-token graphs.  
**Intuition:** accumulation and distribution have shapes before price moves.  
**Use:** detect loops, components, merging clusters, sudden topology change.  
**Why new:** graph shape rather than whale-count heuristics.  
**Why nonsense:** wallet clustering errors dominate.  
**Difficulty:** medium-hard.

### 3. Paraconsistent token-state lattice

**Math:** support/refutation/uncertainty/provenance lattice.  
**Intuition:** contested tokens require no-trade or smaller size, not averaged scores.  
**Use:** buy/sell/hold/no-trade policy.  
**Why new:** contradiction is first-class.  
**Why nonsense:** can become a fancy weighted score unless update rules are strict.  
**Difficulty:** medium.

### 4. Linear risk-budget executor

**Math:** linear/resource-sensitive proof obligations.  
**Intuition:** every trade consumes scarce authority and risk.  
**Use:** prevent overtrading, stale evidence reuse, excess gas, unauthorized actions.  
**Why new:** wallet authority modeled as a resource, not a Boolean permission.  
**Why nonsense:** may be overformalized policy engineering.  
**Difficulty:** low-medium.

### 5. Rough-path liquidity trajectory signal

**Math:** truncated signatures over irregular paths of price, depth, volume, gas, LP changes.  
**Intuition:** path order matters: liquidity withdrawal before price rise differs from after.  
**Use:** classify fragile rallies and stable accumulation.  
**Why new:** applies signature methods to DEX pool microstructure rather than only prices.  
**Why nonsense:** small sample, nonstationarity.  
**Difficulty:** medium.

### 6. Optimal-transport liquidity migration distance

**Math:** Wasserstein distance between liquidity distributions across pools/chains.  
**Intuition:** capital migrates before narratives update.  
**Use:** detect sector rotation and chain-level liquidity drift.  
**Why new:** liquidity as a transported mass distribution.  
**Why nonsense:** TVL data may be noisy and non-verifiable; TVL methodology is not fully standardized.  
**Difficulty:** medium.

### 7. Contradiction detector between social claims and on-chain flows

**Math:** claim-state graph plus paraconsistent update.  
**Intuition:** “partnership,” “buyback,” “whale accumulation” claims should match flows.  
**Use:** avoid rugs/pumps, detect underpriced real events.  
**Why new:** provenance-aware contradiction, not sentiment score.  
**Why nonsense:** social data is adversarial.  
**Difficulty:** medium.

### 8. Mean-field LP/bot pressure model

**Math:** mean-field games / agent-based simulation.  
**Intuition:** pool dynamics depend on LPs, routers, bots, and arbitrageurs.  
**Use:** LP range selection, avoid toxic pools.  
**Why new:** DeFi-native market ecology.  
**Why nonsense:** too many hidden agents.  
**Difficulty:** hard.

### 9. Information-decay alpha model

**Math:** temporal logic plus hazard/decay functions.  
**Intuition:** alpha decays differently for governance, unlocks, wallet flows, and social claims.  
**Use:** stale-signal invalidation.  
**Why new:** freshness as a tradable resource.  
**Why nonsense:** decay rates unstable.  
**Difficulty:** low-medium.

### 10. Topology of bridge/liquidity fragmentation

**Math:** graph cuts, sheaf obstruction, OT distances.  
**Intuition:** bridge stress or fragmented stablecoin liquidity may precede depegs/local dislocations.  
**Use:** risk-off or stablecoin-routing signals.  
**Why new:** cross-chain liquidity as topology.  
**Why nonsense:** small agent may not execute cheaply across chains.  
**Difficulty:** medium-hard.

---

## 10. Backtesting and evaluation

Minimum honest backtest:

1. Historical DEX swaps and pool snapshots.
2. Historical gas and base fees.
3. Token metadata available *at that time*.
4. Dead/delisted/rugged tokens included.
5. Timestamped wallet graph snapshots.
6. No future labels unless using a delayed-label protocol.
7. Realistic slippage simulation from pool state.
8. Failed transaction simulation.
9. MEV/sandwich penalty or conservative execution haircut.
10. Walk-forward validation.
11. Paper trading before live.
12. Tiny live experiment only after dry runs.

Metrics:

- Net return after gas/slippage.
- Max drawdown.
- Tail loss.
- Hit rate by signal type.
- Profit per unit gas.
- Avoided-loss metric.
- No-trade correctness.
- False-positive trade rate.
- Policy violations.
- Time-to-invalidation.
- Evidence reuse count.
- Latency sensitivity.

For a $20 wallet, Sharpe ratio is almost meaningless. The key metric is: **did the agent preserve capital, obey constraints, and produce evidence that its no-trade/trade choices differ from random or naive rules?**

---

## 11. Security and wallet safety

Threat model:

- Private key leakage.
- LLM prompt injection.
- Malicious websites/social posts.
- Malicious token contracts.
- Approval drainers.
- RPC manipulation.
- Fake pool/liquidity data.
- Oracle manipulation.
- Bridge failure.
- Dependency compromise.
- x402/payment replay or context-binding flaws.
- Agent tool-call escalation.

Recent research on AI agents in crypto argues that combining AI agents with financial protocols and immutable smart contracts introduces underexplored security risks. The x402 ecosystem has already attracted security papers identifying replay, context-binding, authorization, atomicity, and metadata-leakage issues.

Hard rules:

- LLM never sees seed phrases or private keys.
- LLM never signs.
- LLM proposes; deterministic engine validates.
- Signer enforces policy even if model is compromised.
- Default action is no-trade.
- Unknown contract means block.
- Unlimited approval means block.
- Bridge means manual review.
- New token means manual review.
- Failed simulation means block.
- High slippage means block.
- Suspicious provenance means block.
- Kill switch must be outside the agent.

---

## 12. Legal/regulatory boundaries

Private own-wallet trading is materially different from managing other people’s money, pooling assets, copy-trading for compensation, or publishing personalized recommendations. The risk profile changes when the system gives advice, trades user funds, has discretionary authority, pools capital, receives performance fees, issues a token, or routes user transactions.

In the U.S., an investment adviser is generally a person or firm that, for compensation, is in the business of providing advice or reports about securities. SEC/CFTC crypto interpretations, FinCEN convertible virtual currency guidance, OFAC virtual-currency sanctions guidance, and IRS digital-asset tax pages define important boundaries between private own-wallet experimentation and public financial products.

Before public launch, legal review should cover investment-adviser status, broker/dealer or CTA/CPO issues, custody, MSB/KYC/AML, sanctions screening, tax reporting, consumer protection, data licensing, exchange terms, marketing claims, and market-manipulation controls.

Marketing should avoid: guaranteed returns, “risk-free,” “AI alpha,” “beats the market,” “copy our profitable wallet,” “automated investment adviser,” or anything implying licensed fiduciary status without actually having it.

---

## 13. Build paths

| Path | First artifact | First dataset | First strategy | First guardrail | What not to build first |
|---|---|---|---|---|---|
| A. $20 private wallet | Local agent + logbook | One DEX on Base | No-trade filter + tiny swap | Separate wallet, $1/trade cap | MEV/sniping |
| B. Paper/backtest engine | Simulator | DEX swaps + gas | Stablecoin/liquidity risk | No lookahead | Live trading |
| C. Private wallet agent | Policy-gated signer | Pool + wallet graph | Paraconsistent rebalancer | Session key cap | Bridges/leverage |
| D. Non-custodial app | UI + policy engine | User wallet data | Recommendations only | Manual signing | Discretionary custody |
| E. Signal/API product | Alerts API | On-chain topology features | Risk/contradiction alerts | Disclaimers/data rights | Personalized advice |
| F. Yield optimizer | Vault risk monitor | Protocol TVL/yields | Allocation/risk scoring | Protocol allowlist | Pooled funds |
| G. Research lab | Reproducible notebooks | Multi-chain graph store | Topology/logic signals | Audit trail | Product claims |
| H. Tokenized validation system | Claim registry | Provenance graph | Market-state claims | Anti-manipulation design | Project token hype |

Most proprietary value lies in the **state representation, feature construction, backtest corpus, and policy engine**, not in a generic trading UI.

---

## 14. Worked examples

### Example A: $20 autonomous wallet experiment

- Chain: Base.
- Wallet: fresh smart account or hot wallet with only $20.
- Assets: USDC and WETH only.
- Max trade: $1.
- Daily loss cap: $2.
- Daily gas cap: $0.25.
- Slippage cap: 0.5%.
- Contracts: one allowlisted router.
- Agent action: propose swap or no-trade.
- Human signing: required for first 100 live trades.
- Logs: observation, state vector, evidence, contradiction, decision, simulated transaction, actual result.

The goal is not profit. The goal is to test whether the agent can obey constraints and generate auditable decisions.

### Example B: Sheaf obstruction signal

Local facts:

- Pool A says token X is up 8%.
- Pool B has thin liquidity and 4% slippage for tiny size.
- Wallet graph shows insider wallets distributing.
- Social graph says “major listing soon.”
- CEX price does not confirm.

The local sections do not glue. The obstruction is not “bearish” generically; it is: **price/social support fails to glue with liquidity/provenance/wallet-flow support**. Action: no-trade or manual review.

### Example C: Paraconsistent token-state model

Token X:

- Bullish support: smart-wallet accumulation, rising volume.
- Bearish refutation: deployer wallet moving tokens to exchange.
- Uncertainty: social claim unverified.
- Liquidity: sufficient for $20, fragile for $2,000.
- Execution risk: moderate.

State: high support, high refutation, moderate liquidity, high provenance conflict.  
Decision: no autonomous buy. Permit alert: “contested-high-energy token; wait for contradiction resolution.”

### Example D: Linear risk-budget execution

Resources:

- $20 capital.
- $1 per trade.
- $2 daily loss.
- 3 fresh evidence tokens.
- 1 signing authority token.
- 0 bridge authority.
- 0 leverage authority.

A trade consumes one evidence token, one risk token, gas budget, and signing authority. If the same wallet-flow signal already justified a prior buy, it cannot be reused to justify another buy unless refreshed. This prevents compounding on stale evidence.

### Example E: Rough-path liquidity trajectory

Construct an irregular path:

```math
X_t = (\text{price}, \text{volume}, \text{active liquidity}, \text{gas}, \text{LP net adds}, \text{wallet inflow})
```

Compute truncated signatures over rolling windows. Compare paths:

- Healthy accumulation: liquidity adds precede price rise.
- Fragile pump: price/volume rise before liquidity, then LP withdrawal.
- Toxic flow: wallet inflows followed by exchange deposits.

Execution: only trade when signature class is “accumulation with durable liquidity,” not “fragile pump.”

---

## 15. Strategic recommendation

**Strongest mathematical angle:** sheaf/paraconsistent market-state representation plus linear-logic execution constraints.

**Most realistic first private experiment:** Base-only $20 wallet, USDC/WETH, paper trading first, then manually signed tiny swaps, strict caps.

**Highest-upside research direction:** topology of wallet-flow/liquidity/provenance contradictions. This is more differentiated than another RL trader.

**Most feasible alpha hypothesis:** contradiction between social/narrative claims and on-chain wallet/liquidity flows, filtered by liquidity topology and execution cost.

**Safest architecture:** isolated wallet; smart-account or Safe-style spending module; LLM proposes; deterministic policy validates; human signs initially; session key only after long dry-run; kill switch outside the agent.

**First dataset:** one chain’s DEX swaps, pool liquidity snapshots, gas, token metadata, wallet clusters, and protocol events. Add social/news only after the on-chain backtest is honest.

**First backtest:** no-trade/trade classifier for stablecoin/liquidity-fragility and token-risk avoidance, including dead tokens and gas/slippage.

**First chain:** Base or another low-fee EVM L2. Avoid Ethereum mainnet for $20 experiments.

**First strategy to exclude:** MEV/searcher arbitrage, token sniping, bridges, leverage, oracle-lag exploitation.

**First monetizable product if research works:** an on-chain contradiction/risk API: “this token/pool/narrative fails to glue because wallet flow, liquidity, and provenance disagree.”

**What remains private:** alpha features, obstruction taxonomy, wallet-cluster heuristics, update weights, execution thresholds.

**What can be published:** formal market-state calculus, safety architecture, backtesting methodology, non-sensitive examples.

---

## 16. Open questions

1. Can sheaf obstruction produce predictive value after gas, slippage, and delayed execution?
2. Which contradictions are alpha and which are merely noise?
3. Can wallet clustering be good enough for small-token regimes?
4. Does persistent homology detect regime change earlier than simpler graph statistics?
5. How should paraconsistent states be calibrated without collapsing into weighted scores?
6. What is the right lattice for support/refutation/liquidity/provenance?
7. Can linear logic be implemented as a practical policy DSL?
8. How much social/news data is useful before adversarial noise dominates?
9. How should MEV/sandwich risk be simulated for small swaps?
10. What legal posture is safe for a public product that gives signals but does not custody funds?
11. How should agentic-wallet payment systems handle replay, request binding, and atomic settlement?
12. Can a private agent learn without overfitting to short crypto regimes?

---

## 17. Annotated bibliography

The following are source categories and representative references to use when expanding this memo into a longer formal paper.

### Agentic wallets and agent payment systems

- Coinbase AgentKit: agent wallet actions and framework integrations.  
  <https://github.com/coinbase/agentkit>
- Coinbase Agentic Wallet / x402 ecosystem: agent-native stablecoin payments and autonomous wallet infrastructure.  
  <https://www.coinbase.com/developer-platform>
- x402 security research: replay, context-binding, payment metadata, authorization, and atomicity risks.  
  <https://arxiv.org/>

### Smart-account and wallet guardrails

- Safe modules and spending limits: permissioned smart-account guardrails.  
  <https://docs.safe.global/>
- ERC-4337 account abstraction.  
  <https://eips.ethereum.org/EIPS/eip-4337>
- EIP-7702 EOA delegation.  
  <https://eips.ethereum.org/EIPS/eip-7702>

### AMMs, DeFi market structure, and MEV

- Uniswap documentation on AMMs, pools, concentrated liquidity, and v4 architecture.  
  <https://docs.uniswap.org/>
- Flashbots MEV research and infrastructure.  
  <https://www.flashbots.net/>
- Mean-field game models of Uniswap v3 LPs and MEV/JIT liquidity.  
  <https://arxiv.org/>

### Mathematical finance

- Rough paths and signature methods for optimal execution.  
  <https://epubs.siam.org/doi/10.1137/19M1259778>
- Wasserstein distributionally robust optimization.  
  <https://arxiv.org/pdf/1908.08729>
- Reinforcement learning in finance surveys.  
  <https://arxiv.org/>
- Deep hedging and risk-aware stochastic control.  
  <https://arxiv.org/>

### Topology, sheaves, and data fusion

- Michael Robinson, sheaves for data fusion.  
  <https://arxiv.org/abs/1603.01446>
- Sheaf-theoretic uncertainty and consistency over relational/topological spaces.  
  <https://arxiv.org/>
- Topological data analysis and persistent homology in finance.  
  <https://arxiv.org/>

### Logic

- Stanford Encyclopedia of Philosophy: paraconsistent logic.  
  <https://plato.stanford.edu/entries/logic-paraconsistent/>
- Stanford Encyclopedia of Philosophy: linear logic.  
  <https://plato.stanford.edu/entries/logic-linear/>

### On-chain analytics data

- Nansen: wallet labels and smart-money analytics.  
  <https://www.nansen.ai/>
- Dune: SQL/API access to on-chain datasets.  
  <https://dune.com/>
- DeFiLlama: TVL, fees, volumes, stablecoins, yields, protocol data.  
  <https://defillama.com/>

### Regulation and compliance

- SEC investment-adviser guidance.  
  <https://www.sec.gov/>
- SEC/CFTC crypto-asset interpretations and guidance.  
  <https://www.sec.gov/>
  <https://www.cftc.gov/>
- FinCEN convertible virtual currency guidance.  
  <https://www.fincen.gov/>
- OFAC sanctions compliance guidance for virtual currency.  
  <https://ofac.treasury.gov/>
- IRS digital asset tax information.  
  <https://www.irs.gov/filing/digital-assets>


---

<!-- source: economy/cryptocurrency/content/autonomous-wallets/autonomous-wallets.md -->

## Imported source: economy/cryptocurrency/content/autonomous-wallets/autonomous-wallets.md

---
title: Topology-Native Autonomous Crypto Wallets
description: Argues that information topology, sheaf/fiber models, paraconsistent and infinitely-valued logic, and linear/resource-sensitive logic can produce new private financial-analysis and autonomous-execution methods for non-custodial crypto wallets — not better price prediction, but a different representation of market state (local-to-global inconsistency, contradictory evidence, provenance, liquidity fragmentation, staleness, hard resource budgets). Recommends a private own-wallet agent using topology/paraconsistency as a risk-aware no-trade filter with strict caps, deterministic policy gating an LLM that never signs. Covers AMM/MEV market structure, sheaf-obstruction filters, paraconsistent token-state lattices, linear risk budgets, backtesting honesty, wallet security, and U.S./EU legal boundaries.
date-created: 2026-06-19
date-modified: 2026-06-19
tags: [autonomous-wallets, defi, sheaf-obstruction, paraconsistent-market-state, linear-logic, resource-budget, no-trade-filter, account-abstraction, mev, liquidity-topology, persistent-homology, agent-safety, investment-adviser-risk]
---

# Topology-Native Autonomous Crypto Wallets

## Abstract

**Thesis:** yes, information topology, sheaf/fiber models, paraconsistent and infinitely-valued logic, and linear/resource-sensitive logic can plausibly produce *new private financial-analysis and autonomous-execution methods* for crypto wallets. The novelty is not “AI predicts price better.” The novelty is a different representation of market state: local-to-global inconsistency, contradictory evidence, provenance, liquidity fragmentation, stale information, wallet-flow regimes, and hard resource budgets. That is especially suitable for DeFi because crypto markets expose graph structure, pool state, liquidity surfaces, wallet identities, oracle updates, bridge flows, mempools, governance events, and transaction execution risk in a way traditional markets usually do not.

The cold conclusion is that **the first realistic edge is not high-frequency MEV or CEX/DEX arbitrage**. Those are already dominated by specialized searchers, builder relationships, low-latency infra, and capital. A better first direction is a **private, non-custodial, own-wallet agent** that uses topology/paraconsistency as a *risk-aware signal and no-trade filter*, then executes tiny, allowlisted swaps or rebalances under strict spending caps. Coinbase’s AgentKit/Agentic Wallet, x402, Safe modules, ERC-4337, and EIP-7702 show that agent wallets and delegated execution are becoming real infrastructure, while recent x402 security papers show that payment/agent protocols still have serious replay, context-binding, and atomicity issues.

---

## 1. Current landscape of AI crypto trading agents

The current market separates into five layers.

### CEX bot platforms

3Commas, Cryptohopper, Bitsgap, Pionex, and similar tools mostly automate exchange API-key trading: grid bots, DCA, trailing stops, portfolio rebalancing, copy trading, market-making templates, and alert-driven execution. 3Commas emphasizes exchange account management through API keys; Cryptohopper markets 24/7 automation, DCA, trailing features, AI, and copy trading; Bitsgap integrates with many exchanges via API keys; Pionex bundles bot features inside an exchange-like trading venue. These products are real, but their “AI” is often thin or black-box marketing layered over ordinary automation.

### On-chain analytics platforms

Nansen, Dune, Glassnode, DeFiLlama, Flipside/SonarX, Arkham-like systems, and DEX Screener-style tools provide wallet labels, token flows, TVL, fees, liquidity, price charts, and SQL/API access. Nansen currently claims hundreds of millions of labeled addresses and “Smart Money” wallet tracking; Dune offers SQL/API-style on-chain datasets across many chains; DeFiLlama exposes DeFi TVL, volume, fees, stablecoins, yields, and protocol data. These are closer to the data layer a topology-native agent needs.

### DeFi automation and yield tools

DeFi Saver offers non-custodial automation for liquidation protection, loss minimization, gain locking, and yield automation. Yearn v3 vaults automate yield generation through ERC-4626 strategies. Enzyme supports on-chain asset-management vaults interacting with many protocols. These are not usually alpha-prediction engines; they are automated position-management and strategy-infrastructure systems.

### Agentic wallet systems

Coinbase AgentKit and Agentic Wallet explicitly give agents wallets and on-chain actions. AgentKit supports wallet actions and framework-agnostic integrations; Coinbase’s Agentic Wallet is framed as a suite for agents to hold, spend, trade, and earn stablecoins with guardrails. x402 targets web-native, machine-to-machine payments. Safe modules, Safe spending limits, ERC-4337, and EIP-7702 supply the permissioning substrate: session keys, spending caps, account abstraction, smart accounts, and weaker scoped subkeys.

### What is missing

Almost nobody publicly appears to use sheaf obstruction, paraconsistent market-state lattices, or linear-logic resource accounting as the core representation of an autonomous wallet’s market reasoning. Most systems optimize *trading convenience* or *execution automation*, not deep inconsistency-aware market predication.

---

## 2. Frontier mathematical finance

| Method | What it solves | Crypto/DeFi relevance | Independent-builder feasibility |
|---|---|---|---|
| Stochastic control / optimal stopping | Sequential decisions under uncertainty | Rebalancing, liquidation avoidance, gas-aware execution | Medium |
| Reinforcement learning / deep RL | Learn trading/hedging policies from simulated environments | Portfolio control, LP range management, execution | Hard; high overfit risk |
| Deep hedging | Risk-aware hedging under frictions | Perps/options, LP impermanent-loss hedging | Hard unless derivatives data exists |
| Mean-field games | Many interacting agents | LPs, bots, retail, whales, MEV searchers | Research-heavy but relevant |
| Rough volatility / rough paths / signatures | Irregular time-series path features | DEX liquidity/volume trajectories, order flow | Feasible for feature research |
| Optimal transport / Wasserstein DRO | Robust decisions under distribution shift | Regime shifts, pool-liquidity migration, robust allocation | Feasible |
| Graph ML / temporal GNNs | Learn from wallet-token-protocol graphs | Wallet flows, scams, whale regimes | Feasible with data pipeline |
| TDA / persistent homology | Shape/regime features in point clouds/graphs | Wallet-flow topology, liquidity fragmentation | Feasible for signals |
| Sheaf data fusion | Local-to-global consistency of heterogeneous data | Contradiction among price, liquidity, wallet flow, social claims | Highly novel, feasible at prototype scale |
| Paraconsistent / many-valued logic | Reason under contradiction without explosion | Simultaneous bullish/bearish evidence | Feasible |
| Linear logic / resource logic | Track scarce consumed/locked resources | Gas, slippage, risk budget, authority, stale evidence | Very feasible for guardrails |

Signature methods are already used in finance, including optimal execution, where a trading policy can be approximated as a linear functional on truncated path signatures. Wasserstein distributionally robust optimization is a mature robust-optimization framework that chooses decisions performing well under adverse distributions near the empirical distribution. Reinforcement learning in finance is active but fragile: surveys emphasize complexity, randomness, information asymmetry, and multi-agent structure. Deep hedging frames hedging as risk-averse stochastic control and actor-critic learning.

For this project, the strongest math is not “train a giant RL trader.” It is **structured signal representation plus formally bounded execution**.

---

## 3. Crypto/DeFi market structure

Crypto differs from traditional markets because much of the market state is public, composable, and directly executable. DEXs use AMMs rather than central order books. Uniswap’s documentation describes AMMs/constant-function market makers, concentrated liquidity, and newer hook/flash-accounting architecture. MEV is central: Flashbots describes its mission as mitigating negative externalities of maximal extractable value, and recent CEX/DEX arbitrage research finds that a small number of searchers captured a large share of extracted value, with profitability tied to builder integration.

### Signals only or unusually available on-chain

Wallet accumulation/distribution, exchange inflows/outflows, token holder concentration, LP position migration, protocol TVL changes, bridge flows, stablecoin peg stress, liquidation queues, oracle updates, governance execution, token emissions, vesting unlocks, smart-contract approvals, deployer behavior, and labeled “smart money” flows.

### Edges accessible to small wallets

The realistic small-wallet edge is not speed. It is **selectivity**: avoiding bad tokens, stale narratives, fragile liquidity, toxic pools, and overtrading; entering only when independent local signals cohere; using better gas/slippage/no-trade logic; and exploiting slow contextual relations before retail dashboards compress them into obvious signals.

### Capital tiers

| Capital | Realistic experiments | Avoid |
|---:|---|---|
| $20 | Paper trading, tiny Base swaps, no leverage, no bridging, signal logging | MEV, illiquid meme sniping, perps |
| $200 | Small basket rebalancing, stablecoin depeg monitoring, wallet-flow alerts | High-gas Ethereum mainnet |
| $2,000 | LP experiments, event-driven trades, limited arbitrage scans | Latency races |
| $20,000 | Serious routing, LP management, basis/perps tests, infrastructure spend | Public-user custody without legal review |

Base is a plausible first chain because it is an Ethereum L2 built by Coinbase and positioned as low-cost and developer-friendly; it also has AgentKit/Base ecosystem alignment.

---

## 4. Information topology as alpha

Model the market as a site or indexed family of contexts:

- **Objects:** tokens, wallets, pools, protocols, chains, bridges, narratives, oracle feeds, governance events.
- **Open sets:** local contexts where a signal is valid, such as “USDC pools on Base,” “wallets interacting with token X in the last 6 hours,” “pools sharing token A,” “bridged liquidity from chain C,” or “social claims about protocol P.”
- **Restrictions:** moving from a broad context to a narrower one, for example from all liquidity to only executable liquidity under $20 size and 1% slippage.
- **Sections:** local observations: price, liquidity, holder distribution, wallet flows, narrative claims, oracle state, contract risk.
- **Gluing:** consistency among local observations.
- **Obstruction:** failure of local observations to glue into a coherent global state.

Sheaf theory is already used as a formal language for heterogeneous data fusion: Robinson describes sheaves as canonical data structures for sensor integration, and later work frames sheaves as storing information over a relational/topological space with consistency constraints.

### Trading interpretation

A sheaf obstruction is not automatically an arbitrage. It is a *typed inconsistency*. Examples:

- Price glues, liquidity does not: apparent arbitrage is not executable.
- Social narrative glues, wallet flows refute: attention pump risk.
- DEX price and CEX price disagree, but gas/slippage destroys profit: non-executable discrepancy.
- Token looks bullish globally, but local holder topology shows insider concentration.
- Stablecoin peg appears stable globally, but bridge-specific liquidity topology is fragmenting.

This is a strong candidate for proprietary research because it can become a **contradiction map**: not a scalar score, but a localization of where evidence fails.

---

## 5. Paraconsistent and infinitely-valued market states

Classical buy/sell scoring collapses contradictory evidence. Crypto often has contradictory states: “liquid but fragile,” “accumulating but rug-risky,” “narratively hot but structurally weak,” “cheap but untradeable,” “bullish on-chain but bearish unlock schedule.”

Paraconsistent logic is designed to reason from inconsistent information without explosion. There is also recent work applying paraconsistent annotated evidential logic to futures trading signals, though that work is still closer to indicator aggregation than a full crypto market-state calculus.

A practical token state can be represented as:

```math
S_T = (B, R, U, L, E, P)
```

where:

- `B`: degree of support for bullish continuation.
- `R`: degree of refutation.
- `U`: uncertainty / missingness.
- `L`: liquidity/executability.
- `E`: execution risk.
- `P`: provenance quality.

This avoids collapsing to “score = 0.63.” A token can be both `B = 0.8` and `R = 0.7`. The result is not “neutral”; it is **contested-high-energy**. That may imply no-trade, smaller size, manual review, or wait-for-resolution.

### Update rules

- New wallet accumulation increases support.
- Insider wallet distribution increases refutation.
- Liquidity withdrawal increases execution risk.
- Stale data increases uncertainty.
- Contradictory evidence increases conflict, not automatic cancellation.
- Evidence can be single-use if assigned as a linear resource.

### Trade policy

- Buy only when support is high, refutation bounded, liquidity sufficient, execution risk low, and contradiction type acceptable.
- Sell/reduce when refutation rises faster than support, liquidity deteriorates, or provenance fails.
- Hold when evidence is mixed but no exit threshold is crossed.
- No-trade when contradiction is high and liquidity/execution risk dominates.

This is market predication, not truth. The model predicates *actionability under constraints*.

---

## 6. Linear logic and resource-sensitive execution

Linear logic treats formulas as resources rather than reusable truths. That maps cleanly to autonomous trading.

Resources:

- **Consumed:** gas, fees, slippage budget, API quota, attention.
- **Locked:** LP capital, collateral, open orders, borrow positions.
- **Risk-exposed:** wallet balance, approvals, contract permissions.
- **Regenerating:** daily risk budget, signal freshness, compute budget.
- **Authority-like:** session keys, signing permissions, token allowances.

A linear-logic risk controller can enforce:

- Evidence cannot be reused indefinitely to justify multiple trades.
- A signal has a freshness token that decays.
- A trade consumes risk budget.
- A position locks capital and creates monitoring obligations.
- A delegated wallet authority is scoped and non-duplicable.
- A trade proposal is not a signed transaction.

This is one of the most immediately useful mathematical components. It turns “the model thinks buy” into “the model may spend at most $0.50 risk budget, $0.05 gas, 0.5% slippage, on an allowlisted router, before the evidence expires.”

---

## 7. Autonomous wallet agent architecture

### Minimum viable autonomous wallet trading agent

- One owner.
- One isolated experiment wallet.
- One chain, preferably low-fee EVM L2.
- One or two allowlisted DEX routers.
- Token allowlist.
- Daily spend cap.
- Per-trade cap.
- Transaction simulation before signing.
- Paper trading first.
- Manual signing until the policy layer proves itself.

### Observes

DEX pool prices, reserves/liquidity, slippage curves, gas, wallet flows, token holder concentration, approvals, protocol events, oracle state, DeFiLlama/Nansen/Dune-style data, and optionally social/news claims.

### Decides

Whether to trade, not trade, ask for review, reduce position, rotate to stablecoin, or only log.

### Executes

Only bounded swaps or rebalances through allowlisted contracts. No arbitrary contract calls.

### Never without human review

Unlimited approvals, first-time contracts, bridges, leverage/perps, lending/borrowing, LP deployment, token launches/sniping, governance actions, NFT interactions, unknown tokens, high slippage, failed simulation, sanctions-risk interactions, or any transaction that exceeds precommitted risk.

### Safest wallet architecture

Separate hot experiment wallet funded with only the experiment amount; no seed/private key exposed to the LLM; smart account or Safe with module-based spending limits; optional hardware-wallet owner key; delegated session key with daily caps; deterministic policy engine between agent and signer.

### What can be LLM-based

Research summaries, claim extraction, narrative clustering, code review suggestions, post-trade notes, interface explanations.

### What must be deterministic

Transaction construction, risk limits, allowlist checks, slippage, gas caps, signature permissions, balance checks, approval checks, sanctions/policy blocks, and kill switch.

---

## 8. Strategy classes

| Strategy | Small-wallet viability | Main risk | Where topology/paraconsistency helps |
|---|---:|---|---|
| Trend/momentum | Medium | Whipsaw/fees | Regime detection, contradictory evidence |
| Mean reversion | Medium | Catching falling knives | Liquidity/provenance filters |
| DEX/CEX arbitrage | Low | Dominated by searchers | Detect, but rarely execute |
| Triangular arbitrage | Low | Latency/gas | Educational/backtest only |
| LP/concentrated liquidity | Medium at $2k+ | Impermanent loss, JIT/MEV | Liquidity topology, range control |
| Yield optimization | Medium | Smart-contract/bridge risk | Risk provenance, protocol dependency graph |
| Liquidation hunting | Low | Speed/capital | Mostly exclude |
| Oracle-lag trading | Risky | Manipulation/legal/platform risk | Exclude first prototype |
| Event-driven governance | Medium | Crowded/ambiguous | Claim-state provenance |
| Wallet-flow following | Medium | Spoofing/copy traps | Graph topology, paraconsistency |
| Whale-copying | Low-medium | Delayed signal | Local context restrictions |
| Token-launch sniping | Very low | Scams/MEV | Exclude |
| Social-attention trading | Medium | Pump/dump | Contradiction between social and on-chain |
| Stablecoin depeg monitoring | High | Execution/liquidity | Topology of peg/liquidity fragmentation |
| Rug-risk avoidance | High | False negatives | Graph/TDA/provenance filters |

First prototype should exclude leverage, bridges, token sniping, MEV, oracle manipulation, wash trading, spoofing, and anything whose edge depends on deception or transaction-order abuse.

---

## 9. Private algorithm hypotheses

### 1. Sheaf obstruction arbitrage filter

**Math:** sheaf consistency over price/liquidity/gas/execution contexts.  
**Intuition:** many apparent arbitrages fail to glue into executable arbitrage.  
**Signal:** obstruction type = price-only, liquidity-only, gas-only, provenance-only.  
**Use:** filter trades and flag fragmented liquidity.  
**Why new:** most dashboards show spreads, not local-to-global executability.  
**Why nonsense:** obstruction may just encode obvious slippage.  
**Difficulty:** medium.

### 2. Wallet-flow persistent homology regime detector

**Math:** persistent homology on temporal wallet-token graphs.  
**Intuition:** accumulation and distribution have shapes before price moves.  
**Use:** detect loops, components, merging clusters, sudden topology change.  
**Why new:** graph shape rather than whale-count heuristics.  
**Why nonsense:** wallet clustering errors dominate.  
**Difficulty:** medium-hard.

### 3. Paraconsistent token-state lattice

**Math:** support/refutation/uncertainty/provenance lattice.  
**Intuition:** contested tokens require no-trade or smaller size, not averaged scores.  
**Use:** buy/sell/hold/no-trade policy.  
**Why new:** contradiction is first-class.  
**Why nonsense:** can become a fancy weighted score unless update rules are strict.  
**Difficulty:** medium.

### 4. Linear risk-budget executor

**Math:** linear/resource-sensitive proof obligations.  
**Intuition:** every trade consumes scarce authority and risk.  
**Use:** prevent overtrading, stale evidence reuse, excess gas, unauthorized actions.  
**Why new:** wallet authority modeled as a resource, not a Boolean permission.  
**Why nonsense:** may be overformalized policy engineering.  
**Difficulty:** low-medium.

### 5. Rough-path liquidity trajectory signal

**Math:** truncated signatures over irregular paths of price, depth, volume, gas, LP changes.  
**Intuition:** path order matters: liquidity withdrawal before price rise differs from after.  
**Use:** classify fragile rallies and stable accumulation.  
**Why new:** applies signature methods to DEX pool microstructure rather than only prices.  
**Why nonsense:** small sample, nonstationarity.  
**Difficulty:** medium.

### 6. Optimal-transport liquidity migration distance

**Math:** Wasserstein distance between liquidity distributions across pools/chains.  
**Intuition:** capital migrates before narratives update.  
**Use:** detect sector rotation and chain-level liquidity drift.  
**Why new:** liquidity as a transported mass distribution.  
**Why nonsense:** TVL data may be noisy and non-verifiable; TVL methodology is not fully standardized.  
**Difficulty:** medium.

### 7. Contradiction detector between social claims and on-chain flows

**Math:** claim-state graph plus paraconsistent update.  
**Intuition:** “partnership,” “buyback,” “whale accumulation” claims should match flows.  
**Use:** avoid rugs/pumps, detect underpriced real events.  
**Why new:** provenance-aware contradiction, not sentiment score.  
**Why nonsense:** social data is adversarial.  
**Difficulty:** medium.

### 8. Mean-field LP/bot pressure model

**Math:** mean-field games / agent-based simulation.  
**Intuition:** pool dynamics depend on LPs, routers, bots, and arbitrageurs.  
**Use:** LP range selection, avoid toxic pools.  
**Why new:** DeFi-native market ecology.  
**Why nonsense:** too many hidden agents.  
**Difficulty:** hard.

### 9. Information-decay alpha model

**Math:** temporal logic plus hazard/decay functions.  
**Intuition:** alpha decays differently for governance, unlocks, wallet flows, and social claims.  
**Use:** stale-signal invalidation.  
**Why new:** freshness as a tradable resource.  
**Why nonsense:** decay rates unstable.  
**Difficulty:** low-medium.

### 10. Topology of bridge/liquidity fragmentation

**Math:** graph cuts, sheaf obstruction, OT distances.  
**Intuition:** bridge stress or fragmented stablecoin liquidity may precede depegs/local dislocations.  
**Use:** risk-off or stablecoin-routing signals.  
**Why new:** cross-chain liquidity as topology.  
**Why nonsense:** small agent may not execute cheaply across chains.  
**Difficulty:** medium-hard.

---

## 10. Backtesting and evaluation

Minimum honest backtest:

1. Historical DEX swaps and pool snapshots.
2. Historical gas and base fees.
3. Token metadata available *at that time*.
4. Dead/delisted/rugged tokens included.
5. Timestamped wallet graph snapshots.
6. No future labels unless using a delayed-label protocol.
7. Realistic slippage simulation from pool state.
8. Failed transaction simulation.
9. MEV/sandwich penalty or conservative execution haircut.
10. Walk-forward validation.
11. Paper trading before live.
12. Tiny live experiment only after dry runs.

Metrics:

- Net return after gas/slippage.
- Max drawdown.
- Tail loss.
- Hit rate by signal type.
- Profit per unit gas.
- Avoided-loss metric.
- No-trade correctness.
- False-positive trade rate.
- Policy violations.
- Time-to-invalidation.
- Evidence reuse count.
- Latency sensitivity.

For a $20 wallet, Sharpe ratio is almost meaningless. The key metric is: **did the agent preserve capital, obey constraints, and produce evidence that its no-trade/trade choices differ from random or naive rules?**

---

## 11. Security and wallet safety

Threat model:

- Private key leakage.
- LLM prompt injection.
- Malicious websites/social posts.
- Malicious token contracts.
- Approval drainers.
- RPC manipulation.
- Fake pool/liquidity data.
- Oracle manipulation.
- Bridge failure.
- Dependency compromise.
- x402/payment replay or context-binding flaws.
- Agent tool-call escalation.

Recent research on AI agents in crypto argues that combining AI agents with financial protocols and immutable smart contracts introduces underexplored security risks. The x402 ecosystem has already attracted security papers identifying replay, context-binding, authorization, atomicity, and metadata-leakage issues.

Hard rules:

- LLM never sees seed phrases or private keys.
- LLM never signs.
- LLM proposes; deterministic engine validates.
- Signer enforces policy even if model is compromised.
- Default action is no-trade.
- Unknown contract means block.
- Unlimited approval means block.
- Bridge means manual review.
- New token means manual review.
- Failed simulation means block.
- High slippage means block.
- Suspicious provenance means block.
- Kill switch must be outside the agent.

---

## 12. Legal/regulatory boundaries

Private own-wallet trading is materially different from managing other people’s money, pooling assets, copy-trading for compensation, or publishing personalized recommendations. The risk profile changes when the system gives advice, trades user funds, has discretionary authority, pools capital, receives performance fees, issues a token, or routes user transactions.

In the U.S., an investment adviser is generally a person or firm that, for compensation, is in the business of providing advice or reports about securities. SEC/CFTC crypto interpretations, FinCEN convertible virtual currency guidance, OFAC virtual-currency sanctions guidance, and IRS digital-asset tax pages define important boundaries between private own-wallet experimentation and public financial products.

Before public launch, legal review should cover investment-adviser status, broker/dealer or CTA/CPO issues, custody, MSB/KYC/AML, sanctions screening, tax reporting, consumer protection, data licensing, exchange terms, marketing claims, and market-manipulation controls.

Marketing should avoid: guaranteed returns, “risk-free,” “AI alpha,” “beats the market,” “copy our profitable wallet,” “automated investment adviser,” or anything implying licensed fiduciary status without actually having it.

---

## 13. Build paths

| Path | First artifact | First dataset | First strategy | First guardrail | What not to build first |
|---|---|---|---|---|---|
| A. $20 private wallet | Local agent + logbook | One DEX on Base | No-trade filter + tiny swap | Separate wallet, $1/trade cap | MEV/sniping |
| B. Paper/backtest engine | Simulator | DEX swaps + gas | Stablecoin/liquidity risk | No lookahead | Live trading |
| C. Private wallet agent | Policy-gated signer | Pool + wallet graph | Paraconsistent rebalancer | Session key cap | Bridges/leverage |
| D. Non-custodial app | UI + policy engine | User wallet data | Recommendations only | Manual signing | Discretionary custody |
| E. Signal/API product | Alerts API | On-chain topology features | Risk/contradiction alerts | Disclaimers/data rights | Personalized advice |
| F. Yield optimizer | Vault risk monitor | Protocol TVL/yields | Allocation/risk scoring | Protocol allowlist | Pooled funds |
| G. Research lab | Reproducible notebooks | Multi-chain graph store | Topology/logic signals | Audit trail | Product claims |
| H. Tokenized validation system | Claim registry | Provenance graph | Market-state claims | Anti-manipulation design | Project token hype |

Most proprietary value lies in the **state representation, feature construction, backtest corpus, and policy engine**, not in a generic trading UI.

---

## 14. Worked examples

### Example A: $20 autonomous wallet experiment

- Chain: Base.
- Wallet: fresh smart account or hot wallet with only $20.
- Assets: USDC and WETH only.
- Max trade: $1.
- Daily loss cap: $2.
- Daily gas cap: $0.25.
- Slippage cap: 0.5%.
- Contracts: one allowlisted router.
- Agent action: propose swap or no-trade.
- Human signing: required for first 100 live trades.
- Logs: observation, state vector, evidence, contradiction, decision, simulated transaction, actual result.

The goal is not profit. The goal is to test whether the agent can obey constraints and generate auditable decisions.

### Example B: Sheaf obstruction signal

Local facts:

- Pool A says token X is up 8%.
- Pool B has thin liquidity and 4% slippage for tiny size.
- Wallet graph shows insider wallets distributing.
- Social graph says “major listing soon.”
- CEX price does not confirm.

The local sections do not glue. The obstruction is not “bearish” generically; it is: **price/social support fails to glue with liquidity/provenance/wallet-flow support**. Action: no-trade or manual review.

### Example C: Paraconsistent token-state model

Token X:

- Bullish support: smart-wallet accumulation, rising volume.
- Bearish refutation: deployer wallet moving tokens to exchange.
- Uncertainty: social claim unverified.
- Liquidity: sufficient for $20, fragile for $2,000.
- Execution risk: moderate.

State: high support, high refutation, moderate liquidity, high provenance conflict.  
Decision: no autonomous buy. Permit alert: “contested-high-energy token; wait for contradiction resolution.”

### Example D: Linear risk-budget execution

Resources:

- $20 capital.
- $1 per trade.
- $2 daily loss.
- 3 fresh evidence tokens.
- 1 signing authority token.
- 0 bridge authority.
- 0 leverage authority.

A trade consumes one evidence token, one risk token, gas budget, and signing authority. If the same wallet-flow signal already justified a prior buy, it cannot be reused to justify another buy unless refreshed. This prevents compounding on stale evidence.

### Example E: Rough-path liquidity trajectory

Construct an irregular path:

```math
X_t = (\text{price}, \text{volume}, \text{active liquidity}, \text{gas}, \text{LP net adds}, \text{wallet inflow})
```

Compute truncated signatures over rolling windows. Compare paths:

- Healthy accumulation: liquidity adds precede price rise.
- Fragile pump: price/volume rise before liquidity, then LP withdrawal.
- Toxic flow: wallet inflows followed by exchange deposits.

Execution: only trade when signature class is “accumulation with durable liquidity,” not “fragile pump.”

---

## 15. Strategic recommendation

**Strongest mathematical angle:** sheaf/paraconsistent market-state representation plus linear-logic execution constraints.

**Most realistic first private experiment:** Base-only $20 wallet, USDC/WETH, paper trading first, then manually signed tiny swaps, strict caps.

**Highest-upside research direction:** topology of wallet-flow/liquidity/provenance contradictions. This is more differentiated than another RL trader.

**Most feasible alpha hypothesis:** contradiction between social/narrative claims and on-chain wallet/liquidity flows, filtered by liquidity topology and execution cost.

**Safest architecture:** isolated wallet; smart-account or Safe-style spending module; LLM proposes; deterministic policy validates; human signs initially; session key only after long dry-run; kill switch outside the agent.

**First dataset:** one chain’s DEX swaps, pool liquidity snapshots, gas, token metadata, wallet clusters, and protocol events. Add social/news only after the on-chain backtest is honest.

**First backtest:** no-trade/trade classifier for stablecoin/liquidity-fragility and token-risk avoidance, including dead tokens and gas/slippage.

**First chain:** Base or another low-fee EVM L2. Avoid Ethereum mainnet for $20 experiments.

**First strategy to exclude:** MEV/searcher arbitrage, token sniping, bridges, leverage, oracle-lag exploitation.

**First monetizable product if research works:** an on-chain contradiction/risk API: “this token/pool/narrative fails to glue because wallet flow, liquidity, and provenance disagree.”

**What remains private:** alpha features, obstruction taxonomy, wallet-cluster heuristics, update weights, execution thresholds.

**What can be published:** formal market-state calculus, safety architecture, backtesting methodology, non-sensitive examples.

---

## 16. Open questions

1. Can sheaf obstruction produce predictive value after gas, slippage, and delayed execution?
2. Which contradictions are alpha and which are merely noise?
3. Can wallet clustering be good enough for small-token regimes?
4. Does persistent homology detect regime change earlier than simpler graph statistics?
5. How should paraconsistent states be calibrated without collapsing into weighted scores?
6. What is the right lattice for support/refutation/liquidity/provenance?
7. Can linear logic be implemented as a practical policy DSL?
8. How much social/news data is useful before adversarial noise dominates?
9. How should MEV/sandwich risk be simulated for small swaps?
10. What legal posture is safe for a public product that gives signals but does not custody funds?
11. How should agentic-wallet payment systems handle replay, request binding, and atomic settlement?
12. Can a private agent learn without overfitting to short crypto regimes?

---

## 17. Annotated bibliography

The following are source categories and representative references to use when expanding this memo into a longer formal paper.

### Agentic wallets and agent payment systems

- Coinbase AgentKit: agent wallet actions and framework integrations.  
  <https://github.com/coinbase/agentkit>
- Coinbase Agentic Wallet / x402 ecosystem: agent-native stablecoin payments and autonomous wallet infrastructure.  
  <https://www.coinbase.com/developer-platform>
- x402 security research: replay, context-binding, payment metadata, authorization, and atomicity risks.  
  <https://arxiv.org/>

### Smart-account and wallet guardrails

- Safe modules and spending limits: permissioned smart-account guardrails.  
  <https://docs.safe.global/>
- ERC-4337 account abstraction.  
  <https://eips.ethereum.org/EIPS/eip-4337>
- EIP-7702 EOA delegation.  
  <https://eips.ethereum.org/EIPS/eip-7702>

### AMMs, DeFi market structure, and MEV

- Uniswap documentation on AMMs, pools, concentrated liquidity, and v4 architecture.  
  <https://docs.uniswap.org/>
- Flashbots MEV research and infrastructure.  
  <https://www.flashbots.net/>
- Mean-field game models of Uniswap v3 LPs and MEV/JIT liquidity.  
  <https://arxiv.org/>

### Mathematical finance

- Rough paths and signature methods for optimal execution.  
  <https://epubs.siam.org/doi/10.1137/19M1259778>
- Wasserstein distributionally robust optimization.  
  <https://arxiv.org/pdf/1908.08729>
- Reinforcement learning in finance surveys.  
  <https://arxiv.org/>
- Deep hedging and risk-aware stochastic control.  
  <https://arxiv.org/>

### Topology, sheaves, and data fusion

- Michael Robinson, sheaves for data fusion.  
  <https://arxiv.org/abs/1603.01446>
- Sheaf-theoretic uncertainty and consistency over relational/topological spaces.  
  <https://arxiv.org/>
- Topological data analysis and persistent homology in finance.  
  <https://arxiv.org/>

### Logic

- Stanford Encyclopedia of Philosophy: paraconsistent logic.  
  <https://plato.stanford.edu/entries/logic-paraconsistent/>
- Stanford Encyclopedia of Philosophy: linear logic.  
  <https://plato.stanford.edu/entries/logic-linear/>

### On-chain analytics data

- Nansen: wallet labels and smart-money analytics.  
  <https://www.nansen.ai/>
- Dune: SQL/API access to on-chain datasets.  
  <https://dune.com/>
- DeFiLlama: TVL, fees, volumes, stablecoins, yields, protocol data.  
  <https://defillama.com/>

### Regulation and compliance

- SEC investment-adviser guidance.  
  <https://www.sec.gov/>
- SEC/CFTC crypto-asset interpretations and guidance.  
  <https://www.sec.gov/>
  <https://www.cftc.gov/>
- FinCEN convertible virtual currency guidance.  
  <https://www.fincen.gov/>
- OFAC sanctions compliance guidance for virtual currency.  
  <https://ofac.treasury.gov/>
- IRS digital asset tax information.  
  <https://www.irs.gov/filing/digital-assets>

## Earlier material

```math
X_t = (\text{price}, \text{volume}, \text{potential liquidity}, \text{gas}, \text{LP net adds}, \text{wallet inflow})
```
