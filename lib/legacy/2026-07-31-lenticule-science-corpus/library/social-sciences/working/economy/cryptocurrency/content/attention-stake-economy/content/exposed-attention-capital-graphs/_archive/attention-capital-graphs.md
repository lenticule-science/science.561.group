---
title: Exposed Attention-Capital Graphs
description: A graph-intelligence stack for social-financial networks where attention, reputation, governance, and capital are coupled, exposed flows — using Hive as the central case because accounts, posts, votes, curation rewards, stake, Resource Credits, communities, proposals, and account histories are public. Models the network as a site of local contexts carrying fibers of account/post/community state, reads under-rewarded work and capital/legitimacy mismatch as priced sheaf obstructions, separates attention from endorsement from reward from quality from governance power, and proposes a curation-alpha discovery package with paraconsistent state vectors, conservative wallet/key policy, backtesting without lookahead, and aggregate-only public dashboards to avoid harassment.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["attention-capital-graph", "social-financial-network", "hive", "sheaf-obstruction", "persistent-homology", "curation-alpha", "under-recognition", "paraconsistent-state", "reward-flow-topology", "whale-dependence", "graph-intelligence", "automation-audit"]
---

# Exposed Attention-Capital Graphs: Topological and Fiber-Algebraic Analysis of Social-Financial Media Networks

## Abstract

The central thesis is substantially viable: exposed social-financial networks make it possible to model attention, reputation, governance, and capital as coupled flows rather than as separate “engagement” dashboards. In Hive-like systems, the primitives are unusually analyzable because accounts, posts, comments, votes, rewards, curation rewards, balances, vesting/stake, Resource Credits, communities, proposals, witness votes, and account histories are exposed through public chain/API surfaces.

The practical result is not generic “influencer analytics.” It is a graph intelligence stack for discovering under-recognized value, measuring reward-flow topology, auditing automation, improving safe voting and wallet policy, and building agent-readable media infrastructure.

## 1. Exposed social networks as social-financial topology

An exposed social-financial network is a temporal typed graph, or better, a **site of local contexts** over which many forms of state are attached. Nodes include accounts, posts, comments, tags, communities, frontends, wallets, proposals, witnesses, contracts, storage nodes, APIs, and agents. Edges include follows, replies, reblogs, votes, downvotes, transfers, delegations, beneficiary assignments, moderation events, governance votes, curation-trail actions, and API-mediated recommendations.

The base space is not simply “all users.” It can be any cover of the system by contexts: communities, tags, language groups, time windows, author neighborhoods, wallet neighborhoods, curation trails, governance blocs, frontend feeds, or topic clusters. An open set is a region where observations are locally comparable: for example, “Hive posts in community C during week W with voters V,” or “accounts participating in proposal voting and witness voting during month M.”

A section over such an open set is a locally coherent observation: reward distribution, account reputation, vote timing, author quality, moderation state, wallet flow, bot-likeness, or governance participation. A restriction map asks what survives when one narrows from the whole network to a community, from an account history to one post, or from a global reward graph to one payout window. A gluing problem asks whether local observations agree globally. When they do not, the failure is meaningful: under-rewarded work, whale dependence, hidden voting blocs, reputation/capital mismatch, frontend-specific meaning, or automation-driven topology.

## 2. Why Hive-like networks are analytically special

Hive is analytically special because social action and financial action are both visible enough to join. The developer portal exposes APIs for account history, accounts, blocks, database, bridge, follow, RC, reputation, rewards, market history, wallet bridge, and witness data; the same docs show methods for account histories and virtual operations, including reward-related virtual operations. Source: Hive Developer Portal, <https://developers.hive.io/>.

Hive’s glossary explicitly distinguishes posting, active, and owner keys; defines votes as upvotes/downvotes used by the blockchain to determine reward shares; defines the daily reward pool; and defines curation rewards as a curator’s portion of the rewards allocated to curators. Source: Hive Glossary, <https://developers.hive.io/glossary/>. This matters because a Hive vote is not merely a like. It is a reputational, attentional, and economic event.

The account API surface includes authorities, posting metadata, proxies, voting and downvote manabars, balances, HBD balances, vesting shares, delegations, post voting power, and reward balances. The bridge API exposes community listing, community metadata, subscriber counts, pending reward aggregates, admins, team roles, and observer-context fields. The database API exposes proposal listing and proposal vote ordering, making DHF/governance analysis tractable. Source: Hive API Definitions, <https://developers.hive.io/apidefinitions/>.

A crucial engineering note: Hive APIs evolve. Some older endpoints are now obsolete or replaced, such as old content and tag endpoints, so an indexer should bind to current bridge/database/condenser successors rather than freezing historical assumptions.

## 3. Fiber algebra of social media networks

Define a base category **C** whose objects are contexts: account neighborhoods, posts, communities, tags, time intervals, frontends, governance episodes, and wallet neighborhoods. A fiber over each context contains local state.

Account fiber:

```text
AccountFiber(a,t) = identity, authorities, balances, stake, voting mana, downvote mana, RC, posts, comments, votes given, votes received, curation rewards, author rewards, follows, communities, governance votes, delegations, automation traces, moderation history, risk state.
```

Post fiber:

```text
PostFiber(p,t) = author, body hash/content, metadata, tags, community, age, votes, voters, rshares, pending payout, final payout, beneficiaries, comments, reblogs, provenance, edits, source links, quality signals, originality signals, risk signals.
```

Community fiber:

```text
CommunityFiber(c,t) = membership, admins/mods, posts, active authors, newcomer participation, reward distribution, whale dependence, moderation events, topic momentum, conflict, bot density, decay risk.
```

Restriction maps answer questions like: what is lost when account history is restricted to one post? Voting history, wallet trajectory, and governance record are lost. What is preserved across frontends? On-chain operations, canonical author/permlink identity, reward state, and account authorities are more stable than feed ranking or display context. What is lost when moving from global Hive to one community? Cross-community capital flow, external reputation, and broader governance power may disappear.

Obstruction classes are the useful part. A high-quality post with low reward is an attention/reward obstruction. A high-stake account with low trust is a capital/legitimacy obstruction. A healthy comment network with poor payout is a community-capital obstruction. A highly rewarded post with little reading/comment evidence is an attention-authenticity obstruction. Cellular sheaf theory is a natural language for this because it studies local data, restriction, consistency, and global sections; spectral cellular sheaf work extends graph Laplacian ideas to sheaves, and recent work generalizes these ideas to networked data and consensus settings.

## 4. Topological social graph analysis

Topological terms translate cleanly:

| Topological term | Social-financial interpretation |
|---|---|
| Open set | A locally meaningful context: community, tag, time window, trail, frontend, governance bloc |
| Closure | The downstream spread of a post, author, meme, or topic through replies, reblogs, votes, links |
| Boundary | Accounts/posts that connect but do not fully belong to adjacent communities |
| Interior | Stable core of recurring authors, voters, commenters, moderators, and shared norms |
| Bridge | Account or post connecting otherwise weakly connected communities |
| Cut | Removal of a whale, frontend, trail, or moderator that disconnects attention/capital flow |
| Hole | Missing circulation between communities that should be connected by topic or value |
| Filtration | Network viewed through increasing thresholds: time, reward, stake, trust, reply depth, similarity |
| Persistence | Features that survive across thresholds rather than appearing as one-off spikes |

Persistent homology is useful because it tracks topological features across scales; durable features are less likely to be artifacts of a single arbitrary threshold. In social-financial graphs, persistent features may indicate stable communities, durable bridges, reward loops, bot clusters, capital migration paths, or governance blocs. These are not automatic moral judgments. They are candidate structures for interpretation.

## 5. Social media mathematics

The relevant methods are graph theory, temporal graphs, multilayer networks, hypergraphs, community detection, centrality, diffusion, recommender systems, graph embeddings, causal inference, bot/Sybil detection, moderation modeling, and platform governance analysis.

Ordinary social metrics fail in stake-weighted systems. Degree centrality can confuse spam with influence. Reward can confuse quality with stake access. Engagement can confuse controversy with value. Centrality can confuse legitimacy with structural position. In Hive-like systems, the core modeling separation should be:

```text
attention ≠ endorsement ≠ reward ≠ quality ≠ governance power ≠ capital allocation.
```

Temporal and multilayer network methods matter because a social-financial network evolves at the same time as its diffusion and reward processes. Recommender-system work already uses user-item and user-user graph structure, and graph neural network approaches to social recommendation show why social relations and interaction graphs are standard inputs for recommendation. Influence maximization literature is relevant but must be corrected for stake, automation, and economic incentive.

## 6. Financial-network mathematics

A stake-weighted vote is a small capital-allocation act. A reward pool is an endogenous yield-distribution mechanism. A delegation is temporary transfer of influence. A curation trail is a portfolio strategy over attention. A DHF vote is capital governance. A downvote is negative allocation plus social risk.

Relevant financial mathematics includes capital-flow networks, systemic risk, market microstructure, optimal transport, stochastic control, mean-field games, mechanism design, portfolio/risk control, and reflexivity. Financial network research studies how visible and invisible linkages propagate risk and centrality; that vocabulary transfers to reward pools, voting trails, delegations, and governance concentration.

Optimal transport can model movement of attention or reward mass between communities. Stochastic control can model when to vote, when to conserve voting mana, when to power up/down, when to hold HBD, and when to avoid social risk. Mean-field games are apt for large populations of curators, bots, whales, and authors adapting to aggregate reward conditions.

The key financial warning: protocol emissions are not automatically “real yield.” Yield should be decomposed into token emissions, price exposure, opportunity cost, reputational cost, downvote risk, liquidity risk, and governance risk.

## 7. Attention-stake economies

An attention-stake economy is a social system where visibility, reputation, and economic payout are coupled through stake, tokens, voting, ranking, or tipping. Hive is the central case because votes route reward-pool claims; curation rewards convert discovery into economic return; downvotes introduce negative stake-weighted judgment; and governance votes route chain-level authority.

The difference between social actions is essential:

| Action | Meaning |
|---|---|
| Like | Lightweight attention or approval |
| Vote | Attention plus stake-weighted reward signal |
| Tip | Direct transfer |
| Curation vote | Discovery plus possible return |
| Downvote | Negative reward/reputation intervention |
| Governance vote | Protocol-level authority allocation |
| Reblog/repost | Distribution without necessarily allocating capital |
| Follow | Future attention routing |

Pathologies appear when these collapse into one signal: whale dependence, reward cartels, trail ossification, paid attention, low-quality high-payout content, anti-newcomer dynamics, retaliation, plagiarism farming, and reputation debt.

## 8. Automation as normal infrastructure

Automation is not exceptional in these networks. It is part of the environment: autovotes, trails, scheduled posts, curation bots, notification bots, anti-abuse bots, ranking algorithms, wallet agents, feed generators, labelers, and AI-assisted publishing.

The correct distinction is not “human good, bot bad.” It is:

| Automation type | Evaluation |
|---|---|
| Transparent curation assistant | Potentially legitimate |
| Rate-limited voting helper | Potentially useful |
| Provenance-aware posting agent | Potentially public-good infrastructure |
| Anti-spam/moderation bot | Necessary but risky |
| Blind autovote cartel | Hierarchy ossification |
| Plagiarism/slop farm | Extractive |
| Sybil swarm | Manipulative |
| Harassment bot | Abusive |
| Wallet bot with active key access | High-risk |

Farcaster’s architecture separates on-chain identity/security actions from off-chain social actions such as posts, follows, and reactions, showing another form of social automation surface. AT Protocol similarly separates repositories, relays, App Views, feed generators, and labelers, making algorithmic choice and moderation services first-class infrastructure. ActivityPub explicitly includes bots and automated processes in its client-to-server model.

## 9. Curation alpha and under-recognized value

Curation alpha is **not** merely profit from voting. It is the ability to identify posts, authors, comments, topics, or communities whose social value is not yet priced by the existing attention/reward graph.

A practical under-recognition model should estimate:

```text
Underreward(p,t) = Quality(p,t) + Novelty(p,t) + Provenance(p,t) + CommunityFit(p,t) + CommentValue(p,t) + AuthorReliability(p,t) - RewardPricedIn(p,t) - Risk(p,t).
```

Good signals include original source work, strong comment quality before payout, early cross-community bridges, author reliability, topic momentum, reward/comment mismatch, low whale exposure, high reader response, and durable follow-on discussion. Bad shortcuts include copying whale votes, chasing pending payout, voting every post by a known author, or using engagement without provenance.

Curation alpha should be measured in four currencies: curator return, reward discovered for authors, durable social value, and reputation after review. A tiny wallet can succeed by finding overlooked posts and comments, not by competing with whales.

## 10. Paraconsistent social states

Do not collapse contradictions too early. A post can be popular and low-quality, high-quality and unrewarded, automated and useful, profitable and reputationally dangerous, controversial and valuable, or human-written and spammy.

Represent support and refutation separately:

```text
PostState = (quality+, quality−, novelty, provenance+, provenance−, engagement, reward, controversy, automation_exposure, author_reliability, community_fit, underrecognition, downvote_risk).
```

```text
AccountState = (stake, reputation, trust+, trust−, influence, originality, reciprocity, governance_weight, automation_level, risk, momentum).
```

```text
CommunityState = (activity, cohesion, reward_flow, newcomer_access, moderation_quality, whale_dependence, automation_level, topic_momentum, conflict, decay_risk).
```

Manual review triggers should include high reward/low provenance, high engagement/high controversy, high automation/high payout, high capital/low legitimacy, plagiarism risk, harassment risk, or governance concentration.

## 11. Linear/resource-sensitive participation

Participation consumes scarce resources: voting mana, downvote mana, RC, stake, wallet liquidity, attention, posting frequency, API quota, moderation labor, trust, reputation, community patience, correction capacity, and key authority.

Hive’s RC API exposes account RC manabars and operation-cost statistics, including per-operation RC costs. Source: Hive API Definitions, <https://developers.hive.io/apidefinitions/>. This makes resource-sensitive logic practical: a vote consumes voting power and RC; a comment consumes RC and attention; a transfer consumes potential authority and financial risk; an automated action consumes social goodwill even if it is technically cheap.

Agent permissions should be modeled linearly:

| Authority | Agent policy |
|---|---|
| Posting key | May vote/comment/post within limits |
| Active key | Never held by autonomous curator; use manual approval or hardware-isolated signer |
| Owner key | Cold storage only |
| RC delegation | Budgeted resource, not infinite API fuel |
| Reputation | Non-renewable at short timescales |
| Community trust | Must be earned and can be depleted |

## 12. Data and index architecture

A Hive-first indexer should collect:

1. Blocks and operations: comments, votes, transfers, delegations, custom_json, witness votes, proposal votes.
2. Virtual operations: author rewards, curation rewards, comment rewards, beneficiary rewards, proposal payments, interest, vesting withdrawals.
3. Account state snapshots: balances, HBD, vesting shares, voting/downvote manabars, delegations, authorities, proxy.
4. Post/comment state: body, metadata, author/permlink, parent links, votes, pending payout, final payout, beneficiaries, edits where visible.
5. Community state: roles, subscribers, admins/mods, moderation actions, community-level pending reward aggregates.
6. Governance state: witnesses, votes, proxies, proposals, proposal votes, DHF flows.
7. Market state: HIVE/HBD prices, internal market, HBD savings/interest events.
8. External provenance: canonical URLs, source links, content hashes, archive status, corrections.

Storage architecture: append-only raw operation lake, normalized relational store, temporal graph store, feature store, snapshot tables, and backtest ledger. Backtests must only use features known before the simulated vote time. Deleted, edited, missing, and external content should be represented as explicit uncertainty, not silently dropped.

Ethical rule: collect public chain data, but expose account-level risk dashboards only with abuse controls. Some analytics should be aggregate-only.

## 13. Metrics and models

Meaningful metrics:

| Metric | Interpretation |
|---|---|
| Reward centrality | Who receives reward flow |
| Curation centrality | Who allocates reward early |
| Bridge score | Who connects communities/topics |
| Whale dependence | Share of reward from top stake accounts |
| Trail dependence | Share of votes from repeated synchronized trails |
| Autovote density | Regularity and automation signature of voting |
| Underreward score | Quality/provenance/comment value minus priced-in reward |
| Overreward score | Reward minus evidence of value |
| Newcomer access | Reward/comment/follow support for newer accounts |
| Community health | Activity, retention, moderation, reward diversity |
| Governance concentration | Stake-weighted concentration across witnesses/proposals |
| Attention velocity | Rate of comment/vote/reblog spread |
| Capital velocity | Rate of reward, transfer, delegation movement |
| Risk score | Plagiarism, spam, retaliation, downvote, wallet exposure |

Misleading metrics include raw follower count, raw vote count, raw pending payout, unweighted engagement, and centrality without context. Metrics that require human review include originality, harassment risk, cultural fit, political sensitivity, plagiarism, and community legitimacy.

## 14. Product and API possibilities

The first viable product is not a public “influencer finder.” It is a **Hive social-financial graph intelligence package** with private curation tooling and public aggregate reports.

Build order:

1. Internal indexer and feature store.
2. Curation recommender for under-recognized posts/comments.
3. Voting assistant with manual review and vote caps.
4. Reward-flow explorer.
5. Community health dashboard.
6. Governance capital map.
7. Agent-readable feed/provenance API.
8. Paid API for aggregate analytics, not harassment-grade account scoring.

Potential endpoints:

```text
/posts/underrecognized
/authors/emerging
/communities/health
/rewards/flow
/votes/trails
/governance/witness-map
/governance/proposals
/wallet/policy-state
/risk/provenance
/backtest/curation-strategy
```

Free public goods: documentation, aggregate community reports, open schema, provenance metadata, safety policy, and maybe a limited public dashboard. Private edge: ranking model, live underreward signals, wallet policy tuning, and backtesting results.

## 15. Node/TypeScript package design

Package name concept: `@attention-capital/hive-graph`.

Modules:

```text
core/
  types.ts
  time.ts
  money.ts
  ids.ts

clients/
  hiveRpcClient.ts
  bridgeClient.ts
  databaseClient.ts
  accountHistoryClient.ts
  rcClient.ts
  marketClient.ts

indexer/
  blockIndexer.ts
  accountHistoryIndexer.ts
  virtualOpsIndexer.ts
  communityIndexer.ts
  governanceIndexer.ts

graph/
  typedGraph.ts
  temporalGraph.ts
  multilayerGraph.ts
  flowGraph.ts

features/
  accountFeatures.ts
  postFeatures.ts
  communityFeatures.ts
  governanceFeatures.ts
  provenanceFeatures.ts
  automationFeatures.ts

topology/
  filtrations.ts
  persistenceAdapters.ts
  sheafModel.ts
  obstructionScores.ts

curation/
  underrewardModel.ts
  recommendationEngine.ts
  manualReviewQueue.ts
  votePolicy.ts

wallet/
  votingManaPolicy.ts
  rcPolicy.ts
  hbdHiveRisk.ts
  keySafety.ts

backtest/
  snapshotReplay.ts
  voteSimulator.ts
  rewardAttribution.ts
  evaluation.ts

api/
  server.ts
  routes.ts
  auth.ts

agents/
  toolSchemas.ts
  actionLogger.ts
  approvalGates.ts
```

Deterministic: index construction, feature timestamps, balance math, vote logs, backtest replay, key policy, audit logs. Model-assisted: quality estimation, topic classification, provenance checks, anomaly triage. Never delegated to an LLM: potential-key signing, owner-key handling, transfers, governance votes, downvotes, blacklists, public accusations, irreversible posting without review.

## 16. Wallet, voting, and posting policy

Safe default policy:

| Action | Automation level |
|---|---|
| Read public data | Automatic |
| Rank candidate posts | Automatic |
| Draft recommendations | Automatic |
| Upvote allowlisted low-risk posts under small cap | Optional automatic |
| Larger votes | Human approval |
| Downvotes | Human approval only |
| Comments | Draft first; human approval unless clearly templated disclosure |
| Transfers | Human approval with active-key isolation |
| Power up/down | Human approval |
| Witness/proposal votes | Human approval |
| Public accusations | Never automatic |

Key policy should follow Hive’s authority split: posting key for posting/voting, active key for transfers/market actions, owner key for changing authorities. Source: Hive Glossary, <https://developers.hive.io/glossary/>. The agent should never hold the owner key and should not hold the potential key. It should disclose automation in profile metadata and/or periodic public reports without publishing every private ranking weight.

Voting policy: cap vote weight, maintain voting-mana floor, avoid reciprocal vote rings, avoid obvious trail copying, support newcomers, prefer posts with provenance, and log every recommendation with reasons. Response to criticism should be correction-first: acknowledge, remove bad automation, publish postmortem when needed.

## 17. Backtesting and evaluation

Backtesting must use historical snapshots with no lookahead bias. For every candidate vote, the system may use only data visible before the vote timestamp: current post state, account history up to that moment, visible votes up to that moment, community context, current wallet state, and current market data.

Evaluate:

| Category | Metrics |
|---|---|
| Curation return | Curation rewards, risk-adjusted return, opportunity cost |
| Discovery | Reward discovered for authors, under-recognized author emergence |
| Social value | Comment quality, follow-on discussion, retention, community acceptance |
| Reputation | Downvote incidence, criticism, manual-review reversals |
| Resource efficiency | Voting mana efficiency, RC efficiency, API cost |
| Capital growth | HP growth, HBD/HIVE exposure, volatility-adjusted return |
| Robustness | Performance vs naive autovote, whale-copy strategy, random baseline |
| Safety | False positives, plagiarism misses, harassment risk, correction rate |

The baseline comparison should include: random vote among active posts, vote top trending, follow a known trail, vote favorite authors, and human-curated sample. A model that only copies whales has no discovery alpha.

## 18. Risks, abuse, and legitimacy

Risks:

| Risk | Control |
|---|---|
| Reward farming | Diversity caps, originality checks, no self-loop amplification |
| Vote trading/cartels | Reciprocity detection, trail-dependence metrics |
| Sybil behavior | Graph structure, account age, funding links, shared metadata |
| Plagiarism/AI slop | Provenance scoring, source checks, manual review |
| Harassment/surveillance | Aggregate public dashboards; restrict account-level risk labels |
| Downvote retaliation | Conservative downvote policy, human approval |
| Governance manipulation | No automatic governance votes |
| Market manipulation | No trading signals from unpublished social analytics |
| Opaque scoring | Explain recommendations without exposing attackable internals |
| Unsafe wallet actions | No active/owner key autonomy |

Sybil and bot detection literature shows why purely automated labels are risky: Sybils adapt, and detection often requires structural, behavioral, and human-review signals.

Legitimacy comes from restraint. The system should help discover valuable work, not become a private extraction machine.

## 19. Comparison across networks

| Network | Exposed action graph | Capital/wallet exposure | Governance exposure | Best use |
|---|---:|---:|---:|---|
| Hive | High | High | High | First target for attention-capital graph intelligence |
| Steem | High historically/similar lineage | High | High | Comparative fork/governance study |
| Farcaster | Medium-high social graph; hybrid on/offchain | Medium | Protocol/community governance | Identity-linked social app analysis |
| Lens | Onchain social primitives, Lens Chain, storage nodes | Medium-high | Ecosystem governance | SocialFi app and onchain primitive analysis |
| DeSo | High; social data on chain | High | Medium | Creator coins, tips, social token experiments |
| AT Protocol/Bluesky | High public social records/firehose; no native wallet | Low | Moderation/feed governance | Feed, labeler, public-repo topology |
| ActivityPub/Mastodon | Federated inbox/outbox social graph | Low | Instance governance | Federation topology, moderation boundaries |
| Reddit | Posts/comments/votes/subreddits; API constraints | Low | Subreddit moderation | Community health, moderation, attention flows |
| Discord | Rich community data but access-limited and privacy-sensitive | Low | Server governance | Private community dashboards, not broad scraping |
| Substack/Paragraph/Mirror | Publishing, subscriptions, collects/support | Medium depending platform | Low-medium | Agentic media/provenance publishing |
| YouTube/Twitch/X | Rich attention but platform-controlled APIs | Low-medium | Low | Public attention research, limited capital coupling |

Farcaster’s docs confirm hybrid on-chain identity and off-chain social data. Lens describes Lens Chain, Social Protocol, storage nodes, and onchain social primitives. AT Protocol exposes signed repositories, relays/firehose, App Views, feed generators, and labelers. ActivityPub defines actors, inboxes, outboxes, client-to-server and server-to-server federation. DeSo positions itself as a public blockchain for social content, profiles, posts, follows, creator monetization, and open feed construction. Paragraph is more publishing/audience/support infrastructure than a full exposed social-financial graph.

## 20. Worked examples

### A. Hive curation intelligence system

Input: new posts, account histories, votes so far, community context, author reliability, provenance links, pending payout, comment quality.
Output: ranked under-recognized posts with reason codes.

Reason example: “High provenance, strong early comments, low pending payout, author has reliable history, community fit high, no plagiarism signal, low whale exposure.”

### B. Intelligent Hive voting wallet

Policy engine tracks voting mana, downvote mana, RC, HP, HBD, vote caps, community allowlists, blocklists, and review thresholds. It may auto-vote low-risk small recommendations but queues larger votes and all downvotes.

### C. Community health dashboard

Metrics: active authors, active commenters, newcomer retention, reward concentration, whale dependence, mod actions, autovote density, topic momentum, cross-community bridges, decay risk.

### D. Curation guild

A guild publishes its curation principles, logs aggregate performance, rotates reviewers, discloses automation, evaluates false positives, and shares some reward with discovery authors or community projects.

### E. Reward-flow topology

Construct a directed weighted graph from stake accounts to posts/authors/curators/beneficiaries. Detect reward loops, bridges, whale bottlenecks, trail dependence, and communities receiving less capital than their activity suggests.

### F. Agentic media account

A semi-autonomous account publishes research summaries with source links, canonical URLs, content hashes, provenance notes, correction policy, and clear automation disclosure. Human review is required before posting.

### G. Governance capital map

Map witness votes, proxies, proposal votes, DHF payments, stake concentration, proposal recipients, and social legitimacy signals. Highlight concentration and conflicts without doxxing or harassment.

### H. Cross-network graph intelligence

Compare Hive reward topology with AT Protocol feed/labeler topology, Farcaster identity/social graph, Lens onchain primitives, and ActivityPub federation boundaries. The point is to ask which network exposes which part of the attention-capital relation.

## 21. Strategic recommendation

This is a viable project. Hive is the best first network because it exposes the richest joined social-financial primitive set: posts, comments, votes, rewards, stake, wallet state, communities, RC, account history, and governance.

First package: `@attention-capital/hive-graph`.

First data to index: posts/comments, votes, account states, communities, virtual reward operations, delegations, proposals, witness votes, and market snapshots.

First private model: under-recognized post/comment discovery with conservative risk filters.

First public reports: aggregate community health, reward concentration, automation/trail topology, and governance capital maps.

First API endpoints: under-recognized posts, community health, reward flow, vote-trail dependence, governance concentration, and provenance risk.

Wallet strategy: start tiny, vote manually or semi-automatically, publish useful research, prioritize under-recognized authors, avoid vote trading, avoid aggressive downvotes, and maintain transparent logs.

Monetization: paid dashboards for communities and curators, API subscriptions for aggregate analytics, custom reports for frontends/guilds, grant/proposal funding for public-good infrastructure, and eventually wallet tooling. Do not sell harassment-grade account scoring.

## 22. Open questions

Mathematical:

- What is the right Grothendieck topology for social-financial contexts?
- Which obstruction classes are stable under frontend changes?
- Can persistent homology distinguish meaningful communities from synchronized bot clusters?
- How should paraconsistent social states be composed?

Technical:

- Which Hive endpoints are sufficient without running a full custom node?
- How should Hivemind/bridge data be reconciled with raw chain operations?
- What graph database schema best handles temporal typed edges?
- How should edited/deleted/external content be represented?

Economic:

- What is real curation alpha after token volatility and opportunity cost?
- When does curation become extraction?
- Can small wallets reliably discover value before whales?
- How does trail dependence affect long-run reward diversity?

Governance:

- Which metrics should be public?
- How can dashboards avoid becoming retaliation tools?
- Can DHF-style funding support public graph intelligence without politicizing the index?
- What disclosure norms make agentic curation legitimate?

Strategic:

- Should the first public product be a dashboard, API, report series, or wallet assistant?
- Which communities would pay?
- Which features should remain private to preserve edge?
- How should the project’s own account build trust before monetizing?

## 23. Annotated bibliography

- **Hive Developer Portal.** Core source for Hive APIs, account history, RC, reputation, bridge, database, witness, reward, wallet, and operation surfaces. Essential for implementation. <https://developers.hive.io/>
- **Hive glossary and API definitions.** Defines posting/active/owner keys, votes, reward pool, curation rewards, account state, RC, community APIs, proposals, and virtual reward operations. <https://developers.hive.io/glossary/> and <https://developers.hive.io/apidefinitions/>
- **Farcaster docs.** Confirms hybrid architecture: onchain identity/security actions and offchain social actions through Snapchain. Useful comparison for identity/action separation. <https://docs.farcaster.xyz/learn/architecture/overview>
- **Lens docs.** Describes Lens Chain, Social Protocol, storage nodes, and onchain social primitives for SocialFi systems. Useful comparison for onchain social affordances. <https://lens.xyz/docs>
- **AT Protocol docs.** Defines DIDs, signed repositories, PDSes, relays, App Views, feed generators, labelers, algorithmic choice, and speech/reach separation. Core comparison for API-rich non-wallet social topology. <https://atproto.com/guides/overview>
- **ActivityPub W3C Recommendation.** Defines actors, inboxes, outboxes, client-to-server and server-to-server protocols, and ActivityStreams vocabulary. Core source for federated social graph modeling. <https://www.w3.org/TR/activitypub/>
- **DeSo docs.** Describes a blockchain built for social content, creator monetization, open data pools, public profiles/posts/follows, and feed construction. Useful comparison for social-financial public ledgers. <https://docs.deso.org/>
- **Hansen and Ghrist, “Toward a Spectral Theory of Cellular Sheaves.”** Mathematical foundation for cellular sheaves, sheaf Laplacians, and graph-like local-to-global analysis. <https://arxiv.org/abs/1808.01513>
- **Ghrist and Riess, “Cellular Sheaves of Lattices and the Tarski Laplacian.”** Useful for non-vector-valued state, consensus, and distributed consistency. <https://arxiv.org/abs/2007.04099>
- **Persistent homology overview.** Useful for filtrations, persistent features, robustness across thresholds, and topological signal extraction. <https://en.wikipedia.org/wiki/Persistent_homology>
- **Sharma et al., “A Survey of Graph Neural Networks for Social Recommender Systems.”** Relevant for graph-based social recommendation using user-user and user-item relations. <https://arxiv.org/abs/2212.04481>
- **Wu et al., “Graph Neural Networks in Recommender Systems.”** Broader survey of GNN recommender architectures and challenges. <https://arxiv.org/abs/2011.02260>
- **Li et al., “Influence Maximization in Social Networks: A Survey.”** Useful but must be adapted because stake-weighted reward systems are not ordinary influence networks. <https://arxiv.org/abs/2309.04668>
- **Jackson and Pernoud, “Systemic Risk in Financial Networks: A Survey.”** Provides financial network language for contagion, centrality, and systemic risk. <https://arxiv.org/abs/2012.12702>
- **Caccioli, Barucca, and Kobayashi, “Network models of financial systemic risk.”** Useful for risk propagation, overlapping exposures, and financial graph modeling. <https://arxiv.org/abs/1710.11512>
- **Mean-field game theory overview.** Useful for modeling many curators, bots, whales, and authors responding to aggregate reward incentives. <https://en.wikipedia.org/wiki/Mean-field_game_theory>
- **SybilBlind and social bot detection sources.** Useful for distinguishing automation, Sybil behavior, spam, and coordinated manipulation without assuming all automation is illegitimate. <https://arxiv.org/abs/1806.04853>
